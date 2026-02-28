Return-Path: <linux-media+bounces-53857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDh7LWNuo2kwDAUAu9opvQ
	(envelope-from <linux-media+bounces-53857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 23:38:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A641C9890
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 23:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C07EA305581B
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 22:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FBE3E0C49;
	Sat, 28 Feb 2026 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="Ut58NJGr"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440BA373BED;
	Sat, 28 Feb 2026 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772318291; cv=none; b=OWRJFX8UFHnMUp9W1rQk3p7asBuOlZoU6r0pUxGV+DYsc6DsZWNKoP0jtwAvZe+CfWQNiRHhZpQqZEzjnC83c23tRJD8zxVkEzBW38cNLJEyE46eMYobZOKfnNZcH1JHfDHw1OkfGw5Pifl/tPtDPOuS8BKHA2hRsWHqu0Xff1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772318291; c=relaxed/simple;
	bh=yTJw3D5X/8ULd+kQP7paiNd4Gx7phofeqkZP/k7EmIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6tvzJOSf6EgdRikTzjgQzXgT92MCtb1wv74qHBRatlGSqdarHnm2N31RgrOjaLOcp3kBkXZOpERn0kZ36M90NS0LYEP8qmXTT6nzI0xphIWbL6IKd5ciHpbCvhrDEOvFe+Zx/9HLJRNzzLGbG7JxhKC9Z6O40013XP/3RMbN9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=Ut58NJGr; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id D0F0553414A8;
	Sat, 28 Feb 2026 23:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1772318279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jvSVwTYqpZq2a3E7KQfUsMesaGDJLkDmfXiKufkM+UU=;
	b=Ut58NJGrLNbyGOqmaQZap7GmVLOLjfLG6HltW9qyshNjsTildu1dkkzvZgoDXdjpsVIzpm
	6IvJxa/6uRvmkTyoJIRJgqfXBzp66ZXDj9zeEAzOFzV4uJftq9hFKG4s6mLtbfLhv3H3Ul
	+BKLw0CCVSIDO6ixxLb7Fq0IkQT8JF4=
Message-ID: <b23f0e1e-8a79-44c6-a0b8-09997ed26e4b@ixit.cz>
Date: Sat, 28 Feb 2026 23:37:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Petr Hodina <phodina@protonmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz>
 <de5fbe8d-3f9e-4be8-a9e3-991b959305e4@linaro.org>
 <176873791545.3486172.9291085318504972330@ping.linuxembedded.co.uk>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <176873791545.3486172.9291085318504972330@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53857-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,linaro.org,gmail.com,fairphone.com,kernel.org,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:mid,ixit.cz:dkim,ixit.cz:email]
X-Rspamd-Queue-Id: 14A641C9890
X-Rspamd-Action: no action

