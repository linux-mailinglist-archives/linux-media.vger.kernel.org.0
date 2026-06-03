Return-Path: <linux-media+bounces-63570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wRJALlr9H2q0tgAAu9opvQ
	(envelope-from <linux-media+bounces-63570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 12:09:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A0E6366C6
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 12:09:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JKQ2P70O;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63570-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63570-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E596F30BD92E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 10:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E3D44B69C;
	Wed,  3 Jun 2026 10:03:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DC1FC8;
	Wed,  3 Jun 2026 10:03:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480986; cv=none; b=NUfgUdFOXCYamB4oDpAoILCMq2s1CNIohG+0xjLRWJeo5Ylt/mhP8CCHlk+oKNqxotef2QHmD8wod9omIfZ/nbvfW8v05yR04Vi71p6IVRAAHdCGtmGkrP+pufByog24r7B046s1h0ibxs7dtonNbAw5xAcV7rSUomtSHzvexHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480986; c=relaxed/simple;
	bh=rd/XJCLeGutAP6vdv4HQbc/zX0TFcCi8MS1cMvpS+qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+pgU16T+4YvC1rWFbrGCOXU6Yb3Pc2xrBNv5uFtZjaNfqWhNGoT9+miIxgB4liUEeAH8xpDEor9sz7sY01+8xikwQNzjImB5igFQLuiu9qGkdT0wEiUS0EN8JgjZnR/iIM/bBD10B3UNAeVR1aWeIx85AdqWzJoE35P8O996zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKQ2P70O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C6D1F00893;
	Wed,  3 Jun 2026 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780480985;
	bh=ACwX1eA04+1ASs8+AUZM9OwlIkHtK3XNcCJgkbAhMwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JKQ2P70OeXVvmbAmsD2p6whOHUqY0yERjAJ3N8YonPJgMlZa+CdTzFUHYzsSRIcBx
	 g5XhoSr3gk7j7AN3FiF5qdRCr10scOxrzPi7FY88G0aUmAuGND23oRLOffMIv1kaIx
	 ipdw7Nttnh2qCBynEjisTnqfyJXDanHflIh21kL8gzX/DacW6tB0n9DMI7jl0X0OLm
	 hp9DNRDd16dTZPdu9AnREHoq264xlRMN90ILUCiVgHwhJswS5rAIvGes8Y9x3562ti
	 uVolNK8BR0tzakwkKB809xNNeIHwxGyzoJXJXTlKb38CWWFOjYFOjpVZuKUYC+s8GP
	 Yy1dQ6s5nGXhg==
Message-ID: <22807003-2b9a-4a28-982e-8c432cb9b9a1@kernel.org>
Date: Wed, 3 Jun 2026 11:03:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] media: camss: Add support for C-PHY configuration
 on Qualcomm platforms
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63570-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,codeberg.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16A0E6366C6

