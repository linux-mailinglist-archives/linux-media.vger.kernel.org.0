Return-Path: <linux-media+bounces-25146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFB8A19345
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 15:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66301888727
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845EF213E69;
	Wed, 22 Jan 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FSW5LKDg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF5E212D7B
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554687; cv=none; b=KFxoXNOd/9xCrg78KIuktASQSNnkFS0G3EeI/LA0JcVI9wE9Dlt2yAjL/HEDHyVHjd1UgBt2snG11pcitKONz+PcEHKG1l6YZXvOEB0Oo91Qi9H3DmzL5ZrgRw9zz4cRfAohjdYtFTC/sCegwUutpAQambXD1PS2eqTv2+n9VGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554687; c=relaxed/simple;
	bh=a2GSS91O/g7qEzQqbZsI4qlVL4cdtMBi8ZTX7lh4ssU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5mmoeNpamfJAOmgJ4lSmyktGbuM8wzJf8gvvVlX7pelBI02UDGeu8RYHJkw3oTtMrvjtVtDm3ScQn6aqxGlnyFacX1WagSyW9/N+fgEWrpMLMpnemQaJRq4CcdVyCxoYPuNQexIt3sIZ75YG9vt5A65TJJaU146UCUlSagm52Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FSW5LKDg; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dbfab8a2b0so1003721a12.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554682; x=1738159482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7RHAnVCu4B4TSV4IqH9P3sOsh3EqIMbZ/xNe+REYrI=;
        b=FSW5LKDgtjnHLooeaXE7sYox0vGrLB4jqxQiLaoBhnQo5YpLLJQdaKjZ80tpHEPWgH
         PuBw6xfMxuGgJgTlEvk9ycdqK6i+kJvGiPJaZ1SvFP88KNNsTskylZGbl1YrhmwcPZ0p
         gIbNyNQdr9TDp4M2SLTGJvXm28HWnXCKy2bHj0cX7cbmKhMdhX6CD1GkOlRVVZRov8fK
         epXSKFAXmxaHeQjzrDFshNm0mX+E3tlfZImzaza9FDvo1NXf+owuUdlgQIlBC7WwXsFS
         C7YKXsK2q7RqjOSzV0j2ZCP5LdfzZKmlJZAFPMunqfIyRX+D/u8QWqO9p/bo9xE2M7F7
         ILtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554682; x=1738159482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7RHAnVCu4B4TSV4IqH9P3sOsh3EqIMbZ/xNe+REYrI=;
        b=beQkyqjklArIqldK58Ux8/LUUzJcwTzeR7SQfj1Ido0gFlx84KmKE4ZUxX7jUVH5C+
         uVznxuhYRm5uvuJ9lzLUl8TKogT2WPczol7+PBKWXTrtxTeC1Amgv57kEq0YnV+G7IWB
         X68Su4M1BpUii/zNk7KVLs1WOsaQDpEQc0DjUpBionxccXCAWuMSW+EogHcmATbH8xTT
         qwOLwHpaae4NJRzbzSj2GYfeGPLU5vk139B+FGVDhY+l88eV/uO1xbWBfImYNU+F/+VT
         RBsj7MvfYtRt8FvTyAybOc6c+sy+0JW4npMFedkbwxpJZBcpd8r1go3PUkj+oJIBBZPG
         Ebpg==
X-Forwarded-Encrypted: i=1; AJvYcCUw7JUvcA8CV9W0YHpcRuOgk5UssH4uMWN0Gn0/RwneUw2QNKKMxvGmlL/yihsH4DdFP6L1yYfN4kVpJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7VrUlJ1eW4YLXe4oSDe+kFaiQSuzSrwPAN9mIB6jTdqr7EVIS
	7NZiRM4rzPx6djpRagaZMFxnieZDL9sZgt7jYimTy49lfFDFbRNCpy1hybCTawVC9SrWk6wUDYN
	aWBT5FiLQJ+QT3HTrSTsgllP2e4GeoYnHup2cuw==
X-Gm-Gg: ASbGnctSXCMjywHifIHvdEauJakllLyUG0Ee2kQVpoY3i+Fs/S/8fe6C+CsFB1uHcdS
	ihpb1Ouj68d5Mn+XpmyJs8YixNb4dfG/3JudzlZ3z2n0uu70hsBIuzo1ko5ZrZxSCKG8FvkK3pO
	hf5ScquOYrcg==
X-Google-Smtp-Source: AGHT+IEUrg9QBT8pzP1F4fPoHjzMfHHOGXpE1GEhmy8lFCsBhv1IH/P2S4QAP8zDVbqTU7az+U1JTSjwFOQljwsZKzo=
X-Received: by 2002:a17:907:7da1:b0:ab2:c1da:b725 with SMTP id
 a640c23a62f3a-ab38b298c5bmr2208233466b.30.1737554681979; Wed, 22 Jan 2025
 06:04:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-3-b04dc9610619@baylibre.com> <20241125173335.GR19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125173335.GR19381@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 15:04:31 +0100
