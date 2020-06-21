Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55368202B6E
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 17:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgFUPlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 11:41:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:34634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730295AbgFUPlZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 11:41:25 -0400
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A567A25200;
        Sun, 21 Jun 2020 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592754083;
        bh=pt9EqltqhqIdL1Hu3CMnRV03C2RmuWg9zM6Os2uCwuo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0R6nIVrts17+rIl1QxO6Ij3WOAV8/tjBQHJzizqj8s9yJ12jc6TzgdSvgmWHxeEQi
         O/Yfk/KgvpAP1vFVYsmMjC8CDDc0YdDOQr/Ar9T8+DjmwI7HhkUM7esZmWCvfIWLAn
         7/vBnLbGbFgZgg+peiLYuaMucCTeDVdYcB6Ckb14=
Received: by mail-ed1-f53.google.com with SMTP id w7so11604298edt.1;
        Sun, 21 Jun 2020 08:41:22 -0700 (PDT)
X-Gm-Message-State: AOAM533AkMhzwcqAQr++ud67ssDxg2GtLeCCfL2ePZs30MF5MnughZSO
        2j08/aTpm7E0C4N8+ym2Kg8WaIoJfXFmTtN70g==
X-Google-Smtp-Source: ABdhPJwB1l2AcFC1q0r1alwXgq6BeqoxY6vIObCuv6Iv10Tmyz9bhn6RpoC9rROTlnkfkTLQWyYmX7KXkxPzFQstajw=
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr13378239edr.271.1592754081082;
 Sun, 21 Jun 2020 08:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200410071723.19720-1-louis.kuo@mediatek.com>
 <20200410071723.19720-2-louis.kuo@mediatek.com> <CAAOTY_-=v4ZoPu63kPCUzGKyNFeV6S_=zM4P5_MAkrXB0b5Yew@mail.gmail.com>
 <d6776ac432794cb593c4db54b8a7a089@mtkmbs02n2.mediatek.inc>
 <CAAOTY__N-OYkONB8He_H8WVVJ_3MrquaR_khvwdPd2v_c2Di3w@mail.gmail.com>
 <b9d97a7357954ba3a71be764091c5c4d@mtkmbs02n2.mediatek.inc> <88b31742c8964131a655bc652517dd96@mtkmbs02n1.mediatek.inc>
In-Reply-To: <88b31742c8964131a655bc652517dd96@mtkmbs02n1.mediatek.inc>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Sun, 21 Jun 2020 23:41:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ZRSGrkUSH_Ej7JjRRyzp-rSPEjbtFAbaHkDGL-vn0Xg@mail.gmail.com>
Message-ID: <CAAOTY_8ZRSGrkUSH_Ej7JjRRyzp-rSPEjbtFAbaHkDGL-vn0Xg@mail.gmail.com>
Subject: Re: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "keiichiw@chromium.org" <keiichiw@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com> =E6=96=BC =
2020=E5=B9=B46=E6=9C=8821=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=883:4=
1=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Chun-Kuang,
>
> From phy doc, phy framework is only used to devices that use "external PH=
Y".
>
> But for MTK MT8183, all the modules, include mipi csi dphy(in sensor inte=
rface module), image processor, video codec, modem, etc.,
> are embedded in one chip.
>
> Namely, for MT8183, PHY functionality is embedded within controller,
> so I think it's not suitable to regard MTK MTK8183 mipi csi dphy as an in=
dependent phy device.
>
> What is your advice?

You think this SoC is only one device which has multiple functions
including csi dphy, image processor, video codec, etc., but I don't
think we should treat this SoC is just one device. In device tree, we
have define many devices in this SoC. We may have a sensor interface
device (the phy controller) and csi dphy device (the phy provider). I
think the register defined in mtk_seninf_rx_reg.h is controlled by csi
dphy device. Is it only about phy? If so, I think phy is independent
and not embedded. If not, please explain what's the other function in
mtk_seninf_rx_reg.h.

Regards,
Chun-Kuang.

