Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8316E2217
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjDNL2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjDNL2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:28:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42C88A6F
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:27:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B57A9646ED
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E878C4339B;
        Fri, 14 Apr 2023 11:27:58 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 14/18] media: mxb: update the tvnorms when changing input
Date:   Fri, 14 Apr 2023 13:27:38 +0200
Message-Id: <20230414112742.27749-15-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tuner input uses different tvnorms compared to the
S-Video/Composite inputs. So update the tvnorms field
in struct video_device when switching inputs.

This fixes a V4L2 compliance issue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/saa7146/mxb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 557ba89cd12d..3b0c475c7ab4 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -512,6 +512,9 @@ static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 	if (err)
 		return err;
 
+	mxb->video_dev.tvnorms = mxb_inputs[input].std;
+	mxb->vbi_dev.tvnorms = mxb_inputs[input].std;
+
 	/* switch video in saa7111a */
 	if (saa7111a_call(mxb, video, s_routing, i, SAA7111_FMT_CCIR, 0))
 		pr_err("VIDIOC_S_INPUT: could not address saa7111a\n");
-- 
2.39.2

