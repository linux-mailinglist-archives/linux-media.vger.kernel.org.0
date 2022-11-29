Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F61763BD2C
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 10:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiK2JpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 04:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiK2JpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 04:45:08 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCB120F43;
        Tue, 29 Nov 2022 01:45:07 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w15so7936962wrl.9;
        Tue, 29 Nov 2022 01:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVWkvrFtSXR0aVCDYTkhvYBX6IdEguz5iHOlDfowhxU=;
        b=LWR3Q1/v616RqZP3Ux7MQaSze6Vsqm/SBmlVUF4GSV8/YRGLNpKxneFw0vIgz1iMUr
         YwvDAkSbu/UNGPVNJzo494ffaMOWbVuS7BINJMS6AkNZn8cD/8sHeF4KBIFiW+QGimbr
         WtAAmBEL1bYUZj5vHryzw8J8hA+3M4gMxICe3fvGOhYUepjMZMEPPL8J9Zn204Fl628I
         FLtEjY1aN1QshfLe8qTrCnwBG2FfFqXjXGsCg9vdwOO2ehkNDIGWH3Wc30lSTy7w84+C
         B9LHOchwMh8sQngXKthwcJ6OCtfqd2JNeVLBQbJc4aOqsrgAjz8XMfAjvsj7MzFg/rFh
         8PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVWkvrFtSXR0aVCDYTkhvYBX6IdEguz5iHOlDfowhxU=;
        b=iF3fNyLysZh1+joXisTBYwyz2RBBLeyOJsb3o5tsU1i11SR3jyF0jyJmv4i84WTVSS
         Xr3i/2z+8pE9f8jsxd3OyAg1ZoYe848fdmXgVlkF6+CzLiVzGqdbqbDq1v8y4f31nWLb
         je2d5MWqLlzNSFif6wMBXIDgz+rp9F8kO7X3mhRA/5g5a/HUwq6oCI5wR3wRagBmrQUV
         EE67vHsu5Fzb+LeaM2dLmh9IPVsYG+QNzLBINKEXyR7s/jPxuNx0N36u6o5lqkt8eCE4
         takFPTA2uvZZ0g9fBosy7QrBIRFwJxA/0thFSXlwTgNoAWVQ9vq3BrDSrFlsqolr1NVD
         IzNQ==
X-Gm-Message-State: ANoB5pklKVZc1Esdtm43kZhgKw3R37eIucTms4rXwoexKeTMDNO41400
        c5CedrJfVIiPhfWXbZ7tzYI=
X-Google-Smtp-Source: AA0mqf5ZFqoGIvoHAV3OXcgDjV4X0X8r8TRTT20KS1TK8Jb85mzDTTbSGgQIh/IXrvcurq29/dSNmQ==
X-Received: by 2002:a5d:4c83:0:b0:236:7f36:1c05 with SMTP id z3-20020a5d4c83000000b002367f361c05mr33117379wrs.269.1669715106342;
        Tue, 29 Nov 2022 01:45:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a12-20020adfe5cc000000b0022cc3e67fc5sm12896794wrn.65.2022.11.29.01.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 01:45:05 -0800 (PST)
Date:   Tue, 29 Nov 2022 12:44:57 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rzg2l-cru: fix a test for timeout
Message-ID: <Y4XUmZMqt9E6dF9g@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The test for if the loop timed out is wrong and Smatch complains:

    drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:411 rzg2l_csi2_mipi_link_disable()
    warn: should this be 'timeout == -1'

Let's change it to a preop loop instead of a post op loop.

Fixes: 51e8415e39a9 ("media: platform: Add Renesas RZ/G2L MIPI CSI-2 receiver driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This does change the number of iterations from 20 to 19 but generally
retry counts are approximations.

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index aa752b80574c..1bc27aec0265 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -402,7 +402,7 @@ static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 	rzg2l_csi2_write(csi2, CSI2nRTCT, CSI2nRTCT_VSRST);
 
 	/* Make sure CSI2nRTST.VSRSTS bit is cleared */
-	while (timeout--) {
+	while (--timeout) {
 		if (!(rzg2l_csi2_read(csi2, CSI2nRTST) & CSI2nRTST_VSRSTS))
 			break;
 		usleep_range(100, 200);
-- 
2.35.1

