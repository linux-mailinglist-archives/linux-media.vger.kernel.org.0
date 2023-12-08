Return-Path: <linux-media+bounces-1943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCA80A2CC
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020211F2144F
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 12:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAB91BDEC;
	Fri,  8 Dec 2023 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ci4FbPQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32D4173B
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 04:06:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 627DEE45;
	Fri,  8 Dec 2023 13:05:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702037148;
	bh=0YagVnBIWZ2T3v+k7aW8T2F7WV0xoVMWtfEWTGx2sHo=;
	h=From:To:Cc:Subject:Date:From;
	b=ci4FbPQ2edIWt9Lb8B0PC0PqO1PjpyZHj9JAqY4yfz23Z3YPQAdNd5c2QK2sVyrPi
	 okXLEB5kH+gxHY4sHvgvqbvpsHXvKGL6f3N7C55xt8HotYZvMXvFwe/wq0NapsXUZv
	 vnNlvU4mvAL0LgQprSEE2mfrx5+CEter279/cFYc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] media: atmel-isi: Fix crash due to missing subdev in state
Date: Fri,  8 Dec 2023 14:06:37 +0200
Message-ID: <20231208120637.7155-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a result of converting to the stream-aware state functions, commit
bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state
functions") caused the sd pointer of the state passed to the
v4l2_subdev_state_get_crop() function to be dereferenced. It however
missed that the atmel-isi driver creates the v4l2_subdev_state instance
on the stack (which it shouldn't do, but that's a separate problem),
without initializing the sd field. This results in a null pointer
dereference.

Fix it by initializing the sd field.

Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This fixes a regression in the media_stage/master branch, scheduled for
merge in v6.8. It should be applied before the opening of the next merge
window.
---
 drivers/media/platform/atmel/atmel-isi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index da58f33b6b0a..ed70c030858d 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -589,6 +589,7 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4l2_format *f,
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
 	struct v4l2_subdev_pad_config pad_cfg = {};
 	struct v4l2_subdev_state pad_state = {
+		.sd = isi->entity.subdev,
 		.pads = &pad_cfg,
 	};
 	struct v4l2_subdev_format format = {

base-commit: bec3db03911bd85da29c1c8ee556162153002c9a
-- 
Regards,

Laurent Pinchart


