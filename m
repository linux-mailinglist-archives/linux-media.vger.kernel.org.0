Return-Path: <linux-media+bounces-13774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0290FE09
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E26F1F22FB4
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 07:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010024AEF7;
	Thu, 20 Jun 2024 07:52:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042A1803A
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718869948; cv=none; b=Tl+WBUnZyNGQdD4wbTikCe275lo+c7NfO8ldS1RJl992S+LV0iXJG4qtNdBeJ0+oY3jiWlIV7649k2ZdYkCh/c80CGleoTCQrw20UqHhqgPvUvVxq99a+cqEEqVgI/mviYlonAq2FXyXpQHTrJZ27LMNarO71o6Epg9kXCWakuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718869948; c=relaxed/simple;
	bh=PWyRPgf6Y5Z7SNcYS1hymgV3b6RGu6+PK/l9Fq2F0Co=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ZefAWjz0IS38VilIaa/p0yG3gVve9Aeue3Ne4Dq2zpV2blfGq8Z97p4iex2miA3qQYO5oYnIuCu+KsWmgegKy80GmMZ3+Ne7OvoZaszKxlZLxwEKRK+hjJT+QNcJYbviaum7CmbVmdhliKrzAo36pASUO8EtAEP9TvgA6bS4mdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25FBC2BD10;
	Thu, 20 Jun 2024 07:52:27 +0000 (UTC)
Message-ID: <c3bc93d1-6b44-405f-878d-309e0bc36714@xs4all.nl>
Date: Thu, 20 Jun 2024 09:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: b2c2: flexcop-usb: fix flexcop_usb_memory_req
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

smatch generated this warning:

drivers/media/usb/b2c2/flexcop-usb.c:199 flexcop_usb_memory_req() warn: iterator 'i' not incremented

and indeed the function is not using i or updating buf.

The reason this always worked is that this function is called to write just 6 bytes
(a MAC address) to the USB device, and so in practice there is only a single chunk
written. If we ever would need to write more than one chunk, this function would
fail since each chunk would read from or write to the same buf address.

Rewrite the function to properly handle this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 90f1aea99dac..eff3756cb8ec 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -196,7 +196,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 	default:
 		return -EINVAL;
 	}
-	for (i = 0; i < len;) {
+	while (len) {
 		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
@@ -206,11 +206,12 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 			page_start + (addr / V8_MEMORY_PAGE_SIZE),
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended),
-			&buf[i], pagechunk);
+			buf, pagechunk);

 		if (ret < 0)
 			return ret;
 		addr += pagechunk;
+		buf += pagechunk;
 		len -= pagechunk;
 	}
 	return 0;

