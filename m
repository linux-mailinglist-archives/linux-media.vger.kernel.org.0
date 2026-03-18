Return-Path: <linux-media+bounces-56218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOIBLN7MummfcAIAu9opvQ
	(envelope-from <linux-media+bounces-56218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:03:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2A2BEE9A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A993B31C38F5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C2031F9B8;
	Wed, 18 Mar 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9llyZlQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB63321DE;
	Wed, 18 Mar 2026 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848878; cv=none; b=fgMn4et62GQvNh/esLX/EQnKHMrem6BrXWsRNZNkFaJiD5bybS/1I8AxyRT4kz1GGr02zqIo2PHUunDNuTelEHVNVOaEOBwuQmWeH1UzIk4snw2KRwoADWTC5naNbQIjOwwFC6blb3FjpLKfli5FVNFOvaw+gMFcSDEavd4qFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848878; c=relaxed/simple;
	bh=RTyfBxkZwbvXmv5eVw/ACzMIZeFuso5CWjPNp8sZMvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzWZbTSxA9t/OcO8PH/2oA07avIobq6Nzp7+7HcQ5J1zGtzjKmW8nMas/4aGvI7R5/YUwwzAa1PLPSasZ66Y3/CyQ1wdk6I7pTUJ+1ocDUcA9BKQ9Ip20GrBLL4N623goB6TjN0MrUMyLOnLvgN8CQvPwZacienIY+cu8U/Ril8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9llyZlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB980C19421;
	Wed, 18 Mar 2026 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773848877;
	bh=RTyfBxkZwbvXmv5eVw/ACzMIZeFuso5CWjPNp8sZMvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A9llyZlQ7EpMKH9s6UnF4vpcRhZ0687nFqv66OO3c/3VvMtOLYwZdH8rPIaU65kZ8
	 v3q1RQIwZITvdCLUKcGfw/FbvqwW4QNRU/JAiQnA9NuTkAHVp0GxxgaDQtOJLKLA8+
	 6t/rBs1AiXHBcL0vZdRkHZrIu5Jh6JxeGuW66ATE2ZhWJFCmCq7/cc7PFQ6oWcNjSv
	 rUTJGjCPg0477zsXKVlUIh4L2tndc1NkhG10oeBg0pEvb71CWvkM/ODj1v+OY6z6Ia
	 6elH/eNJ8Ds1WF5KI7DcGKDemTHUNFmji/0ToymhDicguLHNLFh392bmYa9PmG3vP7
	 UaOF229wyiraQ==
Message-ID: <baa40d8c-cd0e-4661-b951-fe992c8e96bd@kernel.org>
Date: Wed, 18 Mar 2026 15:47:53 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <LVgLN97iqkeyLxlaeg0ynzL1KDsmCLzzvTmrRhlZ3BP3AWB1hVEjhG4fu2CdoVrCVOpAlemwqN7mC_0P-fCVdg==@protonmail.internalid>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56218-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13C2A2BEE9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 15:07, Neil Armstrong wrote:
> On 3/18/26 14:17, Bryan O'Donoghue wrote:
>> On 18/03/2026 10:15, Neil Armstrong wrote:
>>>> +    /*
>>>> +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
>>>> +     * the maximum number of enabled lanes.
>>>> +     *
>>>> +     * TODO: add support for bitmask of enabled lanes and polarities
>>>> +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
>>>> +     * For now take the polarities as zero and the position as fixed
>>>> +     * this is fine as no current upstream implementation maps otherwise.
>>>> +     */
>>>
>>> This is wrong since you loose the lanes mapping defined in DT, which is still in CAMSS
>>> but is a PHY property. The lanes layout is not a property of the CSI controller,
>>> CSI controller only need to know the lanes count, and not the layout.
>>
>> Lane layout is a PHY concern but, the PHY API gives us phy_configure_opts_mipi_dphy which should be extended to provide layout and polarity. This would then be of benefit to more than just qcom/camss.
> 
> Why ? the only concern between a controller and a PHY is the lane count to calculate the bandwidth, the actual pin layout is certainly not a controller concern.

Controllers already get the lane count by way of data-lanes = <x y z q> 
or <x y> or <x> if we didn't do that we would need to specify the 
data-lanes in the controller and again in the PHY.

>>
>> Right now none of the CAMSS users for this driver depend on any other mapping and I propose a separate series to fix phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.
> 
> None of the upstream users of camss.

No, we are establishing from x1 use of standard drivers/phy. New users 
will do it this way. The posted dtsi for the laptops can use the linear 
lane layout and default polarities.

In a follow on series we can extend phy_configure_opts_mipi_dphy to 
parse data-lanes = <> into count and mask, to the benefit of any user of 
phy_configure_opts_mipi_dphy.

Since that will touch more then qcom specific stuff and will touch at 
least two subsystems, that should be its own separate series.

> The problem is even larger, as you replied in [1], the csiphy is still exposed as a media element from the CAMSS driver, this means this driver is not complete,
> it should be a media driver entirely with eventually an internal PHY aux driver, but this would be entirely implementation specific.
> 
> Either the PHY is standalone and the PHY consumer only calls phy_open/init/configure/power_on/power_off/exit, otherwise it's not a fully standaline PHY but a composite device like here.

This is not a composite device any more than the existing upstream
implementations which follow the same model:

- Cadence CSI2RX + Cadence DPHY (TI J721E/AM62A)
- Rockchip rkisp1 + phy-rockchip-inno-csidphy

Both use phys = <&phandle>, the media driver manages V4L2 endpoints
and lane counts, the PHY driver handles the electrical layer via
phy_configure().

To this list we will add qcom camss, there's nothing exotic being proposed.

> I propose that you write a proper media driver for the qcom csiphy, which eventually spins a PHY driver as an aux device.

None of these SoC D-PHYs are written as V4L2 media drivers that spawn 
auxiliary devices. They all use the phys = <&phandle> model. The media 
driver manages the V4L2 endpoints and lane counts, passing the 
configuration down via phy_configure_opts_mipi_dphy.

I just don't see what is so special about CAMSS that it needs to have 
its own special PHY implementation. drivers/phy the standard API and 
specification of data-lanes etc in the controller seems pretty "bog 
standard".

---
bod

