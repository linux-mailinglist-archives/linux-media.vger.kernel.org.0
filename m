Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138A32D07D0
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLFXEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:04:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59778 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgLFXEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:04:09 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1B53EC;
        Mon,  7 Dec 2020 00:03:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607295807;
        bh=oS1hxWifvTaTBqnbzCmiTcnRDf71R2MQvrkXcPvAtJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HzZv5Hup5uIj1L0JdBaXXUKcuQ3/9NcIqVs/wC8wDefgsXUTm8AYAM5gVbrLgIk5G
         z9M639N5satUlj0v50cw5GA/7YhtQCRtQ/tX9AyKTGOVXoit8ssRbAmoBAjWA3C/a1
         Fzh258eGXlshQxqeEWCLGGM6CjuHMA2IO36M4U/Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v4 01/16] media: videodev2.h: Remove unneeded comment about 4CC value
Date:   Mon,  7 Dec 2020 01:03:01 +0200
Message-Id: <20201206230316.1221-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
References: <20201206230316.1221-1-laurent.pinchart@ideasonboard.com>
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
index e40e95be79f9..3f58ab463f6c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -524,12 +524,6 @@ struct v4l2_pix_format {
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

