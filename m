Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEA450FF27
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 15:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351025AbiDZNiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 09:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351013AbiDZNiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 09:38:20 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD24E38AA
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:35:07 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QALrwD009527;
        Tue, 26 Apr 2022 15:34:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=v6mUR4F+IwFHpDLnJ3oDmw8gjwAlGezkvoLYUKJLAU8=;
 b=DZZZw9xH6FYB2YZWdh75xKDnhNRmJpCaeTimACXjgKv+2bSHgSWw82wBF1/Xab+DNpOK
 LnL04iWY/PrHMzhb3UCnnEcTeuRGk1XkW+ric4ZhpLFWGeVv3cQjPI3VCez3euge37JR
 XylU5PTODoKg+ILauGoliU8SBoLlsQYkWdVoAQ/dG5YXhJwkuNakN4afBEmetIg2ZKPw
 pYgMMKsw6S+dko5sDu5AztOMh5WFOUkVCPg9GMZK3fx9JQRK+RbyW/ADvkSRl98mbpHi
 5offqv+p2RWurJ08ChKce9Gf1mQoC7aoPodXBVFJtwd7YhjP/hlTMVPhfoerzi0jQ/6R 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6vkfk19-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Apr 2022 15:34:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C31710002A;
        Tue, 26 Apr 2022 15:34:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 532F92291D7;
        Tue, 26 Apr 2022 15:34:08 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr
 2022 15:34:07 +0200
Subject: Re: [PATCH v5 06/27] media: ov5640: Update pixel_rate and link_freq
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <Eugen.Hristev@microchip.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <20220224094313.233347-7-jacopo@jmondi.org>
 <1d891351-3bb5-1c31-9303-1330f28a45ec@foss.st.com>
 <20220411164646.q6ydhjwiud2tp3mq@uno.localdomain>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <dc62962a-ca38-35e0-093b-6fff35979d8a@foss.st.com>
