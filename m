Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7378B6A48A0
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 18:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjB0Rw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 12:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjB0Rwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 12:52:55 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D674F23C4E
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 09:52:48 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id z5so4439598ilq.0
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 09:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgxzdQk91nCoP5cbkOKiShALxdT0poXbSpe6eSbYkcs=;
        b=A2NAVW/mURaF6sKXgzNSoCKN04YJX0FCmUCNyOnZzopuZ2ijOF2+nI4ZFropG0GLc7
         uIKJEcen7uAv6rFt60wx5QzHLkvoPwznBcZEa56SCOLdj0BKAVZ0mQ+cnsdUcA9Cr1m6
         mr+H+g9kKjMo9/Dbq5cOg4k+Dta6vz2rYAjQZS4ckFVh4W8swjZA1mShxD32kl9hIPnb
         h2p/HY22PW4tVpUm8KMUyiO4q6jpALu6EGjuJT9pCWb13RqiX9AP2ZV00q7lSNBUf/Vr
         L6ZB9mAWwD1Dc1SKWk7ZrIMs1AJGUv0TyYK7je9wou7l+N22QFJi+51cg0h1rgt/5gT4
         pSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgxzdQk91nCoP5cbkOKiShALxdT0poXbSpe6eSbYkcs=;
        b=jzogNiNSmRZE6xTGcjwYbEPNPj+PJGmPWDn2DXwCUoiDntda0ZFl/0qk67bi49wiY8
         VSilraXP/LIKp/KSgB8iJ1ljUNXoxISp+B915vepXy8UD5f9auUNoFTVyWfDGnClBcGI
         vOi6xRKPX74quT8qxl+ETxdyGjeLZ9CqgBNOZjXzlmvkDHvjyDFmWmMQ7Enj8KTP1NnU
         kjxRV2DosYJdxfSqmd5EDaP526vZf4Te8u/o+ADuwg/cZVBSvGl1ELpwX8dYfcEyp5h8
         YiGdeNcNX171YCV2hU/Xn18MmdBMf2NlrMrrLyG/rqBTdbvNSZVWyga6f0T3mfRxEvE3
         4MOw==
X-Gm-Message-State: AO0yUKVSUOBniAophLN7Q/rbuM7HGrCQ66WaE5SYaTz7HGlxwmi9CNxA
        WRkRwu8Q0yhSwTWohnURv2o=
X-Google-Smtp-Source: AK7set97+2Bw24OiIofrkoG9SvhO4ABgsPUxpdUOxtBlHrFgGbL7zorIr5G1pLb6D3CcnNwzaGdPYQ==
X-Received: by 2002:a05:6e02:152a:b0:315:6fc5:ea46 with SMTP id i10-20020a056e02152a00b003156fc5ea46mr315300ilu.2.1677520368195;
        Mon, 27 Feb 2023 09:52:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p6-20020a92d686000000b0031598e2c6f4sm2163017iln.36.2023.02.27.09.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 09:52:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 27 Feb 2023 09:52:45 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        regressions@lists.linux.dev
Subject: Re: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM
 before subdev
Message-ID: <20230227175245.GA3728693@roeck-us.net>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
 <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, Jan 16, 2023 at 04:44:51PM +0200, Laurent Pinchart wrote:
> Initializing the subdev before runtime PM means that no subdev
> initialization can interact with the runtime PM framework. This can be
> problematic when modifying controls, as the .s_ctrl() handler commonly
> calls pm_runtime_get_if_in_use(). These code paths are not trivial,
> making the driver fragile and possibly causing subtle bugs.
> 
> To make the subdev initialization more robust, initialize runtime PM
> first.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

This patch results in

Error log:
<stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
drivers/media/i2c/imx290.c:1090:12: error: 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
 1090 | static int imx290_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/imx290.c:1082:12: error: 'imx290_runtime_resume' defined but not used [-Werror=unused-function]
 1082 | static int imx290_runtime_resume(struct device *dev)

if PM runtime support is disabled( alpha:allmodconfig, csky:allmodconfig,
and others).

Guenter

---
#regzbot ^introduced 02852c01f6540
#regzbot title Build error in drivers/media/i2c/imx290.c if PM support is disabled

---
# bad: [f3a2439f20d918930cc4ae8f76fe1c1afd26958f] Merge tag 'rproc-v6.3' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
# good: [116b41162f8b267987ea9a73eb7e73eaa7c2cce5] Merge tag 'probes-v6.3-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
git bisect start 'HEAD' '116b41162f8b'
# good: [d4563201f33a022fc0353033d9dfeb1606a88330] Documentation: simplify and clarify DCO contribution example language
git bisect good d4563201f33a022fc0353033d9dfeb1606a88330
# bad: [bca7822cbc76b22572faf2e17ca9517b68ebeb3e] media: atomisp: ov2680: Drop MAX_FMTS define
git bisect bad bca7822cbc76b22572faf2e17ca9517b68ebeb3e
# bad: [27e45f2e59c9db2c83ed67775e911c8a3c776db2] media: ti: omap4iss: Use media_pipeline_for_each_entity()
git bisect bad 27e45f2e59c9db2c83ed67775e911c8a3c776db2
# good: [8a54644571fed484d55b3807f25f64cba8a9ca77] media: subdev: Require code change to enable [GS]_ROUTING
git bisect good 8a54644571fed484d55b3807f25f64cba8a9ca77
# good: [8508455961d5a9e8907bcfd8dcd58f19d9b6ce47] media: i2c: imx219: Split common registers from mode tables
git bisect good 8508455961d5a9e8907bcfd8dcd58f19d9b6ce47
# good: [10591fe63691bd8199d5e7244029cc065959ffc9] media: i2c: imx290: Rename, extend and expand usage of imx290_pixfmt
git bisect good 10591fe63691bd8199d5e7244029cc065959ffc9
# bad: [e14d3ac81bd2264edc76bf5796305b2dfea44487] media: i2c: Add driver for OmniVision OV8858
git bisect bad e14d3ac81bd2264edc76bf5796305b2dfea44487
# bad: [7d399658f7c666ead4bc3dbe88944bb8ea7746ca] media: i2c: imx290: Configure data lanes at start time
git bisect bad 7d399658f7c666ead4bc3dbe88944bb8ea7746ca
# bad: [02852c01f65402e2fe4a8a5fe5a0b641f245b529] media: i2c: imx290: Initialize runtime PM before subdev
git bisect bad 02852c01f65402e2fe4a8a5fe5a0b641f245b529
# good: [a8c3e0c1bf1e97b5ee094951ed0f1e57e3b378c7] media: i2c: imx290: Use runtime PM autosuspend
git bisect good a8c3e0c1bf1e97b5ee094951ed0f1e57e3b378c7
# first bad commit: [02852c01f65402e2fe4a8a5fe5a0b641f245b529] media: i2c: imx290: Initialize runtime PM before subdev
