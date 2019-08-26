Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1739CD34
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 12:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfHZKQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 06:16:43 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54281 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727000AbfHZKQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 06:16:43 -0400
Received: from [IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4] ([IPv6:2001:983:e9a7:1:3421:ddcd:2260:77e4])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2C3Ai7U1uThuu2C3Ciztgj; Mon, 26 Aug 2019 12:16:40 +0200
Subject: Re: [PATCH 3/3] drm/bridge/adv7511: enable CEC connector info
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Archit Taneja <architt@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Boris Brezillon <bbrezillon@kernel.org>
References: <20190823112427.42394-1-hverkuil-cisco@xs4all.nl>
 <20190823112427.42394-4-hverkuil-cisco@xs4all.nl>
 <20190823185847.GC4791@pendragon.ideasonboard.com>
 <20190823190140.GD4791@pendragon.ideasonboard.com>
 <b16c0722-bdd8-ce94-6878-1fafa52a50d5@xs4all.nl>
 <20190826101306.GA5031@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0276c941-4fc3-0405-c73d-26f0fcc02570@xs4all.nl>
Date:   Mon, 26 Aug 2019 12:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190826101306.GA5031@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLGnRwXVqWlD6rEkCq4+QuIDMkOt1yVA03TLs6UEYT0+b1lk0b3wiD0C4hzk5i4yqNeVB+lfFMcXUeQBh1deRPXcyo8ixVUkAhtsjUIn+GSToKDJG+Xc
 939hBlyhfURReFnoICobXE9fBTiUv4Z+m0qH2EzWqYNEwGVH0LfonDl23gqwplyznsOTyq9RI+mjPhJo0uP2kJ0ul0SbhsPXA34rdgDtElUPeKOVc30Pq7GY
 vBvfuhR6DUmLW1C/QM4hQzVv57HqCcE6qGcxCRzs5xPkOGruyfATvrBj/zWtv5uBThkVHV1lFUq7IhxEWzbcvQ4GmjLGgJsRy7cj6i6kPs6e93CxeLT5G3G3
 EuFKKEGSB5brEtwGfSjM/QyFxA6FcQx2XC869JlBmqfeqKDn+qAQWW3g+TzY/7CbjG9EoBXYpfdPbpPaSodeZ2AgaqemxXNmAfo9KFnvLPd6cdy27vmPuyKp
 QMWSb0+/mmMNMR90/Ykij4cHCgymKaIpNn0EGubrVbkJyr/Z/rE0EvM3yZ52VBlqDBWUgvy8e1NTD7ljcWeUogCUb7YSqj2p2zLJxShmGd2swdvyd13HJQtu
 oTy+t4H5qs34LpwDFkBsoItD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/26/19 12:13 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Aug 26, 2019 at 11:01:40AM +0200, Hans Verkuil wrote:
