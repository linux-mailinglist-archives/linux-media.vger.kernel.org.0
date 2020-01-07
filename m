Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FF913290D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgAGOgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:36:48 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37021 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727958AbgAGOgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 09:36:48 -0500
Received: from [IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c]
 ([IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c])
        by smtp-cloud7.xs4all.net with ESMTPA
        id opyMiLGOLN9dwopyPiVoSQ; Tue, 07 Jan 2020 15:36:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578407806; bh=0/aODu4Nr1vPvdKgRVthpJllEoY3MZ2YaTkdzm/0C6c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YL5El9MNH1rzorxvQFpmS+AYc/8zRWuhUK6bRYMRdEQvQbalN21pF0atjbkKCZBq0
         VR6d6BrocFzAAA5BQlS8mNYg3W76Az+SlMMXzP5Z4z14iSuvBYFoaSZvXYC7jV9nUh
         5EcKWc2Pqyd/SW2qcVZOiULjZTKzqdqPZTfOvzZVaEkNhcD7b1EGMhUV/Zm/nHZTnS
         T1YDbFAxzOur2NoekYlg9ecR/9VnJm8VULbKaCuzhE2eqVkxLjsmHUIsc3Qh7bYENJ
         bRMH05C/4b7KdbB1qS/TISqsrOGvL3/t1mhca7SXTI/AazMNfGzzvr6R+tmSDqW9Ad
         56LGwBqex5zTg==
Subject: Re: [PATCH v2 3/3] media: platform: meson-ao-cec-g12a: add wakeup
 support
To:     Guillaume La Roque <glaroque@baylibre.com>,
        narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191213132956.11074-1-glaroque@baylibre.com>
 <20191213132956.11074-4-glaroque@baylibre.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cccc0cda-7403-1378-40c8-291b11bf868a@xs4all.nl>
Date:   Tue, 7 Jan 2020 15:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191213132956.11074-4-glaroque@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHtRrygWIAqkPjGrrrau5APrpkIVRR2JTGhrjmxiPtVc/8Px0FJuQnDfkKcecKx4a0yJnIsXM/+wjB9qqSAaleGVoC/P/P9JpYnA5wp43Dgwu9ItB4Cq
 SvN6Urd5PiahJtP+BuCs61llsDwjD0pGD+94lU2i1bcfdS873kXqZzfeT5pAw/8qHNumXdH82q3HkbMHImOQhFgqgtNQ1kMMbYHxO8lVgCP8ZWo95vO7gZnI
 t7kE8hOEe08vaX0JS25KsRtCiFg7ZmJMa6dngWBXy+Ujwl3kluL+tyrMQ9xusYNW47coaamWLONfm/CfMNhK/oRWhdrBoKU9VIo+LRH3ARbPdfo4KQnFWHsa
 8rypUE/urtP7doikUon5izSog1PFmV9P6Tb82jTlLKfrmSsRdwF3PCv/rKBROOfTF7iF2JHdSNmZhZcSjJpw485dVU76/+0s13Yg27rnRpVU+55OrObqo/MB
 Tmp45ztmF98xuKeoD25BbnkazRNRKRrlVn9XLOFkmV0+if17t+wApyI8sh1Jjfoqh1A27yCuVFrOQeNZyvHpBAjVuhZzMRuyKwfK0LJMEoMVYVxGmI5T3DWV
 W8VXxah2vdBpTyQ5DiIrtK92
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guillaume,

