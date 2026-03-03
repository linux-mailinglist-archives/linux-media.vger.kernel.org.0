Return-Path: <linux-media+bounces-54284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIjQMe6upmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:50:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A84D1EC19B
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AB0D3072DA0
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DAC38C2C3;
	Tue,  3 Mar 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emiVkiaa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8038C408
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531342; cv=none; b=G7btnd9+/PCdduk35sQIMtkjH/ynEmJ1JyddUMikxanlNyGG6H7ROIK99o1SaPyZgFroYe21qpI+rhuzEHfrDroRoPwWdlA0/8Nvy3Gk1lwlaks8wgwEA2aU9qdaqE/xrRrradgznCEgmgrsizshO3PV2VTlrw7dQ5rsJJ3BWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531342; c=relaxed/simple;
	bh=KAWCy4tkMF0D8YDzaB4jm6Ts3+v/1dxLLNWF3XOeHgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ka5rGC2ULiP40o3BpLjU+2ItMtdWGaKxSu3Uh3LO017nIw4wcxOR709SFLXSnEx0Gcd9eYMzfCrmuYTtkOtOFDrET3VRBVbjsckz5t0ZIgwJEm6fA+m19sdWP5QZsUANeTSK+mvJwmKHyQFHENWYoVgKmVxmEsT1/qlwPtGeU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emiVkiaa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso2551749f8f.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531340; x=1773136140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyD6tVeysMRCx2UQUXy5bMdSjZYH+j+DP5U0HLL1Des=;
        b=emiVkiaaARfv1NEZtb73Q2AWy0FeOyPqU1lodGPdZ7SKYJwahl1E6qeeHzWRtTiVWI
         iUgkpOHLRRV7ohlD9s1brlak2oponr9HkzNzIPp485qbYoeXzc8oV2aXZT8grwvfGkd+
         tI1+ojQCY8MwIZdBJBZOpwdb0YWDoaKV5axK2pNbbM8fG7PS9A/XLod53xTFMqJm/cMC
         OfBTKzHPIzFPp2tiMsLZv+w8isfaABQt9yZTR4+GEbLvOOu+nYqgjtoue/3oqE+wBthS
         j9EY6RpIk/Tb/knV1mHkS+AvIWWo21d9MzdFpEd2nlKmcNRnFeKKxuqUTtB9TK0BHUaE
         K3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531340; x=1773136140;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyD6tVeysMRCx2UQUXy5bMdSjZYH+j+DP5U0HLL1Des=;
        b=Jos3XuBM9W8kk9MBsGgkXKjIOaMGgOtGQFvJ1Xwgj1CRESWwOIcdGg5ZDP9LvOWXZb
         79pQOOmOVQDmxrCPcUJJKaNdgEuaE2zdHbZNFTj0r+MnIHQ2vAf6GP17oqi9vYqYzTzf
         GUS72KuPcwxEh1+Pzh0RJcAj1aZzyEP6+cL8Nj4Mwk2TrjRYr/f6naGyRXNlUzCvXGL4
         dxrvG5bZ0ygyfHSSw46ros3QoqCvUI2mJEnD4DkwQQl+ByE1qr0WpYLWmtVgYW8LmXrv
         oH/qmMu02PjiwJIDcxwPSGzZXYWaZDPV7WkiqKTfFKgq6WmOmagxAXf0SokhyDAIe3RJ
         LBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEPRwnNN2KMFTEAINNWTKByyuNCTL/u/gYJTRyJ93V7oPNCfh1NFZaj7fD3zG99T5Yl6XZTMCqKZPgnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs34q11tusfgLiSIQsTtYxxUdFsBFaIV/IVt1t0YqAvA+sT2uE
	ruSZiOkN6dPKMWiP1L3Gn92eENU4sAi305G2VDcxTEgxZQipZBhTVhNRMGp1J0WGm3dzfr6dldE
	+oWdyRjI=
