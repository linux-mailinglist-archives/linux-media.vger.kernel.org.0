Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C71399284
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 20:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhFBS3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 14:29:35 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46717 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229467AbhFBS3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 14:29:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oVaklGpIBEXL0oVanlzEVK; Wed, 02 Jun 2021 20:27:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622658470; bh=46li9VZtJl6BBTVp7XJrgX+c1iLy/lAF8MWuxVkhzXc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X2XBmdxRFsvM4T2br68L3ySwt6qlOaxE+Jn0f3JrCyPfIzbsUiMxlq3p+WFTzbBHK
         9wa1FmnF+gChIuk0CutmNgR4PzULrqncGOK5Mz6nHilW1imqZ5pR4k7aXmjpLnvjAh
         B2/mwfoQQ4vU+jPXqN6ZzuZ+SMU7mK9CqEqYhDnsdPau0dUr5o1MjL95mh4zEPW+Yv
         JIoxYSY30zPqIFIUH6k4YwnxWxt5eKWjw4jRpQpzcGBsuWbwnr8dDy4D5s85pwhJvw
         tE9pITAOm7edHiPpwvU67GZEJrwF+PRJseF5YXBVrK5Qst6ka9EGu7Bq0ryIf5DoRv
         Ttc2klPKisj4g==
Subject: Re: [PATCH 9/9] media: dwc: dw-hdmi-rx: Add support for CEC
To:     Nelson Costa <Nelson.Costa@synopsys.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <86557797e979ce29ed97dd1ed0db8499a6ccbc34.1622631488.git.nelson.costa@synopsys.com>
 <746222a8-4b3f-2655-c5de-15d25e8b8852@xs4all.nl>
 <MW3PR12MB4459CED2A8E155673DCB6019C13D9@MW3PR12MB4459.namprd12.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5ef03a9b-01b0-5401-9db1-65c5e9b24cea@xs4all.nl>
Date:   Wed, 2 Jun 2021 20:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <MW3PR12MB4459CED2A8E155673DCB6019C13D9@MW3PR12MB4459.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMsl20ho2O+O7fB1eFdEiI8HfPyFMFHFP6u8Fo1stq729gn0uYALfgb8U2mZF8YulRppIURKGThsBMUPDb5tTbrK0S+j5neZAClyourURyQsJxbfBn6Y
 o8//8MJ2brfjP6aZT+gQZtv9xuuxabxxHMhAPcX1pK8Jpe3c1WWKvLZUi3GUTc8z7T+F6GRXhohYdwMoXqWgXKwNkiJEBMwIwAiSqt2mNzDlV6DGbOo24iGb
 WTorzMPyIuPHQYsux0Kf93UjHga2ihNGr6pHMi7sWCOGCBlwACVUZxNb4n7yr0u6vJGIENaF7/2cMH/mhrySymx83UXOi8HqdoJFkohkp/8gBtUfa8x6vf3A
 fnoxI/tOdUEQDlq09S5CKk6+0gLU5JQSD42x0a7Z/bf8JCLH81Ih0GmH6+mC9djS1LxBwc4UilBcG+GaX3gXsiABdycNPxBTe0AKJmMXV4UVFP5W0iUeTsb0
 lkHC0iFuy0Ajg/R9wtnwoy0hrnc8z7WTpoBB08jPWxoq/Ap0E3rSRZEyfok=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2021 20:20, Nelson Costa wrote:
> Hi Hans,
> 
> Thanks for your comments and feedback!
> 
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date: qua, jun 02, 2021 at 13:45:45
> 
>> On 02/06/2021 13:24, Nelson Costa wrote:
>>> @@ -3194,10 +3428,29 @@ static int dw_hdmi_rx_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		goto err_phy_exit;
>>>  
>>> +	/* CEC */
>>> +#if IS_ENABLED(CONFIG_VIDEO_DWC_HDMI_RX_CEC)
>>> +	dw_dev->cec_adap = cec_allocate_adapter(&dw_hdmi_cec_adap_ops,
>>> +						dw_dev, dev_name(dev),
>>> +						(CEC_CAP_DEFAULTS |
>>> +						 CEC_CAP_NEEDS_HPD |
>>
>> This cap makes no sense for a receiver.
>>
> 
> This cap was added in order to overcome a scenario that we have when 
> there
> was an hot plug. The driver performs a main reset that cause the loss of
> cec controller configuration. And in that case in order to reconfigure 

What do you mean with 'there was an hot plug'? Are you talking about the HPD
signal? Or when a new source/cable is connected? Can you point to the code
where that happens in the driver?

Regards,

	Hans

> the
> cec this cap was added. Because whenever there is a reset the physical
> address is reconfigured (invalidated and set) and with this cap the cec
> configuration callback function (adap_enable) is called again allowing to
> reconfigure the cec.
> 
> Does it make sense?
> 
> If not, what should be the best approach in order to deal with this 
> scenario?
