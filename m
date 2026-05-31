Return-Path: <linux-media+bounces-63170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM/fGcDqG2o0HQkAu9opvQ
	(envelope-from <linux-media+bounces-63170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 10:01:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32054614EB8
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 10:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4029306D86E
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE31037BE63;
	Sun, 31 May 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc2JV+k1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C5379974;
	Sun, 31 May 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780214318; cv=none; b=tg9Nor2ap7GtkD7KPqn8uh/RxY0Y3ZQrZnStHtaqz/iDuOwAhOGhu/BFkXlf2RnLGKdYHMpj1+03EMJsJNXfVTONfW9Oe+4zRp3YApeSUgyzbvUYMQ9H1lwrcqirM8w7BPoIdGlZCuZE3VYMNR2ZSAZ5JxrGb+a1JAQMGO5Wgx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780214318; c=relaxed/simple;
	bh=h9KGdks2m1a1wfSY08AjkeP0osuNQLcra3+EEQm6qFU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=S+vAXa9dhVF8T90W4gggoZ4fsjJxNNvyyl2G0Jxw5vlWUl+pVWLibM6kGxYoVPQsRhSc6hH27cnRamDdAJ0bpNCdkDC1CxQq2g96J4f+IHpV5KwkZ4IqTEG3+wmSNSHuMd+ZV/WOhY8xZJ257v2dN5QCHp8VFGtEYfE1pehqnXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc2JV+k1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C9E1F00893;
	Sun, 31 May 2026 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780214316;
	bh=QTrzW3CaO4lZrYKnqRoN0ieXYY3utyhQodo8KXa3tZY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Tc2JV+k1lmbB2jmlJn++KQRszbg2DASN0oI1JuY1gpXVZ4AB0gGF6t1lHgFzv90Cf
	 avwRehATPiddvGYnkL6Sj9zmdupUBAm7m3f1ePucpDilhpAKTo3j/uDxrTQSGltHU+
	 1ZzeJZgc6ls4JwLj1Us5Tltf55ZAXKA+Ws0nbFFRWqreNuT/U+vFI3UisjAdpDRNsk
	 FLPsUCDGbtejM0+T/M+dVeoL/losN0S+5EFhN4vG3umf7bdoPw4ex5kVY3+23f3eOe
	 D8eV/kBzspNsbTuRROgsQqj2AdlqlhTNSNlajZVZDCEzyAS7qWoE9Ov3qBwnYTnJud
	 Mrlkv+gAiIbUA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/5] media: qcom: camss: csiphy: Add support for
 v2.3.0 two-phase CSIPHY
From: bod@kernel.org
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-3-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
 <20260508-add-support-for-camss-on-sm8750-v3-3-fc6861a65c67@oss.qualcomm.com>
Date: Sun, 31 May 2026 08:58:29 +0100
Message-Id: <178021430900.11283.3388219738164759698.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=6400; i=bod@kernel.org;
 h=from:subject:message-id; bh=h9KGdks2m1a1wfSY08AjkeP0osuNQLcra3+EEQm6qFU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG+onbbG0V0PwiDZy/XN1r5MsWqTgmWILaRcC9
 VmgIIS0VeaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahvqJwAKCRAicTuzoY3I
 OkoyEAC45XsrlyXsqMTY8YGUWsej5zMXWIRjl28XeYzN5I8Fak6FQERQkXwAi28V1QBoLyvjKcp
 k6FwhyvZiSiQm7AZR+CkmBlwOldNjLcEFXKODDwONsFWU0yy71ARCf02UKJKKOJxtcqHW5s/BgB
 TW12LAPEyyzCnK/5in0DksWB+n+TJBNThtvV0DJ7D3vpbQH9Hrhaariff1FzwwNcchPUm40h3MD
 3DXSu8+Ct9w4DnukVVonGzATW41sgNJs2qXSPFfZxEmO+C8MX6p5/Nqq62MJN/IBa8Uc2UV1Csl
 6n3s1P2cOqJfE0YzmxULeWZeWpSM4YV+9ddU//qUuBUoc1gKkqMQ7cYIZDEs0pC8bvrWyoAtoE7
 MdLvy7LcHYOIrZrj1Lu42iTdSlebab1T6UxyPxk1BS7zs4e5kCIKhvEdBiI04MOHeWu8Cs68y4o
 ywmW+AAt0iusXmpv7UnmXoF6XKvWQ9XIholN0lkR6XbMeLqFTUATCiqeUrH+Kdqn4gs/KneTDaS
 uFgY04e6PfhvP4TaYF79KcbzemuZEolWkwmxNjr5fg6ZM6S7mZJ+RjdTfL5LywfGajifKOYVbUg
 U4El/cGhFByDhL6t2KNXJT1/s7BRtLQuGMENZlB2q04Ei46O7+ZlX/+IzKMDJS+uu99J8Tchr5r
 deHymjX7GM011Cg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63170-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 32054614EB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-08 02:51 -0700, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Additionally, generalize the struct name for the lane configuration that
