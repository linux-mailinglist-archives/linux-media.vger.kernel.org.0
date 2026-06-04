Return-Path: <linux-media+bounces-63826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G1KYLhinIWqjKgEAu9opvQ
	(envelope-from <linux-media+bounces-63826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:26:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB4641CFE
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:26:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OLUhXK30;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SePx2i3i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63826-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63826-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAE53319A59F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 16:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FA040629D;
	Thu,  4 Jun 2026 16:10:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D229827E
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 16:10:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589431; cv=none; b=bLU5C+7o251f6U4IgUVRGIOHZEYYsSSfcfsNLe3K1xmKWK7TxFH0AU0NS0fCjNc+bOSXUM+AkZg/VG1UQJompwGYRu4cIIqKVvC/AqCZO1pkSsJBXHawSpsHmqV/5hpwksj3wypZEJA2CFLlXrDTvCb6dR0iNit+ex5Tzi0P3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589431; c=relaxed/simple;
	bh=If0OESBCReNUYpJqn20IcHKO5ke2Vw7Nimz8q//Qmv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRaqfF4jL4V1fsd+tzV23HYeYuWbHKF/O3Yqf7AX8oRQ8Ug9fpf/QdFiVwrSB9cQ1JaLhBToaczCc2noBaNMmCk2PoGlOZr38wJuaTsq4mYqF7szNvlAsVfnPEvkMCn8HPmuGhmNNHMKxkJhLIWinBi2qd+piIf0v+duBBuGnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLUhXK30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SePx2i3i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654B3d2c994547
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 16:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeMRJDCQY83lNXXkwFNAye2a
	Lcac1O6JbkIjmAjjFKk=; b=OLUhXK30beS50RPLiM3dr/ppd4XXs1mcrm0qbFtp
	URKwTA5UCkyA+l5Qqcz4GTAuI7xvO06qsVyKfuM5rtf7m9QRk2N3rT2Zht2XP/aH
	FNX4pV9AksqQsqfATOyU/2D3+HscZiuNzZnhzdtWV4vB+Y1ZQdZbJPYiV5OQ06s7
	hMV96SnhDxEng4rNZwfOvm6dePsdhGoIAqRPXDx27PMz3gYM7l4UV0CdtS3c7yaC
	BHe5SFyx9SyMppYAqt0a4TID97erKNj5K+YS1CxD6IkTDGJfXY+7nI19CMEIbtJs
	lAbByvBLNh2m7HiIva7hWn/JXtrGgM5FxRQzmUea2AFKrg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374tjv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 16:10:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c40601e2b2so1115772137.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589428; x=1781194228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CeMRJDCQY83lNXXkwFNAye2aLcac1O6JbkIjmAjjFKk=;
        b=SePx2i3ieauxVZ0NraNdkza2bVxilid5jAeYws1hQk3q1J+RH6y3rqxtO0PVjgDU1N
         ELZpET8ak03VzuVksQejZa5jsqscjr5Xs6sJy1nfcw6nfPIq5kGO1anImxW6mxEiSPT9
         BwmFQkDKvIwnVBmpwQadVphN7bWfc59Sd1SPp02IIsANk10m2ygYlt37QA5gL8t2sUS6
         S9RZ+VT7x0OyX+jNzmshh9/K6TQ5KYYleKc1/TB372OBz4FLbgluQ4BOEL/7Klg4RYa+
         rvzDxABcpje23NBY+Pjzfs152GHw50zIHmKfVNSVL6QUr/aZXf+6tZL3yeHvHApm/WQ/
         l0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589428; x=1781194228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeMRJDCQY83lNXXkwFNAye2aLcac1O6JbkIjmAjjFKk=;
        b=ZTKEFEQDF0pMIVuoEG8q6xwHTn5bAvCTQWWl24kh0Om5GwWuQuRlFzMIdY4SmugFqh
         bf1Ss+wZ+Jq5ayUqQO/eg/3Cb6wCFs/br9ZqlpYsTRxqYodJRmbokmmL0OKv2jhkkoLq
         w+Wai4HRb9jCdhrQD6t1cU8FaEb0/v8+dSsYmY8bQoy28Fd1qAdc0c0dQ6OoJzEWJtLy
         loF/F9gVaoOZYCH3rv3LONFbGDtQv0qPaiQSL4FfgGW2+YKyJyezIjSV/4WfP/lobB94
         d+8ei0LIVYAC62kbZq/NZ8kHlUNx65cRzdNAp1SiyufcR6r4UhZ15tasp8ND9eqP6990
         9q9A==
X-Forwarded-Encrypted: i=1; AFNElJ+sVoGr5N+MUIBLXgF4YndtiBqf4g3n7d5A2ONcBtp3M6hHqvqrlybhN6Fbteb0tAVpmgkRChZLLKox8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbt5YpqgMV5IoL0aSE+9NMSlAMM/Zh2hxmdG/Cq7aUkr6CkDG6
	6cK41+mSO7LaWho/pEueLtiSoqQ2/PmT0J0kOmIl/NaV01tY2O2E9Fww+/ECCDM4RT0FUvFJomn
	zMHsDJEsHqQTMrdSD++QTTqsPihWE1eYFlypVWqH8ef6dYKehXp4S2OID4k1putRMXQ==
X-Gm-Gg: Acq92OE1TZdZMxOelA3ISphCUUMpeo+gfF268JbM1WljEgHtOa3n+uKOvJ78NLgnadD
	JggblNbQiHzrVokUB3w1rdL/xd8eB0tOGeE5jqa8MJ7ioA1M9iGJhYS12vf3Wkv/Pq08N1lSJRv
	IkVJoyQjwsGmclhipvrfjT3xHi0sNlpuTrvvBRO7aJKu4mt+0RGJKS3S3z9XcW4h9/f22zelNIt
	Q55uG1xcnErwOk5KqSvqCDeg7IOgsxnUE4q/w+z0AXp4jehN9IkbiEq8A6xNcRrmlpnOiV73KM3
	w8N2pQWLlFOIY+IV7q0xqLrdRnS2/O/ZJ7+MuzNlphqQcfsgbLCUSCnqlfZkl7ORp618+mX93ZA
	TCsbN8t63TEIfptVGo3uIJb0A+hOaRMKVGbRtqrjV1dOCJsM1c/frHZatAlWQWvndtl6fr8SBi/
	DqfveYBG7lob/g0CHHHTGT7Jsgbm1fKyIh6XwsOWSUEkcPWg==
X-Received: by 2002:a05:6102:510f:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6ec53921cbemr5468262137.4.1780589428645;
        Thu, 04 Jun 2026 09:10:28 -0700 (PDT)
X-Received: by 2002:a05:6102:510f:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-6ec53921cbemr5468225137.4.1780589428228;
        Thu, 04 Jun 2026 09:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm18215101fa.22.2026.06.04.09.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:10:26 -0700 (PDT)
Date: Thu, 4 Jun 2026 19:10:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <v5dbtuys3oojjmmpce4j46mgbegacs5ngtjrszvhz47fjjshbs@d4gotpult7p6>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
 <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
 <a17e8272-b8c9-e6b6-6f5f-adf3f0f91424@oss.qualcomm.com>
 <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-iGUTQXDwv82wFFK24QU_oAgyyu3JMeq8V9nMKTafEPcC_McchQEW7T7npIOkggJPXY_K6SogruAf5pZtqG26-WyaGN7ItBR-J_9CGOHH1o=@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1OCBTYWx0ZWRfXyHcT+2aksQ6Z
 9yef+A+ZoTWQpb2u6nhWqY9gHFTKl5z7FjMgYt/IzhmRfGQEyfOzMb8XrC6ryPFdix6yIoXnKmr
 yuRFLP2QBIL7mZQQPnxyS1+csotivcZDuK7/0cDkC0CE0dxrpr+re09JbIWLVq9rhPWdwsAUqyV
 dxg7afgC46ftzkulGIkWbxA8ScH6wDER9r6pNBLdGdpzOX5N/xzyWdcicDxCGPZslhuVzrac3rU
 /kS76L6+KH1jypgHwh2j9jU3y9zHfuugUoZBGTCbsjx4fyE1Yi5l9opeUTF1xDDFtGUThLN8DOI
 zeJJmRhRYv/UHmQ7Ea/Jx+IZQSqE07lbTFxibQc16lzDuJaci+tY3CkqLDu9+zLkkckvsXoFDSn
 6IQ2TkUBBw0M1eI2IcCkxJcBfgW+e+KN+CgJiXFuEUjG9v8KeOBcymDQcSk/eiBA1x4tw3/QWqT
 g5zUg9gY9KHeQz8xERQ==
X-Proofpoint-GUID: PC1eaLVl3Q1m_HTLoJWKnCx3atqU7Atc
X-Proofpoint-ORIG-GUID: PC1eaLVl3Q1m_HTLoJWKnCx3atqU7Atc
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a21a375 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dEnjAziRAYfcju0Vu8kA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63826-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:busanna.reddy@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,d4gotpult7p6:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FDB4641CFE

On Thu, Jun 04, 2026 at 02:04:42PM +0000, Alexander Koskovich wrote:
> On Thursday, June 4th, 2026 at 8:16 AM, Vishnu Reddy <busanna.reddy@oss.qualcomm.com> wrote:
> 
> > 
> > On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> > > Add support for the Milos Iris codec. This only supports the variant
> > > found on the SM7635-AB that has half of it's pipes disabled via efuse.
> >
> > This patch appears to be based on an older codebase. There are changes already
> > merged in this file prior to your submission. Please work on latest code base.
> 
> I rebased on top of 7.1.0-rc5 before submitting, should I rebase on linux-next
> instead?

YEs, please. You are basically past one cycle of the changes.

-- 
With best wishes
Dmitry

