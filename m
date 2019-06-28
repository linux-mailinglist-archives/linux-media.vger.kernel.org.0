Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E595E58FBB
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 03:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfF1Ba5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 21:30:57 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40705 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfF1Ba5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 21:30:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id p11so4481925wre.7
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 18:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sX/inTcnVivbSSgPejnVDCCUtlW9i0q7mLKX/BUpwqc=;
        b=e4ADUetxlKv2W42cVwDUyuc/rnFYdeOrvn/x/3ETF5zbpPNlcCH9mqmKw5WkaLFN0S
         SXOzWst62LvyH1omrI0ISMCgQQNs0bRkuBl2aq1moSmMo5SK8+zI7m04JYwahqpOpQNy
         DtA5cobYzJdhJBOzseL2JtA0Sjpq7SKmuMxjKMmrTvTct3PohMlGyco1yT8s+mSLiTI5
         o30PEp5PnufQic2n6h7aBpXwekGbbPuobwt4MYIwiv974AAbnI07SKVyJzNGNGsQR0S9
         zjcaiJUzFYyFii9+I5ljFW+9gKSK2j8sLUYRbXXLsbniY5jfJZGjJRTjbiQ4CUBU45IR
         0rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sX/inTcnVivbSSgPejnVDCCUtlW9i0q7mLKX/BUpwqc=;
        b=MiW9aeMESdNd20g0wnlwHyrQBsQ57DFtBotTOtxI9sVefxsCgBmtX904lMN6dWbt/d
         lFmhDCYrIlycQKYb/kcQ5zWyAJ5+Tm2uD9rPCdg1K5rCqyIHvuoHAV98Loxi5axDHvrP
         VZJeQQC3OCKEKZisw3txvniQdLwPj4Dg47rywaSTaW45aTsXz2xGVNXfYNFj2XZvnwOP
         r0pLm7rfDbIEHAaTXc35DUGavHw2SNnGSOeHuwyaSfxp+Nv8SBKpt0M8FpmFNX6JM4Gz
         vtxdlFVA5Y8Bcvrlr8s6Fgi817yCaX9rH5CgsEkwFMpS/n5UEubJyyj4mvQ/45mFb4pn
         5waA==
X-Gm-Message-State: APjAAAVn9MeREd7dyEUMvm6ZZZ/rimdOuqI823zGGjIMu1dyVhTUNAKy
        Ol1yUYCsVBHXHFuYDCMFDEw=
X-Google-Smtp-Source: APXvYqxQPMNiLLtS6srIMGkTLO1w795FeFCZUQqMz1f0KfKeCAZdLow2dDvOhYgba4b413W8lIbZNA==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr4197767wrw.85.1561685455173;
        Thu, 27 Jun 2019 18:30:55 -0700 (PDT)
Received: from [172.30.89.46] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id t15sm593153wrx.84.2019.06.27.18.30.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 18:30:54 -0700 (PDT)
Subject: Re: [PATCH v3] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Fabio Estevam <festevam@gmail.com>, hverkuil@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        shawnguo@kernel.org, mchehab@kernel.org, ezequiel@collabora.com
References: <20190627222912.25485-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <f42a529f-8ed6-4d19-b939-ba011c444f73@gmail.com>
Date:   Thu, 27 Jun 2019 18:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627222912.25485-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Fabio,

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

On 6/27/19 3:29 PM, Fabio Estevam wrote:
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
> Changes since v2:
> - Reduce the warning message (Steve)
> Changes since v1:
> - Changed the warning message to better explain the problem and provide
> a hint that the sensor driver needs to be fixed. (Phillip)
> - Keep printing the phy_state information (Phillip)
> - Do not change csi2_dphy_wait_clock_lane() (Phillip/Steve)
>   drivers/staging/media/imx/imx6-mipi-csi2.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index f29e28df36ed..bfa4b254c4e4 100644
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
> @@ -254,11 +254,9 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>   	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>   				 (reg & mask) == mask, 0, 500000);
>   	if (ret) {
> -		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
> -		return ret;
> +		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
> +		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
>   	}
> -
> -	return 0;
>   }
>   
>   /* Wait for active clock on the clock lane. */
> @@ -316,9 +314,7 @@ static int csi2_start(struct csi2_dev *csi2)
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

