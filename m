Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0733774A5
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 02:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhEIADd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 20:03:33 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:37889 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhEIADc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 20:03:32 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id C6CC8C3374
        for <linux-media@vger.kernel.org>; Sat,  8 May 2021 23:53:08 +0000 (UTC)
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4B396FF80C;
        Sat,  8 May 2021 23:52:46 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/4] staging: media: atomisp: Use kcalloc instead of kzalloc with multiply in sh_css.c
Date:   Sat,  8 May 2021 19:56:21 -0400
Message-Id: <20210508235622.300394-4-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508235622.300394-1-vrzh@vrzh.net>
References: <20210508235622.300394-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use kcalloc instead of kzalloc with multiplication.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 51fe939a8958..b8dd817616e8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5328,14 +5328,15 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		if (err)
 			return err;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
-		mycs->yuv_scaler_binary = kzalloc(cas_scaler_descr.num_stage *
-						  sizeof(struct ia_css_binary), GFP_KERNEL);
+		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
+						  sizeof(struct ia_css_binary),
+						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
 			err = -ENOMEM;
 			return err;
 		}
-		mycs->is_output_stage = kzalloc(cas_scaler_descr.num_stage
-						* sizeof(bool), GFP_KERNEL);
+		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
+						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
 			return err;
@@ -5938,14 +5939,15 @@ static int load_primary_binaries(
 			return err;
 		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
-		mycs->yuv_scaler_binary = kzalloc(cas_scaler_descr.num_stage *
-						  sizeof(struct ia_css_binary), GFP_KERNEL);
+		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
+						  sizeof(struct ia_css_binary),
+						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
 			err = -ENOMEM;
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
-		mycs->is_output_stage = kzalloc(cas_scaler_descr.num_stage *
+		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
 						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
@@ -6989,14 +6991,14 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 			goto ERR;
 		mycs->num_output = cas_scaler_descr.num_output_stage;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
-		mycs->yuv_scaler_binary = kzalloc(cas_scaler_descr.num_stage *
+		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
 						  sizeof(struct ia_css_binary),
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
 			err = -ENOMEM;
 			goto ERR;
 		}
-		mycs->is_output_stage = kzalloc(cas_scaler_descr.num_stage *
+		mycs->is_output_stage = kcalloc(cas_scaler_descr.num_stage,
 						sizeof(bool), GFP_KERNEL);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
@@ -7097,7 +7099,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 
 		mycs->num_vf_pp = 1;
 	}
-	mycs->vf_pp_binary = kzalloc(mycs->num_vf_pp *
+	mycs->vf_pp_binary = kcalloc(mycs->num_vf_pp,
 				     sizeof(struct ia_css_binary),
 				     GFP_KERNEL);
 	if (!mycs->vf_pp_binary) {
-- 
2.31.1

