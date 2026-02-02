Return-Path: <linux-media+bounces-52027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIKJHbm6gGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:54:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CE4CDAD6
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 091C73068F1F
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1D537107B;
	Mon,  2 Feb 2026 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVOzYKe2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37523371071
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043597; cv=pass; b=JzKjpQNH+li4A2B/sxa2O4Z+dJzzMag/VXLw3qmwdMJ9M/k86/vk0MrF7HXx8Z5R5CooulBiWarLh64Cav1z5j0PDeUFBxyR4k8hk/jgwi3KQjDUO6CgEvA4PErtnveMTyy+ikLQo6Q+tvGeDeBpQdM6U4pXD6k0Z8hPb5wocXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043597; c=relaxed/simple;
	bh=6wKlGaF+HJlYg3oYlybm2siLLYbtx8o9sW8eaq0Ny5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJURxRPh4bTg/wN2lKmEeW4/7ytpophEy74ZCdPmN9HS1oHFEPLcZqtqNwCFDtZQBkU8RWAa0Cx4VHyAa67amvUgrPZfRmxXzZZNdbiitwk08+izPSj3k69j04SQbc5aLLD8VYK0TzapCDF+ScU5W2MkCKz3APKpW+lGQEiSnEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVOzYKe2; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd22b9895so5913237e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770043593; cv=none;
        d=google.com; s=arc-20240605;
        b=kHDLTFLpoXm09ajhkCxEMj+6YH9mtdQDeLFR9+YeVuALm6UxsaqlEEmItAMqIp3cfi
         kQ/A89eVQdkTMyVwoxDmxHV1j3FaRcq8MP5MmcqXqreWajQFedht+wRh9unb6AV5F/PF
         zWo6S5sN4ycFBTTea+XWHMhyioW16skuCKLJQTIl8PG/LvILHUXXDMCTBPQQjW96S8/X
         qV2uutzL4xMLEklPBvUfpllkdW3/9cWxjNOTJu7AmXnLly6FBrKVltSB0k6Bk0fkHFQf
         yPgSISlKqlTkucLbZ1MK9hmUXLR2EP6T1MQNBU4dj05FCsh4iR7OnVKIHBwn7OvFDrYU
         utbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        fh=dkuFIkY011Uvu2VDgTrBj993SRcGSHyHwPmdPZYC1EE=;
        b=Vt/sxqiaNX5DINe0no3mlwiI3SqSIsg2xeG4DRhUcdCZti3hjYABuZh3972jysFcg8
         TuN0N8RFGnrsRz3kYmm4tzfXQb0U2EBn2g62bxNnztVLxaBnq4Gu+MVYdgp9Jdktv6rO
         TSoyLVTp8NQr6kCFlp9VWNoaW8+7jkBAIU8loQK5i/ZeB9i+4PgHMAYvU/SrKQ1qFYQt
         HjDGRNcDNPxjjb+lUZpSs2eY8pf9dj5F2J+6wswNv9kB8SNc7+/OY+8LWms288pNhvRp
         NcyPHqQWK3fdsAD5g0gxtGgGvgIRXs3cB+0r2mBHeDIwBRGN5ZMFI8dTQN8B/u0gjQ3q
         9Nig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770043593; x=1770648393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        b=fVOzYKe2l2RRcFW+Sf7fGimY+tIcvF5zBMwbbs7M+DLbk0mH85UpGR3Jws6hsrL7ZQ
         gjeXyI2CZajzK2NznroXwsu7OdOwiwaT56j3YR/rIVcCra3Zep39byQ7bXnbiJgnA80w
         c03KOxxv6aHSdSZufwhXe7xg6221bjbExrwu/ii68LoBcV1FpXGkalsGpn7Vyti7RrQ9
         OeJpYNhAXBcR7UouNnwElYV5VJVwN3HcRVcsVQnJUiGTcY1afNNjV+z4S0KaVdj4poUJ
         bUMqzXekNZP8KrUlx8w0xMn8F404sCfaITXKzIbS5WU/GF0hxeR3//Epw7itz8PFJ5RU
         0g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043593; x=1770648393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        b=P3v5lDiqeNglhhTbVgqECYQvBW+/03rK4rUWKh0aah2ViCUTIg6P7Ye6cd8tcmPRrn
         8JLfnJzlg5SeVii+SBF3lV360Zpvqa346QzsbmGuQWQpA0gzmBtSJIQqpMTsp5+YavuU
         GwWstssH6eTO3PkhD8XAOxKmydjCLKCZ4HwJKpvEDvaAgunOsRUuOsX21nlE+1WVcac+
         2qcRcXWgwCPLYgI/eDSVPMuiIe+ylZRlTs8WKk+H25K/4c5909rycSPTNjSye15UTNY7
         vcDlykFuZuiaewI1lT/9aW1KhDsqWN7+p4BDD/QbgtmckWyAePI9SfwPpCdAWTVbFr8y
         CVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA9/hT8ixcga3Ch7TQaOqfVa/job/32nPW4kZptUzqccHOrWbdE9RobcmXpQVnlGgQ4PLBymHgvKAwyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJE2+7RrRRwE7mVQoc1E2AptPP5D7g/Zv6MfrO+34Ek5fUx5G/
	ppDvY7V0l4itpaAcfoIHH6wniwrlQF38aIKW7zIt9gEyoNoJBtFpCranUgD/HXGPh2jGBJpE0ri
	5786MAE21M3aqRB36PP7Md6EeZsL20EBsmmCnzq+sqQ==
