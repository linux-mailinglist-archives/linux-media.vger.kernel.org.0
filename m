Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8129FCA0
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 10:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfH1IJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 04:09:37 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:57293 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726273AbfH1IJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 04:09:37 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2t1Gi8eHbzaKO2t1KiK1Bx; Wed, 28 Aug 2019 10:09:34 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
Date:   Wed, 28 Aug 2019 10:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN2SLzcWSOO1TeYiDuWm3FiX75qjJsGvgXoX1pwPRTKZ/cG5yJC28sXJWwAO+I967Ki1N2UQLkv9Ajgm/7RLCTZ9ACBucApyEtW22Ly1VAyxQ/KV/WCF
 5r5SuQzzIKC3C1WbZjkWinhnRCPWVNAN/cqva4ufTNqnxjdKSi29ppikdazMh+fnPBUReNX2sZq9SGXKw9b3P1Y+MTPOzbpYmWOqW7fLECZDwx22emctIrrd
 I/2RwIBJqahb8GPFnLhxsAVnGjlbZ+nZnkdST6qJ9GIrsvaAneBjPHDFhcuWoFUhV01bwAx5aVyK0VNf8ro7HFUQc6tO4gjQnybN0zq2Q3On14YmJcQiCqkP
 gUjs4Yf9o00VJzP0OpX7ErBDaCqTxjkDMJ2Lgyu4ab+Djk2Pj8qnu67wbh3i3J9c+pHUf7ElNPpSf/MPR32H19IZ+2DDDALRZnS+WRbgyBGt8Yci/GU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thierry,

Can you review this patch?

Thanks!

	Hans

On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index bdcaa4c7168cf..34373734ff689 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
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
> @@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *output)
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
>  	if (output->hpd_gpio)
>  		free_irq(output->hpd_irq, output);
>  
> @@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *output)
>  
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>  {
> +	int connector_type;
>  	int err;
>  
>  	if (output->panel) {
> @@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>  	if (output->hpd_gpio)
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