On 03/06/2026 00:30, David Heidelberg via B4 Relay wrote:
> Note: WIP tag added, as not everything from the previous review round has
> been addressed.
> 
> # Short summary
> 
> This patch series extends the Qualcomm CAMSS (Camera Subsystem),
> including CSID and CSIPHY components, to support C-PHY mode configuration.
> 
> # Background and motivation
> 
> Modern smartphone cameras increasingly rely on MIPI C-PHY rather than
> D-PHY, thanks to its higher data throughput and signal efficiency.
> As a result, many OEMs adopt C-PHY interfaces for main (rear) cameras on
> Qualcomm-based devices.
> 
> Until now, mainline Linux lacked C-PHY configuration support for Qualcomm
> chipsets, preventing bring-up of primary camera sensors on several
> Snapdragon platforms. This series closes that gap.
> 
>   - Introduces C-PHY configuration support for the CAMSS driver stack,
>     covering both CSID and CSIPHY blocks.
>   - Successfully enables C-PHY operation on the Snapdragon 845 platform.
>   - Tested on OnePlus 6 and 6T phones running mainline Linux,
>     using the Sony IMX519 main camera sensor.
>   - The new configuration allows other chipsets versionsto enable C-PHY by
>     simply adding corresponding sensor driver support and csiphy
>     initialization data, following the example set for sdm845.
> 
> With this patch series, mainline Linux gains working C-PHY support for
> Snapdragon 845, paving the way for improved main camera functionality
> across many Qualcomm-based devices. The groundwork also simplifies
> future enablement efforts for additional SoCs and sensors.
> 
> Until merged, the series will be also available at:
>    https://codeberg.org/sdm845/linux/commits/branch/b4/qcom-cphy
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v6:
> - lanes_enable now uses WARN_ONCE instead of return values. (Sakari)
> - Dropped Kodiak patch until it gets better documented.
> - Document the 3ph C-PHY sdm845 registers a bit.
> - Link to v5: https://lore.kernel.org/r/20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz
> 
> Changes in v5:
> - Split first patch enabling C-PHY part into last patch. (Bryan)
> - Fix the camss_get_link_freq crash. (Cory)
> - Dropped patch whitelisting C-PHY, instead use nullptr check. (Bryan)
> - Dropped A-b/R-b from
>   "media: qcom: camss: Initialize lanes after lane configuration is available"
>   and changed Petr to Co-developed by and owned the patch.
> - Link to v4: https://lore.kernel.org/r/20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz
> 
> Changes in v4:
> - Documented cphy parametr to camss_get_link_freq.
> - Use BIT() macro for lane_mask. (Bryan)
> - Correct lane_mask calculation. (Kieran + me)
> - Removed comment for the D/C-PHY sequences init. (Bryan)
> - Pass &csid->phy for calculate freq. (Bryan)
> - Added missing cphy description to camss_get_link_freq. (kernel test robot)
> - Gen2 v1.1 MIPI CSI-2 CPHY init hex to lowercase.
> - Added back missed commit with improved electrical for sdm845 3ph.
> - NOT addressed yet:
>    - Proliferating special cases in switch statements on a per-SoC basis is verboten.
>    - is it possible to set clock_lane to say 0xff in DT ?
> - Link to v3: https://lore.kernel.org/r/20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz
> 
> Changes in v3:
> - Make lanes_enable return sucess or error, since I couldn't move the
>    configuration to the _init.
> - Dropped R-b tags on
>    "media: qcom: camss: Initialize lanes after lane configuration is available"
>    as I changed formatting.
> - Link to v2: https://lore.kernel.org/r/20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz
> 
> Changes in v2:
> - This is still WIP patch series, thus I wanted to publish already
>    changed parts to get feedback regarding to the direction of patchset.
> - When switch to using odd bits, zeroed val which was left unitialized in v1.
> - Accidentally missed archs added back in the commit moving lane regs to
>    new location.
> - Remove commit with reverting check for only D-PHY is supported and
>    adjusted the check to also account for C-PHY.
> - Documented link frequency calculation with defines. (Casey)
> - Changed the cphy boolean to phy_cfg enum in the camss/camss-csiphy.
>    (Brian)
> - Added patch for csiphy-3ph enablement for sm7280 from Luca as I'm
>    meanwhile trying to bring up the C-PHY sensor on FairPhone 5.
> - Merged these two commits together
>      csiphy-3ph: Enable sdm845 C-PHY sequence
>      csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 CPHY init
>    merged R-b.
> - Link to v1: https://lore.kernel.org/r/20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz
> 
> ---
> David Heidelberg (8):
>        media: qcom: camss: csiphy: Introduce PHY configuration
>        media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
>        media: qcom: camss: Prepare CSID for C-PHY support
>        media: qcom: camss: Initialize lanes after lane configuration is available
>        media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY init
>        media: qcom: camss: csiphy-3ph: Update Gen2 v1.1 MIPI CSI-2 C-PHY init
>        media: qcom: camss: Account for C-PHY when calculating link frequency
>        media: qcom: camss: Enable C-PHY where available
> 
>   .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |   8 +-
>   drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 243 +++++++++++++++++----
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   6 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
>   drivers/media/platform/qcom/camss/camss.c          |  36 ++-
>   drivers/media/platform/qcom/camss/camss.h          |   2 +-
>   8 files changed, 236 insertions(+), 63 deletions(-)
> ---
> base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
> change-id: 20251109-qcom-cphy-bb8cbda1c644
> 
> Best regards,

I'd like to see a dts to go with this ideally for upstream ...

---
bod

