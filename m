Return-Path: <linux-media+bounces-63214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OAQG3o5HWoqWQkAu9opvQ
	(envelope-from <linux-media+bounces-63214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 09:49:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED861B14A
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 09:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E3A430157FC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 07:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD6B38836C;
	Mon,  1 Jun 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0BJNmqp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkzSUN9c"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A442F691D
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300151; cv=pass; b=jc0hnLBwWrv8koectbBUC/gRkq26+CmgbtcGxtz9t3nWf6+/TxoSTJraDWbc3kgxiOHYUoltqB2LIdMo3eqAqwKSynuNaOqA+1HNcWcFuarDLshgGynVS53u1Vg6pK3c85oSd54EAlcmZGONgVJklHi++uCtMYoBfyAKbYqAnWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300151; c=relaxed/simple;
	bh=LUrmIVRCQgai3nGDdtAhNB+tmjEoGQhWGpRtMPHNxRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0JzOmB3JUBePoHPjrYag/WU3bjVbzcRjFlpfzS7gh9IzOTOEy4w+h+oFwbrnxet+OlZ8L7O6NF/gI/jRVm+SQMan16UHAoTJ3CKo3kv0GEhmLVjgYf/kv3X52UNGkmfSXstbcfTyXTe7uAxU6qybhQsoMkBHrUR+mVBhhxdOxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0BJNmqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkzSUN9c; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65172OSN2361310
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 07:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=; b=L0BJNmqpPPuQLU0C
	1ZXrhbT92DSaFTwrE97SdWBgTvCG54nrG74clU0AVgk+cXbtdGhc/wS3/JoAWLjb
	p/aVbFJmFDVcOb8BgDRLLcSFkrDptfotHq5mMR+oxjDg4EAhN1KPEcOUGd9JK+rl
	7oJKob5J8ub75Yn9Aolu4473K6HMDoAJd+YZ6VULDYNiMGy7CC75SA+xYlK9eLnf
	YQglJpN07I8uzqWlDjbxhJEPvZL6HWoYMo0J8U4Vm+x/VgkWadXvv8yrrpN/8X6l
	qpwTPo9qkZxdoax2qwdpC151g/E0+mWz9PCJEqEWDvu4JLnyMab/HswpZ6oe3sqA
	usmZWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqfxxe99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:49:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156ceb551eso32569485a.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 00:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780300148; cv=none;
        d=google.com; s=arc-20240605;
        b=Bhdt7tglxaVqnQfhDYOXcVP1yxTyxegF21cMv/78b5YRneJb9wr8yc3xsIsd4IW1pP
         fnNfO+ve4NIuhSNQl89zPttxZm0vebI4xCCNmtWSQVgE8OjasTt2zmhgZNDmP/wdV0Kg
         j3wB+IJMpVT9ms9ZVQUY/X1j17GUDRIa2II0I5LEQThNyqR2acmMImGhPF7yV1rHnhww
         5BWc9tVkGmd2QkcTtKQN4G+p6YdB2CmlbFMTpmEEHlLpGYg3jAuan8iFs0PU3lUoktlA
         oOBQMDKJCWBsiQGUm/VaBU4pVXsG0/F+muf+n7iK+c702YKX5Ibam48jMPiSt96LRcSM
         NGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=;
        fh=gCaiohMC04OOm6n860ntyhaOUL08gVtTvdETpFVJCeo=;
        b=B2Bm79f8qc9vxwNV3u7Lh42igPFt3FVaKcc/cs1fszLAmPiSFmzegW7KMacyLfVk8B
         wNWtmFdI6pzGtsnOMPA16395UtS1HLlgTqesm72losY7UUyPN50SjiywVwdT0w2IgbKU
         F9ZZYPkXbwVURiltoqm6t75NI1eICVycp4SuR3b4z5P+wkkQn7lHVt6yBoUUvDOkxNkf
         +sDZrNE+nNRZFTus7qYHYIMxglVWC/UDtdLiThvwihmuwekT8uf5BMkeB5bdiodTZtoe
         a4nE+R9dXHP60iyC9D3UMdxAsqlKgRl8K0WFJOb2FhAESCvr4FPeN92HITMDJPpRIKtC
         SMQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780300148; x=1780904948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=;
        b=XkzSUN9cpIPDOOXMNhKSWNbNazLrwm6Pa1hqT/rCp0K8VIHZLR8JnT7CcFA0GfaYu0
         ATenlrDdiRj/REXqp0rCdwlGacpECzzRJ0Ke++ptyl/g/3WCykTKB+mxR0IZfZ369z0v
         +7ntqNIKkRomF1LJXCGuaLHegNYPS3WvGaOgKWScnnSQQblruPbGQqQQDsE/72DKL99X
         rRaLOoEQt3W62swlV5wfJk00nHNn5u5b8psb1GKDFF8uKWkguLplOMdCB4s5xLX9Iwcw
         TDRE9fBGtQnpXrZLv0fZ5r5oFxs3OFjOPWOHA8rlKrjq7uyItRFr0ZvI6q3napcJrE06
         q7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300148; x=1780904948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=;
        b=cYgLlSi6xLd8WmC13n3FmaSrcd5gkwMVyzydFdCnachXDg0rg64wzYbzd0VMlFxDCi
         ejLp6S+r9w8Vkbb/F4l31grn77HKIalvYi/HDP1FS46VYtLxnzZvVzdif/pxnprAe77f
         gJ2ZUqWJwx+X8uqxKNGb7Ewa1BQ8vpTYVxSmyB2r7VixpqTpfDIInZBIX1u5fnYvTGFi
         CVZTjgjSuOfdswZfwcWyVsfbMEeq7pmRtl6YE02MDYJVVlRqFhGhYLGWqfe7WHn/uof4
         jR6BKlhu9004mgINNBlMiX1Jh6gaf+O+02UBMCL4QcWrZdVH9+s0P9sdOBO36gr6eaiT
         D3pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yfjexaYrKNwQnJWCQtkwlmRWZg+/2hehFbc6pw4PN/o5hv5KMorF9m2foIzuDUlS4BtFwc36g/NG4lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLttikOBBzz8qzlq5cB4xgnvdfLHIW253wHQ+k4lzyxBjpxVY
	ZeYtklT4jVIt0diuMz9qwHBNFPLwNqSMOwNmvtzsV5glwNTcNvZ5/rr8QxCQiZH5XsURWoztUbP
	+o3RuQkM+2rwlkRH23QKQFS4z8/bekbLGQGePkDfO7r73W55b3/db3VPp7eIdo5b3hhZoJeZNoI
	EytXvbUpP9yYrkl7HB1mOVSi8sRBN8PytZ76ilX99F
X-Gm-Gg: Acq92OE1N9VTnFg272RuRJbPQtr4LTDgha4BbdLtQU0WEcsKoW3stUldiIRbNOcEkK8
	5wqy3X7c119oe4S/w24JH/jbkQWwBpxpFimfoqITv+y8B0WmK3CY0s7lBWC54Mf9QsXdpXifp2u
	77+8Fn0Vrglnj4sKA/EXCxzxZnf9+gYnCKlwX9D/QKHyDMPGbARpUYLxC72jwOJ9uojU+O7k25c
	rQmbNF2aDgQ8b7ANBGB3KEXiwR/3L5028pZj4yCx415/8RO5w==
X-Received: by 2002:a05:620a:1a07:b0:8ef:3953:7ab with SMTP id af79cd13be357-9153d9f87b3mr1498805085a.40.1780300147962;
        Mon, 01 Jun 2026 00:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:8ef:3953:7ab with SMTP id
 af79cd13be357-9153d9f87b3mr1498802985a.40.1780300147537; Mon, 01 Jun 2026
 00:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
 <20260414185202.2714019-6-loic.poulain@oss.qualcomm.com> <178022614455.4008.17510287169443435896.b4-reply@b4>
In-Reply-To: <178022614455.4008.17510287169443435896.b4-reply@b4>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:48:55 +0200
X-Gm-Features: AVHnY4L5Zjct11l3S55ZjZJGfzAKzT-8LUZBy5LkCwslYIcTWv_MNbeaNsKPTzc
Message-ID: <CAFEp6-3yvegofHqWTyY2ST_2moqgZ8R8i+soUJUfo_-D6yf9QA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] media: qcom: camss: vfe-340: Support for PIX client
To: bod@kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: tdSt6rXA5vfhfpO7d02u_STsdLae--Ey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NyBTYWx0ZWRfXxWeHUvpkfElk
 uk12IMt9fCwaRHWxyJ6Vab0YJg1f/7jf+8juozLuGeaoqsRvesKVxBuX4bv3w6A7ZI9v3MdM8QE
 Uq8nfrJzk60mkSPImWs8/pzfjsLyXSLu3+GlR3kTEa2crBjp11Twu0DBTbW6Bvp3pV0YXkDa7Q6
 yAG1f/cZHfVRjcJ4P7xYzY00/Ks5UnQRPUeSo7g9q/C2eZ4EcyGNg38CxAee+EvSnTIiievklyK
 +qUwJ9hnnEyhK9oKI3Pnr7+LbKoRX6n8RhjUCyxWbvZmkaOp94egY/L+p69Ur+kWwVRowPPfLDi
 UBs0FIEITp8xwzzIeP+hGC6dS2triTb9aZlMtKTfrMDYY2OdHXmELs3AEvAUXPsCpP7GMMvn32c
 65Tsi3rwacwWUevth0JQ/mFG0BE6hpEZalWKwF4qcXBKmM8oNEmusMnPaRBnSc/AigypsCh70Xn
 t8/Du0IvM0CSb+WLa8g==
