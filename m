Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 761E81A4CC4
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 02:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDKAQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 20:16:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgDKAQ5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 20:16:57 -0400
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C90952084D;
        Sat, 11 Apr 2020 00:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586564217;
        bh=kOTfAdWoxGPt+Pg4t+RzeUZoBiHqIBV3wszehwL5Fmc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uLmtjTjHStlIlBf796CnjhrrTFs9zoO8k3NZQ0JMZAkpSAWWQoNCdHfm7DqgPNS/1
         Y9quCve/LfGW0o8YiH6lLg0yLV432ok8PHtF1V/5ta0lnUkY/hf2QNxhnphRr9oBBq
         gq6WNyxeDggFLoeKxtJYcz7sjnvxs41G//1qFrnY=
Received: by mail-ed1-f53.google.com with SMTP id e5so4328856edq.5;
        Fri, 10 Apr 2020 17:16:56 -0700 (PDT)
X-Gm-Message-State: AGi0PuZi6W4eixjCkDbgApW42pp+Q8mU1yUbfBtF8Qaf4okKUpyNhQ2x
        9VCUxyhmGDencWR0muuuA50+S8VudGiKyelNWA==
X-Google-Smtp-Source: APiQypIqU52AEeQOx9g5Z/gUAqL+lQxRxcsb52JmppFM8dV1tU8n/AnikWop5a9k2DEC7wTXwijhT5rNlXEL91Wwfh8=
X-Received: by 2002:a05:6402:335:: with SMTP id q21mr7024879edw.47.1586564215179;
 Fri, 10 Apr 2020 17:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200410071723.19720-1-louis.kuo@mediatek.com> <20200410071723.19720-2-louis.kuo@mediatek.com>
In-Reply-To: <20200410071723.19720-2-louis.kuo@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Sat, 11 Apr 2020 08:16:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-=v4ZoPu63kPCUzGKyNFeV6S_=zM4P5_MAkrXB0b5Yew@mail.gmail.com>
Message-ID: <CAAOTY_-=v4ZoPu63kPCUzGKyNFeV6S_=zM4P5_MAkrXB0b5Yew@mail.gmail.com>
Subject: Re: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, keiichiw@chromium.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
        srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, zwisler@chromium.org,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Louis:

Louis Kuo <louis.kuo@mediatek.com> =E6=96=BC 2020=E5=B9=B44=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch adds Mediatek's sensor interface driver. Sensor interface driv=
er
> is a MIPI-CSI2 host driver, namely, a HW camera interface controller. It
> support a widely adopted, simple, high-speed protocol primarily intended =
for
> point-to-point image and video transmission between cameras and host
> devices. The mtk-isp directory will contain drivers for multiple IP block=
s
> found in Mediatek ISP system. It will include ISP Pass 1 driver, sensor i=
nterface
> driver, DIP driver and face detection driver.
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/mtk-isp/Kconfig        |   18 +
>  drivers/media/platform/mtk-isp/Makefile       |    3 +
>  .../media/platform/mtk-isp/seninf/Makefile    |    5 +
>  drivers/media/platform/mtk-isp/seninf/TODO    |   18 +
>  .../platform/mtk-isp/seninf/mtk_seninf.c      | 1173 +++++++++++++
>  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
>  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        | 1398 ++++++++++++++++
>  8 files changed, 4107 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/TODO
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.=
h
>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_r=
eg.h
>

[snip]

