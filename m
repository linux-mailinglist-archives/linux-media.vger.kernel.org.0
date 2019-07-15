Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909766875B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729749AbfGOKvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:51:11 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39939 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729641AbfGOKvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:51:11 -0400
Received: from [IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc] ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myZYhcFv20SBqmyZZhRVS8; Mon, 15 Jul 2019 12:51:09 +0200
Subject: Re: [PATCH v2 3/5] drm: tegra: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190701145944.214098-1-darekm@google.com>
 <20190701145944.214098-4-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1830cadb-71d2-de56-fa1c-7897ad38ed15@xs4all.nl>
Date:   Mon, 15 Jul 2019 12:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701145944.214098-4-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF13ai5jI8AMNsBHEhLI9no6+AYE/R1OnoBhwPBuYORXlXI7XlDeCqJVqgkIoOMsvu73+nZv8x6hopOxZccU1Lt1vutjyPFyS7MzCCItAzY997iRAFuW
 /YnG6PwUH26fPi3cQvLrbYPPGfFHWrq5G3fDLXgqINnsu2So6D/ixOzScC7mgNDd9EZQ39zIuzqG13QUjPbGeScKzf3N75lEkD3UfQiGxCzMksPYYXbRPe7J
 6RIhDciZf5iil56VE3LwLCO5bPypUyXV8XEB/zRcIaZOS5F63ht1SD3uTMkwCF/OWBSEHQXD6Z4x6vrHvkgDDE7nk1ptT4gnlSKHLHWaat0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/1/19 4:59 PM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 9c2b9dad55c30..ea92e72280868 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -80,6 +80,9 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
>  
>  void tegra_output_connector_destroy(struct drm_connector *connector)
>  {
> +	struct tegra_output *output = connector_to_output(connector);
> +
> +	cec_notifier_conn_unregister(output->cec);
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -174,18 +177,11 @@ int tegra_output_probe(struct tegra_output *output)
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
> @@ -197,6 +193,7 @@ void tegra_output_remove(struct tegra_output *output)
>  
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>  {
> +	struct cec_connector_info conn_info;
>  	int err;
>  
>  	if (output->panel) {
> @@ -212,6 +209,13 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>  	if (gpio_is_valid(output->hpd_gpio))
>  		enable_irq(output->hpd_irq);
>  
> +	cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> +
> +	output->cec = cec_notifier_conn_register(output->dev, NULL, &conn_info);
> +	if (!output->cec)
> +		return -ENOMEM;
> +
> +
>  	return 0;
>  }
>  
> 

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
