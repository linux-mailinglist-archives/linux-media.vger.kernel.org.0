Return-Path: <linux-media+bounces-54295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENOsJHSzpmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:09:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E41EC6B1
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E1BC3083CEE
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2064639449C;
	Tue,  3 Mar 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRw8wAhg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A79239182D
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532470; cv=none; b=GgWEY+RjFshbF0M+YpEMhx346hdG+Qzw2LMUItL/+rEyi9+rcXxo3UdG9I22Iovus6pYWPP0SlugPOLgz1yWPDNlGCKvvdvXC/qvdP54BWiCDAybz6WPlUiq5E3H9TvgvF9tSoI7E3jsLO/v0vez98vOCyiCo1tWwhHh3bGe2gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532470; c=relaxed/simple;
	bh=Rjq4yiNDsrY2Wz980m8WNISCg1KOiPNISWFecbFsP+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvAmY04iRvG+zWb2x4qyfGIkcCiKNycXpvLpNeIigOxcm9FHDJN2WqqsgbaxB1mGCpcou2KOMUhFLAIwok8crS5+UXb5TDDs6T8FVbpjKQmi1dQc+J3H602SJks2pQoTiVwhlnjXqU2m33kkYXkhrEKXi++MRpSOZSQMZbDt0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRw8wAhg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso1849112f8f.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532467; x=1773137267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcR6OUu6uf8GtTbYsci0TdXmSPbbJEFXyuqQd9onRJ0=;
        b=iRw8wAhg6FXDcL4/esOE5WLvHaM09NEYW7J4ky+im66qLRsJCfy4g0uClmyc8XWSSd
         nBUG3J4yziKdrW1n8z8jkiPffddoAczXSW+qlrfgnGT+mnzovEXMtUo+d0RRhS/w+oSW
         arB1IaJ6hJnrob0QNj32fRDSiKteCRKWb9vqwbfv6jz59IbKKS73plG7nFUu7qZXrfYB
         Eyv3NjrpjTXjLz2SIYfomu07OkOjunFYekEAaCXdBVamxxVW/jnosa8ExWvolrLnvctH
         1w96Ua8wXrHUqUZ8S1sXTOVeqWygWB4/ddeMLMCXRm1W1zhxb4nRlIDmrIzzOEoLhOGK
         bZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532467; x=1773137267;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcR6OUu6uf8GtTbYsci0TdXmSPbbJEFXyuqQd9onRJ0=;
        b=FPQML7hCKagybLccsaitK5wmXkUSrfPNT6DXMCE46VEtGVtDuVVb4J9V/k0sReZ/WU
         MVTgQvMeFAHD1NeQkcV1mZ+M1E3OdEqQmxYDCDZFuMjDJCoXb2Uk90rbJJdg4MkqLt1J
         PEqE/MOyZuwfDCCyh/KsN2eHUumrZFeSW9PHQngSA144TA18BUTDuCyDWf9Ov1DpnBtJ
         Kj02DLcdERYIO6tk+ADIUSDehiLhfWvGSKXjT4ShCzlfVpM+j2jRfbYUUG9v3JfhhITd
         BIeVjYNUFXluaOKQ+zqhhMpeWmJjCmsTbVDHq5/cpZ1YrPIneUN8cJRWNnyp8xhxPjt4
         8EDA==
X-Forwarded-Encrypted: i=1; AJvYcCWLPXfd58JFk5/JpMDyScVFCgxPNWWWDVm5cRhANJxwk9Gg3ezUFfXMm29i+t9tmGaoTt/9DHsdkOOzTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgMJvO2ycXkKdGJ3+DT6GnZiRiBv4WbjvKdybNJSCEk4/+5jP
	HII4gSeg0CvG2mle6BKl02DoPYshkGQd+iou9qf5v0LahnshWZZBY5mIgV0EnJdvRx8=
X-Gm-Gg: ATEYQzyk8dlwLq9o9c7RQ2Si05RHB60iBFY91JnZobOHy0A7A11yrlzYwwnyYiPowBY
	bCBYJDIGY66f1RV3Um5qAJfrCqjAZ6g8jiTPg1knCmnSpbCfjFs1YVEkGVgXQ5IjPYTPDOQpDkO
	ecv5A9w1E0b2ZtXg2cv8QtRdziBHNpKpoBHCMMZZK7zIlm7IDwAwAwCez4Dy37AXomogTaTUx8Y
	Z0sloI2Khj6nKPdfyGjImrQLCWEpbOlKalHmjfhV96SMejOgpoBZ/DyjNu9lfEUoECDsnR1ZXqJ
	kw7IGEZKtQXxGZnUmxCqUeStU1E0rxzTeaS702V6eNKwtW+a1I+/p9Fjg0UmWSEo6dsdczROU2f
	8TQecVKpC6lzYnPCCtENKumBtiD+UYQ4nbdkQrje7C4XS8h1XKtkgJzERB1XBR2BiRehFORXcYe
	7r2bG2FRgWdU8RTMBsFVzGaK8c0rwHtfM3unX8RJM4U7zepPLKtvCv2fpfNi7wt/jy
X-Received: by 2002:a05:6000:288e:b0:437:7010:1cf5 with SMTP id ffacd0b85a97d-4399ddd872emr27275843f8f.5.1772532466420;
        Tue, 03 Mar 2026 02:07:46 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm14840871f8f.38.2026.03.03.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:07:45 -0800 (PST)
Message-ID: <1fca6458-761d-446f-9223-7875a4a66f4f@linaro.org>
Date: Tue, 3 Mar 2026 10:07:43 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 9/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1A6E41EC6B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54295-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   | 11 +++++++----
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++----
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index b50b0cfe280c1..2fc17c6a15e2e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -534,18 +534,21 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
>    * csid_set_clock_rates - Calculate and set clock rates on CSID module
>    * @csiphy: CSID device
>    */
> -static int csid_set_clock_rates(struct csid_device *csid)
> +static int csid_set_clock_rates(struct v4l2_subdev *sd, struct csid_device *csid)
>   {
>   	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>   	const struct csid_format_info *fmt;
> +
>   	s64 link_freq;
>   	int i, j;
>   	int ret;
>   
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +
> +	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp, lane_cfg);
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> @@ -703,7 +706,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>   			return ret;
>   		}
>   
> -		ret = csid_set_clock_rates(csid);
> +		ret = csid_set_clock_rates(sd, csid);
>   		if (ret < 0) {
>   			regulator_bulk_disable(csid->num_supplies,
>   					       csid->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 938600f3defe1..ea9dd2cd2e740 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -143,9 +143,8 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,10 +269,9 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 lane_mask = csiphy->res->hw_ops->get_lane_mask(&cfg->csi2->lane_cfg);
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> -	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, &csiphy->cfg.csi2->lane_cfg);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ea0c8cf3cd806..4c13bae17007e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -32,6 +32,14 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +/*
> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
> + */
> +#define CAMSS_COMMON_PHY_DIVIDENT 16
> +#define CAMSS_CPHY_DIVISOR 7
> +#define CAMSS_DPHY_DIVISOR 16
> +
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4280,20 +4288,24 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lane_cfg: CSI2 lane configuration
>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			struct csiphy_lanes_cfg *lane_cfg)
>   {
>   	struct media_pad *sensor_pad;
> +	u8 num_lanes = lane_cfg->num_data;
> +	bool cphy = lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY;
> +	unsigned int div = num_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +						     CAMSS_DPHY_DIVISOR);
>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919e..67be42b4c9174 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -163,7 +163,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			struct csiphy_lanes_cfg *lane_cfg);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

