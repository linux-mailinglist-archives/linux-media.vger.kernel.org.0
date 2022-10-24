Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5A160B0B1
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 18:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbiJXQHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 12:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbiJXQFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 12:05:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6729E3FD65
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 07:58:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E7648B8188D
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 13:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A740C433C1
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 13:28:47 +0000 (UTC)
Message-ID: <fe76906b-fadb-1a77-0852-a8536e497706@xs4all.nl>
Date:   Mon, 24 Oct 2022 15:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] atomisp: fix potential NULL pointer dereferences
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
