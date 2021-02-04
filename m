Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F36231007B
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 00:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhBDXHA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 18:07:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhBDXG6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 18:06:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E14A64D9D;
        Thu,  4 Feb 2021 23:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612479977;
        bh=2yrQoi07tSr3GqEztnm6rCdEQC9o4rSjgEng2ClYQak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LgO4ASIb40EkgS5QUIrz31ZXO+KtNJO2DVty+vGFXrR25WNxSEfhpqgoDnW0Sc57M
         +Okydb53JOlHovRe3gN96g8AAslzWF7U37VQg0HN9Ez81TcDR1OqShEnNRQiMsBqMN
         0W10WBbhbPnqDUEbOgOt8QhlexG4IWMkMnbdKLkg1IyuaoDIv2opvy3hgMcehd0uyS
         8iR1HPvmJ5beUeU1koXRIuo1Dhu9hZ3PDLszFoft2jRmZtVUmpit0OQ3CvCqxOUB/k
         vlhvHVYsxhpNEz3Zo9s+DZl45xsyxY46dUw5kFvT8kN8lMB0CbeeZc2lmz1k1Jy+dP
         jPPC/e3SA9Ugg==
Received: by mail-ej1-f47.google.com with SMTP id hs11so8570181ejc.1;
        Thu, 04 Feb 2021 15:06:17 -0800 (PST)
X-Gm-Message-State: AOAM530tweY9P05wXLrWJgyXJ+faf8gpXs3zX4OJPV3R0S/eSi1ayXqt
        PqeJaemH/MhNV21g06ELEmC/obLtTzO0ZsLPAw==
X-Google-Smtp-Source: ABdhPJyPjFOTPT0jH+zG0qjs4Py4MMPiXwafYcoMdMZUPPpd+AV2YfCVLMo4epWY2VUqB7scUFvuB/IXyikfDLpQJwo=
X-Received: by 2002:a17:906:57cd:: with SMTP id u13mr1304383ejr.341.1612479975730;
 Thu, 04 Feb 2021 15:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20210203135441.136-1-martinax.krasteva@linux.intel.com>
 <20210203135441.136-2-martinax.krasteva@linux.intel.com> <1612452057.710530.452037.nullmailer@robh.at.kernel.org>
 <20210204161654.GC32460@paasikivi.fi.intel.com>
In-Reply-To: <20210204161654.GC32460@paasikivi.fi.intel.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 4 Feb 2021 17:06:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJDwtUQEe7RTaNsCkbLr+WO-RS5QuGsQwtAmmm5nkcw_Q@mail.gmail.com>
Message-ID: <CAL_JsqJDwtUQEe7RTaNsCkbLr+WO-RS5QuGsQwtAmmm5nkcw_Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: media: Add bindings for imx334
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Martina Krasteva <martinax.krasteva@linux.intel.com>,
        gjorgjix.rosikopulos@linux.intel.com, devicetree@vger.kernel.org,
        Daniele Alessandrelli <daniele.alessandrelli@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        paul.j.murphy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 10:17 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rob,
>
> On Thu, Feb 04, 2021 at 09:20:57AM -0600, Rob Herring wrote:
> > On Wed, 03 Feb 2021 13:54:40 +0000, Martina Krasteva wrote:
> > > From: Martina Krasteva <martinax.krasteva@intel.com>
> > >
> > > - Add dt-bindings documentation for Sony imx334 sensor driver.
> > > - Add MAINTAINERS entry for Sony imx334 binding documentation.
> > >
> > > Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> > > Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> > > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > > Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 90 ++++++++++++++++++++++
> > >  MAINTAINERS                                        |  8 ++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/media/i2c/sony,imx334.example.dts:28.17-18 syntax error
> > FATAL ERROR: Unable to parse input tree

That's usually a missing header for #defines.

> > make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/media/i2c/sony,imx334.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1370: dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1435383
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit.
>
> Thanks for reporting this. The example was apparently missing the
> assigned-clock-parents property. I'll squash the following change to the
> patch:

Doubtful. That would be a more specific schema error.

>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> index 3145e94d043e7..4217fbea0735a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -76,6 +76,7 @@ examples:
>              clocks = <&imx334_clk>
>
>              assigned-clocks = <&imx334_clk>;
> +            assigned-clock-parents = <&imx334_clk_parent>;
>              assigned-clock-rates = <24000000>;
>
>              port {
>
> --
> Kind regards,
>
> Sakari Ailus
