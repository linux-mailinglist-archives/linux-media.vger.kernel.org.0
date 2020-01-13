Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6C5139235
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 14:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgAMNao (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 08:30:44 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:57165 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbgAMNao (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 08:30:44 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qzngi2FHLT6sRqznjiTpoc; Mon, 13 Jan 2020 14:30:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578922241; bh=WIUz0xTfwtLyoV2LJEwr1Uk9Zk7Luj7PT5AamxbjESc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T5AhSX1P4skXfJwhEsR52BqtUgD/WUR4yOBETHIsTDUICKEuY1mB+o8lJMd0oJYhJ
         PazS8RgYbWheq5Oqmo6rUSHhsJyavyL98ZdkSdKJhPmpnYjyg4yJyN9RtbhLZ/isXO
         1WVgDdPH1+dxGd1q/1Khsyo4JI03YenGhYAXVGoDkP9DsQZWEe6BiIh1IlajZPP/Uf
         E2r1mt6V92cgS+LvvwwjJoBefFNC4OzR4tCc+aeYIdwEvig9JSLYxcRiO+px8fdCF6
         GX75Ll7rZ91vGeixkuSomh4vsKKq43/u5yDmYyMA95C9G5HwBYxLtMiklHLR9lBzOg
         I2ypwmDnl8UPg==
Subject: Re: [PATCH v2 3/3] media: platform: meson-ao-cec-g12a: add wakeup
 support
To:     guillaume La Roque <glaroque@baylibre.com>,
        narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191213132956.11074-1-glaroque@baylibre.com>
 <20191213132956.11074-4-glaroque@baylibre.com>
 <cccc0cda-7403-1378-40c8-291b11bf868a@xs4all.nl>
 <0a07b5cc-a7dc-2983-89de-a1894ae6a469@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <75278f35-c4c2-90bc-cc54-8c3b5bbdd7e1@xs4all.nl>
Date:   Mon, 13 Jan 2020 14:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0a07b5cc-a7dc-2983-89de-a1894ae6a469@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAg7k4oa41o5OS0rku6ta94gSDgjExAsJ4lPqKm3rl9aL2mf4mm15Fi/g76iZp6EgzdJ9XDyb/ZSPJMq5sPKU7pihjfa0LuVk29TobWKXfAfSefmeKDb
 zaQFxiVnQ5l3xBs42icgedD7Ry5LegTl+Pfs9kz1Qxs4UrcWx2iKewbBF3++d9bPRU7qUc6R0vJaaHAX5GZWZn4LpvJSLZtdcHYH0JUKK6p4VAONGqO4R27v
 D7GClt/LyO+Bfkb3QBj+yNaKc9Akhmd9eW9EVOG4gfQ9H1RP0+WlBnUmdylTXgQ3tkmOF/d5z+kaKLteSvVSDaHTz52DDTMTGWo8MW4+eURAjltRLLSSBvK1
 V9CHGcYtcY9LOF3uS813o4CctPg7y/B6T7DyyC33jyzFIx0fWXifinJHTWQCzqQn08CFc6hvMHo3ZkFyvsyLPmAWL95ZSula3TKH7634bjz+p4K+m+gMHi0o
 mcCMLuWhT5K/v2WPGL8e+3KXmdCq679m+P5DBA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/10/20 4:06 PM, guillaume La Roque wrote:
> Hi Hans,
> 
> On 1/7/20 3:36 PM, Hans Verkuil wrote:
>> Hi Guillaume,
>>
>> On 12/13/19 2:29 PM, Guillaume La Roque wrote:
>>> add register configuration to activate wakeup feature in bl301
>>>
>>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>> ---
>>>  drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
>>> index 891533060d49..85850b974126 100644
>>> --- a/drivers/media/platform/meson/ao-cec-g12a.c
>>> +++ b/drivers/media/platform/meson/ao-cec-g12a.c
>>> @@ -25,6 +25,7 @@
>>>  #include <media/cec.h>
>>>  #include <media/cec-notifier.h>
>>>  #include <linux/clk-provider.h>
>>> +#include <linux/mfd/syscon.h>
>>>  
>>>  /* CEC Registers */
>>>  
>>> @@ -168,6 +169,18 @@
>>>  
>>>  #define CECB_WAKEUPCTRL		0x31
>>>  
>>> +#define CECB_FUNC_CFG_REG		0xA0
>>> +#define CECB_FUNC_CFG_MASK		GENMASK(6, 0)
>>> +#define CECB_FUNC_CFG_CEC_ON		0x01
>>> +#define CECB_FUNC_CFG_OTP_ON		0x02
>>> +#define CECB_FUNC_CFG_AUTO_STANDBY	0x04
>>> +#define CECB_FUNC_CFG_AUTO_POWER_ON	0x08
>>> +#define CECB_FUNC_CFG_ALL		0x2f
>>> +#define CECB_FUNC_CFG_NONE		0x0
>>> +
>>> +#define CECB_LOG_ADDR_REG	0xA4
>>> +#define CECB_LOG_ADDR_MASK	GENMASK(22, 16)
>>> +
>>>  struct meson_ao_cec_g12a_data {
>>>  	/* Setup the internal CECB_CTRL2 register */
>>>  	bool				ctrl2_setup;
>>> @@ -177,6 +190,7 @@ struct meson_ao_cec_g12a_device {
>>>  	struct platform_device		*pdev;
>>>  	struct regmap			*regmap;
>>>  	struct regmap			*regmap_cec;
>>> +	struct regmap			*regmap_ao_sysctrl;
>>>  	spinlock_t			cec_reg_lock;
>>>  	struct cec_notifier		*notify;
>>>  	struct cec_adapter		*adap;
>>> @@ -518,6 +532,13 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
>>>  					 BIT(logical_addr - 8));
>>>  	}
>>>  
>>> +	if (ao_cec->regmap_ao_sysctrl)
>>> +		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
>>> +					 CECB_LOG_ADDR_REG,
>>> +					 CECB_LOG_ADDR_MASK,
>>> +					 FIELD_PREP(CECB_LOG_ADDR_MASK,
>>> +						    logical_addr));
>>> +
>>>  	/* Always set Broadcast/Unregistered 15 address */
>>>  	ret |= regmap_update_bits(ao_cec->regmap_cec, CECB_LADD_HIGH,
>>>  				  BIT(CEC_LOG_ADDR_UNREGISTERED - 8),
>>> @@ -618,6 +639,13 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
>>>  		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
>>>  			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
>>>  
>>> +	if (ao_cec->regmap_ao_sysctrl) {
>>> +		regmap_update_bits(ao_cec->regmap_ao_sysctrl,
>>> +				   CECB_FUNC_CFG_REG,
>>> +				   CECB_FUNC_CFG_MASK,
>>> +				   CECB_FUNC_CFG_ALL);
>> What exactly is enabled here? Looking at CECB_FUNC_CFG_ALL it seems to
>> enable automatic standby (I presume when the STANDBY message is received?)
>> and power on (I presume when SET_STREAM_PATH is received?).
> this register and flags are used by bl301 part.
> 
> amlogic implemented a task to check cec event/message.
> 
> for power on in bl301 it's not only on SET_STREAM_PATH but also on :
> 
> USER_CONTROL_PRESSED
> TEXT_VIEW_ON

Not IMAGE_VIEW_ON?

> ACTIVE_SOURCE
> ROUTING_CHANGE
> 
> when in CECB_FUNC_CFG_REG register we put  CECB_FUNC_CFG_CEC_ON and  CECB_FUNC_CFG_AUTO_POWER_ON
> 
> it's not possible to change this

Too bad since ACTIVE_SOURCE and ROUTING_CHANGE should not power on a CEC device.

See section 11.5.2 in the HDMI 2.0 Specification for more details, if you have
that spec.

> 
>>
>> Do you really want to automatically handle STANDBY that way? What does this
>> do on the hardware level anyway? Isn't this something that should be
>> controlled in userspace?
> 
> in fact i do a new check in bl301 code amlogic do nothing on STANDBY so i will clean code
> 
> and activate real option supported by bl301
> 
>>
>> Similar questions for power on: you may not always want to enable this feature
>> since it depends very much on the precise use-case.
>>
>> And which messages it reacts to in order to do a power-on needs to be
>> documented since this differs depending on whether the CEC adapter is
>> used for a TV or for a playback device. This feature may be hardwired for
>> a playback device only, in which case it should probably be disabled if
>> the CEC adapter is configured as a TV.
>>
>> In any case I would like to see some more details about how this works,
>> especially since this is the first implementation of such a feature.
>>
>> I suspect that some userspace API might be needed to get the right level
>> of control of such a feature.
> 
> i will send v3 next week with some comments and fix ( disable are missing for example)
> 
> actual usercase is for android TV.
> 
> when cec was enable android TV want to be wakeup by cec event.
> 
> 
>> Regards,
>>
>> 	Hans
>>
> 
> thanks for your review

No problem!

	Hans

> 
> Regards
> 
> Guillaume
> 
>>> +	}
>>> +
>>>  	meson_ao_cec_g12a_irq_setup(ao_cec, true);
>>>  
>>>  	return 0;
>>> @@ -685,6 +713,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>>>  		goto out_probe_adapter;
>>>  	}
>>>  
>>> +	ao_cec->regmap_ao_sysctrl = syscon_regmap_lookup_by_phandle
>>> +		(pdev->dev.of_node, "amlogic,ao-sysctrl");
>>> +	if (IS_ERR(ao_cec->regmap_ao_sysctrl))
>>> +		dev_warn(&pdev->dev, "ao-sysctrl syscon regmap lookup failed.\n");
>>> +
>>>  	irq = platform_get_irq(pdev, 0);
>>>  	ret = devm_request_threaded_irq(&pdev->dev, irq,
>>>  					meson_ao_cec_g12a_irq,
>>>

