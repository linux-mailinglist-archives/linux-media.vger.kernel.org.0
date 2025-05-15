Return-Path: <linux-media+bounces-32567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0340AB827C
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70CDC7B1CC7
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5AC296FC8;
	Thu, 15 May 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfuDSFwe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1BB296721
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301164; cv=none; b=unf9/JUp11pjQBGa8PBSxFdcGE5H0uoLP0DVBPJ9tTt0/nqyOtbspxwou9LjN9Hjn1EGozM7PPI6RhBYlkRJFBxc7JXefj6Dfdng1oBDooZDvrDFLsIj9xxkdiXUC3/ENLabVov9W4G6inGtGBtIEOiIChDES8LanCcKbH9uXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301164; c=relaxed/simple;
	bh=TsiCl8rKFCWFeDp/0oWqqwMBaN4ci8el3pbkSyntbwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMIxsirARhUyhSclnGCPvVCbKB4neLAYuSB+rZaMmNxjZEQll0xJhBtXik6lwj/g1Ed/WKUP9iWNb8Ec+/8eV7NAn7FBDCDFpPU0/hav4pgB7pIn76kX5jIoYfugnT9epLrIqmT29HaP61viQ3i/VGmr/B75qf+J8VZuJu6+FHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfuDSFwe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F9JocB003073
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BFf3kk5fRW6YH4wNGhcvSpuk3KJMe8O3C7JOUEAZ1g8=; b=SfuDSFweQIoDdrHk
	yRWpqw67fyyTANjrhYakd/p1cCVVrGsbgTxLp/Z4jVRFkRMNYkhl5JMN699spDhJ
	nUqlGSnyNwcnNLI95n4vUYNXxwNvMAOVyvoDKE3L3oMxcSPrvFdx0JvEpjq5QGpN
	P/7wqQXlRE4ePsMI3NkRK45NgJQFi4rzaGQjiXEwwFeKSuEsPRrPYjqFG68pCzCt
	uZHifI0cvXw+XEEKOewnUo+92l4vjWyKLGL86UUW4wPbPbwH9PhYo8u/kCNdyhRO
	ZNxyhy9tR9ch8sZ2FakDv3CY+jcYJ2lWpCrQ3rYKsli1cly/+Kv/u3fBq6oJN8BZ
	p9sDqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrdjef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:26:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f53d9cf004so13305806d6.2
        for <linux-media@vger.kernel.org>; Thu, 15 May 2025 02:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301160; x=1747905960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFf3kk5fRW6YH4wNGhcvSpuk3KJMe8O3C7JOUEAZ1g8=;
        b=qAr1PUmxUHRbKu0j1KszSyXjAQlB52A+0OElyVHAuMOwgissP+9nRv7jFRRXpYNJYC
         YrMpuZRbIL45F/pzec1vH3K4HdflTNPI9+2ar9+cxAF+ibRoA+w0EH5G8BjMSnhfvuVJ
         qq1N02RyE+T0bWGoVeXbpTL8NH2QokgXl17JFUnt+4pesJjRjbd26tCIZZcvqqCwGOcK
         JfZaE0MkikokGF/XezlWdhWpTGGHXADfwJtYbu3jCsyCCIL8Y3+/GxnC8vrLQynheC2L
         xKSpLa/J2w0/3gIHTw6S3/XZMNh22aYmve/ahcmyMwzrHc0Jqd8nahM08Iz6AU3JZnLy
         2kXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIMAFHnmp5t16SJEFj5EFEK6IC5Oyux+8U/4plB34AM6xDQFAqUqBHZoOuX1IoBpn2tkBndZ8kJXHcRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytI9yARH30H79U+TumgAafyZBpL+ml6YEklMzxd+U5zU0dr7qN
	2snlGnqZtIJCxGh1dKQOhbVa6H9n8QYFDxsaSNpDAyHcgmoeUKL0D72bhw9UkZ2R23MQKQnByLF
	WEmJgHQgETZeS7OA3cWFv+A3J5OVu8Y+Ct1YFU/IsG2AtiVCGR04QFOLYqTQ51wnV2jEgCEcwTx
	zFhlNOVINQsBB4JxG6cMYyQhVE9l1iMUabNTcG
X-Gm-Gg: ASbGncs+G+Fc83ouWrF8Wj4z05jIn31/LmQAvaL6SQ26sS/OV4DwiEG0L9z9cLGkDWo
	2sC1UK+YMgI7eVHrsnP9NBugV5UTXMxIBR9nad4x/DpbJNDciJ42OaxJa/pKXofkTy8AEdw==
X-Received: by 2002:ad4:5767:0:b0:6ea:d393:962f with SMTP id 6a1803df08f44-6f8a4ba04femr34972566d6.16.1747301160311;
        Thu, 15 May 2025 02:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZn/QLQ9H0PPhOFWB7KPz2TUlcByNdtm3QN5xNY9Kr6JAaxQha8QMIXlF4No+E6QQoXLT5iLdWZvw8D/JG4fE=
