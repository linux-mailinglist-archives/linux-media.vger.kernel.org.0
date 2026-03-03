Return-Path: <linux-media+bounces-54378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBNKK5gEp2k7bgAAu9opvQ
	(envelope-from <linux-media+bounces-54378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 16:56:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113711F30D1
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 16:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0199309B42D
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 15:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB0E3CB2CE;
	Tue,  3 Mar 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djYY304v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5A9feiG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DFC4949F9
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553095; cv=pass; b=L+EoAV/utt6pM9gGiE589eZI6zBVWBiHYWsMGTaAQBh7p1zAaShokTXMUmFAqfO0YK1Ul1CfEwo96Gk8xCDhvqg6efZ0YDiqajPfJpwgvEb1PnrjiN4+snzRUNDU0Oo5arbjnBvBkRn5kQK50v/6dpqcjI/R6vrA0AL10x2lSbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553095; c=relaxed/simple;
	bh=vbl34SJpzzjuAqqO9ktWrHpqcdl29EDkYq9wDnmOJEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvUaH/IFVhRC8UIhkbNX5zlgaYjg4rNg8PNguG/C0utL2TCq7SSSX540bPoD4mdB/Nn4VD9xenmqHuss/kBquCSv7D89JlHSIJh6AjkGkZBGCbm6GnTtfRTdduNGVNRkJ+s+0Zyy8eCucHV8KvlKGvqZyEi+hosMFVwM1M+hCgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djYY304v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5A9feiG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n5gl582377
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 15:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=; b=djYY304vNkDYw9gx
	lsTEQp7mnpnXl48WeWwce1fF3wdwIh9OflG0zMP6t0/Sk7Vw5KmU4LrZ/X6+W+0P
	11XwH+iTDi/MrhbVlxhDNrREo9yzQ2TfOpl3yV/PGSn0dw2SLxMF7M21nInU9iPS
	kH/X5xQUOolWqM/Ke5Y0cZjrsTb/SjKnxe1YUO7ZFbCMMKV2ZG0PMKDCKIyyhLzi
	XdZdTwn1i1+r8V0r5CFAKd530kjwiEHQjDhHgkBhBl2Njh6+zM8tp8+o79GDC3/T
	bE8uxlqR7+8GXVVxlIPdDBd2RHmJiJ7AmEjX71y4qrR/IcPOSLqeOHgbqK2y1RrV
	h9N89Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6ubht5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 15:51:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a00530c98so84587956d6.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 07:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553091; cv=none;
        d=google.com; s=arc-20240605;
        b=gWYIb/Q1XJCZVZCmXrz5szc4iS/7jTt3KFhNHs7UZAbc8g820vPuDuwtLXhTDbAt68
         19lxtxaqj3Hev7Ys43aScxgWotU8PAwiNZ4TbmBcyeofFWNPnEKXI+L3NcT+YWJptAyy
         jro5JUrEJ+tv0pK/d4Cm0mjbVtEmIeO9U+UD5Br7nA7pVJeQUakB93bKVmceW8NHqI8V
         l7tOk0RzulL1Rw/J6v/U7RDLNJ1yi05ug0EPH+9Ugac3P8P0Lu4l1jnEYyhzJITM49yF
         qa842vXvrYMmMHD/l9aeXkkHra+lbl6isRuGlPMnB4beaHLViaIhL7Q71fnm66hZdcsR
         lVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=;
        fh=8pyNH4A5DjQRxA+nbOl/EdlhIOmtTethWptvLPsVshU=;
        b=OmQ/f0MuDEh8MSTbb1OK/NhgSGR8Z8Wi5vY50s64oBqC9a+3DFxG6Is9K8RzOSNIWH
         V+GgLYQfhSMPvn7JyhP5jPBZcwnWyUF3vE//nBg6Xd4qVxQpKQBQrGTcqkyNsuRTzLcC
         fV0wqGp+G5Fk/5eHArH/gich9AyixDCVKaeOs3jVm1ewRULwyoFsBlXqLZHQdjTWIo9d
         2pBsu8o5zYOoDMNjzE4Fg1YL1y/bZmuwmJ5Tg1bPw/KYJyPSPKirDoiAsW1yCcc6tT95
         8KvibwOaVu2wdYY2uRXsqPmwlBKL0gVhConFNk+9Af4mbIHPKCobtGOxZevOLKxwg1Lr
         n3oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772553091; x=1773157891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=;
        b=M5A9feiGFiYnMarr7I4vdQ8EPEs1iQaORhrWdO7JkOMDRKUs9+FyHq3V45weWZ4M8n
         ZjNFp/cF+Q5gHVOLvOecmHlhvV5W2+yvFHm4C+w1rxERnjOuxDLtek2ENUzcyNhMWVt9
         /un+JWDvgA7sbqS5HTIFuuktbWRNABK6s6Ewy2R6M57P1g1oYbgXfEVr6s//pOAN3bbL
         D1S2JG38zggA88PWP131vVayMx67g8Ko5g63/A/PXm6NVrMwHekwY+jLnmRChjf//ngJ
         LIIS0UsrNEBtV9cYei6kdxYn2VduGFpVYkVp9eHgRt8HyhHh7cCALt8SiXAx+Ukgtu+L
         4Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553091; x=1773157891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=;
        b=pclOr3K9C5icAAA6RkxxpLUvOyv+k7vKUYtxlzigfHpFVL8ZtGgO6dLL33QuaK8qX8
         m+LILE4ibLz/wKXy7Ml/BrjExCoJpXbz+4Mh3+IUYMyxUXcssZfK4TTVv6Wcrf5mfg5Z
         mVUfhIDHiZ0iPrJCFK889vsnzwJX0gihWSOnfmXJSIBoam739WxOIuvvunBliBtAxhSk
         VPppWOZUwgvQxV/OLTt8t8Ue69uxYMMcmvOEfvbRnute4f55/QdCVBsNRYcAZn6qSCrS
         Rn/nMSQXWUOwgTLSnrVkCXBm6MOQ+7iS5Vnnry9oAdX/24zyr+BJvDrYSaaTfq7vHqFF
         Ut0w==
X-Forwarded-Encrypted: i=1; AJvYcCUHma/Z/y6iD+5YUM+V7FNdhD918D2hhNVsgARJzWg8QCJ4Ln5if4KXfPx0FF75ngc+KWAcS0MXu8zJvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweOv6G8XI6yczqCqEwHmmHr55ZkgLM9qq2chEwfg+nri9PQMr2
	kWJPvzrJ9qdLlWBatGqHjdUG7Fw3t+My3u99QGo6t46Yb0e9WS6BmRng9ZxFUS//E88C69FXuzs
	ief1tcpUdjnt1CON+7eMyTC6gMGI0B0PPMYUJUVfRo1ilhiCIBkjsSO1AbNh7fKzHyzSIOnrQ28
	N4pK1dyHkcQuhUZ295f9fnmEGEt5Pc2yAmQ8akFCgu374A+d4oePhkiA==
X-Gm-Gg: ATEYQzyArqb6D9tgvWqeaEDqyxq8O6AF5WwXw9Q7dhnY9/tQHdU23ZIZPvC0kEhWeYN
	hb4eCnNs28OtNgMefRVDswniau1+mORsivnrSwRSgwhDnfYq6q8QT1i5gr9OB45/0T54XP1u/uw
	QeBkwhA5swPTWUuBcxwIDgeenzNxuxICLHZyWBErhpqUhHsJPW90U3SopTRUZNetwSsoEGig6wG
	M7+JZVcp7IU6ZMbIyHNkR6ypl1r9o7P98o1KIbH
X-Received: by 2002:a05:6214:519a:b0:899:c620:ba1b with SMTP id 6a1803df08f44-899d1e479abmr220697176d6.52.1772553091238;
        Tue, 03 Mar 2026 07:51:31 -0800 (PST)
X-Received: by 2002:a05:6214:519a:b0:899:c620:ba1b with SMTP id
 6a1803df08f44-899d1e479abmr220696896d6.52.1772553090589; Tue, 03 Mar 2026
 07:51:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
 <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com> <CAFEp6-0Pe7t5q11K9fAFkbUEuLOmsBp6rE4FFvW6o99yuLqS=Q@mail.gmail.com>
 <3eae6261-f61d-4d05-b1c6-393855f107a1@oss.qualcomm.com>
In-Reply-To: <3eae6261-f61d-4d05-b1c6-393855f107a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 16:51:18 +0100
X-Gm-Features: AaiRm51UnmxEWi1K6tgHqpTtJq9MzvFrSvg8clsU81jDcppBvFOT5XGKyZemhc8
Message-ID: <CAFEp6-2WMi-12oAqaW-U32x8m9TP1JY3NdrLtUSRK9gn57QPOQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS resources
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX2ijCAuYvA6Wl
 xRCxxqTEJlRKAaVsXenI7nYKKLPRnCVr8+jpL3LVWrKGn3GhToTyg70jHmojZcbHzOjxQRVZmzf
 UHDVsHgzuyaL5B8sRMwuCwPOdxLGRVtVi87k5kTUDwOroAaFT9Qd+xN+Z+lUIK4XtpQfijh+m22
 5TziPyR9NA84xcLOsvjJurcSryV0CRfzZL05NMT5ZG+2+GwY09ty0L4RmpbTpdZoex0Oy+LQuLo
 h0kf74gdWHcEI8nvy/IbdF0YXmft/376of6nGgiP9IVLMl35OJqicrRxltNf+H+OVBpqh3NTYF6
 vvWfbB8JIUVhZZ00bRf+sl6dE8tz6MA4MK6V4hDglKDsNH1xlN0Ad2UN+6KAcQhglbrSI0RBJN8
 REJeZhj7FGaK5vh8IeRi6tzKZuttQdyVjxU83YYPjz5N/MSPRZS3/uWr5unFR8gZlQMfziqMLo4
 HDI1EEP9GxdueTwjanA==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a70384 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=dOGmwKFHaaH-Xkl6nZsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: eXVahMdT5KHOJ2aPVeHmkkSTQfeRpcpu
X-Proofpoint-GUID: eXVahMdT5KHOJ2aPVeHmkkSTQfeRpcpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030127
X-Rspamd-Queue-Id: 113711F30D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54378-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:51=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/2/26 4:28 PM, Loic Poulain wrote:
> > On Thu, Feb 26, 2026 at 2:50=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 2/26/26 11:04 AM, Loic Poulain wrote:
> >>> Set media_dev.hw_revision using the CAMSS resource version so that
> >>> user space can query the hardware revision through the media
> >>> controller. This can help identify the exact platform variant and
> >>> adapt behavior accordingly, for example, allowing libcamera to apply
> >>> quirks or enable features that cannot be discovered through standard
> >>> V4L2 or media-controller APIs.
> >>>
> >>> Reported media info on Agatti/CM2290:
> >>> Media Driver Info:
> >>>         Driver name      : qcom-camss
> >>>         Model            : Qualcomm Camera Subsystem
> >>>         Serial           :
> >>>         Bus info         : platform:5c11000.camss
> >>>         Media version    : 6.19.0
> >>>         Hardware revision: 0x00000001 (1)
> >>>         Driver version   : 6.19.0
> >>>
> >>> Note that this may imply that the camss_version enum should become pa=
rt
> >>> of UAPI.
> >>
> >> Wouldn't it make more sense to populate this field with the revision
> >> of the hardware?
> >>
> >> I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
> >> while pre-Titan platforms have a version register at CAMSS_BASE+0x0
> >
> > That could work, but not all camera subsystems are based on the TITAN
> > core. For example, Agatti is different core but also exposes a similar =
register:
> > CAMSS_A_TOP_CAMERA_VERSION
>
> Please read the second line of my prior reply ;)

Oops, indeed, I overlooked the second part. Thanks for pointing it out!

>
> > We therefore need to ensure that the version values remain distinct and
> > do not collide across different core architectures.
>
> They seem not to be, but listing them all out would indeed be good
> as verification.

Ok, I=E2=80=99ll check that, at least for the platforms I have access to.

Regards,
Loic

