Return-Path: <linux-media+bounces-56683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDIoFo0PwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:01:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA752EF933
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45BA3031CCE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630DA3876B8;
	Mon, 23 Mar 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6KdeWwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShFecYVq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E213876B2
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259760; cv=pass; b=tYe97f5NBS78T5oplCckx0TDsjKAkC5YBfosPMaMZA9z59S6S97ILYgiXVW2RqPaVbkdm1P2Qzno36UikqTrCSylCyUV/f++pDgiGJfsEVVYfxUcf2hOk96zbvRhW1FgjX6D1xSXnBqFXWFgGL93Ao4gM/8uuLZeF5GZcqgbNIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259760; c=relaxed/simple;
	bh=vuyi6u3g1TVBvE5CfpESILBnT4CqfKc/8nok29acUuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a866UHnIW5TeT44IUUkPX57C0+ctzrHsCmH4q9/Kp0yglCZvNoxPapXEY7F3TtdbgV27VtVQU+pJEZK+H79b8+ueKVEoQB8HQQGVJ855F5g3XpzOEsGR5sodpdFS3scz1M7i+OiEETBj9cr6RQkEkBI9nWHVY0pa7fj4HVdtvos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6KdeWwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShFecYVq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83iYf1364066
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=; b=K6KdeWwHVvNkv3XN
	bMoUUuP2iuvzZPJ04KaK5BBZxNhW5wTTx7Z8fpbe+qGGW4LC+Wr2XUCdv1NveU/Q
	CNcms+Z98MUCo0UJJxrvS8ygoW+5ubkn0YYM8HiuLwhHtB60uPYN4zaH6x+2Nn2c
	0rKveWpi5aA5G/+bCuE0Eni57gVw7vQYn8Ec5srgvRJQ0iriilTYd86n0uuv6sU0
	T6twddcZ1xYydgJ/2NVryM3hOJ7lVXCNIg7hoNPgpBKLbmdtOKpHuaQnAOi5pKC8
	k2fiseWjgcmtev6+287hKSaOL5mmNf7tnCzX1gH89IT980/M6rxy78VyAL6BlBhH
	i/zdXg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78dr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:55:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899f671ceb2so357167676d6.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 02:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774259758; cv=none;
        d=google.com; s=arc-20240605;
        b=lOiq2KrG0xLSZK5qo6OU4eJBAeFmJmLJW0pT32raxaLUA1slYAtIznYJeiGXac9Qt6
         TQu5vhYmtqoQ/f3Z0+BeFMEzwCyt6hmSoN1vO3DqEBJ5Dm1Dp4yimamkNtXfV7pwtj64
         ECqUEPWrr32T8v+JA7jE1glyxDytTR9c995AqvDSunrG0rKcEtbCRkugYv+VoLUWVgrT
         ZVUxMkyZPzH3HsbpAs6XUJeyMG7H6CHV1VpyILgxGW7iWuQj7bT3W3jV/18rg9drCf0J
         VyFFnRhe78J4K2Rt11+FvkiRUXU5d5mYeqzCfOePDz22bnXi+6b0m+EJ8g7VRu26MgLJ
         36Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=;
        fh=ikuo3pOl7paDSIWPNcEP0/zjgXl4N4vcLu2x6ComTxI=;
        b=EW85MPp43j5zpXWUkiFgKH5SIbsSuAOGixVISb1LHaZ+kVmDaBt+NMdZLQIx4YqcVb
         szgEr7kP8EpOZhm+sP5MnT0VTtYwmpPQDBPj6RxO/+6hvhSkWHdl/qzD3Ag0ogzli6tI
         KZQGad7brk+yblTnX3A71UpVcz+19bVm2WgVO5jSADzbevP7tOXzmW1nY+t60iNs8/gh
         k5CSv35PPoVOOW5J7LnQHYXz1nSVDQttIIRP0ZkTJgaVSlTwOquxnJakHs1NiHiBkVSH
         m1/6WgTbbtG0ourgcG/YppXcb/vSHdnAkFkwtoZBGgA5q0fB6buqWsiHtKoYnqywNeHt
         vZjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259758; x=1774864558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=;
        b=ShFecYVqOQJXtIoiR7MD3VXmEN6+yEqPhAXcEM2BhQPs8aMGd0JZ9UNfUhKXJBIVkw
         OQuS5B7FxtIhSraVF1IBgCXLpWwjfNdPN8Wz4dZwFuo08Ss/OKQi7ZSKHf2sOsA/RWeG
         LAd+JHBdo/VHD2BtMywFyb746pnuyarNclnyk15QVgv5PivrQ/29kHRorWtTbgJcX/Fp
         CqF6KOGxZ6ZNIa/wjTk/LgAdKNHNo3w0cBaFswAZcB9B05cf4bWMhs7fhtrSM4Pva/dC
         QPehUYRyyycFuWW2G9XuE/k6VHKVaWMsXptCgtq843cMFUuzbsnXInUWU4OR4Qv8jNFU
         ju7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259758; x=1774864558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=;
        b=VyorDlhD+lIHKVF9Q30p3+bT2gW7NIWjxaer7/YwAaXgjVNowLj5CcBPeIpYcEnILl
         OirI47YoE2kZgUBQQHR8zZ1Ktsvbifu+9mgdTyVndgFZ0K9ni9BsZLWtWvcBtX74jv1s
         cYJGB7LbcGVo1+fiETDkp5xXH0eqhByUi0ogVYkbB8GG3JTzuZnJFwvrER5lnyyPkzr0
         Ver5SrOCkn1L1M5v+bUuZuxIODcOJOGCano2jAbYcdbaYh5EcashP0caH9yzVbOmnU/j
         a3kaaUFLyQ7/MOu/9WCfyylDCTCql+k3eTB3XHF7CZl5+DwulMPfnnDUAOztBVij+Dyb
         7EaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlohZjjrpeST3r7C/M6r6PhgVjm2BiYWBkjyC4KATU7dzyjKOee+VMMOCQDk+u9Dvi0pp7PjildFmc5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbXzrqaupCxHCp8I3mc0cP/EWnYtxIm2Ph1qPWzwz1jYe4RMJ
	1Uj/QhUYtHXczHKzAl7QjxkMY6hlGPUbLrLaPOoEQRKKwBG89V136J54UwuC+NqjBa+gWszNgsA
	Z7tEo81eXq7KfWKkeHLakcy5CEXMrMkiK+LpKajEt57FWJwRQV8oafy/mbU08AGi4NqGRtSGSLw
	YiumC5o1Tab1jTPJQ98Yvz1AgcW5vpbj4zdBf2rqL0
