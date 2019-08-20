Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983A5958D5
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 09:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbfHTHsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 03:48:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33139 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTHsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 03:48:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so11305379wrr.0
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=l03UGgFrWNwcOkWZ2V7UeL82MC9o6uoqa5dkMMdOwPs=;
        b=MB3ZQuIuqSbJmX1JyeyrJTDc/rjMOULXFjhtMNZuUAtNc/oLSJVTfHHDzSkgWqXKyr
         NzFG3vm1k8cWwX87YSHUU1sp/kFd9zhfoXQBCeXEQ0JIohLs7gYhTZUSjSSXJKWNgGAu
         1HLxPoJ/9Mpg5qOz74stY+ArTmpVF6Ju6ihpKowgYVMQcHgvtMzgIy06qtwqr94vpHXM
         2fN2nVRXSSPQeOyrOjNeyT76K8888+j0w5s0G3+dtPXUro815H8T4GhVOxs2D4Gkertd
         hqHm8mUTr4yK2Hp8k6niKLisjCNvcpcQEjbiBgJweElVS30O5/AqFXB5TIo9NKV+x7SJ
         Ss1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=l03UGgFrWNwcOkWZ2V7UeL82MC9o6uoqa5dkMMdOwPs=;
        b=e7a6XhqJby4Oo+fWvZjgOSjzCpc28VVNWj7HGv6QXFxaSrWxOOQ3vEP0zmAtu3axRP
         6sibUM0/aVve5X/ZYFUrPHJ0cym4l9AK+UU7xmG+/St1i/Kry3W30+bNr9AbrTyqUS7l
         Dis5YZ8Jj5niOT2J+HPFQIiDhKvjArsVJTJhzTWgm07GfhbALWYGLmpHpt2FWeEq3rVm
         VXa7oJ/zUB3+McGCGbC/Gk1fqd9OK/pSXI+TSuHDWYcnYrSmx1Ldv1Qqhi+dabCdq115
         ZVQHnp4ZlDPGEeF3T3DbR2QIVFVDsfmE1/R6WLWZt3klirhePQVLVMQnjCxZFfIKUKMf
         sCmQ==
X-Gm-Message-State: APjAAAVJIijN7D+TKny97TzBousR0AQu4p79iv3BXtgS62jGjY/MenLf
        0F0Zd5c9J1WANDsmBqoZn7WizA==
X-Google-Smtp-Source: APXvYqw6AUpEcI32Zj1VXJeBwC08gyNcqP27MkHfS0mxki5OkvJYf6r536OOGJA2j0dh2HtYnUxJYA==
X-Received: by 2002:adf:f507:: with SMTP id q7mr32341287wro.210.1566287329060;
        Tue, 20 Aug 2019 00:48:49 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f134sm15212479wmg.20.2019.08.20.00.48.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 00:48:48 -0700 (PDT)