>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> |           MT8183  phone SOC             |
> |        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         |
> |        |        MTK sensor         |     |
> |        |    interface module  |          |
> |        |        Internal PHY        |            |
> |        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         |
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>                       ^   ^   ^    ^
>                       |    |   |    |
>                   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>                  |     sensor       |
>                   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> In https://www.kernel.org/doc/Documentation/phy.txt
> This framework will be of use only to devices that use external PHY (PHY
> functionality is not embedded within the controller).
>
>
> BRs
> Louis
>
>
>
>
> -----Original Message-----
> From: Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7)
> Sent: Monday, April 13, 2020 9:40 PM
> To: Chun-Kuang Hu
> Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com; tf=
iga@chromium.org; keiichiw@chromium.org; Matthias Brugger; Mauro Carvalho C=
hehab; devicetree@vger.kernel.org; Sean Cheng (=E9=84=AD=E6=98=87=E5=BC=98)=
; srv_heupstream; Jerry-ch Chen (=E9=99=B3=E6=95=AC=E6=86=B2); Jungo Lin (=
=E6=9E=97=E6=98=8E=E4=BF=8A); Sj Huang (=E9=BB=83=E4=BF=A1=E7=92=8B); yuzha=
o@chromium.org; moderated list:ARM/Mediatek SoC support; zwisler@chromium.o=
rg; Christie Yu (=E6=B8=B8=E9=9B=85=E6=83=A0); Frederic Chen (=E9=99=B3=E4=
=BF=8A=E5=85=83); Linux ARM; linux-media@vger.kernel.org
> Subject: RE: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek se=
nsor interface driver
>
> Hi Chun-Kuang,
>
> You wrote:
> > I think the phy control part should be placed in drivers/phy/mediatek/.=
 In [1], device csis point to a device mipi_phy.
> > csis' driver is in [2], and mipi_phy's driver is in [3]
> >
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/arch/arm/boot/dts/exynos4.dtsi?h=3Dv5.6
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/drivers/media/platform/exynos4-is/mipi-csis.c?h=3Dv5.6
> > [3]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/drivers/phy/samsung/phy-exynos-mipi-video.c?h=3Dv5.6
>
> I understood your suggestion to let mipi-csi phy control part as a phy de=
vice and use devm_phy_get/phy_configure/phy_power_on/phy_power_off phy API =
to control it.
>
> I will try to revise it if feasible.
>
> BRs
> Louis
>
>
> -----Original Message-----
> From: Chun-Kuang Hu [mailto:chunkuang.hu@kernel.org]
> Sent: Monday, April 13, 2020 5:27 PM
> To: Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>; hans.verkuil@cisco.com; laur=
ent.pinchart+renesas@ideasonboard.com; tfiga@chromium.org; keiichiw@chromiu=
m.org; Matthias Brugger <matthias.bgg@gmail.com>; Mauro Carvalho Chehab <mc=
hehab@kernel.org>; devicetree@vger.kernel.org; Sean Cheng (=E9=84=AD=E6=98=
=87=E5=BC=98) <Sean.Cheng@mediatek.com>; srv_heupstream <srv_heupstream@med=
iatek.com>; Jerry-ch Chen (=E9=99=B3=E6=95=AC=E6=86=B2) <Jerry-ch.Chen@medi=
atek.com>; Jungo Lin (=E6=9E=97=E6=98=8E=E4=BF=8A) <jungo.lin@mediatek.com>=
; Sj Huang (=E9=BB=83=E4=BF=A1=E7=92=8B) <sj.huang@mediatek.com>; yuzhao@ch=
romium.org; moderated list:ARM/Mediatek SoC support <linux-mediatek@lists.i=
nfradead.org>; zwisler@chromium.org; Christie Yu (=E6=B8=B8=E9=9B=85=E6=83=
=A0) <christie.yu@mediatek.com>; Frederic Chen (=E9=99=B3=E4=BF=8A=E5=85=83=
) <Frederic.Chen@mediatek.com>; Linux ARM <linux-arm-kernel@lists.infradead=
.org>; linux-media@vger.kernel.org
> Subject: Re: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek se=
nsor interface driver
>
> Hi, Louis:
>
> Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com> =E6=96=
=BC 2020=E5=B9=B44=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=
=8810:04=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Chun-Kuang,
> >
> > The comment you mentioned,
> > I think the phy control part should be placed in drivers/phy/mediatek/.=
 In [1], device csis point to a device mipi_phy.
