Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0074B3CD21
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 15:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403861AbfFKNjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 09:39:20 -0400
Received: from 14.mo6.mail-out.ovh.net ([46.105.56.113]:34385 "EHLO
        14.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389298AbfFKNjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 09:39:20 -0400
X-Greylist: delayed 19033 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Jun 2019 09:39:19 EDT
Received: from player774.ha.ovh.net (unknown [10.109.159.154])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id F3D831D0703
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 12:03:35 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player774.ha.ovh.net (Postfix) with ESMTPSA id EB6756AF51B5;
        Tue, 11 Jun 2019 10:03:16 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
To:     Rui Miguel Silva <rmfrfs@gmail.com>
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
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
 <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
 <m34l4xpweh.fsf@gmail.com>
 <722336d1-c7f7-1796-95d5-7bba1fac7968@armadeus.com>
 <m3zhmo1mux.fsf@gmail.com>
From:   =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Openpgp: preference=signencrypt
Message-ID: <df32fe2e-d9b1-8b09-686c-7f6970aa8e0c@armadeus.com>
Date:   Tue, 11 Jun 2019 12:03:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <m3zhmo1mux.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8968637183800988741
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 11:40 AM, Rui Miguel Silva wrote:
> Hi Sebastien,
> On Tue 11 Jun 2019 at 09:16, Sébastien Szymanski wrote:
>> Hi Rui,
>>
>> thanks for the review!
>>
>> On 6/10/19 12:28 PM, Rui Miguel Silva wrote:
>>> Hi Sebastien,
>>> Thanks for the patch.
>>>
>>> On Thu 06 Jun 2019 at 16:38, Sébastien Szymanski wrote:
>>>> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
>>>> to imx7-media-csi driver.
>>>>
>>>> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
>>>> ---
>>>>
>>>> Changes for v2:
>>>>  - rebase on top of linuxtv/master
>>>>  - mention i.MX6UL/L in header and Kconfig help text
>>>>  - rename csi_type to csi_soc_id
>>>>
>>>>  drivers/staging/media/imx/Kconfig          |  4 +-
>>>>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
>>>>  2 files changed, 49 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
>>>> index ad3d7df6bb3c..8b6dc42c39e0 100644
>>>> --- a/drivers/staging/media/imx/Kconfig
>>>> +++ b/drivers/staging/media/imx/Kconfig
>>>> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>>>>  	  A video4linux camera sensor interface driver for i.MX5/6.
>>>>
>>>>  config VIDEO_IMX7_CSI
>>>> -	tristate "i.MX7 Camera Sensor Interface driver"
>>>> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>>>>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>>>>  	default y
>>>>  	help
>>>>  	  Enable support for video4linux camera sensor interface driver for
>>>> -	  i.MX7.
>>>> +	  i.MX6UL/L or i.MX7.
>>>>  endmenu
>>>>  endif
>>>> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
>>>> index 9101566f3f67..902bdce594cf 100644
>>>> --- a/drivers/staging/media/imx/imx7-media-csi.c
>>>> +++ b/drivers/staging/media/imx/imx7-media-csi.c
>>>> @@ -1,6 +1,6 @@
>>>>  // SPDX-License-Identifier: GPL-2.0
>>>>  /*
>>>> - * V4L2 Capture CSI Subdev for Freescale i.MX7 SOC
>>>> + * V4L2 Capture CSI Subdev for Freescale i.MX6UL/L / i.MX7 SOC
>>>>   *
>>>>   * Copyright (c) 2019 Linaro Ltd
>>>>   *
>>>> @@ -152,6 +152,11 @@
>>>>  #define CSI_CSICR18		0x48
>>>>  #define CSI_CSICR19		0x4c
>>>>
>>>> +enum csi_soc_id {
>>>> +	IMX7,
>>>> +	IMX6UL
>>>> +};
>>>> +
>>>>  struct imx7_csi {
>>>>  	struct device *dev;
>>>>  	struct v4l2_subdev sd;
>>>> @@ -191,6 +196,7 @@ struct imx7_csi {
>>>>  	bool is_init;
>>>>  	bool is_streaming;
>>>>  	bool is_csi2;
>>>> +	enum csi_soc_id soc_id;
>>>>
>>>>  	struct completion last_eof_completion;
>>>>  };
>>>> @@ -548,6 +554,14 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
>>>>  	if (ret)
>>>>  		return ret;
>>>>
>>>> +	if (csi->soc_id == IMX6UL) {
>>>> +		mutex_lock(&csi->lock);
>>>> +		csi->is_csi2 = false;
>>>> +		mutex_unlock(&csi->lock);
>>>> +
>>>> +		return 0;
>>>> +	}
>>>> +
>>>>  	ret = imx7_csi_get_upstream_endpoint(csi, &upstream_ep, true);
>>>>  	if (ret) {
>>>>  		v4l2_err(&csi->sd, "failed to find upstream endpoint\n");
>>>> @@ -757,6 +771,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>>>>  	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
>>>>  	__u32 in_code = csi->format_mbus[IMX7_CSI_PAD_SINK].code;
>>>>  	u32 cr1, cr18;
>>>> +	int width = out_pix->width;
>>>>
>>>>  	if (out_pix->field == V4L2_FIELD_INTERLACED) {
>>>>  		imx7_csi_deinterlace_enable(csi, true);
>>>> @@ -766,15 +781,27 @@ static int imx7_csi_configure(struct imx7_csi *csi)
>>>>  		imx7_csi_buf_stride_set(csi, 0);
>>>>  	}
>>>>
>>>> -	imx7_csi_set_imagpara(csi, out_pix->width, out_pix->height);
>>>> +	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
>>>> +
>>>> +	if (!csi->is_csi2) {
>>>> +		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
>>>> +		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
>>>> +			width *= 2;
>>>> +
>>>> +		imx7_csi_set_imagpara(csi, width, out_pix->height);
>>>> +
>>>> +		cr18 |= (BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
>>>> +			BIT_BASEADDR_CHG_ERR_EN);
>>>> +		imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
>>>>
>>>> -	if (!csi->is_csi2)
>>>>  		return 0;
>>>> +	}
>>>> +
>>>> +	imx7_csi_set_imagpara(csi, width, out_pix->height);
>>>>
>>>>  	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
>>>>  	cr1 &= ~BIT_GCLK_MODE;
>>>>
>>>> -	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
>>>>  	cr18 &= BIT_MIPI_DATA_FORMAT_MASK;
>>>>  	cr18 |= BIT_DATA_FROM_MIPI;
>>>>
>>>> @@ -809,11 +836,9 @@ static void imx7_csi_enable(struct imx7_csi *csi)
>>>>  {
>>>>  	imx7_csi_sw_reset(csi);
>>>>
>>>> -	if (csi->is_csi2) {
>>>> -		imx7_csi_dmareq_rff_enable(csi);
>>>> -		imx7_csi_hw_enable_irq(csi);
>>>> -		imx7_csi_hw_enable(csi);
>>>> -	}
>>>> +	imx7_csi_dmareq_rff_enable(csi);
>>>> +	imx7_csi_hw_enable_irq(csi);
>>>> +	imx7_csi_hw_enable(csi);
>>>>  }
>>>>
>>>>  static void imx7_csi_disable(struct imx7_csi *csi)
>>>> @@ -1166,19 +1191,32 @@ static int imx7_csi_parse_endpoint(struct device *dev,
>>>>  	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
>>>>  }
>>>>
>>>> +static const struct of_device_id imx7_csi_of_match[] = {
>>>> +	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7 },
>>>> +	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX6UL },
>>>
>>> looking at this again I think we can do this is a different way.
>>> Instead data being the soc_id, just set here if it is_csi2 or not.
>>>
>>> This would avoid to add a soc_id  to the struct that it really it
>>> is used only to setup the is_csi2 var. I think this will make this
>>> patch a lot simpler.
>>
>> Well, I have added this soc_id because imx7_csi_get_upstream_endpoint in
>> imx7_csi_pad_link_validate fails:
>>
>> [  366.549768] csi: failed to find upstream endpoint
>> [  366.556274] csi: pipeline start failed with -19
>>
> 
> I think this fails because you do not define any endpoint for the
> csi in your board dts file. I see in patch 1/3 the setup of csi,
> disabled, but not the endpoint connecting csi with the ov5640 in
> your board file (see the connection between mipi imx7 and ov2680
> in the imx7-warp.dts, or the ov5640.txt file).

I actually do, in the device tree of my board I have:

&csi {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_csi>;
	status = "okay";

	port {
		csi_ep: endpoint {
			remote-endpoint = <&ov5640_ep>;
			bus-type = <5>; // V4L2_FWNODE_BUS_TYPE_PARALLEL
		};
	};
};

and

&i2c2 {
..
	ov5640: camera@3c {
		...
		port {
                        ov5640_ep: endpoint {
                                remote-endpoint = <&csi_ep>;
                                bus-width = <8>;
                                data-shift = <2>; /* lines 9:2 are used */
                                hsync-active = <0>;
                                vsync-active = <1>;
                                pclk-sample = <0>;
                        };
                };
	};
};