X-Gm-Gg: ATEYQzzrwdgfR5mP2bhrp/oGU2YueErI/nK6lrCfbH2a9Ba1NIfFfhb80Ar0Nlm+j/U
	ouhrfOTlmrET1mfLUZnO6obj61IHRrP/k2IhX84TFEDj4ViTWzjLNGU9VZjhSz+yJ1rQBhxmUeh
	r/f5n2bhYHrPSyHYP5kQnxSVb7NtRAuXXjArat7dy9SJhP6sUAXrIz/43pH9Oeh+acq0cvysogm
	xQlKkllZOUKxSzTOd7YincLcqs6Dz7VeU5uwP0=
X-Received: by 2002:ad4:5c66:0:b0:899:be2b:68fe with SMTP id 6a1803df08f44-89c85a377d0mr185802126d6.33.1774259757923;
        Mon, 23 Mar 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:ad4:5c66:0:b0:899:be2b:68fe with SMTP id
 6a1803df08f44-89c85a377d0mr185801866d6.33.1774259757437; Mon, 23 Mar 2026
 02:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
 <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com> <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com>
In-Reply-To: <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:55:45 +0100
X-Gm-Features: AaiRm53UrST5G3xte4ZUKcxDWQNHeLye6lZxnOeuRdchWKx4Vidin0Uq67nDsR8
Message-ID: <CAFEp6-39tUEBqX_FWLdohE2jenoj1ot18Gnhi4Aop9hukGoGQw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c10e2e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ZFdpS9VYcODuzQBujkIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: lFjpHR37WoKcu00_J9pH__SCyztRB40o
X-Proofpoint-GUID: lFjpHR37WoKcu00_J9pH__SCyztRB40o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXzepQsPckuqUW
 Vi7a7r9x2PbrfjlAKe2Si/Qq6860eqAw7UBwcq5Tydf3RJk8T4IsTnY0e5J5fsWjoopzqdpZqjn
 Iggxuzm+3iNHBHjzigU2B5gInwB+g3tyTeNURcBBAhrlNIvjluzvTmuBmgDQoOhJROJiip/niDv
 qf14+dsV2779vdtpd2eqGpSRgqfnS+6qMU/6Xlyh3yIB5cvL+sZ4eVMz/I6aj9qyFf4HKeIdfsg
 5mDfDI1Pr1gFrEmgvrfJ4706oJWRuAevMWdppNPLA3mtScP74Un939JqXUYLJGyhqonuNp1fjwr
 JTjnhDhJzmeEL/pR5A5M5CbnKhjjAbk908FkBRheMOnCzuc2W41fq3AoQJqnEeEeP8bstoZyCgY
 2qar2ezCksDKolHLutKxRrKRo6O/VlNmnUjvMak45QfqowkEqJbgpav7/96fc02XKOOSvj3Oiv9
 fWLXdb+ueok8EKdgTPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56683-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 6EA752EF933
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 3:13=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 3/19/2026 10:44 PM, Loic Poulain wrote:
> > On Thu, Mar 19, 2026 at 10:11=E2=80=AFAM Wenmeng Liu
> > <wenmeng.liu@oss.qualcomm.com> wrote:
> >>
> >> VFE lite hardware does not provide a functional PIX path, but after
> >> the per sub-device type resource changes the PIX subdev name is still
> >> assigned unconditionally.
> >>
> >> Only assign the PIX subdev name on non-lite VFE variants to avoid
> >> exposing a misleading device name.
> >>
> >> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type reso=
urces")
> >> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> >> ---
> >>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/m=
edia/platform/qcom/camss/camss-vfe.c
> >> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f91673=
6f1d1664767bdb6a36 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device =
*vfe,
> >>                  v4l2_subdev_init(sd, &vfe_v4l2_ops);
> >>                  sd->internal_ops =3D &vfe_v4l2_internal_ops;
> >>                  sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> >> -               if (i =3D=3D VFE_LINE_PIX)
> >> +               if (i =3D=3D VFE_LINE_PIX && vfe->res->is_lite =3D=3D =
false)
> >>                          snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%=
d_%s",
> >>                                   MSM_VFE_NAME, vfe->id, "pix");
> >
> > So the PIX path will be called RDI? Doesn=E2=80=99t that seem misleadin=
g as well?
> when i =3D=3D VFE_LINE_PIX and vfe->res->is_lite =3D=3D false then vfe na=
me is
> pix, not rdi.

I mean when is_lite=3D=3Dtrue, we're going to name the PIX(lite) path RDI,
whereas it's not a raw dump interface, I guess pix-lite includes minimal
processing engine.

Regards,
Loic

