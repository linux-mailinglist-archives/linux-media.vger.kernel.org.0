Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827755FC2A7
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 11:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJLJHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 05:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJLJHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 05:07:01 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418D5632C
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 02:06:56 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 889142024E;
        Wed, 12 Oct 2022 12:06:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1665565611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fcmxb8oFRFyGg0UybLHlqNcOpbvuoUZeW7yuPgRC/N8=;
        b=EAa0vkK14DygIys+EwnWUtemIO+gJxNZr40a91NkYLKFMQwUxy8Y6hvjRL2HYHk6PUcDEM
        XP64Fa0QNN5LS98Ew5ia61g5sve/1rPg+sresGPJj5F3F3QSN90G1XFomq0c+p/SPgmo+K
        1n9mzgC9yajleondKWJxgf3Lnfg+F/E=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1F29F634C93;
        Wed, 12 Oct 2022 12:06:51 +0300 (EEST)
Date:   Wed, 12 Oct 2022 12:06:51 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible
 strings
Message-ID: <Y0aDq3qQb9y9IcOA@valkosipuli.retiisi.eu>
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
 <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
 <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
 <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org>
 <1679970e-a1db-3b6b-7170-2296c32fdff1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1679970e-a1db-3b6b-7170-2296c32fdff1@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1665565611; a=rsa-sha256; cv=none;
        b=laOVMrwwJjdimaJjhV15v8AwiRWyPwKaUN57DQmk6RcT5FcTaez8tQRVwo5D6Ws5ZtkUem
        a+bVAlf2GLd9Fm/ck52UH3E/tKqGPKXENNupTOa5/Px63k4AEelOktEhSGbzs89Lu9NrBH
        oHPiSyigADSvx0vMJSqwGc0/Ts8K12M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1665565611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fcmxb8oFRFyGg0UybLHlqNcOpbvuoUZeW7yuPgRC/N8=;
        b=otXpN4AhAL7144VJfrNhzEvYbOLJbOpUbYoiWoa31xAtn4Pwy5tF70ZkaCjrL/ACrGvVEq
        tkm0JW/v70ee+HCjAK2w6/r6Vag91XG66wqyBWtjekBCid+KUEUgC3O27gmnIxXHmTfs5o
        PXi3kt5zXO1IzzCVjg5uC+KPjoiBFKU=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Wed, Oct 12, 2022 at 01:56:19AM +0100, Bryan O'Donoghue wrote:
> On 22/09/2022 12:19, Bryan O'Donoghue wrote:
> > On 22/09/2022 12:16, Dave Stevenson wrote:
> > > It may*eventually*  work for all three parts, but isn't the time to
> > > add the compatible string at the point where it is actually compatible
> > > with the driver?
> > 
> > Yes. I forgot about the 0x477 chip id on your part.
> > 
> > I'm happy enough to drop 477 from the compat string or indeed to allow
> > 0x0477 as a valid chip identifier in imx412.
> > 
> > Sakari, what would you like to do ?
> > 
> > ---
> > bod
> 
> Right.
> 
> So I got myself the official rpi imx477 sensor and ran the imx412/imx577
> driver on the rpi 5.19.y tree
> 
> It looks like the rpi driver configures imx477 for two MIPI data-lanes,
> whereas upstream imx412 wants four MIPI data-lanes.
> 
> So already that means the imx412 config as-is won't work.
> 
> But, we do know these sensors are very very close.
> 
> I think the right medium term thing to do is try take in the majority of the
> imx477 code - including the various test modes, and resolutions and support
> for different MIPI data-lane configurations.
> 
> Its not clear to me that the imx412/imx577 and imx378/imx477 can genuinely
> live in the same codebase though.
> 
> Anyway I think adding imx477 to the imx412 driver should be considered out
> of scope pending answering most of those questions and getting the code to
> work.
> 
> Anyway that merging of rpi imx477 and upstream imx412/imx577 code feels like
> an entirely different series.
> 
> So I'll resend this series minus the imx477 bits.

I wonder if you saw my earlier reply... but this is certainly fine, too.

-- 
Sakari Ailus