X-Gm-Features: AbW1kvYs9C4JQJD9MakeUV_a1uJHfOv_hh0UQepl-f4073uhEWa_WZo0RvaMAK4
Message-ID: <CAEHHSvYA1YkjWLiNUyfY2Ryx+GhUs_Bnjpn1d0HV=+F5PO_fbw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 sensor interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 25 nov. 2024 =C3=A0 18:33, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
[ ...]
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> > +                               CK_SEL_1, input->bus.clock_lane);
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> > +                               CK_SEL_2, 2);
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> > +                               PHY_SENINF_LANE_MUX_CSI0_EN, 1);
>
> In the review of v6, I wrote that you're reading and writing the same
> register 4 times to set 4 different fields. This could be replaced by a
> single register access. I seem to recall that this was needed, and that
> writing the whole register in one go didn't produce the desired
> behaviour, at least for some registers. Is that right ?
>
> It would be nice to improve this where possible, here and everywhere
> else in the driver. I won't make it a blocker, but I really dislike this
> pattern :-(
>

Hi Laurent,
I just sent a V8, which already contains a lot of changes, so I
decided to postpone this for a potential v9 to ease review of v8!

Cheers
Julien

> > +     }
> > +
> > +     /* CSI1 */
> > +     if (priv->inputs[CSI_PORT_1].phy) {
> > +             const struct mtk_seninf_input *input =3D &priv->inputs[CS=
I_PORT_1];
> > +
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> > +                               DPHY_MODE, 0 /* 4D1C */);
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> > +                               CK_SEL_1, input->bus.clock_lane);
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> > +                               PHY_SENINF_LANE_MUX_CSI1_EN, 1);
> > +     }
> > +}
> > +
> > +static void mtk_seninf_input_setup_csi2_rx(struct mtk_seninf_input *in=
put)
> > +{
> > +     unsigned int lanes[MTK_CSI_MAX_LANES] =3D { };
> > +     unsigned int i;
> > +
> > +     /*
> > +      * Configure data lane muxing. In 2D1C mode, lanes 0 to 2 corresp=
ond to
> > +      * CSIx[AB]_L{0,1,2}, and in 4D1C lanes 0 to 5 correspond to
> > +      * CSIxA_L{0,1,2}, CSIxB_L{0,1,2}.
> > +      *
> > +      * The clock lane must be skipped when calculating the index of t=
he
> > +      * physical data lane. For instance, in 4D1C mode, the sensor clo=
ck
> > +      * lane is typically connected to lane 2 (CSIxA_L2), and the sens=
or
> > +      * data lanes 0-3 to lanes 1 (CSIxA_L1), 3 (CSIxB_L0), 0 (CSIxA_L=
0) and
> > +      * 4 (CSIxB_L1). The when skipping the clock lane, the data lane
> > +      * indices become 1, 2, 0 and 3.
> > +      */
> > +     for (i =3D 0; i < input->bus.num_data_lanes; ++i) {
> > +             lanes[i] =3D input->bus.data_lanes[i];
> > +             if (lanes[i] > input->bus.clock_lane)
> > +                     lanes[i]--;
> > +     }
> > +
> > +     mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0,
> > +                             CSI0_BIST_LN0_MUX, lanes[0]);
> > +     mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0,
> > +                             CSI0_BIST_LN1_MUX, lanes[1]);
> > +     mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0,
> > +                             CSI0_BIST_LN2_MUX, lanes[2]);
> > +     mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0,
> > +                             CSI0_BIST_LN3_MUX, lanes[3]);
> > +}
> > +
> > +static s64 mtk_seninf_get_clk_divider(struct mtk_seninf *priv,
> > +                                   int pad_num,
>
> This holds on a single line.
>
> > +                                   u8 bpp, unsigned int num_data_lanes=
)
> > +{
> > +     struct media_entity *entity =3D &priv->subdev.entity;
> > +     struct media_pad *pad;
> > +     struct v4l2_subdev *sd;
> > +     s64 link_frequency, pixel_clock;
> > +
> > +
> > +     if (!(entity->pads[pad_num].flags & MEDIA_PAD_FL_SINK))
> > +             return -ENODEV;
> > +
> > +     pad =3D media_pad_remote_pad_first(&entity->pads[pad_num]);
> > +     if (!pad)
> > +             return -ENOENT;
> > +
> > +     if (!is_media_entity_v4l2_subdev(pad->entity))
> > +             return -ENOENT;
>
> As those conditions that can happen, wouldn't pipeline validation have
> failed ? If those conditions can't happen, then
> mtk_seninf_input_setup_csi2() and mtk_seninf_start() can become void
> functions.
>
> > +
> > +     sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     link_frequency =3D v4l2_get_link_freq(sd->ctrl_handler, bpp,
> > +                                         num_data_lanes * 2);
> > +     pixel_clock =3D div_u64(link_frequency * 2 * num_data_lanes, bpp)=
;
> > +     /*
> > +      * According to datasheet: Sensor master clock =3D ISP_clock/(CLK=
CNT +1)
> > +      * we also have the following constraint:
> > +      * pixel_clock >=3D Sensor master clock
> > +      */
> > +     return div_u64(clk_get_rate(priv->clks[0].clk), pixel_clock) - 1;
> > +}
> > +
> > +static int mtk_seninf_input_setup_csi2(struct mtk_seninf *priv,
> > +                                    struct mtk_seninf_input *input,
> > +                                    struct v4l2_subdev_state *state)
> > +{
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     const struct v4l2_mbus_framefmt *format;
> > +     unsigned int num_data_lanes =3D input->bus.num_data_lanes;
> > +     unsigned int val =3D 0;
> > +     s64 clock_count;
> > +
> > +     format =3D v4l2_subdev_state_get_format(state, input->pad, 0);
> > +     fmtinfo =3D mtk_seninf_format_info(format->code);
> > +
> > +     /* Configure timestamp */
> > +     mtk_seninf_input_write(input, SENINF_TG1_TM_STP, SENINF_TIMESTAMP=
_STEP);
> > +
> > +     /* HQ */
> > +     /*
> > +      * Configure phase counter. Zero means:
> > +      * - Sensor master clock: ISP_CLK
> > +      * - Sensor clock polarity: Rising edge
> > +      * - Sensor reset deasserted
> > +      * - Sensor powered up
> > +      * - Pixel clock inversion disabled
> > +      * - Sensor master clock polarity disabled
> > +      * - Phase counter disabled
> > +      */
> > +     mtk_seninf_input_write(input, SENINF_TG1_PH_CNT, 0x0);
> > +
> > +     clock_count =3D mtk_seninf_get_clk_divider(priv, input->pad,
> > +                                              fmtinfo->bpp,
> > +                                              num_data_lanes);
> > +     if (clock_count < 0)
> > +             return clock_count;
> > +
> > +     clock_count =3D FIELD_PREP(SENINF_TG1_SEN_CK_CLKCNT, clock_count)=
 | 0x1;
> > +     mtk_seninf_input_write(input, SENINF_TG1_SEN_CK, clock_count);
> > +
> > +     /* First Enable Sensor interface and select pad (0x1a04_0200) */
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, PAD2CAM_DATA_SEL,
> > +                             SENINF_PAD_10BIT);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 0);
> > +     mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_CSI2_IP_EN=
, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_NCSI2_IP_E=
N, 0);
> > +
> > +     /* DPCM Enable */
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_DPCM)
> > +             val =3D SENINF_CSI2_DPCM_DI_2A_DPCM_EN;
> > +     else
> > +             val =3D SENINF_CSI2_DPCM_DI_30_DPCM_EN;
> > +     mtk_seninf_input_write(input, SENINF_CSI2_DPCM, val);
> > +
> > +     /* Settle delay */
> > +     mtk_seninf_input_update(input, SENINF_CSI2_LNRD_TIMING,
> > +                             DATA_SETTLE_PARAMETER, SENINF_SETTLE_DELA=
Y);
> > +
> > +     /* CSI2 control */
> > +     val =3D mtk_seninf_inuput_read(input, SENINF_CSI2_CTL)
> > +           | (FIELD_PREP(SENINF_CSI2_CTL_ED_SEL,
> > +                         DATA_HEADER_ORDER_DI_WCL_WCH)
> > +           | SENINF_CSI2_CTL_CLOCK_LANE_EN | (BIT(num_data_lanes) - 1)=
);
> > +     mtk_seninf_input_write(input, SENINF_CSI2_CTL, val);
> > +
> > +     mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
> > +                             BYPASS_LANE_RESYNC, 0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
> > +                             CDPHY_SEL, 0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_RESYNC_MERGE_CTL,
> > +                             CPHY_LANE_RESYNC_CNT, 3);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_MODE, 0=
);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_MODE, CSR_CSI2_HEADER_=
LEN,
> > +                             0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_MA=
SK_0,
> > +                             0xff00);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DPHY_SYNC, SYNC_SEQ_PA=
T_0,
> > +                             0x001d);
> > +
> > +     mtk_seninf_input_update(input, SENINF_CSI2_CTL, CLOCK_HS_OPTION, =
0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_CTL, HSRX_DET_EN, 0);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_CTL, HS_TRAIL_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_HS_TRAIL, HS_TRAIL_PAR=
AMETER,
> > +                             SENINF_HS_TRAIL_PARAMETER);
> > +
> > +     /* Set debug port to output packet number */
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CSI2_DGB_SEL, DEBUG_SEL, 0x=
1a);
> > +
> > +     /* HQ */
> > +     mtk_seninf_input_write(input, SENINF_CSI2_SPARE0, 0xfffffffe);
> > +
> > +     /* Reset the CSI2 to commit changes */
> > +     mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 1);
> > +     udelay(1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, CSI2_SW_RST, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static void mtk_seninf_mux_setup(struct mtk_seninf_mux *mux,
> > +                              struct mtk_seninf_input *input,
> > +                              struct v4l2_subdev_state *state)
> > +{
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     const struct v4l2_mbus_framefmt *format;
> > +     unsigned int pix_sel_ext;
> > +     unsigned int pix_sel;
> > +     unsigned int hs_pol =3D 0;
> > +     unsigned int vs_pol =3D 0;
> > +     unsigned int val;
> > +     u32 rst_mask;
> > +
> > +     format =3D v4l2_subdev_state_get_format(state, input->pad, 0);
> > +     fmtinfo =3D mtk_seninf_format_info(format->code);
> > +
> > +     /* Enable mux */
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_SRC_SEL,
> > +                           SENINF_MIPI_SENSOR);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_SRC_SEL_EX=
T,
> > +                           SENINF_NORMAL_MODEL);
> > +
> > +     pix_sel_ext =3D 0;
> > +     pix_sel =3D 1;
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_PIX_SEL_EX=
T,
> > +                           pix_sel_ext);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_s=
el);
> > +
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_JPEG) {
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_=
EN, 0);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN=
,
> > +                                   FIFO_FLUSH_EN_JPEG_2_PIXEL_MODE);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN,
> > +                                   FIFO_PUSH_EN_JPEG_2_PIXEL_MODE);
> > +     } else {
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_=
EN, 2);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN=
,
> > +                                   FIFO_FLUSH_EN_NORMAL_MODE);
> > +             mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN,
> > +                                   FIFO_PUSH_EN_NORMAL_MODE);
> > +     }
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_=
pol);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_=
pol);
> > +
> > +     val =3D mtk_seninf_mux_read(mux, SENINF_MUX_CTRL);
> > +     rst_mask =3D SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> > +                SENINF_MUX_CTRL_SENINF_MUX_SW_RST;
> > +
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val | rst_mask);
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL, val & ~rst_mask);
> > +
> > +     /* HQ */
> > +     val =3D SENINF_FIFO_FULL_SEL;
> > +
> > +     /* SPARE field meaning is unknown */
> > +     val |=3D 0xc0000;
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_SPARE, val);
> > +}
> > +
> > +static void mtk_seninf_top_mux_setup(struct mtk_seninf *priv,
> > +                                  enum mtk_seninf_id seninf_id,
> > +                                  struct mtk_seninf_mux *mux)
>
> mux can be const. Please constify pointer arguments when they don't have
> to be modified (both from a language point of view, and conceptually,
> for instance priv shouldn't be const as you're writing registers in this
> function, which modifies the state of the device)..
>
> > +{
> > +     unsigned int val;
> > +
> > +     /*
> > +      * Use the top mux (from SENINF input to MUX) to configure routin=
g, and
> > +      * hardcode a 1:1 mapping from the MUX instances to the SENINF ou=
tputs.
> > +      */
> > +     val =3D mtk_seninf_read(priv, SENINF_TOP_MUX_CTRL)
> > +                 & ~(0xf << (mux->mux_id * 4));
> > +     val |=3D (seninf_id & 0xf) << (mux->mux_id * 4);
> > +     mtk_seninf_write(priv, SENINF_TOP_MUX_CTRL, val);
> > +
> > +     /*
> > +      * We currently support only seninf version 3.0
> > +      * where camsv0 and camsv1 are hardwired respectively to
> > +      * SENINF_CAM2 and SENINF_CAM3 i.e :
> > +      *  - SENINF_TOP_CAM_MUX_CTRL[11:8] =3D 0
> > +      *  - SENINF_TOP_CAM_MUX_CTRL[15:12] =3D 1
> > +      * so we hardcode it here
> > +      */
> > +     mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL,
> > +                       SENINF_CAM2_MUX_SRC_SEL, 0);
> > +     mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL,
> > +                       SENINF_CAM3_MUX_SRC_SEL, 1);
> > +}
> > +
> > +static void seninf_enable_test_pattern(struct mtk_seninf *priv,
> > +                                    struct v4l2_subdev_state *state)
> > +{
> > +     struct mtk_seninf_input *input =3D &priv->inputs[CSI_PORT_0];
> > +     struct mtk_seninf_mux *mux =3D &priv->muxes[0];
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     const struct v4l2_mbus_framefmt *format;
> > +     unsigned int val;
> > +     unsigned int pix_sel_ext;
> > +     unsigned int pix_sel;
> > +     unsigned int hs_pol =3D 0;
> > +     unsigned int vs_pol =3D 0;
> > +     unsigned int seninf =3D 0;
> > +     unsigned int tm_size =3D 0;
> > +     unsigned int mux_id =3D mux->mux_id;
> > +
> > +     format =3D v4l2_subdev_state_get_format(state, priv->conf->nb_inp=
uts, 0);
> > +     fmtinfo =3D mtk_seninf_format_info(format->code);
> > +
> > +     mtk_seninf_update(priv, SENINF_TOP_CTRL, MUX_LP_MODE, 0);
> > +
> > +     mtk_seninf_update(priv, SENINF_TOP_CTRL, SENINF_PCLK_EN, 1);
> > +     mtk_seninf_update(priv, SENINF_TOP_CTRL, SENINF2_PCLK_EN, 1);
> > +
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL, SENINF_SRC_SEL, 1);
> > +     mtk_seninf_input_update(input, SENINF_CTRL_EXT, SENINF_TESTMDL_IP=
_EN,
> > +                             1);
> > +
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_EN, 1);
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_PAT, 0xc);
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_VSYNC, 4);
> > +     mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_DUMMYPXL, 0x=
28);
> > +
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_BAYER)
> > +             mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_FMT,=
 0x0);
