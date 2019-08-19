Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7492078
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 11:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfHSJeN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 05:34:13 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38505 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726491AbfHSJeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 05:34:13 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ze3DhLs6jDqPeze3GhnfCm; Mon, 19 Aug 2019 11:34:10 +0200
Subject: Re: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        Vincent Abriou <vincent.abriou@st.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-7-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a15b1e04-eba2-355f-f6d5-63423adbfd14@xs4all.nl>
Date:   Mon, 19 Aug 2019 11:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-7-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF5nU5CXxglhzuGYwjufLWfPOgbSfyYE/gndi9jVx2tCpYIozKdpDsFYFZ2nAi0rZdszCIRbxFJJrNizXr+nMkETwyZyxw8mD2l/+571x1WYVMOuL3Cq
 x0yiL5yfhbWUW8ihNYlAYHHosB3kZ4v4mhWDEzBrDhg5B7XOb6l7oHr+TeqHFtbh+cW5T6E6MihIbmVfGbC6+iyR322yz+wQnIHJuXAFAEAE8pV2J0XVY2LF
 PPmAIeBklwOOOSfM/4KzlaosU2kbRsJCKGAVOQumDRQh28Lv6bxIccGRYeUASBYjXzzHiDRWjob3sv/gELXXwVmMZGV35vWucTcV736WpxYBRR7p7Ha1Wken
 M5/KfEE+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

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

