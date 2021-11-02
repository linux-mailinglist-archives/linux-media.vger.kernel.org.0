Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CC644302A
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 15:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhKBOVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 10:21:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhKBOVD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 10:21:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F0FB60EBB;
        Tue,  2 Nov 2021 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635862708;
        bh=qOB5WMuYpIlALms7I++ESh95onbe/bA+rU+eBx4I4Fk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XoaOYISZbEeWyK9tRWTR37Jsk9jurujng5wyY52op4eXUfcCf+18ChbrFncdxOMtn
         /X4LT6uiwNEODGWOWAguSLiN77hLLxuilaAkLyQS5cGL2d4LeR7kC7CUldM/mHxlDo
         Ablk9FJDhtacoW855I3V+EoIjNXFyuor2oo+2oiNMNdWzzawxKwoNe8wlz9M3tUrVY
         ywWhGSrHC8QLPqXO7KMLuzpvbRugzAL/UscJiOdsSNo8tj6bja4yLcZzLMzLzZ03rD
         Y7i30c5f0zdvjVFl3dmr/ph9FrHvrYQi2GnqUrd7VAmX14cGTgwKP2OpvF15BldLRn
         x6etj9G186fPA==
Received: by mail-ed1-f48.google.com with SMTP id ee33so5580536edb.8;
        Tue, 02 Nov 2021 07:18:28 -0700 (PDT)
X-Gm-Message-State: AOAM533n6jj3u4hxWRG81Sp1VmfRguO4xT5J29KfrM5rgUVp0Dq4TqKP
        YnyZFtxWMBjJH7WoctjT0PuWyuBUvHf5qiUiog==
X-Google-Smtp-Source: ABdhPJyEJB9X6BsjiuknIZKb6IX4uzR9u7dyWMAP44n4tWQU5OoekyF3SHDoYpgBBnNTB8O+nTrZ+jKoTTonAuttmlE=
X-Received: by 2002:a50:da06:: with SMTP id z6mr51404191edj.355.1635862706659;
 Tue, 02 Nov 2021 07:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211025103322.160913-1-robert.foss@linaro.org>
 <20211025103322.160913-2-robert.foss@linaro.org> <YYBOXQOXM8USks0G@robh.at.kernel.org>
 <CAG3jFytkHi06uaP8RFaS9cma68S9oz_AcAtkMxCrPKGXBTtfsA@mail.gmail.com>
In-Reply-To: <CAG3jFytkHi06uaP8RFaS9cma68S9oz_AcAtkMxCrPKGXBTtfsA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 2 Nov 2021 09:18:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+u6hwj+hzj54KCWNG4u=oOkysK9y_rTwJozmRiWBLNKA@mail.gmail.com>
Message-ID: <CAL_Jsq+u6hwj+hzj54KCWNG4u=oOkysK9y_rTwJozmRiWBLNKA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: dt-bindings: media: camss: Document
 clock-lanes property
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        "Gross, Andy" <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 2, 2021 at 6:49 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Mon, 1 Nov 2021 at 21:30, Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Oct 25, 2021 at 12:33:22PM +0200, Robert Foss wrote:
> > > The clock-lanes property corresponds to a hardware register field
> > > that is required to be set, in order to enable the CSI clock signal.
> > >
> > > The physical lane of the clock signal is not programmable, but only
> > > togglable On or Off, which what BIT(7) of the
> > > CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5) register controls.
> > >
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > >  .../devicetree/bindings/media/qcom,msm8996-camss.yaml        | 5 +++++
> > >  .../devicetree/bindings/media/qcom,sdm660-camss.yaml         | 5 +++++
> > >  .../devicetree/bindings/media/qcom,sdm845-camss.yaml         | 5 +++++
> > >  3 files changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> > > index 38be41e932f0..d4da1fad12cf 100644
> > > --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> > > +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> > > @@ -106,6 +106,11 @@ properties:
> > >
> > >              properties:
> > >                clock-lanes:
> > > +                description:
> > > +                  The index of the clock-lane is not programmable by
> > > +                  the hardware, but is required to define a CSI port.
> > > +                  Lane 7 reflects the hardware register field that enables
> > > +                  the clock lane.
> >
> > If it is fixed, then it should not be required. Fix the required part.
> >
> > >                  items:
> > >                    - const: 7
> >
> > I don't know how we let that in, but this should be the lane number.
> > Each binding can't be making up its own interpretation.
>
> If the clock lane number isn't programmable, can clock-lanes be omitted?

Yes, that would be the correct thing to do.

Rob
