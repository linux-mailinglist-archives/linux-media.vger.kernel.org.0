Return-Path: <linux-media+bounces-62982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHraLcm+GGoumwgAu9opvQ
	(envelope-from <linux-media+bounces-62982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:16:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC9D5FADFA
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 00:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA27C3133F9A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 22:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C3736920D;
	Thu, 28 May 2026 22:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy+Y6kkh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C535AC10;
	Thu, 28 May 2026 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006421; cv=none; b=tIfdKEs9N7xy8sQ2MAP+76MMVOWLMPlnP5nRQo0WlM4NcWfcWkjPM/Iz7TyKjhTq+zAUnbdi3ykJXtS7n/G22rG/qrA5bKDZxZOmfZFAD3nhMTMKWvMDGzAK+BmpuMPUfFe1Q0o8qVsS/nJCVuYN+tWIsNIdCmhZF+58ci2atQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006421; c=relaxed/simple;
	bh=K4B2ABnCbINjELhznQoUmwLcHPZIQBbuZok35L47E3k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZeYfcEgi3xc2IbBEsbCPZhJdftRUX1ysAq9mLnf4jA4stAiEvLgn/HWPrAA84o7izRD4Nbb7B2f+gRe5nhP+AUJB2DoBdWbtYwdtT/ejpJQ5ilrkqddFBbHFPj8T/xzeMW3fMcTAnIdxN4NAsXthnYzkuSasCuE4DlYuc1xu1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy+Y6kkh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0831F00A3A;
	Thu, 28 May 2026 22:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006419;
	bh=jTFDij8rOfBi4onm0+1H8QKsdfpsAEcT4+wmk4yoEdI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Qy+Y6kkhrAQA9KzETFwRbfyko7N6FINYJZiKIHhTcXSvJB2CxgGhUZkauOPYbZs2S
	 k7QvnESYLyvAp5noz6mEanflq3hT95oJ7FX7Y+pEItT6SH5YzLDs9YhryreVAsuRTf
	 KHc5qdpz096HaOiuqBnvazYMIM+STLVGzVjwgQOP0LMr9KYL9MvSn9h92NsdokjImD
	 Fo2yJ32Fu7M2OQsihiX+7tLTys+YHY8w41mvVepYkuzchr1ci13Jks86gB/JOXVV36
	 bhR3//bj2P0Pkz0b5UiDt2DiaLoj4eijSlYBnTrW4b98NjkfpFa1XEzFU/pdOHyL2B
	 wWMwPxXZ0ceVg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:13:31 +0100
Message-Id: <178000641103.4557.14582699057810501776.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4495; i=bod@kernel.org;
 h=from:subject:message-id; bh=K4B2ABnCbINjELhznQoUmwLcHPZIQBbuZok35L47E3k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGL4MgmVsUJ9fIpO2FVo+/R+7dyMCz2d4kVRpt
 /D6zzxj+8CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi+DAAKCRAicTuzoY3I
 OpmJEAC6cGVc5XD7h6kvsDLFRV2F10LaNzQXVBOCfZQgdQexwjr1EAw6mksRkIL2e8kKtzKHyRy
 uBenhK/Y35WLCNN+spRYGYeZ9EpX4iEFM3KY3pE4AOExVCFX5qmpivKb0aWI1mepIzg20ieutGh
 nd9tZfkZig6BNo7dltwK0VgThWqQZGIyDb/14EWkvAfS1x1AbYcvhUr0WMXgx8pzYSS2Fe/6OYK
 onEZIFZC3ZOFkjJNgk7l7qJISxhdzU8ZZm3txnainHA1zci3Yjt08M+PmeSsxYmxNJ/pxDeeJOF
 qFylUWPQJSRtgodOO9WjOciGiCKYcrZGObYyunF1uMZ3qMwpsGnLh1GMobMEerJuf4BKeBj+YOx
 8k6iOTzCeXSX96kUJpTXhcxlAyJNocH94SE6zUqK36Hh+N0PzllF5/1nGBT3kTR015/mWX9iQRO
 fXn/+3Ol8JMlRE5Mws2+5bDjm+oEp3QlC9oag2q36xk12R8DXzmbB+zit/Y2DM9fWLWaShGM5uW
 abuUDbuxs00n+SMYrlPu/+3rVh3xbYpjopDc9BzP6kL1rPsmI4SIr/2yQLQwW0ub1L7tqgOAwmK
 CY0jZYKTWI9kNLEpNa8wZ00CyLttb17r6gEr/HIQjv9iExYXtsjsVUTAQQ2Mho28SxxgTgJgVuc
 CsVBH4VeitIK+Cw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62982-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,qti.qualcomm.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1FC9D5FADFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> 
> Add CAMSS driver support for Shikra SoC. Add high level
> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
> 
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>  drivers/media/platform/qcom/camss/camss.c                | 13 +++++++++++++
>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>  4 files changed, 17 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613649920e6ee1a1f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>  
>  	switch (version) {
>  	case CAMSS_2290:
> +	case CAMSS_2390:
>  	case CAMSS_6150:
>  	case CAMSS_6350:
>  	case CAMSS_7280:
> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>  		break;
>  	case CAMSS_2290:
> +	case CAMSS_2390:
>  	case CAMSS_6150:
>  		regs->lane_regs = &lane_regs_qcm2290[0];
>  		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad57419b25cdec087 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>  		break;
>  	case CAMSS_660:
>  	case CAMSS_2290:
> +	case CAMSS_2390:
>  	case CAMSS_6150:
>  	case CAMSS_6350:
>  	case CAMSS_7280:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4e5fe880007d1ee7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resources = {
>  	.vfe_num = ARRAY_SIZE(vfe_res_2290),
>  };
>  
> +static const struct camss_resources qcm2390_resources = {
> +	.version = CAMSS_2390,
> +	.csiphy_res = csiphy_res_2290,
> +	.csid_res = csid_res_2290,
> +	.vfe_res = vfe_res_2290,
> +	.icc_res = icc_res_2290,
> +	.icc_path_num = ARRAY_SIZE(icc_res_2290),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
> +	.csid_num = ARRAY_SIZE(csid_res_2290),
> +	.vfe_num = ARRAY_SIZE(vfe_res_2290),
> +};
> +
>  static const struct camss_resources qcs8300_resources = {
>  	.version = CAMSS_8300,
>  	.pd_name = "top",
> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] = {
>  	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>  	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>  	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
> +	{ .compatible = "qcom,shikra-camss", .data = &qcm2390_resources },
>  	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>  	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
>  	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d05b2c3853f3a7714 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -82,6 +82,7 @@ enum pm_domain {
>  enum camss_version {
>  	CAMSS_660,
>  	CAMSS_2290,
> +	CAMSS_2390,
>  	CAMSS_6150,
>  	CAMSS_6350,
>  	CAMSS_7280,
> 
> -- 
> 2.34.1
> 
> 

NAK - what is the point of this identifier ? It literally just adds a new
define and a new string.

Unless there is an actual difference with 2290 which thus far we haven't
see, this new type is not required.

---
bod


