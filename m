Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3871A6D87
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 22:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388564AbgDMUpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 16:45:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34148 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388526AbgDMUpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 16:45:50 -0400
Received: from [IPv6:2804:431:e7cc:79a2:b6f7:4033:5775:cc3a] (unknown [IPv6:2804:431:e7cc:79a2:b6f7:4033:5775:cc3a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 122482A0FF8;
        Mon, 13 Apr 2020 21:45:38 +0100 (BST)
Subject: Re: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>
Cc:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
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
References: <20200410071723.19720-1-louis.kuo@mediatek.com>
 <20200410071723.19720-2-louis.kuo@mediatek.com>
 <CAAOTY_-=v4ZoPu63kPCUzGKyNFeV6S_=zM4P5_MAkrXB0b5Yew@mail.gmail.com>
 <d6776ac432794cb593c4db54b8a7a089@mtkmbs02n2.mediatek.inc>
 <CAAOTY__N-OYkONB8He_H8WVVJ_3MrquaR_khvwdPd2v_c2Di3w@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <9d88023a-a503-be4f-7ad5-99888495d906@collabora.com>
Date:   Mon, 13 Apr 2020 17:45:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY__N-OYkONB8He_H8WVVJ_3MrquaR_khvwdPd2v_c2Di3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/13/20 6:27 AM, Chun-Kuang Hu wrote:
> Hi, Louis:
> 
> Louis Kuo (郭德寧) <louis.kuo@mediatek.com> 於 2020年4月13日 週一 上午10:04寫道：
>>
>> Hi Chun-Kuang,
>>
>> The comment you mentioned,
>> I think the phy control part should be placed in drivers/phy/mediatek/. In [1], device csis point to a device mipi_phy.
>> csis' driver is in [2], and mipi_phy's driver is in [3]
>>
>> I reply as below,
>> =>
>> Since Seninf module includes mipi-csi phy, top mux, mux ctrl parts, combine all together into a v4l2-subdev
>> linking with v4l2 sensor drivers and v4l2 ISP driver backward and forward to transmit and process image.
>>
> 
> It  seems that seninf is a mfd or syscon device. MMSYS  [1] is a
> system controller which control multiple functions. Its major driver
> is placed in [2], and its clock control function is placed in [3].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt?h=next-20200413
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/soc/mediatek/mtk-mmsys.c?h=next-20200413
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/mediatek/clk-mt8173-mm.c?h=next-20200413
> 
>> The data lanes and port settings is configured by v4l2 sensor drivers,
>> For control reason, it's a better way to let seninf mipi-csi part inside seninf v4l2-subdev rather than an independent phy device in drivers/phy/mediatek
>>
>> There have similar design in omap4iss and Rkisp1-isp driver, they all in staging step.
>> https://elixir.bootlin.com/linux/v5.6/source/drivers/staging/media/rkisp1

fyi, the rkisp1 driver doesn't have the mipi dphy part inside it, we have
phy-rockchip-dphy-rx0, that should be moved to drivers/phy/ soon.

https://elixir.bootlin.com/linux/v5.6/source/drivers/staging/media/phy-rockchip-dphy-rx0

Regards,
Helen

>> https://elixir.bootlin.com/linux/v5.6/source/drivers/staging/media/omap4iss
> 
> Staging driver means there are some things need to modify to move out
> of staging folder, so I think this is not a strong reason to keep phy
> control in drivers/media/ folder. You could move this driver to
> drivers/staging/media/ folder and I would have no comment about this.
> 
> Regards,
> Chun-Kuang.
> 
>>
>> BRs
>> Louis
>>
>> -----Original Message-----
>> From: Chun-Kuang Hu [mailto:chunkuang.hu@kernel.org]
>> Sent: Saturday, April 11, 2020 8:17 AM
>> To: Louis Kuo (郭德寧) <louis.kuo@mediatek.com>
>> Cc: hans.verkuil@cisco.com; laurent.pinchart+renesas@ideasonboard.com; tfiga@chromium.org; keiichiw@chromium.org; Matthias Brugger <matthias.bgg@gmail.com>; Mauro Carvalho Chehab <mchehab@kernel.org>; devicetree@vger.kernel.org; Sean Cheng (鄭昇弘) <Sean.Cheng@mediatek.com>; srv_heupstream <srv_heupstream@mediatek.com>; Jerry-ch Chen (陳敬憲) <Jerry-ch.Chen@mediatek.com>; Jungo Lin (林明俊) <jungo.lin@mediatek.com>; Sj Huang (黃信璋) <sj.huang@mediatek.com>; yuzhao@chromium.org; moderated list:ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>; zwisler@chromium.org; Christie Yu (游雅惠) <christie.yu@mediatek.com>; Frederic Chen (陳俊元) <Frederic.Chen@mediatek.com>; Linux ARM <linux-arm-kernel@lists.infradead.org>; linux-media@vger.kernel.org
>> Subject: Re: [RFC PATCH V6 1/3] media: platform: mtk-isp: Add Mediatek sensor interface driver
>>
>> Hi, Louis:
>>
>> Louis Kuo <louis.kuo@mediatek.com> 於 2020年4月10日 週五 下午3:18寫道：
>>>
>>> This patch adds Mediatek's sensor interface driver. Sensor interface
>>> driver is a MIPI-CSI2 host driver, namely, a HW camera interface
>>> controller. It support a widely adopted, simple, high-speed protocol
>>> primarily intended for point-to-point image and video transmission
>>> between cameras and host devices. The mtk-isp directory will contain
>>> drivers for multiple IP blocks found in Mediatek ISP system. It will
>>> include ISP Pass 1 driver, sensor interface driver, DIP driver and face detection driver.
>>>
>>> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
>>> ---
>>>  drivers/media/platform/Makefile               |    1 +
>>>  drivers/media/platform/mtk-isp/Kconfig        |   18 +
>>>  drivers/media/platform/mtk-isp/Makefile       |    3 +
>>>  .../media/platform/mtk-isp/seninf/Makefile    |    5 +
>>>  drivers/media/platform/mtk-isp/seninf/TODO    |   18 +
>>>  .../platform/mtk-isp/seninf/mtk_seninf.c      | 1173 +++++++++++++
>>>  .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
>>>  .../mtk-isp/seninf/mtk_seninf_rx_reg.h        | 1398 ++++++++++++++++
>>>  8 files changed, 4107 insertions(+)
>>>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>>>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>>>  create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
>>>  create mode 100644 drivers/media/platform/mtk-isp/seninf/TODO
>>>  create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
>>>  create mode 100644
>>> drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
>>>  create mode 100644
>>> drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h
>>>
>>
>> [snip]
>>
>>> +
>>> +static void mtk_seninf_set_dphy(struct mtk_seninf *priv, unsigned int
>>> +seninf) {
>>> +       void __iomem *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
>>> +       unsigned int port = priv->port;
>>> +       void __iomem *pmipi_rx = priv->csi2_rx[port];
>>> +       void __iomem *pmipi_rx_conf = priv->base + 0x1000 * seninf;
>>> +
>>> +       /* Set analog phy mode to DPHY */
>>> +       if (is_cdphy_combo(port))
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A, RG_CSI0A_CPHY_EN, 0);
>>> +       /* 4D1C: MIPIRX_ANALOG_A_BASE = 0x00001A42 */
>>> +       if (is_4d1c(port)) {
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L0_CKSEL, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L1_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L1_CKSEL, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L2_CKMODE_EN, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L2_CKSEL, 1);
>>> +       } else {/* MIPIRX_ANALOG_BASE = 0x102 */
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L0_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L0_CKSEL, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L1_CKMODE_EN, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L1_CKSEL, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L2_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                           RG_CSI0A_DPHY_L2_CKSEL, 0);
>>> +       }
>>> +       if (is_cdphy_combo(port))
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> + RG_CSI0B_CPHY_EN, 0);
>>> +
>>> +       /* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001242 */
>>> +       if (is_4d1c(port)) {
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L0_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L0_CKSEL, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L1_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L1_CKSEL, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L2_CKSEL, 1);
>>> +       } else {/* MIPIRX_ANALOG_BASE = 0x102 */
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L0_CKSEL, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L1_CKMODE_EN, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L1_CKSEL, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L2_CKMODE_EN, 0);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_DPHY_L2_CKSEL, 0);
>>> +       }
>>> +       /* Byte clock invert */
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
>>> +                   RG_CSI0A_CDPHY_L0_T0_BYTECK_INVERT, 1);
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
>>> +                   RG_CSI0A_DPHY_L1_BYTECK_INVERT, 1);
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
>>> +                   RG_CSI0A_CDPHY_L2_T1_BYTECK_INVERT, 1);
>>> +
>>> +       if (is_4d1c(port)) {
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
>>> +                           RG_CSI0B_CDPHY_L0_T0_BYTECK_INVERT, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
>>> +                           RG_CSI0B_DPHY_L1_BYTECK_INVERT, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
>>> +                           RG_CSI0B_CDPHY_L2_T1_BYTECK_INVERT, 1);
>>> +       }
>>> +
>>> +       /* Start ANA EQ tuning */
>>> +       if (is_cdphy_combo(port)) {
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
>>> +                           RG_CSI0A_L0_T0AB_EQ_IS, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0A,
>>> +                           RG_CSI0A_L0_T0AB_EQ_BW, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
>>> +                           RG_CSI0A_L1_T1AB_EQ_IS, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
>>> +                           RG_CSI0A_L1_T1AB_EQ_BW, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
>>> +                           RG_CSI0A_L2_T1BC_EQ_IS, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0A,
>>> +                           RG_CSI0A_L2_T1BC_EQ_BW, 1);
>>> +
>>> +               if (is_4d1c(port)) { /* 4d1c */
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
>>> +                                   RG_CSI0B_L0_T0AB_EQ_IS, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI0B,
>>> +                                   RG_CSI0B_L0_T0AB_EQ_BW, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
>>> +                                   RG_CSI0B_L1_T1AB_EQ_IS, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
>>> +                                   RG_CSI0B_L1_T1AB_EQ_BW, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
>>> +                                   RG_CSI0B_L2_T1BC_EQ_IS, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA20_CSI0B,
>>> +                                   RG_CSI0B_L2_T1BC_EQ_BW, 1);
>>> +               }
>>> +       } else {
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
>>> +                           RG_CSI1A_L0_EQ_IS, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
>>> +                           RG_CSI1A_L0_EQ_BW, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
>>> +                           RG_CSI1A_L1_EQ_IS, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1A,
>>> +                           RG_CSI1A_L1_EQ_BW, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
>>> +                           RG_CSI1A_L2_EQ_IS, 1);
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
>>> +                           RG_CSI1A_L2_EQ_BW, 1);
>>> +
>>> +               if (is_4d1c(port)) { /* 4d1c */
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
>>> +                                   RG_CSI1B_L0_EQ_IS, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
>>> +                                   RG_CSI1B_L0_EQ_BW, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
>>> +                                   RG_CSI1B_L1_EQ_IS, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA18_CSI1B,
>>> +                                   RG_CSI1B_L1_EQ_BW, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
>>> +                                   RG_CSI1B_L2_EQ_IS, 1);
>>> +                       SENINF_BITS(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
>>> +                                   RG_CSI1B_L2_EQ_BW, 1);
>>> +               }
>>> +       }
>>> +
>>> +       /* End ANA EQ tuning */
>>> +       writel(0x90, pmipi_rx_base + MIPI_RX_ANA40_CSI0A);
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0A,
>>> +                   RG_CSI0A_RESERVE, 0x40);
>>> +       if (is_4d1c(port))
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA24_CSI0B,
>>> +                           RG_CSI0B_RESERVE, 0x40);
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A,
>>> +                   CSR_CSI_RST_MODE, 0);
>>> +       if (is_4d1c(port))
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B,
>>> +                           CSR_CSI_RST_MODE, 0);
>>> +       /* ANA power on */
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                   RG_CSI0A_BG_CORE_EN, 1);
>>> +       if (is_4d1c(port))
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_BG_CORE_EN, 1);
>>> +       usleep_range(20, 40);
>>> +       SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0A,
>>> +                   RG_CSI0A_BG_LPF_EN, 1);
>>> +       if (is_4d1c(port))
>>> +               SENINF_BITS(pmipi_rx, MIPI_RX_ANA00_CSI0B,
>>> +                           RG_CSI0B_BG_LPF_EN, 1);
>>> +
>>> +       udelay(1);
>>> +       /* 4d1c: MIPIRX_CONFIG_CSI_BASE = 0xC9000000; */
>>> +       if (is_4d1c(port)) {
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN0_MUX, 1);
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN1_MUX, 2);
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN2_MUX, 0);
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN3_MUX, 3);
>>> +       } else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE = 0xE4000000; */
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN0_MUX, 0);
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN1_MUX, 1);
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN2_MUX, 2);
>>> +               SENINF_BITS(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
>>> +                           CSI0_BIST_LN3_MUX, 3);
>>> +       }
>>> +}
>>
>> I think the phy control part should be placed in drivers/phy/mediatek/. In [1], device csis point to a device mipi_phy.
>> csis' driver is in [2], and mipi_phy's driver is in [3]
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/exynos4.dtsi?h=v5.6
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/exynos4-is/mipi-csis.c?h=v5.6
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/samsung/phy-exynos-mipi-video.c?h=v5.6
>>
>> Regards,
>> Chun-Kuang.
