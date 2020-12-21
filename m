Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0392DFEB6
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 18:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgLURDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 12:03:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:57098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbgLURDK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 12:03:10 -0500
X-Gm-Message-State: AOAM533BFc3Gpu1IQyQoe7bRCwtUroWUm/1AwCbCa1KmlgkV6YomoUwL
        neab5Ozum1v4B7Y8FZApcAcF79o8aT426Y6J9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608570149;
        bh=sM2h0j23PeJTO6+PcsYlN9mlNfNiXmH7qyR3e9tb3wM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rOyb/DMq0Hh13z9j0QVStgXnrHF0eq62ty9SgCN1yggfbCmBQBM179JEgVHBuXCc1
         6heBkKX/VFo5/tCR3+72VGLfX6r9bW9HFPK4JNj5xcmRIshH9IRSwZAN/EvY5c33EF
         SV9JtIZzDM/eCsQ4FLaokPUNfoOsAGghICnE3onTepoPuKXeQ6UrhEAWnCw2KElr9V
         lTDLgPQ2eKQ5Cq8z77spGiyzltixVk+ojaSIc+xO8cdRrh1aOdJRTReQyoQCwFlMmX
         6Wpls3fpzTecfpOgFahmyDtBG/HOeb1whYQ6XupOaVjqitsJL4gmK8xoKzzSA+Fw/z
         89oHL0A0kNKHA==
X-Google-Smtp-Source: ABdhPJyqv5o//R7x196Z0J60E9ub+RYHgqamRUaGDALQ1v/tFOUnEqsnw8wdxZIIFVIvQXlwN1g3Xsu6Oag7LC3jWc8=
X-Received: by 2002:a05:622a:18d:: with SMTP id s13mr17492349qtw.306.1608570148922;
 Mon, 21 Dec 2020 09:02:28 -0800 (PST)
MIME-Version: 1.0
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com> <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
 <e2edc2e37b6905fd19ada4c212338c6978200fa5.camel@nxp.com> <CAL_JsqLcyUJWt_gc3B01C0Y+NC61ucYNA8j1jnxTs8U1kudM=Q@mail.gmail.com>
 <1e0b6178033c064b99546d09b4b3ef9dda3cb1ad.camel@nxp.com>
In-Reply-To: <1e0b6178033c064b99546d09b4b3ef9dda3cb1ad.camel@nxp.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 21 Dec 2020 10:02:17 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLCvAWQN=54Rp08bPxLjeXZKo5Pc1a=hoNBFjcGdLGvcg@mail.gmail.com>
Message-ID: <CAL_JsqLCvAWQN=54Rp08bPxLjeXZKo5Pc1a=hoNBFjcGdLGvcg@mail.gmail.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>, Vinod <vkoul@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Fabio Estevam <festevam@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 9:15 PM Liu Ying <victor.liu@nxp.com> wrote:
>
> Hi,
>
> On Fri, 2020-12-18 at 16:42 -0600, Rob Herring wrote:
> > On Thu, Dec 17, 2020 at 7:48 PM Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, 2020-12-17 at 12:50 -0600, Rob Herring wrote:
> > > > On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> > > > > This patch adds bindings for i.MX8qm/qxp pixel combiner.
> > > > >
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > ---
> > > > >  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160
> > > > > +++++++++++++++++++++
> > > > >  1 file changed, 160 insertions(+)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > > pixel-combiner.yaml
> > > > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your
> > > > patch:
> > > >
> > > > yamllint warnings/errors:
> > > >
> > > > dtschema/dtc warnings/errors:
> > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > pixel-combiner.example.dts:19:18: fatal error: dt-
> > > > bindings/clock/imx8-lpcg.h: No such file or directory
> > > >    19 |         #include <dt-bindings/clock/imx8-lpcg.h>
> > > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > make[1]: *** [scripts/Makefile.lib:342:
> > > > Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-
> > > > pixel-combiner.example.dt.yaml] Error 1
> > > > make[1]: *** Waiting for unfinished jobs....
> > > > make: *** [Makefile:1364: dt_binding_check] Error 2
> > > >
> > > > See
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fpatchwork.ozlabs.org%2Fpatch%2F1417599&amp;data=3D04%7C01%7Cvictor.liu%40n=
xp.com%7C96806e0ce6bc40c936fa08d8a3a64551%7C686ea1d3bc2b4c6fa92cd99c5c30163=
5%7C0%7C0%7C637439281816690986%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DCjyszb0al=
RE5z2OGKdZZEg5PQpH11U%2BGqVt6couCLGE%3D&amp;reserved=3D0
> > > >
> > > > This check can fail if there are any dependencies. The base for a
> > > > patch
> > > > series is generally the most recent rc1.
> > >
> > > This series can be applied to linux-next/master branch.
> >
> > I can't know that to apply and run checks automatically. I guessed
> > that reviewing this before sending, but I want it abundantly clear
> > what the result of applying this might be and it wasn't mentioned in
> > this patch.
> >
> > Plus linux-next is a base no one can apply patches to, so should you
> > be sending patches based on it? It's also the merge window, so maybe
>
> I sent this series based on drm-misc-next.  This series is applicable
> to linux-next/master, and may pass 'make dt_binding_check' there.

But to be clear, 'make dt_binding_check' would fail on drm-misc-next
until 5.11-rc1 is merged in. The drm-misc maintainers need to know
that.


> I'll mention dependencies in the future where similar situations
> appear. Thanks.
>
> BTW, does it make sense for the bot to additionaly try linux-next if
> needed?  Maybe, that'll be helpful?

Sure, and when I've got nothing else to do maybe I'll do that. Though
maintainers still need to know what the dependencies are. The real
solution here is to make 'base-commit' tags more common or required so
that neither scripts/bots nor humans have to guess what the base is.

Rob
