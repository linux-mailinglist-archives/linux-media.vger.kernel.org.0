Return-Path: <linux-media+bounces-57920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DfpMk0XzmmnkgYAu9opvQ
	(envelope-from <linux-media+bounces-57920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88D384FAF
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F19B30AC28B
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F16D3822A9;
	Thu,  2 Apr 2026 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fODeWmZI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4F62DEA6B;
	Thu,  2 Apr 2026 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113692; cv=none; b=e6QWqOaAKEA9Tf92Qa2gnjqTWGOcRHFI9bULiAdXe+Ku0LZjP4L6GOVE0IkAdDEBI6spSG9pbsXxscPPejBbufkLVttI/o+KJKQpV+0NS6ThQO5SdiSOrdJm0CoD+MnwXe8DINmP4uJz/7SIoPCipbJneuLpuVX+uWRajyNArLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113692; c=relaxed/simple;
	bh=wdXjb9OLDJFW15tcOFqK4nwOLkvtSVqTsJxlV9EX+1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEocatyiwa0ksnKNdWzQl73XVUdSZ+WmcJ6n0Vd7IgE8ZWuCZQJ34KmhOTf2OcncFFidO3taYt0AauWd1ZZUBSW9Q87EZVOhS1yEg1A+XhgxggIIPBVKK2oj3ZRHJAZ0DbD8Utaj2s7X1uyi5NdvUVLbjnvmZAEJ6Tx9PbTRoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fODeWmZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1683CC19423;
	Thu,  2 Apr 2026 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775113691;
	bh=wdXjb9OLDJFW15tcOFqK4nwOLkvtSVqTsJxlV9EX+1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fODeWmZIePlRyFiJDmBBAgaZUVx9wmkZlTeJGedGbquWv6zcwz4YIPyBSBmWMZn7A
	 0DOiQwJ8fJYHyKqhROQZqYNiIguhzJyGlHHsezjdjaj5nVQf3XTl/AsnP2PPz89gRr
	 5NHu04K8WdYVQ6ccMdmDC1UyqisOa/2RKwXPLnCikOeAPcbapJdm5sUEzn2dGdaDeV
	 XPByNcQPyXNVAKRbtFn1xB1p2v1itr9za8atxiCoWj7DZtDx24fOfCU0qBMJ9ldgiz
	 I7yJzyOG9LJ5YRPaT9jaChnjBPtkU6F78LJxAGxBbBUToVKw4gou0Tfq6zcCv7eKIh
	 bQRo8Kgd2swRw==
Date: Thu, 2 Apr 2026 09:08:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Message-ID: <20260402-lurking-tested-marmoset-f315b4@quoll>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57920-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6A88D384FAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:24:39PM +0800, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 46 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  1 +
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index fe4423b951b1e9e31d06dffc69d18071cc985731..e6a62b3ca78efeefa2eed267636789a6b405689f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -71,6 +71,44 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	iris_vpu_power_off_hw(core);
>  }
>  
> +static int iris_vpu3_purwa_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	if (ret)
> +		goto err_disable_bse_hw_clock;
> +
> +	return 0;
> +
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}

Why no IRIS_HW_AHB_CLK in power on sequence?

So if you rewrite the code that you have list of clocks for hw power on
(IRIS_HW_CLK + IRIS_HW_AHB_CLK for all variants, +IRIS_BSE_HW_CLK on
this variant) you could have just one function for all of them and
devices will be fully compatible.

No?

Best regards,
Krzysztof


