Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4029B212D08
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 21:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGBTTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 15:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGBTTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 15:19:15 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9DAC08C5C1;
        Thu,  2 Jul 2020 12:19:15 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id k7so14540519vso.2;
        Thu, 02 Jul 2020 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sSQZOmgfnB0TinkXCmMYitLBpu9IP0IwuwNOkwSSNRQ=;
        b=LTLz7S+9JYYrl7gAeKULKuvz4fByOJqVZc9Lnp3H/6mLPvykkzWPOvDEJpsQtK3zHL
         IkU4R8qId10V7AJrSVFJQC2viN52z6fp1Q2uJFiP8r2rF5ZHidvKDA2isIbN4P0JBdM6
         C9Ot6yszwbnu4JJ1Q4eF3+3fVplPMrF7FgozHOfoVgXGMB9dX0NSbRwhnj6uarSvOfKu
         +06bLmfqDKmSxbLT2MBds243nT2sJiOSvzqoOqVZkp25n3a41IEOyw3qYDY7gQcH9c4M
         hCqVyQXfXdrxOSPYamFbxTDSRPRNymn7pGQwIPrIXAvHmWT7+OscDBPP2pAaH81Tp6AI
         ScYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sSQZOmgfnB0TinkXCmMYitLBpu9IP0IwuwNOkwSSNRQ=;
        b=uQAV2lddyXjIP4IdwHA515RPxd1loyTlopJ4LotuFCfeHzjc54yPpqhzXVvL8ebg4S
         2vkoZo3mtj6QHHWgZ4IMuBucg2ynbnVLkp30zfNu8W03JYJzspMDcJ/bMe+66OgQF88B
         0DypY4UOaFR8o1+E3QkLwd+dd7NOZfe1hGgYQtYq45zJ4hVtd2YNPVA9fZ202wkiGz/5
         PbdRws/EkCQjq6XFLkv7mlgkMDVEEsCMO14vAZtKqASNXE8M9TzKDIx3rOhwckEw8/HD
         CEOqFFLoBLBsygvgPk5dSSueLaLgw8wwTbCMWIDnXghb6mBXNge2dZLdOImnsokXOhYn
         AuZQ==
X-Gm-Message-State: AOAM533xUK0CWaUrVUVF6NGBC+j1ElV/vfQLB/Cqf5b+v/fU0zOalQj7
        H9sSrYXOYipQuiLtN9q4R+0tfrPZ2Hg+giJNmAM=
X-Google-Smtp-Source: ABdhPJwbHJiPszzePZx02Se2JJsHRD157+pFw2h/oiwVLuxWEiDrUoRLhRAtWVysuMsu9kLlQMgfTnsONbU0ulpT1R0=
X-Received: by 2002:a67:87cc:: with SMTP id j195mr7608475vsd.25.1593717554819;
 Thu, 02 Jul 2020 12:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <karthik.poduval@gmail.com> <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com> <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
 <CAFP0Ok-NxDDF8TMP4pN=xn6w3H=TYqN3DMfGW-vuiC5qB-Oj5g@mail.gmail.com>
 <CAFP0Ok9XGzVbghbnOOyfXiOOc5-a94uFRu7sD5wXz9sr-+AYEA@mail.gmail.com>
 <9407b6c3-b932-5904-18ff-7c6cbf6bcc8b@gmail.com> <ec0e43f0-95af-c0b0-c51b-ea2db4194931@collabora.com>
 <34801fe8-cc4f-ed52-674d-ee291f508e05@arm.com> <1598ce27-2456-aaa6-0984-080fed778312@koikeco.de>
In-Reply-To: <1598ce27-2456-aaa6-0984-080fed778312@koikeco.de>
From:   karthik poduval <karthik.poduval@gmail.com>
Date:   Thu, 2 Jul 2020 12:19:03 -0700
Message-ID: <CAFP0Ok-cba3S+bSOf72VwWzye-mbcbOFizTKzuwgw+_4gsHbrQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Helen Koike <helen@koikeco.de>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Helen Koike <helen.koike@collabora.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Rob Herring <robh@kernel.org>, heiko@sntech.de,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I like the suggestion from Robin, drivers care about board clock
categories and don't need to specify the SoC specific clocks. But it
still looks like we are putting a union of all clocks based on current
and future versions of the ISP IP in the yaml. Is it necessary to list
them out at all ? Can't driver's simply get them from the device tree
as indexes instead of names using "of_clk_get". In that case does the
dts yaml need to check for the number of clocks per SoC variant ?

--
Regards,
Karthik Poduval

On Thu, Jul 2, 2020 at 12:17 PM Helen Koike <helen@koikeco.de> wrote:
>
> Hi Robin,
>
> On 7/2/20 2:32 PM, Robin Murphy wrote:
> > On 2020-07-02 17:27, Helen Koike wrote:
> > [...]
> >> I suggest this:
> >>
> >>    clocks:
> >>      maxItems: 5
> >>      minItems: 3
> >>      description:
> >>        rk3288 clocks
> >>          ISP clock
> >>          ISP AXI clock
> >>          ISP AHB clock
> >>          ISP Pixel clock
> >>          ISP JPEG source clock
> >>        rk3399 isp0 clocks
> >>          ISP clock
> >>          ISP AXI wrapper clock
> >>          ISP AHB wrapper clock
> >>        rk3399 isp1 clocks
> >>          ISP clock
> >>          ISP AXI wrapper clock
> >>          ISP AHB wrapper clock
> >>          ISP Pixel wrapper clock
> >>
> >>    clock-names:
> >>      oneOf:
> >>        # rk3288 clocks
> >>        - items:
> >>          - const: clk_isp
> >>          - const: aclk_isp
> >>          - const: hclk_isp
> >>          - const: pclk_isp_in
> >>          - const: sclk_isp_jpe
> >>        # rk3399 isp0 clocks
> >>        - items:
> >>          - const: clk_isp
> >>          - const: aclk_isp_wrap
> >>          - const: hclk_isp_wrap
> >>        # rk3399 isp1 clocks
> >>        - items:
> >>          - const: clk_isp
> >>          - const: aclk_isp_wrap
> >>          - const: hclk_isp_wrap
> >>          - const: pclk_isp_wrap
> >
> > FWIW this looks a little more involved than it might need to be. Ideall=
y we're describing things from the point of view of what inputs the device =
itself wants, so the details of exactly *how* a particular SoC's clock tree=
 delivers them shouldn't matter to the binding, only to the actual clock sp=
ecifier values ultimately given in the DT.
> >
> > From the ISP's PoV, it seems like we've got the fairly standard core cl=
ock, ACLK and HCLK trio, plus a pixel clock for RK3288 and RK3399 ISP1, plu=
s a JPEG source clock for RK3288. I'd be inclined to model that as simply s=
omething like:
> >
> >     clock-names:
> >       minItems: 3
> >       maxItems: 5
> >       items:
> >       - const: isp
> >       - const: aclk
> >       - const: hclk
> >       - const: pclk
> >       - const: sclk_jpe
> >
> > Plus then not only do we have a nice clean binding, but we avoid all th=
e unnecessary faff of having to deal with the "same" clocks by different na=
mes in drivers, and sidestep the conundrum of what to do when the next SoC =
comes along providing the basic ISP clocks from yet again slightly-differen=
tly-named branches of its clock tree.
>
> I agree this is cleaner, thanks for this suggestions, I just submitted a =
new version
> following this https://patchwork.linuxtv.org/project/linux-media/list/?se=
ries=3D2844
>
> Thanks
> Helen
>
> >
> > Robin.



--=20
Regards,
Karthik Poduval
