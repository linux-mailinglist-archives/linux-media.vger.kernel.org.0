Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB3686BD0
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 22:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403980AbfHHUnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 16:43:01 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41427 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732327AbfHHUnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 16:43:01 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud8.xs4all.net with ESMTPA
        id vpFNhT5plqTdhvpFOhNtQ8; Thu, 08 Aug 2019 22:42:54 +0200
Subject: Re: [PATCH v5 7/9] drm: tegra: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-8-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a0f3e2ba-5e3b-9800-d1f4-75d7ca424fc9@xs4all.nl>
Date:   Thu, 8 Aug 2019 22:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-8-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEOmrE18pxQeeQSOKqIba9NjRReVmeG15MssCR+m/r9DN7QS+JZb51xzysyeFMxlfKVoydwzGAXArfkOvipm/xfaRveeATFXB8fByqNvsi4GoJo1AjHY
 WmtpemXKjcgsURvsecNMjeXXuIqEh04NYAiVUdRmmnYf+njtCv9ACsmdLCCGzYb+XYsEjJA/CjHtaOMhWeoh7ZIVZGWU1Ix7by2fB5tynwaPbk7s1RyArcUK
 EgNkgJzohUC7tX5FVc3ujrVhcQ8bSSFX3bdqCaiH4y8VHu0VLm/nBc2FaaXSBA6Dr5y1sGXPoIKaEkQ9PcNSPA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with a Jetson TK1 board.

Regards,

	Hans

> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 9c2b9dad55c30..13153b93626fd 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -80,6 +80,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
>  
>  void tegra_output_connector_destroy(struct drm_connector *connector)
>  {
> +	struct tegra_output *output = connector_to_output(connector);
> +
> +	if (output->cec)
> +		cec_notifier_conn_unregister(output->cec);
> +
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -174,18 +179,11 @@ int tegra_output_probe(struct tegra_output *output)
>  		disable_irq(output->hpd_irq);
>  	}
>  
> -	output->cec = cec_notifier_get(output->dev);
> -	if (!output->cec)
> -		return -ENOMEM;
> -
>  	return 0;
>  }
>  
>  void tegra_output_remove(struct tegra_output *output)
>  {
> -	if (output->cec)
> -		cec_notifier_put(output->cec);
> -
>  	if (gpio_is_valid(output->hpd_gpio)) {
>  		free_irq(output->hpd_irq, output);
>  		gpio_free(output->hpd_gpio);
> @@ -197,6 +195,7 @@ void tegra_output_remove(struct tegra_output *output)
>  
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>  {
> +	int connector_type;
>  	int err;
>  
>  	if (output->panel) {
> @@ -212,6 +211,21 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>  	if (gpio_is_valid(output->hpd_gpio))
>  		enable_irq(output->hpd_irq);
>  
> +	connector_type = output->connector.connector_type;
> +	/*
> +	 * Create a CEC notifier for HDMI connector.
> +	 */
> +	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector_type == DRM_MODE_CONNECTOR_HDMIB) {
> +		struct cec_connector_info conn_info;
> +
> +		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> +		output->cec = cec_notifier_conn_register(output->dev, NULL,
> +							 &conn_info);
> +		if (!output->cec)
> +			return -ENOMEM;
> +	}
> +
>  	return 0;
>  }
>  
> 