X-Gm-Gg: ATEYQzx5NI3u5gcP+oR4JhH/vX7K7dVDCxQXjcb2weuBOXH4py4jFdOy+94SERZQ9QF
	hdSf1fwwSlBG6Aw8EKhu9PgjALTotcZWmk3/6rJvvQQbxi0dFEwWPghtF78Gym2xl8rKA6BgvnG
	DGBEsscWqilqWoSDrNc5W+M0pJuDQ7blPK58/uzYD1o+PE5MDfoT9uQH9iK9QJj8m2ms/QDfAXK
	DZ3PpzLDeGkZH1VbdQDQj+tmcAjU289W6xyu0mWjXguDsbmMk0+vOaR/+AY8nvZIkMFDXoGW8TH
	b+mAxpbHyFLXMoU4izVcqTQSUsJ3qvzVmYu/vrYAycNqf9I3odXFAE1jyYbmy/mbC9NwNYfI3Vx
	v0z2dK42HHJMtOwpkpS+B/1zU1ZNKFr0UyMHeCARVqLBO02IkCO+Oab8OpOSRFfSzwIATz6dcpy
	3Q8RtBmXLlHTdnjlADj8onKcdaEsdczH0maNKOPXN38r/cxc98bnAHVIIFmQAb43Mk
X-Received: by 2002:a5d:5f55:0:b0:439:b6ae:5d5f with SMTP id ffacd0b85a97d-439b6ae617cmr12014767f8f.36.1772531339819;
        Tue, 03 Mar 2026 01:48:59 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm14593576f8f.17.2026.03.03.01.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:48:59 -0800 (PST)
Message-ID: <64441ca6-bcd1-47ab-ac0c-7a2ebea4fa01@linaro.org>
Date: Tue, 3 Mar 2026 09:48:53 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 1/9] media: qcom: camss: csiphy: Introduce PHY
 configuration
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
 <20260301-qcom-cphy-v4-1-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-1-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2A84D1EC19B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54284-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Action: no action

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Read PHY configuration from the device-tree bus-type and save it into
> the csiphy structure for later use.
> 
> For C-PHY, skip clock line configuration, as there is none.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h |  2 ++
>   drivers/media/platform/qcom/camss/camss.c        | 18 +++++++++++-------
>   2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 2d5054819df7f..d198171700e73 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -28,11 +28,13 @@ struct csiphy_lane {
>   
>   /**
>    * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @phy_cfg:  interface selection (C-PHY or D-PHY)
>    * @num_data: number of data lanes
>    * @data:     data lanes configuration
>    * @clk:      clock lane configuration (only for D-PHY)
>    */
>   struct csiphy_lanes_cfg {
> +	enum v4l2_mbus_type phy_cfg;
>   	int num_data;
>   	struct csiphy_lane *data;
>   	struct csiphy_lane clk;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd8..ea0c8cf3cd806 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4411,11 +4411,11 @@ static int camss_parse_endpoint_node(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> -	/*
> -	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> -	 * D-PHY is supported in the driver.
> -	 */
> -	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +	switch (vep.bus_type) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +	case V4L2_MBUS_CSI2_DPHY:
> +		break;
> +	default:
>   		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>   		return -EINVAL;
>   	}
> @@ -4423,9 +4423,13 @@ static int camss_parse_endpoint_node(struct device *dev,
>   	csd->interface.csiphy_id = vep.base.port;
>   
>   	mipi_csi2 = &vep.bus.mipi_csi2;
> -	lncfg->clk.pos = mipi_csi2->clock_lane;
> -	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
>   	lncfg->num_data = mipi_csi2->num_data_lanes;
> +	lncfg->phy_cfg = vep.bus_type;
> +
> +	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}
>   
>   	lncfg->data = devm_kcalloc(dev,
>   				   lncfg->num_data, sizeof(*lncfg->data),
> 

This patch should come last in the series - i.e. it should be invalid to 
select CPHY mode until all of the other code has advanced to accommodate.

I guess you end up depending on this variable a little later on.

I think this patch looks good with the one caveat that I'd like 
bisectability here.

So perhaps take the switch statement and have that part be a last patch 
at the end formally enabling CPHY mode.

---
bod

