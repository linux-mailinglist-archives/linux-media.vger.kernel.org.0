Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF19576433
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiGOPKi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232952AbiGOPKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:10:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A5F7CB4D
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:10:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 305E3B82C73
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 15:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D58C34115;
        Fri, 15 Jul 2022 15:10:34 +0000 (UTC)
Message-ID: <66c7648f-636d-121f-f6f3-c15752e9285e@xs4all.nl>
Date:   Fri, 15 Jul 2022 17:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videodev2.h.rst.exceptions: add missing exceptions
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

Add new exceptions for V4L2_COLORSPACE_LAST, V4L2_XFER_FUNC_LAST
and V4L2_YCBCR_ENC_LAST.

This fixes documentation warnings:

Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-colorspace-last
Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-xfer-func-last
Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ycbcr-enc-last

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 2feea4a5a008..64b2c0b1f666 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -70,6 +70,7 @@ replace symbol V4L2_COLORSPACE_REC709 :c:type:`v4l2_colorspace`
 replace symbol V4L2_COLORSPACE_SMPTE170M :c:type:`v4l2_colorspace`
 replace symbol V4L2_COLORSPACE_SMPTE240M :c:type:`v4l2_colorspace`
 replace symbol V4L2_COLORSPACE_SRGB :c:type:`v4l2_colorspace`
+replace symbol V4L2_COLORSPACE_LAST :c:type:`v4l2_colorspace`
 
 # Documented enum v4l2_xfer_func
 replace symbol V4L2_XFER_FUNC_709 :c:type:`v4l2_xfer_func`
@@ -81,6 +82,7 @@ replace symbol V4L2_XFER_FUNC_NONE :c:type:`v4l2_xfer_func`
 replace symbol V4L2_XFER_FUNC_SMPTE2084 :c:type:`v4l2_xfer_func`
 replace symbol V4L2_XFER_FUNC_SMPTE240M :c:type:`v4l2_xfer_func`
 replace symbol V4L2_XFER_FUNC_SRGB :c:type:`v4l2_xfer_func`
+replace symbol V4L2_XFER_FUNC_LAST :c:type:`v4l2_xfer_func`
 
 # Documented enum v4l2_ycbcr_encoding
 replace symbol V4L2_YCBCR_ENC_601 :c:type:`v4l2_ycbcr_encoding`
@@ -92,6 +94,7 @@ replace symbol V4L2_YCBCR_ENC_SYCC :c:type:`v4l2_ycbcr_encoding`
 replace symbol V4L2_YCBCR_ENC_XV601 :c:type:`v4l2_ycbcr_encoding`
 replace symbol V4L2_YCBCR_ENC_XV709 :c:type:`v4l2_ycbcr_encoding`
 replace symbol V4L2_YCBCR_ENC_SMPTE240M :c:type:`v4l2_ycbcr_encoding`
+replace symbol V4L2_YCBCR_ENC_LAST :c:type:`v4l2_ycbcr_encoding`
 
 # Documented enum v4l2_hsv_encoding
 replace symbol V4L2_HSV_ENC_180 :c:type:`v4l2_hsv_encoding`
