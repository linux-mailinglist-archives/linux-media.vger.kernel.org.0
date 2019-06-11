Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC473CA7D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 13:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390027AbfFKL4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 07:56:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53845 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389499AbfFKL4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 07:56:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so2624854wmj.3;
        Tue, 11 Jun 2019 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=/1MOR3QrJTEFCWZFdMC/DEmdNjlMHoHLCzjdZO2gpas=;
        b=tcCqahQKRNFhSuKKuHrTgh9xgWvINKKr8cpRQhx4Hpyyd/GqIFYa8WYkfhryWCySGV
         fXpSxyEUYa0GTYifC3QOrFgE7O2aykspKEIhLGjdVPQIxijuhkP5erdLaqg0/8T+3YTZ
         SGcI0Wo0yFCpV9uhSmch6O1dUkBakEXXfc93hjViYyPp/68ElEYh+Oq2YXlcLCrvNHS/
         Y5u6OoYTTKHrASe/hvFVEtRhPoEEmG2n1pFaH5x3wn1KIZcap5NdLvQHcez/Syl3bfX7
         /D6Kq+S0ev02u9kU/fluZWdvIpLkDjqks1Fgytrdmh2b4HTuw82vc6JXlR/aEaIRr8fJ
         1cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=/1MOR3QrJTEFCWZFdMC/DEmdNjlMHoHLCzjdZO2gpas=;
        b=W03zY5E6+J/Ci77uFCn1E2xYInGocIhOHS/XSlI9EoekFut5NOVht98cFV6oVunqnh
         xcd5usnozjAckU7e6UElPhQXi2DfGVR3wMTSZKVAgPgu1C8xC1Y8DqJC2BbkzIJjafqo
         Bxmu3OZPDaDAOPIhF4i5v4/hxRf+WQOAuZmglUT/X79NDRq8TDZgPFLNWlZdVKheWJ32
         9r0gqjITJKMA3W/GEts8ZCX4cfX/F9clW68x6/tztmN+C0ebaZ5/eyr7u8Asyk4Mu4pH
         k1TiXGNEqUsIIO6ZC9FJUHYC2h9teH/Wu0kqY95KFinsMUswjTJ8YyARugua4Vr9BKRI
         J0+Q==
X-Gm-Message-State: APjAAAU/3cx4Yr9g9w7/VLK58IO+ycUQmu8KygY+Dm0vECFCYlrYBXjg
        V6PRWqvTCFvxjzAe3l9snSzoMQnaiYU=