> +
> +static void mtk_seninf_set_dphy(struct mtk_seninf *priv, unsigned int se=
ninf)
> +{
> +       void __iomem *pmipi_rx_base =3D priv->csi2_rx[CFG_CSI_PORT_0];
> +       unsigned int port =3D priv->port;
> +       void __iomem *pmipi_rx =3D priv->csi2_rx[port];
> +       void __iomem *pmipi_rx_conf =3D priv->base + 0x1000 * seninf;
> +
> +       /* Set analog phy mode to DPHY */
> +       if (is_cdphy_combo(port))
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A, RG_CSI0A_CPHY_=
EN, 0);
> +       /* 4D1C: MIPIRX_ANALOG_A_BASE =3D 0x00001A42 */
> +       if (is_4d1c(port)) {
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L0_CKSEL, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L1_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L1_CKSEL, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L2_CKMODE_EN, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L2_CKSEL, 1);
> +       } else {/* MIPIRX_ANALOG_BASE =3D 0x102 */
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L0_CKSEL, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L1_CKMODE_EN, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L1_CKSEL, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                           RG_CSI0A_DPHY_L2_CKSEL, 0);
> +       }
> +       if (is_cdphy_combo(port))
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B, RG_CSI0B_CPHY_=
EN, 0);
> +
> +       /* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE =3D 0x00001242 *=
/
> +       if (is_4d1c(port)) {
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L0_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L0_CKSEL, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L1_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L1_CKSEL, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L2_CKSEL, 1);
> +       } else {/* MIPIRX_ANALOG_BASE =3D 0x102 */
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L0_CKSEL, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L1_CKMODE_EN, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L1_CKSEL, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_DPHY_L2_CKSEL, 0);
> +       }
> +       /* Byte clock invert */
> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +                   RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +                   RG_CSI0A_DPHY_L1_BYTECK_INVERT, 1);
> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +                   RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +
> +       if (is_4d1c(port)) {
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +                           RG_CSI0B_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +                           RG_CSI0B_DPHY_L1_BYTECK_INVERT, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +                           RG_CSI0B_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +       }
> +
> +       /* Start ANA EQ tuning */
> +       if (is_cdphy_combo(port)) {
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +                           RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +                           RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +                           RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +                           RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +                           RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +                           RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +
> +               if (is_4d1c(port)) { /* 4d1c */
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +                                   RG_CSI0B_L0_T0AB_EQ_IS, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +                                   RG_CSI0B_L0_T0AB_EQ_BW, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +                                   RG_CSI0B_L1_T1AB_EQ_IS, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +                                   RG_CSI0B_L1_T1AB_EQ_BW, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +                                   RG_CSI0B_L2_T1BC_EQ_IS, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +                                   RG_CSI0B_L2_T1BC_EQ_BW, 1);
> +               }
> +       } else {
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +                           RG_CSI1A_L0_EQ_IS, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +                           RG_CSI1A_L0_EQ_BW, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +                           RG_CSI1A_L1_EQ_IS, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +                           RG_CSI1A_L1_EQ_BW, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +                           RG_CSI1A_L2_EQ_IS, 1);
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +                           RG_CSI1A_L2_EQ_BW, 1);
> +
> +               if (is_4d1c(port)) { /* 4d1c */
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +                                   RG_CSI1B_L0_EQ_IS, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +                                   RG_CSI1B_L0_EQ_BW, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +                                   RG_CSI1B_L1_EQ_IS, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +                                   RG_CSI1B_L1_EQ_BW, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> +                                   RG_CSI1B_L2_EQ_IS, 1);
> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> +                                   RG_CSI1B_L2_EQ_BW, 1);
> +               }
> +       }
> +
> +       /* End ANA EQ tuning */
> +       writel(0x90, pmipi_rx_base + MIPI_RX_ANA40_CSI0A);
> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0A,
> +                   RG_CSI0A_RESERVE, 0x40);
> +       if (is_4d1c(port))
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0B,
> +                           RG_CSI0B_RESERVE, 0x40);
> +       SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A,
> +                   CSR_CSI_RST_MODE, 0);
> +       if (is_4d1c(port))
> +               SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B,
> +                           CSR_CSI_RST_MODE, 0);
> +       /* ANA power on */
> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                   RG_CSI0A_BG_CORE_EN, 1);
> +       if (is_4d1c(port))
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_BG_CORE_EN, 1);
> +       usleep_range(20, 40);
> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +                   RG_CSI0A_BG_LPF_EN, 1);
> +       if (is_4d1c(port))
> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +                           RG_CSI0B_BG_LPF_EN, 1);
> +
> +       udelay(1);
> +       /* 4d1c: MIPIRX_CONFIG_CSI_BASE =3D 0xC9000000; */
> +       if (is_4d1c(port)) {
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN0_MUX, 1);
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN1_MUX, 2);
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN2_MUX, 0);
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN3_MUX, 3);
> +       } else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE =3D 0xE4000000; */
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN0_MUX, 0);
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN1_MUX, 1);
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN2_MUX, 2);
> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +                           CSI0_BIST_LN3_MUX, 3);
> +       }
> +}

I think the phy control part should be placed in
drivers/phy/mediatek/. In [1], device csis point to a device mipi_phy.
csis' driver is in [2], and mipi_phy's driver is in [3]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/exynos4.dtsi?h=3Dv5.6
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/media/platform/exynos4-is/mipi-csis.c?h=3Dv5.6
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/phy/samsung/phy-exynos-mipi-video.c?h=3Dv5.6

Regards,
Chun-Kuang.
