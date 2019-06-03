Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71E332E44
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfFCLJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:09:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60904 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbfFCLJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:09:55 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DC28D285168;
        Mon,  3 Jun 2019 12:09:52 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size limitation more explicit
Date:   Mon,  3 Jun 2019 13:09:45 +0200
Message-Id: <20190603110946.4952-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603110946.4952-1-boris.brezillon@collabora.com>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver only supports per-slice decoding, and in that mode
decode_params->num_slices must be set to 1 and the slice_params array
should contain only one element.

The current code already had this limitation but it made it look like
the slice_params control was a single struct while, according to the
spec, it's actually an array. Make it more explicit by setting dims[0]
and adding a comment explaining why we have this limitation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 378032fe71f9..3661c6a04864 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -49,6 +49,12 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
 		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_slice_params),
+		/*
+		 * This driver does not support per-frame decoding (yet?).
+		 * Allow only on per-slice decoding operation, which implies
+		 * that only 1 slice param is passed per decoding operation.
+		 */
+		.cfg.dims[0]	= 1,
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
-- 
2.20.1

