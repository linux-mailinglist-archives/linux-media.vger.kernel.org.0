Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB3E642B90
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbiLEPZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbiLEPY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:24:58 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FDE20BD8
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:22:12 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h10so9565846wrx.3
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uezy3uu36wBaetI47HqvtIVi3qKjp7ZeDLlnyZoU/m8=;
        b=ErhLieklrp8q9GHkwjp1EArHaOnGgGRGCObJZF55iuakepSDn0u4kwGrhT+22YDVJh
         lH2ethEqXftm5tCmYvGaWgbe89Ni3KZuOYP9z+OLAChIxy7dE5eo+ysyfzRhJM8Lxxv1
         VdOlfs9pJc87H5HO3/oD3t3awQPDB56uJO/J1wZw1uAAWrre72Au3nenNjqP65yodAxx
         BZIrEAG1u0KUnTXwKzuyXBdR7FGTx0hrqBAWdg9hN2NO98Dwl07Qvt3fU4KuD0Byn3Py
         jnWKNbeoeDV2gRDpdSPBhWzCUR57E0eMENbrzE3xc5uI4Xn1K9hgRnkq629YvTTYTztu
         omJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uezy3uu36wBaetI47HqvtIVi3qKjp7ZeDLlnyZoU/m8=;
        b=6dIzP6iTa3v7n2+f0L4zdRi4uiBnvCWnuQuwH6RhrLq27A6nfhSMxL6W3W4/tZfNh6
         5KcVRwl1sUE0UG8BicuT/jeLMRaVdqdW5NDdTWF5a6nBFvsz93HVQC9bbUCoWvXB9Uv8
         oPqwHPKsQau1boEyRHJbU8M8GdRCHtkBVgkVy5qWsSwtdNOt4l3xLcsEjwPIZ+X67h0V
         82RZCzYhICOCcxzPMGeH/5GCdpLJYCiy8IdNj8yZ/E9FR07dFNbcq+TM9nmq3TLvKIlN
         nvz88MSq6LRJiSh7RXXLZSO6RGS2RFprxuwUA/TpdEIwS9A20ZS2sTx4gjdAx2i//4K8
         7ciA==
X-Gm-Message-State: ANoB5pl4ECzi/fpWWUZcMJ/yM3y3szdEQw6KJLZFsevv1azc9r8cxnlb
        SGGAcPalmDJtJtw48+cFbAr/RvdBew9HT5Qo
X-Google-Smtp-Source: AA0mqf7/Ml5wRwxcrSlgQYp+ov63cZtBziB0CV2I8JMZHmmcpAhysV9hPBHMhxNy/hgHyRVaCD3FIg==
X-Received: by 2002:a5d:68d0:0:b0:242:6fb:128d with SMTP id p16-20020a5d68d0000000b0024206fb128dmr27962539wrw.422.1670253729849;
        Mon, 05 Dec 2022 07:22:09 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm25144905wmb.22.2022.12.05.07.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:22:09 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH V2 0/5] Ensure sensor drivers set V4L2_CTRL_FLAG_MODIFY_LAYOUT for flips
Date:   Mon,  5 Dec 2022 15:21:44 +0000
Message-Id: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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

Hi.

I was doing a basic sweep of drivers and noted that these 5 drivers change the
Bayer order based on HFLIP and VFLIP. However they don't set the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag on the controls, so userspace has no notion
that it needs to check for a changed format.

Add the flag to all the controls.

  Dave

Changes from v1:
- Corrected typo in imx355
- Moved setting the flags for ov2680 at Rui's request.


 drivers/media/i2c/imx208.c  | 4 ++++
 drivers/media/i2c/imx319.c  | 4 ++++
 drivers/media/i2c/imx355.c  | 4 ++++
 drivers/media/i2c/ov08d10.c | 5 +++++
 drivers/media/i2c/ov2680.c  | 2 ++
 5 files changed, 19 insertions(+)

-- 
2.34.1