>> On 8/23/19 9:01 PM, Laurent Pinchart wrote:
>>> (And CC'ing Andrzej Hajda and Neil Armstrong as the new DRM bridge
>>> maintainers, as well as Boris Brezillon, to make sure they're aware of
>>> the problem)
>>>
>>> I would really appreciate if we could delay merging this series and
>>> other similar changes until we find a proper solution.
>>>
>>> On Fri, Aug 23, 2019 at 09:58:47PM +0300, Laurent Pinchart wrote:
>>>> On Fri, Aug 23, 2019 at 01:24:27PM +0200, Hans Verkuil wrote:
>>>>> Set the connector info to help userspace associate the CEC adapter
>>>>> with the HDMI connector.
>>>>>
>>>>> This required that the cec initialization and unregistering the
>>>>> CEC adapter takes place in the bridge attach and detach ops.
>>>>>
>>>>> Tested on an R-Car Koelsch board.
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> ---
>>>>>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c |  7 ++++++-
>>>>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++----------
>>>>>  2 files changed, 17 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>>>>> index a20a45c0b353..accf5e232396 100644
>>>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>>>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>>>>> @@ -302,6 +302,7 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
>>>>>  
>>>>>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>>>>>  {
>>>>> +	struct cec_connector_info conn_info;
>>>>>  	unsigned int offset = adv7511->type == ADV7533 ?
>>>>>  						ADV7533_REG_CEC_OFFSET : 0;
>>>>>  	int ret = adv7511_cec_parse_dt(dev, adv7511);
>>>>> @@ -310,7 +311,8 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>>>>>  		goto err_cec_parse_dt;
>>>>>  
>>>>>  	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
>>>>> -		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
>>>>> +		adv7511, dev_name(dev),
>>>>> +		CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO, ADV7511_MAX_ADDRS);
>>>>>  	if (IS_ERR(adv7511->cec_adap)) {
>>>>>  		ret = PTR_ERR(adv7511->cec_adap);
>>>>>  		goto err_cec_alloc;
>>>>> @@ -331,6 +333,9 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>>>>>  		     ADV7511_REG_CEC_CLK_DIV + offset,
>>>>>  		     ((adv7511->cec_clk_freq / 750000) - 1) << 2);
>>>>>  
>>>>> +	cec_fill_conn_info_from_drm(&conn_info, &adv7511->connector);
>>>>> +	cec_s_conn_info(adv7511->cec_adap, &conn_info);
>>>>
>>>> I'm painfully trying to decouple bridges and connectors, if we keep
>>>> merging patches that go in the opposite direction, I'll never manage to
>>>> complete this :-(
>>>>
>>>> Bridges are moving to a model where they won't create connectors
>>>> themselves, so any new access to drm_connector contained in a bridge
>>>> structure is a no-go I'm afraid (I'm replying to this patch as I know
>>>> this driver best, but this comment applies to the other two patches in
>>>> the series as well).
>>>>
>>>> Here's what I wrote in a private e-mail, regarding similar changes for
>>>> the omapdrm driver.
>>>>
>>>> --------
>>>> Please have a look at "[PATCH 00/60] drm/omap: Replace custom display
>>>> drivers with drm_bridge and drm_panel", available in a new version at
>>>>
>>>> 	git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
>>>>
>>>> (I will post v2 soon)
>>>>
>>>> The patches show the direction the omapdrm driver is taking. The goal is
>>>> to decouple connectors from bridges, which I'm afraid will have an
>>>> impact on associating drm_connector with a CEC adapter. This should be
>>>> implemented through new drm_bridge operations, as bridges, when created,
>>>> will not create drm_connector anymore.
>>>>
>>>> I've solved a similar problem related to associating DRM connectors with
>>>> an I2C adapter for DDC. Please see the drm_bridge_connector_init()
>>>> function and how the DDC adapter is handled. Something similar could be
>>>> done for CEC.
>>>> --------
>>>>
>>>> Since then v2 has been posted ("[PATCH v2 00/50] drm/omap: Replace
>>>> custom display drivers with drm_bridge and drm_panel") and v3 is in
>>>> preparation.
>>>>
>>>> So, please, let's both go in the right direction and solve the problem
>>>> properly for CEC.
>>
>> I don't mind waiting one kernel cycle, but not longer. This CEC feature is
>> ready to be rolled out, so I am not willing to wait a long time for all
>> of this to land. I can help test CEC once you are going to roll this out
>> for all drm drivers (except for the sti SoC, since I don't have any HW).
>>
>> So do you think this will land for 5.5? If yes, then I'll wait.
> 
> I really hope so !
> 
> Would you be able to try to implement this feature for the OMAP4 based
> on my omapdrm/bridge/devel branch ? The other drivers should follow the
> same path, so that would be a good exercise.

I can try that later this week.

Regards,

	Hans

> 
>>>>> +
>>>>>  	ret = cec_register_adapter(adv7511->cec_adap, dev);
>>>>>  	if (ret)
>>>>>  		goto err_cec_register;
>>>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>>> index f6d2681f6927..bbcb996c4d4f 100644
>>>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>>>>> @@ -881,14 +881,24 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
>>>>>  		regmap_write(adv->regmap, ADV7511_REG_INT_ENABLE(0),
>>>>>  			     ADV7511_INT0_HPD);
>>>>>  
>>>>> +	if (!ret)
>>>>> +		ret = adv7511_cec_init(&adv->i2c_main->dev, adv);
>>>>>  	return ret;
>>>>>  }
>>>>>  
>>>>> +static void adv7511_bridge_detach(struct drm_bridge *bridge)
>>>>> +{
>>>>> +	struct adv7511 *adv = bridge_to_adv7511(bridge);
>>>>> +
>>>>> +	cec_unregister_adapter(adv->cec_adap);
>>>>> +}
>>>>> +
>>>>>  static const struct drm_bridge_funcs adv7511_bridge_funcs = {
>>>>>  	.enable = adv7511_bridge_enable,
>>>>>  	.disable = adv7511_bridge_disable,
>>>>>  	.mode_set = adv7511_bridge_mode_set,
>>>>>  	.attach = adv7511_bridge_attach,
>>>>> +	.detach = adv7511_bridge_detach,
>>>>>  };
>>>>>  
>>>>>  /* -----------------------------------------------------------------------------
>>>>> @@ -1202,7 +1212,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>>>>>  						IRQF_ONESHOT, dev_name(dev),
>>>>>  						adv7511);
>>>>>  		if (ret)
>>>>> -			goto err_unregister_cec;
>>>>> +			goto err_i2c_unregister_packet;
>>>>>  	}
>>>>>  
>>>>>  	adv7511_power_off(adv7511);
>>>>> @@ -1212,10 +1222,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>>>>>  	if (adv7511->type == ADV7511)
>>>>>  		adv7511_set_link_config(adv7511, &link_config);
>>>>>  
>>>>> -	ret = adv7511_cec_init(dev, adv7511);
>>>>> -	if (ret)
>>>>> -		goto err_unregister_cec;
>>>>> -
>>>>>  	adv7511->bridge.funcs = &adv7511_bridge_funcs;
>>>>>  	adv7511->bridge.of_node = dev->of_node;
>>>>>  
>>>>> @@ -1224,10 +1230,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>>>>>  	adv7511_audio_init(dev, adv7511);
>>>>>  	return 0;
>>>>>  
>>>>> -err_unregister_cec:
>>>>> -	i2c_unregister_device(adv7511->i2c_cec);
>>>>> -	if (adv7511->cec_clk)
>>>>> -		clk_disable_unprepare(adv7511->cec_clk);
>>>>>  err_i2c_unregister_packet:
>>>>>  	i2c_unregister_device(adv7511->i2c_packet);
>>>>>  err_i2c_unregister_edid:
>>>>> @@ -1254,8 +1256,6 @@ static int adv7511_remove(struct i2c_client *i2c)
>>>>>  
>>>>>  	adv7511_audio_exit(adv7511);
>>>>>  
>>>>> -	cec_unregister_adapter(adv7511->cec_adap);
>>>>> -
>>>>>  	i2c_unregister_device(adv7511->i2c_packet);
>>>>>  	i2c_unregister_device(adv7511->i2c_edid);
>>>>>  
> 

