Return-Path: <linux-media+bounces-15073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2747933A81
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 11:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59CB61F2182F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2607917E8EE;
	Wed, 17 Jul 2024 09:58:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE419A
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210329; cv=none; b=X+lFajtT8uzLzVQlnBf4dMZRGVS15SRovEXMSrkf+lr68qNgotRx5vG44hLMVwVHfxJbSzbd55qpRRyG4MIX7ZjM2uWcL03JGekB6FK8AkCGXaFdBNDP6i37mWjP2HLTozgqty0wLHXTrgvSn7Yrt44bF8F5hV6gsNg5K/VTx34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210329; c=relaxed/simple;
	bh=U2CgUyr3prPUjkCGeI5MEVR3DjOKaU+YZtfp9ZIkg7Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=N2AEY//voWo7Jk3nFPu8GRFtrv55iKF5MYsSF3tpWjkZ/uC+QXeiFCPDLF9m4bmZUyIhZ0Y6LaRQJb4Xkg8/o9mdJmQyJqC7JInsL9jaAWv5nI8FAveD0P5ppd973PDhwDCAWJI6at1Uygb3AsiOrsDlK4XiLMIu43HsYHkVK/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61B4C32782;
	Wed, 17 Jul 2024 09:58:47 +0000 (UTC)
Message-ID: <4e617844-0040-4b29-a532-a5f903501bdb@xs4all.nl>
Date: Wed, 17 Jul 2024 11:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-core: v4l2-ioctl: missing ', ' in create_bufs
 logging
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The v4l_print_create_buffers() function was missing a ', ' in
the pr_cont call, leading to logs like this:

[93293.533425] video0: VIDIOC_CREATE_BUFS: index=0, count=0, memory=dmabuf, capabilities=0x00000297, max num buffers=32type=vid-cap, width=0, height=0, pixelformat=.... little-endian (0x00000000),
field=any, bytesperline=0, sizeimage=0, colorspace=0, flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5eb4d797d259..64c3e79d6378 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -484,7 +484,7 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
 {
 	const struct v4l2_create_buffers *p = arg;

-	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max num buffers=%u",
+	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max num buffers=%u, ",
 		p->index, p->count, prt_names(p->memory, v4l2_memory_names),
 		p->capabilities, p->max_num_buffers);
 	v4l_print_format(&p->format, write_only);
-- 
2.43.0


