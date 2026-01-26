Return-Path: <linux-media+bounces-51557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFCcFiNXd2nMeAEAu9opvQ
	(envelope-from <linux-media+bounces-51557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:59:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84E87EBC
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B345301E219
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4B233372D;
	Mon, 26 Jan 2026 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNnqwP/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B562433123D
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428747; cv=pass; b=Miv94bNN3PgeVOov/G4jk/2MlPYDwIwXdb70iRsZj9JOv6JC+vK8pjhMjPcYoOgtMDgXPO2P8U/P2/cNt8NW8C3umtqRUsj2Mv8gK26jWnkWa8PqeuunqOoHVLvAXBufiRx+TSjvDmO3bfurWrXrbJ8Wm7weZ52Zpbis2jqMz7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428747; c=relaxed/simple;
	bh=ueDbZxfaJaRJBPNnQTV7LcSD+ot8kxI/8ecV5AaE3VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrMDMSv/OUlVgKjE/9aviYijWpP3791gxUz/AiDc1CPudcY2/5kdmBcCeJwM+hWulNKL9SiOdFIbrHkzZt1XDScUUmbWYZOpMNI1tc+lnBnJBDuOmQLnqTF88PO7DGN241moxRSMNqt/IRkRaYbxirGZb/i1p2ABEopdNTnNOTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNnqwP/o; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso2274419a91.3
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 03:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769428745; cv=none;
        d=google.com; s=arc-20240605;
        b=VFWVldhtNfceUzA4xXPOeo9/3NlTKTuMyRIfObAXThT6TBWZisiXT8QkDFQUKzVt3e
         LpIt2h2nfL5kxY/DsV0n3PIV3yW0H9k3dpZiXsD3MpQjo+slZwa4ZDCaoYxe7iyVbidv
         otr5oTSE26MjAj7Bq/EiLUb8tOv57Oataekp98kA1+rqw5Sd1wJ/LoIROHT+ZEiezPV6
         a2RMFzGT5zGe00g6TKytZ8+hIf46bDBEhKs2HMVHKWrW2wDMvSnEqVfMPTgYd0hz5iiw
         I/NcH2stwmWqox1LvdHa4UngecRhaqO3T/DlaSE2xLfpmA2+f0lj9D0VEaKLsCz7XU89
         sLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxU49EsEPtxJDyA2uj8GOndna+YV7i2iNMjekZIsTLQ=;
        fh=bvRaeGdlb84b+8B2R5SKV6w6WfkPCRlSXg7YnipXzgo=;
        b=ezrXLD2N4tERrLdYYeouPh2MS3CDWk6fEzJubt4hGyjV1CuMSggM5tpEF6FiAjXMNN
         96VS7SdgGbby8RCMonvRMvb9EzivUtdN9QkhUQM0HAzStdI/eMVwR8DQSSDGcVngBDSm
         XZcOeSBo/MJzjQMCo7OeUji/Gn/rwegHdSIR7hvm1++FiqdHZGfdBIAbrffNLTszTpDh
         6jdVcqX4T2IJ5F0c1rwfPLaruGNBszm82THYEXhe/iMI+1YlTyd0+P0XyJJN2NFX7BX5
         f/aJ5vVU/DJQ48rmR7sB8I2AXNHbMHCyh3zLFwd2jF8NSqWftqeK8Ou85IePMOhkG6TI
         I4xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769428745; x=1770033545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxU49EsEPtxJDyA2uj8GOndna+YV7i2iNMjekZIsTLQ=;
        b=GNnqwP/o3de3k+xzZsEBRPGU/J3QAslnMXgPHrKAgDC+4Y1slMotI6LqZHou0gO/s7
         7k0iHOsah8VReR/v7tqraP0kHjcNMYXkr8TPlZW8Ef60mIkZh0lfd3TL6iwwnwgo9m9K
         YRn1A7meFFaojlgQZofHbkags79+NFYAhfeia0BDj3vc9f3pcwfSrwzVYoApjgkPNVX2
         GcuLd7W38FExWcjaUPfe0YdZOXr1XXYgXkCNRR890ePj3n5Zc2DVV2+L487mjiMyrs35
         5VrTL/F99X+zlScU0jUMJtvPxK2kMpg73MVKooLOTdGlT4Orwcm0USGNucWe31WkNYAc
         5vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428745; x=1770033545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxU49EsEPtxJDyA2uj8GOndna+YV7i2iNMjekZIsTLQ=;
        b=OLd66X1M0WdTrRuijMtVyC/d6AiNA2VL1MwBFJmeB+SzVOmvIH6Qlj9Q2PRTwjsdUj
         GG8X22n1LTUSHrXtdQAoqKYGT/fQFtL3/9e+dnVuOy8JZsIha42gWH+IRrFYR3OiduWx
         XpQXg/qG9s9Vu8nVmQRSvSvwy3ISSWkCwfYk1rdabDjRXE9RSOr4z8yL8K+nWt8xBsnv
         u0OS7gURqcL6Ba9oR8w4VrfzAe4Itegz9d2t6d5J+TnZDMkeV3+heLfcFMJqh6IUlf6B
         oYXLVtgb2N5EzcGDRQIjQF4zbWJ89AopIAPY+rtT1IuMeBMu0cfrxS5XrYDnEorRUe9J
         KbFg==
X-Gm-Message-State: AOJu0Yw+RNIbvHHsOIOlG0PQFIzbVDhLqhHdvKKoswLPjl7vMoC3oLA9
	1qiTj0anCHMjZhtuegzE5tuw9voZQ64JnzEGRS1fsmvFMyL+STYFm4kjLh9vaIDloibHJocHs2q
	TezIc0zFR668w8KZ606F4bHAqGfhADHs=
X-Gm-Gg: AZuq6aIF1sI/ap3oSAJ4M8oEzJtMrM5l5nECRkDwNd+ZP88KroAPL3YqcETZUiQj2md
	nI+FnMrx5LeFjlGndSDpJy9TS2zgBby6iGUhwAJbzXsZV3dexGAjDjO169+FW+P2+C+6sHcZJCi
	zT3UZZTR4tk5FGCrOWlKnRJ1417ExRPeDL03CU3OE9n7Pum/Bc7NP2vu17Z2zoMGGCT9e+f7dz1
	RiDEfXGnTl9Cs++uF8K4JAAzA275iDLK6l2dRlRpRkzqvRu3Zd1KhPkrcsyOr1Tm73ZchgbJ+7M
	6Jx0GU85/5UDOCA+nTed5lpmupeS
X-Received: by 2002:a17:90b:1c11:b0:34c:7182:cf9d with SMTP id
 98e67ed59e1d1-353c41787efmr3269458a91.25.1769428744818; Mon, 26 Jan 2026
 03:59:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125171745.484806-1-bjsaikiran@gmail.com> <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com> <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com> <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
In-Reply-To: <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Mon, 26 Jan 2026 17:28:52 +0530
X-Gm-Features: AZwV_QjRJQN9oQY4Bm_wvDz9C94tR-dF8CReD0RZ4DAvRDLQ6uVsM3VvLqo3HCI
Message-ID: <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, bod@kernel.org, 
	rfoss@kernel.org, todor.too@gmail.com, vladimir.zapolskiy@linaro.org, 
	hansg@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51557-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,0.0.0.36:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: BA84E87EBC
X-Rspamd-Action: no action

"I don't think we've established the regulator is at fault. That's the
feedback I'm giving you here. ... vreg_cam_1p8: regulator-cam-1p8 {
compatible =3D "regulator-fixed";"

Just to clarify on the regulators: on the Slim 7x, the camera supplies
(avdd, dvdd, dovdd) are all RPMh-controlled LDOs (pm8010 and pm8550),
not generic fixed regulators.

As I've confirmed that the qcom-rpmh-regulator driver doesn't natively
support active discharge or parsing off-on-delay-us (generic
property), which explains why the physical discharge constraint wasn't
being respected.

I'm taking your advice to fix this properly at the platform level in
my local tree (patching the RPMh driver and DTS to enforce the
discharge delay).

For the media driver patch (v3): I will follow Hans's suggestion to
use Runtime PM Autosuspend. This handles the rapid open/close UX
problem gracefully by keeping the regulators on during quick toggles,
avoiding the need for the driver to "know" about the platform
regulator constraints.

I will proceed with my testing and will let you know of the results.

Thanks for the feedback.

Thanks,
Saikiran


On Mon, Jan 26, 2026 at 5:11=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/01/2026 11:23, Saikiran B wrote:
> > "Where do you get this conclusion from ? Are you inferring it from
> > what you see on the platform or can you point to some known
> > data-source for this ?"
> >
> > This is determined on the Lenovo Yoga Slim 7x (X1E80100). I tested
> > extensively and found that if I attempt to power-on the sensor less
> > than ~2.3 seconds after power-off, it fails to identify or times out
> > on I2C (brownout behavior). If we wait >2.3s, it works reliably 100%
> > of the time.
>
> I don't think we've established the regulator is at fault. That's the
> feedback I'm giving you here.
>
> I think it is far, far, far more likely the power-on sequence of the
> sensor needs tweaking.
>
> >
> > "2 seconds to discharge ? These regulators are PM8010 anyway - so
> > you're saying the PMIC takes two seconds to discharge ?"
> >
> > Yes. I checked the regulator driver
> > (drivers/regulator/qcom-rpmh-regulator.c) and found that unlike other
> > Qualcomm regulator drivers (e.g., spmi/glink), it currently lacks
> > active_discharge / pull-down support. Without active discharge, the
> > voltage rails float and decay very slowly via leakage current when the
> > load (sensor) is in reset/high-Z.
>
>
> Right so looking at the power for this part we have:
>
> &cci1_i2c1 {
>         camera@36 {
>                 compatible =3D "ovti,ov02c10";
>                 reg =3D <0x36>;
>
>                 reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&cam_rgb_default>;
>
>                 clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
>                 assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
>                 assigned-clock-rates =3D <19200000>;
>
>                 orientation =3D <0>; /* front facing */
>
>                 avdd-supply =3D <&vreg_l7b_2p8>;
>                 dvdd-supply =3D <&vreg_l7b_2p8>;
>                 dovdd-supply =3D <&vreg_cam_1p8>;
>
>                 port {
>                         ov02e10_ep: endpoint {
>                                 data-lanes =3D <1 2>;
>                                 link-frequencies =3D /bits/ 64 <400000000=
>;
>                                 remote-endpoint =3D <&csiphy4_ep>;
>                         };
>                 };
>         };
> };
>
> // qcom standard RPMh -> PMIC LDO regulators
> // these are not the droids you are looking for
> vreg_l7b_2p8: ldo7 {
>         regulator-name =3D "vreg_l7b_2p8";
>         regulator-min-microvolt =3D <2800000>;
>         regulator-max-microvolt =3D <2800000>;
>         regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> };
>
> // this OTOH
> vreg_cam_1p8: regulator-cam-1p8 {
>         compatible =3D "regulator-fixed";
>
>         regulator-name =3D "VREG_CAM_1P8";
>         regulator-min-microvolt =3D <1800000>;
>         regulator-max-microvolt =3D <1800000>;
>
>         gpio =3D <&tlmm 91 GPIO_ACTIVE_HIGH>;
>         enable-active-high;
>
>         pinctrl-0 =3D <&cam_ldo_en>;
>         pinctrl-names =3D "default";
> };
>
> Dell has used - likely reused - part of the x86 design in the qcom
> implementation - and toggles 1v8 via a GPIO directly.
>
> If your theory about brown-out is correct then
>
> vreg_cam_1p8: regulator-cam-1p8 {
>         // add this
>         off-on-delay-us =3D <20000>;
> };
>
> Then please let us know how she goes.
>
> ---
> bod