Date:   Tue, 26 Apr 2022 15:34:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220411164646.q6ydhjwiud2tp3mq@uno.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 4/11/22 6:46 PM, Jacopo Mondi wrote:
> Hi Hugues,
> 
> On Thu, Apr 07, 2022 at 06:25:57PM +0200, Hugues FRUCHET - FOSS wrote:
>> Hi Jacopo,
>>
>> Issue with link frequency value reported, see below.
>>
>> On 2/24/22 10:42 AM, Jacopo Mondi wrote:
>>> After having set a new format re-calculate the pixel_rate and link_freq
>>> control values and update them when in MIPI mode.
>>>
>>> Take into account the limitation of the link frequency having to be
>>> strictly smaller than 1GHz when computing the desired link_freq, and
>>> adjust the resulting pixel_rate acounting for the clock tree
>>> configuration.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>    drivers/media/i2c/ov5640.c | 66 ++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 64 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index f9763edf2422..791694bfed41 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -31,6 +31,8 @@
>>>    #define OV5640_DEFAULT_SLAVE_ID 0x3c
>>> +#define OV5640_LINK_RATE_MAX		490000000U
>>> +
>>>    #define OV5640_REG_SYS_RESET02		0x3002
>>>    #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
>>>    #define OV5640_REG_SYS_CTRL0		0x3008
>>> @@ -2412,6 +2414,66 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>>>    	return 0;
>>>    }
>>> +static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>>> +{
>>> +	const struct ov5640_mode_info *mode = sensor->current_mode;
>>> +	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>>> +	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>>> +	unsigned int i = 0;
>>> +	u32 pixel_rate;
>>> +	s64 link_freq;
>>> +	u32 num_lanes;
>>> +	u32 bpp;
>>> +
>>> +	/*
>>> +	 * Update the pixel rate control value.
>>> +	 *
>>> +	 * For DVP mode, maintain the pixel rate calculation using fixed FPS.
>>> +	 */
>>> +	if (!ov5640_is_csi2(sensor)) {
>>> +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
>>> +					 ov5640_calc_pixel_rate(sensor));
>>> +
>>> +		return 0;
>>> +	}
>>> +
>>> +	/*
>>> +	 * The MIPI CSI-2 link frequency should comply with the CSI-2
>>> +	 * specification and be lower than 1GHz.
>>> +	 *
>>> +	 * Start from the suggested pixel_rate for the current mode and
>>> +	 * progressively slow it down if it exceeds 1GHz.
>>> +	 */
>>> +	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
>>> +	bpp = ov5640_code_to_bpp(fmt->code);
>>> +	do {
>>> +		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
>>> +		link_freq = pixel_rate * bpp / (2 * num_lanes);
>>> +	} while (link_freq >= 1000000000U &&
>>> +		 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
>>> +
>>> +	/*
>>> +	 * Higher link rates require the clock tree to be programmed with
>>> +	 * 'mipi_div' = 1; this has the effect of halving the actual output
>>> +	 * pixel rate in the MIPI domain.
>>> +	 *
>>> +	 * Adjust the pixel rate control value to report it correctly to
>>> +	 * userspace.
>>> +	 */
>>> +	if (link_freq > OV5640_LINK_RATE_MAX)
>>> +		pixel_rate /= 2;
>>
>> Need to divide also the link_frequency (st-mipid02 bridge interfacing is
>> broken here). Patch proposal below:
>>
>> +	sensor->current_link_freq = link_freq;
>> +
>> +	 * Adjust the pixel rate & link frequency control value to report it
>> +	 * correctly to userspace.
>>   	 */
>> -	if (link_freq > OV5640_LINK_RATE_MAX)
>> +	if (link_freq > OV5640_LINK_RATE_MAX) {
>>   		pixel_rate /= 2;
>> +		link_freq /= 2;
>> +	}
> 
> This has been my headache for a long time and I'm still not 100%
> convinced what I have here is the best solution, but at least works
> for more much modes than what it used to.
> 
> Can I ask how did you get to the conclusion that link_rate should be
> halved ? Is your receiver driver complaining ? Have you sampled the
> actual link frequency ?

First because nothing was working on my setup when reaching the 
OV5640_LINK_RATE_MAX limit, this concerns resolutions >= 1280x720, 
resolutions below are running fine.

Reading code and coming to this exact line, I was thinking that it was 
an obvious point, because pixel_rate and link_freq are correlated:
  * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
and my hypothesis was that the receiver of your test setup was using the 
pixel_rate CID and not the link_freq, while my mipid02 receiver reads 
first the link_freq CID, so it was making sense...

Here are the pixel_rate/link_freq/pclk_period tested OK on my setup for 
all resolutions with 15 & 30fps:

QCIF 176x144 RGB565 15fps => OK, got 15
QCIF 176x144 YUYV 15fps   => OK, got 15
QCIF 176x144 JPEG 15fps   => OK, got 15
rate=48000000, freq=192000000, mipi_div=2, pclk_period=20, htot=1600, 
height=144, vblank=1856

QCIF 176x144 RGB565 30fps => OK, got 30
QCIF 176x144 YUYV 30fps   => OK, got 30
QCIF 176x144 JPEG 30fps   => OK, got 30
rate=48000000, freq=192000000, mipi_div=2, pclk_period=20, htot=1600, 
height=144, vblank=854

QVGA 320x240 RGB565 15fps => OK, got 15
QVGA 320x240 YUYV 15fps   => OK, got 15
QVGA 320x240 JPEG 15fps   => OK, got 15
rate=48000000, freq=192000000, mipi_div=2, pclk_period=20, htot=1600, 
height=240, vblank=1760

QVGA 320x240 RGB565 30fps => OK, got 30
QVGA 320x240 YUYV 30fps   => OK, got 30
QVGA 320x240 JPEG 30fps   => OK, got 30
rate=48000000, freq=192000000, mipi_div=2, pclk_period=20, htot=1600, 
height=240, vblank=760


VGA 640x480 RGB565 15fps => OK, got 15
VGA 640x480 YUYV 15fps   => OK, got 15
VGA 640x480 JPEG 15fps   => OK, got 15
  rate=48000000, freq=192000000, mipi_div=2, pclk_period=20, htot=1600, 
height=480, vblank=1520

VGA 640x480 RGB565 30fps => OK, got 30
VGA 640x480 YUYV 30fps   => OK, got 30
VGA 640x480 JPEG 30fps   => OK, got 30
rate=48000000, freq=192000000, mipi_div=2, pclk_period=20, htot=1600, 
height=480, vblank=520

480p 720x480 RGB565 15fps => OK, got 15
480p 720x480 YUYV 15fps   => OK, got 15
480p 720x480 JPEG 15fps   => OK, got 15
rate=96000000, freq=384000000, mipi_div=2, pclk_period=10, htot=1896, 
height=480, vblank=2895

480p 720x480 RGB565 30fps => OK, got 30
480p 720x480 YUYV 30fps   => OK, got 30
480p 720x480 JPEG 30fps   => OK, got 30
rate=96000000, freq=384000000, mipi_div=2, pclk_period=10, htot=1896, 
height=480, vblank=1206

XGA 1024x768 RGB565 15fps => OK, got 15
XGA 1024x768 YUYV 15fps   => OK, got 15
XGA 1024x768 JPEG 15fps   => OK, got 15
rate=96000000, freq=384000000, mipi_div=2, pclk_period=10, htot=1896, 
height=768, vblank=2607

XGA 1024x768 RGB565 30fps => OK, got 30
XGA 1024x768 YUYV 30fps   => OK, got 30
XGA 1024x768 JPEG 30fps   => OK, got 30
rate=96000000, freq=384000000, mipi_div=2, pclk_period=10, htot=1896, 
height=768, vblank=918

720p 1280x720 RGB565 15fps => OK, got 15
720p 1280x720 YUYV 15fps   => OK, got 15
720p 1280x720 JPEG 15fps   => OK, got 15
rate=62000000, freq=248000000, mipi_div=1, pclk_period=16, htot=1600, 
height=720, vblank=1863

720p 1280x720 RGB565 30fps => OK, got 30
720p 1280x720 YUYV 30fps   => OK, got 30
720p 1280x720 JPEG 30fps   => OK, got 30
rate=62000000, freq=248000000, mipi_div=1, pclk_period=16, htot=1600, 
height=720, vblank=560

HD 1920x1080 RGB565 15fps => OK, got 15
HD 1920x1080 YUYV 15fps   => OK, got 15
HD 1920x1080 JPEG 15fps   => OK, got 15
rate=74000000, freq=296000000, mipi_div=1, pclk_period=13, htot=2234, 
height=1080, vblank=1128

HD 1920x1080 RGB565 30fps => OK, got 30
HD 1920x1080 YUYV 30fps   => OK, got 30
HD 1920x1080 JPEG 30fps   => OK, got 30
rate=74000000, freq=296000000, mipi_div=1, pclk_period=13, htot=2234, 
height=1080, vblank=24

5Mp 2592x1944 RGB565 15fps => OK, got 15
5Mp 2592x1944 YUYV 15fps   => OK, got 14
5Mp 2592x1944 JPEG 15fps   => OK, got 15
rate=84000000, freq=336000000, mipi_div=1, pclk_period=11, htot=2844, 
height=1944, vblank=24


> 
> I tried applying your patch and
> 
> 1) on imx8mp with mipi-csis receiver your patch breaks a few modes but
>     still works for most of them. The system seems unstable compared to
>     the original version, and sometimes I get hangs/segfauls for high
>     resolution modes. The receiver driver is the mipi-csis one [1]
> 
>     [1] drivers/media/platform/imx/imx-mipi-csis.c

