Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F1358DDB
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 00:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfF0WTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 18:19:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52677 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF0WTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 18:19:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so7165342wms.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XLcEgP7lilNtxoB5TgZs1ehBNjXZQyyBUyLfg/QFBHU=;
        b=S+pcWw/42hQvokBsFZBDcY0w2njHazQBxLRoNJUNwVWkoAartV+hNBiuq1HP3Fx9bQ
         cIDfSxQexjzHK/DK1Uh190BVv0Y+CkP+UzpUeeRmQ4SzU/6TO5OkwNjY0MtNnXxGQni2
         rgEfAVtD9cAZynHk/MIWSpRxPhyltsdXvz1rE45sDvMSlgwUuRshC9sH2SN5grrkkatB
         NjhJ97S610SIEEDT9wLPuJ25xfGiSvfo9iPhtbMvfl7bZacQFuhxsNVmfzSH9n8w4zvc
         5EYzW7jRewGNHzdbvjBs9jhYb3/ti3RKHXq7ZE2MX7vvgY0mjRazCMf8X/Vs8OV1RUXO
         dAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XLcEgP7lilNtxoB5TgZs1ehBNjXZQyyBUyLfg/QFBHU=;
        b=e9NRxnU4SrsR6MC7zJAsOi4DNs6mIpm96N1Sb5FfxxnfjcEbb34A13DyKnmX71ofEq
         NU0nK0g4rFFkBJnlHFsKW/iyXwVzh075daoASLuKlAhfQTtQ4yFUpcF2pfBxN2Tmx9he
         YblN7in71Ghkkowvr1OLMC8EBv0RVC327jPAmo7GdmGY25kqGFolPflvfrP6+Q0If0qI
         ZWWV2xX8iFEElZvuouzid+7N8uYRwUljMo+yMnsKT6h2N335aUIxgP8VKeF9VLIEWZ4d
         zUQArshtqniuLhwO+ld7iPW/CclennIF9320MJrXJFDAi5cfBI5trVr0mIeqixtQ4is7
         3DnQ==
X-Gm-Message-State: APjAAAWp1iGCNy8XDvApiNEIXUC84eETNlNFlgpupD++YUXtl4KUaJTA
        i4xMxaxHx2ywUu5uG+uIprQ=
X-Google-Smtp-Source: APXvYqwULdIAcNnRc2LWWODu25hODOkxsKN8fDpqo07IUDicY6dSViaJTOWZjeLeBXFi68wL8Mu3jw==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr4704613wme.146.1561673985381;
        Thu, 27 Jun 2019 15:19:45 -0700 (PDT)
Received: from [172.30.89.46] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r79sm234589wme.2.2019.06.27.15.19.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 15:19:44 -0700 (PDT)
Subject: Re: [PATCH v2] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org, ezequiel@collabora.com
References: <20190627221359.18960-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <9bd5768b-63ba-93ff-00ea-e288b04386e8@gmail.com>
Date:   Thu, 27 Jun 2019 15:17:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627221359.18960-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/27/19 3:13 PM, Fabio Estevam wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
>
> Not all sensors will be able to guarantee a proper initial state.
> This may be either because the driver is not properly written,
> or (probably unlikely) because the hardware won't support it.
>
> While the right solution in the former case is to fix the sensor
> driver, the real world not always allows right solutions, due to lack
> of available documentation and support on these sensors.
>
> Let's relax this requirement, and allow the driver to support stream start,
> even if the sensor initial sequence wasn't the expected.
>
> Also improve the warning message to better explain the problem and provide
> a hint that the sensor driver needs to be fixed.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Changed the warning message to better explain the problem and provide
> a hint that the sensor driver needs to be fixed. (Phillip)
> - Keep printing the phy_state information (Phillip)
> - Do not change csi2_dphy_wait_clock_lane() (Phillip/Steve)
>
>   drivers/staging/media/imx/imx6-mipi-csi2.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index f29e28df36ed..240f992ad2ef 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>   }
>   
>   /* Waits for low-power LP-11 state on data and clock lanes. */
> -static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>   {
>   	u32 mask, reg;
>   	int ret;
> @@ -254,11 +254,11 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>   				 (reg & mask) == mask, 0, 500000);
>   	if (ret) {
> -		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
> -		return ret;
> +		v4l2_warn(&csi2->sd, "Timeout waiting for LP-11 state on all active lanes.\n");
> +		v4l2_warn(&csi2->sd, "This is most likely caused by a bug in the sensor driver.\n");
> +		v4l2_warn(&csi2->sd, "Capture might fail or contain visual artifacts.\n");

I think this should be reduced, something like:

"LP-11 wait timeout, likely a sensor driver bug, expect capture failures"

Steve

> +		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
>   	}
> -
> -	return 0;
>   }
>   
>   /* Wait for active clock on the clock lane. */
> @@ -316,9 +316,7 @@ static int csi2_start(struct csi2_dev *csi2)
>   	csi2_enable(csi2, true);
>   
>   	/* Step 5 */
> -	ret = csi2_dphy_wait_stopstate(csi2);
> -	if (ret)
> -		goto err_assert_reset;
> +	csi2_dphy_wait_stopstate(csi2);
>   
>   	/* Step 6 */
>   	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);