X-Gm-Gg: AZuq6aI5YGkenffBrcKxGEDH/Tax3rPx7LcNbPP4lA6VeKdEamzL4J17rsoOIa6eNv3
	9iXc63eugpy0xMAepQEO7DkN/2U5bfnBFwUXWFrBJ/X3OFrHlit51kfEEIaLXvVsYKoB+6o6btY
	4BCz2ZfcvNDPX+hCu34pcUK0QO5KOfMx4FPl10qGc6r2U0Ce3EK64o3gNyIRGvJ5RD0wnkPdw00
	UfE04gxLBLTD7UKunnlTB9fSRKuYr2PHQpAa+Ed4nhvdlz61cOODUWXAedRjrmAb5p+9bU0
X-Received: by 2002:a05:6512:3d07:b0:59d:f1c7:3e02 with SMTP id
 2adb3069b0e04-59e0d88d299mr7865289e87.1.1770043593213; Mon, 02 Feb 2026
 06:46:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Feb 2026 15:45:56 +0100
X-Gm-Features: AZwV_QhOzR0E6k1IfUGRMUbn9MQFxH_pvh_89KhmlNk_aUHzuxVlk0zPxkYMZY8
Message-ID: <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52027-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1CE4CDAD6
X-Rspamd-Action: no action

On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> As pointed out by Konrad during the review of SM8350 / SC8280XP
> patchset, Iris aka Venus description has several flows. It doesn't scale
> MMCX, the frequencies in the OPP table are wrong, etc.
>
> Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> stopping it from being overclocked).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Do you want me to pick up patch2 for v7.0 - or what do you suggest at
this point?

Kind regards
Uffe


> ---
> Changes in v2:
> - Fixed example in the new sm8250-videocc schema
> - Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (8):
>       dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
>       pmdomain: de-constify fields struct dev_pm_domain_attach_data
>       media: dt-bindings: qcom,sm8250-venus: sort out power domains
>       media: iris: scale MMCX power domain on SM8250
>       media: venus: scale MMCX power domain on SM8250
>       arm64: dts: qcom: sm8250: add MX power domain to the video CC
>       arm64: dts: qcom: sort out Iris power domains
>       arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
>
>  .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
>  .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
>  drivers/media/platform/qcom/venus/core.c           |  7 +-
>  drivers/media/platform/qcom/venus/core.h           |  1 +
>  drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
>  include/linux/pm_domain.h                          |  4 +-
>  10 files changed, 140 insertions(+), 46 deletions(-)
> ---
> base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
> change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497
>
> Best regards,
> --
> With best wishes
> Dmitry
>

