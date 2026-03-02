Return-Path: <linux-media+bounces-54102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGzjGrmupWleEQAAu9opvQ
	(envelope-from <linux-media+bounces-54102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:37:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCAF1DBF84
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 373CC3070DE2
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 15:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC04411626;
	Mon,  2 Mar 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4YvnBA4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzVkZS5H"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A7410D3F
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465327; cv=pass; b=ipTtLwpoBzvFKvE5tIusGnREYD73FVP1UJNuXK/bD/+S2ORKAIHQkfi7k4bc01joUKQeVqhbA4BXeMLj6ZEvSEJiOyqVhch1eazoL60WYMfoUSygshCK4gEddDuenHENF1jUASu8FrvWMSOnqGms3kBY/VP/8wktvSwRP/shFNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465327; c=relaxed/simple;
	bh=yMjWEEG4IHO1+cAeBpZBERLu1y3K1V6SSSf2AK2CnjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohKJyqAjDxS7/H5slIoAwF6SSwcfSAscCbHgm+IHOOeGZZiD6/Sd//NIuOPiV4QjOFJr2k4aJYH5cVi5SKLItzVLjPmyjQG+nk4e1xLtphV5kBxsSRgeTimXQomqzacJ4MTE8d3jC/t9uyEqVfsGb8X1hxtdG7oXs+an65Lu5MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4YvnBA4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzVkZS5H; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JY3n3741939
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 15:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=; b=J4YvnBA4AR7UmtRg
	/y8KqL/5r6bMY0K8/nHnaq1kkh0Ycz9T/7MyhpRzZuzenF4KGc1insRyvjtUWJ7R
	tyQ/0/21v6X5rbuhf1eMNu2tnWPmD/1iNcyq/YeI2dggY7v9COp/qFrWv8DNL5wS
	awaaOKBPRhjtAcekY5j1oRoqhA+n5oULHZQDIpjhfdlndfxumj60UZa7JOo/V97G
	fvif7CpmCnuvNm4D04ep0CMgVuBoXKT1eWAlv04VGCpF3gTp9FEP78pr8vg5Pw9y
	CzR45/EnsGqYGRUUytBGmZYfo2imql32/Bs2xPokMKZP/y62fQq4qg8r/QoGKs9b
	srlYmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trh7vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 15:28:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50340e2b4dfso517935801cf.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 07:28:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465324; cv=none;
        d=google.com; s=arc-20240605;
        b=kJmQyjCBom9LLZs4rbkHzUjUBWAF6lCuoHx84uvUGvB38/0Wi0Ow7XQemz8T5W6yfg
         d3isfxwd4RWsn16vVz1bXe7rWEEs8mqRb9lxVHkZIyNmsuwRkqoA7Ve+wXhhgpY8yLcT
         +2BG45lAhsQG3QGi1U8cQJRXuWwMe1aCrCGR0TPyzh/uTE6+AoqubWq4rp6OuhlQDkxH
         QLWplh1NABX+lh0BoHDdVCw0VuqO2yvbXH1D+T5VF88wwWS0Mvm8aWdjyQsbszx3qnt0
         CvvS/OAOCRXQkKdrYmaAup6jwwVHglW/is6jb4f9REUMz786dy4v92yp5yydSxbyQngA
         1Lgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=;
        fh=PBW4xCclxwkFmh4/nC+wkMdq7fJlyg/0RlBhvPwqfJA=;
        b=NAEXfaoD44uZgex+J56lY1xxvAWeq2tOUNrzzL+NJEfdiPFYMmFRKaB4SO3JAxb/yo
         +zS602I4lx+ArvKMgZq/CeRxl7iFkNEePJazPnJuNxytn0HsETiLfEXgMvXIibATeASy
         0scKY91W6Fyt9ThHbWazobI5pW+OqU/a4UUr5If9asLD1TwjTQA3ZKwDLacRpxSAY50g
         niFD2jwmcO/0d0mXIg7lJ+nBRYtIBIbq/uP2HnrJ2e36OCLNYXuYUXX4CDYv+sA3yiJF
         HM4UpyjiqCX+PrOZvFNBQzOrsSuJ0tVWd/nKnIf2nyL8kKlhr3QtiyPLufSOCqA4iKIz
         sKCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772465324; x=1773070124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=;
        b=AzVkZS5Hlmi7yOR9UO+zRjg1i7MAnW/sSfkS4QjpCQWyx4Q2Fxr6nd6RtZXOzI9uvW
         8FmhhCMxzqRt20zZDF0IKg1S2tlqdX8OLUCR7Rt7eCx/lOzi6WisRVLQc+zwAxs0D+Kc
         wh0ho1uyz43D9sQYFeQyOn0VwfvZTtqsHeBpXiMgnvolvsbfJ1DcSoJk8JyFVJ0Z7g4K
         Q2llAiSRs6xPMx/fSyuLnPFOodsIOLjVQFBZ2lxVYucNKQXZpKmm4G9hVEPMxn+I5mhf
         HDL+ZY8g+G4Rofkr0f0D3GUhhbbAqHqRNJSqZkAWTtftEswM9t0GWUp3wVvidbj6psy8
         +v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465324; x=1773070124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pc7MDL0s135+gvrNSq0u9k8kGog5y1IXbAhWPHoK1iw=;
        b=pgiU+CpP+OdGkC3t/RXqYAZsY9ITlxy8R9YoOnk/ddJfGcBwz0XbgXqKkcauqzsmz6
         GAlZ0r0NX0qajbtkgUBsNp+NY7gMfO0V9FBIXfYZho5L9Dl2Uk0p5bf83+yr6LHDZilJ
         ifXHKCdvTSr+kxInDVaF+fw9wjV9MKekga7J2UVjfwUe4C9p5oYnzcNU59D7H9rEpEnN
         oHq05wggN60yCyhx2X+HiFgmaBV2257edMTYSRfcKA1cLb5IuIUMgJ0tvA3rKzy4n6p+
         pngKus0mpPIerJFP889jJU57zCljz3uyHvFd5Rh9ej/ze+pOmGLoavlLTjc9V04UCs1X
         ZbIw==
X-Forwarded-Encrypted: i=1; AJvYcCXBiqzPffJGiYtOBposAo2NdhmVLIULDKIGEc1FgwUMSfA0quMl/Cc/v5sdRFix4K2zGXGxl/8wOSX0VA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx231b0vdFTSHti9xq8pJPUHL3sHGIt9JmLtz3L/JvIoOeyZK0j
	RzzshlKg6RWtnhQcm5AdL0St2cV+p4NIdbEbDyjwMjrGxcDCaXZIzpJgVgI8c24/+29LGXXsvqj
	DAuwuBGWD5GykhuiBhMqveQCHlOqDwMbvNlrH2SoI2MmPwErfbmAOWFo5wDWTcPVggIq9GLfRqH
	kHH5BSx9YfOBUFGhum7sHvbRfrp8DG0Dioirk3Q98L
X-Gm-Gg: ATEYQzzLmLehmOeJ3ioA+26fV18VgB6D8kWDuou5YThMTXyfuCTfiqGsl5TrUcrIDNi
	z8kHM8h0cx2YjNyYbA6DfFOA/Q8EucJMFDx7/1cIc+6PpoAqTlUI7SNa0t7tWAV9DA8vlCmlGlB
	Nha3tuKKJvDNKJrqncPSAOZ2FpOxGPBts6oddk8e1ism5HjNbeHBRhdnZWuH5If7xL65duIa3Rj
	QqUCTouuzZXpPh/BNOZj8eSla8N+oO7+2Yzi2Tm
X-Received: by 2002:a05:622a:486:b0:4ff:4a7c:da11 with SMTP id d75a77b69052e-50752739330mr163588181cf.11.1772465324274;
        Mon, 02 Mar 2026 07:28:44 -0800 (PST)
X-Received: by 2002:a05:622a:486:b0:4ff:4a7c:da11 with SMTP id
 d75a77b69052e-50752739330mr163587741cf.11.1772465323792; Mon, 02 Mar 2026
 07:28:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com> <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
In-Reply-To: <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:28:32 +0100
X-Gm-Features: AaiRm53gpTM07e2mB81oJ3O-Al5PASPZ_sg3Ig_wFpUqVR7CkSCnSD5ER6PgIp0
Message-ID: <CAFEp6-0Pe7t5q11K9fAFkbUEuLOmsBp6rE4FFvW6o99yuLqS=Q@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS resources
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyOSBTYWx0ZWRfX0PgmgxEIxY1J
 P+Jhsi4tHPRvAITzhd2pKfi9s4edOYOHfG8m/c9AP9Sb2ABqs4HSlNEwxyTLvUj6Xu7/TTHXRv/
 ImnEwQbErzXKhMwfB7Aad36RSa4BUYgcILp28ImpiPsCq7PhW7tK8bgkq7E6LzzsWrJ1it8Lr2F
 BLHlW2Tszbo0XxryjTz9ePSWIPHq75CxyK+H8T7ZK+UxDJjkOtWZVImV2E/uWdkL0Sjv3v1JShw
 5J+tRYJYJvIbldeaOWFwBUtkF/pIJJ/RlCyQntGbqHG/gbS9xia/kyjbSMNmF2cdN4CfR5prj/I
 0HzQkJQC6znfhBqUvpuMZxo+q1+z3kcNV4OIvjmf8NuxboM721VAyLfA0ERlFElcvhF2v2rzcaK
 AiZwxZnXDWnQxGjW6omCqr5w+7gIWZJiZNSnldv43l8mlRzijTD8koR7wRiYrdP3qixei5pZFkw
 +Z/zBPcpAjdcnIocLkw==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5acad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=wzL84NikVdi8kru7dWMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6ZiAFR75T7oMwc4sWpPC6hESbYWeYaJj
X-Proofpoint-GUID: 6ZiAFR75T7oMwc4sWpPC6hESbYWeYaJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020129
X-Rspamd-Queue-Id: ABCAF1DBF84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54102-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 2:50=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/26/26 11:04 AM, Loic Poulain wrote:
> > Set media_dev.hw_revision using the CAMSS resource version so that
> > user space can query the hardware revision through the media
> > controller. This can help identify the exact platform variant and
> > adapt behavior accordingly, for example, allowing libcamera to apply
> > quirks or enable features that cannot be discovered through standard
> > V4L2 or media-controller APIs.
> >
> > Reported media info on Agatti/CM2290:
> > Media Driver Info:
> >         Driver name      : qcom-camss
> >         Model            : Qualcomm Camera Subsystem
> >         Serial           :
> >         Bus info         : platform:5c11000.camss
> >         Media version    : 6.19.0
> >         Hardware revision: 0x00000001 (1)
> >         Driver version   : 6.19.0
> >
> > Note that this may imply that the camss_version enum should become part
> > of UAPI.
>
> Wouldn't it make more sense to populate this field with the revision
> of the hardware?
>
> I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
> while pre-Titan platforms have a version register at CAMSS_BASE+0x0

That could work, but not all camera subsystems are based on the TITAN
core. For example, Agatti is different core but also exposes a similar regi=
ster:
CAMSS_A_TOP_CAMERA_VERSION

We therefore need to ensure that the version values remain distinct and
do not collide across different core architectures.

Regards,
Loic

