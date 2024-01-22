Return-Path: <linux-media+bounces-3968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E3835E25
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 10:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 716C9B28888
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 09:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63EC39AD5;
	Mon, 22 Jan 2024 09:26:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5F3A8C0
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915605; cv=none; b=jDrPFIH9QhgiN4vUicGXVqf5UMnsyEgqeFoQR7rl9hIoBZ/i/vOAQz332OjXFc/wXEXx95tx6telJ1Ntxgr+8dXaoe5my6QnmUWhm0Cij3zzhzgX+W0KFu70XIZ6ZVrV7BAn6vcV7UtX9GVgVnDE6npfI95KpkTRJ/F0cIshEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915605; c=relaxed/simple;
	bh=HarIgcupn5EfW48na9V9WHCCIKBZE2L+/38lrZkHnvQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JFY1k5pjhQPEwuel8M8xpNxIqt543lysFeUz+9S3HFSEpVHrE0gDTcLabUcHwOQzAgsfGzF1pVk4DTZz+ltipnGxHBlq5PGnGRVo/SmwYDU8v/fw8QGJBiF9gCkALGCt7puBwuJT3O6jbMUAXeWfQ3+kxhpE2aPkmDY1LF2UpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276B4C433A6;
	Mon, 22 Jan 2024 09:26:43 +0000 (UTC)
Message-ID: <092cc12f-c671-45b8-bfd1-7a4d1daab4c5@xs4all.nl>
Date: Mon, 22 Jan 2024 10:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: mediatek: vcodec: drop excess struct members
 descriptions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Drop obsolete @wait_key_frame and @mv_joint struct member descriptions.

This fixes two warnings:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
I plan to merge this Wednesday, since this causes annoying compile warnings.
---
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index f64b21c07169..f677e499fefa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -37,7 +37,6 @@
  * @bs_sz:		bitstream size
  * @resolution_changed:resolution change flag 1 - changed,  0 - not change
  * @frame_header_type:	current frame header type
- * @wait_key_frame:	wait key frame coming
  * @crc:		used to check whether hardware's status is right
  * @reserved:		reserved, currently unused
  */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 69d37b93bd35..cf48d09b78d7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -141,7 +141,6 @@ struct vdec_vp9_slice_frame_counts {
  * @skip:	skip counts.
  * @y_mode:	Y prediction mode counts.
  * @filter:	interpolation filter counts.
- * @mv_joint:	motion vector joint counts.
  * @sign:	motion vector sign counts.
  * @classes:	motion vector class counts.
  * @class0:	motion vector class0 bit counts.

