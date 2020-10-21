Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE1C294D2E
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 15:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442804AbgJUNGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 09:06:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441222AbgJUNGH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 09:06:07 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60723222C8;
        Wed, 21 Oct 2020 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603285566;
        bh=yThHWlWlCTYTIjGsLVR1OAyNrKAJhrn/n5hD0TCxUPw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rgB5wwOWuYehCtY/q9UGjTfVkSiv4Qtd80yGuii9sGSdCuAN2238FgIW4BGaFDjI6
         lK1ZH34XuK5KqpuHbXMXxq9eMVzzwilXl5o/PeEv6QurOT+y8b0HSkczxQGxJvRCqj
         97y+AKxUuYLMBkyibo04Gh0YDV9YHfkC2hiWbT4k=
Received: by mail-ot1-f47.google.com with SMTP id e20so1711743otj.11;
        Wed, 21 Oct 2020 06:06:06 -0700 (PDT)
X-Gm-Message-State: AOAM532AeMKAr1YbIq06u7qUKXitaEsp/IIWf1+1hZgfqqtSQ3pRvfW3
        3Xqut3yJQcrwGVvqliUvSgTwcjTJ78WVJqaBdg==
X-Google-Smtp-Source: ABdhPJw2qd4ZlYkKtjveqNUdgNMhkFrq6kd0piooLqgxNSLxC236c/uAYXR2DhukmLURaD3MXZ2SuxXFMMcmbOOgKC8=
X-Received: by 2002:a9d:1c90:: with SMTP id l16mr2567063ota.192.1603285565445;
 Wed, 21 Oct 2020 06:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201020091921.1730003-1-rmfrfs@gmail.com> <20201020091921.1730003-4-rmfrfs@gmail.com>
 <20201020153044.GA875273@bogus> <20201020185206.qst2uksgcy3axbnh@arch-thunder.localdomain>
In-Reply-To: <20201020185206.qst2uksgcy3axbnh@arch-thunder.localdomain>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 21 Oct 2020 08:05:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzvMj4WZz3N8wf=H8p3bZGo_vohWE9pdaSWwjxB5tDgQ@mail.gmail.com>
Message-ID: <CAL_JsqKzvMj4WZz3N8wf=H8p3bZGo_vohWE9pdaSWwjxB5tDgQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to yaml
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 1:52 PM Rui Miguel Silva <rmfrfs@gmail.com> wrote:
>
> Hi Rob Bot,
> On Tue, Oct 20, 2020 at 10:30:44AM -0500, Rob Herring wrote:
> > On Tue, 20 Oct 2020 10:19:21 +0100, Rui Miguel Silva wrote:
> > > Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> > > the textual document and update MAINTAINERS entry.
> > >
> > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > > ---
> > >  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
> > >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
> > >  MAINTAINERS                                   |   2 +-
> > >  3 files changed, 173 insertions(+), 91 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > ./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:91:21: [warning] wrong indentation: expected 22 but found 20 (indentation)
> > ./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:93:21: [warning] wrong indentation: expected 22 but found 20 (indentation)
>
> Strange not to complain on line 94 also.
>
> >
> >
> > See https://patchwork.ozlabs.org/patch/1384742
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> >
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> I have done this and I am at version:
> 2020.8.2.dev4+g341f3e35180a
>
> and still do not get any warning on this file. Nevertheless I
> found the indentation issue and will:

It's coming from yamllint which is recently added (this merge window)
and is optionally run if yamllint is present. Will clarify this in the
email.

Rob
