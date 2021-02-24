Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF7C324147
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 17:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236040AbhBXPpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 10:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbhBXOy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 09:54:26 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C9FC06178B
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 06:53:46 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id q20so1469702pfu.8
        for <linux-media@vger.kernel.org>; Wed, 24 Feb 2021 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BI8tzk0bTa3w11ruMEPTU8t0ne9enBgfWEJ0ImBJsEA=;
        b=TA1T8dIkRQrmL+2z52ArQzQ7YLPMbNMS4BPXwoDyQjWviLUJUKtXfvJGJ4XPCUBD8h
         rH8V6ApP6uBZzAmVkSZ8jXs9X9htA7atNy2ULoie9NF/lIJq5+JHVlI9GiMexLgUdh5Z
         sExX4j++PBMz/d+qA1BcquZniW252SvKL523Fsio6++OZjQ6GIZKJELdKA9qyYRq6uiH
         UsblNSPu7hXwgPkWJgP4MIzg2oeBMuru4QF8OFhM6IJedYHUqiDrHW8qScPfyiqNvVOq
         6uaxjXI4/SfKUpgmMmnt7bspJknb5Q49aHQktZRQ/hgjdYY6GBNO22DULKmaFt7cdH8K
         fiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BI8tzk0bTa3w11ruMEPTU8t0ne9enBgfWEJ0ImBJsEA=;
        b=LnGtAHBwc+fxTbziZIIYEVRPeiucNgyXkrcvfqn9Cgah0rpe6JbcOD/8TDm9dY+/uw
         7s3UB6CXQ+5cZzmBOhXNo0V3hgf8f8dQAaMOsueRtDTAg7+rUhjjm8xbE0L9i2LWna3A
         zdhrnbx8KAUXsJv3dMTUf95nQNMoX/kH/PzvsJjBOvY3REy2gw/Q0hEzqCMLMpDcazo0
         +zHGy3fBxUjaGWmu9lvh+KbBJs5ZgkyWLdF3dl1GyXq6J7clK35Plc4W/yQZvoWFp+At
         +oKYGuAu9AaRPr4Awc4ZUV2fuC0AgpUXewSgffz/dIMBMBG5TRDsNaYpUGRL0TeqWOmT
         MOzA==
X-Gm-Message-State: AOAM5312Pg3FLn54e0ubJL0KoiFZDAof8t2D9pbeds3yt/y4WKdmy2GB
        MOLt9Qdch+7Zz/UBUAIZGVZeLOIAqH9g5PbO2bUODw==
X-Google-Smtp-Source: ABdhPJwrgFEiH2Ascm/wxKiYFBShzYRAAgGfjnPMoJbqNsWJxHoZMh+ezqbCWJloaKg6y2qCJ+oWOWWROotNI+bu2WE=
X-Received: by 2002:aa7:9281:0:b029:1ec:48b2:811c with SMTP id
 j1-20020aa792810000b02901ec48b2811cmr32041815pfa.18.1614178425423; Wed, 24
 Feb 2021 06:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-13-robert.foss@linaro.org> <32b2cd1d-e41a-4571-ac4f-4ec055b3f6cb@linaro.org>
In-Reply-To: <32b2cd1d-e41a-4571-ac4f-4ec055b3f6cb@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 24 Feb 2021 15:53:34 +0100
Message-ID: <CAG3jFysEkRNXsaXudXd9msLPU3RiFcPpAgS6ecbOjeVfdwpb4A@mail.gmail.com>
Subject: Re: [PATCH v5 12/22] media: camss: Remove per VFE power domain toggling
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Andrey,

>
> On 17.02.2021 14:21, Robert Foss wrote:
> > For Titan ISPs clocks fail to re-enable during vfe_get()
> > after any vfe has been halted and its corresponding power
> > domain power has been detached.
>
> OK.
>
> > Since all of the clocks depend on all of the PDs, per
> > VFE PD detaching is no option for this generation of HW.
>
> But this patch removes camss_pm_domain_on/off calls from
> vfe_get/put() for all the SOCs, not only for sdm845.
> And this looks like a regression (higher power consumption)
> for all the generation1 devices.

Yeah, that is a serious problem with the approach I picked here. The
power difference shouldn't be huge however, since the best case
scenario savings of the previous implementation was being able to
power down 1 VFE when the other one is working. If none of the VFEs is
working, nothing is powered up both in the previous implementation &
using this patch.

>
> Is it possible to handle gen1 and gen2 hardware differently,
> so that gen1 continued to use camss_pm_domain_on/off as
> before?

I hesitated going down this gen1/gen2 split here, due to how deep into
the common code some of this functionality is. Let me have another
look at this though, not having a power regression for gen1 devices
would definitely be preferable.
