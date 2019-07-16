Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521046A438
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 10:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfGPIu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 04:50:26 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51691 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726465AbfGPIu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 04:50:26 -0400
Received: from [IPv6:2001:420:44c1:2579:85b3:c250:4b65:7bea] ([IPv6:2001:420:44c1:2579:85b3:c250:4b65:7bea])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nJADhl2QCuEBxnJAGhNpzy; Tue, 16 Jul 2019 10:50:24 +0200
Subject: Re: [PATCH v3 3/9] dw-hdmi-cec: use
 cec_notifier_cec_adap_(un)register
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
References: <20190716075820.260202-1-darekm@google.com>
 <20190716075820.260202-4-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0601500e-ba43-136b-68e0-c2f181449b90@xs4all.nl>
Date:   Tue, 16 Jul 2019 10:50:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190716075820.260202-4-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGJfXJaAKmjrnecSCrG+13zK+ClP3Fc1MxlpW+kUh+CE3M0Gc5fnSPb0sbgoljt2oQlH2i84ypiPuA3Mai6JU6gdefH728mSu7omTU8vTea+brSsxGDW
 CI1MjeEB0Xhn/F+MXhjQHYrBgSebrBxIDibiSmt5MEE+CUhJ+/H3ULjplWtMb/aWTtf23OTUQIH1fs7xxfOU7r9vXHz4y4H7qSFuuxRyYwSbzG7cupM5S6PL
 OjotpD6uCU9TVdQdRAq0jATvceFJ5uHysTYD77nCZhu/gG+bozEWzcaFIYR2w/jjptqSigkSSfkGqMIgYuiGrFuzqFbgxMgneMEOVck3J5bdthFH13jyB6T7
 2Osc0X18
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/16/19 9:58 AM, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_cec_adap_(un)register() functions to
> (un)register the notifier for the CEC adapter.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 6c323510f1288..6f7ecacb7d1fb 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -281,13 +281,14 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)

The CEC_CAP_CONNECTOR_INFO should be added to cec_allocate_adapter.
And while we're at it, let's use CEC_CAP_DEFAULTS instead of
CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT | CEC_CAP_RC | CEC_CAP_PASSTHROUGH.

Regards,

	Hans

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

