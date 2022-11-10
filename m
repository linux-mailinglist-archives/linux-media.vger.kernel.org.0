Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E70624701
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 17:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiKJQbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 11:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbiKJQbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 11:31:07 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720D63C6C7
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:31:06 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id q1so2297496pgl.11
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHV7YPr9JVGRqimq0/XTfGZHFU2zON878TIWSyVcdN4=;
        b=ocAfayas3CucZnGBLz67T0GV4EvMZCOVs84ZNv8zOq/8d6rIAr+zRpMUyshVWEEqct
         +OOEQtQzfXF9dJR8Dg+bCUT0NnVS9Ky7PofihD712rNjAZPCSiasE3R8gQaHE2rNqGj7
         h0hXKazRhij2k5XMEKA/H2xdMTdPwaU5uqR5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHV7YPr9JVGRqimq0/XTfGZHFU2zON878TIWSyVcdN4=;
        b=jqGl94U9iSQZH4aaJcY/MO4Uprj0bfdRoKd62jwPj08pRgcuqxZ9ht7Ae3m2trnLyn
         gdVdKBziFEcG8jC3RqMstLuKDYERgD/wGclmLO3qMbBUAHDEUF417Ulbh94+WVc6IVYs
         gIFwYRLJsUsfuS+fwHA9MqByEaln1hKULiDcldFOAOw0Yu4bV9tjKS6+YoIfPB+0WWca
         sr38Guh11Ku/9yTZDrXWo3zbrJnTvxbi1nNQDGsC5C6Nth/1wK7JVTYAGhV4OX4TNE5k
         yowbq0Jw3oirhY7G4ee3CmjrA4wYloyKWlYjUbByXW4471HrcW6hYkQ2ERX+bGMCrEbT
         QTFQ==
X-Gm-Message-State: ACrzQf1UmGyGLqJGAzVo47JwKqBmhLNdjPtTU7r3aArScgTm0h9y1a/v
        qyabmkNRff7lebXQ+GkBtqLeOA==
X-Google-Smtp-Source: AMsMyM65vpv0+AQ/wf/JQArw6n7uBXTF2xfIGXQfxReptL+Zc4dcq9BVUaZcixV00BYO4ILRu+0ang==
X-Received: by 2002:a65:5386:0:b0:46e:dbd3:413 with SMTP id x6-20020a655386000000b0046edbd30413mr54264289pgq.240.1668097865917;
        Thu, 10 Nov 2022 08:31:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709029b8b00b00178b6ccc8a0sm11427103plp.51.2022.11.10.08.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:31:05 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:31:04 -0800
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Shawn Tu <shawnx.tu@intel.com>, linux-media@vger.kernel.org,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: vgxy61_patch(): Control flow issues
Message-ID: <202211100831.8C6B603B6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

  Thu Oct 27 14:37:38 2022 +0300
    153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Coverity reported the following:

*** CID 1527250:  Control flow issues  (NO_EFFECT)
drivers/media/i2c/st-vgxy61.c:1626 in vgxy61_patch()
1620
1621     	ret = vgxy61_poll_reg(sensor, VGXY61_REG_STBY, 0, VGXY61_TIMEOUT_MS);
1622     	if (ret)
1623     		return ret;
1624
1625     	patch = vgxy61_read_reg(sensor, VGXY61_REG_FWPATCH_REVISION);
vvv     CID 1527250:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "patch < 0".
1626     	if (patch < 0)
1627     		return patch;
1628
1629     	if (patch != (VGXY61_FWPATCH_REVISION_MAJOR << 12) +
1630     		     (VGXY61_FWPATCH_REVISION_MINOR << 8) +
1631     		     VGXY61_FWPATCH_REVISION_MICRO) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527250 ("Control flow issues")
Fixes: 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Thanks for your attention!

-- 
Coverity-bot
