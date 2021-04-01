Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA6B351E3A
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238036AbhDASgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:36:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237177AbhDASdC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Apr 2021 14:33:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9321E61380;
        Thu,  1 Apr 2021 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617293026;
        bh=DDIhjfi1qYB8lYEU5sQDnqU44QrMSPnvKKTG/wBTR7E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n4bXsarivhKfpiMewB/SYgLxl+04RZj+PyAZrMOUXcU6zn1PWAA9jQX5WZdpLmqPH
         dBUQaswpg1qgBbgH6FxTjjTSFGwbAy+XhvqNVrQxKINOwkyyHrfYIPT9looUFT9H3N
         GM5FVKr8mFYIcQ8wmMQcy3tOI07QMjTvHmv45ea5J0NPGYhQG9eSpoik3apcq58Iz+
         fSxSCpV+F26UwYK1Jj8FnUhwuYpSQGPlmvKA6dP512/Itee7gcB6OHC5ZoKHIlDdM3
         XYqTIWNwO+QI1i5hlc0GOmW0GUYwGCkKtNlvzSe/xwIBNsAZookBPqwlrn8PMVySgC
         2N0SS0M9EHXyw==
Received: by mail-qk1-f170.google.com with SMTP id q3so2626324qkq.12;
        Thu, 01 Apr 2021 09:03:46 -0700 (PDT)
X-Gm-Message-State: AOAM533YWvRc38gFT8HNVRaeeTRY3bSb8N8MAt5sPsN3KAOaYiOhYuo7
        D0P9qOtsyZ1+xjpcI8G6UoVceDTg5japknTalg==
X-Google-Smtp-Source: ABdhPJwStHNYRy9pgsQh1o9wi8mUMc2/tEoZKnUVOsAiW6sjyZapwKzFBK6eZuazIzCCFNH9ne/QODq+UTX+o2r/Nm8=
X-Received: by 2002:a37:6592:: with SMTP id z140mr9203928qkb.464.1617293025609;
 Thu, 01 Apr 2021 09:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
 <1617172405-12962-8-git-send-email-victor.liu@nxp.com> <1617198059.605916.2074860.nullmailer@robh.at.kernel.org>
 <2e6b0bdd03da30446448e86eff69182e417ce43f.camel@nxp.com>
In-Reply-To: <2e6b0bdd03da30446448e86eff69182e417ce43f.camel@nxp.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 1 Apr 2021 11:03:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLn5simeQ20jHhvdWn54DdkVHJf-f1Q4ij-1ff=vHpi-w@mail.gmail.com>
Message-ID: <CAL_JsqLn5simeQ20jHhvdWn54DdkVHJf-f1Q4ij-1ff=vHpi-w@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
To:     Liu Ying <victor.liu@nxp.com>
Cc:     David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>, Vinod <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 1, 2021 at 4:18 AM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Wed, 2021-03-31 at 08:40 -0500, Rob Herring wrote:
> > On Wed, 31 Mar 2021 14:33:18 +0800, Liu Ying wrote:
> > > This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v6->v7:
> > > * Add Rob's R-b tag.
> > >
> > > v5->v6:
> > > * Drop 'select' schema. (Rob)
> > >
> > > v4->v5:
> > > * Newly introduced in v5. (Rob)
> > >
> > >  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
> > >  1 file changed, 192 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/pxl2dpi: failed to match any schema with compatible: ['fsl,imx8qxp-pxl2dpi']
> > Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/ldb: failed to match any schema with compatible: ['fsl,imx8qxp-ldb']
> > Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/phy@56228300: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-dphy']
> >
>
> Sorry for the errors.
> But, my patch passes 'make dt_binding_check' locally upon
> v5.12-rc1-dontuse at least.
> My yamllint and dt-schema are up to date.
>
> Does your bot _additionally_ check all compatibles in example?
> I guess I missed something?

Yes, it now adds 'DT_CHECKER_FLAGS=-m' which is new and pending in
linux-next. It's off by default until we get rid of the ~90 existing
cases.

Rob