X-Received: by 2002:ad4:5767:0:b0:6ea:d393:962f with SMTP id
 6a1803df08f44-6f8a4ba04femr34972206d6.16.1747301159925; Thu, 15 May 2025
 02:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org> <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
In-Reply-To: <33caa974-75f7-4054-9f75-9b97981335f1@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 May 2025 11:25:48 +0200
X-Gm-Features: AX0GCFvPI8LxEcJdTIQapIpsFreiHwMV5ZDRgtGS5mljzrBwKwZjJkDDVAhEAFw
Message-ID: <CAFEp6-1aKuFWQNYG3-PMdvnZKMBSKQY7792JsSj37NEFKA9QGw@mail.gmail.com>
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: e599F1EtCuFsePjntT5BNWhzJtPUIRNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5MSBTYWx0ZWRfXxnPDj7pMkY3Y
 I5btLuEUvTo04RykV8rMr+66yMEymWl3Yc1oK4FYBBhDk/fg55vlA05qDqQ8WOFdZMSzmMLCoUN
 qIdSDpHGSJWpkdQQPU85IxdbvEJv0Fpsp5zU44lICQz7qZfJM1fG+TRx+vmz8qwFTW9OcD4K+/b
 FtlM2W0EpDO9njffjCpNLP374ufBNoYgilAubbzl3Lh1iPiigv75ayqVJna7oNSHilUKlCU+naE
 E4soxCGCxFO8i4GlfnYkVtVNoPMP61l+RIPM8aEivAxavBeDhSO+p8u6sscRE7ubK2bFvrFlTaF
 6fmuel6VngdGbLWj4tl9mEh+8YuV7qlg/o6gL7NBSNjSM/UxPDC7FpvwoPI3SkIZPCPjsD+2F3S
 r3MvBD6yHcMWeGrlOli5qSz/cAPtDTpb8brdFofsuTdtAvzyCJfGTX9Jw4p0AhSUkrv6t88p
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6825b329 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=KKAkSRfTAAAA:8 a=k3plp_31mCQdX9J8InAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: e599F1EtCuFsePjntT5BNWhzJtPUIRNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150091

On Tue, May 13, 2025 at 5:47=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> > For sake of simplicity it makes sense to register async notifier
> > for all type of subdevices, both CAMSS components and sensors.
> >
> > The case of sensors not connected to CAMSS is extraordinary and
> > degenerate, it does not deserve any specific optimization.
> >
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 30 ++++++----------------=
-
> >   1 file changed, 8 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 976b70cc6d6a..4e91e4b6ef52 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pd=
ev)
> >   {
> >       struct device *dev =3D &pdev->dev;
> >       struct camss *camss;
> > -     int num_subdevs;
> >       int ret;
> >
> >       camss =3D devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
> > @@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *p=
dev)
> >
> >       pm_runtime_enable(dev);
> >
> > -     num_subdevs =3D camss_of_parse_ports(camss);
> > -     if (num_subdevs < 0) {
> > -             ret =3D num_subdevs;
> > +     ret =3D camss_of_parse_ports(camss);
> > +     if (ret < 0)
> >               goto err_v4l2_device_unregister;
> > -     }
> >
> >       ret =3D camss_register_entities(camss);
> >       if (ret < 0)
> > @@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *=
pdev)
> >               goto err_register_subdevs;
> >       }
> >
> > -     if (num_subdevs) {
> > -             camss->notifier.ops =3D &camss_subdev_notifier_ops;
> > -
> > -             ret =3D v4l2_async_nf_register(&camss->notifier);
> > -             if (ret) {
> > -                     dev_err(dev,
> > -                             "Failed to register async subdev nodes: %=
d\n",
> > -                             ret);
> > -                     goto err_media_device_unregister;
> > -             }
> > -     } else {
> > -             ret =3D v4l2_device_register_subdev_nodes(&camss->v4l2_de=
v);
> > -             if (ret < 0) {
> > -                     dev_err(dev, "Failed to register subdev nodes: %d=
\n",
> > -                             ret);
> > -                     goto err_media_device_unregister;
> > -             }
> > +     camss->notifier.ops =3D &camss_subdev_notifier_ops;
> > +     ret =3D v4l2_async_nf_register(&camss->notifier);
> > +     if (ret) {
> > +             dev_err(dev,
> > +                     "Failed to register async subdev nodes: %d\n", re=
t);
> > +             goto err_media_device_unregister;
> >       }
> >
> >       return 0;
>
> If I've understood the intent here, don't think this is right.
>
> For cases where we want to run CSID TPG or standalone TPG we would not
> necessarily have a sensor connected.

I understand it will work because Vladimir moved the media device
registering earlier in the probe, so the media pipeline will be ready,
even if no subdev sensor has been registered.

Regards,
Loic

