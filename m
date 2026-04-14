Return-Path: <linux-media+bounces-58749-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJxLO/dc3mlfCQAAu9opvQ
	(envelope-from <linux-media+bounces-58749-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:27:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 697FA3FBCB5
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12FFB308C18A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D393E95BC;
	Tue, 14 Apr 2026 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4OR15BY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBaTD+kT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8608358375
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180189; cv=none; b=gXMOaFc4qrV9k/B/vGjJYPLAycEQK2/m3frHA1BOrmbobnMz877wNfJEPUAYmKk69AgISWdXSTAw4aU4QAveZrCXMz3tZSeSGESS2ncsrrebUvl3IS9we8FYgxuqg2BTOuomMo0T7+T/92BF5SiXaYDUMxB4Cyiyh0w9IzKbPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180189; c=relaxed/simple;
	bh=YVhjTvXHuSPVIRlL0H/IfiEgu8exSYm/iuSPi/1/0QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu0fJNgyADXIEt+qr1n2I59ZGpTo5UKaxU9LPHpa0ahER79IfP0mE53rTHjbUQGssl4Qz6ImYVv14f9PqOW6pH/QFSjuoP9yL15lJOXTIvOXGcz2fa31v6l7u6KdkJ/DwziqNRKib5gS6ZH/q3ZbuX6T0UaS1CdMXAXvNEKRutQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4OR15BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBaTD+kT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBSlIO3424949
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y9wbisI+nGNtkqqokTeJEVlq
	dPP903JLL6TnQpDpxaA=; b=D4OR15BYyfbtWujqwtpPY6qqw1bw8wAatyKjfdd3
	NH6J7SKSFmJaaXHrW92xrOzteWeX0ND6ObId5lIllTGHjInFMGJjqKxik/XFB+t8
	ErOwXQw4IAIvVXF4GHHFERWM5moNG7b9Cjn0UWln8LwOwPywqw+Vt+yXYudFnwzR
	GNKYW+TjzWFeuYkpVcB/gnIAPy+IGO7lbVe7v7yw+M5WcjTZqf7PMrNnoh5/sbAK
	uwLwYn0uNIarkPJe2SFFyyq9DBdno+xefFx0mzfK60m4RsFjFTFe5wywfWY68vIL
	QCoyoZhFH0ktKMYFNNvNuxM/UsgRbp+wjYPzjoZjsi2GHw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fbb0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:23:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6054a2563adso3620107137.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776180187; x=1776784987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9wbisI+nGNtkqqokTeJEVlqdPP903JLL6TnQpDpxaA=;
        b=JBaTD+kTxgX5/ZktuS+xeQWmIKGpksU4t5bCa6x694tFk3gisZQOyJOkzZFooUHqaR
         DZyzNaUpH8UccMtDuuDWW/LKeglBeIxCNsf7d/aKAv4lb2y4JxDlmZgqt6cnFI0DLSSF
         kuIg/UZny5njmSV6d2KLkuyWXpyuGQKEOXeERFZ5Fn66X/A3nCmWw9dBPIbBMc96LjSN
         PWq/BDXKbClrAc9peyaFfLIoNITeUqrsJ8B73S1RXigmeH7HsHGjOfeJYutY+Mhe5IGD
         zg02Yt39wkws3Ynm0wA2qL8qBgGAPUuCrdykMfxb+jJtPq+89ISANpHD98/3TnI7+YOl
         ygUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180187; x=1776784987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9wbisI+nGNtkqqokTeJEVlqdPP903JLL6TnQpDpxaA=;
        b=bNrO6mCKMlHLtzpLFiqC5y+Ik3IqbsTIbaG58afKKOKkl7RmGo7MK5upbejrIFGQEp
         L7lzgXyuH59t/bR4ga73cOA4RZA1tGm5JzTfez42aZPX5QAlX7SmTaZSnPpb5/elIwNP
         fM/h4h2Yq8thBIHxYF5CwVCVElcdJWhoEMD+G6baPe2SiHvB7Q3ZFXqyjNamWVaQNBlK
         T9LSCY/zhUpmDGLkzgCzcWXF03K9IYq/InrrULomHiWxJmr30g/nG7tpP1VJMsd6oZsp
         3qZwehaUNJ32oq0MJgQtYCrQvOqmTIWTgwvZ2x819GAUfKpUC1hBB//+SU50UdkU+Km9
         Qm+g==
X-Forwarded-Encrypted: i=1; AFNElJ9wi+tqnklvgjK6vK4wYqqkvsQ7G88EgS5gKRXUnEaIsxLOKr2i6UBS8VtcN3VtGxh4q8G9js+74puJ8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywat46I/dsAsxz1xr1Z81FdIHxHcAko/PE7w3QL4NMpxQT/HQr7
	zzZlfUij2NFF4ms0YVZlF75VDtoJ4aPSUC6k49UOSgI1cj66TSerZrNQOpkLBpODqLqWIqWtI/b
	1cVyluTJaaVZMROZw0w75ht6jWiL4Ea7ZAOql0UOGlAM5j2I20g0Ex1U4az7/kAk3hw==
X-Gm-Gg: AeBDieuqdSUf6BENChvxK3A7kV9TRuyjrhx1TFnyFn8kLFxs2l0Ait50ehamCqwMAbA
	io5U4ICVZ1hu59n/9MNQW4FZvS6OS8D6ZIizmR6Wxykf0IUKsjDqjXBYuQJ1KBCrUHnYcRNoeNk
	Z+C0qwrYTyTGgIHR6trf06E9b5/y7km1LLdii9qRhn7PgRr3tywFjCJnU1bAW97wFsgd2IhRUMR
	Yf51o1n8qRun+ohMVnJr/Sei+PQpQNmyTZAo+2yRN+YAWgtx96+eaKUUAGfiqRjXlm3bi9VEh3c
	Bykv/55JRP/ToPV9OaTQS04XABbb9pkZn8Le420EHUHM52RCt3CZ7Z69YS1eNzuwE8bwxwn4mr8
	JcUWuRBWSCH/4/GUFkn2nMjTUwfaiSgGYiWj6xjqWPWsR/ieregYKVAr3fBdt/uRRT1Q5Vj+/4B
	d6+qMFSdBBR5Fst9IPDHylDzZqw7AwEYB5752KwAcu/q3DLg==
X-Received: by 2002:a05:6102:3e04:b0:605:1f22:10f1 with SMTP id ada2fe7eead31-609ff5dbfe9mr9259903137.13.1776180186945;
        Tue, 14 Apr 2026 08:23:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3e04:b0:605:1f22:10f1 with SMTP id ada2fe7eead31-609ff5dbfe9mr9259845137.13.1776180186461;
        Tue, 14 Apr 2026 08:23:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e8467114esm10716141fa.34.2026.04.14.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:23:05 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:23:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
Message-ID: <7lfcntx7axffy7seg3w2hstomzba2hwnvo4rfb6l7d6ki3z6q7@pt66xxbbvrl6>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0NCBTYWx0ZWRfX8VinqW4As8Pe
 DXJ2CPnLTDBx590ML1+WSwYwT7pT2b7FWWFWV05dk8QmRY/kpf6dVAYKs6Q+6FyzHTpKrTzYEbF
 lnN6D8h5YHpSeXCL9f/WIPnj++yHYLYu9vNetb4VRfHUiq0eA3RSiWuJzPMC2wtuIIS589wrQAW
 btv3mf1/gEpIj2uxiJoqDV0Wte8TKouKm0vhRnKHFRH2Z4thWIFOvKCqojpW7TwWgLtsaWdFjCs
 RsW0+DXAIY6PXa5GWEh3Q75oBs5RkfVY3PVyeZSql9dP1gPaEtOwoN9+DtBqfdT5uAOqkJLJuMQ
 hzZql98fAASwqlKfqqkdaNHwVNjGLkLzFoDw0jyAxbocSu1c7S/j+JMTzvpLz4V7HJPTpXraI4i
 faz8V6IQGNC7Ba2TBvmDh4ufLhBYw2+Cz1oX59NX1Vwx4ckFOjZo0FSa1THAMkY197ZKMPbXPIo
 MYHZBSXJ1UELY8pprUg==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de5bdc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=57hCUadNtg4o-QVSfuQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: PknUnuUSz2ljLryPpUGs68WCuflwa5om
X-Proofpoint-ORIG-GUID: PknUnuUSz2ljLryPpUGs68WCuflwa5om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140144
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
	TAGGED_FROM(0.00)[bounces-58749-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 697FA3FBCB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:04AM +0530, Vishnu Reddy wrote:
> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
> existing code where ever is possible. add vcodec1 power on and off code
> separately which has different power domains and clocks.

You need to describe, what vcodec1 is and what are the requirements. Is
it supposed to be brought up together with the vcodec0 or is it a
separate entity?

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>  4 files changed, 140 insertions(+)
> 

-- 
With best wishes
Dmitry

