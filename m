Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 731B547EEB
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 11:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfFQJ6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 05:58:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42627 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726636AbfFQJ6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 05:58:00 -0400
Received: from [IPv6:2001:983:e9a7:1:544b:e813:3dc0:55f6] ([IPv6:2001:983:e9a7:1:544b:e813:3dc0:55f6])
        by smtp-cloud8.xs4all.net with ESMTPA
        id coOihpVtR41bFcoOjhcPov; Mon, 17 Jun 2019 11:57:57 +0200
Subject: Re: [PATCH v2 7/9] media: vivid: reorder CEC allocation and control
 set-up
To:     Johan Korsnes <johan.korsnes@gmail.com>,
        linux-media@vger.kernel.org
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
 <20190616182218.37726-8-johan.korsnes@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <381d24f5-7dcd-d31c-49d5-73bd33523501@xs4all.nl>
Date:   Mon, 17 Jun 2019 11:57:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190616182218.37726-8-johan.korsnes@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG/L1vDqPR/5kFRXLTh9u0o1txs8KdgFsv+SVUyi79kWSgn/LjSYmjyTutc2z74vfanI2R8s/uu+QEZhL1wTzP8rsOC4SnGZUk/fDa+Tcw2pEMfFu7DR
 OGHasVsUKQm2gv5OJ+jXIj0fJasGKvXwdkLkbtElqy0anw3NUHBPhxOg4S2SN7MNDSk2u46yeScBsFrMFJyzMjLUk89/oKko7fce1rfq7kZ3Ybg+5M+enbf7
 /Fe5hsbzuFnp7/W+HQyl9WYKCQpM3QdNtiUJCB3i4ClbZTYc4XuXGgcu4LnP2NfLdPRDvEpgPFycRb4LLl8c6Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/19 8:22 PM, Johan Korsnes wrote:
