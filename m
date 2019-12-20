Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63771280F3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 17:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfLTQw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 11:52:59 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:42089 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLTQw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 11:52:59 -0500
Received: by mail-io1-f68.google.com with SMTP id n11so3320432iom.9;
        Fri, 20 Dec 2019 08:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndHzsNMeOrrxjTjbncU3QaDZ3rrlbXY6z57guIALSrc=;
        b=O3SUifF2KdavJEOmR+c7IFeapv5LO67FDptELAjawFJpV/ZRMjaJWbp7dOEflCzZiN
         Mww++8bwxW6qsJ6LwMGjWWagaDaZFgft1At9n2MvBZfYhSScJR9Liit/tFx54+3tlYGg
         ePHQAZSXAbIJRsBVJY+P7erLP7q6nWmnO9ffttbDfi+GxvlwrpGPkiIrQ9sJ8KapdM05
         PLcdbDTmbyhPAWoPKpz9FYrTNNLUa+VtIYpkKsN4fr0sj9bzcTvjnmLSsjTOW9lZqj8L
         YhLByHoVecmF0sMsvGlk480DrR5mmOIIfel+PjGahuSgh8UFXef55BK4y0bgVCESZs6k
         N0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndHzsNMeOrrxjTjbncU3QaDZ3rrlbXY6z57guIALSrc=;
        b=rXcjv+5jv41thqFttHApIEf4hviDx0heMEk/CMWUikE8g+nK39rSZna2jOIbtbs7pu
         dcz/ovlwLcPbamYfo+GOhDYaGM+YEzSzN/cKj7VPBJ+i5tollv91PrsIJqAWKww13UZF
         gM+QtgSNWemjfbEonTCio9n/TxSThBjV0ICBTtctefQXjfaK3HetQFp9nua320KqZ2+Z
         cPk0yBnpKO3v4bxWGnr5R7EI4SFBhbFtxJuGaf/1qCJ2CEjhsIkniKSEYgfIemNx4aA8
         NmfkMWL7SMc1x4TVKyuBXByjL1pYigl0rsReNGHDNHBAGD7IRxV7ErnW/gQ/jcMnSQYJ
         IfoA==
X-Gm-Message-State: APjAAAU3SUj0jzGmi7LB4LH8rMMxksKjmXOFA/LiVVBfDhvPFNL005bP
        +hV4ZXXtXdrVqYqEvXK+mokN8T4br0vsfSrLuTY=
X-Google-Smtp-Source: APXvYqw3N9lze1UCJupGScpsgHgYH4lkik2+KjpGxrR1N9odwIYIxfVR708G/MdkSwn23Y2DsEnLB/OXCx5b+qSFM6Y=
X-Received: by 2002:a02:3409:: with SMTP id x9mr12957487jae.3.1576860778063;
 Fri, 20 Dec 2019 08:52:58 -0800 (PST)
MIME-Version: 1.0
References: <20190612093915.18973-1-p.zabel@pengutronix.de>
 <20190612093915.18973-9-p.zabel@pengutronix.de> <20190709142555.GA14360@bogus>
In-Reply-To: <20190709142555.GA14360@bogus>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 20 Dec 2019 10:52:41 -0600
Message-ID: <CAHCN7xJCGu1-XzJkqgxeMAbdSbBrVbeRC=nysHmUCQZ_Myf-qA@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] media: dt-bindings: Document i.MX8MQ and i.MX8MM
 VPU bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>,
        devicetree <devicetree@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 9, 2019 at 9:26 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 12, 2019 at 11:39:13AM +0200, Philipp Zabel wrote:
> > Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ
> > and for the Hantro G1/G2/H1 VPU on i.MX8MM.
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Are there any updates to this?  It would be nice to have the VPU
working in the mainline, but it seems to have stalled.

adam
> > ---
> >  .../devicetree/bindings/media/imx8m-vpu.txt   | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/imx8m-vpu.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/imx8m-vpu.txt b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> > new file mode 100644
> > index 000000000000..659bd28dd002
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/imx8m-vpu.txt
> > @@ -0,0 +1,56 @@
> > +device-tree bindings for Hantro G1/G2/H1 VPU codecs implemented on i.MX8M SoCs
> > +
> > +Required properties:
> > +- compatible: value should be one of the following
> > +             "nxp,imx8mq-vpu",
> > +             "nxp,imx8mm-vpu";
> > +- regs: VPU core and control block register ranges
> > +- reg-names: should be
> > +             "g1", "g2", "ctrl" on i.MX8MQ,
> > +             "g1", "g2", "h1", "ctrl" on i.MX8MM.
>
> Would be nicer to put h1 at the end, so the indexes don't change.
>
> > +- interrupts: encoding and decoding interrupt specifiers
> > +- interrupt-names: should be
> > +             "g1", "g2" on i.MX8MQ,
> > +             "g1", "g2", "h1" on i.MX8MM.
> > +- clocks: phandle to VPU core clocks and bus clock
> > +- clock-names: should be
> > +             "g1", "g2", "bus" on i.MX8MQ,
> > +             "g1", "g2", "h1", "bus" on i.MX8MM.
>
> Here too.
>
> > +- power-domains: phandle to power domain node
> > +
> > +Examples:
> > +
> > +     vpu: vpu@38300000 {
>
> video-codec@...
>
> > +             compatible = "nxp,imx8mq-vpu";
> > +             reg = <0x38300000 0x10000>,
> > +                   <0x38310000 0x10000>,
> > +                   <0x38320000 0x10000>;
> > +             reg-names = "g1", "g2", "ctrl";
> > +             interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names = "g1", "g2";
> > +             clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> > +                      <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> > +                      <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > +             clock-names = "g1", "g2", "bus";
> > +             power-domains = <&pgc_vpu>;
> > +     };
> > +
> > +     vpu: vpu@38300000 {
>
> Are 2 examples really necessary?
>
> > +             compatible = "nxp,imx8mm-vpu";
> > +             reg = <0x38300000 0x10000>,
> > +                   <0x38310000 0x10000>,
> > +                   <0x38320000 0x10000>;
> > +                   <0x38330000 0x10000>;
> > +             reg-names = "g1", "g2", "h1", "ctrl";
> > +             interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > +                          <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names = "g1", "g2", "h1";
> > +             clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> > +                      <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> > +                      <&clk IMX8MQ_CLK_VPU_H1_ROOT>,
> > +                      <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> > +             clock-names = "g1", "g2", "h1", "bus";
> > +             power-domains = <&pgc_vpu>;
> > +     };
> > --
> > 2.20.1
> >