> > +     else
> > +             mtk_seninf_input_update(input, SENINF_TG1_TM_CTL, TM_FMT,=
 0x1);
> > +
> > +     tm_size =3D FIELD_PREP(SENINF_TG1_TM_SIZE_TM_LINE, format->height=
 + 8);
> > +     switch (format->code) {
> > +     case MEDIA_BUS_FMT_UYVY8_1X16:
> > +     case MEDIA_BUS_FMT_VYUY8_1X16:
> > +     case MEDIA_BUS_FMT_YUYV8_1X16:
> > +     case MEDIA_BUS_FMT_YVYU8_1X16:
> > +             tm_size |=3D FIELD_PREP(SENINF_TG1_TM_SIZE_TM_PXL,
> > +                                   format->width * 2);
> > +             break;
> > +     default:
> > +             tm_size |=3D FIELD_PREP(SENINF_TG1_TM_SIZE_TM_PXL, format=
->width);
> > +             break;
> > +     }
> > +     mtk_seninf_input_write(input, SENINF_TG1_TM_SIZE, tm_size);
> > +
> > +     mtk_seninf_input_write(input, SENINF_TG1_TM_CLK,
> > +                            TEST_MODEL_CLK_DIVIDED_CNT);
> > +     mtk_seninf_input_write(input, SENINF_TG1_TM_STP, TIME_STAMP_DIVID=
ER);
> > +
> > +     /* Set top mux */
> > +     val =3D (mtk_seninf_read(priv, SENINF_TOP_MUX_CTRL)
> > +            & (~(0xf << (mux_id * 4)))) |
> > +           ((seninf & 0xf) << (mux_id * 4));
> > +     mtk_seninf_write(priv, SENINF_TOP_MUX_CTRL, val);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT, SENINF_SRC_SEL_EX=
T,
> > +                           SENINF_TEST_MODEL);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_SRC_SEL, 1);
> > +
> > +     pix_sel_ext =3D 0;
> > +     pix_sel =3D 1;
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL_EXT,
> > +                           SENINF_PIX_SEL_EXT, pix_sel_ext);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_PIX_SEL, pix_s=
el);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_PUSH_EN, 0x1f);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FLUSH_EN, 0x1b);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, FIFO_FULL_WR_EN, 2);
> > +
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_POL, hs_=
pol);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_VSYNC_POL, vs_=
pol);
> > +     mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_HSYNC_MASK, 1)=
;
> > +
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_INTEN,
> > +                          SENINF_IRQ_CLR_SEL | SENINF_ALL_ERR_IRQ_EN);
> > +
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL,
> > +                          mtk_seninf_mux_read(mux, SENINF_MUX_CTRL) |
> > +                          SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> > +                          SENINF_MUX_CTRL_SENINF_MUX_SW_RST);
> > +     udelay(1);
> > +     mtk_seninf_mux_write(mux, SENINF_MUX_CTRL,
> > +                          mtk_seninf_mux_read(mux, SENINF_MUX_CTRL) &
> > +                          ~(SENINF_MUX_CTRL_SENINF_IRQ_SW_RST |
> > +                            SENINF_MUX_CTRL_SENINF_MUX_SW_RST));
> > +
> > +     //check this
> > +     mtk_seninf_write(priv, SENINF_TOP_CAM_MUX_CTRL, 0x76540010);
> > +     /*
> > +      * We currently support only seninf version 3.0
> > +      * where camsv0 and camsv1 are hardwired respectively to
> > +      * test pattern is valid only for seninf_1 (id 0) i.e :
>
> I'm having trouble parsing this sentence.
>
> > +      *  - SENINF_TOP_CAM_MUX_CTRL[11:8] =3D 0
> > +      *  - SENINF_TOP_CAM_MUX_CTRL[15:12] =3D 0
> > +      * so we hardcode it here
> > +      */
> > +     mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL,
> > +                       SENINF_CAM2_MUX_SRC_SEL, 0);
> > +     mtk_seninf_update(priv, SENINF_TOP_CAM_MUX_CTRL,
> > +                       SENINF_CAM3_MUX_SRC_SEL, 0);
>
> Here you're reconfiguring the whole TOP_CAM_MUX. Unless I'm mistaken, if
> you want to capture from one sensor and use the TPG for the other camsv,
> the configuration performed here and in mtk_seninf_top_mux_setup() will
> clash. Isn't that a problem ?
>
> > +}
> > +
> > +static int mtk_seninf_start(struct mtk_seninf *priv,
> > +                         struct v4l2_subdev_state *state,
> > +                         struct mtk_seninf_input *input,
> > +                         struct mtk_seninf_mux *mux)
> > +{
> > +     int ret;
> > +
> > +     phy_power_on(input->phy);
> > +
> > +     mtk_seninf_input_setup_csi2_rx(input);
> > +     ret =3D mtk_seninf_input_setup_csi2(priv, input, state);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mtk_seninf_mux_setup(mux, input, state);
> > +     mtk_seninf_top_mux_setup(priv, input->seninf_id, mux);
> > +     return 0;
> > +}
> > +
> > +static void mtk_seninf_stop(struct mtk_seninf *priv,
> > +                         struct mtk_seninf_input *input)
> > +{
> > +     unsigned int val;
> > +
> > +     /* Disable CSI2(2.5G) first */
> > +     val =3D mtk_seninf_inuput_read(input, SENINF_CSI2_CTL);
> > +     val &=3D ~(SENINF_CSI2_CTL_CLOCK_LANE_EN |
> > +              SENINF_CSI2_CTL_DATA_LANE3_EN |
> > +              SENINF_CSI2_CTL_DATA_LANE2_EN |
> > +              SENINF_CSI2_CTL_DATA_LANE1_EN |
> > +              SENINF_CSI2_CTL_DATA_LANE0_EN);
> > +     mtk_seninf_input_write(input, SENINF_CSI2_CTL, val);
> > +
> > +     if (!priv->is_testmode)
> > +             phy_power_off(input->phy);
>
> What happens if userspace alls STREAMON with the TPG disabled, then
> enables the TPG, and calls STREAMOFF ? It looks like you should disable
> changing the TPG control while streaming. You can use
> v4l2_subdev_is_streaming() to check if the subdev is streaming, but
> you'll need to hold the active state lock.
>
> > +}
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * V4L2 Controls
> > + */
> > +
> > +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct mtk_seninf *priv =3D container_of(ctrl->handler,
> > +                                            struct mtk_seninf, ctrl_ha=
ndler);
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_TEST_PATTERN:
> > +             priv->is_testmode =3D !!ctrl->val;
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops seninf_ctrl_ops =3D {
> > +     .s_ctrl =3D seninf_set_ctrl,
> > +};
> > +
> > +static const char *const seninf_test_pattern_menu[] =3D {
> > +     "No test pattern",
>
> Drivers normally use "Disabled" for this.
>
> > +     "Static horizontal color bars",
>
>         "Static Horizontal Color Bars",
>
> Not that it would matter too much, but menu entries usually use Camel
> Case, so let's be consistent.
>
> > +};
> > +
> > +static int seninf_initialize_controls(struct mtk_seninf *priv)
> > +{
> > +     struct v4l2_ctrl_handler *handler;
> > +     int ret;
> > +
> > +     handler =3D &priv->ctrl_handler;
> > +     ret =3D v4l2_ctrl_handler_init(handler, 2);
>
> The driver creates a single control.
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
> > +                                  V4L2_CID_TEST_PATTERN,
> > +                                  ARRAY_SIZE(seninf_test_pattern_menu)=
 - 1,
> > +                                  0, 0, seninf_test_pattern_menu);
> > +
> > +     priv->is_testmode =3D false;
> > +
> > +     if (handler->error) {
> > +             ret =3D handler->error;
> > +             dev_err(priv->dev,
> > +                     "Failed to init controls(%d)\n", ret);
> > +             v4l2_ctrl_handler_free(handler);
> > +             return ret;
> > +     }
> > +
> > +     priv->subdev.ctrl_handler =3D handler;
> > +
> > +     return 0;
> > +}
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * V4L2 Subdev Operations
> > + */
>
> Missing blank line.
>
> > +static int seninf_enable_streams(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state, u32 pad=
,
> > +                              u64 streams_mask)
> > +{
> > +     struct mtk_seninf *priv =3D sd_to_mtk_seninf(sd);
> > +     struct mtk_seninf_input *input;
> > +     struct mtk_seninf_mux *mux;
> > +     struct v4l2_subdev *source;
> > +     u32 sink_pad;
> > +     int ret;
> > +
> > +     /* Stream control can only operate on source pads. */
> > +     if (pad < priv->conf->nb_inputs ||
> > +         pad >=3D priv->conf->nb_inputs + priv->conf->nb_outputs)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Locate the SENINF input and MUX for the source pad.
> > +      */
>
>         /* Locate the SENINF input and MUX for the source pad. */
>
> Same below.
>
> > +
> > +     ret =3D v4l2_subdev_routing_find_opposite_end(&state->routing, pa=
d,
> > +                                                 0, &sink_pad, NULL);
> > +     if (ret) {
> > +             dev_dbg(priv->dev, "No sink pad routed to source pad %u\n=
",
> > +                     pad);
> > +             return ret;
> > +     }
> > +
> > +     input =3D &priv->inputs[sink_pad];
> > +     mux =3D &priv->muxes[pad - priv->conf->nb_inputs];
> > +
> > +     ret =3D pm_runtime_get_sync(priv->dev);
>
> Use pm_runtime_resume_and_get() and drop pm_runtime_put_noidle() in the
> error path.
>
> > +     if (ret < 0) {
> > +             dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n",=
 ret);
> > +             pm_runtime_put_noidle(priv->dev);
> > +             return ret;
> > +     }
> > +
> > +     /* If test mode is enabled, just enable the test pattern generato=
r. */
> > +     if (priv->is_testmode) {
> > +             seninf_enable_test_pattern(priv, state);
> > +             return 0;
> > +     }
> > +
> > +     /* Start the SENINF first and then the source. */
> > +     ret =3D mtk_seninf_start(priv, state, input, mux);
> > +     if (ret) {
> > +             dev_err(priv->dev, "failed to start seninf: %d\n", ret);
>
> Missing
>
>                 pm_runtime_put(priv->dev);
>
> I would move error handling to the bottom of the function, with gotos
> and error labels.
>
> > +             return ret;
> > +     }
> > +
> > +     source =3D input->source_sd;
> > +     ret =3D v4l2_subdev_call(source, video, s_stream, 1);
>
> Use v4l2_subdev_enable_streams().
>
> > +     if (ret) {
> > +             dev_err(priv->dev, "failed to start source %s: %d\n",
> > +                     source->entity.name, ret);
> > +             mtk_seninf_stop(priv, input);
> > +             pm_runtime_put(priv->dev);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int seninf_disable_streams(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state, u32 pa=
d,
> > +                               u64 streams_mask)
> > +{
> > +     struct mtk_seninf *priv =3D sd_to_mtk_seninf(sd);
> > +     struct mtk_seninf_input *input;
> > +     struct mtk_seninf_mux *mux;
> > +     struct v4l2_subdev *source;
> > +     u32 sink_pad;
> > +     int ret;
> > +
> > +     /* Stream control can only operate on source pads. */
> > +     if (pad < priv->conf->nb_inputs ||
> > +         pad >=3D priv->conf->nb_inputs + priv->conf->nb_outputs)
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Locate the SENINF input and MUX for the source pad.
> > +      *
> > +      */
> > +
> > +     ret =3D v4l2_subdev_routing_find_opposite_end(&state->routing, pa=
d,
> > +                                                 0, &sink_pad, NULL);
> > +     if (ret) {
> > +             dev_dbg(priv->dev, "No sink pad routed to source pad %u\n=
",
> > +                     pad);
> > +             return ret;
> > +     }
> > +
> > +     input =3D &priv->inputs[sink_pad];
> > +     mux =3D &priv->muxes[pad - priv->conf->nb_inputs];
> > +
> > +     if (!priv->is_testmode) {
> > +             source =3D input->source_sd;
> > +             ret =3D v4l2_subdev_call(source, video, s_stream, 0);
>
> Use v4l2_subdev_disable_streams().
>
> > +             if (ret)
> > +                     dev_err(priv->dev,
> > +                             "failed to stop source %s: %d\n",
> > +                             source->entity.name, ret);
> > +     }
> > +
> > +     mtk_seninf_stop(priv, input);
> > +     pm_runtime_put(priv->dev);
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_mbus_framefmt mtk_seninf_default_fmt =3D {
> > +     .code =3D SENINF_DEFAULT_BUS_FMT,
> > +     .width =3D SENINF_DEFAULT_WIDTH,
> > +     .height =3D SENINF_DEFAULT_HEIGHT,
> > +     .field =3D V4L2_FIELD_NONE,
> > +     .colorspace =3D V4L2_COLORSPACE_SRGB,
> > +     .xfer_func =3D V4L2_XFER_FUNC_DEFAULT,
> > +     .ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT,
> > +     .quantization =3D V4L2_QUANTIZATION_DEFAULT,
> > +};
> > +
> > +static int __seninf_set_routing(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *state,
> > +                             struct v4l2_subdev_krouting *routing)
> > +{
> > +     int ret;
> > +
> > +     ret =3D v4l2_subdev_routing_validate(sd, routing,
> > +                                        V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> > +                                             &mtk_seninf_default_fmt);
> > +}
> > +
> > +static int seninf_init_state(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *state)
> > +{
> > +     struct mtk_seninf *priv =3D sd_to_mtk_seninf(sd);
> > +     struct v4l2_subdev_route routes[SENINF_MAX_NUM_OUTPUTS] =3D { };
> > +     struct v4l2_subdev_krouting routing =3D {
> > +             .routes =3D routes,
> > +             .num_routes =3D priv->conf->nb_outputs,
> > +     };
> > +     unsigned int i;
> > +
> > +     /*
> > +      * Initialize one route for supported source pads.
> > +      * It is a single route from the first sink pad to the source pad=
,
> > +      * while on SENINF 5.0 the routing table will map sink pads to so=
urce
> > +      * pads connected to CAMSV 1:1 (skipping the first two source pad=
s
> > +      * connected to the CAM instances).
> > +      */
> > +     for (i =3D 0; i < routing.num_routes; i++) {
> > +             struct v4l2_subdev_route *route =3D &routes[i];
> > +
> > +             route->sink_pad =3D i;
> > +             route->sink_stream =3D 0;
> > +             route->source_pad =3D priv->conf->nb_inputs + i;
> > +             route->source_stream =3D 0;
> > +             route->flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> > +     }
> > +
> > +     return __seninf_set_routing(sd, state, &routing);
> > +}
> > +
> > +static int seninf_enum_mbus_code(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     struct mtk_seninf *priv =3D sd_to_mtk_seninf(sd);
> > +
> > +     if (code->index >=3D ARRAY_SIZE(mtk_seninf_formats))
> > +             return -EINVAL;
> > +
> > +     fmtinfo =3D &mtk_seninf_formats[code->index];
> > +     if (fmtinfo->flags & MTK_SENINF_FORMAT_INPUT_ONLY &&
> > +         mtk_seninf_pad_is_source(priv, code->pad))
> > +             return -EINVAL;
> > +
> > +     code->code =3D fmtinfo->code;
> > +
> > +     return 0;
> > +}
> > +
> > +static int seninf_set_fmt(struct v4l2_subdev *sd,
> > +                       struct v4l2_subdev_state *state,
> > +                       struct v4l2_subdev_format *fmt)
> > +{
> > +     struct mtk_seninf *priv =3D sd_to_mtk_seninf(sd);
> > +     const struct mtk_seninf_format_info *fmtinfo;
> > +     struct v4l2_mbus_framefmt *format;
> > +
> > +     /*
> > +      * TODO (?): We should disallow setting formats on the source pad
> > +      * completely, as the SENINF can't perform any processing. This w=
ould
> > +      * however break usage of the test pattern generator, as there wo=
uld be
> > +      * no way to configure formats at all when no active input is sel=
ected.
> > +      */
>
> As commented in v6, I think this needs to be solved.
>
> > +
> > +     /*
> > +      * Default to the first format if the requested media bus code is=
n't
> > +      * supported.
> > +      */
> > +     fmtinfo =3D mtk_seninf_format_info(fmt->format.code);
> > +     if (!fmtinfo) {
> > +             fmtinfo =3D &mtk_seninf_formats[0];
> > +             fmt->format.code =3D fmtinfo->code;
> > +     }
> > +
> > +     /* Interlaced formats are not supported yet. */
> > +     fmt->format.field =3D V4L2_FIELD_NONE;
> > +
> > +     /* Store the format. */
> > +     format =3D v4l2_subdev_state_get_format(state, fmt->pad, fmt->str=
eam);
> > +     if (!format)
> > +             return -EINVAL;
> > +
> > +     *format =3D fmt->format;
> > +
> > +     if (mtk_seninf_pad_is_source(priv, fmt->pad))
> > +             return 0;
> > +
> > +     /* Propagate the format to the corresponding source pad. */
> > +     format =3D v4l2_subdev_state_get_opposite_stream_format(state, fm=
t->pad,
> > +                                                           fmt->stream=
);
> > +     if (!format)
> > +             return -EINVAL;
> > +
> > +     *format =3D fmt->format;
>
> Another comment from v6 that seems to have been lost:
>
> If fmtinfo is one of the INPUT_ONLY formats, the corresponding
> DPCM-uncompressed format must be set on the source pad. To facilitate
> this, you want need to add a .uncompressed field to the format info
> structure to store the corresponding uncompressed format.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int seninf_set_routing(struct v4l2_subdev *sd,
> > +                           struct v4l2_subdev_state *state,
> > +                           enum v4l2_subdev_format_whence which,
> > +                           struct v4l2_subdev_krouting *routing)
> > +{
> > +     return __seninf_set_routing(sd, state, routing);
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops seninf_subdev_core_ops =3D {
> > +     .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +     .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops =3D {
> > +     .enum_mbus_code =3D seninf_enum_mbus_code,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D seninf_set_fmt,
> > +     .link_validate =3D v4l2_subdev_link_validate_default,
> > +     .set_routing =3D seninf_set_routing,
> > +     .enable_streams =3D seninf_enable_streams,
> > +     .disable_streams =3D seninf_disable_streams,
> > +};
> > +
> > +static const struct v4l2_subdev_ops seninf_subdev_ops =3D {
> > +     .core =3D &seninf_subdev_core_ops,
> > +     .pad =3D &seninf_subdev_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops seninf_subdev_internal_op=
s =3D {
> > +     .init_state =3D seninf_init_state,
> > +};
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * Media Entity Operations
> > + */
> > +
> > +static const struct media_entity_operations seninf_media_ops =3D {
> > +     .get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +     .has_pad_interdep =3D v4l2_subdev_has_pad_interdep,
> > +};
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * Async Subdev Notifier
> > + */
> > +
> > +struct mtk_seninf_async_subdev {
> > +     struct v4l2_async_connection asc;
> > +     struct mtk_seninf_input *input;
> > +     unsigned int port;
> > +};
> > +
> > +static int mtk_seninf_fwnode_parse(struct device *dev,
> > +                                unsigned int id)
>
> This holds on a single line.
>
> > +
>
>
> Extra blank line.
>
> I would move this function below mtk_seninf_async_ops as it's called
> directly in the probe path, before the bound and complete callbacks.
>
> > +{
> > +     static const char * const phy_names[] =3D {
> > +             "csi0", "csi1", "csi2", "csi0b" };
>
>         static const char * const phy_names[] =3D {
>                 "csi0", "csi1", "csi2", "csi0b"
>         };
>
> > +     struct mtk_seninf *priv =3D dev_get_drvdata(dev);
> > +     struct fwnode_handle *ep, *fwnode;
> > +     struct mtk_seninf_input *input;
> > +     struct mtk_seninf_async_subdev *asd;
> > +     struct v4l2_fwnode_endpoint vep =3D { .bus_type =3D V4L2_MBUS_CSI=
2_DPHY };
> > +     unsigned int port;
> > +     int ret;
> > +
> > +     ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), id, 0, 0)=
;
> > +     if (!ep)
> > +             return 0;
> > +
> > +     fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> > +     ret =3D v4l2_fwnode_endpoint_parse(ep, &vep);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to parse %p fw\n", to_of_node(fwnode=
));
>
>                 dev_err(dev, "Failed to parse %pfw\n", fwnode);
>
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     asd =3D v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
> > +                                    struct mtk_seninf_async_subdev);
> > +     if (IS_ERR(asd)) {
> > +             ret =3D PTR_ERR(asd);
> > +             goto out;
> > +     }
> > +
> > +     port =3D vep.base.port;
> > +     asd->port =3D port;
> > +
> > +     if (mtk_seninf_pad_is_source(priv, port)) {
> > +             ret =3D 0;
> > +             goto out;
> > +     }
> > +
> > +     input =3D &priv->inputs[port];
> > +
> > +     input->pad =3D port;
> > +     input->seninf_id =3D port_to_seninf_id[port];
> > +     input->base =3D priv->base + 0x1000 * input->seninf_id;
> > +     input->seninf =3D priv;
> > +
> > +     input->bus =3D vep.bus.mipi_csi2;
> > +
> > +     input->phy =3D devm_phy_get(dev, phy_names[port]);
> > +     if (IS_ERR(input->phy)) {
> > +             dev_err(dev, "failed to get phy: %ld\n", PTR_ERR(input->p=
hy));
> > +             ret =3D PTR_ERR(input->phy);
> > +             goto out;
> > +     }
> > +     input->phy_mode =3D SENINF_PHY_MODE_4D1C;
> > +
> > +     asd->input =3D input;
> > +
> > +     ret =3D 0;
> > +out:
> > +     fwnode_handle_put(ep);
> > +     fwnode_handle_put(fwnode);
> > +     return ret;
> > +}
> > +
> > +static int mtk_seninf_notifier_bound(struct v4l2_async_notifier *notif=
ier,
> > +                                  struct v4l2_subdev *sd,
> > +                                  struct v4l2_async_connection *asc)
> > +{
> > +     struct mtk_seninf *priv =3D container_of(notifier, struct mtk_sen=
inf,
> > +                                            notifier);
> > +     struct mtk_seninf_async_subdev *asd =3D
> > +             container_of(asc, struct mtk_seninf_async_subdev, asc);
> > +     struct device_link *link;
> > +     int ret;
> > +
> > +     dev_dbg(priv->dev, "%s bound to SENINF port %u\n", sd->entity.nam=
e,
> > +             asd->port);
> > +
> > +     if (mtk_seninf_pad_is_sink(priv, asd->port)) {
> > +             struct mtk_seninf_input *input =3D asd->input;
> > +
> > +             input->source_sd =3D sd;
> > +
> > +             link =3D device_link_add(priv->dev, sd->dev,
> > +                                    DL_FLAG_PM_RUNTIME | DL_FLAG_STATE=
LESS);
> > +             if (!link) {
> > +                     dev_err(priv->dev,
> > +                             "Failed to create device link from source=
 %s\n",
> > +                             sd->name);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret =3D v4l2_create_fwnode_links_to_pad(sd,
> > +                                                   &priv->pads[input->=
pad],
> > +                                                   MEDIA_LNK_FL_IMMUTA=
BLE |
> > +                                                   MEDIA_LNK_FL_ENABLE=
D);
> > +     } else {
> > +             link =3D device_link_add(sd->dev, priv->dev,
> > +                                    DL_FLAG_PM_RUNTIME | DL_FLAG_STATE=
LESS);
> > +             if (!link) {
> > +                     dev_err(priv->dev,
> > +                             "Failed to create device link to output %=
s\n",
> > +                             sd->name);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             ret =3D v4l2_create_fwnode_links_to_pad(&priv->subdev,
> > +                                                   &sd->entity.pads[0]=
,
> > +                                                   MEDIA_LNK_FL_IMMUTA=
BLE |
> > +                                                   MEDIA_LNK_FL_ENABLE=
D);
> > +     }
>
> Add a blank line here.
>
> > +     if (ret) {
> > +             dev_err(priv->dev, "Failed to create links between SENINF=
 port %u and %s (%d)\n",
> > +                     asd->port, sd->entity.name, ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mtk_seninf_notifier_complete(struct v4l2_async_notifier *no=
tifier)
> > +{
> > +     struct mtk_seninf *priv =3D container_of(notifier, struct mtk_sen=
inf,
> > +                                            notifier);
> > +     int ret;
> > +
> > +     ret =3D v4l2_device_register_subdev_nodes(&priv->v4l2_dev);
> > +     if (ret) {
> > +             dev_err(priv->dev, "Failed to register subdev nodes: %d\n=
",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_async_notifier_operations mtk_seninf_async_op=
s =3D {
> > +     .bound =3D mtk_seninf_notifier_bound,
> > +     .complete =3D mtk_seninf_notifier_complete,
> > +};
> > +
> > +static int mtk_seninf_media_init(struct mtk_seninf *priv)
> > +{
> > +     struct media_device *media_dev =3D &priv->media_dev;
> > +     const struct mtk_seninf_conf *conf =3D priv->conf;
> > +     unsigned int num_pads =3D conf->nb_outputs + conf->nb_inputs;
> > +     struct media_pad *pads =3D priv->pads;
> > +     struct device *dev =3D priv->dev;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     media_dev->dev =3D dev;
> > +     strscpy(media_dev->model, conf->model, sizeof(media_dev->model));
> > +     media_dev->hw_revision =3D 0;
> > +     media_device_init(media_dev);
> > +
> > +     for (i =3D 0; i < conf->nb_inputs; i++)
> > +             pads[i].flags =3D MEDIA_PAD_FL_SINK;
> > +     for (i =3D conf->nb_inputs; i < num_pads; i++)
> > +             pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +     ret =3D media_entity_pads_init(&priv->subdev.entity, num_pads, pa=
ds);
> > +     if (ret) {
> > +             media_device_cleanup(media_dev);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mtk_seninf_v4l2_async_register(struct mtk_seninf *priv)
> > +{
> > +     const struct mtk_seninf_conf *conf =3D priv->conf;
> > +     struct device *dev =3D priv->dev;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     v4l2_async_nf_init(&priv->notifier, &priv->v4l2_dev);
> > +
> > +     for (i =3D 0; i < conf->nb_inputs + conf->nb_outputs; ++i) {
> > +             ret =3D mtk_seninf_fwnode_parse(dev, i);
> > +
> > +             if (ret) {
> > +                     dev_err(dev,
> > +                             "Failed to parse endpoint at port %d: %d\=
n",
>
> i is unsigned, so use %u
>
> > +                             i, ret);
> > +                     goto err_clean_notififer;
> > +             }
> > +     }
> > +
> > +     priv->notifier.ops =3D &mtk_seninf_async_ops;
> > +     ret =3D v4l2_async_nf_register(&priv->notifier);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to register async notifier: %d\n", r=
et);
> > +             goto err_clean_notififer;
> > +     }
> > +     return 0;
> > +
> > +err_clean_notififer:
> > +     v4l2_async_nf_cleanup(&priv->notifier);
> > +
> > +     return ret;
> > +}
> > +
>
> /* ----------------------------------------------------------------------=
-------
>  * Probe & Remove
>  */
>
> as we leave the "Async Subdev Notifier" section.
>
> > +static int mtk_seninf_v4l2_register(struct mtk_seninf *priv)
> > +{
> > +     struct v4l2_subdev *sd =3D &priv->subdev;
> > +     struct device *dev =3D priv->dev;
> > +     int ret;
> > +
> > +     /* Initialize media device & pads. */
> > +     ret =3D mtk_seninf_media_init(priv);
>
> This function intializes both the media device and the entity within the
> seninf subdev, while the rest of the subdev is initialized below. I
> think that makes the code flow more difficult to understand.
>
> The following function could go above, just after seninf_media_ops:
>
> static int seninf_subdev_init(struct mtk_seninf *priv)
> {
>         const unsigned int num_pads =3D priv->conf->nb_outputs
>                                     + priv->conf->nb_inputs;
>         struct v4l2_subdev *sd =3D &priv->subdev;
>         struct media_pad *pads =3D priv->pads;
>         unsigned int i;
>         int ret;
>
>         /* Initialize the entity. */
>         for (i =3D 0; i < priv->conf->nb_inputs; i++)
>                 pads[i].flags =3D MEDIA_PAD_FL_SINK;
>         for ( ; i < num_pads; i++)
>                 pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
>
>         ret =3D media_entity_pads_init(&priv->subdev.entity, num_pads, pa=
ds);
>         if (ret)
>                 return ret;
>
>         /* Initialize the subdev and its controls. */
>         v4l2_subdev_init(sd, &seninf_subdev_ops);
>         sd->internal_ops =3D &seninf_subdev_internal_ops;
>         sd->dev =3D priv->dev;
>         sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
>         sd->entity.ops =3D &seninf_media_ops;
>         sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EV=
ENTS |
>                      V4L2_SUBDEV_FL_STREAMS;
>         strscpy(sd->name, dev_name(priv->dev), sizeof(sd->name));
>         v4l2_set_subdevdata(sd, priv);
>
>         ret =3D seninf_initialize_controls(priv);
>         if (ret) {
>                 dev_err_probe(priv->dev, ret, "Failed to initialize contr=
ols\n");
>                 goto err_subdev;
>         }
>
>         ret =3D v4l2_subdev_init_finalize(sd);
>         if (ret)
>                 goto err_free_handler;
>
>         return 0;
>
> err_free_handler:
>         v4l2_ctrl_handler_free(&priv->ctrl_handler);
> err_subdev:
>         v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sd->entity);
>         return ret;
> }
>
> I would also add
>
> static void seninf_subdev_cleanup(struct mtk_seninf *priv)
> {
>         struct v4l2_subdev *sd =3D &priv->subdev;
>
>         v4l2_ctrl_handler_free(&priv->ctrl_handler);
>         v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sd->entity);
> }
>
> and use it in error paths below, as well as in .remove().
>
> Then, in this function,
>
>         /* Initialize the media_device and v4l2_device. */
>         media_dev->dev =3D dev;
>         strscpy(media_dev->model, conf->model, sizeof(media_dev->model));
>         media_dev->hw_revision =3D 0;
>         media_device_init(media_dev);
>
>         priv->v4l2_dev.mdev =3D &priv->media_dev;
>
>         ret =3D v4l2_device_register(dev, &priv->v4l2_dev);
>         if (ret) {
>                 dev_err_probe(dev, ret, "Failed to register V4L2 device\n=
");
>                 goto err_clean_media;
>         }
>
>         /* Initialize and register the SENINF subdev. */
>         ret =3D seninf_subdev_init(priv);
>         ...
>
> followed by mtk_seninf_v4l2_async_register() and
> media_device_register().
>
> You can drop mtk_seninf_media_init(). I think the result will be
> clearer.
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Initialize & register v4l2 device. */
> > +     priv->v4l2_dev.mdev =3D &priv->media_dev;
> > +
> > +     ret =3D v4l2_device_register(dev, &priv->v4l2_dev);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to register V4L2 device\n=
");
> > +             goto err_clean_media;
> > +     }
> > +
> > +     /* Initialize & register subdev. */
> > +     v4l2_subdev_init(sd, &seninf_subdev_ops);
> > +     sd->internal_ops =3D &seninf_subdev_internal_ops;
> > +     sd->dev =3D dev;
> > +     sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > +     sd->entity.ops =3D &seninf_media_ops;
> > +     sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EV=
ENTS |
>
> If "[PATCH v2 0/2] media: i2c: Drop HAS_EVENTS and event handlers" gets
> merged first, you can drop V4L2_SUBDEV_FL_HAS_EVENTS.
>
> > +                  V4L2_SUBDEV_FL_STREAMS;
> > +     strscpy(sd->name, dev_name(dev), sizeof(sd->name));
> > +     ret =3D seninf_initialize_controls(priv);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to initialize controls\n"=
);
> > +             goto err_unreg_v4l2;
> > +     }
> > +     v4l2_set_subdevdata(sd, priv);
> > +
> > +     ret =3D v4l2_subdev_init_finalize(sd);
> > +     if (ret)
> > +             goto err_free_handler;
> > +
> > +     ret =3D v4l2_device_register_subdev(&priv->v4l2_dev, sd);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to register subdev\n");
> > +             goto err_cleanup_subdev;
> > +     }
> > +
> > +     /* Set up async device */
> > +     ret =3D mtk_seninf_v4l2_async_register(priv);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret,
> > +                           "Failed to register v4l2 async notifier\n")=
;
> > +             goto err_unreg_subdev;
> > +     }
> > +
> > +     /* Register media device */
> > +     ret =3D media_device_register(&priv->media_dev);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to register media device\=
n");
> > +             goto err_unreg_notifier;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_unreg_notifier:
> > +     v4l2_async_nf_unregister(&priv->notifier);
> > +err_unreg_subdev:
> > +     v4l2_device_unregister_subdev(sd);
> > +err_cleanup_subdev:
> > +     v4l2_subdev_cleanup(sd);
> > +err_free_handler:
> > +     v4l2_ctrl_handler_free(&priv->ctrl_handler);
> > +err_unreg_v4l2:
> > +     v4l2_device_unregister(&priv->v4l2_dev);
> > +err_clean_media:
> > +     media_entity_cleanup(&sd->entity);
> > +     media_device_cleanup(&priv->media_dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static int seninf_pm_suspend(struct device *dev)
> > +{
> > +     struct mtk_seninf *priv =3D dev_get_drvdata(dev);
> > +
> > +     clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> > +
> > +     return 0;
> > +}
> > +
> > +static int seninf_pm_resume(struct device *dev)
> > +{
> > +     struct mtk_seninf *priv =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret =3D clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> > +     if (ret) {
> > +             dev_err(dev, "failed to enable clock: %d\n", ret);
>
> s/clock/clocks/
>
> > +             return ret;
> > +     }
> > +
> > +     mtk_seninf_csi2_setup_phy(priv);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct dev_pm_ops runtime_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(seninf_pm_suspend, seninf_pm_resume, NULL)
> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                             pm_runtime_force_resume)
> > +};
> > +
> > +static int seninf_probe(struct platform_device *pdev)
> > +{
> > +     static const char * const clk_names[] =3D { "camsys", "top_mux" }=
;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct mtk_seninf *priv;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->conf =3D device_get_match_data(dev);
> > +
> > +     dev_set_drvdata(dev, priv);
> > +     priv->dev =3D dev;
> > +
> > +     priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(priv->base))
> > +             return PTR_ERR(priv->base);
> > +
> > +     priv->num_clks =3D ARRAY_SIZE(clk_names);
> > +     priv->clks =3D devm_kcalloc(dev, priv->num_clks,
> > +                               sizeof(*priv->clks), GFP_KERNEL);
> > +     if (!priv->clks)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < priv->num_clks; ++i)
> > +             priv->clks[i].id =3D clk_names[i];
> > +
> > +     ret =3D devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get seninf cloc=
k\n");
>
> s/clock/clocks/
>
> > +
> > +     for (i =3D 0; i < priv->conf->nb_muxes; ++i) {
> > +             struct mtk_seninf_mux *mux =3D &priv->muxes[i];
> > +
> > +             mux->pad =3D priv->conf->nb_inputs + i;
> > +             mux->mux_id =3D i;
> > +             mux->base =3D priv->base + 0x1000 * i;
> > +             mux->seninf =3D priv;
> > +     }
> > +
> > +     devm_pm_runtime_enable(dev);
> > +
> > +     ret =3D mtk_seninf_v4l2_register(priv);
> > +     return ret;
>
>         return mtk_seninf_v4l2_register(priv);
>
> > +}
> > +
> > +static void seninf_remove(struct platform_device *pdev)
> > +{
> > +     struct mtk_seninf *priv =3D dev_get_drvdata(&pdev->dev);
> > +
> > +     media_device_unregister(&priv->media_dev);
> > +     media_device_cleanup(&priv->media_dev);
> > +     v4l2_async_nf_unregister(&priv->notifier);
> > +     v4l2_async_nf_cleanup(&priv->notifier);
> > +     v4l2_device_unregister_subdev(&priv->subdev);
> > +     v4l2_subdev_cleanup(&priv->subdev);
> > +     v4l2_ctrl_handler_free(&priv->ctrl_handler);
> > +     media_entity_cleanup(&priv->subdev.entity);
> > +     v4l2_device_unregister(&priv->v4l2_dev);
> > +}
> > +
> > +static const struct mtk_seninf_conf seninf_8365_conf =3D {
> > +     .model =3D "mtk-camsys-3.0",
> > +     .nb_inputs =3D 4,
> > +     .nb_muxes =3D 6,
> > +     .nb_outputs =3D 4,
> > +};
> > +
> > +static const struct of_device_id mtk_seninf_of_match[] =3D {
> > +     { .compatible =3D "mediatek,mt8365-seninf", .data =3D &seninf_836=
5_conf },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
> > +
> > +static struct platform_driver seninf_pdrv =3D {
> > +     .driver =3D {
> > +             .name =3D "mtk-seninf",
> > +             .pm =3D &runtime_pm_ops,
> > +             .of_match_table =3D mtk_seninf_of_match,
> > +     },
> > +     .probe  =3D seninf_probe,
> > +     .remove =3D seninf_remove,
> > +};
> > +
> > +module_platform_driver(seninf_pdrv);
> > +
> > +MODULE_DESCRIPTION("MTK sensor interface driver");
> > +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/platform/mediatek/isp/mtk_seninf_reg.h b/dri=
vers/media/platform/mediatek/isp/mtk_seninf_reg.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1f13755ab2f0239b0ab7ed2=
00523da5a7b773d1b
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/isp/mtk_seninf_reg.h
> > @@ -0,0 +1,114 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + */
> > +
> > +#ifndef __SENINF_REG_H__
> > +#define __SENINF_REG_H__
> > +
> > +#include <linux/bits.h>
> > +
> > +#define SENINF_TOP_CTRL                                               =
       0x0000
> > +#define SENINF_TOP_CTRL_MUX_LP_MODE                                  B=
IT(31)
> > +#define SENINF_TOP_CTRL_SENINF_PCLK_EN                                =
       BIT(10)
> > +#define SENINF_TOP_CTRL_SENINF2_PCLK_EN                               =
       BIT(11)
> > +#define SENINF_TOP_MUX_CTRL                                          0=
x0008
> > +#define SENINF_TOP_CAM_MUX_CTRL                                       =
       0x0010
> > +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM2_MUX_SRC_SEL               =
       GENMASK(11, 8)
> > +#define SENINF_TOP_CAM_MUX_CTRL_SENINF_CAM3_MUX_SRC_SEL               =
       GENMASK(15, 12)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI0                                =
       0x001c
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_DPHY_MODE                     B=
IT(0)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_1                       =
       GENMASK(10, 8)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_CK_SEL_2                       =
       GENMASK(13, 12)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI0_PHY_SENINF_LANE_MUX_CSI0_EN   B=
IT(31)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI1                                =
       0x0020
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_DPHY_MODE                     B=
IT(0)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_CK_SEL_1                       =
       GENMASK(10, 8)
> > +#define SENINF_TOP_PHY_SENINF_CTL_CSI1_PHY_SENINF_LANE_MUX_CSI1_EN   B=
IT(31)
> > +#define SENINF_CTRL                                                  0=
x0200
> > +#define SENINF_CTRL_SENINF_EN                                         =
       BIT(0)
> > +#define SENINF_CTRL_CSI2_SW_RST                                       =
       BIT(7)
> > +#define SENINF_CTRL_SENINF_SRC_SEL                                   G=
ENMASK(14, 12)
> > +#define SENINF_CTRL_PAD2CAM_DATA_SEL                                 G=
ENMASK(30, 28)
> > +#define SENINF_CTRL_EXT                                               =
       0x0204
> > +#define SENINF_CTRL_EXT_SENINF_TESTMDL_IP_EN                         B=
IT(1)
> > +#define SENINF_CTRL_EXT_SENINF_NCSI2_IP_EN                           B=
IT(5)
> > +#define SENINF_CTRL_EXT_SENINF_CSI2_IP_EN                            B=
IT(6)
> > +#define SENINF_TG1_PH_CNT                                            0=
x0600
> > +#define SENINF_TG1_SEN_CK                                            0=
x0604
> > +#define SENINF_TG1_SEN_CK_CLKCNT                                     G=
ENMASK(21, 16)
> > +#define SENINF_TG1_TM_CTL                                            0=
x0608
> > +#define SENINF_TG1_TM_CTL_TM_EN                                       =
       BIT(0)
> > +#define SENINF_TG1_TM_CTL_TM_FMT                                     B=
IT(2)
> > +#define SENINF_TG1_TM_CTL_TM_PAT                                     G=
ENMASK(7, 4)
> > +#define SENINF_TG1_TM_CTL_TM_VSYNC                                   G=
ENMASK(15, 8)
> > +#define SENINF_TG1_TM_CTL_TM_DUMMYPXL                                 =
       GENMASK(23, 16)
> > +#define SENINF_TG1_TM_SIZE                                           0=
x060c
> > +#define SENINF_TG1_TM_SIZE_TM_LINE                                   G=
ENMASK(29, 16)
> > +#define SENINF_TG1_TM_SIZE_TM_PXL                                    G=
ENMASK(12, 0)
> > +#define SENINF_TG1_TM_CLK                                            0=
x0610
> > +#define TEST_MODEL_CLK_DIVIDED_CNT                                   8
> > +#define SENINF_TG1_TM_STP                                            0=
x0614
> > +#define TIME_STAMP_DIVIDER                                           1
> > +#define MIPI_RX_CON24_CSI0                                           0=
x0824
> > +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN0_MUX                         G=
ENMASK(25, 24)
> > +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN1_MUX                         G=
ENMASK(27, 26)
> > +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN2_MUX                         G=
ENMASK(29, 28)
> > +#define MIPI_RX_CON24_CSI0_CSI0_BIST_LN3_MUX                         G=
ENMASK(31, 30)
> > +#define SENINF_CSI2_CTL                                               =
       0x0a00
> > +#define SENINF_CSI2_CTL_DATA_LANE0_EN                                 =
       BIT(0)
> > +#define SENINF_CSI2_CTL_DATA_LANE1_EN                                 =
       BIT(1)
> > +#define SENINF_CSI2_CTL_DATA_LANE2_EN                                 =
       BIT(2)
> > +#define SENINF_CSI2_CTL_DATA_LANE3_EN                                 =
       BIT(3)
> > +#define SENINF_CSI2_CTL_CLOCK_LANE_EN                                 =
       BIT(4)
> > +#define SENINF_CSI2_CTL_HSRX_DET_EN                                  B=
IT(7)
> > +#define SENINF_CSI2_CTL_ED_SEL                                        =
       BIT(16)
> > +#define DATA_HEADER_ORDER_DI_WCL_WCH                                 1
> > +#define SENINF_CSI2_CTL_HS_TRAIL_EN                                  B=
IT(25)
> > +#define SENINF_CSI2_CTL_CLOCK_HS_OPTION                               =
       BIT(27)
> > +#define SENINF_CSI2_LNRD_TIMING                                       =
       0x0a08
> > +#define SENINF_CSI2_LNRD_TIMING_DATA_SETTLE_PARAMETER                 =
       GENMASK(15, 8)
> > +#define SENINF_CSI2_DPCM                                             0=
x0a0c
> > +#define SENINF_CSI2_DPCM_DI_30_DPCM_EN                                =
       BIT(7)
> > +#define SENINF_CSI2_DPCM_DI_2A_DPCM_EN                                =
       BIT(15)
> > +#define SENINF_CSI2_DGB_SEL                                          0=
x0a18
> > +#define SENINF_CSI2_DGB_SEL_DEBUG_SEL                                 =
       GENMASK(7, 0)
> > +#define SENINF_CSI2_DGB_SEL_DEBUG_EN                                 B=
IT(31)
> > +#define SENINF_CSI2_SPARE0                                           0=
x0a20
> > +#define SENINF_CSI2_LNRC_FSM                                         0=
x0a28
> > +#define SENINF_CSI2_HS_TRAIL                                         0=
x0a40
> > +#define SENINF_CSI2_HS_TRAIL_HS_TRAIL_PARAMETER                       =
       GENMASK(7, 0)
> > +#define SENINF_CSI2_RESYNC_MERGE_CTL                                 0=
x0a74
> > +#define SENINF_CSI2_RESYNC_MERGE_CTL_CPHY_LANE_RESYNC_CNT            G=
ENMASK(2, 0)
> > +#define SENINF_CSI2_RESYNC_MERGE_CTL_BYPASS_LANE_RESYNC               =
       BIT(10)
> > +#define SENINF_CSI2_RESYNC_MERGE_CTL_CDPHY_SEL                        =
       BIT(11)
> > +#define SENINF_CSI2_MODE                                             0=
x0ae8
> > +#define SENINF_CSI2_MODE_CSR_CSI2_MODE                                =
       GENMASK(7, 0)
> > +#define SENINF_CSI2_MODE_CSR_CSI2_HEADER_LEN                         G=
ENMASK(10, 8)
> > +#define SENINF_CSI2_DPHY_SYNC                                         =
       0x0b20
> > +#define SENINF_CSI2_DPHY_SYNC_SYNC_SEQ_MASK_0                         =
       GENMASK(15, 0)
> > +#define SENINF_CSI2_DPHY_SYNC_SYNC_SEQ_PAT_0                         G=
ENMASK(31, 16)
> > +#define SENINF_MUX_CTRL                                               =
       0x0d00
> > +#define SENINF_MUX_CTRL_SENINF_MUX_SW_RST                            B=
IT(0)
> > +#define SENINF_MUX_CTRL_SENINF_IRQ_SW_RST                            B=
IT(1)
> > +#define SENINF_MUX_CTRL_SENINF_HSYNC_MASK                            B=
IT(7)
> > +#define SENINF_MUX_CTRL_SENINF_PIX_SEL                                =
       BIT(8)
> > +#define SENINF_MUX_CTRL_SENINF_VSYNC_POL                             B=
IT(9)
> > +#define SENINF_MUX_CTRL_SENINF_HSYNC_POL                             B=
IT(10)
> > +#define SENINF_MUX_CTRL_SENINF_SRC_SEL                                =
       GENMASK(15, 12)
> > +#define SENINF_MUX_CTRL_FIFO_PUSH_EN                                 G=
ENMASK(21, 16)
> > +#define FIFO_PUSH_EN_NORMAL_MODE                                     0=
x1f
> > +#define FIFO_PUSH_EN_JPEG_2_PIXEL_MODE                                =
       0x1e
> > +#define SENINF_MUX_CTRL_FIFO_FLUSH_EN                                 =
       GENMASK(28, 22)
> > +#define FIFO_FLUSH_EN_NORMAL_MODE                                    0=
x1b
> > +#define FIFO_FLUSH_EN_JPEG_2_PIXEL_MODE                               =
       0x18
> > +#define SENINF_MUX_CTRL_FIFO_FULL_WR_EN                               =
       GENMASK(29, 28)
> > +#define SENINF_MUX_CTRL_SENINF_MUX_EN                                 =
       BIT(31)
> > +#define SENINF_MUX_INTEN                                             0=
x0d04
> > +#define SENINF_MUX_SPARE                                             0=
x0d2c
> > +#define SENINF_FIFO_FULL_SEL                                         B=
IT(13)
> > +#define SENINF_MUX_CTRL_EXT                                          0=
x0d3c
> > +#define SENINF_MUX_CTRL_EXT_SENINF_SRC_SEL_EXT                        =
       GENMASK(1, 0)
> > +#define SENINF_MUX_CTRL_EXT_SENINF_PIX_SEL_EXT                        =
       BIT(4)
> > +
> > +#endif /* __SENINF_REG_H__ */
> >
>
> --
> Regards,
>
> Laurent Pinchart

