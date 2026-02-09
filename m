Return-Path: <linux-media+bounces-52403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCS1A8rUiWklCAAAu9opvQ
	(envelope-from <linux-media+bounces-52403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:36:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79A10EB6E
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EC613021E5F
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 12:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E625374736;
	Mon,  9 Feb 2026 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVieFxOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwNOppe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102E372B40
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640560; cv=none; b=uTi865StMIKOMFw5M46Zc1MKl3DBzWxTGttHRudGA2QWXgv006uEgIY/CmHsg9Mlj6bdFWvJcWjT4IF9A8lW7MaaGfdIIlqOsKrk9/4pAC5usMPmMAyN7Qtyf1Y8HyOqRdR73wkVXXKNu8J4N5tZniul9n/ucU9/iLlPviqwkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640560; c=relaxed/simple;
	bh=tDDHseII1oUOi7S5C0YQUKxbrnphvOSdeuYLgXm895Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZqglyJyo5izgzdlVq8fGo7j+r0DVFMuAr0mQ/7+IrQYWbImaLVfPHYs0Pnf2KhjA7E6LnELkeDb5BnxSeq49Qs+i4l+rm8L+zpgWsWG7mf4Eyy2v3gNk9twNQlij6eyVE06GLAv8YaN80cX+Nm0k9MUQXOdMaBkvY/s/xDvb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVieFxOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwNOppe9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BLGBp2031681
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 12:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UcjgUEVrfI4MUcQWFoRd7mAYawCVcGmW6UtU1qyzz8=; b=YVieFxOW1zkw+KLs
	5NzFB1pDMIGNmQ3E/j5TOXdRVqeYVpaZzdUC3JBzu6zkqXrIHgB+LNHGG8XTcrA6
	CNVW1IkfMl1V6axejaB0F9ydh6cDAH/yUoOXxJdCeDxbOstFU1hyAvdHtNbnszfA
	+kZECopnXs4vpfcKLX9We9K2ciJFZTkEnz3ebOTx7Wxn2pYsSO/qk5jCvJDfjk0S
	NlmAaLiC8Rdex7I1KYo36Q+xjct0P9L0dOmIGc7123Fegu/cT77hSB3ym/qvBTh9
	szfmF/nqSL8jKsB2C1Azmf0+ib3Ng//j3wxerL1cNZeP32qyWYEDYaa6XBOoz7YC
	3UjGuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79d31d9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 12:35:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so1854656485a.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770640559; x=1771245359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UcjgUEVrfI4MUcQWFoRd7mAYawCVcGmW6UtU1qyzz8=;
        b=RwNOppe9maxVEAcITQ17Ub7ekf4vzxSCdFwpsY9z07p1paN3Y3vk3kVV3TtLqHmZtC
         zCHqqntylr1sub3mQ5trZhgTt94CTpZOmqLBoDJiRFLrA8dxMPNnVVrAAC/T8tBt6dRU
         felcJU7rTzpZlTZdgWcKMKWLkBhWvLx/H2XGEod2qR7Lvc8qM2WOyX5rlTzyPzKigWTW
         cRuTWBnpz6DhOQ768VDspdxMqVUbN2dFii9kFGEablSiSDVS0wLwuaJBtyDlhHsINz9B
         pNtQF+ex/LjcNPOf6NEvuB/xg4gygsSr51eiXckradpiHVco+nfTNr0pcKme7ZuRPF+5
         /Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640559; x=1771245359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UcjgUEVrfI4MUcQWFoRd7mAYawCVcGmW6UtU1qyzz8=;
        b=n+iKHiw0o1AcG/0AiTasfITQ0zpGOW76vW2xe436xDOkj7ZohO8sIB875SwUkP74Ba
         ZfBtN71BAyZAo82h6CVUKA64M8tHYpmcJmdB3y8ZBOTlfMdxVkt9S8Bniz8OUhYiAjzv
         MpLdwqcZmk9MdwcZk0jMqE9+3Y016atirXkZT3N6zt873JiOlLO8VlsVj98qxXAHg+7c
         AQqBTQBKelai6p2BPYQlTah6ov0Sgv3SimvLprVM5/dPe3YYXGGCf4fJhI1TwYZSTd5b
         2LyUZmiLiL4+CM6TgTRwn7yulgTqxLZNcQF/4jPrgD2pgg/Mq4pJR/I4/na25TL8VWt8
         YATQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhVD1C37k6gvaCvnwB6W4YmfsBvyWb8tntJ8d4LGhtTtH1dp7Jk8dksUYHxR+SiJeahwKI7+eRcJ7hGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnChyaNZfVodvb+7x9KhaFX82N6BZP+9pT7TI3/X5PK+Pnr22C
	F/EYBuzoZxgvqvI79cy7EdYgAUN5MtmY2epPd8HJdhv8AKCCMqM0Zr8TIIW0g037vlJIvqTgg1i
	CJ8KZskhUFEpK3i3Ffv8I6eWtaBp+zkg1fzBLoHMt+c1hM5uEtVPOAj2X1y5wI9ypIQ==
X-Gm-Gg: AZuq6aJf2g8RvCCuP/zeP56ilx2J8qV8mtc/4DPJzMR7tjP/gqTh4I8nc3l02+q9lw9
	HPfM2kwhjngWQoWRBc1AnHN6LtVZyFXR3tzsRsPcFZRWAA0/dNFcAqD6MniqQyUE/JoGst3wEFn
	xRq1zr38OXes3ZHFZaqWC+L6lu7aqeMU7makihePszWEClNY3XxNtE1Rqvw5VuIj+WUzzEO0ald
	XeQb9RYa83ZYWp+JrvNagX9liNAhrZ6FCfGeJYMgOBoxC1Cz/Eip/TBWKTdC16t7gsOc730c1xN
	rwc5r+6vK0sRo6X1ZI8fZd8JGlkuJ930sYKGu+Ib3YLDJER8CalQctg+QYRaPAl+k0E3ig0CYkp
	pPPUh7kp9CNa8CfL6fPpxAFPXxLwHm1R9aAWlkvFZqShqLF0BjfrUPI2oWKBYxfkZe4SWDsbJtf
	1Va/D8WvaZRYFKch8MyOw9h/U=
X-Received: by 2002:a05:620a:4006:b0:8ca:450f:c389 with SMTP id af79cd13be357-8caf13077ebmr1422227885a.62.1770640558868;
        Mon, 09 Feb 2026 04:35:58 -0800 (PST)
X-Received: by 2002:a05:620a:4006:b0:8ca:450f:c389 with SMTP id af79cd13be357-8caf13077ebmr1422224585a.62.1770640558428;
        Mon, 09 Feb 2026 04:35:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b640fdc3sm24664721fa.43.2026.02.09.04.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:35:57 -0800 (PST)
Date: Mon, 9 Feb 2026 14:35:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNSBTYWx0ZWRfX80s/fHvMrtIn
 l0kb+xMWC/FsfaBz4Ka+gZ8LjZggbcmxzhBwD2qkpIvHMHaVsENJTKOuPBZaAKx7YR6Zrp514Wr
 esjDsj/30JPU9/tXLzd/1UGpwdFiX25muibzZCVKLAkDQox1LYToSgxKuEW1+wAzZvZG1DlpVkj
 46zIniLwH7hnJ+Iy7LwJLT4wMGdyTV04ek73GZtUduC1FvLM2JwEv3X5JEZgd6VDF8Tq/EQljPq
 CXVNf9y4Ovo9X1Raffwiw28iKG0g2dmZvSOCVWxBh0vgnC+htjtTdi88iOTcyYTbfCb2VjJp1Y5
 7OwO6W4gAI4ixEI61GRc8e1uXo7almGZZmJPCB9pZyGU2ISOsB2nOwsY7KRrZloTDtOGo/FDSfY
 OMbSi8wB+7n+ZqUqHC9bW6x6zTMNyI32ylKQiPV4H+vGd0Vtrte5kwU+TQ9Z4s6gsuPbB9HjhGg
 KTj9A5O8nkU4nVdi+gA==
X-Proofpoint-ORIG-GUID: SbOUimV2y4AzguinnqhTbqHQXIg_RYwM
X-Authority-Analysis: v=2.4 cv=GJAF0+NK c=1 sm=1 tr=0 ts=6989d4af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=fNh8k6CI_6Rsvkcug7IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SbOUimV2y4AzguinnqhTbqHQXIg_RYwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52403-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C79A10EB6E
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> > On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> >> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> >> use Gen1 by default, but boards that intend to use Gen2 firmware can
> >> opt‑in by specifying a Gen2 image through the Device Tree
> >> 'firmware-name' property.
> >>
> >> Based on this property and the availability of the referenced
> >> firmware binary, the driver selects the appropriate HFI generation and
> >> updates its platform data accordingly. Boards that do not
> >> specify a Gen2 firmware, or where the firmware is not present,
> >> automatically fall back to Gen1.
> >>
> >> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> ---
> > 
> > [...]
> > 
> >> +int iris_update_platform_data(struct iris_core *core)
> >> +{
> >> +	const char *fwname = NULL;
> >> +	const struct firmware *fw;
> >> +	int ret;
> >> +
> >> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
> >> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> >> +					    &fwname);
> >> +		if (ret)
> >> +			return 0;
> >> +
> >> +		if (strstr(fwname, "gen2")) {
> >> +			ret = request_firmware(&fw, fwname, core->dev);
> >> +			if (ret) {
> >> +				dev_err(core->dev, "Specified firmware is not present\n");
> >> +				return ret;
> > 
> > This is fragile - if someone names names their gen1 firmware something like
> > "myproduct_gen2_vidfw.mbn", it's going to match..
> > 
> > Could we instead do something like the explicit format checks in
> > venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
> > of the binary?
> > 
> 
> I agree that checking for "gen2" as a substring in the firmware name is not
> reliable. Unfortunately, we cannot
> usevenus/hfi_msgs.c:sys_get_prop_image_version() (or any Gen1 HFI query) to
> probe the contents of the binary here, because Gen1 vs Gen2 have
> incompatible HFI protocols—probing a Gen2 image with Gen1 HFI (or
> vice‑versa) isn’t viable in this path.

Can't we perform Gen2 query on Gen1 firmware, get the error and act
accordingly? Or, better, perform Gen1 query on Gen2 firmware, receive
the error from the firmware and act? In the end, your team is handling
the firmware. If you want to support both interfaces, it should be a
runtime check rather than filename matching.

> 
> To avoid accidental matches, I can switch to an exact filename match
> instead. That way, only the specific Gen2 image (for example
> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that

How do you detect that for the OEM-signed firmware, which can have
random name?

> want to use Gen2 can opt in by naming the firmware accordingly.
> 
> Thanks,
> Dikshita
> 
> > Konrad

-- 
With best wishes
Dmitry

