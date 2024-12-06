Return-Path: <linux-media+bounces-22772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B19E683E
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26283281D9C
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D2D1DE3AA;
	Fri,  6 Dec 2024 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bMF2YOqh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB151DB94F
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471489; cv=none; b=ZaaLDjM4lyFob/zOB8mJRh88eDLfeH+wolFHO1LfA+Oz5OrL/vzwl+QMd1PIaI7MWjE7zkqdLNQKfHiduVQIKuRx1LqitkD26cXLqtxCrK3MkWAWFAhoK4ENA4tTJtyJk5ck1yoXWhatB6m3VJ7T3ergWvW55Wz3ona5KylveUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471489; c=relaxed/simple;
	bh=n+Pyzq+wC+5vFfME+mElXfKguUlc7V4KQGES2ype71A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZLxV+gCgh6HPYJPmd+ubtJA8j12/f1AlHO71czwJ51FPFOtVE28U7YYOm1hNvXZV8piK8ryePe2RpdtSdy8at9bNUFSe/fK3G21Bjv+m3O+MNa0VKFc2fKudBQENDTL1lDcqVw1DEFD1VKnfWCNz6pLQ2y11VRYaLI0GujmE9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bMF2YOqh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a8640763so12316475e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 23:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733471484; x=1734076284; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtF2AzVJ+m1dlr0KVksDDm3jCCBe3fegi9uwgdV42W0=;
        b=bMF2YOqhwevrYHaMyNn+7w8cd631NpspuJ81Fb7gljRuEKQehuaMYxj6hWjrmZaK4p
         +nB9gq+VWDvva2Cjti+XM0leFUj8TpNoM8oR4XA3wuIjYKEDseCFX12DxsDMIByT94Gi
         EiaN1j0EtOFhXqfDDx4+3x9LIkrY4/9DfbjNJygO/UYpUTu74hGhoW4cyckJW7Jiar7m
         DppWxRTIpwFTVcptbJDnEPl0rYiP0WCg97XHe0Wqq3cSLAywx/kZ6T4MfgQPp0ecJyij
         OeSR798n15mfXtfMBCiwD7g/CO6TJOtXleCujwUa06Mb236/BBfCzdcZz+dqxYgEmP9t
         rFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733471484; x=1734076284;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtF2AzVJ+m1dlr0KVksDDm3jCCBe3fegi9uwgdV42W0=;
        b=LUCjEMcPw/JsRnLpT6/U8TT8I6ol4yNNAVN/YAsSiQAzMlVfVOFl/0423N5SIHuHoG
         tDEOneHmguNMS1a0QWDDQr5CgQEGRYQI23bLLOvRhNd5L3SEJi69EIE52qTyUCY+D6+1
         k9aZZRKC5FZERPbxHtXk1UnInrKiABvirGjiCGNa1NFCJI75ROnVHnFZ1EjcA9clIxaK
         d8RIIahgyy/zV5pLTdPGsE0EeIFUAXdX3r8UWOEXwHYF6NbQO1g9aOjr7Ql7cIRvRdjr
         eunYtfpSuY+zqiTjEyyT/6a/EKEYrRCvK3idmHJY4riwwM3ioR6wlNaREEjEcuubPRKu
         a53w==
X-Forwarded-Encrypted: i=1; AJvYcCW8nWwbrPbswlxk8UoLRY519VbJe+iwb2A/xtehGJO+Xe8mAmvxpGPa5a1Xx5BoeHbdJsExc8hlJdp8eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMmnj1WlvsImrq6dpQ5xEhsPDyYn32l4+z8zZL9nmOZm4/wjS2
	IH5Cikj8gcpJXFVHWbgFMwqJpIvNPa0z9BMTevAuSPLo5SZEk9V05l5IcM8E/hoQJ5fAxZPcpZm
	8LkY=
X-Gm-Gg: ASbGncsDVcS9MZsFgIuG8xCNIFJoGgsDcyMtUV2wBL79mrERjBxR8zXSUIIlonk0TPJ
	85PH+4/EidCKdH4aMUjbUZf2QvLmDVWWith5/4isA02FsW+nfWySRn/py4VpU9hRpju/Jmy8V8G
	NdE2gSOjk7rIsQr1saS3HPLT050EuTqnzq4IMk9WwZV5XW07C8iy6JGQ6RPf2SxbXMonHxeVRRP
	qHR3XN3YsGW1b/01OQEiT0wjX2QrulMl1VKikbeaITrKCxmkg==
X-Google-Smtp-Source: AGHT+IE5fZ/i7z7N2nXmNIPVv1fmyaLiPz/XOt9gQ0D8TNBC3UISXUH544FlgQA3hcVUMGlt3gRdWw==
X-Received: by 2002:a05:600c:3c9c:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-434ddeb49bcmr16655415e9.9.1733471484212;
        Thu, 05 Dec 2024 23:51:24 -0800 (PST)
