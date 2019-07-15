Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5712268758
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbfGOKt5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:49:57 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51225 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729530AbfGOKt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:49:56 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myYMhcFMy0SBqmyYNhRV8R; Mon, 15 Jul 2019 12:49:55 +0200
Subject: Re: [PATCH v2 2/5] drm: sti: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190701145944.214098-1-darekm@google.com>
 <20190701145944.214098-3-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <34928aee-7d88-1215-558c-7a37fc3a3baf@xs4all.nl>
Date:   Mon, 15 Jul 2019 12:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701145944.214098-3-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLs3vDOzQUwcOWDJ1jeeyoiFWyNEPkKZeWow4IOkdh3oP/JzqjGZyUY5Q2aER0YNF96wGxN86d3mPid/TC+CpDmL10X7g7FrNmSdMAYwUoULE4JXPQEy
 E+gzK/z4SRHzBZANiBzNu5Q+/2gpS0zcQHMxMa/r+lDidMBzYhQJZSKMKmWr3bwv9PEGtSQinLWBLlsc8ywCBkFGAAf94XY6HGVfSwNGhTEheQsh+Vsw8K4m
 NGmRxNvlzwMD22gaYoSA9iinlLDnOS5PbFk2dOOtystXdaxOeVS1JZXvFTNW4lJna/yGBIExIx93kxipoRUiWl69k9eLgyRdpqpMz8wYYrU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 4:59 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill
> in the cec_connector_info.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 6000df6249807..5519b0c397c72 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1250,6 +1250,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm_dev = data;
>  	struct drm_encoder *encoder;
>  	struct sti_hdmi_connector *connector;
> +	struct cec_connector_info conn_info;
>  	struct drm_connector *drm_connector;
>  	struct drm_bridge *bridge;
>  	int err;
> @@ -1310,6 +1311,14 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
>  		goto err_sysfs;
>  	}
>  
> +	cec_fill_conn_info_from_drm(&conn_info, drm_connector);
> +	hdmi->notifier = cec_notifier_conn_register(&hdmi->dev, NULL,
> +						    &conn_info);
> +	if (!hdmi->notifier) {
> +		hdmi->drm_connector = NULL;
> +		return -ENOMEM;
> +	}
> +
>  	/* Enable default interrupts */
>  	hdmi_write(hdmi, HDMI_DEFAULT_INT, HDMI_INT_EN);
>  
> @@ -1323,6 +1332,10 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
>  static void sti_hdmi_unbind(struct device *dev,
>  		struct device *master, void *data)
>  {
> +	struct sti_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);

No need to do this, cec_notifier_conn_unregister() takes care of this.

> +	cec_notifier_conn_unregister(hdmi->notifier);
>  }
>  
>  static const struct component_ops sti_hdmi_ops = {
> @@ -1428,10 +1441,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>  		goto release_adapter;
>  	}
>  
> -	hdmi->notifier = cec_notifier_get(&pdev->dev);
> -	if (!hdmi->notifier)
> -		goto release_adapter;
> -
>  	hdmi->reset = devm_reset_control_get(dev, "hdmi");
>  	/* Take hdmi out of reset */
>  	if (!IS_ERR(hdmi->reset))
> @@ -1451,14 +1460,11 @@ static int sti_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct sti_hdmi *hdmi = dev_get_drvdata(&pdev->dev);
>  
> -	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
> -
>  	i2c_put_adapter(hdmi->ddc_adapt);
>  	if (hdmi->audio_pdev)
>  		platform_device_unregister(hdmi->audio_pdev);
>  	component_del(&pdev->dev, &sti_hdmi_ops);
>  
> -	cec_notifier_put(hdmi->notifier);
>  	return 0;
>  }
>  
> 

Regards,

	Hans