Regards,

> 
> ---
> Cheers,
>         Rui
> 
> 
>>
>> My pipeline is:
>>
>> Device topology
>> - entity 1: csi (2 pads, 2 links)
>>             type V4L2 subdev subtype Unknown flags 0
>>             device node name /dev/v4l-subdev0
>>         pad0: Sink
>>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
>> xfer:srgb ycbcr:601 quantization:full-range]
>>                 <- "ov5640 1-003c":0 [ENABLED]
>>         pad1: Source
>>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
>> xfer:srgb ycbcr:601 quantization:full-range]
>>                 -> "csi capture":0 [ENABLED]
>>
>> - entity 4: csi capture (1 pad, 1 link)
>>             type Node subtype V4L flags 0
>>             device node name /dev/video1
>>         pad0: Sink
>>                 <- "csi":1 [ENABLED]
>>
>> - entity 10: ov5640 1-003c (1 pad, 1 link)
>>              type V4L2 subdev subtype Sensor flags 0
>>              device node name /dev/v4l-subdev1
>>         pad0: Source
>>                 [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb
>> xfer:srgb ycbcr:601 quantization:full-range]
>>                 -> "csi":0 [ENABLED]
>>
>>
>> Maybe we should fix this ?
>>
>> Regards,
>>
>>>
>>>> +	{ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
>>>> +
>>>>  static int imx7_csi_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct device *dev = &pdev->dev;
>>>>  	struct device_node *node = dev->of_node;
>>>>  	struct imx_media_dev *imxmd;
>>>>  	struct imx7_csi *csi;
>>>> +	const struct of_device_id *of_id;
>>>>  	int ret;
>>>>
>>>> +	of_id = of_match_node(imx7_csi_of_match, node);
>>>
>>> With the above said, here I think we can use the of_match_device?
>>>
>>> hope this makes sense also to you.
>>>
>>> Once again thanks for the patches.
>>>
>>> ---
>>> Cheers,
>>>         Rui
>>>
>>>> +	if (!of_id)
>>>> +		return -ENODEV;
>>>> +
>>>>  	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>>>>  	if (!csi)
>>>>  		return -ENOMEM;
>>>>
>>>>  	csi->dev = dev;
>>>> +	csi->soc_id = (enum csi_soc_id)of_id->data;
>>>>
>>>>  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
>>>>  	if (IS_ERR(csi->mclk)) {
>>>> @@ -1294,12 +1332,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
>>>>  	return 0;
>>>>  }
>>>>
>>>> -static const struct of_device_id imx7_csi_of_match[] = {
>>>> -	{ .compatible = "fsl,imx7-csi" },
>>>> -	{ },
>>>> -};
>>>> -MODULE_DEVICE_TABLE(of, imx7_csi_of_match);
>>>> -
>>>>  static struct platform_driver imx7_csi_driver = {
>>>>  	.probe = imx7_csi_probe,
>>>>  	.remove = imx7_csi_remove,
>>>
> 


-- 
Sébastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
