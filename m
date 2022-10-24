Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4969D60B576
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 20:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiJXS2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 14:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiJXS1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 14:27:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDCE2700
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 10:09:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D51D76147E
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 16:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089A6C4347C
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 16:02:43 +0000 (UTC)
Message-ID: <fc6a20a9-dddb-626c-460f-3e8c38be4432@xs4all.nl>
Date:   Mon, 24 Oct 2022 18:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH, resend] atomisp: fix potential NULL pointer dereferences
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The asd pointer is used in lockdep_assert_held() before the check if
asd is NULL.

This fixes two smatch warnings:

drivers/staging/media/atomisp/pci/atomisp_cmd.c:3697 atomisp_handle_parameter_and_buffer() warn: variable dereferenced before check 'asd' (see line 3695)
drivers/staging/media/atomisp/pci/atomisp_cmd.c:3779 atomisp_set_parameters() warn: variable dereferenced before check 'asd' (see line 3777)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Not sure what happened with the first attempt to post the patch, retrying...
---
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 90f25cc22227..eeb66b3b79ab 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3692,14 +3692,14 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 	unsigned long irqflags;
 	bool need_to_enqueue_buffer = false;
 
-	lockdep_assert_held(&asd->isp->mutex);
-
 	if (!asd) {
 		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
 			__func__, pipe->vdev.name);
 		return;
 	}
 
+	lockdep_assert_held(&asd->isp->mutex);
+
 	if (atomisp_is_vf_pipe(pipe))
 		return;
 
@@ -3774,14 +3774,14 @@ int atomisp_set_parameters(struct video_device *vdev,
 	struct atomisp_css_params *css_param = &asd->params.css_param;
 	int ret;
 
-	lockdep_assert_held(&asd->isp->mutex);
-
 	if (!asd) {
 		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
 			__func__, vdev->name);
 		return -EINVAL;
 	}
 
+	lockdep_assert_held(&asd->isp->mutex);
+
 	if (!asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream) {
 		dev_err(asd->isp->dev, "%s: internal error!\n", __func__);
 		return -EINVAL;
