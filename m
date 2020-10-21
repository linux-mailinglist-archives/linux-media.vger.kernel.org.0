Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AC32953A4
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 22:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505520AbgJUUvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 16:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505515AbgJUUvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 16:51:14 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72545C0613CE;
        Wed, 21 Oct 2020 13:51:13 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e17so4536157wru.12;
        Wed, 21 Oct 2020 13:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FgxhUD02c/xYovXfydIbXjUJaRV+G+vpW2pE3oaVlJw=;
        b=QESSSmiDd2vM8yLaF3qB6SeYC9e/M9UvddRdTU+1Bgr/HzpycnrtPmGbjQNMctJJ3h
         wGNzCs9JSQRHhl+EbAvcE/uKiORyefG39vLW4v6n3KSWm9bNAFFUuMxk4QFun3Cijr1o
         s8SvKFE216/aJsS5Y1nGRX9v97mdIQ/Ta+T6FcHNBuHy5A6mtTYuHalEL5rpywfG/FTk
         odXBNLlS4PENthIoG+ekZxcHmEiQaNwZk0jNDS9MQ0D36zAy7JTRwejuVVqE+PTV1K1R
         LxDAYe8aF6UI2AxHxlFgegUMTs3l1/ePFIaLezCKi7XUevV7AuDav51v/LQBVUm9HXDI
         OxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FgxhUD02c/xYovXfydIbXjUJaRV+G+vpW2pE3oaVlJw=;
        b=gLvPZm9waVue3LLuJEKydh64wuX6JlHVpCcrGTILR/KsHGqxfKFUAKeHiDlTpq073R
         c63g/drsOXMYGk18vO7tVhGdskNrkrLU9RK990nDziNFpCwO6V4B/kadveO8ipd/rP0U
         J9z6GN4Qta5nHq7lUNHnCzZ5FCIRkhnDKdlTenWwFhyPK+hbdVUgm/j1CPbPaI6iJVTg
         mxLQZu33FUaCSBT8Ck6Wuht7spQvmn+QhM1078loYUTqr5F29E5hCBYn7n4KPccpejZh
         iicSV9gf0yQfHyUOhvotOp3xWwmkBKodaldqVdt14Wv0pUAf4Ha4Hn4+oQ9nO3LMBj87
         bH2A==
X-Gm-Message-State: AOAM531CNXvMc9EXmYVe5XPbPdQUtNOf6VhOy6ifHIv7IXwuBDzCYVdf
        gJqorUzce3Q8Wv8KncSu5IY=
X-Google-Smtp-Source: ABdhPJxxn6Svk4YyzRPkXggAogLMbnp4GF40t4QTnAcBwtPeNZHRtBAb4KLFknjMSrsdUd5cZ8srNQ==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr6342089wro.136.1603313472107;
        Wed, 21 Oct 2020 13:51:12 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id p9sm5001726wma.12.2020.10.21.13.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 13:51:11 -0700 (PDT)
Date:   Wed, 21 Oct 2020 21:51:08 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201021205108.jjmxk6p62cou3rjm@arch-thunder.localdomain>
References: <20201020091921.1730003-1-rmfrfs@gmail.com>
 <20201020091921.1730003-4-rmfrfs@gmail.com>
 <20201020153044.GA875273@bogus>
 <20201020185206.qst2uksgcy3axbnh@arch-thunder.localdomain>
 <CAL_JsqKzvMj4WZz3N8wf=H8p3bZGo_vohWE9pdaSWwjxB5tDgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKzvMj4WZz3N8wf=H8p3bZGo_vohWE9pdaSWwjxB5tDgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,
On Wed, Oct 21, 2020 at 08:05:53AM -0500, Rob Herring wrote:
> On Tue, Oct 20, 2020 at 1:52 PM Rui Miguel Silva <rmfrfs@gmail.com> wrote:
> >
> > Hi Rob Bot,
> > On Tue, Oct 20, 2020 at 10:30:44AM -0500, Rob Herring wrote:
> > > On Tue, 20 Oct 2020 10:19:21 +0100, Rui Miguel Silva wrote:
> > > > Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> > > > the textual document and update MAINTAINERS entry.
> > > >
> > > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > > > ---
> > > >  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
> > > >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
> > > >  MAINTAINERS                                   |   2 +-
> > > >  3 files changed, 173 insertions(+), 91 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > > >
> > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > ./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:91:21: [warning] wrong indentation: expected 22 but found 20 (indentation)
> > > ./Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml:93:21: [warning] wrong indentation: expected 22 but found 20 (indentation)
> >
> > Strange not to complain on line 94 also.
> >
> > >
> > >
> > > See https://patchwork.ozlabs.org/patch/1384742
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure dt-schema is up to date:
> > >
> > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > I have done this and I am at version:
> > 2020.8.2.dev4+g341f3e35180a
> >
> > and still do not get any warning on this file. Nevertheless I
> > found the indentation issue and will:
> 
> It's coming from yamllint which is recently added (this merge window)
> and is optionally run if yamllint is present. Will clarify this in the
> email.

Got it, thanks for the explanation.

------
Cheers,
     Rui
