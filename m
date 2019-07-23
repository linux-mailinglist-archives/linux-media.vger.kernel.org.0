Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDF5718CD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 14:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390001AbfGWM7w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 08:59:52 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40665 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731866AbfGWM7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 08:59:52 -0400
Received: from [IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2] ([IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id puORhvSuYLqASpuOUhJ1Cv; Tue, 23 Jul 2019 14:59:50 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] am437x: remove unused struct vpfe_pixel_format
Message-ID: <b29844e0-4dee-a6a5-913c-59c40f8ab77a@xs4all.nl>
Date:   Tue, 23 Jul 2019 14:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDuS7zmatfUlUvcxADdSkCCtWQSpj8D4mIh15jLYRRk8tyu7qweGvctnGsoAiPUwMtsKiCSA456ktfxfN6kK6TQh36bq2jGil/4HnXhH0dH7LUoW56LS
 n+DV4481CFH816ZbaM/EXNtWwZ6zDTvCYQ+FltaJ4YeXAyddWeVUIh82iWCQf21TWgrjbypnCsoFIMbY2YIflf/zLdXZkmDspnqMWD0bjo7/Ix+SrwMaAJEh
 Yl6XRaQ3gClehOVSV3Mkja+wGBYTtcHCr8LAsour4gLk/ioNPfgQnKq95XtCjs6pwwvygwa4uHpZUESJnGw+x0TsyfEhvx1qC2VFNxZ2dXwLfREvouSTj+TB
 T0mKEv2q
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct vpfe_pixel_format was defined, but never used. Remove it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
index 17d7aa426788..4678285f34c6 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -65,12 +65,6 @@ struct vpfe_hw_if_param {
 #define VPFE_MAX_SUBDEV		1
 #define VPFE_MAX_INPUTS		1

-struct vpfe_pixel_format {
-	struct v4l2_fmtdesc fmtdesc;
-	/* bytes per pixel */
-	int bpp;
-};
-
 struct vpfe_std_info {
 	int active_pixels;
 	int active_lines;
