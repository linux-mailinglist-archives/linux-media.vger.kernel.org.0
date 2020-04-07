Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809CE1A0868
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgDGHf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:35:29 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46228 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgDGHf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 03:35:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id 111so726188oth.13;
        Tue, 07 Apr 2020 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fid1QYCY0NO/I6cTp/weYurLiEg0cFhCN05hyqNgj/o=;
        b=XJrU1YiGYXObCCyXMEpQZnKbbwe1ZMgGBITvdVL8yqcS5c4ABjNgv1qZ5t/y9cw1F8
         MsAAVIWLcQQ8q6DRSVEp6ovppqqwycPJ9VisN7GDYbtZfqjNpNOWgfnac39+vNq+GqHr
         DULGIjG0ANLz3tIsKU4xd3dR0PrSm/4vbFXWQN6POY1r40YiFRZSprxg0UweJmKdQaps
         TS21+MlgxJ9bz9czec7CBhYaH+YRzenE/DJ+JRbXLYVnFS9LPdxhQAtfN+nDIGbZ9+no
         dva2d+fT/l2uXBMFoA2YBFZoc3FnekN5iwPVOMlUVjsZlYPTg+9bGkMGhSeGq6HTV/yL
         eAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fid1QYCY0NO/I6cTp/weYurLiEg0cFhCN05hyqNgj/o=;
        b=AtlrFnODiReNrwCPTE525ASig/uFtSPAu3f9qDFf2awcZT54AHmHGjlPmkpzlcwe/Y
         tQwyHJX8707V1hEAljkNMup0S3TWUiRf+Vx7AWz8XPpH1bNi8VMqWpLwUUawfsMZSFV5
         Q7QAx2pjE2GPPrDdBHB+dUhvjAg6MDOB0rsWNsqk314VWJzTU2yph0kbznIac5nAtUnQ
         5RxTqS5OqmHCOxsfjazSH+CNFOTPA/BwPqn5POdPLSTDXhprlnmaWGZjrGpPcVMsvO7O
         Cl+qAxB0P18IDGaV37YlUQsqMHxII4LQ5lvqyldmrEnmJltXXc3X5zWDkmjlZXQYNT0T
         zqeg==
X-Gm-Message-State: AGi0PuZpFNM4J9+tqib7PriJga/Qb1i8Ox+/tk43x4wGbA5cRfm+Zgzd
        YzXbXqxywouzgMMVf2Q4E53oaJ/Xu0U/e99giOs=
X-Google-Smtp-Source: APiQypLI0T3PwqTnxtxkqJnxwE8QGxknf0jO+EhxS8l79ny0FYLhK6MNtO3r7HSPV1qbh6C45cOjMeY+tdBR+PB/R0k=
X-Received: by 2002:a9d:ef6:: with SMTP id 109mr474840otj.43.1586244928446;
 Tue, 07 Apr 2020 00:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200406173002.GC16885@pendragon.ideasonboard.com>
In-Reply-To: <20200406173002.GC16885@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 7 Apr 2020 08:35:02 +0100
Message-ID: <CA+V-a8sROBQpYvaP8TJ9fGYqOXT+uFsKhjnVBh0hZ2qS7yLQiQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: media: i2c: Deprecate usage of
 the clock-frequency property
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Mon, Apr 6, 2020 at 6:30 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Apr 06, 2020 at 05:42:37PM +0100, Lad Prabhakar wrote:
> > OV5645 sensor supports input clock frequency ranging from 6MHz to 27MHz
> > but the driver strictly expects this to be 24MHz (with tolerance of 1%)
> > with this restrictions let the driver enforce the clock frequency
>
> Maybe s/with/With/ ?
>
OK will fix it next version.

Cheers,
--Prabhakar

> > internally to 24MHz rather then being passed as dt-property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > index 72ad992f77be..a55bb728ea48 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > @@ -8,7 +8,6 @@ Required Properties:
> >  - compatible: Value should be "ovti,ov5645".
> >  - clocks: Reference to the xclk clock.
> >  - clock-names: Should be "xclk".
> > -- clock-frequency: Frequency of the xclk clock.
> >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> >    to the hardware pin PWDNB which is physically active low.
> >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > @@ -37,7 +36,6 @@ Example:
> >
> >                       clocks = <&clks 200>;
> >                       clock-names = "xclk";
> > -                     clock-frequency = <24000000>;
> >
> >                       vdddo-supply = <&camera_dovdd_1v8>;
> >                       vdda-supply = <&camera_avdd_2v8>;
>
> --
> Regards,
>
> Laurent Pinchart