> had been added for Kaanapali and use it for SM8750 as well as they share
> the settings.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
>  drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
>  2 files changed, 129 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c51ffcd93ce1..5b633786314a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -684,7 +684,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
>  	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>  
> -/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
> +/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
>  static const struct
>  csiphy_lane_regs lane_regs_2_4_0[] = {
>  	/* LN 0 */
> @@ -1135,6 +1135,7 @@ static bool csiphy_is_gen2(u32 version)
>  	case CAMSS_845:
>  	case CAMSS_8550:
>  	case CAMSS_8650:
> +	case CAMSS_8750:
>  	case CAMSS_8775P:
>  	case CAMSS_KAANAPALI:
>  	case CAMSS_X1E80100:
> @@ -1252,7 +1253,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  		regs->lane_regs = &lane_regs_sa8775p[0];
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
>  		break;
> +	case CAMSS_8750:
>  	case CAMSS_KAANAPALI:
> +		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
>  		regs->lane_regs = &lane_regs_2_4_0[0];
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
>  		regs->offset = 0x1000;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3cebce812c58..6b7c3160e285 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4238,6 +4238,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
>  	},
>  };
>  
> +static const struct camss_subdev_resources csiphy_res_8750[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
> +			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
> +		},
> +		.clock = { "csiphy0", "csiphy0_timer",
> +			   "cpas_ahb", "cpas_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
> +			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
> +		},
> +		.clock = { "csiphy1", "csiphy1_timer",
> +			   "cpas_ahb", "cpas_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
> +			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
> +		},
> +		.clock = { "csiphy2", "csiphy2_timer",
> +			   "cpas_ahb", "cpas_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
> +			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
> +		},
> +		.clock = { "csiphy3", "csiphy3_timer",
> +			   "cpas_ahb", "cpas_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
> +			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
> +		},
> +		.clock = { "csiphy4", "csiphy4_timer",
> +			   "cpas_ahb", "cpas_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy4" },
> +		.interrupt = { "csiphy4" },
> +		.csiphy = {
> +			.id = 4,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
> +			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
> +		},
> +		.clock = { "csiphy5", "csiphy5_timer",
> +			   "cpas_ahb", "cpas_fast_ahb" },
> +		.clock_rate = { { 400000000, 480000000 },
> +				{ 400000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csiphy5" },
> +		.interrupt = { "csiphy5" },
> +		.csiphy = {
> +			.id = 5,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +};
> +
>  static const struct resources_icc icc_res_sm8750[] = {
>  	{
>  		.name = "ahb",
> @@ -5677,7 +5800,9 @@ static const struct camss_resources sm8650_resources = {
>  static const struct camss_resources sm8750_resources = {
>  	.version = CAMSS_8750,
>  	.pd_name = "top",
> +	.csiphy_res = csiphy_res_8750,
>  	.icc_res = icc_res_sm8750,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
>  	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>  };
>  
> 
> -- 
> 2.34.1
> 
> 



