Return-Path: <linux-media+bounces-58142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEETCulq1GletwcAu9opvQ
	(envelope-from <linux-media+bounces-58142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 04:24:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C23A900B
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 04:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ED93301A2A3
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 02:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2545434F48C;
	Tue,  7 Apr 2026 02:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADy0X4dv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1kX28w2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C699B346E47
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 02:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775528673; cv=none; b=tntYEieJijvvjY/hh4q14E1kU5Y5o2pI9BeW+S8xo+AK8mOyLW+A7ZDw8zsMMe6k5sJENlowHlxnQMLLWEvMDcj0jnXkeSouiBTOZza30NQ1GLKx4b7o3/XSAMgGVmHpkZPnPm7BnJAouVAYtlES07GAHFQgR+zwP7p6gRn8BR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775528673; c=relaxed/simple;
	bh=KijQALmnYX9VpomzopNDAuVFQAIWwRIxT8N8Fh6sApk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGDmDD/9Y85tqVNQe9O5rHZq+GpkKyWsru/5jnMU2WkzQXgs8fdoX91UoO+gBuqwhFhTYrVvcfsPbHJc5nWb+SLS5G5g1jAxE813qqCU6U24Kv8fZT4EMbMmXz+UuFWR+XQr/D/08JPuNxsbpgaK4OfUerz/jbsf4D4DQoyM62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADy0X4dv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1kX28w2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LPhVw3815569
	for <linux-media@vger.kernel.org>; Tue, 7 Apr 2026 02:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyWqR1mWSJPmUBhLv4gRbUaHJ0QYjDvqk1t65d2IXGA=; b=ADy0X4dv0PGH9JxS
	Ylcnwd1p/J23Y0VBiT5edE/V8fBKwbutXrubY4z2TIXTaNiU9zKklbmWslIgyTww
	KekNqHBzCmeUYJfLHFzRaC2HLc/Kd4Wy1mvA119JjnYQk1nj2zVAJZxL8LAK3Vk7
	a2qTDM3xHEILq329GHM5fSRNbiuvZoRdORn9av0MbIudAE+/4K+yTuj21BJo5hex
	GlE/dOm2y2wVwubJjbLgCRZcLSyS/kUOzNObjnTb3a0NOCXnDdSMhVNEm2z44PF9
	m5GXM2PELkXz+zXugnSSoRcRqMsr1lj6JEdBtQk36XJ4AOeQx8xIgFeGcUofvDur
	GvVPhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4rmwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 02:24:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so2507937a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775528669; x=1776133469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyWqR1mWSJPmUBhLv4gRbUaHJ0QYjDvqk1t65d2IXGA=;
        b=X1kX28w2T907F2kHwVs8vY5FC9bOgBytgwdqqzXbEOgt+A9CeGmODyBoZf5ZtZHQuT
         NDtsxyb95/FtCOfhPZf024gd+6iMk20Tk8M5TQbNfI4t/WoEpUxc6Oz7zfO/lddq4lJl
         VjGzNo1mK5z1Wj+O1CiU/lx5rh5GkzGJlhW++yvk9dkw4iRCeHTnHmIAhq3uHDdD5tVA
         z2U8YC8Lz4DZ+wk91FKSU5BC2Mo/zUF35h744X4xpZ6PMnXUXL8+K0qcXfL+XmzI3fOM
         v7XPBgcIUzvLItMjgzp2Zms1AS8893bLezpaVuBDCGOp5+z/1UV4xIg90w1Gwf2LTQOP
         hGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775528669; x=1776133469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyWqR1mWSJPmUBhLv4gRbUaHJ0QYjDvqk1t65d2IXGA=;
        b=m8Q9tz2Zah1aaz+I242koJtFOwrHdiP8mR2nzbdJ8dqdBeUQH/ViWYWIKiq+M2kY9s
         humZ+E474ihqar07PIhNSg4Tec1DSBBmhdW+DEd3CKPeN8kFx+ML47d3uwo8TEKCTHGq
         FqKx987b3QbhFh8vTGzaLQdjIbFARioNJa+h+j4wmjDaGVCfNeY+vzlpsPzNBXDh01Qr
         3tgWluWM2Cq/jojBKmdgR1gAr/CERH9kA+9T9naTwSAKy20sOHZ/5hW96mHM/zkj6srP
         MokxVEKnUccx7sxkT9MVVhiqfpPrFSYqZSYXgQWV2D0gawDbU4JGDb/eTtOx3csOTgvF
         80fA==
X-Gm-Message-State: AOJu0Yx9sCi+C8kTueAcUqVWV+7l44TxbGOKjxVGiAKB5jT3vzyCnyX2
	WEp+iHoryrlIcxqFIe9I6suHu9mYD9xEeNLzI/HhpUe+luaqYagR3V3X1W4i4NU1b0e7Wa2f3H+
	exmYPMVzfmTTqnLtW/Mmp8v9Mz/ucLT7ejiRpSrD8abSo5ZaAfmX9CBWzhibAeD6YNw==
X-Gm-Gg: AeBDietfVJPOfVKEVdXSTAK6NAknufi+RYJmC3OSpIWEc/viM3mFwGSmn3hiQvJabqr
	UYSFA5Qc7xHd9AhtF6v3RxKbYful7HO0QUBlI1LFfk/k2H4e8yLNWHnl4qsN+RdmvpYpPQAuY5g
	JNMIbNgfmE5iK3rKDGWdJDQAFMQbrgVWYQE3BxxM82IDyYGmGRJ2a9zCVY6J95ONBXJ6n+4BkfR
	KcjYHjGJsvW4Q2FEloHHMalRXtr8XP3KvuxcCvxtElvvvJssqJKR3Jk8XtZx8U1R8zeKPrSmr2d
	BXJ/KyAKK+3EPEjTA/wmhT7+YPg1+kfuFmaBOfkkxJ2+4p0IqFxnYWbdNJl3WLREjvMBbFXrLrl
	sV2HUjeEyfoandz/tpkA52E9YHRYTvJ/kut6KqTndKL58UUp7K3tpIjUvBGAUcyE0olYLix+t9w
	H/NVO4qM43xuXqT4jl
X-Received: by 2002:a05:6a20:a111:b0:39b:da1e:3fad with SMTP id adf61e73a8af0-39f16f3d1dbmr15419897637.9.1775528669396;
        Mon, 06 Apr 2026 19:24:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:a111:b0:39b:da1e:3fad with SMTP id adf61e73a8af0-39f16f3d1dbmr15419871637.9.1775528668871;
        Mon, 06 Apr 2026 19:24:28 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6476119sm15455243a12.4.2026.04.06.19.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:24:28 -0700 (PDT)
Message-ID: <4d5b49c4-7142-48e9-af47-f996f10346f0@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:24:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: qcom: camss: csid: Rename en_vc to en_port
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <20260406-camss-rdi-fix-v1-5-d3f8b12473d0@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260406-camss-rdi-fix-v1-5-d3f8b12473d0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d46ade cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=1FwFdbLlwGuMXyfPU3wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a00XYoVizbonwBfcMeJylkdSsCvLQD8_
X-Proofpoint-ORIG-GUID: a00XYoVizbonwBfcMeJylkdSsCvLQD8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMSBTYWx0ZWRfX5zqRreQaSvfn
 bxvdiLIvR3WdvaK3yWAaIvwqAwewPQIe0pbaeugVVy2RLpCX48VTOi674VSpn08g3rNQNy49DWx
 m811I0P8NFpBVJmxm/ySTxMfZCizgMOEbR/KnxhhMBTVEJGMwsI7qDcp9HmjBfLcWRptUxU4qeH
 ftoEA2LbUqTO2zYVc0mIHE6s/TX9gfoqfz4lDorAg4LVkaG7e2QwpAU1e9QqOwkcypnvqydLUta
 f+2j7sjljOXnMnkbDDa6jOa9HD/rXCWNM5x8A6DXS0+6MA+vEMQjNFXhFhrik0yosr47e3dAwP9
 U18Gwqh0wuVBN20D8JIcra73BoUgXhrK9vLFU/zJdsm08yfJsctAabMexNqB/7dDKQCYEn30zEC
 ZtGMiLJv042q8wRU2nqo382nnjAUBGdyGsWQoqgto2qGg9TphUkPg2ANpDaRftQH8x+TNMFKS8Y
 N0R/8bRCg1KyaYCqOcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070021
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58142-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 937C23A900B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 5:55 AM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The en_vc mask has always also been an en_port mask. Name the variable for
> what it does a bitmask of ports. When implementing v4l2 subdev streams it
> probably makes more sense to have tuples for port/vc mappings. Such a
> change right now feels like putting the cart before the horse.
> 
> Sanitise the name in the interregnum.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-340.c  |  2 +-
>   drivers/media/platform/qcom/camss/camss-csid-680.c  |  2 +-
>   drivers/media/platform/qcom/camss/camss-csid-gen2.c |  4 ++--
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c |  6 +++---
>   drivers/media/platform/qcom/camss/camss-csid.c      | 10 +++++-----
>   drivers/media/platform/qcom/camss/camss-csid.h      |  2 +-
>   6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 5a7271785ec7a..da5e03b340bb7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -119,7 +119,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   	__csid_configure_rx(csid, &csid->phy);
>   
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> index 35a6bb209f97c..80d8bcd6e0854 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -292,7 +292,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   
>          /* Loop through all enabled VCs and configure stream for each */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_configure_rx(csid, &csid->phy, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 331feed199094..e2d14b25f8c85 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -328,7 +328,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   	u8 i;
>   	/* Loop through all enabled VCs and configure stream for each */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			if (tg->enabled)
>   				__csid_configure_testgen(csid, enable, i, 0);
>   
> @@ -369,7 +369,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   
>   	/* Read and clear IRQ status for each enabled RDI channel */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>   			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>   		}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 73504c349fd0b..b92234ba84efc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -215,7 +215,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   
>   	/* Loop through all enabled VCs and configure stream for each */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_configure_rx(csid, &csid->phy, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
> @@ -263,7 +263,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   
>   	/* Read and clear IRQ status for each enabled RDI channel */
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>   			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>   
> @@ -309,7 +309,7 @@ static int csid_reset(struct csid_device *csid)
>   	writel(1, csid->base + CSID_TOP_IRQ_MASK);
>   
>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -		if (csid->phy.en_vc & BIT(i)) {
> +		if (csid->phy.en_port & BIT(i)) {
>   			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>   			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>   			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index ed1820488c987..71a40c2cb350b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1278,21 +1278,21 @@ static int csid_link_setup(struct media_entity *entity,
>   		csid->phy.lane_cnt = lane_cfg->num_data;
>   		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
>   	}
> -	/* Decide which virtual channels to enable based on which source pads are enabled */
> +	/* Decide which ports to enable based on which source pads are enabled */
>   	if (local->flags & MEDIA_PAD_FL_SOURCE) {
>   		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>   		struct csid_device *csid = v4l2_get_subdevdata(sd);
>   		struct device *dev = csid->camss->dev;
>   
>   		if (flags & MEDIA_LNK_FL_ENABLED)
> -			csid->phy.en_vc |= BIT(local->index - 1);
> +			csid->phy.en_port |= BIT(local->index - 1);
>   		else
> -			csid->phy.en_vc &= ~BIT(local->index - 1);
> +			csid->phy.en_port &= ~BIT(local->index - 1);
>   
>   		csid->phy.need_vc_update = true;
>   
> -		dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
> -			__func__, csid->phy.en_vc);
> +		dev_dbg(dev, "%s: Enabled CSID ports mask 0x%x\n",
> +			__func__, csid->phy.en_port);
>   	}
>   
>   	return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2f..b227923ca5c15 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -68,7 +68,7 @@ struct csid_phy_config {
>   	u8 csiphy_id;
>   	u8 lane_cnt;
>   	u32 lane_assign;
> -	u32 en_vc;
> +	u32 en_port;
>   	u8 need_vc_update;
>   };
>   
>

I want to suggest a feasible way to solve this issue. The v4l2 framework 
provide a standard interface 'get_frame_desc' to acquire vc/dt, stream, 
format, etc. The vc/dt is determined by sensor in fact. Could we use 
this inteface to populate such information from sensor side and use them 
in csid? If sensor driver doesn't provide the desc, we can use the 
default vc0.

I have made some tests locally, the only gap is we need to determine the 
vc binding order and ask the user to follow it if multiple streams are 
configured simultaneously. Maybe we can handle this more flexible if we 
come up with new ideas.

Something like below

1. Configure RDI0 first then RDI1 will get
   RDI0 -> vc0
   RDI1 -> vc1
2. Configure RDI1 first then RDI0 will get
   RDI1 -> vc0
   RDI0 -> vc1

Best regards,
Hangxiang

