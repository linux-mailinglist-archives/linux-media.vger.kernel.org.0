Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF13290AEE
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388449AbgJPRoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgJPRoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:44:00 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09361C061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:44:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s9so3852026wro.8
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=fMaMy1uPHLKjGhN5Agb66Drgg1Zh2Wqsybt39l2ZOLQ=;
        b=kbP4VIl0OPRsKF4tU8d7qrjV+B6l8lBTh26zTBKidk8SR60MT7GwE3HoBnFOwJ+8+e
         28ct4TK6NQ1vFAwCKSDCKG1vQi5juixRdjxCq9V37hZfJbsKSlCrFq7bJ2N7t9YraejX
         2CiYgO6sa3hHm3RXhYg2muc3YL7hwPU2nEzXbPvpxi7B+Cm44e6Dq6Gs6fzV1S31+u5J
         gBS3JqjPvVG9Z5aaXhLzwo+V02DiAgPCqh1y/zLIQPnXV6qhZiN3KiHMlq6PqR3eQ92y
         DdW7LvfpYqEKXAo2ArZJ3UticWc44yNcJ+P6mAprg5+TZ9XvU6wnvdWaa7528IqS6Q6j
         tH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fMaMy1uPHLKjGhN5Agb66Drgg1Zh2Wqsybt39l2ZOLQ=;
        b=LUwgEuXhj2LqaPFL0Dq+5dIQRdj1sgV8+YJMrQbq0urY5l2ziYbr/VS340yPdUMGzD
         Mo1UWnOqfz00Ci+I+jO+/OgUAuO41mqHqUkTvWIuhSoD54zTLnV5ONiE88KjBXi0rUA4
         IhtN8CIqV6duYkvTHKIc/0ce9if+ZGRPnc+VHQDgB/IrZbbmeM5YhXlwhqZOXeeG10RC
         IJs9ealkxXJ2VHKFjfg9Bd3aVfcZZUliYjJApUDCSAuH3SOqSYchOn3kZE4WCaKPstW0
         fnlb7A0BQl7vcDeTHVqB3RQ1KJ1IU41H7Oic4f4NayJxh4YQWuFoscTN2Vh1C/3wgFq5
         OpUw==
X-Gm-Message-State: AOAM533cib9ylVk20Crj8uYpEYFp8VpP3avaJGEjEiMibjRQDVtupUj4
        ZOaqJ/pJq8qlHJBt0mZ4JRFR4TJbalY=
X-Google-Smtp-Source: ABdhPJw+gkUW6BYc8elXr9c1rluO6ISXMuJlefMN4XSDf5K9HITyplGCTutFcpPe0tE3osfmPjz5xA==
X-Received: by 2002:adf:a306:: with SMTP id c6mr5129535wrb.160.1602870238361;
        Fri, 16 Oct 2020 10:43:58 -0700 (PDT)
Received: from [172.30.90.199] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id h4sm4669761wrv.11.2020.10.16.10.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2020 10:43:57 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] staging: media: imx: remove commented code
To:     Deepak R Varma <mh12gx2825@gmail.com>,
        outreachy-kernel@googlegroups.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <0af98d3a-cbaf-4036-a75c-24f63eb28647@gmail.com>
Date:   Fri, 16 Oct 2020 10:43:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

This is fine with me as long as the comment block just above the #if 0 
code is left intact, which it is.

Acked-by: Steve Longerbeam <slongerbeam@gmail.com>


On 10/16/20 10:40 AM, Deepak R Varma wrote:
> The virtual channel is always treated as 0 once the stream enters
> CSI's. Commented code in the "#if 0" can be safely removed as it will
> not serve any purpose in future.  Issue reported by checkpatch script.
>
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
> Changes since v4:
>     - Rephrase patch description to make it exact and accurate as
>       suggested by Julia.
>     - Add linux-media to the recipient list. Suggested by Hans.
> Changes since v3:
>     - Rephrase Patch description
>     - Implement feedback from Vaishali & Helen to mention checkpatch in
>       the patch description.
> Changes since v2:
>     - None
> Changes since v1:
>     - Implement feedback from Julia to be exact with the patch description
>
>   drivers/staging/media/imx/imx-media-csi.c | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 21ebf7769696..9320e3974d86 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1131,13 +1131,6 @@ static int csi_link_validate(struct v4l2_subdev *sd,
>   		 * enters the CSI's however, they are treated internally
>   		 * in the IPU as virtual channel 0.
>   		 */
> -#if 0
> -		mutex_unlock(&priv->lock);
> -		vc_num = imx_media_find_mipi_csi2_channel(&priv->sd.entity);
> -		if (vc_num < 0)
> -			return vc_num;
> -		mutex_lock(&priv->lock);
> -#endif
>   		ipu_csi_set_mipi_datatype(priv->csi, vc_num,
>   					  &priv->format_mbus[CSI_SINK_PAD]);
>   	}

