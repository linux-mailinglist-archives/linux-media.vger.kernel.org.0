Return-Path: <linux-media+bounces-55971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPX9FTZhuGlbdAEAu9opvQ
	(envelope-from <linux-media+bounces-55971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:59:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C38EB29FFA2
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B8D9302C343
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C67A3ED5AE;
	Mon, 16 Mar 2026 19:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hp8Kup+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWNL3Mh7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF53CE495
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691186; cv=none; b=RiWE3v7w4mqdUMKzO8lB2nfiXw2HVcmmW4tF1nxVGy7Yj7SGDnTbPZyqcHPFmLogiendtwK6kS8P99NTNYanYGXPC2tekqJOro1KNLTrZ3MiTkJreLb00DiCjob0hAKU0E71Qbw63abIVihef2HghuFUMBGvzsY2gZwmixdaQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691186; c=relaxed/simple;
	bh=gxLWxlGf9bOrVIgne7LiUAE+z2WLXtmKK7Xao/9Ux0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umkGfymcmr6A6m+OJ3E4IS4KcBVH2iFZ0kAAQ+Om//NRmyon0r9HAdttBtE67h5nW27Y2B7oiygXR3nvG2mmfGewsfMM481B3NAAUwDN4QDPNVMc+YsH+jKMsuY0XQ8LVkshJkLyDBAjGIuWNzdi7bmf/d29TY0+dbNnzzoxKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hp8Kup+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWNL3Mh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF2jBV1534110
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 19:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6Wxhk4cbJfRrKe+lEgKyAa/eAxls3l+5X6XLKxAgHc=; b=hp8Kup+3gkOaECT3
	H8X8upJLxPw+UjgzzQG9lcpFg4pHmNoSpbqmu62cVHh4dN8Ors0zOXhAeoiFws+E
	373X2QZD5TRAPNkWhsYAwm/y38NVkNZi//wlnpS3s++/bsfJ9yJovbsWTijigio6
	Ntn9ePi2COCJQUbAEpeNAZAqE8NgBtsLSjgHg5y+8l9VnDRXHZr+7v1eHn+2gL5/
	Y8eRogXMehjNo56V1bPJThv18rIdSNiG49vUyr1eKgFsOdSRV4C9zL+XPoyGgghs
	4Zwk+7Pf3etFlLbAPbsEKecqDhua+iOHAjd6UPPZo41z0DDIj35uK+HukqdQNKLn
	LDoNTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k10wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 19:59:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899e89bf366so51318976d6.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773691183; x=1774295983; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6Wxhk4cbJfRrKe+lEgKyAa/eAxls3l+5X6XLKxAgHc=;
        b=DWNL3Mh7v6iT63vJdhu4HB1vO9AXkfhrSB7oMQWOMRQ3r2bKHmUSJFdQJtSEPWx0HM
         u/S2lpBURyHVSP3E9kQMqpZa7/q8h4Yf5Ns6ZqX6nglFwOjJL28PkHy/5L+6ArvovZrG
         LHZU7KWbt+Q5Sn0xqgMIK7UQxiafMZM1unY66JeAHHsJBCgO9fI7xSejWK1VRglV5iJH
         je+TP8FWxrUUAevz0vDz0ZETg3mJN9clKEqzCRIsPUpp5u5MojRkCzlDykzcl4oeWc2o
         Dy7z5dcK/Wp1HY/Cj6arYsa6STnx7pkVvBp8h872EwAhVIUYkYjFvxsWil2f/EVXNFM/
         sIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773691183; x=1774295983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Wxhk4cbJfRrKe+lEgKyAa/eAxls3l+5X6XLKxAgHc=;
        b=Bz8QftfDlGwcR/n/vVNaw0g1qMpFIwuKTGuDg3TuXC8jzrCAZv/6c6ewGHxs/OHXG1
         1mOAkiIjvJ/okBjlBdKVuBTTxY587w9vj1ucJCx9BjFwugSX2yylq6pUsVkHd5y1SuDU
         gt5Ou2w9bVFwi5/ABRVWjCcJ+PTSJjOq7yARY2jk+SSm1M2w/AkuPwWijuDeEktod92t
         wVPespVUkjd43CG36C0R6+gyUuIvT6K+2+gB9+oaHbIA7fPk0fQRobzMcsBDNCFY/z0A
         /1NlkwwRBf5r9jnASCnPengjQ4mscIh8uF1Pl8iwyv1L/PBJglzWTlR+sVDtkWbIF8RN
         FFyA==
X-Forwarded-Encrypted: i=1; AJvYcCWBdrVVow4rlsz0yK49ydGR5rF9l8cBpGxlCa6ZjUAMQXPUdusjY+rbHWQIlG5VRcQcfPC870KBzwusZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJRm1FvMXBpiBwwLDLdUU72vskZ2tOZqzCK00iwashgT7zYO0
	rbWUysoXeAwa0Aq2cyZXPnXt4LW6J57u57Zccm0LlXtkr87cN2R3kacNdOIJjiD42yCSMkI24AX
	APdZjNoID8MJZpk9oyp2DmL0o6Gsp2UVLtosmiQbsC2Ohm2NUW8M9f55kkzckc6vknA==
X-Gm-Gg: ATEYQzxd/lbevblmtxHF1BKstd/1Mog5PGcB5AHoVYFx+E6ovl4NFP4Yq2MCjz/pfuM
	RvUzlZQmncBoGCuuqgAaBKE/ZMyqxcKiUhsVZ+OkOQWVVNez7vQSaC+lRRn175cEbqjbsAMlT10
	NeyFaZ8o7G92J33gggFt0umtZBNpzg7jNl3jI/4LKKUnKOb5jm4SpdaDDwD84pL8JkUS1q6RhNp
	/CJteggM0WOuztnpFO7DknswgaIsq4gIGYt9DhvUOUjX/mUkZPCmasU+ony9JlVHLmmmaniYUXp
	jv80UgRD064lhFpM7wkrOutGJhS5adFQurIdC99XyHrSYeKb4VSL0hTgjp5GnzdNX0ENxQxsxOw
	Pmd6M7CfAZ3xA42dC78vHG9w7atYYzP8/bjmjwjH2P7lfKK9QLTimt99/7TX8GCRdpnP6WHf+03
	2WS56FjcEFRsDHCFUXsNvrgpVr7Ke8ISLpqxM=
X-Received: by 2002:a05:620a:1983:b0:8cd:972d:324 with SMTP id af79cd13be357-8cdb5b60325mr1864294085a.54.1773691182730;
        Mon, 16 Mar 2026 12:59:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:8cd:972d:324 with SMTP id af79cd13be357-8cdb5b60325mr1864289285a.54.1773691182160;
        Mon, 16 Mar 2026 12:59:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b15sm3568711e87.49.2026.03.16.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:59:40 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:59:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <t5mdnrtxpeylnohpb7twl2kc2ewb5hxyscemz6iuxemkvye3h6@26t56xm5ca2j>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
 <726439a7-cf5a-74e6-1768-1bc6fb907ffc@oss.qualcomm.com>
 <24oq4plyvburuufxs6vt2kt7e3mlwlis7dekszjnxson245amy@muyu5fpohhfu>
 <5a6a6979-ff3e-0885-ce88-5c9316b9bcad@oss.qualcomm.com>
 <54bfdee8-771f-8b0e-b5d1-d9eaa934b48b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54bfdee8-771f-8b0e-b5d1-d9eaa934b48b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b8612f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=POyDUydt1yzL6V-isL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE2MCBTYWx0ZWRfX2+pHDFw027vO
 o0LfOLd9Y/EUWyp48xI7/LTxVqTMEV2fjnTrI1cmzYhR50+/YxWhLE/EcTv0jkHdtMgOCv1kr1y
 +J762lENSzXqSsR9zGWHqOo2xZOJyj6QzYMopZBKdgp5DAr6UoPFZWZ5mAPCdR7k5KtUO+JLUTv
 ae2mNWMLE5eHYU6P9d8/pq+HFaggDKdSVVZrSjuKXAgDx6pNkSHXvZUegiQ8R6gSW5LSdPOYHwV
 LlHbJTvTSgnW+aH3PCNBMa1gfzKvvyjVrefNyr4fyLJeYBzA3/ibS2c3mQ46Aq6bPphGhGFJ70R
 PckIFOyVr/SpfVcOZu+g0IdwSJ7xo5m3JFx2qFGggVg4t1Cuh+BVMWqYB7FlpM4nRapaotPw2rD
 g/+OceSvY7iZ5+51KSXY3X5fd+x4jIsuiubAWEVn5zFmr2hJBQHtPEIS1dH4YYF44xlSyyOOR7I
 DpmvAVnIAB9snSgAriw==
X-Proofpoint-GUID: Nx14VLUryBqcDmxI3wxvJ7N-tZuYu0LD
X-Proofpoint-ORIG-GUID: Nx14VLUryBqcDmxI3wxvJ7N-tZuYu0LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55971-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C38EB29FFA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 12:01:48PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/13/2026 2:55 PM, Dikshita Agarwal wrote:
> > 
> > 
> > On 3/13/2026 1:37 PM, Dmitry Baryshkov wrote:
> >> On Fri, Mar 13, 2026 at 01:19:21PM +0530, Dikshita Agarwal wrote:
> >>
> >> I'm sorry, I've refreshed the series before receiving this email. I will
> >> send new iteration after settling the discussion here.
> >>
> >>> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> >>>> Having firmware-related fields in platform data results in the tying
> >>>> platform data to the HFI firmware data rather than the actual hardware.
> >>>> For example, SM8450 uses Gen2 firmware, so currently its platform data
> >>>> should be placed next to the other gen2 platforms, although it has the
> >>>> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> >>>> hardware-specific platform data is also close to those devices.
> >>>>
> >>>> Split firmware data to a separate struct, separating hardware-related
> >>>> data from the firmware interfaces.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
> >>>>  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
> >>>>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
> >>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
> >>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
> >>>>  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
> >>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
> >>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
> >>>>  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
> >>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
> >>>>  10 files changed, 246 insertions(+), 351 deletions(-)
> >>>>
> >>>
> >>> <snip>
> >>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> index d1daef2d874b..1a870fec4f31 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
> >>>>  	IRIS_APV_HW_POWER_DOMAIN,
> >>>>  };
> >>>>  
> >>>> -struct iris_platform_data {
> >>>> +struct iris_firmware_data {
> >>>>  	void (*init_hfi_ops)(struct iris_core *core);
> >>>> +
> >>>>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >>>
> >>> I still don't think it's right to keep vpu_buffer_size in firmware data as
> >>> this would change mostly for every new VPU variant.
> >>>
> >>> The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
> >>> vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.
> >>
> >> Okay, so how do we solve the SC7280 Gen1 vs Gen2 situation? I can keep
> >> the function pointer in struct iris_platform_data for now, letting you
> >> sort it out in your series.
> > 
> > Thanks! that is SC7280 problem, since code evolved due to additional
> > features and other things, we might need to increase the vpu2 buffer size
> > to accommodate both Ge1 and Gen2 requirement, I will check that and address
> > in my series.
> > 
> >>
> >>>
> >>> <snip>
> >>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> index 10a972f96cbe..a83f6910f8b7 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
> >>>>  	BUF_SCRATCH_2,
> >>>>  };
> >>>>  
> >>>> -const struct iris_platform_data sm8550_data = {
> >>>> +const struct iris_firmware_data iris_hfi_gen2_data = {
> >>>>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
> >>>>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> >>>> -	.vpu_ops = &iris_vpu3_ops,
> >>>> -	.icc_tbl = sm8550_icc_table,
> >>>> -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> >>>> -	.clk_rst_tbl = sm8550_clk_reset_table,
> >>>> -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> >>>> -	.bw_tbl_dec = sm8550_bw_table_dec,
> >>>> -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> >>>> -	.pmdomain_tbl = sm8550_pmdomain_table,
> >>>> -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> >>>> -	.opp_pd_tbl = sm8550_opp_pd_table,
> >>>> -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> >>>> -	.clk_tbl = sm8550_clk_table,
> >>>> -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> >>>> -	.opp_clk_tbl = sm8550_opp_clk_table,
> >>>> -	/* Upper bound of DMA address range */
> >>>> -	.dma_mask = 0xe0000000 - 1,
> >>>> -	.fwname = "qcom/vpu/vpu30_p4.mbn",
> >>>
> >>> Should fw_name be in firmware_data? as this can be change based on HFI
> >>> versions?
> >>
> >> That would fail because then each device will have to gain its own
> >> struct iris_firmware_data.
> >>
> >> But... Maybe we can do something as simple as:
> >>
> >> struct iris_firmware_desc {
> >> 	const char *fwname;
> >> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >> 	bool (*checK_fw_match)(u8 *buf, size_t size);
> >> 	const struct iris_firmware_data *data;
> >> };
> >>
> >> and then
> >>
> >> struct iris_platform_data {
> >> 	struct iris_firmware_desc *gen1, *gen2;
> >> 	// .. the rest as usual;
> >> };
> >>
> >>
> >> struct iris_core {
> >> 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> >> 	const struct iris_firmware_data *data;
> >> 	// ... the rest as expected
> >> };
> >>
> >> During first open the driver will try loading firmware from DT and
> >> identifying it using the check_fw_match() callback. If DT doesn't have
> >> firmware-name the driver will try loading gen2 and, if not found, gen1.
> >> When firmware loading succeeds, it will set the pointer and the callback
> >> in iris_core, settling the interface between the driver and the
> >> firmware.
> >>
> >> WDYT?
> > 
> > This looks good to me. It handles the SC7280 Gen1 vs Gen2 buffer size
> > differences as well.
> 
> Do you plan to implement above design in the next version of your series?

I've sent the platform_data patchset keeping the get_vpu_buffer_size in
place (as you suggested) because that is fine for the current supported
usecases. I would prefer if iris_firmware_desc comes as a part of your
Kodiak Gen1-vs-Gen2 patchset. I can send you a corresponding patch, if
you wan, or you can implement that on your own. What would be your
preference?

> 
> Thanks,
> Dikshita
> > 
> > Thanks,
> > Dikshita
> > 
> >>
> >>>> -const struct iris_platform_data sm8650_data = {
> >>>> +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
> >>>
> >>> This proves my above point.
> >>>
> >>> iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
> >>> get_vpu_buffer_size, which forces us to create multiple “firmware_data”
> >>> variants just to carry a hardware-specific difference.
> >>>
> >>> Also, it will scale poorly going forward. When we introduce vpu4 /
> >>> vpu5–based platforms, we would need to add more copies of essentially the
> >>> same HFI Gen2 firmware_data, differing only in the buffer sizing callback.
> >>
> >> Yes. I'm not sure, if there is any difference between params / caps as
> >> implremented by the firmware for those generations.
> >>

-- 
With best wishes
Dmitry