On 12/13/19 2:29 PM, Guillaume La Roque wrote:
> add register configuration to activate wakeup feature in bl301
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
> index 891533060d49..85850b974126 100644
> --- a/drivers/media/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/platform/meson/ao-cec-g12a.c
> @@ -25,6 +25,7 @@
>  #include <media/cec.h>
>  #include <media/cec-notifier.h>
>  #include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
>  
>  /* CEC Registers */
>  
> @@ -168,6 +169,18 @@
>  
>  #define CECB_WAKEUPCTRL		0x31
>  
> +#define CECB_FUNC_CFG_REG		0xA0
> +#define CECB_FUNC_CFG_MASK		GENMASK(6, 0)
> +#define CECB_FUNC_CFG_CEC_ON		0x01
> +#define CECB_FUNC_CFG_OTP_ON		0x02
> +#define CECB_FUNC_CFG_AUTO_STANDBY	0x04
> +#define CECB_FUNC_CFG_AUTO_POWER_ON	0x08
> +#define CECB_FUNC_CFG_ALL		0x2f
> +#define CECB_FUNC_CFG_NONE		0x0
> +
> +#define CECB_LOG_ADDR_REG	0xA4
> +#define CECB_LOG_ADDR_MASK	GENMASK(22, 16)
> +
>  struct meson_ao_cec_g12a_data {
>  	/* Setup the internal CECB_CTRL2 register */
>  	bool				ctrl2_setup;
> @@ -177,6 +190,7 @@ struct meson_ao_cec_g12a_device {
>  	struct platform_device		*pdev;
>  	struct regmap			*regmap;
>  	struct regmap			*regmap_cec;
> +	struct regmap			*regmap_ao_sysctrl;
>  	spinlock_t			cec_reg_lock;
>  	struct cec_notifier		*notify;
>  	struct cec_adapter		*adap;
> @@ -518,6 +532,13 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
>  					 BIT(logical_addr - 8));
>  	}
>  
> +	if (ao_cec->regmap_ao_sysctrl)
> +		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
> +					 CECB_LOG_ADDR_REG,
> +					 CECB_LOG_ADDR_MASK,
> +					 FIELD_PREP(CECB_LOG_ADDR_MASK,
> +						    logical_addr));
> +
>  	/* Always set Broadcast/Unregistered 15 address */
>  	ret |= regmap_update_bits(ao_cec->regmap_cec, CECB_LADD_HIGH,
>  				  BIT(CEC_LOG_ADDR_UNREGISTERED - 8),
> @@ -618,6 +639,13 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
>  		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
>  			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
>  
> +	if (ao_cec->regmap_ao_sysctrl) {
> +		regmap_update_bits(ao_cec->regmap_ao_sysctrl,
> +				   CECB_FUNC_CFG_REG,
> +				   CECB_FUNC_CFG_MASK,
> +				   CECB_FUNC_CFG_ALL);

What exactly is enabled here? Looking at CECB_FUNC_CFG_ALL it seems to
enable automatic standby (I presume when the STANDBY message is received?)
and power on (I presume when SET_STREAM_PATH is received?).

Do you really want to automatically handle STANDBY that way? What does this
do on the hardware level anyway? Isn't this something that should be
controlled in userspace?

Similar questions for power on: you may not always want to enable this feature
since it depends very much on the precise use-case.

And which messages it reacts to in order to do a power-on needs to be
documented since this differs depending on whether the CEC adapter is
used for a TV or for a playback device. This feature may be hardwired for
a playback device only, in which case it should probably be disabled if
the CEC adapter is configured as a TV.

In any case I would like to see some more details about how this works,
especially since this is the first implementation of such a feature.

I suspect that some userspace API might be needed to get the right level
of control of such a feature.

Regards,

	Hans

> +	}
> +
>  	meson_ao_cec_g12a_irq_setup(ao_cec, true);
>  
>  	return 0;
> @@ -685,6 +713,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  		goto out_probe_adapter;
>  	}
>  
> +	ao_cec->regmap_ao_sysctrl = syscon_regmap_lookup_by_phandle
> +		(pdev->dev.of_node, "amlogic,ao-sysctrl");
> +	if (IS_ERR(ao_cec->regmap_ao_sysctrl))
> +		dev_warn(&pdev->dev, "ao-sysctrl syscon regmap lookup failed.\n");
> +
>  	irq = platform_get_irq(pdev, 0);
>  	ret = devm_request_threaded_irq(&pdev->dev, irq,
>  					meson_ao_cec_g12a_irq,
> 

