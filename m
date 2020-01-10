Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF111370B0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 16:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgAJPGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 10:06:38 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51210 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbgAJPGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 10:06:38 -0500
Received: by mail-wm1-f68.google.com with SMTP id d73so2359789wmd.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2020 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZVAhaO7TDnAseI4aLa4+t0s+5RJrm76nog/ifK4rxPA=;
        b=bFgoHw7JJp8GVGZl/T3YZ4eiHv/jBo78Cru6gcpG/9KAzvNQlA/OK5vLKZ6HYSRvvr
         YDw4lLBKZMesQI/NQNUYtISeX91bwfTyZrmYNL1JPpcsLyYx4YiGwcooXk/wDdJvJwA9
         MkxegkuuthWTKwiPkZy3y5v1pS7xiufU5S0YA2xdwaGJFgFmEsrYQZFfRYCXpmp5g6Wh
         MFbOHjzfLmMdysNri/pPq1XjqxzxV4YjApCNUcSJo/3uer1cTemSjYyIEvyrwXmK3uSZ
         uYsDFJ0wpFqB201rBe0eoiTRcHN922G3aE281jAVxDRRPV1i20JuA8Jt38g9yOfhNIl/
         PdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZVAhaO7TDnAseI4aLa4+t0s+5RJrm76nog/ifK4rxPA=;
        b=lab/TtSTBYP5Mh1M3//r4ejFQav+t7/pJnqGNM0LdwwzA2SMWv3m9ug1FZ4MGGJlpK
         HR0ocvTaxKGeykwq5KODCkXfTPQ25paaxlstH7Uvfa1i7eY+m1zJ3NlxzVuKb6re5/uJ
         YaoSaiz4C7ZrYJi8dmraSI0D+0Udb1YlFTtF6edylfOxs0v2fnZ8ek6rda0+35HvPvnU
         v9+jaWRH48ttaLbAVAEZuDEiojNL7ZAV1/xzXRy8ZvVWAh4KydFgBkf7jzc3Is1Ar+Z1
         AR7VchiI1nL3mI9ZfGCmCMKpex4yqDzu5WWZhmf2vRnl7GHMfg1yTapkey6Vke+Fy+wd
         MjDg==
X-Gm-Message-State: APjAAAVsHAgIsuhMpI1Xi4WmBfHpkLmecYSDmtJDdzrsEE7HGua3qI7Z
        sYrldV/KkKCcA2TVST7FZ7hdBA==
X-Google-Smtp-Source: APXvYqzdaIwdojvVYENuw7ZWfAleo6eDsYH1yb2itBtPItx5viijEdtcxkQhBbYGecbcjjrO+s/MLQ==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr5077382wma.159.1578668796089;
        Fri, 10 Jan 2020 07:06:36 -0800 (PST)
Received: from [10.1.4.98] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c15sm2469320wrt.1.2020.01.10.07.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2020 07:06:35 -0800 (PST)
Subject: Re: [PATCH v2 3/3] media: platform: meson-ao-cec-g12a: add wakeup
 support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, narmstrong@baylibre.com,
        mchehab@kernel.org, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191213132956.11074-1-glaroque@baylibre.com>
 <20191213132956.11074-4-glaroque@baylibre.com>
 <cccc0cda-7403-1378-40c8-291b11bf868a@xs4all.nl>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <0a07b5cc-a7dc-2983-89de-a1894ae6a469@baylibre.com>
