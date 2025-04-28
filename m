Return-Path: <linux-media+bounces-31232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684AA9F851
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 20:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FE7D1A85EF3
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5596827EC99;
	Mon, 28 Apr 2025 18:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disterhof.eu header.i=@disterhof.eu header.b="dbhdAvtE"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37B1B3934;
	Mon, 28 Apr 2025 18:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864224; cv=none; b=Hcx2XDu61oER/LuOZ4NaLPuneJh7pvFn5J1oIyH1vR4BX6sWFeKGCFKxCxrje+XZIb40QwOcJ1oGZAGkKUg2OUd+bqm1m1XeZ6P8GJzacEHnyCe40KiCmIq9xCNIO0iJzuyAmNjSYB2iIkQJjiKAxHzlK2mE0fcdWZ24xmCaGwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864224; c=relaxed/simple;
	bh=3eJ7+1F6vKndxynrgWcSaZggI3ByYlMFxo9DcAdV4jQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pBVvYwcepGRADjGi08o94sMs6qmRosrunfaXiOTKhntPITNpsJNSJdjXqpuX4aWHK2LFTZyBCEOD4IPr/sObM242S0hDCPWxQSOFp/iKxvhVP7/zuMJE8Nw7243/G115xJQgZkJXudnHkY5eXjsExKaP9zlYQAy3NzIYy9DajR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=disterhof.eu; spf=pass smtp.mailfrom=disterhof.eu; dkim=pass (2048-bit key) header.d=disterhof.eu header.i=@disterhof.eu header.b=dbhdAvtE; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=disterhof.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disterhof.eu
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZmWqm3ql7z9tX4;
	Mon, 28 Apr 2025 20:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=disterhof.eu;
	s=MBO0001; t=1745864212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=RBU3Rxa/SeWrdolSbblILy8+ZXtT8fErI4neuezE2pw=;
	b=dbhdAvtEN4/lllBI4NhtqRkilnpOwGXWQx00tKIgBhRU15ZirnWByvf7M/Sxi8WQSKBziA
	Wi7EkOOc7gJNGoom2bssEtU8YxoN0is5IYMMUojGswVvi+J3uEc2wZcPCKa6++K9crIYqE
	Oqd7bRt69J64K8LDapvQYoeLCIVC2NghIplMbn0QawrYvJW/vwjaTPohysjS/Z2GB/Un5L
	hVCbKyTs18f5XpkxMzC/IOl9t+pxH8A03ClNyXtCPtbMEjsy1uuK3GT2FaVg7IsS6iHsOU
	IpxhmhiZYEaS44eBVOUbIVQk/JkUMUqWdGAwshCh86BXxRuuPJrKLjLTkM3NfA==
Message-ID: <dd4693d2-3ecb-4081-8227-35e4e89ec7d4@disterhof.eu>
Date: Mon, 28 Apr 2025 20:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil@xs4all.nl
From: Ludwig Disterhof <ludwig@disterhof.eu>
Autocrypt: addr=ludwig@disterhof.eu; keydata=
 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
Subject: [PATCH] media: usbtv: Lock resolution while streaming
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When an program is streaming (ffplay) and another program (qv4l2)
changes the TV standard from NTSC to PAL, the kernel crashes due to trying
to copy to unmapped memory.

Changing from NTSC to PAL increases the resolution in the usbtv struct,
but the video plane buffer isn't adjusted, so it overflows.

Fixes: 0e0fe3958fdd13d ("[media] usbtv: Add support for PAL video source")

Signed-off-by: Ludwig Disterhof <ludwig@disterhof.eu>
---
 drivers/media/usb/usbtv/usbtv-video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index be22a9697197..965a8ae82afe 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -73,6 +73,10 @@ static int usbtv_configure_for_norm(struct usbtv *usbtv, v4l2_std_id norm)
 	}
 
 	if (params) {
+		if (vb2_is_streaming(&usbtv->vb2q) &&
+		    (usbtv->width != params->cap_width ||
+		     usbtv->height != params->cap_height))
+			return -EBUSY;
 		usbtv->width = params->cap_width;
 		usbtv->height = params->cap_height;
 		usbtv->n_chunks = usbtv->width * usbtv->height
-- 
2.43.0

