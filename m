Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B61F2A36AC
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKBWlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBWlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:41:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7316C0617A6
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 14:41:54 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 235CAB9C;
        Mon,  2 Nov 2020 23:41:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356913;
        bh=shjNHWxOBLD3uXDrEfEoNFRGoe8oCY8RpnRYKIMwsJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sWSF0ZqxVlIVca+RVVQP7T6G+rb49XM83POndi265azekVGQKZj3aGAPOBTsvphh8
         UsEB5A9bcp4ggxjJmf57k8GJCudBaTpvaGuwYEk0JbkR78xhpnux+CdA87jLbs9EOE
         3veOfI657V5MuQZ/FgBYrDgCpm4Q89Y3BXfFoyfo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 01/19] media: videodev2.h: Remove unneeded comment about 4CC value
Date:   Tue,  3 Nov 2020 00:40:44 +0200
Message-Id: <20201102224102.30292-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_PIX_FMT_BGRA444 format has a comment that explains why its 4CC
value is GA12. This explains the development history and isn't of much
interest to readers, it should have been part of a commit message
instead. Drop the comment, anyone interested in history can turn to git.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/videodev2.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 534eaa4d39bc..4cbc02bd8b72 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -526,12 +526,6 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RGBX444 v4l2_fourcc('R', 'X', '1', '2') /* 16  rrrrgggg bbbbxxxx */
 #define V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
 #define V4L2_PIX_FMT_XBGR444 v4l2_fourcc('X', 'B', '1', '2') /* 16  xxxxbbbb ggggrrrr */
-
-/*
- * Originally this had 'BA12' as fourcc, but this clashed with the older
- * V4L2_PIX_FMT_SGRBG12 which inexplicably used that same fourcc.
- * So use 'GA12' instead for V4L2_PIX_FMT_BGRA444.
- */
 #define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
 #define V4L2_PIX_FMT_BGRX444 v4l2_fourcc('B', 'X', '1', '2') /* 16  bbbbgggg rrrrxxxx */
 #define V4L2_PIX_FMT_RGB555  v4l2_fourcc('R', 'G', 'B', 'O') /* 16  RGB-5-5-5     */
-- 
Regards,

Laurent Pinchart

