Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEEBC4232F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732303AbfFLK7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 06:59:46 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49707 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727993AbfFLK7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 06:59:45 -0400
Received: from [IPv6:2001:420:44c1:2579:6148:fbe2:6f51:a270] ([IPv6:2001:420:44c1:2579:6148:fbe2:6f51:a270])
        by smtp-cloud7.xs4all.net with ESMTPA
        id b0yhhDqIn5qKab0ylh7prm; Wed, 12 Jun 2019 12:59:43 +0200
Subject: Re: [PATCH v2 1/3] drivers: media: i2c: fix warning same module names
To:     Anders Roxell <anders.roxell@linaro.org>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190612081208.1550-1-anders.roxell@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <95cce42c-6dcb-9bd4-3f60-0b3308909069@xs4all.nl>
Date:   Wed, 12 Jun 2019 12:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190612081208.1550-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKQBud2byBg8C7Ebw8iwZZ7woleR5SlfSjCU98rzCz5XOjzE9kk4BU3lmERB2rTQxaglG7fN0P+rjWWDENKyf4EjvoUPpeZGqAbmR95wgztuxSBrluO0
 y9p594FpRlatR7GFx8Y91cV75Np1giZmX0GDyhWwReNiMMgZznGyx+o5wEm1q0ll/nhz/wAGh7DTDKxqrZNSHJ0Gi0fWh/emhvagMIxrWQdxIK4K6Vr18hUj
 b91WWqziVl/UMvDeOPKKakQ0ACnPAANNWJXS745DsqL2oGW1cdt95FuiMs1p4dn8AtAvjrSDC7GwS5HuqG8XMqRuljJNGVxo9ssowssvH9Wtooq0skMew9n4
 UCQ3Vz6JYZM1soLenzQel1FIUjUyFaXGA/HVZey1m+1IP1Fsc0U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/12/19 10:12 AM, Anders Roxell wrote:
> When building with CONFIG_VIDEO_ADV7511 and CONFIG_DRM_I2C_ADV7511
> enabled as loadable modules, we see the following warning:
> 
> warning: same module names found:
>   drivers/gpu/drm/bridge/adv7511/adv7511.ko
>   drivers/media/i2c/adv7511.ko
> 
> Rework so the names matches the config fragment.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/media/i2c/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d8ad9dad495d..b71a427a89fd 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -35,7 +35,8 @@ obj-$(CONFIG_VIDEO_ADV748X) += adv748x/
>  obj-$(CONFIG_VIDEO_ADV7604) += adv7604.o
>  obj-$(CONFIG_VIDEO_ADV7842) += adv7842.o
>  obj-$(CONFIG_VIDEO_AD9389B) += ad9389b.o
> -obj-$(CONFIG_VIDEO_ADV7511) += adv7511.o
> +obj-$(CONFIG_VIDEO_ADV7511) += video-adv7511.o
> +video-adv7511-objs          := adv7511.o

I prefer adv7511-v4l2 as the new name. 'video' is too vague and can easily be
confused with drivers/video.

I think it is better to rename adv7511.c to adv7511-v4l2.c and add a comment
at the top of that source explaining why it is named like that.

Regards,

	Hans

>  obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
>  obj-$(CONFIG_VIDEO_VS6624)  += vs6624.o
>  obj-$(CONFIG_VIDEO_BT819) += bt819.o
> 

