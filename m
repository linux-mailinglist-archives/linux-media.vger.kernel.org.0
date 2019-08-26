Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F289CC05
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 10:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730125AbfHZI7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 04:59:24 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54759 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729802AbfHZI7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 04:59:23 -0400
Received: from [IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4] ([IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2AqOiuoLSzaKO2AqPiEEbI; Mon, 26 Aug 2019 10:59:21 +0200
Subject: Re: [PATCH v7 2/9] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-3-darekm@google.com>
 <8d0c6d9b-d321-7e4b-8c06-92b9b816d029@xs4all.nl>
Message-ID: <a942bff9-bbdc-1983-2847-a25a24512d29@xs4all.nl>
Date:   Mon, 26 Aug 2019 10:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8d0c6d9b-d321-7e4b-8c06-92b9b816d029@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP5A+2spB5OfeGKS2BXM/ZP4Q729Q0/F1zD6dmXVBEA2CP23zskH+T/WN7EmqDePC4AeAF8BPM9O7pJ91mqx5ilRHKy7p8/zm5WsK4cCfLHLz8eF8suU
 cWCLxFkR/a/xxoy31NJLNKUp6FzHE+lqm0fY/TWUR2a8xAWC1iFMwsyd7jbcrLP1dI++QRFWITCz+eK7S9nmhzN0MQvDMPG8MwvrDW0HwCTbQAc2uEYsk++q
 snOXOkPCMUYf+eODbSD8/aeADUaF1Ibp9Qwr8qk8YDosfKpnGsWB9PRDBy/eANbpPZjdKOydrp7EN13Zn25M9V4CKOgeiwgFwcGajzh9aJSENTFfuNkJ9Orz
 /ThOFfQFZ4G/gSssHcyQyag2ANI1ws8PVlwBDVbZ99g//xAbnc07jI/Ng92Q/tnche7UBi/LfU/KFiXJZM3CrhB5Bnz/pGW0HYU0yHTmGBav8TX97EL7bBkF
 o38FWS7VfRY0VAoJyn04XHl1rDmIPXfSYdRvlim3/G/CHazQTz7skjbMOhAELJpTmIfi+wKAt8sX8n2J
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 10:03 AM, Hans Verkuil wrote:
> Ville or Rodrigo,
> 
> Can one of you either merge this patch or Ack it so that I can merge this?

Ping!

Regards,

	Hans

> 
> Thank you!
> 
> Regards,
> 
> 	Hans
> 
> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
>> Use the new cec_notifier_conn_(un)register() functions to
>> (un)register the notifier for the HDMI connector, and fill in
>> the cec_connector_info.
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/gpu/drm/i915/display/intel_hdmi.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index b1ca8e5bdb56d..9fcf2c58c29c5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -2752,8 +2752,9 @@ intel_hdmi_connector_register(struct drm_connector *connector)
>>  
>>  static void intel_hdmi_destroy(struct drm_connector *connector)
>>  {
>> -	if (intel_attached_hdmi(connector)->cec_notifier)
>> -		cec_notifier_put(intel_attached_hdmi(connector)->cec_notifier);
>> +	struct cec_notifier *n = intel_attached_hdmi(connector)->cec_notifier;
>> +
>> +	cec_notifier_conn_unregister(n);
>>  
>>  	intel_connector_destroy(connector);
>>  }
>> @@ -3068,6 +3069,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>>  	struct drm_device *dev = intel_encoder->base.dev;
>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>>  	enum port port = intel_encoder->port;
>> +	struct cec_connector_info conn_info;
>>  
>>  	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
>>  		      port_name(port));
>> @@ -3120,8 +3122,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>>  		I915_WRITE(PEG_BAND_GAP_DATA, (temp & ~0xf) | 0xd);
>>  	}
>>  
>> -	intel_hdmi->cec_notifier = cec_notifier_get_conn(dev->dev,
>> -							 port_identifier(port));
>> +	cec_fill_conn_info_from_drm(&conn_info, connector);
>> +
>> +	intel_hdmi->cec_notifier =
>> +		cec_notifier_conn_register(dev->dev, port_identifier(port),
>> +					   &conn_info);
>>  	if (!intel_hdmi->cec_notifier)
>>  		DRM_DEBUG_KMS("CEC notifier get failed\n");
>>  }
>>
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

