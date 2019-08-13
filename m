Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419BB8B7A9
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfHML42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:56:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51891 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727342AbfHML42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:56:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so1243648wma.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D0fIGhGLp0xihNCsIbbPap9YOn2voGlklnNOTUFqYtw=;
        b=LebCRVSjUZB/PIYePN/CZKKgNdJVMoe9Al41mBq5/r1f8sbhjZHaXaKS2+N2AVhUjn
         xPJ0BTZ8ebK7h+Qk54yRcaH7V7pxZa1CoPTpSvM8vMBwp94mGGTlh0bZePZzBwspMeZP
         RE0+2L/fptYHTKFmqH9HSD6SLXkaISGrkMzVEfnD/9KrJSOnMZ6HaRtu71msO/JI4Eqa
         y7hfCu5ZYQSLxAnvQJYbX51FG5gtCCJbdyjmPofpYrz58iRf2i1aD8y7Q7LUgP62F2nY
         bZEnMjBN3vX9tF9xVTGjenlq7Ukb6uiFGgAw9KNz0bxdzNMCoBi+F/HOxvqMhiyj9cfA
         eQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D0fIGhGLp0xihNCsIbbPap9YOn2voGlklnNOTUFqYtw=;
        b=eWmCjwJy/29oTw4jRBlaeDhizfPvXG1oNPVQ9SoNg+4MGt5HGiN+gLTB3SzDYnmGxl
         VJSjGPxR/+uBATZVCNs6vQYAPwBe5rAzYhFPHnxlNW0+62wqytkxQfQDoN+rtJzIbIZX
         Yq+XgTumNeIVIh3UuGhuhPS09m9t3uCzHr5GWVkZYDkRC0X9QVx1yZn1STJi0xlJmMn0
         7x1Gcq3Gj4hwDI4M1RBkGISdurtgrfVLz++I8OVkmoQvMxZEMLW7lp7T6hd8Xsjm6Lf4
         BrwEJKBtaab6yGmrM3LAd+yluxzndOAsBN9jMaCJeQO+dmz+TKXf3JUzmfVACEzTKaBZ
         MuSw==
X-Gm-Message-State: APjAAAWzj9FKEL7q+cYipMnEX7tU5baxXS4Tk5zhxVBZqTkGnU+FKqya
        ceusWJP1kirKVjbrCJfPXu47+Q==
X-Google-Smtp-Source: APXvYqz8WMcBFAqdKArlOCGzWhq5IJhPXZEu4YE0kUEIVfKEW9aZNeO1hcGL+vxVVoNdNDQVd980MQ==
X-Received: by 2002:a1c:be05:: with SMTP id o5mr2815270wmf.52.1565697385206;
        Tue, 13 Aug 2019 04:56:25 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n14sm213373304wra.75.2019.08.13.04.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 04:56:24 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Paul <seanpaul@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
 <c05b6989-a2a2-e728-7fef-3342b14fa655@xs4all.nl>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9c254c99-efda-f603-7ee2-8859af635a8e@baylibre.com>
Date:   Tue, 13 Aug 2019 13:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c05b6989-a2a2-e728-7fef-3342b14fa655@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 13/08/2019 13:43, Hans Verkuil wrote:
> On 8/13/19 11:32 AM, Hans Verkuil wrote:
>> When testing CEC on the AML-S905X-CC board I noticed that the CEC physical
>> address was not invalidated when the HDMI cable was unplugged. Some more
>> digging showed that meson uses meson_dw_hdmi.c to handle the HPD.
>>
>> Both dw_hdmi_irq() and dw_hdmi_top_thread_irq() (in meson_dw_hdmi.c) call
>> the dw_hdmi_setup_rx_sense() function. So move the code to invalidate the
>> CEC physical address to that function, so that it is independent of where
>> the HPD interrupt happens.
>>
>> Tested with both a AML-S905X-CC and a Khadas VIM2 board.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Please disregard this patch, Jonas Karlman will post a different series
> which will fix this in a different way.

Noted, thanks.

Neil

> 
> Regards,
> 
> 	Hans
> 
>> ---
>> Note: an alternative would be to make a new dw-hdmi function such as
>> dw_hdmi_cec_phys_addr_invalidate() that is called from meson_dw_hdmi.c.
>> I decided not to do that since this patch is minimally invasive, but
>> that can obviously be changed if that approach is preferred.
>> ---
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index c5a854af54f8..e899b31e1432 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2329,6 +2329,13 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
>>  		dw_hdmi_update_power(hdmi);
>>  		dw_hdmi_update_phy_mask(hdmi);
>>  	}
>> +	if (!hpd && !rx_sense) {
>> +		struct cec_notifier *notifier = READ_ONCE(hdmi->cec_notifier);
>> +
>> +		if (notifier)
>> +			cec_notifier_phys_addr_invalidate(notifier);
>> +	}
>> +
>>  	mutex_unlock(&hdmi->mutex);
>>  }
>>  EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
>> @@ -2369,14 +2376,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>>  		dw_hdmi_setup_rx_sense(hdmi,
>>  				       phy_stat & HDMI_PHY_HPD,
>>  				       phy_stat & HDMI_PHY_RX_SENSE);
>> -
>> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
>> -			struct cec_notifier *notifier;
>> -
>> -			notifier = READ_ONCE(hdmi->cec_notifier);
>> -			if (notifier)
>> -				cec_notifier_phys_addr_invalidate(notifier);
>> -		}
>>  	}
>>
>>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
>>
> 

