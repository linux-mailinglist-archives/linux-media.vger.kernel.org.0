Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D213DBC8
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 22:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390614AbfFKUZk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 16:25:40 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44834 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388533AbfFKUZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 16:25:40 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so10293592lfm.11
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kEcAGbtoXSetomb8kRU1ptfOLVeYmQcuJOcAXFrPxeI=;
        b=BI3HIrBd8f/6sRW8bjXJL1KYgJ1dxeGdrWnoa0LBhbbQs2t+F6oZQoJuvbvD+WWiFq
         HA+T52a/8lYKsnXOXi5lZuIrVEtIscLjZeaECucy7IxdH+MAmL3JsOX1wZ4cqrcsWrYO
         5MbEl9b8UkIcUeqs2nCmg4QI+Dythqo+v56a8p1JUx+x0fCv6ap6R2hFM9ekwmC1m+LL
         akSW/iHQffeXdpEfye9eWlla2qk1Feer+9tkdHEs7S9BVn4LTgYGp0pRRzdrlJaFidvc
         VNET/ODo3jkvyYqBf4I8zjM5PYvxNPhhfpJQeHivv8sCX+wdQoDYh1wBrhp9/gBKRUq6
         PT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kEcAGbtoXSetomb8kRU1ptfOLVeYmQcuJOcAXFrPxeI=;
        b=aILoHcv57FYGBTQec+Pix92rj+nKJ/nj7tDBypRp7CEa2Vtg+8J7RCW3Yr6PFOyuSj
         4WsLg8fJt7OJqIXnGF2yuyS1T1reKoY4gRwtYh4rKZYzG+lBUf+sQ4OjLNfl4T34kmDN
         bxHNZcIkiZaPjC1INNDmY+TQjap87+RMTUgAT14tvlGm3qr/6ZP40ThOu+aP6Xj1I/2D
         j/ztmnqDi3WDjCBwkEeoOS0w+wP84TdFuOCd1TeoQylJAdMHkXxWu4GrwYvVzq0BpxI9
         MIy7xsybng2AqhxPc/RtHtQRJ+ukf/j7Akw9qHW4a4spW7DLGCmEEaGQlSk6R6EzmVkN
         V4RA==
X-Gm-Message-State: APjAAAVGlEFGLT/P2s9anOaOFr+ra+ACLM98ez2irMeSaOsg0Unc6adG
        8DLw7GwmK/D9NZviD5+EkVk4cMk8r74=
X-Google-Smtp-Source: APXvYqxXlCiHDQQ40wx4TFpvjRwgtJvPgBG1j8us1WGUVXfccyHspK4VJ6e8kIJ6ieO6lShpMkKFRQ==
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr20315301lfp.154.1560284737448;
        Tue, 11 Jun 2019 13:25:37 -0700 (PDT)
Received: from [192.168.145.139] ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id v12sm1400572ljk.22.2019.06.11.13.25.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 13:25:36 -0700 (PDT)
Subject: Re: [PATCH 7/8] media: vivid: add CEC support to display present ctrl
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
 <20190528171912.3688-8-johan.korsnes@gmail.com>
 <021b02ca-9543-c921-d231-0864e045b3c9@xs4all.nl>
From:   Johan Korsnes <johan.korsnes@gmail.com>
Message-ID: <d934d0cc-dc86-b13c-a85a-e37adbef39c0@gmail.com>
Date:   Tue, 11 Jun 2019 13:25:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <021b02ca-9543-c921-d231-0864e045b3c9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the review Hans. My comments are inline. A v2 of this
series is under way.

On 5/29/19 12:39 AM, Hans Verkuil wrote:
> Hi Johan,
> 
> Thanks for this patch series!
> 
> The previous patches all look good, but this one needs a bit more work:
> 
> On 5/28/19 7:19 PM, johan.korsnes@gmail.com wrote:
>> From: Johan Korsnes <johan.korsnes@gmail.com>
>>
>> Set/invalidate physical addresses based on the configuration of the
>> display present control. This is relevant not only when the display
>> present control is modified, but also when the Vivid instance EDID is
>> set/cleared.
>>
>> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
>> ---
>>  drivers/media/platform/vivid/vivid-core.c     | 16 ++++++------
>>  drivers/media/platform/vivid/vivid-ctrls.c    | 25 ++++++++++++++++---
>>  drivers/media/platform/vivid/vivid-vid-cap.c  |  6 ++++-
>>  .../media/platform/vivid/vivid-vid-common.c   |  2 ++
>>  4 files changed, 36 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
>> index b2b4ee48cef0..ca46ac24f51e 100644
>> --- a/drivers/media/platform/vivid/vivid-core.c
>> +++ b/drivers/media/platform/vivid/vivid-core.c
>> @@ -1060,14 +1060,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>>  	vivid_update_format_cap(dev, false);
>>  	vivid_update_format_out(dev);
>>  
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
>> -
>>  	/* initialize overlay */
>>  	dev->fb_cap.fmt.width = dev->src_rect.width;
>>  	dev->fb_cap.fmt.height = dev->src_rect.height;
>> @@ -1488,6 +1480,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>>  	}
>>  #endif
>>  
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
>> +
>>  	/* Now that everything is fine, let's add it to device list */
>>  	vivid_devs[inst] = dev;
>>  
> 
> This change should be in a patch of its own.
> 
> It also needs more work. The reason for this change is that v4l2_ctrl_handler_setup()
> expects that the cec adapters are up and running, so moving these calls until after
> the creation of the adapters fixes that.
> 
> However, that now means that controls change after the creation of the video devices,
> which isn't right.
> 
> If you look at the probe() function you'll see that things are done in two stages:
> first all the vb2 queues are created, and only if that succeeded are the video devices
> created.
> 
> The same should be done for the CEC adapters: they should be allocated (vivid_cec_alloc_adap)
> in the first stage, then call v4l2_ctrl_handler_setup(), and finally create the actual
> device nodes (cec_register_adapter).
> 
> That way the controls are configured correctly before any device nodes are created.