Subject: Re: [PATCH v7 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-9-darekm@google.com>
 <b04edaf8-6116-69ab-fd8f-c28c90f73ad7@xs4all.nl>
 <3ae37c2f-94da-5ad0-a244-ef9658fc35e2@xs4all.nl>
 <0e961672-aadb-f8fc-457b-8daa325d459c@baylibre.com>
 <389b558f-06ec-8ec0-07ab-256dff3d4cb0@xs4all.nl>
 <8680ee8a-ff7f-de3c-a185-ff3fb3a93b2b@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ea7d8969-78ae-a4a0-3f3f-5fc52307421e@baylibre.com>
Date:   Tue, 20 Aug 2019 09:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8680ee8a-ff7f-de3c-a185-ff3fb3a93b2b@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/08/2019 16:47, Neil Armstrong wrote:
> On 19/08/2019 16:41, Hans Verkuil wrote:
>> On 8/19/19 4:38 PM, Neil Armstrong wrote:
>>> Hi Hans,
>>>
>>> On 19/08/2019 16:05, Hans Verkuil wrote:
>>>> On 8/19/19 11:32 AM, Hans Verkuil wrote:
>>>>> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
>>>>>> Use the new cec_notifier_conn_(un)register() functions to
>>>>>> (un)register the notifier for the HDMI connector, and fill in
>>>>>> the cec_connector_info.
>>>>>>
>>>>>> Changes since v6:
>>>>>>         - move cec_notifier_conn_unregister to a bridge detach
>>>>>> 	  function,
>>>>>> 	- add a mutex protecting a CEC notifier.
>>>>>> Changes since v4:
>>>>>> 	- typo fix
>>>>>> Changes since v2:
>>>>>> 	- removed unnecessary NULL check before a call to
>>>>>> 	cec_notifier_conn_unregister,
>>>>>> 	- use cec_notifier_phys_addr_invalidate to invalidate physical
>>>>>> 	address.
>>>>>> Changes since v1:
>>>>>> 	Add memory barrier to make sure that the notifier
>>>>>> 	becomes visible to the irq thread once it is fully
>>>>>> 	constructed.
>>>>>>
>>>>>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>>>>>
>>>>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>
>>>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>
>>> Did you test it on an Amlogic platform ? If yes, I don't have to !
>>
>> Yes, tested on my khadas VIM2 (modified a bit to fix the issue where
>> the CEC physical address wasn't invalidated correctly as discussed here
>> earlier).
> 
> Good, thanks.
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Neil
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>>
>>>>>> ---
>>>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++++++--------
>>>>>>  1 file changed, 30 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>>> index 83b94b66e464e..55162c9092f71 100644
>>>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>>> @@ -190,6 +190,7 @@ struct dw_hdmi {
>>>>>>  	void (*enable_audio)(struct dw_hdmi *hdmi);
>>>>>>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>>>>>>  
>>>>>> +	struct mutex cec_notifier_mutex;
>>>>>>  	struct cec_notifier *cec_notifier;
>>>>>>  };
>>>>>>  
>>>>>> @@ -2194,6 +2195,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>>>>>>  	struct dw_hdmi *hdmi = bridge->driver_private;
>>>>>>  	struct drm_encoder *encoder = bridge->encoder;
>>>>>>  	struct drm_connector *connector = &hdmi->connector;
>>>>>> +	struct cec_connector_info conn_info;
>>>>>> +	struct cec_notifier *notifier;
>>>>>>  
>>>>>>  	connector->interlace_allowed = 1;
>>>>>>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
>>>>>> @@ -2207,9 +2210,29 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>>>>>>  
>>>>>>  	drm_connector_attach_encoder(connector, encoder);
>>>>>>  
>>>>>> +	cec_fill_conn_info_from_drm(&conn_info, connector);
>>>>>> +
>>>>>> +	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
>>>>>> +	if (!notifier)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	mutex_lock(&hdmi->cec_notifier_mutex);
>>>>>> +	hdmi->cec_notifier = notifier;
>>>>>> +	mutex_unlock(&hdmi->cec_notifier_mutex);
>>>>>> +
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> +static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
>>>>>> +{
>>>>>> +	struct dw_hdmi *hdmi = bridge->driver_private;
>>>>>> +
>>>>>> +	mutex_lock(&hdmi->cec_notifier_mutex);
>>>>>> +	cec_notifier_conn_unregister(hdmi->cec_notifier);
>>>>>> +	hdmi->cec_notifier = NULL;
>>>>>> +	mutex_unlock(&hdmi->cec_notifier_mutex);
>>>>>> +}
>>>>>> +
>>>>>>  static enum drm_mode_status
>>>>>>  dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>>>>>>  			  const struct drm_display_mode *mode)
>>>>>> @@ -2266,6 +2289,7 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
>>>>>>  
>>>>>>  static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>>>>>>  	.attach = dw_hdmi_bridge_attach,
>>>>>> +	.detach = dw_hdmi_bridge_detach,
>>>>>>  	.enable = dw_hdmi_bridge_enable,
>>>>>>  	.disable = dw_hdmi_bridge_disable,
>>>>>>  	.mode_set = dw_hdmi_bridge_mode_set,
>>>>>> @@ -2373,9 +2397,11 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>>>>>  				       phy_stat & HDMI_PHY_HPD,
>>>>>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>>>>>>  
>>>>>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0)
>>>>>> -			cec_notifier_set_phys_addr(hdmi->cec_notifier,
>>>>>> -						   CEC_PHYS_ADDR_INVALID);
>>>>>> +		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>>>>>> +			mutex_lock(&hdmi->cec_notifier_mutex);
>>>>>> +			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>>>>>> +			mutex_unlock(&hdmi->cec_notifier_mutex);
>>>>>> +		}
>>>>>>  	}
>>>>>>  
>>>>>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>>>>>> @@ -2561,6 +2587,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>>>>>  
>>>>>>  	mutex_init(&hdmi->mutex);
>>>>>>  	mutex_init(&hdmi->audio_mutex);
>>>>>> +	mutex_init(&hdmi->cec_notifier_mutex);
>>>>>>  	spin_lock_init(&hdmi->audio_lock);
>>>>>>  
>>>>>>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>>>>>> @@ -2693,12 +2720,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>>>>>  	if (ret)
>>>>>>  		goto err_iahb;
>>>>>>  
>>>>>> -	hdmi->cec_notifier = cec_notifier_get(dev);
>>>>>> -	if (!hdmi->cec_notifier) {
>>>>>> -		ret = -ENOMEM;
>>>>>> -		goto err_iahb;
>>>>>> -	}
>>>>>> -
>>>>>>  	/*
>>>>>>  	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
>>>>>>  	 * N and cts values before enabling phy
>>>>>> @@ -2796,9 +2817,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>>>>>  		hdmi->ddc = NULL;
>>>>>>  	}
>>>>>>  
>>>>>> -	if (hdmi->cec_notifier)
>>>>>> -		cec_notifier_put(hdmi->cec_notifier);
>>>>>> -
>>>>>>  	clk_disable_unprepare(hdmi->iahb_clk);
>>>>>>  	if (hdmi->cec_clk)
>>>>>>  		clk_disable_unprepare(hdmi->cec_clk);
>>>>>> @@ -2820,9 +2838,6 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>>>>>>  	/* Disable all interrupts */
>>>>>>  	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
>>>>>>  
>>>>>> -	if (hdmi->cec_notifier)
>>>>>> -		cec_notifier_put(hdmi->cec_notifier);
>>>>>> -
>>>>>>  	clk_disable_unprepare(hdmi->iahb_clk);
>>>>>>  	clk_disable_unprepare(hdmi->isfr_clk);
>>>>>>  	if (hdmi->cec_clk)
>>>>>>
>>>>>
>>>>
>>>
>>
> 

Applying to drm-misc-next
