Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C21D2E4ED
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 21:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfE2TDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 15:03:37 -0400
Received: from mout1.fh-giessen.de ([212.201.18.42]:59600 "EHLO
        mout1.fh-giessen.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfE2TDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 15:03:37 -0400
Received: from mx3.fh-giessen.de ([212.201.18.28])
        by mout1.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hW3rK-0007Qc-BO; Wed, 29 May 2019 21:03:34 +0200
Received: from mailgate-1.its.fh-giessen.de ([212.201.18.15])
        by mx3.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hW3rK-004aeu-6m; Wed, 29 May 2019 21:03:34 +0200
Received: from p2e5610f3.dip0.t-ipconnect.de ([46.86.16.243] helo=zwei.fritz.box)
        by mailgate-1.its.fh-giessen.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hW3rJ-0006F9-UO; Wed, 29 May 2019 21:03:34 +0200
Subject: Re: [PATCH v2] drivers/media/dvb-frontends: Implement probe/remove
 for stv6110x
To:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
References: <20190509195118.23027-1-tobias.johannes.klausmann@mni.thm.de>
 <20190529165633.8779-1-tobias.johannes.klausmann@mni.thm.de>
 <bcd12350374533ef090ae911be444e702e85134b.camel@perches.com>
From:   Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Message-ID: <d1afd4d3-0dc5-718d-f7b4-f763f367ca1e@mni.thm.de>
Date:   Wed, 29 May 2019 21:03:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:69.0) Gecko/20100101
 Thunderbird/69.0a1
MIME-Version: 1.0
In-Reply-To: <bcd12350374533ef090ae911be444e702e85134b.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 29.05.19 20:45, Joe Perches wrote:
> On Wed, 2019-05-29 at 18:56 +0200, Tobias Klausmann wrote:
>> Refactor out the common parts of stv6110x_probe() and stv6110x_attach()
>> into separate functions.
>>
>> This provides the needed functionality to use dvb_module_probe() instead
>> of dvb_attach()!
>>
>> v2:
>> - Impovments based on comments by Sean Young
>> - Fix checkpatch.pl --strict errors
> trivia:
>
>> diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
> []
>> @@ -333,6 +333,41 @@ static void stv6110x_release(struct dvb_frontend *fe)
>>   	kfree(stv6110x);
>>   }
>>   
>> +void st6110x_init_regs(struct stv6110x_state *stv6110x)
>> +{
>> +	u8 default_regs[] = {0x07, 0x11, 0xdc, 0x85, 0x17, 0x01, 0xe6, 0x1e};
> static const u8...
>
>> +
>> +	memcpy(stv6110x->regs, default_regs, 8);
> 	memcpy(stv6110x->regs, default_regs, ARRAY_SIZE(default_regs));
>
>> +}
>> +
>> +void stv6110x_setup_divider(struct stv6110x_state *stv6110x)
>> +{
>> +	switch (stv6110x->config->clk_div) {
>> +	default:
>> +	case 1:
>> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
>> +				  CTRL2_CO_DIV,
>> +				  0);
>> +		break;
>> +	case 2:
>> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
>> +				  CTRL2_CO_DIV,
>> +				  1);
>> +		break;
>> +	case 4:
>> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
>> +				  CTRL2_CO_DIV,
>> +				  2);
>> +		break;
>> +	case 8:
>> +	case 0:
>> +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2],
>> +				  CTRL2_CO_DIV,
>> +				  3);
>> +		break;
>> +	}
>> +}
> Probably more sensible (and smaller object code) written using
> an automatic like:
>
> {
> 	int div;
>
> 	switch (stv6110x->config->clk_div) {
> 	case 8:
> 		div = 3;
> 		break;
> 	case 4:
> 		div = 2;
> 		break;
> 	case 2:
> 		div = 1;
> 		break;
> 	case 1:
> 	default:
> 		div = 0;
> 		break;
> 	}
> 	STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, div);
> }
>
>> diff --git a/drivers/media/dvb-frontends/stv6110x_priv.h b/drivers/media/dvb-frontends/stv6110x_priv.h
> []
>> @@ -54,11 +54,12 @@
>>   #define REFCLOCK_MHz				(stv6110x->config->refclk / 1000000)
>>   
>>   struct stv6110x_state {
>> +	struct dvb_frontend		*frontend;
>>   	struct i2c_adapter		*i2c;
>>   	const struct stv6110x_config	*config;
>>   	u8				regs[8];
> Perhaps this 8 should be a define?
>
>

Hi,

thanks for the comments! If really desired i can change the code 
further, adapting to your comments, but note that the code was 
essentially just moved around to cater to both _probe() and attach(), 
intentionally leaving it as it was before the patch!

Greetings,

Tobias

