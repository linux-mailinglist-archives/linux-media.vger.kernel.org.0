Return-Path: <linux-media+bounces-58190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MLEHI8I1WnMzgcAu9opvQ
	(envelope-from <linux-media+bounces-58190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 15:37:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB43AF43C
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 15:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830D630EA6DA
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 13:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2394339FCDC;
	Tue,  7 Apr 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIRaG6Ca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLqlhxwc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BB85C4A
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568610; cv=pass; b=gWRy9APv5CNKKgd8B2mP/d92zK7i9inS2VA+k8TyWR5Rrp6DU7lBQgIydVVwmEkNCCmh8bvDtThj3vopAb6ggk9z94K2yvoCznZ4RCMXDfdLPEkS51UrRgH2fTSHy8E1wHi4BfvgPvfeX5FSDX+Yv90JGcCf/poVq4+CBljJ1J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568610; c=relaxed/simple;
	bh=cVBfaWm38Zt4dvT+MEWmCTUPH7hD3s6kknmIa3u2TeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/brqmSSIpYmFv2Yafc4P9wGL7wLzrmXv0bS+Uqef2dZVUfkjDAlEhPGMLK8ahPItqhFWem4WPUjhTKtVHPbOZ2HxhHuXs6T8rT1AavC7uE9iIB/TGDLGiMLpJ3mnKfXPw2evcZ40sUg6S3kInWnxKgzHvT2X3rkHLc30+9VbZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIRaG6Ca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLqlhxwc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CN86a1404166
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 13:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=; b=OIRaG6CaVv7oidXY
	C71YMfCAvM2n6K5q5kJJkwjL12ryNMuuvAguF3DQQ3Ea80hE9aTnE3XcMdfvUzaQ
	wu4UklE/oE+YXi1QUvYNLUvYnPbEbovwiyxlakGnf8Tc9n+MQAKj18n3TLwjdsJW
	anx4ZDub+aoUf7CaeRGlEzrnLSjMDu+uOmlT4q2g2C7EFTTycsYrSUHMGJP0IuK2
	ZzqV7mUd/19c/NiV8HurNlMIrrIKOl1h8G9AnRi88DGzvox9sw0UklnNddLlSGnC
	H7hLcrBljJAm0eUxmuWyz69McWrbw3MaHpnAq2LWekODiUMAs0h++vFCh1L04gIM
	7TTurw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8awkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 13:30:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ce5eec0f0so173972986d6.3
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 06:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568607; cv=none;
        d=google.com; s=arc-20240605;
        b=OwYdAPoH5TOqdyxFLxjqguHw+FqV1AsgDpt8UxUIrCzaYzuy/twL8ALR7o29O+zTjY
         ra450OsLbYHlBF1GIO7TAEEGL30UjfKh/fzcqXL3+Edb5TtbJq5jiRlC5WAns3S6LkZp
         PpEuyqzW2lDaTL5D+3tuXWg+5Zffr4Mi94YCdF0jIv70pKnDsIaBQ941VqzF8shRZDAD
         p2/XBj91qqU59JXFH7KKc1CneYcW0f7H4K3BwxKvYMc2RbhJM21kwVqBELxnEvod6nb3
         /zFGB1qpMQ0q4WVXRp6l8PrRRmGNXouAJPyR0mxMamZIa0m4LpjWzHRdXnAj9d5eO/Y3
         UA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=;
        fh=JGxjOIlyNkJrxPE5Kalv44medPDoTuvEiuvcuftDi8M=;
        b=cMxlyiyV2QbMh57BL0Ak2epi2r2PPTf09gyNws5oPQCGn0jhbO45nEi+KWKnF3EIZS
         o+tT5Oh2CoRAiPyzKHgdlSqufLxEk07pCPdIWASc6VcJ/2mMRrVUwAM8+lJUDx/Eam+h
         m80atsZTDFm4rcSOqhmb3x2fYwsXwG91EsRh+BVoNAVJeIU2X0IJLDtDVp9Gw8pVHQwf
         uLcw9kvPl/Oxdhchcr53km/34YkW6URMg5EFR844GeV1zlkXEkzUIcORzko80zUxWJP6
         GG0cFWvrmhMysntf89LWN+SEAD84i4Nf72Ircfeijq6vwGld25QZXtbBmM43x5MPmMAR
         wcgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568607; x=1776173407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=;
        b=jLqlhxwc11DcY7cqPl65wEpOwo+1a9mxea7rXEfIMpVRB77S6VwG8l1HY/8saXbmHN
         jJcHwSyfLFI/3iv6OK02yl+Jqm4Ox57LGGMiS0JlCFLeBc600GapWlSwnKMZEaT+Z/Wl
         ZYp2sjXrEr8ZBriaGnnBMJCtzgb3KR6clXueU1OnMaF5EVQEwBl+ugruG7gTzVq1if8x
         +z+awcbt9mTT0LIRTk14PGLsUMXw+KzIRKpeIyprNbrnoy2/J2QpUEo5aHnh5Aa9ohje
         6XNxChgYtEp6KQxhgJJOgW1OI7uj5yAKY5cOqKj4z0IfAAnQfPIuXzG9zZGTVOD0oTi9
         ajvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568607; x=1776173407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=;
        b=CMmbJubwP7mr4Vamul4VGb1fDTBb3vU6M/msnDuOihQP7z0ugz17qwCaE3rLwuWAvm
         pa1JRVkwlQmMgdXAlRgyXiRI82Zejev0pGmDA/2G4uj6qKF3Y1qT+zbVf19BbhzIl43m
         Ojm6KDAQfoOYEbRRq8Z7tZdNdy7PUuOBF2zjG96t3iug4iE00//JeNnQSG+ItCSdq5mx
         maNhpNIlkvipWmnKp/oVhwQZNxHWXJpA95fRc9sqzcH5sWNk2N4QV0NG7O1Jm4m4vGfb
         lCUt+IzGBIeC7SZZKBfGo/OP1Ttbx5QdioqJRJv64Y3oA3hM4XeVGMLiG67/XBnQnc96
         aRYw==
X-Forwarded-Encrypted: i=1; AJvYcCWlDyjZMJtA+KtkZ5sDLjfHVwMskie2UYaNF2yQCogwR4Is9HA8PswAjZfoHItpJLqV5fj8IzfEKQKYDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSgqDNDYxPgHaQFSfS3/zQOczbEBwxRmQFgL4ZplBnyTwU0iU
	s1kekqmiE8qQ6IEj9G2d5KixF3upxGfprgl2Nc9kjV5ImNx/tYLn0Gew1ajbyuaXRYPwll2DNrQ
	y15BbH63+KJgjWV3xYdASCbm9tCO4/M6DK8vrsJx6OMkkBKtUee6IklIyfDNqdBc+vsjD5CFWZZ
	k42MJK9ZWWp47jjbhzZTSah9sRyj2oOmRTNB0A3Fnd
X-Gm-Gg: AeBDiete17kwaGNwJTddvn9gXrQ17f8xR7jhXqfPu2NceHEmgCwQP3ArvcC8DBWdGMm
	MMet97Aey1Vm4Mu9SsUpitu18qDB1KyU+Vr+bPIHC3dZgon4F5c89IXXbJBYYbUupVZ1TToKn77
	PNNMGHIu7yEkFrqLLQSyh1V85L3Of2LGoXRnJE/qRhn216Z8bqdW2dReltXVT9DBNxJAkX9uumS
	UilZd23o2L8S2qukc3++iuU3cLWxuQnSMZdCng=
X-Received: by 2002:a05:6214:2aa8:b0:89a:9ef:1922 with SMTP id 6a1803df08f44-8a7046deaa4mr266841296d6.40.1775568607157;
        Tue, 07 Apr 2026 06:30:07 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa8:b0:89a:9ef:1922 with SMTP id
 6a1803df08f44-8a7046deaa4mr266840426d6.40.1775568606628; Tue, 07 Apr 2026
 06:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:29:54 +0200
X-Gm-Features: AQROBzACMKUNv5MZOhI59pKgDvTug_LEOvy8laj8LYSN5opN13Mvl97amo_eGE8
Message-ID: <CAFEp6-3VdFVmY8yj4LqVq1wFZ+D07WEfNJA2RhmpTeW2OtAbAw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID GEN3
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: p_iKGDPJJLX1UJaz9r06MsBLzBVAov44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX+ZWLgz8zAR2o
 M58tlpT1n9BcL0Y5fB8hD0gr+6XmFaEfRkbB6lZmIFhbxMEXmD1jns4O3MQjHTlRoXFvQJ9kX+i
 CogKxFO7jXnvLPwIhm2NPCFuBPQcTpxbNgZDwX3PyAfuG+bTRTMORVo1AGBJRWal8YQsZSUMhp/
 gHhq0pF2Rr+njPDxBwhMnofscs/9s7vNg6d22Q6homFqNnqPHgzo0cgR61dPb8EWL318gmmTR1a
 XAbAnE6a30K8dfcAHuP9yIF3cMJZAQjiHTzft5Xazay6ejqhBBlUhchkf9Hk7PxqT/oDi4706vG
 4cpo+Urf5dpOqpsGrjAOmgwVjr+Uh5oOdUU/XqdJNT3ZZBn61SIqAj/RTsIB5Ehz6faQIfrLSV3
 +V5RXtOOJMTbRgg+j+0d99JLBJu76KYPQfxZ3M+R/H/5EEhpD82xLBfIqsPJqoXzNkQ5fbR/SEp
 CsJy1WN6bltMSR3oeaA==
X-Proofpoint-GUID: p_iKGDPJJLX1UJaz9r06MsBLzBVAov44
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d506e0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=q9jW2Z7JBf9VXYl_VOsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58190-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: C7CB43AF43C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern w=
e
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice onl=
y
> VC =3D 0 on CSIDn:RDI0 to VFEn:RDI0 works.
>
> Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
>
> Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 28 +++++++++++-----=
------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index bd059243790ed..ed5c5766efd36 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -145,12 +145,12 @@ static void __csid_configure_wrapper(struct csid_de=
vice *csid)
>         writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(cs=
id->id));
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
>  {
>         u32 val;
>         u8 lane_cnt =3D csid->phy.lane_cnt;
>         /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, =
Pad 2 -> RDI1, etc. */
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -163,14 +163,14 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>          * the four least significant bits of the five bit VC
>          * bitfield to generate an internal CID value.
>          *
> -        * CSID_RDI_CFG0(vc)
> +        * CSID_RDI_CFG0(port)
>          * DT_ID : 28:27
>          * VC    : 26:22
>          * DT    : 21:16
>          *
>          * CID   : VC 3:0 << 2 | DT_ID 1:0
>          */
> -       u8 dt_id =3D vc & 0x03;
> +       u8 dt_id =3D port & 0x03;
>
>         val =3D RDI_CFG0_TIMESTAMP_EN;
>         val |=3D RDI_CFG0_TIMESTAMP_STB_SEL;
> @@ -180,7 +180,7 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         val |=3D format->data_type << RDI_CFG0_DT;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
>
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>
>         val =3D RDI_CFG1_PACKING_FORMAT_MIPI;
>         val |=3D RDI_CFG1_PIX_STORE;
> @@ -189,22 +189,22 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>         val |=3D RDI_CFG1_CROP_H_EN;
>         val |=3D RDI_CFG1_CROP_V_EN;
>
> -       writel(val, csid->base + CSID_RDI_CFG1(vc));
> +       writel(val, csid->base + CSID_RDI_CFG1(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>
>         val =3D 1;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_CTRL(vc));
> +       writel(val, csid->base + CSID_RDI_CTRL(port));
>
> -       val =3D readl(csid->base + CSID_RDI_CFG0(vc));
> +       val =3D readl(csid->base + CSID_RDI_CFG0(port));
>
>         if (enable)
>                 val |=3D RDI_CFG0_EN;
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -213,11 +213,11 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
>
>         __csid_configure_wrapper(csid);
>
> -       /* Loop through all enabled VCs and configure stream for each */
> +       /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>                 if (csid->phy.en_vc & BIT(i)) {
> -                       __csid_configure_rdi_stream(csid, enable, i);
> -                       __csid_configure_rx(csid, &csid->phy, i);
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
>
> --
> 2.52.0
>