Received: from localhost ([41.66.99.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273199sm85839435e9.14.2024.12.05.23.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 23:51:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 08:51:21 +0100
Message-Id: <D64GCT2CXFLC.33Y61JJ8XFCHO@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikram Sharma" <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
 <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <akapatra@quicinc.com>, <hariramp@quicinc.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
 <will@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [PATCH v7 3/5] media: qcom: camss: Add support for camss driver
 on sc7280
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-4-quic_vikramsa@quicinc.com>
In-Reply-To: <20241204100003.300123-4-quic_vikramsa@quicinc.com>

On Wed Dec 4, 2024 at 11:00 AM CET, Vikram Sharma wrote:
> From: Suresh Vankadara <quic_svankada@quicinc.com>
>
> Add support for the camss driver on the sc7280 soc.
>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Hi Vikram,

This is working on QCM6490 Fairphone 5 smartphone with WIP drivers for
IMX858 and S5KJN1, thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
>  .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
>  .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
>  drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>  drivers/media/platform/qcom/camss/camss.c     | 319 ++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h     |   1 +
>  6 files changed, 333 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 7d2490c9de01..f341f7b7fd8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_d=
evice *csiphy,
>  	u32 val;
> =20
>  	switch (csiphy->camss->res->version) {
> +	case CAMSS_7280:
> +		r =3D &lane_regs_sm8250[0][0];
> +		array_size =3D ARRAY_SIZE(lane_regs_sm8250[0]);
> +		break;
>  	case CAMSS_8250:
>  		r =3D &lane_regs_sm8250[0][0];
>  		array_size =3D ARRAY_SIZE(lane_regs_sm8250[0]);
> @@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
>  	bool ret =3D false;
> =20
>  	switch (version) {
> +	case CAMSS_7280:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
>  	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 5af2b382a843..3791c2d8a6cf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 =3D =
{
>  	.formats =3D formats_8x96
>  };
> =20
> +const struct csiphy_formats csiphy_formats_sc7280 =3D {
> +	.nformats =3D ARRAY_SIZE(formats_sdm845),
> +	.formats =3D formats_sdm845
> +};
> +
>  const struct csiphy_formats csiphy_formats_sdm845 =3D {
>  	.nformats =3D ARRAY_SIZE(formats_sdm845),
>  	.formats =3D formats_sdm845
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index eebc1ff1cfab..b6209bddfb61 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -111,6 +111,7 @@ void msm_csiphy_unregister_entity(struct csiphy_devic=
e *csiphy);
> =20
>  extern const struct csiphy_formats csiphy_formats_8x16;
>  extern const struct csiphy_formats csiphy_formats_8x96;
> +extern const struct csiphy_formats csiphy_formats_sc7280;
>  extern const struct csiphy_formats csiphy_formats_sdm845;
> =20
>  extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index fb3234c65403..95f6a1ac7eaf 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -335,6 +335,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>  		}
>  		break;
>  	case CAMSS_660:
> +	case CAMSS_7280:
>  	case CAMSS_8x96:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
> @@ -1693,6 +1694,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>  	int ret =3D 8;
> =20
>  	switch (vfe->camss->res->version) {
> +	case CAMSS_7280:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
>  	case CAMSS_845:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f5704c23766a..4fa16ff6e614 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1266,6 +1266,310 @@ static const struct resources_icc icc_res_sm8250[=
] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_7280[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy0", "csiphy0_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy0" },
> +		.interrupt =3D { "csiphy0" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy1", "csiphy1_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy1" },
> +		.interrupt =3D { "csiphy1" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy2", "csiphy2_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy2" },
> +		.interrupt =3D { "csiphy2" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy3", "csiphy3_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy3" },
> +		.interrupt =3D { "csiphy3" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.regulators =3D { "vdda-phy", "vdda-pll" },
> +
> +		.clock =3D { "csiphy4", "csiphy4_timer" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 300000000 } },
> +		.reg =3D { "csiphy4" },
> +		.interrupt =3D { "csiphy4" },
> +		.csiphy =3D {
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sc7280
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_7280[] =3D {
> +	/* CSID0 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 }
> +		},
> +
> +		.reg =3D { "csid0" },
> +		.interrupt =3D { "csid0" },
> +		.csid =3D {
> +			.is_lite =3D false,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 }
> +		},
> +
> +		.reg =3D { "csid1" },
> +		.interrupt =3D { "csid1" },
> +		.csid =3D {
> +			.is_lite =3D false,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 }
> +		},
> +
> +		.reg =3D { "csid2" },
> +		.interrupt =3D { "csid2" },
> +		.csid =3D {
> +			.is_lite =3D false,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 }
> +		},
> +
> +		.reg =3D { "csid_lite0" },
> +		.interrupt =3D { "csid_lite0" },
> +		.csid =3D {
> +			.is_lite =3D true,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +	/* CSID4 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "vfe_lite1_csid", "vfe_lite1_cphy_rx", "vfe_lite1" },
> +		.clock_rate =3D { { 300000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 }
> +		},
> +
> +		.reg =3D { "csid_lite1" },
> +		.interrupt =3D { "csid_lite1" },
> +		.csid =3D {
> +			.is_lite =3D true,
> +			.hw_ops =3D &csid_ops_gen2,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,
> +			.formats =3D &csid_formats_gen2
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_7280[] =3D {
> +	/* VFE0 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
> +			   "vfe0_axi", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 },
> +				{ 0 },
> +				{ 0 } },
> +
> +		.reg =3D { "vfe0" },
> +		.interrupt =3D { "vfe0" },
> +		.vfe =3D {
> +			.line_num =3D 3,
> +			.is_lite =3D false,
> +			.has_pd =3D true,
> +			.pd_name =3D "ife0",
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
> +			   "vfe1_axi", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 },
> +				{ 0 },
> +				{ 0 } },
> +
> +		.reg =3D { "vfe1" },
> +		.interrupt =3D { "vfe1" },
> +		.vfe =3D {
> +			.line_num =3D 3,
> +			.is_lite =3D false,
> +			.has_pd =3D true,
> +			.pd_name =3D "ife1",
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators =3D {},
> +
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
> +			   "vfe2_axi", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 380000000, 510000000, 637000000, 760000000 },
> +				{ 0 },
> +				{ 0 } },
> +
> +		.reg =3D { "vfe2" },
> +		.interrupt =3D { "vfe2" },
> +		.vfe =3D {
> +			.line_num =3D 3,
> +			.is_lite =3D false,
> +			.hw_ops =3D &vfe_ops_170,
> +			.has_pd =3D true,
> +			.pd_name =3D "ife2",
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb",
> +			   "vfe_lite0", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 } },
> +
> +		.regulators =3D {},
> +		.reg =3D { "vfe_lite0" },
> +		.interrupt =3D { "vfe_lite0" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.clock =3D { "camnoc_axi", "cpas_ahb", "icp_ahb",
> +			   "vfe_lite1", "gcc_cam_hf_axi" },
> +		.clock_rate =3D { { 150000000, 240000000, 320000000, 400000000, 480000=
000 },
> +				{ 80000000 },
> +				{ 0 },
> +				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 } },
> +
> +		.regulators =3D {},
> +		.reg =3D { "vfe_lite1" },
> +		.interrupt =3D { "vfe_lite1" },
> +		.vfe =3D {
> +			.line_num =3D 4,
> +			.is_lite =3D true,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sc7280[] =3D {
> +	{
> +		.name =3D "ahb",
> +		.icc_bw_tbl.avg =3D 38400,
> +		.icc_bw_tbl.peak =3D 76800,
> +	},
> +	{
> +		.name =3D "hf_0",
> +		.icc_bw_tbl.avg =3D 2097152,
> +		.icc_bw_tbl.peak =3D 2097152,
> +	},
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_sc8280xp[] =3D {
>  	/* CSIPHY0 */
>  	{
> @@ -2622,10 +2926,25 @@ static const struct camss_resources sc8280xp_reso=
urces =3D {
>  	.link_entities =3D camss_link_entities
>  };
> =20
> +static const struct camss_resources sc7280_resources =3D {
> +	.version =3D CAMSS_7280,
> +	.pd_name =3D "top",
> +	.csiphy_res =3D csiphy_res_7280,
> +	.csid_res =3D csid_res_7280,
> +	.vfe_res =3D vfe_res_7280,
> +	.icc_res =3D icc_res_sc7280,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_sc7280),
> +	.csiphy_num =3D ARRAY_SIZE(csiphy_res_7280),
> +	.csid_num =3D ARRAY_SIZE(csid_res_7280),
> +	.vfe_num =3D ARRAY_SIZE(vfe_res_7280),
> +	.link_entities =3D camss_link_entities
> +};
> +
>  static const struct of_device_id camss_dt_match[] =3D {
>  	{ .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resources },
>  	{ .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resources },
>  	{ .compatible =3D "qcom,msm8996-camss", .data =3D &msm8996_resources },
> +	{ .compatible =3D "qcom,sc7280-camss", .data =3D &sc7280_resources },
>  	{ .compatible =3D "qcom,sc8280xp-camss", .data =3D &sc8280xp_resources =
},
>  	{ .compatible =3D "qcom,sdm660-camss", .data =3D &sdm660_resources },
>  	{ .compatible =3D "qcom,sdm845-camss", .data =3D &sdm845_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index ffce0a0edbc5..9a046eea334f 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -78,6 +78,7 @@ enum pm_domain {
> =20
>  enum camss_version {
>  	CAMSS_660,
> +	CAMSS_7280,
>  	CAMSS_8x16,
>  	CAMSS_8x53,
>  	CAMSS_8x96,