> CEC adapters and controllers (handlers) are now set up as follows:
> 
> 1. Allocate CEC adapters: setup of control handlers in next step
>    requires these adapters to be allocated.
> 2. Setup of control handlers: This must be done prior to registering
>    and exposing the adapters to user space to avoid a race condition.
> 3. Register CEC adapters: make them available to user space.
> 
> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
> ---
>  drivers/media/platform/vivid/vivid-core.c | 100 +++++++++++++---------
>  1 file changed, 58 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index 8c211fba3c66..bc2a176937a4 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -667,6 +667,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
>  	int ret;
>  	int i;
> +#ifdef CONFIG_VIDEO_VIVID_CEC
> +	unsigned int cec_tx_bus_cnt = 0;
> +#endif
>  
>  	/* allocate main vivid state structure */
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> @@ -1058,14 +1061,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	vivid_update_format_cap(dev, false);
>  	vivid_update_format_out(dev);
>  
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
> -
>  	/* initialize overlay */
>  	dev->fb_cap.fmt.width = dev->src_rect.width;
>  	dev->fb_cap.fmt.height = dev->src_rect.height;
> @@ -1226,6 +1221,47 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  				dev->fb_info.node);
>  	}
>  
> +#ifdef CONFIG_VIDEO_VIVID_CEC
> +	if (dev->has_vid_cap && in_type_counter[HDMI]) {
> +		struct cec_adapter *adap;
> +
> +		adap = vivid_cec_alloc_adap(dev, 0, false);
> +		ret = PTR_ERR_OR_ZERO(adap);

Since you are changing things in this code anyway, can you make another
change? PTR_ERR_OR_ZERO should be PTR_ERR instead.

> +		if (ret < 0)
> +			goto unreg_dev;
> +		dev->cec_rx_adap = adap;
> +	}
> +
> +	if (dev->has_vid_out) {
> +		for (i = 0; i < dev->num_outputs; i++) {
> +			struct cec_adapter *adap;
> +
> +			if (dev->output_type[i] != HDMI)
> +				continue;
> +
> +			dev->cec_output2bus_map[i] = cec_tx_bus_cnt;
> +			adap = vivid_cec_alloc_adap(dev, cec_tx_bus_cnt, true);
> +			ret = PTR_ERR_OR_ZERO(adap);

Same here.

cec_allocate_adapter() never returns NULL, so PTR_ERR is preferred.

Regards,

	Hans

> +			if (ret < 0) {
> +				for (i = 0; i < dev->num_outputs; i++)
> +					cec_delete_adapter(dev->cec_tx_adap[i]);
> +				goto unreg_dev;
> +			}
> +
> +			dev->cec_tx_adap[cec_tx_bus_cnt] = adap;
> +			cec_tx_bus_cnt++;
> +		}
> +	}
> +#endif
> +
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
> +
>  	/* finally start creating the device nodes */
>  	if (dev->has_vid_cap) {
>  		vfd = &dev->vid_cap_dev;
> @@ -1255,22 +1291,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  
>  #ifdef CONFIG_VIDEO_VIVID_CEC
>  		if (in_type_counter[HDMI]) {
> -			struct cec_adapter *adap;
> -
> -			adap = vivid_cec_alloc_adap(dev, 0, false);
> -			ret = PTR_ERR_OR_ZERO(adap);
> -			if (ret < 0)
> -				goto unreg_dev;
> -			dev->cec_rx_adap = adap;
> -			ret = cec_register_adapter(adap, &pdev->dev);
> +			ret = cec_register_adapter(dev->cec_rx_adap, &pdev->dev);
>  			if (ret < 0) {
> -				cec_delete_adapter(adap);
> +				cec_delete_adapter(dev->cec_rx_adap);
>  				dev->cec_rx_adap = NULL;
>  				goto unreg_dev;
>  			}
> -			cec_s_phys_addr(adap, 0, false);
> +			cec_s_phys_addr(dev->cec_rx_adap, 0, false);
>  			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI input 0\n",
> -				  dev_name(&adap->devnode.dev));
> +				  dev_name(&dev->cec_rx_adap->devnode.dev));
>  		}
>  #endif
>  
> @@ -1282,10 +1311,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	}
>  
>  	if (dev->has_vid_out) {
> -#ifdef CONFIG_VIDEO_VIVID_CEC
> -		unsigned int bus_cnt = 0;
> -#endif
> -
>  		vfd = &dev->vid_out_dev;
>  		snprintf(vfd->name, sizeof(vfd->name),
>  			 "vivid-%03d-vid-out", inst);
> @@ -1313,30 +1338,21 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  #endif
>  
>  #ifdef CONFIG_VIDEO_VIVID_CEC
> -		for (i = 0; i < dev->num_outputs; i++) {
> -			struct cec_adapter *adap;
> -
> -			if (dev->output_type[i] != HDMI)
> -				continue;
> -			dev->cec_output2bus_map[i] = bus_cnt;
> -			adap = vivid_cec_alloc_adap(dev, bus_cnt, true);
> -			ret = PTR_ERR_OR_ZERO(adap);
> -			if (ret < 0)
> -				goto unreg_dev;
> -			dev->cec_tx_adap[bus_cnt] = adap;
> -			ret = cec_register_adapter(adap, &pdev->dev);
> +		for (i = 0; i < cec_tx_bus_cnt; i++) {
> +			ret = cec_register_adapter(dev->cec_tx_adap[i], &pdev->dev);
>  			if (ret < 0) {
> -				cec_delete_adapter(adap);
> -				dev->cec_tx_adap[bus_cnt] = NULL;
> +				for (; i < cec_tx_bus_cnt; i++) {
> +					cec_delete_adapter(dev->cec_tx_adap[i]);
> +					dev->cec_tx_adap[i] = NULL;
> +				}
>  				goto unreg_dev;
>  			}
>  			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI output %d\n",
> -				  dev_name(&adap->devnode.dev), bus_cnt);
> -			bus_cnt++;
> -			if (bus_cnt <= out_type_counter[HDMI])
> -				cec_s_phys_addr(adap, bus_cnt << 12, false);
> +				  dev_name(&dev->cec_tx_adap[i]->devnode.dev), i);
> +			if (i <= out_type_counter[HDMI])
> +				cec_s_phys_addr(dev->cec_tx_adap[i], i << 12, false);
>  			else
> -				cec_s_phys_addr(adap, 0x1000, false);
> +				cec_s_phys_addr(dev->cec_tx_adap[i], 0x1000, false);
>  		}
>  #endif
>  
> 