X-Proofpoint-GUID: tdSt6rXA5vfhfpO7d02u_STsdLae--Ey
X-Authority-Analysis: v=2.4 cv=Zq/d7d7G c=1 sm=1 tr=0 ts=6a1d3974 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UjtGO2agh6-tWwxbbI4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-63214-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: D2ED861B14A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Sun, May 31, 2026 at 1:15=E2=80=AFPM <bod@kernel.org> wrote:
>
> On 2026-04-14 20:52 +0200, Loic Poulain wrote:
> > Add support for the vfe-340 PIX write engine, enabling frame capture
> > through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
> > a separate configuration flow from RDI, including cropping setup, line-
> > based write engine configuration, and the correct packer format based
> > on the input pixel format.
> >
> > In contrast to RDI, the PIX interface embeds a lightweight processing
> > engine we can use for cropping, configuring custom stride/alignment,
> > and, in the future, extracting frame statistics.
> >
> > The functionality has been validated on Arduino-Uno-Q with:
> > media-ctl -d /dev/media0 --reset
> > media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csi=
d0":4->"msm_vfe0_pix":0[1]'
> > media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 f=
ield:none]'
> > media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 fie=
ld:none]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field=
:none]'
> > media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 fi=
eld:none]'
> > yavta -B capture-mplane --capture=3D3 -n 3 -f SRGGB8 -s 640x480 /dev/vi=
deo3
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../media/platform/qcom/camss/camss-vfe-340.c | 82 ++++++++++++++++---
> >  1 file changed, 72 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/driver=
s/media/platform/qcom/camss/camss-vfe-340.c
> > index d129b0d3a6ed..a01b78c805cd 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > @@ -54,6 +54,7 @@
> >
> >  #define TFE_BUS_CLIENT_CFG(c)                                BUS_REG(0=
x200 + (c) * 0x100)
> >  #define              TFE_BUS_CLIENT_CFG_EN           BIT(0)
> > +#define              TFE_BUS_CLIENT_CFG_AUTORECOVER  BIT(4)
> >  #define              TFE_BUS_CLIENT_CFG_MODE_FRAME   BIT(16)
> >  #define TFE_BUS_IMAGE_ADDR(c)                                BUS_REG(0=
x204 + (c) * 0x100)
> >  #define TFE_BUS_FRAME_INCR(c)                                BUS_REG(0=
x208 + (c) * 0x100)
> > @@ -63,12 +64,23 @@
> >  #define TFE_BUS_IMAGE_CFG_2(c)                               BUS_REG(0=
x214 + (c) * 0x100)
> >  #define              TFE_BUS_IMAGE_CFG_2_DEFAULT     0xffff
> >  #define TFE_BUS_PACKER_CFG(c)                                BUS_REG(0=
x218 + (c) * 0x100)
> > +#define              TFE_BUS_PACKER_CFG_FMT_PLAIN8   0x1
> >  #define              TFE_BUS_PACKER_CFG_FMT_PLAIN64  0xa
> > +#define              TFE_BUS_PACKER_CFG_FMT_MIPI10   0xc
> > +#define              TFE_BUS_PACKER_CFG_FMT_MIPI12   0xd
> >  #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)                       BUS_REG(0=
x230 + (c) * 0x100)
> >  #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)                       BUS_REG(0=
x234 + (c) * 0x100)
> >  #define TFE_BUS_FRAMEDROP_CFG_0(c)                   BUS_REG(0x238 + (=
c) * 0x100)
> >  #define TFE_BUS_FRAMEDROP_CFG_1(c)                   BUS_REG(0x23c + (=
c) * 0x100)
> >
> > +#define PP_CROP_REG(a)                                       (0x2800 +=
 (a))
