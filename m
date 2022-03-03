Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37004CBF95
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 15:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbiCCOLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 09:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbiCCOLV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 09:11:21 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442D818CC0F
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 06:10:35 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d3so8066886wrf.1
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K+cp32jJsmQJwPEJmEIbmAXA5SBI6YkzaNKLwkJM+Wc=;
        b=R/B+urdWwiHFbbBjSEMT6VAXTGyY/gpXAIQXiRTbXjKBtKeQR2Lt2j83+EBeO+C8C5
         wfYUyX3cmy6V9pBd95oCqYrRcrUGO1tbhXmvwW2j0FNAidb4vA/Xf67Mw8H/1uEMRav+
         eTJvytNFOEhE+d/9byUBHGfxTzQhLHxU13lM/g4o8DHpyLGob6YahSMIgsjEy+bV67IP
         EJQTRSgG4EiugJJOpy4xWCLEFnaAT8/8cQ6D4thq7B4Ujo6+5BhEvPjAS/+0K78VgkzK
         PdN+GTYG3ZCM/+RzLcifKD+78N4G/8j7bWT7+jUtoYwArVFAO0pVzLmEz0GvgoTOBiVJ
         9aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+cp32jJsmQJwPEJmEIbmAXA5SBI6YkzaNKLwkJM+Wc=;
        b=UBBa+3YotNyAxE/3i/9RUWjs+2SewPNPUp7J99KHseSfvvtZuzzf3M6pTfo7khvYnx
         ArjCjtZuvoX/Kl8jNHHOmHN0z54bpePlP8OnRzKBW26JzRtBHZwnC53z9piVnPpryeGi
         0axGl8V6bhQ9qFTHkI2aTDjTeI8hNLZ9NE+k5mBG6y/+crazqFK/dU6Hvr8Ln21r0OeV
         +lPhKURKBjSzcNfEdEeYrozjJaU2DBZnuMlnu4Kiq911Sjtbn+VCJ1GruoEC3N3nD/Cs
         Zmgzh5T0WgsmKoH9tC92YAPmsZ6DzKAHVrhn5bR0uX7BnqsvmOez2Gxza6Fd2Fkb800w
         cwsg==
X-Gm-Message-State: AOAM532nRgrs7JWuCXPRqGXSDAot6ZXcrkJBlkVRG+e5aB9QOCIZEFjq
        kUy/fEEppaz+IATs/HDvTFs3feqKq2swNEMt
X-Google-Smtp-Source: ABdhPJzwEVXy8iEhc4B4gdfl7+gYPtpOtG3reBk1bJ4P0mrfn6hbDMljQ4yWeWoPxGtwzVfnf9rAPQ==
X-Received: by 2002:adf:f849:0:b0:1ef:5d80:c68a with SMTP id d9-20020adff849000000b001ef5d80c68amr22661460wrq.280.1646316633658;
        Thu, 03 Mar 2022 06:10:33 -0800 (PST)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id ba2-20020a0560001c0200b001f0653f1097sm194312wrb.69.2022.03.03.06.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:10:33 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP v2 3/6] docs: dev-encoder: Add additional steps for image encoding
Date:   Thu,  3 Mar 2022 16:10:07 +0200
Message-Id: <20220303141010.573408-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
References: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add two more steps to encoder Initialization phase related
to image encoding.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/dev-encoder.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
index aa338b9624b0..ec799b4b9a61 100644
--- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -229,6 +229,12 @@ Initialization
      default values, based on the new resolution, as described in the next
      step.
 
+3.1 Call VIDIOC_S_EXT_CTRLS() to set all controls (Grid width and height and
+   number of rows and columns) required to update CAPTURE and OUTPUT formats.
+
+3.2 Call VIDIOC_G_FMT() to get updated CAPTURE and OUTPUT formats as consequence
+   of setted grid encoding dimentions.
+
 4. Set the raw frame interval on the ``OUTPUT`` queue via
    :c:func:`VIDIOC_S_PARM`. This also sets the coded frame interval on the
    ``CAPTURE`` queue to the same value.
-- 
2.25.1

