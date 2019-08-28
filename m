Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E861D9FF19
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 12:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfH1KGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 06:06:43 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36823 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726270AbfH1KGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 06:06:43 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2uqYiSkmaThuu2uqbiH4Yp; Wed, 28 Aug 2019 12:06:40 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl> <20190828093820.GE2917@ulmo>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
Date:   Wed, 28 Aug 2019 12:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190828093820.GE2917@ulmo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfICnyPpyLoiNxB54ZtdajPaDnNAEM4lSIUM5Hbc4HsKu9WwOmwAH4uFMtz+T42F+a3RkVKtD7nAB8Oz3F3Vi7VBAl/A/qWfK5gnkOo7Yz8WWbQnkeKxJ
 FzXaVij84az22p+H+eK9AlJPPsz0oM6s5kuDVuB01dl4zEBKldZbH9HRrX/GFzqNbhQPCckgngmkkd6TKovPAIBLQPP8QFgaINGIbUmxtTclWciPLG2+iQtf
 9BIjuNtk4cnhG3HilEQ8bQiRcZQu4vMpHddMR58OkNLhkl99tPTRm0beMKTA/JHD2dtecBGtn2xxCsDnfQFIL6KWCpSfLPCNuaEmk6JeIQ6Z1FLu9EvBLOzP
 aWY8V7+z0BeiWn3Im+f9xrE+kfjt1iyoeoaKQjMOpRuN6XRXsGY9bwGsr3A9uMwV7B1/QBkfWV1aV4UdjRd8G+C4m0eFwQ+o1DKNtWe6XL2k37bHouk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/28/19 11:38 AM, Thierry Reding wrote:
> On Wed, Aug 28, 2019 at 10:09:30AM +0200, Hans Verkuil wrote:
>> Thierry,
>>
>> Can you review this patch?
>>
>> Thanks!
>>
>> 	Hans
> 
> Did you want me to pick this up into the drm/tegra tree? Or do you want
> to pick it up into your tree?

Can you pick it up for the next cycle? As you mentioned, we missed the
deadline for 5.4, so this feature won't be enabled in the public CEC API
until 5.5.

Thanks!

	Hans

> 
> We're just past the DRM subsystem deadline, so it'll have to wait until
> the next cycle if we go that way. If you're in a hurry you may want to
> pick it up yourself, in which case:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
>> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
>>> Use the new cec_notifier_conn_(un)register() functions to
>>> (un)register the notifier for the HDMI connector, and fill in
>>> the cec_connector_info.
>>>
>>> Changes since v4:
>>> 	- only create a CEC notifier for HDMI connectors
>>>
>>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> ---
>>>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>>>  1 file changed, 21 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
>>> index bdcaa4c7168cf..34373734ff689 100644
>>> --- a/drivers/gpu/drm/tegra/output.c
>>> +++ b/drivers/gpu/drm/tegra/output.c
>>> @@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
>>>  
>>>  void tegra_output_connector_destroy(struct drm_connector *connector)
>>>  {
>>> +	struct tegra_output *output = connector_to_output(connector);
>>> +
>>> +	if (output->cec)
>>> +		cec_notifier_conn_unregister(output->cec);
>>> +
>>>  	drm_connector_unregister(connector);
>>>  	drm_connector_cleanup(connector);
>>>  }
>>> @@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *output)
>>>  		disable_irq(output->hpd_irq);
>>>  	}
>>>  
>>> -	output->cec = cec_notifier_get(output->dev);
>>> -	if (!output->cec)
>>> -		return -ENOMEM;
>>> -
>>>  	return 0;
>>>  }
>>>  
>>>  void tegra_output_remove(struct tegra_output *output)
>>>  {
>>> -	if (output->cec)
>>> -		cec_notifier_put(output->cec);
>>> -
>>>  	if (output->hpd_gpio)
>>>  		free_irq(output->hpd_irq, output);
>>>  
>>> @@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *output)
>>>  
>>>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>>>  {
>>> +	int connector_type;
>>>  	int err;
>>>  
>>>  	if (output->panel) {
>>> @@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
>>>  	if (output->hpd_gpio)
>>>  		enable_irq(output->hpd_irq);
>>>  
>>> +	connector_type = output->connector.connector_type;
>>> +	/*
>>> +	 * Create a CEC notifier for HDMI connector.
>>> +	 */
>>> +	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>>> +	    connector_type == DRM_MODE_CONNECTOR_HDMIB) {
>>> +		struct cec_connector_info conn_info;
>>> +
>>> +		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
>>> +		output->cec = cec_notifier_conn_register(output->dev, NULL,
>>> +							 &conn_info);
>>> +		if (!output->cec)
>>> +			return -ENOMEM;
>>> +	}
>>> +
>>>  	return 0;
>>>  }
>>>  
>>>
>>