> > +#define TFE_PP_CROP_CFG                                      PP_CROP_R=
EG(0x60)
> > +#define              TFE_PP_CROP_CFG_EN      (BIT(0) | BIT(9))
> > +#define      TFE_PP_CROP_LINE_CFG                            PP_CROP_R=
EG(0x68)
> > +#define              TFE_PP_CROP_FIRST       GENMASK(29, 16)
> > +#define              TFE_PP_CROP_LAST        GENMASK(13, 0)
> > +#define      TFE_PP_CROP_PIX_CFG                             PP_CROP_R=
EG(0x6C)
> > +
> >  enum tfe_client {
> >       TFE_CLI_BAYER,
> >       TFE_CLI_IDEAL_RAW,
> > @@ -245,18 +257,69 @@ static void vfe_wm_update(struct vfe_device *vfe,=
 u8 wm, u32 addr,
> >       writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
> >  }
> >
> > +static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
> > +{
> > +     const struct camss_formats *fmt =3D vfe->res->formats_rdi;
> > +     unsigned int bpp =3D 0;
> > +     int i;
> > +
> > +     for (i =3D 0; i < fmt->nformats; i++) {
> > +             if (fmt->formats[i].pixelformat =3D=3D pixelformat) {
> > +                     bpp =3D fmt->formats[i].mbus_bpp;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     switch (fmt->formats[i].mbus_bpp) {
>
> Do you mean to switch on bpp or mbus_bpp here ? bpp probably.
>
> ci flagged bpp was set but never used and now that I look at it it seems =
to
> me your intention is switch (bpp)
>
> Anyway please confirm and I can fix this up for you.

You're probably right, the bpp[0] might be a better representation of
our write engine constraints, well in our bayer case both are equal,
but if any one generalize this function at some point it would be
better to fix here/now, so yes thanks for fixing this.

Regards,
Loic