X-Google-Smtp-Source: APXvYqxKri0XmDaxau9DHr8vE7hTxWlAaPas+KdgSz6qoWEf0HDsPLpL8qzdgKkW6IuAvF6QL7KoxA==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr13608161wmb.113.1560254182345;
        Tue, 11 Jun 2019 04:56:22 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id f10sm22568606wrg.24.2019.06.11.04.56.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 04:56:21 -0700 (PDT)
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com> <20190606153825.8183-2-sebastien.szymanski@armadeus.com> <m34l4xpweh.fsf@gmail.com> <722336d1-c7f7-1796-95d5-7bba1fac7968@armadeus.com> <m3zhmo1mux.fsf@gmail.com> <df32fe2e-d9b1-8b09-686c-7f6970aa8e0c@armadeus.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
In-reply-to: <df32fe2e-d9b1-8b09-686c-7f6970aa8e0c@armadeus.com>
Date:   Tue, 11 Jun 2019 12:56:19 +0100
Message-ID: <m3wohs1gkc.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastien,
On Tue 11 Jun 2019 at 11:03, S=C3=A9bastien Szymanski wrote:
> On 6/11/19 11:40 AM, Rui Miguel Silva wrote:
>> Hi Sebastien,
>> On Tue 11 Jun 2019 at 09:16, S=C3=A9bastien Szymanski wrote:
>>> Hi Rui,
>>>
>>> thanks for the review!
>>>
>>> On 6/10/19 12:28 PM, Rui Miguel Silva wrote:
>>>> Hi Sebastien,
>>>> Thanks for the patch.
>>>>
>>>> On Thu 06 Jun 2019 at 16:38, S=C3=A9bastien Szymanski wrote:
>>>>> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L su=
pport
>>>>> to imx7-media-csi driver.
>>>>>
>>>>> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus=
.com>
>>>>> ---
>>>>>
>>>>> Changes for v2:
>>>>>  - rebase on top of linuxtv/master
>>>>>  - mention i.MX6UL/L in header and Kconfig help text
>>>>>  - rename csi_type to csi_soc_id
>>>>>
>>>>>  drivers/staging/media/imx/Kconfig          |  4 +-
>>>>>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++----=
--
>>>>>  2 files changed, 49 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/medi=
a/imx/Kconfig
>>>>> index ad3d7df6bb3c..8b6dc42c39e0 100644
>>>>> --- a/drivers/staging/media/imx/Kconfig
>>>>> +++ b/drivers/staging/media/imx/Kconfig
>>>>> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>>>>>  	  A video4linux camera sensor interface driver for i.MX5/6.
>>>>>
>>>>>  config VIDEO_IMX7_CSI
>>>>> -	tristate "i.MX7 Camera Sensor Interface driver"
>>>>> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>>>>>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>>>>>  	default y
>>>>>  	help
>>>>>  	  Enable support for video4linux camera sensor interface driver for
>>>>> -	  i.MX7.
>>>>> +	  i.MX6UL/L or i.MX7.
>>>>>  endmenu
>>>>>  endif
>>>>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/sta=
ging/media/imx/imx7-media-csi.c
>>>>> index 9101566f3f67..902bdce594cf 100644
>>>>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>>>>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>>>>> @@ -1,6 +1,6 @@
>>>>>  // SPDX-License-Identifier: GPL-2.0
>>>>>  /*
>>>>> - * V4L2 Capture CSI Subdev for Freescale i.MX7 SOC
>>>>> + * V4L2 Capture CSI Subdev for Freescale i.MX6UL/L / i.MX7 SOC
>>>>>   *
>>>>>   * Copyright (c) 2019 Linaro Ltd
>>>>>   *
>>>>> @@ -152,6 +152,11 @@
>>>>>  #define CSI_CSICR18		0x48
>>>>>  #define CSI_CSICR19		0x4c
>>>>>
>>>>> +enum csi_soc_id {
>>>>> +	IMX7,
>>>>> +	IMX6UL
>>>>> +};
>>>>> +
>>>>>  struct imx7_csi {
>>>>>  	struct device *dev;
>>>>>  	struct v4l2_subdev sd;
>>>>> @@ -191,6 +196,7 @@ struct imx7_csi {
>>>>>  	bool is_init;
>>>>>  	bool is_streaming;
>>>>>  	bool is_csi2;
>>>>> +	enum csi_soc_id soc_id;
>>>>>
>>>>>  	struct completion last_eof_completion;
>>>>>  };
>>>>> @@ -548,6 +554,14 @@ static int imx7_csi_pad_link_validate(struct v4l=
2_subdev *sd,
>>>>>  	if (ret)
>>>>>  		return ret;
>>>>>
>>>>> +	if (csi->soc_id =3D=3D IMX6UL) {
>>>>> +		mutex_lock(&csi->lock);
>>>>> +		csi->is_csi2 =3D false;
>>>>> +		mutex_unlock(&csi->lock);
>>>>> +
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>>  	ret =3D imx7_csi_get_upstream_endpoint(csi, &upstream_ep, true);
>>>>>  	if (ret) {
>>>>>  		v4l2_err(&csi->sd, "failed to find upstream endpoint\n");
>>>>> @@ -757,6 +771,7 @@ static int imx7_csi_configure(struct imx7_csi *cs=
i)
>>>>>  	struct v4l2_pix_format *out_pix =3D &vdev->fmt.fmt.pix;
>>>>>  	__u32 in_code =3D csi->format_mbus[IMX7_CSI_PAD_SINK].code;
>>>>>  	u32 cr1, cr18;
>>>>> +	int width =3D out_pix->width;
>>>>>
>>>>>  	if (out_pix->field =3D=3D V4L2_FIELD_INTERLACED) {
>>>>>  		imx7_csi_deinterlace_enable(csi, true);
>>>>> @@ -766,15 +781,27 @@ static int imx7_csi_configure(struct imx7_csi *=
csi)
>>>>>  		imx7_csi_buf_stride_set(csi, 0);
>>>>>  	}
>>>>>
>>>>> -	imx7_csi_set_imagpara(csi, out_pix->width, out_pix->height);
>>>>> +	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
>>>>> +
>>>>> +	if (!csi->is_csi2) {
>>>>> +		if (out_pix->pixelformat =3D=3D V4L2_PIX_FMT_UYVY ||
>>>>> +		    out_pix->pixelformat =3D=3D V4L2_PIX_FMT_YUYV)
>>>>> +			width *=3D 2;
>>>>> +
>>>>> +		imx7_csi_set_imagpara(csi, width, out_pix->height);
>>>>> +
>>>>> +		cr18 |=3D (BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
>>>>> +			BIT_BASEADDR_CHG_ERR_EN);
>>>>> +		imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
>>>>>
>>>>> -	if (!csi->is_csi2)
>>>>>  		return 0;
>>>>> +	}
>>>>> +
>>>>> +	imx7_csi_set_imagpara(csi, width, out_pix->height);
>>>>>
>>>>>  	cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);
>>>>>  	cr1 &=3D ~BIT_GCLK_MODE;
>>>>>
>>>>> -	cr18 =3D imx7_csi_reg_read(csi, CSI_CSICR18);
>>>>>  	cr18 &=3D BIT_MIPI_DATA_FORMAT_MASK;
>>>>>  	cr18 |=3D BIT_DATA_FROM_MIPI;
>>>>>
>>>>> @@ -809,11 +836,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
>>>>>  {
>>>>>  	imx7_csi_sw_reset(csi);
>>>>>
>>>>> -	if (csi->is_csi2) {
>>>>> -		imx7_csi_dmareq_rff_enable(csi);
>>>>> -		imx7_csi_hw_enable_irq(csi);
>>>>> -		imx7_csi_hw_enable(csi);
>>>>> -	}
>>>>> +	imx7_csi_dmareq_rff_enable(csi);
>>>>> +	imx7_csi_hw_enable_irq(csi);
>>>>> +	imx7_csi_hw_enable(csi);
>>>>>  }
>>>>>
>>>>>  static void imx7_csi_disable(struct imx7_csi *csi)
>>>>> @@ -1166,19 +1191,32 @@ static int imx7_csi_parse_endpoint(struct dev=
ice *dev,
>>>>>  	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
>>>>>  }
>>>>>
>>>>> +static const struct of_device_id imx7_csi_of_match[] =3D {
>>>>> +	{ .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7 },
>>>>> +	{ .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX6UL },
>>>>
>>>> looking at this again I think we can do this is a different way.
>>>> Instead data being the soc_id, just set here if it is_csi2 or not.
>>>>
>>>> This would avoid to add a soc_id  to the struct that it really it
>>>> is used only to setup the is_csi2 var. I think this will make this
>>>> patch a lot simpler.
>>>
>>> Well, I have added this soc_id because imx7_csi_get_upstream_endpoint in
>>> imx7_csi_pad_link_validate fails:
>>>
>>> [  366.549768] csi: failed to find upstream endpoint
>>> [  366.556274] csi: pipeline start failed with -19
>>>
>>
>> I think this fails because you do not define any endpoint for the
>> csi in your board dts file. I see in patch 1/3 the setup of csi,
>> disabled, but not the endpoint connecting csi with the ov5640 in
>> your board file (see the connection between mipi imx7 and ov2680
>> in the imx7-warp.dts, or the ov5640.txt file).
>
> I actually do, in the device tree of my board I have:

Yeah, I thought you did this, because if not it did not work in
the first place. I will take a look at why the fetch of the
upstream endpoint is not working. it should :).

Thanks for the feedback. I will let you know.

---
Cheers,
	Rui

>
> &csi {
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&pinctrl_csi>;
> 	status =3D "okay";
>
> 	port {
> 		csi_ep: endpoint {
> 			remote-endpoint =3D <&ov5640_ep>;
> 			bus-type =3D <5>; // V4L2_FWNODE_BUS_TYPE_PARALLEL
> 		};
> 	};
> };
>
> and
>
> &i2c2 {
> ..
> 	ov5640: camera@3c {
> 		...
> 		port {
>                         ov5640_ep: endpoint {
>                                 remote-endpoint =3D <&csi_ep>;
>                                 bus-width =3D <8>;
>                                 data-shift =3D <2>; /* lines 9:2 are used=
 */
>                                 hsync-active =3D <0>;
>                                 vsync-active =3D <1>;
>                                 pclk-sample =3D <0>;
>                         };
>                 };
> 	};
> };
>
> Regards,
