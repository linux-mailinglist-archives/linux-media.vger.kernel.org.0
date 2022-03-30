Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D526E4EC176
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 13:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344278AbiC3Lzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 07:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345524AbiC3Lyh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 07:54:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5168819ABE2;
        Wed, 30 Mar 2022 04:51:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38783615E7;
        Wed, 30 Mar 2022 11:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B935DC36AE9;
        Wed, 30 Mar 2022 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648641079;
        bh=dOC/qeva2LJb0df2IyTGuQKNhvG4/vpycOtEmcS+tso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YXGu/d9cqxDx4URRkh/kDvFmOwIShZUdjVXDnPKqeb9lFT7ga2GBneC5Mbbu1Pd3J
         pc+7IeSdrHjYQyv29OPALTAynhuA8jZTnEtHA/pYsfVAWrS9enrY2YIC/DXAlXlaOk
         9AKj1znebgZ0nHGpNBaWWRw81LjhGHMOPjSrJWgaHgzSJIO3vloDA5+NyhiLBZUWIh
         Ixlgdn2lf0M1rHxY3SNJlvWsL897KZSTyiKCAvTN9gPs0oi7aMn0KAi8sxPXboujAZ
         B223VbMQX6RFP8ubQlaRqqK1usX6sd+W1oIf+nybznF2zUds5xQODzi5MgRBcnhy/a
         9c3yoV1PxfEaw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sasha Levin <sashal@kernel.org>, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH AUTOSEL 5.15 49/50] media: atomisp: fix bad usage at error handling logic
Date:   Wed, 30 Mar 2022 07:50:03 -0400
Message-Id: <20220330115005.1671090-49-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115005.1671090-1-sashal@kernel.org>
References: <20220330115005.1671090-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab@kernel.org>

[ Upstream commit fc0b582c858ed73f94c8f3375c203ea46f1f7402 ]

As warned by sparse:
	atomisp: drivers/staging/media/atomisp/pci/atomisp_acc.c:508 atomisp_acc_load_extensions() warn: iterator used outside loop: 'acc_fw'

The acc_fw interactor is used outside the loop, at the error handling
logic. On most cases, this is actually safe there, but, if
atomisp_css_set_acc_parameters() has an error, an attempt to use it
will pick an invalid value for acc_fw.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_acc.c   | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
index 9a1751895ab0..28cb271663c4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_acc.c
@@ -439,6 +439,18 @@ int atomisp_acc_s_mapped_arg(struct atomisp_sub_device *asd,
 	return 0;
 }
 
+static void atomisp_acc_unload_some_extensions(struct atomisp_sub_device *asd,
+					      int i,
+					      struct atomisp_acc_fw *acc_fw)
+{
+	while (--i >= 0) {
+		if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
+			atomisp_css_unload_acc_extension(asd, acc_fw->fw,
+							 acc_flag_to_pipe[i].pipe_id);
+		}
+	}
+}
+
 /*
  * Appends the loaded acceleration binary extensions to the
  * current ISP mode. Must be called just before sh_css_start().
@@ -479,16 +491,20 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
 								     acc_fw->fw,
 								     acc_flag_to_pipe[i].pipe_id,
 								     acc_fw->type);
-				if (ret)
+				if (ret) {
+					atomisp_acc_unload_some_extensions(asd, i, acc_fw);
 					goto error;
+				}
 
 				ext_loaded = true;
 			}
 		}
 
 		ret = atomisp_css_set_acc_parameters(acc_fw);
-		if (ret < 0)
+		if (ret < 0) {
+			atomisp_acc_unload_some_extensions(asd, i, acc_fw);
 			goto error;
+		}
 	}
 
 	if (!ext_loaded)
@@ -497,6 +513,7 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
 	ret = atomisp_css_update_stream(asd);
 	if (ret) {
 		dev_err(isp->dev, "%s: update stream failed.\n", __func__);
+		atomisp_acc_unload_extensions(asd);
 		goto error;
 	}
 
@@ -504,13 +521,6 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
 	return 0;
 
 error:
-	while (--i >= 0) {
-		if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
-			atomisp_css_unload_acc_extension(asd, acc_fw->fw,
-							 acc_flag_to_pipe[i].pipe_id);
-		}
-	}
-
 	list_for_each_entry_continue_reverse(acc_fw, &asd->acc.fw, list) {
 		if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT &&
 		    acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER)
-- 
2.34.1

