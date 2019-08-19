Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52B2992607
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 16:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfHSOFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 10:05:20 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38139 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727696AbfHSOFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 10:05:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ziHWhHpZgzaKOziHZhrwIU; Mon, 19 Aug 2019 16:05:17 +0200
Subject: Re: [PATCH v7 8/9] drm: dw-hdmi: use cec_notifier_conn_(un)register
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-9-darekm@google.com>
 <b04edaf8-6116-69ab-fd8f-c28c90f73ad7@xs4all.nl>
Message-ID: <3ae37c2f-94da-5ad0-a244-ef9658fc35e2@xs4all.nl>
Date:   Mon, 19 Aug 2019 16:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b04edaf8-6116-69ab-fd8f-c28c90f73ad7@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOHa1pgQlPJTOC9uHuuHP3RoyBKsmaLsoQ75FecdGtWmRQjv0fvSfIHLzS+FWlABhNpKUVZB7Mp12vFdDYYg3X6ErOgFUfzuJ0hkUZkTi5VApxO6EvsD
 OxehRQ/1dMoMzOgQfkJpAzrftgLMnOTk6b8E+ohKITpTPCc9LRwccojZP5EiteRYxUojz4aDQH8+ea68FgazKooDivVT02+iHWg4I5ukN8LFCfNmiPH1FGSf
 dqwTiMYQy+2L6aiB/9RyWTlBqrI8UdzBjbgSxPMW0YzmHfpej8dvW6GuAad8mXF79q9dZBRPNDC75C3TZR3HhlqL7aP0Q05L7vmgXBJJPlUHxe48gK7cOv1/
 KbKwIqxRtKZutzkLeN0oVuhA9eBtAbYH9Be5F0Q1HcdwjY9o3itzl1h9u34zai2tIV7ewdEYv3Y9vf1oyO9+5H70K2OJFjin3uHgPvtMWX/ajVx+VQ0a6tQa
 VlRcVj5jGQ8EJ4GazmTYJTfZ9EK6ZxTCx3NfH/t9XqBRsE8VdkfdhoHo1hO0y4BOIWB3J6f+O6ojud4PqOjZY1xG1dV5AVIHA03USA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 11:32 AM, Hans Verkuil wrote:
> On 8/14/19 12:45 PM, Dariusz Marcinkiewicz wrote:
>> Use the new cec_notifier_conn_(un)register() functions to
>> (un)register the notifier for the HDMI connector, and fill in
>> the cec_connector_info.
>>
>> Changes since v6:
>>         - move cec_notifier_conn_unregister to a bridge detach
>> 	  function,
>> 	- add a mutex protecting a CEC notifier.
>> Changes since v4:
>> 	- typo fix
>> Changes since v2:
>> 	- removed unnecessary NULL check before a call to
>> 	cec_notifier_conn_unregister,
>> 	- use cec_notifier_phys_addr_invalidate to invalidate physical
>> 	address.
>> Changes since v1:
>> 	Add memory barrier to make sure that the notifier
>> 	becomes visible to the irq thread once it is fully
>> 	constructed.
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++++++--------
>>  1 file changed, 30 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 83b94b66e464e..55162c9092f71 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -190,6 +190,7 @@ struct dw_hdmi {
>>  	void (*enable_audio)(struct dw_hdmi *hdmi);
>>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>>  
>> +	struct mutex cec_notifier_mutex;
>>  	struct cec_notifier *cec_notifier;
>>  };
>>  
>> @@ -2194,6 +2195,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>>  	struct dw_hdmi *hdmi = bridge->driver_private;
>>  	struct drm_encoder *encoder = bridge->encoder;
>>  	struct drm_connector *connector = &hdmi->connector;
>> +	struct cec_connector_info conn_info;
>> +	struct cec_notifier *notifier;
>>  
>>  	connector->interlace_allowed = 1;
>>  	connector->polled = DRM_CONNECTOR_POLL_HPD;
>> @@ -2207,9 +2210,29 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>>  
>>  	drm_connector_attach_encoder(connector, encoder);
>>  
>> +	cec_fill_conn_info_from_drm(&conn_info, connector);
>> +
>> +	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
>> +	if (!notifier)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&hdmi->cec_notifier_mutex);
>> +	hdmi->cec_notifier = notifier;
>> +	mutex_unlock(&hdmi->cec_notifier_mutex);
>> +
>>  	return 0;
>>  }
>>  
>> +static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
>> +{
>> +	struct dw_hdmi *hdmi = bridge->driver_private;
>> +
>> +	mutex_lock(&hdmi->cec_notifier_mutex);
>> +	cec_notifier_conn_unregister(hdmi->cec_notifier);
>> +	hdmi->cec_notifier = NULL;
>> +	mutex_unlock(&hdmi->cec_notifier_mutex);
>> +}
>> +
>>  static enum drm_mode_status
>>  dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>>  			  const struct drm_display_mode *mode)
>> @@ -2266,6 +2289,7 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
>>  
>>  static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>>  	.attach = dw_hdmi_bridge_attach,
>> +	.detach = dw_hdmi_bridge_detach,
>>  	.enable = dw_hdmi_bridge_enable,
>>  	.disable = dw_hdmi_bridge_disable,
>>  	.mode_set = dw_hdmi_bridge_mode_set,
>> @@ -2373,9 +2397,11 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  				       phy_stat & HDMI_PHY_HPD,
>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>>  
>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0)
>> -			cec_notifier_set_phys_addr(hdmi->cec_notifier,
>> -						   CEC_PHYS_ADDR_INVALID);
>> +		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>> +			mutex_lock(&hdmi->cec_notifier_mutex);
>> +			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>> +			mutex_unlock(&hdmi->cec_notifier_mutex);
>> +		}
>>  	}
>>  
>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>> @@ -2561,6 +2587,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  
>>  	mutex_init(&hdmi->mutex);
>>  	mutex_init(&hdmi->audio_mutex);
>> +	mutex_init(&hdmi->cec_notifier_mutex);
>>  	spin_lock_init(&hdmi->audio_lock);
>>  
>>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>> @@ -2693,12 +2720,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  	if (ret)
>>  		goto err_iahb;
>>  
>> -	hdmi->cec_notifier = cec_notifier_get(dev);
>> -	if (!hdmi->cec_notifier) {
>> -		ret = -ENOMEM;
>> -		goto err_iahb;
>> -	}
>> -
>>  	/*
>>  	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
>>  	 * N and cts values before enabling phy
>> @@ -2796,9 +2817,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  		hdmi->ddc = NULL;
>>  	}
>>  
>> -	if (hdmi->cec_notifier)
>> -		cec_notifier_put(hdmi->cec_notifier);
>> -
>>  	clk_disable_unprepare(hdmi->iahb_clk);
>>  	if (hdmi->cec_clk)
>>  		clk_disable_unprepare(hdmi->cec_clk);
>> @@ -2820,9 +2838,6 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
>>  	/* Disable all interrupts */
>>  	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
>>  
>> -	if (hdmi->cec_notifier)
>> -		cec_notifier_put(hdmi->cec_notifier);
>> -
>>  	clk_disable_unprepare(hdmi->iahb_clk);
>>  	clk_disable_unprepare(hdmi->isfr_clk);
>>  	if (hdmi->cec_clk)
>>
> 