Date:   Fri, 10 Jan 2020 16:06:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cccc0cda-7403-1378-40c8-291b11bf868a@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 1/7/20 3:36 PM, Hans Verkuil wrote:
> Hi Guillaume,
>
> On 12/13/19 2:29 PM, Guillaume La Roque wrote:
>> add register configuration to activate wakeup feature in bl301
>>
>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
>> index 891533060d49..85850b974126 100644
>> --- a/drivers/media/platform/meson/ao-cec-g12a.c
>> +++ b/drivers/media/platform/meson/ao-cec-g12a.c
>> @@ -25,6 +25,7 @@
>>  #include <media/cec.h>
>>  #include <media/cec-notifier.h>
>>  #include <linux/clk-provider.h>
>> +#include <linux/mfd/syscon.h>
>>  
>>  /* CEC Registers */
>>  
>> @@ -168,6 +169,18 @@
>>  
>>  #define CECB_WAKEUPCTRL		0x31
>>  
>> +#define CECB_FUNC_CFG_REG		0xA0
>> +#define CECB_FUNC_CFG_MASK		GENMASK(6, 0)
>> +#define CECB_FUNC_CFG_CEC_ON		0x01
>> +#define CECB_FUNC_CFG_OTP_ON		0x02
>> +#define CECB_FUNC_CFG_AUTO_STANDBY	0x04
>> +#define CECB_FUNC_CFG_AUTO_POWER_ON	0x08
>> +#define CECB_FUNC_CFG_ALL		0x2f
>> +#define CECB_FUNC_CFG_NONE		0x0
>> +
>> +#define CECB_LOG_ADDR_REG	0xA4
>> +#define CECB_LOG_ADDR_MASK	GENMASK(22, 16)
>> +
>>  struct meson_ao_cec_g12a_data {
>>  	/* Setup the internal CECB_CTRL2 register */
>>  	bool				ctrl2_setup;
>> @@ -177,6 +190,7 @@ struct meson_ao_cec_g12a_device {
>>  	struct platform_device		*pdev;
>>  	struct regmap			*regmap;
>>  	struct regmap			*regmap_cec;
>> +	struct regmap			*regmap_ao_sysctrl;
>>  	spinlock_t			cec_reg_lock;
>>  	struct cec_notifier		*notify;
>>  	struct cec_adapter		*adap;
>> @@ -518,6 +532,13 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
>>  					 BIT(logical_addr - 8));
>>  	}
>>  
>> +	if (ao_cec->regmap_ao_sysctrl)
>> +		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
>> +					 CECB_LOG_ADDR_REG,
>> +					 CECB_LOG_ADDR_MASK,
>> +					 FIELD_PREP(CECB_LOG_ADDR_MASK,
>> +						    logical_addr));
>> +
>>  	/* Always set Broadcast/Unregistered 15 address */
>>  	ret |= regmap_update_bits(ao_cec->regmap_cec, CECB_LADD_HIGH,
>>  				  BIT(CEC_LOG_ADDR_UNREGISTERED - 8),
>> @@ -618,6 +639,13 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
>>  		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
>>  			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
>>  
>> +	if (ao_cec->regmap_ao_sysctrl) {
>> +		regmap_update_bits(ao_cec->regmap_ao_sysctrl,
>> +				   CECB_FUNC_CFG_REG,
>> +				   CECB_FUNC_CFG_MASK,
>> +				   CECB_FUNC_CFG_ALL);
> What exactly is enabled here? Looking at CECB_FUNC_CFG_ALL it seems to
> enable automatic standby (I presume when the STANDBY message is received?)
> and power on (I presume when SET_STREAM_PATH is received?).
this register and flags are used by bl301 part.

amlogic implemented a task to check cec event/message.

for power on in bl301 it's not only on SET_STREAM_PATH but also on :

USER_CONTROL_PRESSED
TEXT_VIEW_ON
ACTIVE_SOURCE
ROUTING_CHANGE

when in CECB_FUNC_CFG_REG register we put  CECB_FUNC_CFG_CEC_ON and  CECB_FUNC_CFG_AUTO_POWER_ON

it's not possible to change this

>
> Do you really want to automatically handle STANDBY that way? What does this
> do on the hardware level anyway? Isn't this something that should be
> controlled in userspace?

in fact i do a new check in bl301 code amlogic do nothing on STANDBY so i will clean code

and activate real option supported by bl301

>
> Similar questions for power on: you may not always want to enable this feature
> since it depends very much on the precise use-case.
>
> And which messages it reacts to in order to do a power-on needs to be
> documented since this differs depending on whether the CEC adapter is
> used for a TV or for a playback device. This feature may be hardwired for
> a playback device only, in which case it should probably be disabled if
> the CEC adapter is configured as a TV.
>
> In any case I would like to see some more details about how this works,
> especially since this is the first implementation of such a feature.
>
> I suspect that some userspace API might be needed to get the right level
> of control of such a feature.

i will send v3 next week with some comments and fix ( disable are missing for example)

actual usercase is for android TV.

when cec was enable android TV want to be wakeup by cec event.


> Regards,
>
> 	Hans
>

thanks for your review

Regards

Guillaume

>> +	}
>> +
>>  	meson_ao_cec_g12a_irq_setup(ao_cec, true);
>>  
>>  	return 0;
>> @@ -685,6 +713,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>>  		goto out_probe_adapter;
>>  	}
>>  
>> +	ao_cec->regmap_ao_sysctrl = syscon_regmap_lookup_by_phandle
>> +		(pdev->dev.of_node, "amlogic,ao-sysctrl");
>> +	if (IS_ERR(ao_cec->regmap_ao_sysctrl))
>> +		dev_warn(&pdev->dev, "ao-sysctrl syscon regmap lookup failed.\n");
>> +
>>  	irq = platform_get_irq(pdev, 0);
>>  	ret = devm_request_threaded_irq(&pdev->dev, irq,
>>  					meson_ao_cec_g12a_irq,
>>
