Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0569998D12
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732086AbfHVILH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:11:07 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49177 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728519AbfHVILH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:11:07 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0iBRiabxwThuu0iBUij9WI; Thu, 22 Aug 2019 10:11:04 +0200
Subject: Re: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        Vincent Abriou <vincent.abriou@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-7-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <00515839-a4bd-6721-8563-a16fbbaa7159@xs4all.nl>
Date:   Thu, 22 Aug 2019 10:11:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-7-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD3mDYGvx47Wy6gERwptdz9X8s4p9xGef0OydqGSa3W6iprNAGDQKaolMMAlvvLbecwFUP8VSGeaWtp8JPrSOzTzR4fO8gBnetG2oLLrOj0x9R9CuR/L
 d4j+MDawiw7eZ1qclL9j0/f+y48g7yfOzDLNtj/4YpaFMf+C927ewaJkf4XO4yCuWra7TaSB+vhvzGDE7e2OMzXvhr4wtm8gxkrQrDVvc1xSeKnh0ObKaHme
 oYRybMj0JalSyE6ZzZ0mElWR8L+nufhxluKkIZxAiJ+Z6VhySBHqpqSl53+cpshKEhLnxqzV+q/ERNBA5YqQw8v7CcmYlM/CeSr74my8V1xMxnSVWz4033R4
 xHS00Ye/mqb7ipPOgzBtunZ82vma7RopOApctsb5nnO6TiQsjt4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding Benjamin Gaignard.

Benjamin, can you take a look at this and Ack it (or merge it if you prefer) and
ideally test it as well. This is the only patch in this series that I could not
test since I don't have any hardware.

Regards,

	Hans

On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill
> in the cec_connector_info.
> 
> Changes since v2:
> 	Don't invalidate physical address before unregistering the
> 	notifier.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 9862c322f0c4a..bd15902b825ad 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1256,6 +1256,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
>  	struct drm_device *drm_dev = data;
>  	struct drm_encoder *encoder;
>  	struct sti_hdmi_connector *connector;
> +	struct cec_connector_info conn_info;
>  	struct drm_connector *drm_connector;
>  	struct drm_bridge *bridge;
>  	int err;
> @@ -1318,6 +1319,14 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
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
> @@ -1331,6 +1340,9 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
>  static void sti_hdmi_unbind(struct device *dev,
>  		struct device *master, void *data)
>  {
> +	struct sti_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	cec_notifier_conn_unregister(hdmi->notifier);
>  }
>  
>  static const struct component_ops sti_hdmi_ops = {
> @@ -1436,10 +1448,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
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
> @@ -1459,14 +1467,11 @@ static int sti_hdmi_remove(struct platform_device *pdev)
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

