Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD736246F8
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 17:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbiKJQ35 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 11:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbiKJQ3x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 11:29:53 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF40326E8
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:29:51 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id z26so2683660pff.1
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcXH6Vt33GxwZBuT5fCQRkG1btWPwZFrvkneEWSWAi0=;
        b=K8fMLELqunNuap2rQETCi4hiGDOEp8hQZ+Xd/v0aaEwPBG2lA7yib2r64eIN9YtXBU
         wyBt7I3XJfZz7COwgXVamiB2xvP9jCACoUDTKzLwHY20SBXp3t0OsKljQpakRyx7I1rt
         ZjSEoTh//+vYtRih7UQ0qL/96sfWxgAXeFOXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcXH6Vt33GxwZBuT5fCQRkG1btWPwZFrvkneEWSWAi0=;
        b=JfCqrjnQuFSdmHsPK/FlReD3hgFC5FB/M9BaHwuAnSiSxhKt3SS1c5JD+2D+Pgu8i+
         z+LCm4HCdZ1nIo3JhP5zJ9W3F/QxDxMrpKLeHRCu8Kxv4HOb9KHdmU1+0UsdXHcwQ0CJ
         iCpbC6hZtg7/VmDgSOz4445T9YXv6MY9C5yQGfy9SfOtFzrUDMWUn4OoJx4XCn2LMDKp
         aoG27Is9x3c/DeKhGs5ir8Dn6GXOyarhi0wFrAcJvvhACSG0hZMvbAhNCcGkzSlt1ISh
         nACMVT2gxJEd40E0e6Od49r8XZjqNfQwAzZdbw8ZZq71l5WLL8yCotgcRHqo2o+RWv0x
         /NZw==
X-Gm-Message-State: ACrzQf0ofZQWtkALhvDzYqb3wjxgck2QGSQk+BkW3Y3rGjzgh3YE2qrV
        lYxO2HpKT9VqtTuNIU3MjBZIqw==
X-Google-Smtp-Source: AMsMyM5Gb8qmdynq8X34VKOPchjMOH8PyQwZKAw2DuIl20lEKTxFjOSh0FWe88DzE8J5uluSJ4LaKA==
X-Received: by 2002:aa7:90ca:0:b0:56d:d08c:baf0 with SMTP id k10-20020aa790ca000000b0056dd08cbaf0mr2941846pfk.72.1668097790624;
        Thu, 10 Nov 2022 08:29:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mi3-20020a17090b4b4300b0020d3662cc77sm3264327pjb.48.2022.11.10.08.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:29:50 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 10 Nov 2022 08:29:49 -0800
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
Subject: Coverity: vgxy61_configure(): Control flow issues
Message-ID: <202211100829.0E15D0E@keescook>
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

*** CID 1527253:  Control flow issues  (NO_EFFECT)
drivers/media/i2c/st-vgxy61.c:1579 in vgxy61_configure()
1573     	/* Frequency to data rate is 1:1 ratio for MIPI */
1574     	sensor->data_rate_in_mbps = sensor_freq;
1575     	/* Video timing ISP path (pixel clock)  requires 804/5 mhz = 160 mhz */
1576     	sensor->pclk = sensor_freq / 5;
1577
1578     	line_length = vgxy61_read_reg(sensor, VGXY61_REG_LINE_LENGTH);
vvv     CID 1527253:  Control flow issues  (NO_EFFECT)
vvv     This less-than-zero comparison of an unsigned value is never true. "line_length < 0".
1579     	if (line_length < 0)
1580     		return line_length;
1581     	sensor->line_length = line_length;
1582     	vgxy61_write_reg(sensor, VGXY61_REG_EXT_CLOCK, sensor->clk_freq, &ret);
1583     	vgxy61_write_reg(sensor, VGXY61_REG_CLK_PLL_PREDIV, prediv, &ret);
1584     	vgxy61_write_reg(sensor, VGXY61_REG_CLK_SYS_PLL_MULT, mult, &ret);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527253 ("Control flow issues")
Fixes: 153e4ad44d60 ("media: i2c: Add driver for ST VGXY61 camera sensor")

Thanks for your attention!

-- 
Coverity-bot
