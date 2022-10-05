Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5052E5F5776
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiJEP26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiJEP2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:54 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F0061709
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:54 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id w18so17743246wro.7
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4bnTMT1ECV0+8G4nsiyDVtLIQnvHl+1RKBB8Wab7ZcY=;
        b=FyUdamdk3HzAB2BYCnovcQMN9KkjneLq8UMM8Rp/naKb83EEEXuLiQ0+/nfmVc4m8a
         2R4VG7G+m+0Gihv3wdhjxKxIi10Epib3AWhksEFeT1CVYee9EOhY5Z2KM/qNSMunvJau
         xcN1RFvEJfBr0WumpzbCGGJRBHARzRYT48Qo8pzgHYoWkV5i3GLIcaCnsCVrNJHw2R1n
         c35NwmlBobHhUXI8NYmq26F/8tQAZ9gqv8ZM1X9RRwrqfbNmzKh4r+fyFrcg24w6lm5L
         7h0JOj8Lt/0LJdPhdWV+3mtZuCvTbjYXRIzELbvhsEh0ylTzVw//uEhs9sQs+CS2LykY
         EfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4bnTMT1ECV0+8G4nsiyDVtLIQnvHl+1RKBB8Wab7ZcY=;
        b=dFRoDa8qmY50p7sXsVtwXdoH9jTQmnb2RDZWeSPvib2axJZbrUBZFg5xUjD5YQ457q
         qGMtj6Elwi9UfYnz0axHlD95AFHW+1oaOjKoxcJPX9NnIDD0YhnqIscTDttuyWF34rvg
         MFXI1Wi34maiZATaOVPBN89m4zTpYrcQGVeBJwAkZxUHmrsXrd0Z5usCoBTKQ4Pzm/G+
         uzUMa0XKueIDE4A2toOqCwEki+waqhYksW3mS11QfuTsyfSzE2MTW00eZOFpt1sg09NW
         cpPSW3MaOalLz3BpVxRYo1jjszJJqEM/bQo/IQR0DnuBNrdyR9y5+J2Wy//J5c90ve0i
         VjvQ==
X-Gm-Message-State: ACrzQf0XNGir1io6Fcttva5SLIvnGXqPdsGcaZ9pquz+jZp3VZEvyssZ
        WKMxrwfeo2rc7ROYSj5HkD/yWQ==
X-Google-Smtp-Source: AMsMyM4+tawjfy6Ygi3zczOpsm8XteN23JR+jbkkDDCM6CxWFc2T3tM1AjA5umtZ0paHWKyQXNYUSw==
X-Received: by 2002:a5d:65c4:0:b0:22c:dbdd:7177 with SMTP id e4-20020a5d65c4000000b0022cdbdd7177mr200489wrw.470.1664983732729;
        Wed, 05 Oct 2022 08:28:52 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:52 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 07/16] media: i2c: ov9282: Reduce vblank_min values based on testing
Date:   Wed,  5 Oct 2022 16:28:00 +0100
Message-Id: <20221005152809.3785786-8-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The configured vblank_min setting of 250 (meaning VTS of
720 + 250 = 970) is far higher than the setting that works on
the sensor, and there are no obvious restrictions stated in the
datasheet.

Reduce the vblank_min to allow for faster frame rates.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 1cd6cb4addfb..abb1223c0260 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -268,7 +268,7 @@ static const struct ov9282_mode supported_modes[] = {
 		.height = 720,
 		.hblank = 250,
 		.vblank = 1022,
-		.vblank_min = 151,
+		.vblank_min = 41,
 		.vblank_max = 51540,
 		.link_freq_idx = 0,
 		.reg_list = {
-- 
2.34.1

