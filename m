Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCAA8B5E6
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 12:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfHMKti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 06:49:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58761 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726287AbfHMKth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 06:49:37 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xUMbhKdprqTdhxUMfh9BfH; Tue, 13 Aug 2019 12:49:35 +0200
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
To:     Jonas Karlman <jonas@kwiboo.se>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
 <60547c6d-e8a1-0b2c-b8ae-acb2f4643be8@xs4all.nl>
 <HE1PR06MB40116485045605E0B9E67B92ACD20@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c3229563-03bb-925c-ab88-7bcc7549a2a7@xs4all.nl>
Date:   Tue, 13 Aug 2019 12:49:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <HE1PR06MB40116485045605E0B9E67B92ACD20@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIDM+mmbXuvkWc2e6cNTuCVyw0JOWLe6eoY/65jf7qHu34cW2VICpkSYlFW3npCAy/En6Sw4scAsuwJHU569zOD0d0YsVPQK9M2mg2wL0b3kObgVBZXF
 uqRjOO6SsEiOcUKlKPtTeLm3+aDMK3y35J+NFPasDAtTeRhBL0rnUeR4EIjCDxa3x/G/+/cM2MLvEmvZlcFIUUbqWcVFM9HkeHypgx6u5wQj1Qy6GDWg9x77
 U13OF1h5VkTH7ARXwsXRU8sgO0qpvk8CSwJeAMQ1f/oa8M3gvWoO6SHpBfM8q+C3pyJ42VWv5kYLUm++0EffjP1O199KcwRmoza5BeWhcaMJnKVJ04BakigV
 EinY73gRPiAcrbDQB7rAut9espnkZLkHeO9obHLBsIBxbt92qEIqsAeVvp7EjIjoF66F46Wh7DdIlmXOaXNjZWWMBSea57mmBw1MNFzIYf5GOdSlq/MEeL1G
 XU3aGTxy1RVjhILqJJySc8Ezut33/ZhqFYo/WgPyEFPKfHx1zu39Umd1IFU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On 8/13/19 12:18 PM, Jonas Karlman wrote:
> As an alternative I have a patch [1] to submit that moves cec_notifier_phys_addr_invalidate() call
> from dw_hdmi_irq() to dw_hdmi_connector_detect() in order to address an issue with
> stale CEC phys addr and stale EDID/ELD data after TV or AVR uses a 100ms HPD pulse
> to signal EDID has changed, full patchset at [2].
> 
> At the moment CEC phys address is invalidated directly at HPD, leaving the address as invalid
> after a 100ms HPD pulse, phys address may later be restored to a valid phys address when
> get_modes() is called by drm core.
> 
> Should I wait on your and related patches to be merged before submitting my series?

Let me test your patch on my meson device and see if it solves this issue as well.

I'll get back to you later today.

Regards,

	Hans

> 
> [1] https://github.com/Kwiboo/linux-rockchip/commit/2f4f99c82983e70952668c21f1c56a0241bd75f2
> [2] https://github.com/Kwiboo/linux-rockchip/compare/next-20190813...next-20190813-cec-eld
> 
> Regards,
> Jonas
> 
> On 2019-08-13 11:34, Hans Verkuil wrote:
>> CC Dariusz as well, since this issue was discovered when testing his
>> CEC patches.
>>
>> Regards,
>>
>> 	Hans
>>
>> On 8/13/19 11:32 AM, Hans Verkuil wrote:
>>> When testing CEC on the AML-S905X-CC board I noticed that the CEC physical
>>> address was not invalidated when the HDMI cable was unplugged. Some more
>>> digging showed that meson uses meson_dw_hdmi.c to handle the HPD.
>>>
>>> Both dw_hdmi_irq() and dw_hdmi_top_thread_irq() (in meson_dw_hdmi.c) call
>>> the dw_hdmi_setup_rx_sense() function. So move the code to invalidate the
>>> CEC physical address to that function, so that it is independent of where
>>> the HPD interrupt happens.
>>>
>>> Tested with both a AML-S905X-CC and a Khadas VIM2 board.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> ---
>>> Note: an alternative would be to make a new dw-hdmi function such as
>>> dw_hdmi_cec_phys_addr_invalidate() that is called from meson_dw_hdmi.c.
>>> I decided not to do that since this patch is minimally invasive, but
>>> that can obviously be changed if that approach is preferred.
>>> ---
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index c5a854af54f8..e899b31e1432 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -2329,6 +2329,13 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
>>>  		dw_hdmi_update_power(hdmi);
>>>  		dw_hdmi_update_phy_mask(hdmi);
>>>  	}
>>> +	if (!hpd && !rx_sense) {
>>> +		struct cec_notifier *notifier = READ_ONCE(hdmi->cec_notifier);
>>> +
>>> +		if (notifier)
>>> +			cec_notifier_phys_addr_invalidate(notifier);
>>> +	}
>>> +
>>>  	mutex_unlock(&hdmi->mutex);
>>>  }
>>>  EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
>>> @@ -2369,14 +2376,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>>  		dw_hdmi_setup_rx_sense(hdmi,
>>>  				       phy_stat & HDMI_PHY_HPD,
>>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>>> -
>>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>>> -			struct cec_notifier *notifier;
>>> -
>>> -			notifier = READ_ONCE(hdmi->cec_notifier);
>>> -			if (notifier)
>>> -				cec_notifier_phys_addr_invalidate(notifier);
>>> -		}
>>>  	}
>>>
>>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>>>
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