On 18/01/2026 13:05, Kieran Bingham wrote:
> Quoting Bryan O'Donoghue (2026-01-17 21:38:17)
>> On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> So far, only D-PHY mode was supported, which uses even bits when enabling
>>> or masking lanes. For C-PHY configuration, the hardware instead requires
>>> using the odd bits.
>>>
>>> Since there can be unrecognized configuration allow returning failure.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>    .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>>>    .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
>>>    drivers/media/platform/qcom/camss/camss-csiphy.c   |  4 +-
>>>    drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>>>    4 files changed, 47 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
>>> index 9d67e7fa6366a..bb4b91f69616b 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
>>> @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>>>        return settle_cnt;
>>>    }
>>>    
>>> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>> -                             struct csiphy_config *cfg,
>>> -                             s64 link_freq, u8 lane_mask)
>>> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>>> +                            struct csiphy_config *cfg,
>>> +                            s64 link_freq, u8 lane_mask)
>>>    {
>>>        struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>>>        u8 settle_cnt;
>>> @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>>                writel_relaxed(0x3f, csiphy->base +
>>>                               CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
>>>        }
>>> +
>>> +     return 0;
>>>    }
>>>    
>>>    static void csiphy_lanes_disable(struct csiphy_device *csiphy,
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 4154832745525..f3a8625511e1e 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -14,6 +14,7 @@
>>>    #include <linux/delay.h>
>>>    #include <linux/interrupt.h>
>>>    #include <linux/io.h>
>>> +#include <linux/media-bus-format.h>
>>>    
>>>    #define CSIPHY_3PH_LNn_CFG1(n)                      (0x000 + 0x100 * (n))
>>>    #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG (BIT(7) | BIT(6))
>>> @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>>>    
>>>    static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>>>    {
>>> -     u8 lane_mask;
>>> -     int i;
>>> +     u8 lane_mask = 0;
>>>    
>>> -     lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>>> +     switch (lane_cfg->phy_cfg) {
>>> +     case V4L2_MBUS_CSI2_CPHY:
>>> +             for (int i = 0; i < lane_cfg->num_data; i++)
>>> +                     lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
>>
>> 1 << anything == BIT(anything)
>>
>> I've always disliked the look of this code and now it occurs to me why.
>>
>> This code is analogous to:
>>
>> lane_mask |= BIT(lane_cfg->data[i].pos) + 1);
> 
> I see that addition to a bit mask and get a little bit scared.
> 
> This gives:
>    pos   mask
>     0    0b00000010 (note 0 bit is zero here but 1 on all others)
>     1    0b00000011
>     2    0b00000101
>     3    0b00001001
>     4    0b00010001
> 
> Is that expected?
> 
> Can data[i].pos ever be position 0 ??
> 
> I assume this starts at position 1 - and the +1 here is to always set
> the zeroth bit ?
> 
> Perhapse this might be precise to convey that in such a case?
> 
>    lane_mask |= BIT(pos) | 1;
> 
> I guess it depends on what this is really being used for which I don't
> have in my context.

Ok, I started looking again into the lovely downstream code.

D-PHY has bits 0b0D_D_D_D
C-PHY has bits 0b0_C_C_C_

so for some reason it worked in my usecase without proper lane mask, but 
the original formula should be

  -                     lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
  +                     lane_mask |= (1 << lane_cfg->data[i].pos + 1);

Thus

BIT(lane_cfg->data[i].pos + 1);

> 
> --
> Kieran
> 
>   
> 
>>
>> but BIT() is less janky and more upstreamy.
>>
>> janky/upstreamy - this is the on-point technical argument y'all came
>> here for :)
>>
>>> +             break;
>>> +     case V4L2_MBUS_CSI2_DPHY:
>>> +             lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>>>    
>>> -     for (i = 0; i < lane_cfg->num_data; i++)
>>> -             lane_mask |= 1 << lane_cfg->data[i].pos;
>>> +             for (int i = 0; i < lane_cfg->num_data; i++)
>>> +                     lane_mask |= 1 << lane_cfg->data[i].pos;
>>> +             break;
>>> +     default:
>>> +             break;
>>> +     }
>>>    
>>>        return lane_mask;
>>>    }
>>> @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
>>>        return ret;
>>>    }
>>>    
>>> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>> -                             struct csiphy_config *cfg,
>>> -                             s64 link_freq, u8 lane_mask)
>>> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>>> +                            struct csiphy_config *cfg,
>>> +                            s64 link_freq, u8 lane_mask)
>>>    {
>>> +     struct device *dev = csiphy->camss->dev;
>>>        struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>>>        struct csiphy_device_regs *regs = csiphy->regs;
>>>        u8 settle_cnt;
>>> @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>>    
>>>        settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>>>    
>>> -     val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>>> -     for (i = 0; i < c->num_data; i++)
>>> -             val |= BIT(c->data[i].pos * 2);
>>> +     val = 0;
>>> +
>>> +     switch (c->phy_cfg) {
>>> +     case V4L2_MBUS_CSI2_CPHY:
>>> +             for (i = 0; i < c->num_data; i++)
>>> +                     val |= BIT((c->data[i].pos * 2) + 1);
>>> +             break;
>>> +     case V4L2_MBUS_CSI2_DPHY:
>>> +             val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>>> +
>>> +             for (i = 0; i < c->num_data; i++)
>>> +                     val |= BIT(c->data[i].pos * 2);
>>> +             break;
>>> +     default:
>>> +             dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
>>> +             return -EINVAL;
>>> +     }
>>>    
>>>        writel_relaxed(val, csiphy->base +
>>>                       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>>> @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>>                writel_relaxed(0, csiphy->base +
>>>                               CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>>>        }
>>> +
>>> +     return 0;
>>>    }
>>>    
>>>    static void csiphy_lanes_disable(struct csiphy_device *csiphy,
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> index 62623393f4144..08dd238e52799 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> @@ -295,9 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>>>                wmb();
>>>        }
>>>    
>>> -     csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
>>> -
>>> -     return 0;
>>> +     return csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
>>
>> ick.
>>
>> More high brow stuff from bod here but, more seriously this is three
>> levels of indirection deep and the statement keeps getting longer.
>>
>> Could you get a pointer to hw_ops() to reduce this down a bit.
>>
>>>    }
>>>    
>>>    /*
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
>>> index d198171700e73..21cf2ce931c1d 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
>>> @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
>>>        void (*hw_version_read)(struct csiphy_device *csiphy,
>>>                                struct device *dev);
>>>        void (*reset)(struct csiphy_device *csiphy);
>>> -     void (*lanes_enable)(struct csiphy_device *csiphy,
>>> -                          struct csiphy_config *cfg,
>>> -                          s64 link_freq, u8 lane_mask);
>>> +     int (*lanes_enable)(struct csiphy_device *csiphy,
>>> +                         struct csiphy_config *cfg,
>>> +                         s64 link_freq, u8 lane_mask);
>>>        void (*lanes_disable)(struct csiphy_device *csiphy,
>>>                              struct csiphy_config *cfg);
>>>        irqreturn_t (*isr)(int irq, void *dev);
>>>
>>
>> With those tweaks.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> ---
>> bod

-- 
David Heidelberg


