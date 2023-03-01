Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A6E6A6BE4
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 12:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCALrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 06:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCALrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 06:47:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99539168BA
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 03:47:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33B2B612B8
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 11:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCD0C433EF;
        Wed,  1 Mar 2023 11:47:38 +0000 (UTC)
Message-ID: <6b35b50f-8f6e-b357-ea70-79ed5d372bc3@xs4all.nl>
Date:   Wed, 1 Mar 2023 12:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Corentin Labbe <clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] zoran: drop two obsolete prototypes from zoran_device.h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These overlay-related functions no longer exist, so drop them
from the header.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/zoran/zoran_device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_device.h b/drivers/media/pci/zoran/zoran_device.h
index 237e830ae726..6d2a526789a5 100644
--- a/drivers/media/pci/zoran/zoran_device.h
+++ b/drivers/media/pci/zoran/zoran_device.h
@@ -25,8 +25,6 @@ void jpeg_codec_sleep(struct zoran *zr, int sleep);
 int jpeg_codec_reset(struct zoran *zr);

 /* zr360x7 access to raw capture */
-void zr36057_overlay(struct zoran *zr, int on);
-void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count);
 void zr36057_set_memgrab(struct zoran *zr, int mode);
 int wait_grab_pending(struct zoran *zr);

-- 
2.39.1

