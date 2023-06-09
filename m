Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A009E729859
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 13:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjFILqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 07:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjFILqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 07:46:53 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E22030F0
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 04:46:50 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7aZs-0005i0-Vy; Fri, 09 Jun 2023 11:46:48 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7aZq-00BK00-Od; Fri, 09 Jun 2023 11:46:46 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.5] uvcvideo changes (#92342)
Date:   Fri,  9 Jun 2023 11:46:46 +0000
Message-Id: <20230609114646.2698438-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605183025.GA22339@pendragon.ideasonboard.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230605183025.GA22339@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/313144/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230605183025.GA22339@pendragon.ideasonboard.com

gpg: Signature made Mon 05 Jun 2023 03:47:56 PM UTC
gpg:                using EDDSA key C09EF871B3827B413F971CA9CC3F2D800327DE64
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key


Build aborted due to a fatal error:
FAILED: patch patch patches/0002-media-uapi-v4l-Intel-metadata-format-update.patch doesn't apply:
Applying patch patches/0002-media-uapi-v4l-Intel-metadata-format-update.patch
can't find file to patch at input line 21
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 21ebf0d82515edf8bdbd489e6bfe9fe413e56ae3 Mon Sep 17 00:00:00 2001
|From: Dmitry Perchanov <dmitry.perchanov@intel.com>
|Date: Thu, 1 Jun 2023 19:08:46 +0300
|Subject: media: uapi: v4l: Intel metadata format update
|
|Update metadata structure for Intel RealSense UVC/MIPI cameras.
|Compliant to Intel Configuration version 3.
|
|Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
|Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
|Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
|Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
|---
| .../media/v4l/pixfmt-meta-d4xx.rst            | 55 ++++++++++++++++---
| 1 file changed, 47 insertions(+), 8 deletions(-)
|
|diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
|index 4e437ba97a0e..541836074f94 100644
|--- a/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
|+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
--------------------------
No file to patch.  Skipping patch.
9 out of 9 hunks ignored
Patch patches/0002-media-uapi-v4l-Intel-metadata-format-update.patch does not apply (enforce with -f)

