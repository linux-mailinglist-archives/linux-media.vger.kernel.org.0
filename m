Return-Path: <linux-media+bounces-63301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PMJCLSrHWoLdAkAu9opvQ
	(envelope-from <linux-media+bounces-63301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:56:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61262222C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 506423016CF4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD123DB33F;
	Mon,  1 Jun 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="TS+4l0O1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379E3D9022;
	Mon,  1 Jun 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329387; cv=none; b=D/Vvy1JUszWb7asehONYOm1kSAOJE66lfZHbfkqN1990Pc00yzLdML51rg77DtOXF0JYseV82HI/FWVR9BtG2r4nzqrIfQVAOHcA098HYFfQmOq8FKsvtZvqFz3JjVak8pDZIaacCeYAtQ91NT/Us+x5GUlRq4TJPkypHnVilm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329387; c=relaxed/simple;
	bh=erQGTni0QSoRhc/MDJo8iEo7qFsL3aKJfduTLUzpHPE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y+UBslM9evU3Wn4+lIj3egnUiXd/TlLgCeM9LWgmDRjWTqUYiaUhBvJSSHGUVpNKFac0lb3YVvieXDsak6+qMXWkZ/VNugdD+TDqfh4H6KdnKisti8skdAF6mp7Ptm95rQKpG7oQrT5n1mB7z/C2NfsoosnAyCpJ9Fhr+fGEVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=TS+4l0O1; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1780329380; x=1780588580;
	bh=meBC/NEnaeIboKKyZ7im/Aolgu2SGcbYyOzhh1OdUb0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TS+4l0O133lm4CGBfg+gLMp4lCNpVLu+qAUHnhK943NfLWEYBEzdN3HXTdGFdnVTw
	 edg8fBErNLb9jvNvRqlc6jqIJhs8ZDE1M3QaPuBHJ85ZEq0Plhthm8wLRCEwG87mtj
	 EMojT30JJHrm8p7baWmsPSKammqiiWU7rgY/XpXxwHcrlwqnaJsPnIbbCujK6JmQg+
	 KBMOwngE4oyaN3ks8YGqyTdLQ7YDkDc5Wln1/fvmEXZ1d9Ww4LcmvrXHXsZT/+8UVJ
	 lRxFuT0iC855R43xLOxgA1HJGwJwypN5+DRfcDn7gLzmzLoibtrgkbEchNSO91LVhP
	 yUL6df7Uhpnbg==
Date: Mon, 01 Jun 2026 15:56:12 +0000
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH WIP v5 0/9] media: camss: Add support for C-PHY configuration on Qualcomm platforms
Message-ID: <4138a85a-e6b9-4a81-9025-b2f809988788@nxsw.ie>
In-Reply-To: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 957e722c7aa2349d3b5e5a5ae861811910c2c2a6
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63301-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeberg.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Queue-Id: 9E61262222C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/05/2026 14:08, David Heidelberg via B4 Relay wrote:
> Note: WIP tag added, as not everything from the previous review round has
> been addressed.
>=20
> # Short summary
>=20
> This patch series extends the Qualcomm CAMSS (Camera Subsystem),
> including CSID and CSIPHY components, to support C-PHY mode configuration=
.
>=20
> # Background and motivation
>=20
> Modern smartphone cameras increasingly rely on MIPI C-PHY rather than
> D-PHY, thanks to its higher data throughput and signal efficiency.
> As a result, many OEMs adopt C-PHY interfaces for main (rear) cameras on
> Qualcomm-based devices.
>=20
> Until now, mainline Linux lacked C-PHY configuration support for Qualcomm
> chipsets, preventing bring-up of primary camera sensors on several
> Snapdragon platforms. This series closes that gap.
>=20
>   - Introduces C-PHY configuration support for the CAMSS driver stack,
>     covering both CSID and CSIPHY blocks.
>   - Successfully enables C-PHY operation on the Snapdragon 845 platform.
>   - Tested on OnePlus 6 and 6T phones running mainline Linux,
>     using the Sony IMX519 main camera sensor.
>   - The new configuration allows other chipsets versionsto enable C-PHY b=
y
>     simply adding corresponding sensor driver support and csiphy
>     initialization data, following the example set for sdm845.
>=20
> With this patch series, mainline Linux gains working C-PHY support for
> Snapdragon 845, paving the way for improved main camera functionality
> across many Qualcomm-based devices. The groundwork also simplifies
> future enablement efforts for additional SoCs and sensors.
>=20
> Until merged, the series will be also available at:
>    https://codeberg.org/sdm845/linux/commits/branch/b4/qcom-cphy
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v5:
> - Split first patch enabling C-PHY part into last patch. (Bryan)
> - Fix the camss_get_link_freq crash. (Cory)
> - Dropped patch whitelisting C-PHY, instead use nullptr check. (Bryan)
> - Dropped A-b/R-b from
>   "media: qcom: camss: Initialize lanes after lane configuration is avail=
able"
>   and changed Petr to Co-developed by and owned the patch.
> - Link to v4: https://lore.kernel.org/r/20260301-qcom-cphy-v4-0-e53316d2c=
c65@ixit.cz
>=20
> Changes in v4:
> - Documented cphy parametr to camss_get_link_freq.
> - Use BIT() macro for lane_mask. (Bryan)
> - Correct lane_mask calculation. (Kieran + me)
> - Removed comment for the D/C-PHY sequences init. (Bryan)
> - Pass &csid->phy for calculate freq. (Bryan)
> - Added missing cphy description to camss_get_link_freq. (kernel test rob=
ot)
> - Gen2 v1.1 MIPI CSI-2 CPHY init hex to lowercase.
> - Added back missed commit with improved electrical for sdm845 3ph.
> - NOT addressed yet:
>    - Proliferating special cases in switch statements on a per-SoC basis =
is verboten.
>    - is it possible to set clock_lane to say 0xff in DT ?
> - Link to v3: https://lore.kernel.org/r/20260117-qcom-cphy-v3-0-8ce76a06f=
7db@ixit.cz
>=20
> Changes in v3:
> - Make lanes_enable return sucess or error, since I couldn't move the
>    configuration to the _init.
> - Dropped R-b tags on
>    "media: qcom: camss: Initialize lanes after lane configuration is avai=
lable"
>    as I changed formatting.
> - Link to v2: https://lore.kernel.org/r/20251204-qcom-cphy-v2-0-6b35ef8b0=
71e@ixit.cz
>=20
> Changes in v2:
> - This is still WIP patch series, thus I wanted to publish already
>    changed parts to get feedback regarding to the direction of patchset.
> - When switch to using odd bits, zeroed val which was left unitialized in=
 v1.
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
> - Link to v1: https://lore.kernel.org/r/20251109-qcom-cphy-v1-0-165f7e79b=
0e1@ixit.cz
>=20
> ---
> Casey Connolly (1):
>        media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY ini=
t
>=20
> David Heidelberg (7):
>        media: qcom: camss: csiphy: Introduce PHY configuration
>        media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY=
 lanes
