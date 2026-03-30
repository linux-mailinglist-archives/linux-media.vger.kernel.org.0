Return-Path: <linux-media+bounces-57612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDoiMn9oymnG8gUAu9opvQ
	(envelope-from <linux-media+bounces-57612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:11:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9735AD95
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94EDE30EB18B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDDC3CB2C5;
	Mon, 30 Mar 2026 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKbA9FX3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BD73C3430;
	Mon, 30 Mar 2026 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872201; cv=none; b=mNe/C0FIsUbsRitCSE2dFtQsK1BqHJFFjv5I4ftPuD2JxXHV2/Ejijd6OpRBbttw57tg+KWO3x0MVIYBVpKY3SfLQPvQzI9YT6+GY0MMNLUbGE81BSmyiXHez1HnryfZsO6fGFKGg7G7ySMGhFpOCKfAlO4pKwMRNw09PE+VhtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872201; c=relaxed/simple;
	bh=6rGfrEd7z0om+/8Eg1iaTxQn0X+cJxlNGLuxFE1DC0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2PbLR8O4JVB/IO0yS+a9gzYBGHlJf7K6UzPj/n7x9gwtmLI0VpppIoeHVJSSJxm6M1y5q0uJ6QpZhjJRI74fdFB1kStpHTb/yxghgjDgWllMXLrmA5PjwJ5Ws+RZrWhzWq/dF0cqAhDA6VDIx5EqHcCOeGE91UTy1qPlA28G3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKbA9FX3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E8FC4CEF7;
	Mon, 30 Mar 2026 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774872201;
	bh=6rGfrEd7z0om+/8Eg1iaTxQn0X+cJxlNGLuxFE1DC0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tKbA9FX3bQnMvq28DJdJFIlUDQ97waRpWk5wHoypnrirkiYLozRGRBGOWiCBZnzPt
	 Iyr9C7YAWqWm9cV2GbXZJA/20Nu+lp7oMCBgid0p/3PH6z5ZJ56F7fg5OYkHvgQC3x
	 VEFiDD6yNO4WtmZ2N7Q7wqbL0Cf+7Mzgk6063AvhHryA+5i2sFl7CakNgJMC4gj24z
	 lJbjBsQRgr3U9X6KCMHBbCHFVCNDhq6uP0RCx0RtkWm0BwoucR48gcmRGtMoAkQGPR
	 1mzO/e4HAOmyTZgE+/HUSX66pifxjrKHDib3534K77aeamIt4raa8vN3othKczeWmH
	 fMo/IjByXuqZg==
Message-ID: <f2a70c77-f00a-479e-a662-64aa359ddc9b@kernel.org>
Date: Mon, 30 Mar 2026 13:03:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
 <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
 <jm31MCQxrDbbf5WzmGa4xB-Qr91ZClFN9-AenTxBa0BtCGq29Rf_ydChxtWcrnbHSbkUII3eAXPK4auAprPYtQ==@protonmail.internalid>
 <gcu6qzsoff2fox3nbytegyikajn65ae4ekowcn7bs4x2k53vao@rykmxndzzhlu>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <gcu6qzsoff2fox3nbytegyikajn65ae4ekowcn7bs4x2k53vao@rykmxndzzhlu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57612-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.15.66.64:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81B9735AD95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 12:49, Dmitry Baryshkov wrote:
>> // determined at runtime
>> csid_n: csid@1000000 {
>> 	phys = <&csiphy_0>,
>> 	       [...]
>> 	       <&csiphy_n-1>;
>> };
> I think the bigger problem is:
> 
> &csid_L: {
> 	phys = <&csiphy_M>;
> };
> 
> &csid_N: {
> 	phys = <&csiphy_M>;
> };
> 
> aka split mode.

Depends on how you model it.

It feels like a philosophical as opposed to an engineering debate in a way.

The CSIPHY block is defined as one thing - is split mode one PHY or two ?

You could argue it either way BUT one strong argument for it being one 
PHY is - voltage rails, input clocks etc power the block.

Sure there is an esoteric mode called split or combo mode but the 
hardware block itself the thing we usually call the PHY lives as a block 
diagram as a discreet entity.

So I think split-mode really is more like

&csid_L: {
	phys = <&csiphy_0 DPHY>, <&csiphy_1 CPHY>;
};

&csid_M: {
	phys = <&csiphy_0 DPHY>, <&csiphy_1 CPHY>;
};

Recall the debate about a mux is because CSID may connect to any CSIPHY.

csiphy_0: {

	clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
		 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
	clock-names = "core",
		      "timer";

	operating-points-v2 = <&csiphy_opp_table>;

	interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;

	power-domains = <&rpmhpd RPMHPD_MX>,
			<&rpmhpd RPMHPD_MMCX>;
	power-domain-names = "mx",
			     "mmcx";

	vdda-0p9-supply = <&vreg_xyz_0p8>;
	vdda-1p2-supply = <&vreg_qrs_1p2>;

	ports {
		port@0{};
		port@1{};
	};
};

csiphy_N: {
	clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
		 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
	clock-names = "core",
		      "timer";

	operating-points-v2 = <&csiphy_opp_table>;

	interrupts = <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>;

	power-domains = <&rpmhpd RPMHPD_MX>,
			<&rpmhpd RPMHPD_MMCX>;
	power-domain-names = "mx",
			     "mmcx";

	vdda-0p9-supply = <&vreg_abc_0p8>;
	vdda-1p2-supply = <&vreg_def_1p2>;

	ports {
		port@0{};
	};
};

IMO split mode is a special mode of that hardware block, not two 
individual PHYs.

---
bod

