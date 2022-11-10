Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714756246FE
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 17:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbiKJQaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 11:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiKJQat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 11:30:49 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF89D31FB3
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:30:47 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y4so1815716plb.2
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7BqZAlE1bjvuU8uo7I+oqV+cV0QxCreGR2RF30Isq4=;
        b=OPKatcHwrxkE3M6fiQu8U7vULB9rcjQ8OUS9rvEAifwKQ5EGkkmQ3nBniu0kkulau6
         Fad81+VZTcHivXF3l4PpFgT+uqPuNK96mkNlK4VrYv6CKHiu+WuusmrYDIN4XPYPERdj
         rQ5jnZp15THRxWIxvaAh1Ag49BGOl81Ntv7i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7BqZAlE1bjvuU8uo7I+oqV+cV0QxCreGR2RF30Isq4=;
        b=rbqKdTkX+vs/qPYOzZKaSrxvmxxWAX3dcUMDdK1MV4cBA6FCZ4Ppp05m4NPJRNy+/H
         +NfnXPIq9cfVeWXYc0QAnZHuZXo7BWL7O1baMoUiYYJi1LTM8aCgbwnM1syf+OryFR9m
         ZRkLkZSUA3rsuZz8vr6HRx4Kt4Sm9A9G9Gz9e04I3MWa72nNNIzSSOzFFaAwtgH3Sp28
         +aZGtlpyFqUkiepvveofgsYd3GNVZMh3L4oVHZfgzksMXBikixozt5pZek/bElLaD1tr
         iSp53n0iZta+lPGaSBzBwBJHZ2coKUcj/FnXOdXewXjwOdtbUCzDfy1cRi/ItXv1KGnz
         g5Rw==
X-Gm-Message-State: ACrzQf2ucyYyLRZLIk3nCfDuMbC3Hdisrjt0L3Q/TfqwOcANj/90twri
        p+X2DVkF8hyVG0UhLMUVHIlm2A==
X-Google-Smtp-Source: AMsMyM5t1N5DGEHJvdbVXCFFu+XA100ABhAMc+3XBEiCqL4DImdyIuks4K6C5y/OeUYg0mFGzTn7eg==
X-Received: by 2002:a17:90a:4d08:b0:20b:25f6:3e30 with SMTP id c8-20020a17090a4d0800b0020b25f63e30mr1469078pjg.227.1668097847308;
        Thu, 10 Nov 2022 08:30:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a24-20020a170902b59800b001788ccecbf5sm11373668pls.31.2022.11.10.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:30:47 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:30:46 -0800
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: imx290_ctrl_init(): Error handling issues
Message-ID: <202211100830.1F097DC@keescook>
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

  Thu Oct 27 14:38:02 2022 +0300
    4c9c93cf8657 ("media: i2c: imx290: Create controls for fwnode properties")

Coverity reported the following:

*** CID 1527251:  Error handling issues  (CHECKED_RETURN)
drivers/media/i2c/imx290.c:1056 in imx290_ctrl_init()
1050     	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
1051     					   V4L2_CID_VBLANK, blank, blank, 1,
1052     					   blank);
1053     	if (imx290->vblank)
1054     		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
1055
vvv     CID 1527251:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "v4l2_ctrl_new_fwnode_properties" without checking return value (as is done elsewhere 9 out of 10 times).
1056     	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
1057     					&props);
1058
1059     	imx290->sd.ctrl_handler = &imx290->ctrls;
1060
1061     	if (imx290->ctrls.error) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527251 ("Error handling issues")
Fixes: 4c9c93cf8657 ("media: i2c: imx290: Create controls for fwnode properties")

Thanks for your attention!

-- 
Coverity-bot
