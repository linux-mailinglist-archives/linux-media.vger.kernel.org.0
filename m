Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8818A7D946C
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345670AbjJ0J64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345668AbjJ0J6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:58:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2539B194
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C470BBB;
        Fri, 27 Oct 2023 11:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400715;
        bh=GGld0t4f1ouhhU35cu9gYzwXhTDp1EyxGEbQj4B4Pr4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sboHYmtB5r55oZy2HuQoYVIwBctfE7gen9J15XtpyIiBo8aQPZXcCnh9MrCshGI2d
         A2So0gstZGuPoG2DrLth9vxpqA4bPwP06MohiQgrETpApWQh5p8NJtlmcE+lP0Dbx2
         6xDRjt5v7eGCBHLowucpDdeLd1cTuJM1xmxengK0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH v1 1/9] media: ipu3-cio2: Drop comment blocks for subdev op handlers
Date:   Fri, 27 Oct 2023 12:58:45 +0300
Message-ID: <20231027095853.29057-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 subdev .get_fmt() and .set_fmt() pad operation handlers have a
short documentation block that merely duplicates information from the
V4L2 subdev API documentation. They offer no value, and are prone to
bit-rotting as shown by the @cfg parameter documentation being outdated.
Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index dce4b0e1f6e9..5d3b0ffd3d08 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1215,13 +1215,6 @@ static int cio2_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	return 0;
 }
 
-/*
- * cio2_subdev_get_fmt - Handle get format by pads subdev method
- * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad config
- * @fmt: pointer to v4l2 subdev format structure
- * return -EINVAL or zero on success
- */
 static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
@@ -1241,13 +1234,6 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/*
- * cio2_subdev_set_fmt - Handle set format by pads subdev method
- * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad config
- * @fmt: pointer to v4l2 subdev format structure
- * return -EINVAL or zero on success
- */
 static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
-- 
Regards,

Laurent Pinchart

