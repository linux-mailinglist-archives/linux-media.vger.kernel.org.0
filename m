Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F4531E730
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 09:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBRH7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 02:59:32 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:41897 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhBRH4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 02:56:13 -0500
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0BE67200011;
        Thu, 18 Feb 2021 07:54:44 +0000 (UTC)
Date:   Thu, 18 Feb 2021 08:55:10 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] v4l: common: v4l2_get_link_freq: add printing a
 warning
Message-ID: <20210218075510.dcqbpmft46bymmnd@uno.localdomain>
References: <20210217221134.2606-1-andrey.konovalov@linaro.org>
 <20210217221134.2606-2-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210217221134.2606-2-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Thu, Feb 18, 2021 at 01:11:32AM +0300, Andrey Konovalov wrote:
> Print a warning if V4L2_CID_LINK_FREQ control is not implemented.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 133d20e40f82..f1abdf2ab4ec 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -461,6 +461,8 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>
>  		freq = qm.value;
>  	} else {
> +		pr_warn("%s: V4L2_CID_LINK_FREQ not implemented\n", __func__);
> +

It's a shame we can't access a struct device * somehow :(
Also, nitpicking (please bear with me here) it is absolutely correct
that V4L2_CID_LINK_FREQ is not implemented, but I think the real deal
here is that the link rate is estimanted from PIXEL_RATE and that
might be wrong.

What about (insipired from the error message in match_fwnode() which I
find useful)

                pr_warn("%s: Link frequency estimanted using pixel rate: result might be inaccurate\n",
                        __func__);
                pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
                        __func___);

Anyway, whatever works
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>  		if (!mul || !div)
>  			return -ENOENT;
>
> --
> 2.17.1
>
