Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D574F87730
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 12:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406366AbfHIKZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 06:25:24 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42135 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406419AbfHIKZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 06:25:23 -0400
Received: from [IPv6:2001:983:e9a7:1:a042:9da:6cf5:9cb5] ([IPv6:2001:983:e9a7:1:a042:9da:6cf5:9cb5])
        by smtp-cloud9.xs4all.net with ESMTPA
        id w25Hh2PneAffAw25JhFoHn; Fri, 09 Aug 2019 12:25:21 +0200
Subject: Re: [PATCH v5 3/9] dw-hdmi-cec: use
 cec_notifier_cec_adap_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-4-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1cc0eb1c-2906-8a54-93de-652c1b8ece9f@xs4all.nl>
Date:   Fri, 9 Aug 2019 12:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-4-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO7qODX/0v5R3N/aC6KlKAoXwyy7+UmTH7HjksNwMfRYKp5qIQBp7OfZW2xborC5RqQCLTsG+Jn6l1vNwdMZmzmd9vpVB2DyX6CsdlewvWbDyne2gcKj
 yT69R8UK9SjGkwm8ZLxRLDXMcpR0bEKL9FlsrK3LMqUgigJ9/95EOZWX3esq5Vze2pK2lxQgkvidsRew3FiQGubpq1BMC0lgWPIjSsiSf//NEHXMweO0z/R6
 Kb/uxEDCNCOSytbdkxXOx/QblnjTfy0O5qC4xXmWKGJ0LMNSaq09xDt4nhOAHfc6wnRNY5lg5oYKjP58mKL+Ow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_cec_adap_(un)register() functions to
> (un)register the notifier for the CEC adapter.
> 
> Also adds CEC_CAP_CONNECTOR_INFO capability to the adapter.
> 
> Changes since v3:
> 	- add CEC_CAP_CONNECTOR_INFO to cec_allocate_adapter,
> 	- replace CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
> 	CEC_CAP_RC | CEC_CAP_PASSTHROUGH with CEC_CAP_DEFAULTS.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with a Banana Pi M3 Allwinner A83T.

Regards,

	Hans

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 6c323510f1288..361acff2111cf 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -259,8 +259,8 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
>  
>  	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
> -					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
> -					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
> +					 CEC_CAP_DEFAULTS |
> +					 CEC_CAP_CONNECTOR_INFO,
>  					 CEC_MAX_LOG_ADDRS);
>  	if (IS_ERR(cec->adap))
>  		return PTR_ERR(cec->adap);
> @@ -281,13 +281,14 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	cec->notify = cec_notifier_get(pdev->dev.parent);
> +	cec->notify = cec_notifier_cec_adap_register(pdev->dev.parent,
> +						     NULL, cec->adap);
>  	if (!cec->notify)
>  		return -ENOMEM;
>  
>  	ret = cec_register_adapter(cec->adap, pdev->dev.parent);
>  	if (ret < 0) {
> -		cec_notifier_put(cec->notify);
> +		cec_notifier_cec_adap_unregister(cec->notify);
>  		return ret;
>  	}
>  
> @@ -297,8 +298,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	 */
>  	devm_remove_action(&pdev->dev, dw_hdmi_cec_del, cec);
>  
> -	cec_register_cec_notifier(cec->adap, cec->notify);
> -
>  	return 0;
>  }
>  
> @@ -306,8 +305,8 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
>  {
>  	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
>  
> +	cec_notifier_cec_adap_unregister(cec->notify);
>  	cec_unregister_adapter(cec->adap);
> -	cec_notifier_put(cec->notify);
>  
>  	return 0;
>  }
> 

