Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8554CA1C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 10:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfFTI5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 04:57:48 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37659 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbfFTI5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 04:57:47 -0400
Received: from [IPv6:2001:983:e9a7:1:bdf4:9145:f694:e7a2] ([IPv6:2001:983:e9a7:1:bdf4:9145:f694:e7a2])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dst6hWZyGSfvXdst7htbE9; Thu, 20 Jun 2019 10:57:46 +0200
Subject: Re: [PATCH] media: ov5640: add support of V4L2_CID_LINK_FREQ
To:     Hugues Fruchet <hugues.fruchet@st.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <1560779277-32465-1-git-send-email-hugues.fruchet@st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6a5c05d1-889f-5099-e1ed-0e661f65d6d2@xs4all.nl>
Date:   Thu, 20 Jun 2019 10:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560779277-32465-1-git-send-email-hugues.fruchet@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHhNg8iOYmDxwkoqhtg/kbE1uiSLmyATFuMFYGdCCHGrcef0umY+xpDu3S2RzYjfVWZZgfozoL1MZ/HH+QHqcrdMXM2+9eHopHACkuDoY900n6jPnBkk
 KqoveJMYNmr5AMEu5EoFLaqyIhSrZXoGXweMCte/OssSaS2Ils2jLJQoMA0q5nR7ILOP1mNAV8hzUdNOJgj6W7qlEYJp+1ny52/pDbHo2hbCQy+TPxiCMqAM
 8W9tJj8bZa+qCihY5YjOWaCoSkr9jbfmRmYTteLy81Zg3Wh2GKSowGptelCVvJfKVHaaDpUcYeFT+I03VujUg40JjSoNfCeF7CdmVuM1YeFw2RghdHAa+D2+
 zl7HFcnuPKAkXN9fJcpSBzC0uHhugO5KihuUB6UstvaeIIcT3DN8dzM8MyVZJq38UWyahgQP+BryC7X15XxRbf52nqJyR9rDKQfVrrCXDCfy0LVjpuW0o/6W
 HTGprztj3cxxXfDkljjldQZF+I0Z2mTuMn84zaExgUNz4CKt3Nzn9Kqdf1bgimT8FxO7hlYvM2SoY6nBXqZHAljYHBOMKpM0H46Wg5pipBO4HzIaiZMT11Tq
 joE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/17/19 3:47 PM, Hugues Fruchet wrote:
> Add support of V4L2_CID_LINK_FREQ, this is needed
> by some CSI-2 receivers.
> 
> 384MHz is exposed for the time being, corresponding
> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
> 
> This setup has been tested successfully with ST MIPID02
> CSI-2 to parallel bridge.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/i2c/ov5640.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 82d4ce9..79f8383 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
>  	struct v4l2_ctrl *test_pattern;
>  	struct v4l2_ctrl *hflip;
>  	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *link_freq;
>  };
>  
>  struct ov5640_dev {
> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static const s64 link_freq_menu_items[] = {
> +	384000000,
> +};
> +
>  static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_pad_config *cfg,
>  			  struct v4l2_subdev_format *format)
> @@ -2703,6 +2708,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
>  				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
>  
> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> +						  0, 0, link_freq_menu_items);
> +	if (ctrls->link_freq)
> +		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

I'd drop this. It's fine to set it, there is only one value here, so that's
effectively a NOP.

I see more drivers that set this flag, even though it is not necessary.
The problem is that some application might assume this control can be set, and then
fails because this returns an error.

You do need to add an entry to ov5640_s_ctrl:

	case V4L2_CID_LINK_FREQ:
		return 0;

Regards,

	Hans

> +
>  	if (hdl->error) {
>  		ret = hdl->error;
>  		goto free_ctrls;
> 

