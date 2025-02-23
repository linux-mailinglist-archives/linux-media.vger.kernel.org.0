Return-Path: <linux-media+bounces-26746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3142A411D7
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 22:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4079A18941DD
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4887F23F431;
	Sun, 23 Feb 2025 21:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iFCz7x/l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C971779AE;
	Sun, 23 Feb 2025 21:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740345177; cv=none; b=b36ENgG5gv5igZouo9PVtV064QJl8P/BLiJyqKsGymkkHuhdSN7PdBdfuA1bHbPUQZF0QGg52gBs/q7MKsbAqAv+l2ahwL4ickcdZGbeY+vfB9RnDLOhvNVtTSbIVymWz9KRlH2lqzSLDhrqXycEpHe8wwPU7xifOATmVRtWfpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740345177; c=relaxed/simple;
	bh=4cT9/rnA+ov3lSMlqJGW4xGAX12gh3yHhfV3xJLloB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asxzg1fQ40SDn+ehdHnSTJnkMv2AvYQrKUxkC3vekwyqSvbL1k36+uQTm7MU0MNysup7q/lUIh/HoEgT7Vw1FHLLQi/tsRVTDwzXn7n1QbNz9NReWAVtgt+6D7iFFf5hbl5Mp3YugRW+tCpknaNSvX1sSjTOvsUEj1GUzlqT31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=iFCz7x/l; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mJGAtHQOaZS23mJGDtmdYt; Sun, 23 Feb 2025 22:11:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740345101;
	bh=HuJJOq1A9e3DRjNXPiYM07a9GOunl4wRKobsFRzCRpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=iFCz7x/l/vAWKzpr/kGp4iTumBqm4ke1nj5jNeEirgSnW0ryCDpNkBRG+IRL9lG2P
	 4PBMJzLCWnjgiEX6TRKMbsGAiYvm/jMuXL0BGzcLrq+vusJkbUY6823CBc7aeLjwOQ
	 Mv2p+CbfANUmfUkbf933++GJ/UCB40Di9za32dKE+Xt59903co7J1U5VcLmSTDmln+
	 GKitQatXs0ENsI1WMhD1Rs4yVuL9u/yGkkJLlcbtT3xg7aSIHDEZvl/RQe3W2MaAAX
	 mCV+KmDhnzBcO7ahZy1JcKlD1LGL1OhhEfQYyMQTMGzAEMApyodcudar56WBF0LTtT
	 s85ibwzfXIUPQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 23 Feb 2025 22:11:41 +0100
X-ME-IP: 90.11.132.44
Message-ID: <bc1f5334-b0fb-4e81-979d-feb17886ac40@wanadoo.fr>
Date: Sun, 23 Feb 2025 22:11:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
 <20250223173019.303518-5-dmitry.osipenko@collabora.com>
 <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
 <c30a291b-c81b-4da1-a0ae-270d323b28e3@collabora.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <c30a291b-c81b-4da1-a0ae-270d323b28e3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/02/2025 à 19:08, Dmitry Osipenko a écrit :
> On 2/23/25 20:54, Christophe JAILLET wrote:
>> Le 23/02/2025 à 18:30, Dmitry Osipenko a écrit :
>>> From: Shreeya Patel <shreeya.patel@collabora.com>
>>>
>>> Add initial support for the Synopsys DesignWare HDMI RX
>>> Controller Driver used by Rockchip RK3588. The driver
>>> supports:
>>>    - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>>>    - RGB888, YUV422, YUV444 and YCC420 pixel formats
>>>    - CEC
>>>    - EDID configuration
>>>
>>> The hardware also has Audio and HDCP capabilities, but these are
>>> not yet supported by the driver.
>>>
>>> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
>>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Hi,
>>
>>> +    hdmirx_dev->dev = dev;
>>> +    dev_set_drvdata(dev, hdmirx_dev);
>>> +
>>> +    ret = hdmirx_parse_dt(hdmirx_dev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = hdmirx_setup_irq(hdmirx_dev, pdev);
>>> +    if (ret)
>>> +        return ret;
>>
>>  From here, should of_reserved_mem_device_release() be called in the
>> error handling path, as done in the remove function?
> 
> Indeed, I'll make it to use devm.
> 
>>> +    hdmirx_dev->regs = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(hdmirx_dev->regs))
>>> +        return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
>>> +                     "failed to remap regs resource\n");
>>
>> ...
>>
>>> +static const struct of_device_id hdmirx_id[] = {
>>> +    { .compatible = "rockchip,rk3588-hdmirx-ctrler" },
>>> +    { },
>>
>> Unneeded trailing comma after a terminator.
>>
>>> +};
>>> +MODULE_DEVICE_TABLE(of, hdmirx_id);
>>
>> ...
>>
>>> +    ret = cec_register_adapter(cec->adap, cec->dev);
>>> +    if (ret < 0) {
>>> +        dev_err(cec->dev, "cec register adapter failed\n");
>>> +        cec_unregister_adapter(cec->adap);
>>
>> Is it needed to call cec_unregister_adapter() when
>> cec_register_adapter() fails?
> 
> Yes, it's confusing, but unregister is needed to free the adapter
> properly, it's prepared to do it. Thanks for the review.
> 

I don't know this API, so you'll get the last word, but 
cec_unregister_adapter() does not seem to do that many things in such a 
case, unless I miss something. See [1].

CJ

[1]: 
https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/cec/core/cec-core.c#L370


