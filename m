Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39EAADA7A1
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391284AbfJQImn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:42:43 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41887 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392952AbfJQImm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:42:42 -0400
Received: from [IPv6:2001:420:44c1:2577:5195:3526:c85b:688a]
 ([IPv6:2001:420:44c1:2577:5195:3526:c85b:688a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id L1Mii0WZ5o1ZhL1Mli5enc; Thu, 17 Oct 2019 10:42:40 +0200
Subject: Re: [PATCHv9 2/2] drm: tda998x: set the connector info
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
 <20191017072842.16793-3-hverkuil-cisco@xs4all.nl>
 <20191017081143.GA25745@shell.armlinux.org.uk>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <02abfa7e-a34f-512b-986f-509fd6c8ab51@xs4all.nl>
Date:   Thu, 17 Oct 2019 10:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191017081143.GA25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK7wvqw+DG10WFlMOQQDDJC20XGiydzmrayisSD3W2cLvtYO2cu3YDLdW5ScIATbqXeXibr2laBtIsF49lsjT2sIsa1IYy5b5JS/iBaSC3JNkUJt8TOS
 7JzTWlgp58HNJyKA4ge4WGpJ5nkv7JpijQg/FybPQWZn7U+cwopd2DicwFyqEbYWVgp8ceYjWP4ghD1DpT0kQwiGPrQ9u31tdiWkcXZpWO6lmd/w44PaPuEH
 mpzH3nGt7y6/ZCoQg34OcHFSL2qIJrxId+ZQ4dgYNkpkos0hTYBcoD4ffcizYMqVDTxtpCKTiGqyslFbeA7nSwgFwOgYFmh3Vr1uFPDygVz8u/tJ7N1jZ/3N
 YL6pEx+HucmaklyeutaPmSARCWHJEcT8bF3muxDQt6D1pqKpGTnf38tmqJeMe/CvyvklFdL9F0YEuA42npkW33alxglFBori5UklRIvUZBygnyHWTsQ5GH4T
 K20bJPY4ojnCVHNb
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/17/19 10:11 AM, Russell King - ARM Linux admin wrote:
> On Thu, Oct 17, 2019 at 09:28:42AM +0200, Hans Verkuil wrote:
>> From: Dariusz Marcinkiewicz <darekm@google.com>
>>
>> Fill in the cec_connector_info when calling cec_notifier_conn_register().
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/gpu/drm/i2c/tda998x_drv.c | 33 +++++++++++++++++++++++--------
>>  1 file changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
>> index dde8decb52a6..b0620842fa3a 100644
>> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
>> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
>> @@ -82,6 +82,9 @@ struct tda998x_priv {
>>  	u8 audio_port_enable[AUDIO_ROUTE_NUM];
>>  	struct tda9950_glue cec_glue;
>>  	struct gpio_desc *calib;
>> +
>> +	/* protect cec_notify */
>> +	struct mutex cec_notify_mutex;
>>  	struct cec_notifier *cec_notify;
>>  };
>>  
>> @@ -805,8 +808,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
>>  				tda998x_edid_delay_start(priv);
>>  			} else {
>>  				schedule_work(&priv->detect_work);
>> +
>> +				mutex_lock(&priv->cec_notify_mutex);
>>  				cec_notifier_phys_addr_invalidate(
>>  						priv->cec_notify);
>> +				mutex_unlock(&priv->cec_notify_mutex);
>>  			}
>>  
>>  			handled = true;
>> @@ -1331,6 +1337,8 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>>  				  struct drm_device *drm)
>>  {
>>  	struct drm_connector *connector = &priv->connector;
>> +	struct cec_connector_info conn_info;
>> +	struct cec_notifier *notifier;
>>  	int ret;
>>  
>>  	connector->interlace_allowed = 1;
>> @@ -1347,6 +1355,17 @@ static int tda998x_connector_init(struct tda998x_priv *priv,
>>  	if (ret)
>>  		return ret;
>>  
>> +	cec_fill_conn_info_from_drm(&conn_info, connector);
>> +
>> +	notifier = cec_notifier_conn_register(priv->cec_glue.parent,
>> +					      NULL, &conn_info);
>> +	if (!notifier)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&priv->cec_notify_mutex);
>> +	priv->cec_notify = notifier;
>> +	mutex_unlock(&priv->cec_notify_mutex);
> 
> You haven't taken on board what I said about the mutex in this
> instance.

That's because I didn't. See the cover letter.

I need this info from the author of the patch, Dariusz. Once I have that,
and we agree with the reasoning, then I'll post a new patch for it.

For now all I am interested in is getting patch 1/2 merged. Patch 2/2 won't
be merged any time soon.

Regards,

	Hans

> 
>> +
>>  	drm_connector_attach_encoder(&priv->connector,
>>  				     priv->bridge.encoder);
>>  
>> @@ -1366,6 +1385,11 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
>>  {
>>  	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
>>  
>> +	mutex_lock(&priv->cec_notify_mutex);
>> +	cec_notifier_conn_unregister(priv->cec_notify);
>> +	priv->cec_notify = NULL;
>> +	mutex_unlock(&priv->cec_notify_mutex);
>> +
>>  	drm_connector_cleanup(&priv->connector);
>>  }
>>  
>> @@ -1789,8 +1813,6 @@ static void tda998x_destroy(struct device *dev)
>>  	cancel_work_sync(&priv->detect_work);
>>  
>>  	i2c_unregister_device(priv->cec);
>> -
>> -	cec_notifier_conn_unregister(priv->cec_notify);
>>  }
>>  
>>  static int tda998x_create(struct device *dev)
>> @@ -1811,6 +1833,7 @@ static int tda998x_create(struct device *dev)
>>  	mutex_init(&priv->mutex);	/* protect the page access */
>>  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
>>  	mutex_init(&priv->edid_mutex);
>> +	mutex_init(&priv->cec_notify_mutex);
>>  	INIT_LIST_HEAD(&priv->bridge.list);
>>  	init_waitqueue_head(&priv->edid_delay_waitq);
>>  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
>> @@ -1915,12 +1938,6 @@ static int tda998x_create(struct device *dev)
>>  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
>>  	}
>>  
>> -	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
>> -	if (!priv->cec_notify) {
>> -		ret = -ENOMEM;
>> -		goto fail;
>> -	}
>> -
>>  	priv->cec_glue.parent = dev;
>>  	priv->cec_glue.data = priv;
>>  	priv->cec_glue.init = tda998x_cec_hook_init;
>> -- 
>> 2.23.0
>>
>>
> 

