Return-Path: <linux-media+bounces-58161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNezJUDF1GmmxAcAu9opvQ
	(envelope-from <linux-media+bounces-58161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 10:50:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7669F3AB84D
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 10:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D65FF300132A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 08:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33C939A072;
	Tue,  7 Apr 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdbOLc5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfbKYmVv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516AF39A7F5
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551795; cv=pass; b=P2O0bOKX0xJv84XATEB4rI+laAM+06uBRcW7+69hz7gFuuwJFcyyDIy+rJ1sD8/8JAICliO8x4JfT4aTOdrsWru1FYs+MGQmAXJ9Yy44vuhJlSHERf66vw8W7UzYTtSFNx5VvKinYH74bPK0qu5brIQXhqshqD46FRUvMgxAxtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551795; c=relaxed/simple;
	bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2cfOPzgpZZ5QgUb+bh6ywUHKDmQVHqvI6xzQ5IMZ23pnn3pwHOJNf6vxALzpFygW4XGqLYuxrsRy3u69GA8xOogb7KiVYGFy1pgLnXIVMsBe/MQXRO38OUU3CbwGStv55UAZ+uFkIzmKqzQgbnRZwO7mwNQtEiKCRD9MuvsBI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdbOLc5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfbKYmVv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Xjj02580035
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 08:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=; b=MdbOLc5zLAj19UPp
	m5kpftOJvLh9rjER9uhttYGUSnIEhaQtobEFF0qGCxJwYm+w20HSi8QP5Yj6Ctje
	OGBTLe38qT2e/iY4By/TCazeCne19HbVCRf/Fd6kAftoXVRzTkDiUYF+t85BiQER
	N+e3F3+ixjAYyffcgHUhQK5pIQh/Hd8IARgCO8yzG7qm8L0zq5SjcNN88uRt5IGd
	Zv98/k8mLaGsb/VbFhDJcq+3JiVgNaxsnh1+3OOyrt+5Nv0cZyHyxEUO3zY82wPZ
	/A6DDKxqf0hB/4TGtOzv1GctE1Jf+8z61iECz9cFdHV0Wak+15GQDbYc56yix85H
	1N/DRA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf1w9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 08:49:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ac566014e0so15397756d6.2
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 01:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551790; cv=none;
        d=google.com; s=arc-20240605;
        b=FlbbDGRGFsUQ/GSPFaN9MP4mp1swl6/NrUNdDI6vQplR8ThNPV7sSGFhnlm3alZyXX
         6GNEekUfYvgYhOouzp5Rq+FtchZOpmEqnbsmKAkS90skPCGFpL68H84KQDvTyD7/7g2R
         UthzjDgKEPc7DFBhdvCUlSlkUbsNUemoPVXPR2IrJFeBoy6k8SynqsUdS5RfIIIiU5l8
         BM0cqqJqAazyrz+ovibHfuOKzdv5jJB9JuXswTwRwcoVPYQHw4l8ZffnaqEO0PIXdapC
         d8ecMPFuPAGDsxVLBC0DO8nyGUcsp0LqY5NaO5dkxwTVlDK4YMvXfkbf7V5AnuiTDaxX
         zYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
        fh=gJTrArQAxwbAJOr5dgSdG2T5H1uwCXtaLBIduCgqdFI=;
        b=LkqeKSpeaX+/D0MYk6cAQU2LaiSitkKOgPkBoYgFkTg/M70jaJpPs9hIqY+QzP0Gxp
         tJDYJI3DliLbqT0nuFha0iPS5cBRR1TgESErEzcYPwPJSeeGQZFESCgIYBcKAIyIUUZ3
         tge2zhXQbXGunIxQ+037UrS0W8zcXo573618PUKooWUSJKdBZ0rekZSR4tdO0RBc6iF2
         41z2d1rqeLJYXDRVcBFI7aa5l/atK0cRcuNc+exuv4oPc422fXrxF5uN8yzz9KaeRO+l
         yih5mq266ZcE7/vAXuYSmEJFgl1a7+tAxilIGDCgBzPi+eH9CAScZhwPGfkO25fkVdf0
         8qrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775551790; x=1776156590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
        b=NfbKYmVvRJuzewRCssCYpA2v49NfT603B2hKb90+QuMTICVMEGgx1YJP2RO4I7bWnt
         76ckGDefQn4lLaR2IYSgf0o/bJZumt1tbTlNRLixM9wyRhp/0CRHWSNwmIkrrXarAfNP
         I2ckH0RfxkwEQAS0OXl/WETQNsMuuy0db+PZ/pMVv9AX1melYPmmnauud4Cx0ZJy1apY
         GeMvMFja7ekQmEeT1jezcvCPCvW4z/gJfk5yrHhUFEAbHYLUPK2UGdAsI4JIOlb+Y9ve
         8HekBZvRSYXypRNvaAs29fAT5HNt3r3DsoSbtFZkI9+rAHDSxLVrdZKjgCrV93vAe4T0
         IzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551790; x=1776156590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+LHVYfCEF6dTMGNg7i1pUqmoBnUbKwZAxxQ6dUcl2Q=;
        b=oJ7zMJ186cV/GEZ3zMEH04bpE/C88x/X8rzrzdKrko48e22bCWl/4LZ8XvPeKZwDOo
         Fe9Eh21790JeAQxSwJuIqT8wZNIRLA5uSMQgSb3X034HVW1XXutwhkai47xnr+KSx11+
         eFXHlBPRgCiCpZqtFyE9699GhvtJNs9lRgf0dhKtnLqpA+x4WkNV7EGDGEvjRtQXuyre
         CPfzS83TbLrJuzVXx29Be7hsCRT7w5/ts0LB+K83w9tqJszH9TfS+6IC9dR7uwty3A4+
         ggohqTUO/duIuOmF8bttA6BQnPn8o2XMZJR4TbcJBVTKVemMQ4Lkszmk1dknT99eC2qM
         lHRw==
X-Forwarded-Encrypted: i=1; AJvYcCVVT7Bd8C0Hger7MgS0uSpxCizi9jBN9z14oKiVls//Mkw3WdBiKE4YY+N7phOQ8oVfykDOHROjV+Ij5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy39CLmD3pagPaJSy5rx/EDXm8vdgGAvlsL6Yutx4NrfSO+YPR
	MpIndRNG7Ca3xn/z0WdBzvR7uQc0s0uhHv2o5tCFq84QW59XMoYRXqtzRGeK6fm8j7IHa4oQ+a/
	48cKVKm7TnC+zaT4ioQEFJi432biQI5G+1LLM41sgYt/9xrDuNW7fZ9zfMyE0NTjeq5S/6B0hao
	fG7/R0Uq0IhzTj3ZxFyFHlkKqSTryzlL9xcYvrp3rd
X-Gm-Gg: AeBDieuXx5In8yKL0QmUFqB556CLtcYRXq/9HA9JgtwpW8odf2j5/qnWBauWuCcBbft
	+z1fnTV0DSuadnMzpii1Qv7Gvm2R8W7Ri55a58RXZV/3xAHAvzF+wHkUpUFLodX8zjU+qxR7FUc
	7ul2joRJlFRWFEq/96XES16gHlz3BWc2ZzJxgGJ4nFMYLB222tZXiZcB6Vgvq7D79tfw/WNe1uV
	wgpPpKa4fIV7ZZefaG7sXxLPDIOwQGhpQC7aC4=
X-Received: by 2002:a05:6214:449e:b0:8a0:f8b7:3920 with SMTP id 6a1803df08f44-8a7042f9535mr250042706d6.42.1775551790316;
        Tue, 07 Apr 2026 01:49:50 -0700 (PDT)
X-Received: by 2002:a05:6214:449e:b0:8a0:f8b7:3920 with SMTP id
 6a1803df08f44-8a7042f9535mr250042566d6.42.1775551789922; Tue, 07 Apr 2026
 01:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com> <5812c794-fd2c-4b49-8146-db6a1c783706@linaro.org>
In-Reply-To: <5812c794-fd2c-4b49-8146-db6a1c783706@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:49:38 +0200
X-Gm-Features: AQROBzCpWYOJa5sXQkGSrLbu31jfSpOfrZncCXLAJtn4ZOEzUaxAxKjCkAz4-nI
Message-ID: <CAFEp6-1HVph_+278jXCb-G-XDc=Bg1X0y9hSq79qr6WG+nJ3bQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various CSIDs
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA3OSBTYWx0ZWRfX18s11Tm2EwT6
 XnOEqAMMNgGFzhe42Dy5v9l5aejV/rLJ4eGHPFAl6DW6y6beyNy5nt4+NYB7IG4Lie3ilXUfXuY
 j+Fvi6YK6Qo7Bba+AVyhudren713mxtt4DfKqzl32XedHIvSt6KgH37FIbu4TlrkREMuHLCpIzd
 M6GmE+FDuztdThr/iWmKNUlPpFCaFbdc5tPe+cD1R3N43oC1+T913hogCxDTdKDZ6HzscD0wF4q
 9sO9M1M/2pbbdXu/cvqbTwnDDmIl+lE52LCwos2ztOdJocPlenr4zStepMshsnYOtL4UeDor40f
 gPptIrDu44C3iMTxSifWEh8OWKgNTCrbGOE01tLpbohjjWQINBxYoJSdU3KudjW4gYX8YFXFSZn
 OQVrElAxd9QaSj109+NpRQu1fUqusNs/b0HD6JgXx/F1H+GrLLqLl7ejqwR3wZ/i+PrSlLZPMe3
 +koboShN4tdzOOhGHIQ==
X-Proofpoint-ORIG-GUID: sDLyJ2oRaDYqSXRVvZu80LEI0DuO8Ro-
X-Proofpoint-GUID: sDLyJ2oRaDYqSXRVvZu80LEI0DuO8Ro-
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4c52e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=pT3TQp1K7lpw5WBvr8YA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58161-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7669F3AB84D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 10:36=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/04/2026 09:16, Loic Poulain wrote:
> > I agree with the observation and conclusion that proper PORT and VC
> > support is needed. However, as things stand today, this mechanism is
> > also a convenient API for leveraging different virtual channels.
> > Concretely, if you want to receive data from both VC0 and VC1, you can
> > simply use RDI0 and RDI1. Changing this behavior would effectively
> > break that usage model, leaving us only able to retrieve VC0 data,
> > which feels like a regression to me. The more compelling use case, in
> > my view, is the ability to stream different VCs in parallel, rather
> > than streaming VC0 multiple times?
> >
> > This then brings us to the Pix interface, where streaming something
> > like VC3 does not really make sense. In the current csid-340 series
> > [1], I therefore took a simpler approach/workaround of forcing the
> > main channel (VC0) for the Pix interface.
> >
> > [1]https://lore.kernel.org/linux-media/20260313131750.187518-4-
> > loic.poulain@oss.qualcomm.com
>
> I thought about that however, there are no upstream sensors driving more
> than once VC right now.
>
> So this really is a bugfix. You can even see it in the original commit
> message for this feature, imx412 was used in the example but imx412
> doesn't support multiple VCs.

Okay, then that does reduce the usefulness somewhat... Another point I
hadn=E2=80=99t initially considered is that we may also want to support
different data types on the same VC. For example, metadata, stats, and
image data could be transmitted over the same VC/stream? That seems
like a valid use case enabled by your fix, and it might be worth
explicitly mentioning it.

>
> This is a pure bugfix and now that you draw my attention to it, I think
> you should update your series.

Yes, I'll consider this in the next version.

Regards,
Loic