>        media: qcom: camss: Prepare CSID for C-PHY support
>        media: qcom: camss: Initialize lanes after lane configuration is a=
vailable
>        media: qcom: camss: csiphy-3ph: Update Gen2 v1.1 MIPI CSI-2 C-PHY =
init
>        media: qcom: camss: Account for C-PHY when calculating link freque=
ncy
>        media: qcom: camss: Enable C-PHY where available
>=20
> Luca Weiss (1):
>        media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.1 MIPI CSI-2 C-PHY i=
nit
>=20
>   .../media/platform/qcom/camss/camss-csid-gen2.c    |   1 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |   8 +-
>   drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
>   .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |   8 +-
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 355 ++++++++++++++=
++++---
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  11 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |   8 +-
>   drivers/media/platform/qcom/camss/camss.c          |  36 ++-
>   drivers/media/platform/qcom/camss/camss.h          |   2 +-
>   9 files changed, 355 insertions(+), 75 deletions(-)
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20251109-qcom-cphy-bb8cbda1c644
>=20
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>=20
>=20
>=20

It feels to me that the standalone PHY is pretty far alone by now.

Its totally up to you BUT if you are up for the effort and BTW thank you=20
for taking personal time to work on this but, how would you feel about=20
basing this series on top of the standalone DPHY series ?

---
bod