I have split up the allocation and registration in v2. Why is this
order important? Some race condition with user space?

> 
>> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
>> index ae3690fd1b52..e4758a2837e6 100644
>> --- a/drivers/media/platform/vivid/vivid-ctrls.c
>> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
>> @@ -18,6 +18,7 @@
>>  #include "vivid-radio-common.h"
>>  #include "vivid-osd.h"
>>  #include "vivid-ctrls.h"
>> +#include "vivid-cec.h"
>>  
>>  #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
>>  #define VIVID_CID_BUTTON		(VIVID_CID_CUSTOM_BASE + 0)
>> @@ -923,7 +924,7 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
>>  	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
>>  	u32 display_present = 0;
>> -	unsigned i, j;
>> +	unsigned i, j, bus_idx;
>>  
>>  	switch (ctrl->id) {
>>  	case VIVID_CID_HAS_CROP_OUT:
>> @@ -962,15 +963,31 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
>>  			break;
>>  
>>  		dev->display_present[dev->output] = ctrl->val;
>> -
>>  		for (i = 0, j = 0; i < dev->num_outputs; i++)
>>  			if (dev->output_type[i] == HDMI)
>>  				display_present |=
>>  					dev->display_present[i] << j++;
>>  
>> -		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
>>  		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, display_present);
>> -		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
>> +
>> +		if (dev->edid_blocks) {
>> +			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present,
>> +					   display_present);
>> +			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug,
>> +					   display_present);
>> +		}
>> +
>> +		if (dev->cec_tx_adap == NULL)
>> +			break;
>> +
>> +		bus_idx = dev->cec_output2bus_map[dev->output];
>> +		if (ctrl->val && dev->edid_blocks)
>> +			cec_s_phys_addr(dev->cec_tx_adap[bus_idx],
>> +					dev->cec_tx_adap[bus_idx]->phys_addr,
>> +					false);
>> +		else
>> +			cec_phys_addr_invalidate(dev->cec_tx_adap[bus_idx]);
>> +
>>  		break;
>>  	}
>>  	return 0;
>> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
>> index ca15c13abf6c..920be638da83 100644
>> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
>> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
>> @@ -1760,6 +1760,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
>>  		return -EINVAL;
>>  	if (edid->blocks == 0) {
>>  		dev->edid_blocks = 0;
>> +		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, false);
> 
> false should be 0 (it's a bitmask control).
> The tx_hotplug control should be set to 0 as well.
> 
>>  		phys_addr = CEC_PHYS_ADDR_INVALID;
>>  		goto set_phys_addr;
>>  	}
>> @@ -1777,6 +1778,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
>>  
>>  	dev->edid_blocks = edid->blocks;
>>  	memcpy(dev->edid, edid->edid, edid->blocks * 128);
>> +	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, true);
> 
> true should be a display_present mask. And the tx_hotplug control should
> be set as well with the same mask.
> 
> It's probably best to just recalculate the display_present mask, just as
> you did in vivid_vid_out_s_ctrl().

Not sure what I was thinking here. Will fix!

> 
>>  
>>  set_phys_addr:
>>  	/* TODO: a proper hotplug detect cycle should be emulated here */
>> @@ -1784,7 +1786,9 @@ int vidioc_s_edid(struct file *file, void *_fh,
>>  
>>  	for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
>>  		cec_s_phys_addr(dev->cec_tx_adap[i],
>> -				v4l2_phys_addr_for_input(phys_addr, i + 1),
>> +				dev->display_present[i] ?
>> +				v4l2_phys_addr_for_input(phys_addr, i + 1) :
>> +				CEC_PHYS_ADDR_INVALID,
>>  				false);
>>  	return 0;
>>  }
>> diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
>> index b6882426fc12..0addf8ef7dbf 100644
>> --- a/drivers/media/platform/vivid/vivid-vid-common.c
>> +++ b/drivers/media/platform/vivid/vivid-vid-common.c
>> @@ -907,6 +907,8 @@ int vidioc_g_edid(struct file *file, void *_fh,
>>  			return -EINVAL;
>>  		if (dev->output_type[edid->pad] != HDMI)
>>  			return -EINVAL;
>> +		if (!dev->display_present[dev->output])
> 
> dev->output should be edid->pad. VIDIOC_G_EDID gets the EDID of the specified
> output, not of the current output.
> 

Will fix this in v2.

>> +			return -ENODATA;
>>  		bus_idx = dev->cec_output2bus_map[edid->pad];
>>  		adap = dev->cec_tx_adap[bus_idx];
>>  	}
>>
> 
> Regards,
> 
> 	Hans
>
