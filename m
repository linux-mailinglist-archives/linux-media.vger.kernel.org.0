Return-Path: <linux-media+bounces-55692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLvcBc4XtGlkgwAAu9opvQ
	(envelope-from <linux-media+bounces-55692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:57:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6EF2845B1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 385B83153B54
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605D8397686;
	Fri, 13 Mar 2026 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmCJuuBH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OgPXNn7t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E69538C432
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409618; cv=pass; b=S1GbfBorkBvQ03YMO4l7ZXbsg92nvTyLvY2SjCYNSKfJ6mRFrCVs+GSu993PhyL5HQOV8HCrJHAJhxWprvUuEn//I8hFb+UQ4NMXP3wOkb8QPi+qv2qklH7FVWp8KNUv/HAoDWVqNSh0qWvU4e+BvgBfPXK5K3ixB9gm6bVtU14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409618; c=relaxed/simple;
	bh=FV/DtwzhOKzdsslHwgbGdgNDdyr9MZgndBBW2Xvd1+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpQ1WJnjZjfl5ivPSiTva/MJmgOp1xuLCP9+XlL6j+mtVoNI3XuDnyv8cnEfuYBrhQtvfGV+EUmb7kcNkOOaB4TuzosUFHPbojdg/+6iiPm1B+vvvocNdNs08+k070N078Pq+RxliOa7zLy+RMlSE1xkLjmMgYyaauFtyc9DY54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmCJuuBH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgPXNn7t; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9Tjd51498959
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=; b=OmCJuuBHhuBop15m
	kkTk1Ao7JAX1m1wdM0XgS0LMZwdD/FWD1ffcm83paz380+9bsRtRhRqMiMxGVXzP
	5D3cNxs8wSA//yhAxp2eMaAcfzBB3RnCBfgS4sOquFty4hehK9mLBiZ9sdU6JLt1
	rT2F6rWP73jNoJaFjlBqFoq3sf6HwxGGfIvsoHsWR3sf8psKImHxQ+r6XWuTTgCL
	L8xlsHAiAG4uVnZt5PAN+ncOCjXbO5bIJLEChtCVbOUQ8uBnehj7MM59NGj1iCSi
	etSAn6abowdwT1W/GsJtZvc5nOqGuntaxdH7JbKTKhmX5CdKPPa4mEM+SBJh3uAb
	HcbysQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgt4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:46:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899e89bf366so80659776d6.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773409615; cv=none;
        d=google.com; s=arc-20240605;
        b=Uf7jcTJ21VjApCMEbWwmcM+HLle61dmcdUFKadqIKsEgg94s1G8+RBj01pAWAjgjcA
         Bs8h3uCQNuwgPLOoA67ucdHIK8kYik8oJK4L5twZfCto5Tnk8d4IGxvp3gM1QD54966T
         mE1LNcFDzgrEYE2Lj5U8W2GOaKOWKuTB6ksyOb112vGorZvlhBdS0zWE69rLm5/Zkzuj
         wOvRvZM2hJ5WJZCJdBVnJQiaKdwZ7s4/zNYCR2oGOq7EE49vGttqU2dmIT2OqrtAspgT
         IOa9p+U4JAQtv8aAPQsUw9w/ltbkEqyr9MECi2izOg1LtGsNiOB4YFCfDIKD8fKYJ7TK
         is8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=;
        fh=6ptFGQbuHQLg60gii5KUFAhBBT5RrKSnrVxQxUgqwaI=;
        b=lhCofdUm/M1IS4qFOLQ6dOmf33ltUGfV2z/aBB5lgGPVtrYTTymTTphGoBbW0Ll1Tu
         Ch1tzdvHoX84idQd/A7BV2TAAP7dWKfHTW+sG4gWi3l4a6fwW8JT4lBhON8qnbWBRLIV
         VRksi+9NLqeWChptAwxYw+p7c7RXrJy9920j58ldxy2Puxwa27QB1AMKYgh5AQp/3t3I
         rLYXkUGEh3T9Ellj/TRtwYMfxYgs1469vo27IvEeqmWg7zodwMpVWRe5oPSi/uN4/Dex
         KdyrdgFDIsen0bEJyIFBR3KUUWPDjdP81b+3hb/BRjsqw5grLf4/HCGYwXqulFBykn0t
         IUNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409615; x=1774014415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=;
        b=OgPXNn7tg3KFiHWIP9rei53GghoDPwVBv5bj4C9CBbay3WYnemyCj/CteTyrPS9t4G
         zdWHP5ae16bCoUZwvB8HgUVI4dCppcTZTF6z1uv1UDSb/HLFDMdw2E51fh0jogSYVL4S
         xEuxLuuNMxzKmgjA/3rWbOnKRmmSobp9mCppxAsqzP4yEADKI/oCgbpS/LjhO+QMr8y4
         hLQDzy6AhWdqa97hT50fSbpsAZlWotVormccFMoecTscYPQekTHbhWoF4bu5rC3eRBR2
         S9cz6yvj4xF3zqP/j7XtoCf/Mi8MOrvzsg7QX+nCzwC5qqgvj/TtzH6zI2zYXLQXNvza
         7DBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409615; x=1774014415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=;
        b=XSO+lm6c8lJ4tD6J47MUtixKYlc3kkJc74UvboZk7AufFgwLLPKX+1Y3p5vU1gXhNX
         ugV7JFmtNcQM48M1uybedNHTBrmpP5lxpW0jpx3NnuzPmPLA1TJk0MrZ2cwd+62anXSU
         r/L9l1KFxdUKztwuOLNnuvDwyOcQCABZXgWBn9aJ9A+OBsMrxtfuV3/IW5fh22lJVnhV
         FfgKTHq3hWZEwYZLQw586vyQlsV7ImNDVNjFn24CxMKFuWfo4hmTkaJ9GBxsXJLEBf12
         52NNpnplPn+b7OOQ30TxAXeY1NOQ5eaYwZwJcDrLtDknnqvMachrPcEVO8RBWbyNZb9r
         5pcA==
X-Forwarded-Encrypted: i=1; AJvYcCXc7QYESsdp2KWrucpfmQRqWRMtX6h1BhywaKDUdq7UbpxDg7BKyoVvKQTMCi6G8Bozs8IckoOZEkbWrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwt3mo42iQ4W2omBEqifwcAryGhsv2csNvjnoK1nk/G130jkAf
	K1dUE7M2pATTkkI+IsHd/U3jdWdmsk/+ZdrjhVLtmuDGv3GJ1fXtoG40ZXBp5CBDScCyY/0JVtS
	42c4DdJRU9ralWvJ7bQAbgS+FnId1vmhT5415oSd+FL3DpRtlXEA8MipgxfG4laHG0HX/6KXV6t
	fw6Yxs28TGIkhu485TULyAn1IRKu2sd3SzVx4U3VtB
X-Gm-Gg: ATEYQzzAKf2JuyLvC0WuklNDRMXyHPO3fs6CNVMaUWLNM911ibEVa2sGkj5XplFUYRF
	TnUtPgH8k1aIK4xSNqB3ctyZ09u/dTZfzL33yB+BjRmcLVM4LFD+zbNPogczwqHbEAN7k1nhetK
	dYHXom8haerTo3XnAQGp0hS8l5nCB3IwovWAjZ5YNJYL8cqYFx/EN9hZ2lacFxhLxDJQhHRMTTf
	1kHwLbpXifa9IavRWWnn32DDJCWwqvzmbx4JyNP
X-Received: by 2002:ad4:5ae9:0:b0:899:fb4e:47a0 with SMTP id 6a1803df08f44-89a81fe253amr49799946d6.60.1773409614598;
        Fri, 13 Mar 2026 06:46:54 -0700 (PDT)
X-Received: by 2002:ad4:5ae9:0:b0:899:fb4e:47a0 with SMTP id
 6a1803df08f44-89a81fe253amr49799686d6.60.1773409614181; Fri, 13 Mar 2026
 06:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com> <0a31ea01-11c7-4470-a4f1-85e7f863d834@oss.qualcomm.com>
In-Reply-To: <0a31ea01-11c7-4470-a4f1-85e7f863d834@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:46:43 +0100
X-Gm-Features: AaiRm51CxSa5JrpSbZHhdSP-FHi-8E2DlWKlpkvOAHo9lXwMhvEJuU0SIRKNLdU
Message-ID: <CAFEp6-1KGXVcc7BDGnojxkojWfcQJS=yd9yj0H9oxAxTSph1UA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: camss: vfe: Make PIX BPL alignment
 format-based on CAMSS_2290
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b4154f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=UD6jFWV5_MqAamJTNaQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 6PStXyJHYtIju2I2HurC0mkL1txsU3UL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX8OXxFLGYnIXn
 e7x/sK/YRWYi4Xl+UuDUS2xFGMYFUGqPMRqq486zQTrv+JUyZ2liND/9rYlNZ+35z0q6xvoOVIn
 kiBroknTupuLj9iVTbYJS+nb5X5biPKMUwH+0gMxnLGkK/F0rlIYNdi/zVhkjKJ51rsQDIZQ1sz
 K7d29vh/z/1ascvE6xvHST/l1XqUQvz4Je2uQsSEvUw/VN1+eps53VnKcSvfe1wHLHYSLs7dCdG
 4tZnF7w+hf+/AlDFViB4j6J72mFB1eZPe/kdxdf5Sr+DVDot6BX6rcp5wiAHVCBIhBgkPKNHNXt
 nStxUlGx5vYQQeMNredA9N9Mr5r5nrXkEtF/0Evzp4yH6fs5/0Y56U2DYH1f5gB5rLIYnaQPRex
 DSqyK1k5t+3U8xdnioMG7JhljJ+qURBm7YK+BOA3xHMUfTTK59bT5jUe9gREmq7Ctvp7TjYlbIN
 wTX5e2YgGBRODJoBOqQ==
X-Proofpoint-GUID: 6PStXyJHYtIju2I2HurC0mkL1txsU3UL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55692-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8B6EF2845B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 9, 2026 at 12:12=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/6/26 5:00 PM, Loic Poulain wrote:
> > Split the VFE bytes-per-line (BPL) alignment logic into separate
> > helpers for RDI and PIX paths. RDI is usually aligned on RDI write
> > engine bus constraint such as 64-bit or 128-bit. But PIX engine
> > is usually (at least on platform I looked at) based on pixel format.
> >
> > On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
> > alignment must be derived from the pixel format. This allows the
> > pipeline to use camss_format_get_bpl_alignment().
> >
> > For other platforms, retain the legacy PIX default (16 bytes), until
> > PIX is properly tested/enabled.
> >
> > A future improvement would be to remove platform-specific conditionals
> > from the VFE code and move the alignment requirements into the
> > per-platform VFE resource data.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 9c7ad8aa4058..c174c7d706e2 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_m=
edia_ops =3D {
> >       .link_validate =3D v4l2_subdev_link_validate,
> >  };
> >
> > -static int vfe_bpl_align(struct vfe_device *vfe)
> > +static int vfe_bpl_align_rdi(struct vfe_device *vfe)
> >  {
> >       int ret =3D 8;
> >
> > @@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
> >       return ret;
> >  }
> >
> > +static int vfe_bpl_align_pix(struct vfe_device *vfe)
> > +{
> > +     int ret =3D 16;
> > +
> > +     switch (vfe->camss->res->version) {
> > +     case CAMSS_2290:
> > +             /* The alignment/bpl depends solely on the pixel format a=
nd is
> > +              * computed dynamically in camss_format_get_bpl_alignment=
().
>
> The immediate question to ask is whether this will be the case for all
> other platforms, i.e. whether video->bpl_alignment will ever be nonzero
> in patch 3

I expect most modern platforms to rely on pixel=E2=80=91format based
constraints, so they would eventually also use bpl_alignment =3D 0.
However, for this first enabling, I prefer to stay conservative and
keep the legacy fixed value on platforms that haven=E2=80=99t been validate=
d
yet.

I would like to review the other platforms in the coming months to get
a clearer picture. Once that=E2=80=99s done, I=E2=80=99ll follow up with a =
change that
moves the alignment requirements into the per=E2=80=91platform resource dat=
a,
so we can eliminate the platform=E2=80=91specific conditionals from camss-v=
fe.

Regards,
Loic

