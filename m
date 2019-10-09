Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8284D0F7E
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 15:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbfJINCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 09:02:15 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53031 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730901AbfJINCP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 09:02:15 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IBbYigmgKjZ8vIBbZiI1pc; Wed, 09 Oct 2019 15:02:13 +0200
Subject: Re: [PATCH] staging: media: Fix alignment to match open parenthesis
To:     Amol Grover <frextrite@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20190911165655.GA22041@Debian.gxnx00eri1wudnlrc5f3ppaydc.bx.internal.cloudapp.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <27da1d8b-09fc-8d23-5213-f0c352ee615d@xs4all.nl>
Date:   Wed, 9 Oct 2019 15:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911165655.GA22041@Debian.gxnx00eri1wudnlrc5f3ppaydc.bx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD9xGs8YOYZuV2WnHUMHNDzu/rb3+CIh2AtNp5uss+ux5BI/fVCKdjPT2bWBacECXDWhk3Hf31un/fG+RhxxTg16tusrwCrpOJ0ZB00szu2mhkTClY/7
 4f/V7rNk74jiJaH6t5+c8ix9wYWAf6YeUbzUkHV2JnW+cTZPHuPJ3lVFR3i/jv61sKvcaLlKjl/tzm5D9yporFfLKj2nBVr2IrmBak8yeIsFkuhAj9xiCM91
 Z+cRkBjrpP8E2WbB4vAqd75vw430EJLKXor3vg9m3ojfPtWHJ/v2eMboHFtgpWQr0tAGn8xY9Q5cFFsmQqiPkqptDi2B3Y/+PRKEJ0p2ZD/8ycjSPdIyfaQe
 htaGq53QKeHef36+PMxMMCqaowIiuqtRuscWoIXQrw6JYJrNfbXFu6w57kVcLWUJDZG8uPDX8NUJhncy+TLQwnp5XfxTV3uKA1y+PKQb8x9P0yUzbdFnkE9F
 qUEN4JH7dJojP8BJmCY4Fnfu4lhGPkhATd2J2d9LbzXXqW3iQAA7kw2N2wt7BhA6uavtrk6fXcPkokAZ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Amol,

For future reference: always include the driver name in the subject.

I've added "imx: " to the subject for you, so no need to resend, but
the driver name is important information.

Regards,

	Hans

On 9/11/19 6:56 PM, Amol Grover wrote:
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-csi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 367e39f5b382..773b3d6964cf 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -627,8 +627,8 @@ static int csi_idmac_start(struct csi_priv *priv)
>  	}
>  
>  	priv->nfb4eof_irq = ipu_idmac_channel_irq(priv->ipu,
> -						 priv->idmac_ch,
> -						 IPU_IRQ_NFB4EOF);
> +						  priv->idmac_ch,
> +						  IPU_IRQ_NFB4EOF);
>  	ret = devm_request_irq(priv->dev, priv->nfb4eof_irq,
>  			       csi_idmac_nfb4eof_interrupt, 0,
>  			       "imx-smfc-nfb4eof", priv);
> @@ -1472,7 +1472,7 @@ static void csi_try_fmt(struct csi_priv *priv,
>  			imx_media_enum_mbus_format(&code, 0,
>  						   CS_SEL_ANY, false);
>  			*cc = imx_media_find_mbus_format(code,
> -							CS_SEL_ANY, false);
> +							 CS_SEL_ANY, false);
>  			sdformat->format.code = (*cc)->codes[0];
>  		}
>  
> 

