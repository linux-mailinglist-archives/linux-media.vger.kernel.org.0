Return-Path: <linux-media+bounces-5142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25970854A8A
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 14:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6818CB21715
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C74A5473F;
	Wed, 14 Feb 2024 13:31:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEEA52F85
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707917503; cv=none; b=LlglFyvK6GbluelHSZdAPbQwfFFEoZAIn3TG8aYG/AXqJOyzK8fifyFRqiLyfp4YGsrigTtBmGKdXI+cp7DNkTC+Lvwo7xztMjxoc9lB5TFwWUAfgp4okI/2P2JNWEBvB2uyGnw4acvSqX7S5eth1UuzjkvxlPHpuScMe+qq0CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707917503; c=relaxed/simple;
	bh=g7+dYMrf4hQ0Bbepi6j5xfvu9bdIju/3TxK2e2upb9Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGQdE2xq9TYhoXAIv/GdCmWIKgG1W+qqwU43UprgPORsXLzQbYoPEz/Sk7xyVFlxlxep0Bv+9FuNpjH2voyQJlP+f+3JN+3kWEMDNLAnmJBmCVV5kFE2rfBO5GXY3HNWoH/8wGog/DppKxaJZugfRjPWZMKVxln0MZAYD/9xt9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1raFM1-0005aN-6M; Wed, 14 Feb 2024 14:31:13 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1raFLy-000hZq-4h; Wed, 14 Feb 2024 14:31:10 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1raFLy-000ARF-0F;
	Wed, 14 Feb 2024 14:31:10 +0100
Message-ID: <a25224f5d28aa65e8bfd14fe0a8f599b9f9e3f40.camel@pengutronix.de>
Subject: Re: [PATCH v2 20/20] media: venus: pm_helpers: Use reset_bulk API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, Stanimir Varbanov
	 <stanimir.varbanov@linaro.org>, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 14 Feb 2024 14:31:09 +0100
In-Reply-To: <20230911-topic-mars-v2-20-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
	 <20230911-topic-mars-v2-20-3dac84b88c4b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Konrad,

On Fr, 2024-02-09 at 22:10 +0100, Konrad Dybcio wrote:
> All of the resets are toggled together. Use the bulk api to save on some
> code complexity.
>=20
> The delay between resets is now correctly determined by the reset
> framework.

If this is a recent change, could you reference the commit?

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c       | 15 ++++++++++-----
>  drivers/media/platform/qcom/venus/core.h       |  4 ++--
>  drivers/media/platform/qcom/venus/pm_helpers.c | 15 +++------------
>  3 files changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 873affe17537..ff5601a5ce77 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -328,11 +328,16 @@ static int venus_probe(struct platform_device *pdev=
)
>  	if (ret)
>  		return ret;
> =20
> -	for (i =3D 0; i < res->resets_num; i++) {
> -		core->resets[i] =3D devm_reset_control_get_exclusive(dev, res->resets[=
i]);
> -		if (IS_ERR(core->resets[i]))
> -			return PTR_ERR(core->resets[i]);
> -	}
> +	core->resets =3D devm_kcalloc(dev, res->resets_num, sizeof(*core->reset=
s), GFP_KERNEL);

Since VIDC_RESETS_NUM_MAX is only 2, I don't think a separate
allocation is worth it.

> +	if (res->resets_num && !core->resets)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < res->resets_num; i++)
> +		core->resets[i].id =3D res->resets[i];
> +
> +	ret =3D devm_reset_control_bulk_get_exclusive(dev, res->resets_num, cor=
e->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get resets\n");
> =20
>  	ret =3D venus_get_resources(core);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/pla=
tform/qcom/venus/core.h
> index 6ecaa3e38cac..2376b9cbdf2c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -130,7 +130,7 @@ struct venus_format {
>   * @pmdomains:	a pointer to a list of pmdomains
>   * @opp_dl_venus: an device-link for device OPP
>   * @opp_pmdomain: an OPP power-domain
> - * @resets: an array of reset signals
> + * @resets: a reset_control_bulk_data array of hardware reset signals
>   * @vdev_dec:	a reference to video device structure for decoder instance=
s
>   * @vdev_enc:	a reference to video device structure for encoder instance=
s
>   * @v4l2_dev:	a holder for v4l2 device structure
> @@ -183,7 +183,7 @@ struct venus_core {
>  	struct dev_pm_domain_list *pmdomains;
>  	struct device_link *opp_dl_venus;
>  	struct device *opp_pmdomain;
> -	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
> +	struct reset_control_bulk_data *resets;

Any reason not to just keep this as an array[VIDC_RESETS_NUM_MAX]?

>  	struct video_device *vdev_dec;
>  	struct video_device *vdev_enc;
>  	struct v4l2_device v4l2_dev;
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/med=
ia/platform/qcom/venus/pm_helpers.c
> index 9df8f2292c17..170fb131cb1e 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -865,21 +865,12 @@ void vcodec_domains_put(struct venus_core *core)
>  static int core_resets_reset(struct venus_core *core)
>  {
>  	const struct venus_resources *res =3D core->res;
> -	unsigned int i;
>  	int ret;
> =20
> -	for (i =3D 0; i < res->resets_num; i++) {
> -		ret =3D reset_control_assert(core->resets[i]);
> -		if (ret)
> -			goto err;
> -
> -		usleep_range(150, 250);
> -		ret =3D reset_control_deassert(core->resets[i]);
> -		if (ret)
> -			goto err;
> -	}
> +	ret =3D reset_control_bulk_reset(res->resets_num, core->resets);
> +	if (ret)
> +		dev_err(core->dev, "Failed to toggle resets: %d\n", ret);
> =20
> -err:
>  	return ret;

Could be simplified to:

	return reset_control_bulk_reset(res->resets_num, core-
>resets);

regards
Philipp

