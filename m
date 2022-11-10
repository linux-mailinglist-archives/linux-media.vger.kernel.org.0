Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776966246FB
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 17:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbiKJQar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 11:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbiKJQai (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 11:30:38 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5230F3C6F3
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:30:37 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so1969712pjl.3
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkaCawdyh08WkrauD8ZffwaibgAf2YaVEV/UkOO9ThM=;
        b=b9fVsn/o+EOVocD3Uk3T/6+Egpep17b2sHPHBYYf8mmj4zXEus3ZyLWi+H5Oe0fTF4
         H5/hnFyx8Iu9FOzKvO4KPvQmBXxoT/g9/RE/ZI8NWyRJHt33JiyPxdELIpu0SC8m2Sxr
         clzDY2KgOtiwGV43m0lljTqNkWm7DRqM2unIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkaCawdyh08WkrauD8ZffwaibgAf2YaVEV/UkOO9ThM=;
        b=TVbVMzVHZOXroLc7acnyML4T4TRhuawpcXOApeIIiFxdQmfEgBPboV6+bLPn9OKW9x
         5PcFEv4/PQKoC9bwmBJiRJQH94rxAUv55Tti+0lnU5B0GprGkMNdlJuw3ueYy5CdG/nb
         TTxpIqbNrfh8r8fw3IJhl/qiPcFWGFHopp5dwrHf+oIXfjQj+5tITxLQ2lZDFYNldXJW
         a7PR0/5s+7kJE44tSlvL3QGA1R0R0q13uFQ8pkWC19/MUB/l3oV3I4qSai7ZuxvbGRpA
         R2+6aahLL6ERTyC4BBVslAggY9Ipwif+6nLb0SQcv6WajVRZBz0rBhW4NLvGOSgE5H7C
         GT4Q==
X-Gm-Message-State: ACrzQf21kNwXU0HTcxMiAUdw0JurGBIuGROXNsI+ZU1Ko8iOcioI/vmS
        usyy4ETcjb9yxn/hhEL4F18RfQ==
X-Google-Smtp-Source: AMsMyM7yWmOrmcdHdEJ1q1Xd7kAoXGvcFQoV13t8RSx7BBM2CgbxhLhelQ4tNE3SMAQe3Wm0pAReYg==
X-Received: by 2002:a17:902:82c2:b0:188:5581:c8de with SMTP id u2-20020a17090282c200b001885581c8demr1274837plz.140.1668097836751;
        Thu, 10 Nov 2022 08:30:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090a430700b001fd6066284dsm35926pjg.6.2022.11.10.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:30:36 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:30:35 -0800
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Shawn Tu <shawnx.tu@intel.com>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: tc358746_apply_pll_config(): Control flow issues
Message-ID: <202211100830.5E3EE2678@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Thu Oct 27 14:48:40 2022 +0300
    80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")

Coverity reported the following:

*** CID 1527252:  Control flow issues  (DEADCODE)
drivers/media/i2c/tc358746.c:411 in tc358746_apply_pll_config()
405     		return err;
406
407     	val = PLL_FRS(ilog2(post)) | RESETB | PLL_EN;
408     	mask = PLL_FRS_MASK | RESETB | PLL_EN;
409     	tc358746_update_bits(tc358746, PLLCTL1_REG, mask, val);
410     	if (err)
vvv     CID 1527252:  Control flow issues  (DEADCODE)
vvv     Execution cannot reach this statement: "return err;".
411     		return err;
412
413     	fsleep(1000);
414
415     	return tc358746_set_bits(tc358746, PLLCTL1_REG, CKEN);
416     }

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527252 ("Control flow issues")
Fixes: 80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")

Thanks for your attention!

-- 
Coverity-bot
