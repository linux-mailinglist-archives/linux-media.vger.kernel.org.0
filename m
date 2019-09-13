Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFA0B1E09
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfIMM7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 08:59:34 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:35907 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729632AbfIMM7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 08:59:34 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8lAeiWgNvV17O8lAhi2hNK; Fri, 13 Sep 2019 14:59:31 +0200
Subject: Re: [Patch 01/13] media: am437x-vpfe: Fix suspend path to always
 handle pinctrl config
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-2-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9250638e-52a4-c7bc-e969-763d45528780@xs4all.nl>
Date:   Fri, 13 Sep 2019 14:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909162743.30114-2-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK8DMgGh7B2Mr9NSTWKzuGh1rlfwKAPoIZlYu8HAsUXrm8zRyNK8n79wR9h39RiyPhETo97zGsr2q6/LnvEN67RaFtmF2j9jpB7DKkqAzy6w+m/rJOAa
 miVbxthVCZS9R8zla0GUqA5zkO9Tr3Xy8YNRGoa5B7d8o7OYZHfy5MKz2xFTzAyuHIYUYCNVZ4ju+SkPdb4qIPswaTCCvFX6rrzVvzx5DEPbUJvxx7IacGq+
 Bb+2JBp7+ABS0pMdYvg0HbpwQeE/r1Ni/QBaUPAzIDT1jzuaRvrYOJ99lIjQfufpCflxqs4kRthnB6sMvg5rzMR2GWR7nHPJc5tUgcGx+/6l4/7jsMQii3ah
 0QJonhWcYT8th62dPbokd59+o74E3TwGilhQWy5hcryVKkgoYvnQSyNApTuMcrPghBrKzfdLsWlBv+cfDbNgc0XFepvu/8iKE9e3ezEM4gTZI8EAmKg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> From: Dave Gerlach <d-gerlach@ti.com>
> 
> Currently if vpfe is not active then it returns immediately in the
> suspend and resume handlers. Change this so that it always performs the
> pinctrl config so that we can still get proper sleep state configuration
> on the pins even if we do not need to worry about fully saving and
> restoring context.
> 
> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 44 ++++++++++-----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 2b42ba1f5949..ab959d61f9c9 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -2653,22 +2653,22 @@ static int vpfe_suspend(struct device *dev)
>  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
>  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
>  
> -	/* if streaming has not started we don't care */
> -	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
> -		return 0;
> +	/* only do full suspend if streaming has started */
> +	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
>  

It's a bit ugly to start a block with an empty line. Can you remove it?

> -	pm_runtime_get_sync(dev);
> -	vpfe_config_enable(ccdc, 1);
> +		pm_runtime_get_sync(dev);
> +		vpfe_config_enable(ccdc, 1);
>  
> -	/* Save VPFE context */
> -	vpfe_save_context(ccdc);
> +		/* Save VPFE context */
> +		vpfe_save_context(ccdc);
>  
> -	/* Disable CCDC */
> -	vpfe_pcr_enable(ccdc, 0);
> -	vpfe_config_enable(ccdc, 0);
> +		/* Disable CCDC */
> +		vpfe_pcr_enable(ccdc, 0);
> +		vpfe_config_enable(ccdc, 0);
>  
> -	/* Disable both master and slave clock */
> -	pm_runtime_put_sync(dev);
> +		/* Disable both master and slave clock */
> +		pm_runtime_put_sync(dev);
> +	}
>  
>  	/* Select sleep pin state */
>  	pinctrl_pm_select_sleep_state(dev);
> @@ -2710,19 +2710,19 @@ static int vpfe_resume(struct device *dev)
>  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
>  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
>  
> -	/* if streaming has not started we don't care */
> -	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
> -		return 0;
> +	/* only do full resume if streaming has started */
> +	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
>  

Ditto.

> -	/* Enable both master and slave clock */
> -	pm_runtime_get_sync(dev);
> -	vpfe_config_enable(ccdc, 1);
> +		/* Enable both master and slave clock */
> +		pm_runtime_get_sync(dev);
> +		vpfe_config_enable(ccdc, 1);
>  
> -	/* Restore VPFE context */
> -	vpfe_restore_context(ccdc);
> +		/* Restore VPFE context */
> +		vpfe_restore_context(ccdc);
>  
> -	vpfe_config_enable(ccdc, 0);
> -	pm_runtime_put_sync(dev);
> +		vpfe_config_enable(ccdc, 0);
> +		pm_runtime_put_sync(dev);
> +	}
>  
>  	/* Select default pin state */
>  	pinctrl_pm_select_default_state(dev);
> 

Regards,

	Hans