There was a problem with pclk_period computation, please git it a try 
with the new version.

> 
> 2) on i.MX6 I spent quite some time debugging why high-res modes do
>     not work there with my series, and my understanding is that the i.MX6
>     CSI-2 receiver only supports a total bandwidth of 1Gbps/lane, which
>     the high res modes of the ov5640 sensor exceeds, having a clock rate
>     frequency of 672 MHz.  (Unrelated: the limitation of 1Gbps might be due
>     to the fact the i.MX6 receiver implements the v1.0 version of the
>     CSI-2 specs, but I found nowhere a confirmation that v1.0 is limited
>     to 1Gbps compared to the 1.5Gbps limit of v1.1).
> 
>     If I apply your patch I can capture 1080p and full res, but the
>     images are crippled. The pixels are repeated multiple times in the final
>     image, I cannot tell if that's an issue on the receiver or due to the
>     link rate being actually faster than what reported with your change.
> 
> Could you on how you got to halve the reported pixel rate ?
> 
> Others have tested with other csi-2 receivers which sample link freq
> using v4l2_get_link_freq() as well, and they have not reported issues
> afaict.
> 

I feel that we should share the same test procedure in order to confirm 
test verdicts for all known platforms.

> (Please note that using a link_freq that doesn't come from the control
> in ov5640_set_mipi_pclk() makes it harder to tune the pixel rate from
> userspace to accommodate more configurations, as I suggested we should
> do in reply to "[PATCH v5 16/27] media: ov5640: Add VBLANK control"
> but it might still be doable).
> 
> Thanks a lot for testing!
>     j
> 
> 
> [2] That's what I have applied
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index faca36dc4187..910b58fb1e08 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -461,6 +461,7 @@ struct ov5640_dev {
> 
>          bool pending_mode_change;
>          bool streaming;
> +       s64 current_link_freq;
>   };
> 
>   static inline struct ov5640_dev *to_ov5640_dev(struct v4l2_subdev *sd)
> @@ -1439,7 +1440,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
>          int ret;
> 
>          /* Use the link frequency computed at ov5640_update_pixel_rate() time. */
> -       link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
> +       link_freq = sensor->current_link_freq;
> 
>          /*
>           * - mipi_div - Additional divider for the MIPI lane clock.
> @@ -2836,6 +2837,8 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>          } while (link_freq >= 1000000000U &&
>                   ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
> 
> +       sensor->current_link_freq = link_freq;
> +
>          /*
>           * Higher link rates require the clock tree to be programmed with
>           * 'mipi_div' = 1; this has the effect of halving the actual output
> @@ -2844,8 +2847,10 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>           * Adjust the pixel rate control value to report it correctly to
>           * userspace.
>           */
> -       if (link_freq > OV5640_LINK_RATE_MAX)
> +       if (link_freq > OV5640_LINK_RATE_MAX) {
>                  pixel_rate /= 2;
> +               link_freq /= 2;
> +       }
> 
>          for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
>                  if (ov5640_csi2_link_freqs[i] == link_freq)
> @@ -3777,6 +3782,7 @@ static int ov5640_probe(struct i2c_client *client)
>          sensor->current_mode =
>                  &ov5640_mode_data[OV5640_MODE_VGA_640_480];
>          sensor->last_mode = sensor->current_mode;
> +       sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
> 
>          sensor->ae_target = 52;
> 
> 
> 
> 
>>
>>
>> Doing so we cannot relay anymore on link_frequency control reading in
>> ov5640_set_mipi_pclk(), use current_link_freq variable instead
>>
>> @@ -1440,7 +1453,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev
>> *sensor)
>>   	int ret;
>>
>>   	/* Use the link freq computed at ov5640_update_pixel_rate() time. */
>> -	link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
>> +	link_freq = sensor->current_link_freq;
>>
>> @@ -3782,6 +3811,7 @@ static int ov5640_probe(struct i2c_client *client)
>>   	sensor->current_mode =
>>   		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
>>   	sensor->last_mode = sensor->current_mode;
>> +	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
>>
>>
>>
>>
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
>>> +		if (ov5640_csi2_link_freqs[i] == link_freq)
>>> +			break;
>>> +	}
>>> +
>>> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
>>> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static int ov5640_set_fmt(struct v4l2_subdev *sd,
>>>    			  struct v4l2_subdev_state *sd_state,
>>>    			  struct v4l2_subdev_format *format)
>>> @@ -2451,8 +2513,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>>>    	/* update format even if code is unchanged, resolution might change */
>>>    	sensor->fmt = *mbus_fmt;
>>> -	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
>>> -				 ov5640_calc_pixel_rate(sensor));
>>> +	ov5640_update_pixel_rate(sensor);
>>> +
>>>    out:
>>>    	mutex_unlock(&sensor->lock);
>>>    	return ret;
>>>
>>
>> Hugues.

Hugues.
