Return-Path: <linux-media+bounces-63444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gs5SClNUH2p9kgAAu9opvQ
	(envelope-from <linux-media+bounces-63444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:08:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDFB632599
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:08:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=t5LcHcZS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63444-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63444-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDFF8303ADD1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 22:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DC63A6B6F;
	Tue,  2 Jun 2026 22:07:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004483806C8
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:07:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438041; cv=none; b=meBd5+Sg4oW8ROKjJc6bZVKvKaODxamR+OUfX5DJaOFBRXLBbB4irUqat2F+7bwtryArFY+FhqLPm+7vXjMU+9XhSjjO8UDnLjPmLEVkTlDAk6LZ7Y3HgmKMt385VgLQSWboNRQZ4HNczrb50k3PJQbXCg9qlVcCkCjUBBg+3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438041; c=relaxed/simple;
	bh=6x9fMJ7t6HJunG2X30tVVOCMTH7Bh31dGiwtTPzjvGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5jBgDYwzukIJHiiYcuVwgicJEXzKplsjoyyOqPSLuZtIHU3kqqX/n3ctuHBdOXFpq0Xg0YPJDEtR3uGPV+ZtsmrChXsj1FFec/rGOzioyxyh8/nx82SwqYrurUwF/PMsGND8m1MYVREzyIH/168U9UncYga2CLJuAVGTGiKREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5LcHcZS; arc=none smtp.client-ip=209.85.208.182
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-396773734e8so4625601fa.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438038; x=1781042838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SRIMl3FmmdDZgXTjOCnwja2kX4Az8p1cvuxpefmzXA=;
        b=t5LcHcZSENbyyLkEdcs6i69kMQJUXbGtascfl+o5b0hklk1lowJhY/wzrsrQQFPPE9
         yfzUbLzOTem79ZLgDz22snf0bkyYDuCpwBEUn0O0YcXtivKq042OgRWDxbhpDdmLmzvo
         zPd9oBLvmPC9SeyBxj/Zu6dewc/fOcTFDXc1u79qXJS/d9GAPdT4UUPXCMxNTuRA2C8Y
         n57h+0lOCoRpoubZF65txza/LU/6ZwYY1IEAs/eOYrvB4prXzUEiGZbtf9duY/spKwjP
         v7+WQtvRU6sIo6EngzngmN9PBjXuQSqs051SheGPNeutSTto8giYLiP/10VqynW6ctKn
         V9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438038; x=1781042838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SRIMl3FmmdDZgXTjOCnwja2kX4Az8p1cvuxpefmzXA=;
        b=T/zdaSfhlVO4lQET0Z9WsKsJeSCD8dO6mzCtUeaJCFAlMeoKHXr9MMj8gMosED1JoA
         OpBclSi9xSMwVCXFk842C5imJgDBsbfrSFMz55tAS5nOSl6wcbpWwRMZtxpSx60YEV0I
         PtlsBoOVBOIUfBou+VEBcvA0Fa4X0vs7hU9+w9PgQvJn2g74bmjZAnpmDoShPZNkzONN
         um9vnxgmtt9Q7rasS2pPfQYPc5MbSwDUOMsRa21RqW93pPdNMLdVq6VrMYWBqW3p7AZY
         jkpcA2B/iUmsnLXOKm5vYurY9QzwKDqCjLlPWkdWY6UebS6++HWCOQzWQVAlRKdxF5CV
         LXtw==
X-Forwarded-Encrypted: i=1; AFNElJ8uCizpPaTeM9EOrag/qmbXmbTGpbTNj1SD2o+19JZei5MdpR7mUWzYo0Tung+vBAH4WS1qG/5SeYMoUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXpVPhXufZVtapn4R5M6mJWleOV9Ejt9V1T357uUKxWH4GPTB
	LT9jX4DdEb/FlmeT0pHCsF7+OsVfWNYC4DU95RLnYZ3h0W83if/hyGN+iegQ42a1aWo=
X-Gm-Gg: Acq92OFm6e+MUAe7qVHmZPrnmafIgzhLXDE3MARtIWuKYE34ZwVRK3jV0iy1ECGf5cE
	j1UFUKoLm90OL/QYMNjIR8jnqgS+nsJsVz0fvn0Xe+QdAQNK0pMKoJFYh61PR+2E+zvxkVqWp7L
	A6W/P6Q/T/RUX2VNjB6hnqqEOB8nEZj9DFgDPBMpG8re3i4NGFhE7EkZUTnyqPgx8IgwsL85upB
	P8+JmLrJTrg/0XjWgd/HkzJmD2NOKvnIzeOCIcO1rFSxueexFyBXdXOqo0Mqbwk6riMCU3ldTsI
	R2nmS/mZZgn9mNXteueVl267tNAz6dnPoE1+NCNgLoHTvM2jPvfeYKOfeeHlrcWp2mCb2sk9W1u
	gTbRD943JrdGMQ0Yq68Em0AqB/WBYecV5PrHmpdHbvWvWk1+cs5Vlbgm7OpWoVPEMZsdWELMHeD
	TrLIGR40E/MCOxfefSIgmHBdF+JawiB7d8fCTT5MqjDaV804Pqt/lyO8Udjif2gKtLr1Dx1so6m
	QNIuYjRDABgPjb8
X-Received: by 2002:a2e:bc2a:0:b0:396:975f:c384 with SMTP id 38308e7fff4ca-396ac314d06mr1902761fa.6.1780438038099;
        Tue, 02 Jun 2026 15:07:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66ea9sm3570671fa.2.2026.06.02.15.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:07:17 -0700 (PDT)
Message-ID: <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
Date: Wed, 3 Jun 2026 01:07:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63444-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CDFB632599

On 5/23/26 05:48, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<>

> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
> +	u32 data_lanes[CSI2_MAX_DATA_LANES];
> +	struct device *dev = csi2phy->dev;
> +	struct fwnode_handle *ep;
> +	int num_polarities;
> +	int num_data_lanes;
> +	u32 clock_lane;
> +	int i, ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (ep) {
> +		fwnode_handle_put(ep);
> +		dev_err(dev, "DPHY split mode is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(dev, "Missing port@0\n");
> +		return -ENODEV;
> +	}
> +
> +	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> +	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +		ret = -EINVAL;
> +		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
> +		goto out_put;
> +	}
> +	stream_cfg->num_data_lanes = num_data_lanes;
> +
> +	ret = fwnode_property_read_u32_array(ep, "data-lanes", data_lanes,
> +					     stream_cfg->num_data_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read data-lanes: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	ret = fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> +	if (ret) {
> +		clock_lane = CSI2_DEFAULT_CLK_LN;
> +		dev_info(dev, "Using default clock-lane %d\n",
> +			 CSI2_DEFAULT_CLK_LN);

Why CSI2_DEFAULT_CLK_LN is set to 7, what does it mean and how is it used?

Since "7" is a meaningless number in the context, I believe it's practically
not used at all, and if so, 'clock-lanes' property should be just removed.

> +	}

-- 
Best wishes,
Vladimir