> > csis' driver is in [2], and mipi_phy's driver is in [3]
> >
> > I reply as below,
> > =3D>
> > Since Seninf module includes mipi-csi phy, top mux, mux ctrl parts,
> > combine all together into a v4l2-subdev linking with v4l2 sensor driver=
s and v4l2 ISP driver backward and forward to transmit and process image.
> >
>
> It  seems that seninf is a mfd or syscon device. MMSYS  [1] is a system c=
ontroller which control multiple functions. Its major driver is placed in [=
2], and its clock control function is placed in [3].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt?h=3Dn=
ext-20200413
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/drivers/soc/mediatek/mtk-mmsys.c?h=3Dnext-20200413
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/drivers/clk/mediatek/clk-mt8173-mm.c?h=3Dnext-20200413
>
> > The data lanes and port settings is configured by v4l2 sensor drivers,
> > For control reason, it's a better way to let seninf mipi-csi part
> > inside seninf v4l2-subdev rather than an independent phy device in
> > drivers/phy/mediatek
> >
> > There have similar design in omap4iss and Rkisp1-isp driver, they all i=
n staging step.
> > https://elixir.bootlin.com/linux/v5.6/source/drivers/staging/media/rki
> > sp1
> > https://elixir.bootlin.com/linux/v5.6/source/drivers/staging/media/oma
> > p4iss
>
> Staging driver means there are some things need to modify to move out of =
staging folder, so I think this is not a strong reason to keep phy control =
in drivers/media/ folder. You could move this driver to drivers/staging/med=
ia/ folder and I would have no comment about this.
>
> Regards,
> Chun-Kuang.
>
> >
> > BRs
> > Louis
> >
> > -----Original Message-----
> > From: Chun-Kuang Hu [mailto:chunkuang.hu@kernel.org]
> > Sent: Saturday, April 11, 2020 8:17 AM
> > To: Louis Kuo (=E9=83=AD=E5=BE=B7=E5=AF=A7) <louis.kuo@mediatek.com>
> > Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com;
> > tfiga@chromium.org; keiichiw@chromium.org; Matthias Brugger
> > <matthias.bgg@gmail.com>; Mauro Carvalho Chehab <mchehab@kernel.org>;
> > devicetree@vger.kernel.org; Sean Cheng (=E9=84=AD=E6=98=87=E5=BC=98)
> > <Sean.Cheng@mediatek.com>; srv_heupstream
> > <srv_heupstream@mediatek.com>; Jerry-ch Chen (=E9=99=B3=E6=95=AC=E6=86=
=B2)
> > <Jerry-ch.Chen@mediatek.com>; Jungo Lin (=E6=9E=97=E6=98=8E=E4=BF=8A)
> > <jungo.lin@mediatek.com>; Sj Huang (=E9=BB=83=E4=BF=A1=E7=92=8B) <sj.hu=
ang@mediatek.com>;
> > yuzhao@chromium.org; moderated list:ARM/Mediatek SoC support
> > <linux-mediatek@lists.infradead.org>; zwisler@chromium.org; Christie
> > Yu (=E6=B8=B8=E9=9B=85=E6=83=A0) <christie.yu@mediatek.com>; Frederic C=
hen (=E9=99=B3=E4=BF=8A=E5=85=83)
> > <Frederic.Chen@mediatek.com>; Linux ARM
> > <linux-arm-kernel@lists.infradead.org>; linux-media@vger.kernel.org
> > Subject: Re: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek
> > sensor interface driver
> >
> > Hi, Louis:
> >
> > Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:18=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > This patch adds Mediatek's sensor interface driver. Sensor interface
> > > driver is a MIPI-CSI2 host driver, namely, a HW camera interface
> > > controller. It support a widely adopted, simple, high-speed protocol
> > > primarily intended for point-to-point image and video transmission
> > > between cameras and host devices. The mtk-isp directory will contain
> > > drivers for multiple IP blocks found in Mediatek ISP system. It will
> > > include ISP Pass 1 driver, sensor interface driver, DIP driver and fa=
ce detection driver.
> > >
> > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > ---
> > >  drivers/media/platform/Makefile               |    1 +
> > >  drivers/media/platform/mtk-isp/Kconfig        |   18 +
> > >  drivers/media/platform/mtk-isp/Makefile       |    3 +
> > >  .../media/platform/mtk-isp/seninf/Makefile    |    5 +
> > >  drivers/media/platform/mtk-isp/seninf/TODO    |   18 +
> > >  .../platform/mtk-isp/seninf/mtk_seninf.c      | 1173 +++++++++++++
> > >  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++=
++
> > >  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        | 1398 +++++++++++++++=
+
> > >  8 files changed, 4107 insertions(+)  create mode 100644
> > > drivers/media/platform/mtk-isp/Kconfig
> > >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/seninf/TODO
> > >  create mode 100644
> > > drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
> > >  create mode 100644
> > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
> > >  create mode 100644
> > > drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
> > >
> >
> > [snip]
> >
> > > +
> > > +static void mtk_seninf_set_dphy(struct mtk_seninf *priv, unsigned
> > > +int
> > > +seninf) {
> > > +       void __iomem *pmipi_rx_base =3D priv->csi2_rx[CFG_CSI_PORT_0]=
;
> > > +       unsigned int port =3D priv->port;
> > > +       void __iomem *pmipi_rx =3D priv->csi2_rx[port];
> > > +       void __iomem *pmipi_rx_conf =3D priv->base + 0x1000 * seninf;
> > > +
> > > +       /* Set analog phy mode to DPHY */
> > > +       if (is_cdphy_combo(port))
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A, RG_CSI0A_C=
PHY_EN, 0);
> > > +       /* 4D1C: MIPIRX_ANALOG_A_BASE =3D 0x00001A42 */
> > > +       if (is_4d1c(port)) {
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L0_CKSEL, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L1_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L1_CKSEL, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L2_CKMODE_EN, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L2_CKSEL, 1);
> > > +       } else {/* MIPIRX_ANALOG_BASE =3D 0x102 */
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L0_CKSEL, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L1_CKMODE_EN, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L1_CKSEL, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                           RG_CSI0A_DPHY_L2_CKSEL, 0);
> > > +       }
> > > +       if (is_cdphy_combo(port))
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > + RG_CSI0B_CPHY_EN, 0);
> > > +
> > > +       /* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE =3D 0x000012=
42 */
> > > +       if (is_4d1c(port)) {
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L0_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L0_CKSEL, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L1_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L1_CKSEL, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L2_CKSEL, 1);
> > > +       } else {/* MIPIRX_ANALOG_BASE =3D 0x102 */
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L0_CKSEL, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L1_CKMODE_EN, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L1_CKSEL, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_DPHY_L2_CKSEL, 0);
> > > +       }
> > > +       /* Byte clock invert */
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> > > +                   RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT, 1);
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> > > +                   RG_CSI0A_DPHY_L1_BYTECK_INVERT, 1);
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> > > +                   RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT, 1);
> > > +
> > > +       if (is_4d1c(port)) {
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> > > +                           RG_CSI0B_CDPHY_L0_T0_BYTECK_INVERT, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> > > +                           RG_CSI0B_DPHY_L1_BYTECK_INVERT, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> > > +                           RG_CSI0B_CDPHY_L2_T1_BYTECK_INVERT, 1);
> > > +       }
> > > +
> > > +       /* Start ANA EQ tuning */
> > > +       if (is_cdphy_combo(port)) {
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> > > +                           RG_CSI0A_L0_T0AB_EQ_IS, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> > > +                           RG_CSI0A_L0_T0AB_EQ_BW, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> > > +                           RG_CSI0A_L1_T1AB_EQ_IS, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> > > +                           RG_CSI0A_L1_T1AB_EQ_BW, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> > > +                           RG_CSI0A_L2_T1BC_EQ_IS, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> > > +                           RG_CSI0A_L2_T1BC_EQ_BW, 1);
> > > +
> > > +               if (is_4d1c(port)) { /* 4d1c */
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> > > +                                   RG_CSI0B_L0_T0AB_EQ_IS, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> > > +                                   RG_CSI0B_L0_T0AB_EQ_BW, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> > > +                                   RG_CSI0B_L1_T1AB_EQ_IS, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> > > +                                   RG_CSI0B_L1_T1AB_EQ_BW, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> > > +                                   RG_CSI0B_L2_T1BC_EQ_IS, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> > > +                                   RG_CSI0B_L2_T1BC_EQ_BW, 1);
> > > +               }
> > > +       } else {
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> > > +                           RG_CSI1A_L0_EQ_IS, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> > > +                           RG_CSI1A_L0_EQ_BW, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> > > +                           RG_CSI1A_L1_EQ_IS, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> > > +                           RG_CSI1A_L1_EQ_BW, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> > > +                           RG_CSI1A_L2_EQ_IS, 1);
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> > > +                           RG_CSI1A_L2_EQ_BW, 1);
> > > +
> > > +               if (is_4d1c(port)) { /* 4d1c */
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> > > +                                   RG_CSI1B_L0_EQ_IS, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> > > +                                   RG_CSI1B_L0_EQ_BW, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> > > +                                   RG_CSI1B_L1_EQ_IS, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> > > +                                   RG_CSI1B_L1_EQ_BW, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> > > +                                   RG_CSI1B_L2_EQ_IS, 1);
> > > +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> > > +                                   RG_CSI1B_L2_EQ_BW, 1);
> > > +               }
> > > +       }
> > > +
> > > +       /* End ANA EQ tuning */
> > > +       writel(0x90, pmipi_rx_base + MIPI_RX_ANA40_CSI0A);
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0A,
> > > +                   RG_CSI0A_RESERVE, 0x40);
> > > +       if (is_4d1c(port))
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0B,
> > > +                           RG_CSI0B_RESERVE, 0x40);
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A,
> > > +                   CSR_CSI_RST_MODE, 0);
> > > +       if (is_4d1c(port))
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B,
> > > +                           CSR_CSI_RST_MODE, 0);
> > > +       /* ANA power on */
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                   RG_CSI0A_BG_CORE_EN, 1);
> > > +       if (is_4d1c(port))
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_BG_CORE_EN, 1);
> > > +       usleep_range(20, 40);
> > > +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> > > +                   RG_CSI0A_BG_LPF_EN, 1);
> > > +       if (is_4d1c(port))
> > > +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> > > +                           RG_CSI0B_BG_LPF_EN, 1);
> > > +
> > > +       udelay(1);
> > > +       /* 4d1c: MIPIRX_CONFIG_CSI_BASE =3D 0xC9000000; */
> > > +       if (is_4d1c(port)) {
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN0_MUX, 1);
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN1_MUX, 2);
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN2_MUX, 0);
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN3_MUX, 3);
> > > +       } else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE =3D 0xE4000000; */
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN0_MUX, 0);
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN1_MUX, 1);
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN2_MUX, 2);
> > > +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> > > +                           CSI0_BIST_LN3_MUX, 3);
> > > +       }
> > > +}
> >
> > I think the phy control part should be placed in drivers/phy/mediatek/.=
 In [1], device csis point to a device mipi_phy.
> > csis' driver is in [2], and mipi_phy's driver is in [3]
> >
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/arch/arm/boot/dts/exynos4.dtsi?h=3Dv5.6
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/drivers/media/platform/exynos4-is/mipi-csis.c?h=3Dv5.6
> > [3]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/drivers/phy/samsung/phy-exynos-mipi-video.c?h=3Dv5.6
> >
> > Regards,
> > Chun-Kuang.
