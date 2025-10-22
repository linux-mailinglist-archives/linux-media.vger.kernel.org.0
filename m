Return-Path: <linux-media+bounces-45322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FEBFE4A0
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 23:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D826D3AB16F
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 21:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A84F274B44;
	Wed, 22 Oct 2025 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="xOukglul"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736BF302166
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761167904; cv=none; b=JDNrHqs7wjyl7l1X3NH6H5Puc2RqSMj1Ku0BhjDLOXJB7caICs4lSatC/jOu1yjrh7Wo6vQSGKlbt/ZxMGtC6R3dOxDRQo+g53HNgfx95j9jCj4rgaqqYLDcTcTJTd9kXUXwyYoCZS3dd9tqtxd5m0+8KNyORnnofBBSVLerToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761167904; c=relaxed/simple;
	bh=+G9xIDnK5qXh4j0eADQCnyUYkiv3QRBZBWsB87Gnebw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NtdgUPEnwrLmRYm2riPrZHF7FZsQ5YeS14Ryl/6df738HMHwDfg2A3z/0nzw98Zrr5Fz7fYTuVBGb3LkO728AnHQD8SCX+AxRWv1OfxH5RadjfjdAsF18j0FTrADbT1fJwjGbqep4c+d/PDvQcKRbRsk0pSktGdFO19PQL14WAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=xOukglul; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761167901;
 bh=gjD4xTxPCIrvIM0BFCotpSFuXxIKJDdOf+62DNFPt90=;
 b=xOukglulPCQSDu1AhfQiMyc/xbJIhDCkJ/YH8RQ8Z1xZTB3DpKzWYNsZkEQgyvcXM2L7W6dYu
 S0Z+tanzPUSN451Y/Wjj5UPyRtmBTo0Pm9Hw1XE41shxRqs92uN4jEi0vWCMhVOJtDZD6ZXBUg5
 DIAc6ksCYxd1sBsuSSJKtgSvtGhXsC1RhddlwTN14l2UtBXZQy75Krksyg7rWRJP3/zCHsxYYcZ
 JYQyXwbNiuoIQFC1adFrTrDUVruGyXocqODB5FFWnKxCr4UEk8fhB4cB8c+4UHE737F6mlKZtPz
 nwjep3W11teasHFkT9Lis4hdwz8ro5t4Ee+VHUQcZQpg==
X-Forward-Email-ID: 68f94a1a7ffe5c5c38c092d4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.3.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <74866576-8834-49e6-adb6-b0189a1b43fe@kwiboo.se>
Date: Wed, 22 Oct 2025 23:18:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] media: rkvdec: Enable all clocks without naming
 them
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
 <20251022174508.284929-12-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251022174508.284929-12-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 10/22/2025 7:45 PM, Detlev Casanova wrote:
> For other variants, the clock names and number will differ.
> 
> There is no need to keep track of the clock names in the driver so drop
> them to avoid having a list for each variant.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 24 +++++--------------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  1 +
>  2 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index b0e90c9b826e..aa92b586429e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1311,15 +1311,10 @@ static const struct of_device_id of_rkvdec_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
>  
> -static const char * const rkvdec_clk_names[] = {
> -	"axi", "ahb", "cabac", "core"
> -};
> -
>  static int rkvdec_probe(struct platform_device *pdev)
>  {
>  	const struct rkvdec_variant *variant;
>  	struct rkvdec_dev *rkvdec;
> -	unsigned int i;
>  	int ret, irq;
>  
>  	variant = of_device_get_match_data(&pdev->dev);
> @@ -1336,19 +1331,12 @@ static int rkvdec_probe(struct platform_device *pdev)
>  	mutex_init(&rkvdec->vdev_lock);
>  	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>  
> -	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
> -				      sizeof(*rkvdec->clocks), GFP_KERNEL);
> -	if (!rkvdec->clocks)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
> -		rkvdec->clocks[i].id = rkvdec_clk_names[i];
> -
> -	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
> -				rkvdec->clocks);
> -	if (ret)
> +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
> +	if (ret < 0)
>  		return ret;
>  
> +	rkvdec->clk_count = ret;
> +
>  	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rkvdec->regs))
>  		return PTR_ERR(rkvdec->regs);
> @@ -1426,7 +1414,7 @@ static int rkvdec_runtime_resume(struct device *dev)
>  {
>  	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
>  
> -	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
> +	return clk_bulk_prepare_enable(rkvdec->clk_count,
>  				       rkvdec->clocks);

This can probably now fit on one line.

>  }
>  
> @@ -1434,7 +1422,7 @@ static int rkvdec_runtime_suspend(struct device *dev)
>  {
>  	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
>  
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
> +	clk_bulk_disable_unprepare(rkvdec->clk_count,
>  				   rkvdec->clocks);

Same here.

>  	return 0;
>  }
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index dfafb2c2cbc1..4094f92f8a44 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -131,6 +131,7 @@ struct rkvdec_dev {
>  	struct v4l2_m2m_dev *m2m_dev;
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
> +	unsigned int clk_count;

Please name this num_clocks to match similar count/num variables used by
the driver and also closer matches the clk_bulk_data name.

Regards,
Jonas

>  	void __iomem *regs;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;


