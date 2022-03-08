Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C074D1228
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 09:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbiCHI05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 03:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbiCHI05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 03:26:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1653F33B
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 00:26:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BEA4EB81686
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 08:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22B8C340EB;
        Tue,  8 Mar 2022 08:25:57 +0000 (UTC)
Message-ID: <c0a9a647-5e27-52bd-65a0-b9663014887a@xs4all.nl>
Date:   Tue, 8 Mar 2022 09:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] pixfmt-yuv-planar.rst: fix PIX_FMT labels
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two labels used _ instead of - so were never found and one new PIX_FMT was
missing the label altogether. This led to these warnings:

Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-nv12m-8l128
Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-nv12m-10be-8l128
Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-mm21

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 72a74c8f0a0d ("media: add nv12m_8l128 and nv12m_10be_8l128 video format.")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index cc3e4b5791c5..8dff5906639b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -257,8 +257,9 @@ of the luma plane.
 .. _V4L2-PIX-FMT-NV12-4L4:
 .. _V4L2-PIX-FMT-NV12-16L16:
 .. _V4L2-PIX-FMT-NV12-32L32:
-.. _V4L2_PIX_FMT_NV12M_8L128:
-.. _V4L2_PIX_FMT_NV12M_10BE_8L128:
+.. _V4L2-PIX-FMT-NV12M-8L128:
+.. _V4L2-PIX-FMT-NV12M-10BE-8L128:
+.. _V4L2-PIX-FMT-MM21:
 
 Tiled NV12
 ----------
