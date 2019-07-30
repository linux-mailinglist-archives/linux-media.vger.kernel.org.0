Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B717A802
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 14:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730083AbfG3MRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 08:17:16 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38983 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728664AbfG3MRQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 08:17:16 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sR44hmd0sAffAsR46hjde7; Tue, 30 Jul 2019 14:17:14 +0200
Subject: Re: [PATCH v4 7/9] drm: tegra: use cec_notifier_conn_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190716122718.125993-1-darekm@google.com>
 <20190716122718.125993-8-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ee5f00e9-f865-28a9-2b4c-63bb8206d4cd@xs4all.nl>
Date:   Tue, 30 Jul 2019 14:17:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190716122718.125993-8-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBkODxSyAcFPQ8m5ufEKjU1LAhJE7ygnHbcqWCDav8JzMR+bOn7hxGE+S7WXyJb1B2G/LD7f9oCUxecKCO73/CCWSufjbWxZKuemonMR96D5JbjFYL6O
 JojrqtHLF1YgFSevb7BSPX3rPnsk3UaPNQ7vh/woIzn/pEMg61293gln5o1TApfMxNovjolbn/PGpf40OuVzpT90SAJr22jqjfUVquHeE5kmSsPtbUtZO4z2
 eBYpCLVg0MdfOcE+5CJ6ajhAteaqBsZ/O8iLmyIOfzAXjKu37cj1i/Y88Deqnq9XYgu+dlK3sW4QSO+ce8b+Ow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dariusz,

One comment below:

On 7/16/19 2:27 PM, Dariusz Marcinkiewicz wrote:
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

This isn't right: tegra_output_init() is called for various output types, but the
CEC adapter should only be created for an HDMI connector. So there should be
a check on the connector type before registering a cec notifier.

Regards,

	Hans

> +	output->cec = cec_notifier_conn_register(output->dev, NULL, &conn_info);
> +	if (!output->cec)
> +		return -ENOMEM;
> +
> +
>  	return 0;
>  }
>  
> 

