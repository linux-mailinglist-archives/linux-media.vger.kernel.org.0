Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AC345D81D
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 11:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351900AbhKYKWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354566AbhKYKUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 05:20:20 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6187DC061574
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:15:19 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qBmam6Vwq1HGJqBmem30oO; Thu, 25 Nov 2021 11:15:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637835316; bh=pL95Z7jXXiTg6lDNATeQavEOgQlMi1EfYF010LbxG8w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OeNG87sCsiiHwj8HvFW2iBxpGgGZoAzd8IuzbO2LpK8Avcbr9URXKdozXMrcQzr3U
         rZn5LEbhnEV1anO1decxME4EeckeA3EtGSUzd9I3hSG/jgkDVO92KilP6nE5h4y8S3
         nDL8Gy+B/OLyJxvX+lzkl53fYWunkgfSWlwA2xFaPEKT0DEofi4JGzkt5OQiU9ZqhW
         mJhjXHsvS9KQXwVgHKi0AF8xF8Tg58imwoPCyQHWr2e2CaSzWAdRx9x/ws8uektm86
         Ru+M9hJtnKkqaSHf9Fe1Xgg7hkP4Pyw34iG3DbJgIXfKQK1ez0qffUFypJ02aLPKcV
         s9ctD0GHTYbgg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] libv4l-introduction.rst: fix undefined label
Message-ID: <0a4cef6d-a730-c87f-d573-ee0b94be037e@xs4all.nl>
Date:   Thu, 25 Nov 2021 11:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGqumJl7qbdvxFO6kn5Ree91/OletrbJWSgj0zMfGtFL+nI7oTqYS9EmV8c7eIUIdEStZFy/Y7cf3mjkG0QODggGOI3f85OGQWzRbG1Q5bVJoaoiei2e
 BPx9H7SImsVdEp1MUHQE80pPcK/wZVOR5ALNwG6w3/ZeLeIH/Vguvzz/o+6Cr31qCC9EjYMMUNaQLWhZLoyIDVi//zZna5eJNKY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_PIX_FMT_HM12 was redefined to V4L2_PIX_FMT_NV12_16L16, so use the
new name in libv4l-introduction.rst.

This fixes this warning:

libv4l-introduction.rst:27: WARNING: undefined label: v4l2-pix-fmt-hm12

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/libv4l-introduction.rst b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
index 05690f2358ce..90215313b965 100644
--- a/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
+++ b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
@@ -26,7 +26,7 @@ found in V4L2 drivers into a few common RGB and YUY formats.

 It currently accepts the following V4L2 driver formats:
 :ref:`V4L2_PIX_FMT_BGR24 <V4L2-PIX-FMT-BGR24>`,
-:ref:`V4L2_PIX_FMT_HM12 <V4L2-PIX-FMT-HM12>`,
+:ref:`V4L2_PIX_FMT_NV12_16L16 <V4L2-PIX-FMT-NV12-16L16>`,
 :ref:`V4L2_PIX_FMT_JPEG <V4L2-PIX-FMT-JPEG>`,
 :ref:`V4L2_PIX_FMT_MJPEG <V4L2-PIX-FMT-MJPEG>`,
 :ref:`V4L2_PIX_FMT_MR97310A <V4L2-PIX-FMT-MR97310A>`,
