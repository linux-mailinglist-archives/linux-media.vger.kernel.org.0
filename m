Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BE77BB4D8
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjJFKJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjJFKI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:08:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC782EB
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:08:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226E4C433CB;
        Fri,  6 Oct 2023 10:08:55 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/9] staging: media: atomisp: improve unwinding
Date:   Fri,  6 Oct 2023 12:08:44 +0200
Message-Id: <97bf2e6dcba166ba77a9c35e3fe7b0f20a0abf7a.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes two smatch warnings:

drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c    | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a54be2d20c58..759233a7ba50 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2771,12 +2771,16 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 			css_param->dvs_6axis = NULL;
 
 			dvs_6axis_config = ia_css_dvs2_6axis_config_allocate(stream);
-			if (!dvs_6axis_config)
-				return -ENOMEM;
+			if (!dvs_6axis_config) {
+				ret = -ENOMEM;
+				goto error;
+			}
 		} else if (!dvs_6axis_config) {
 			dvs_6axis_config = ia_css_dvs2_6axis_config_allocate(stream);
-			if (!dvs_6axis_config)
-				return -ENOMEM;
+			if (!dvs_6axis_config) {
+				ret = -ENOMEM;
+				goto error;
+			}
 		}
 
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
@@ -2874,8 +2878,10 @@ int atomisp_cp_morph_table(struct atomisp_sub_device *asd,
 		morph_table = atomisp_css_morph_table_allocate(
 				source_morph_table->width,
 				source_morph_table->height);
-		if (!morph_table)
-			return -ENOMEM;
+		if (!morph_table) {
+			ret = -ENOMEM;
+			goto error;
+		}
 
 		for (i = 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
 			if (copy_from_compatible(morph_table->coordinates_x[i],
-- 
2.40.1

