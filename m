Return-Path: <linux-media+bounces-54451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFeQLKL8p2mlnAAAu9opvQ
	(envelope-from <linux-media+bounces-54451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:34:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D0B1FDAB4
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E8BC302087B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA173976B6;
	Wed,  4 Mar 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6pGDaZO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqUM+jou"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820B38737B
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616852; cv=none; b=ZjNgd8bZ/JsO4NsHAm2SlSI2Qz/hdK3uoJrSHrc3lx5ANJvmX3nVg3g4+vEM6NeRsoJClQt+GV6oRBZ94EQlw609+xyBFPgZTOiUI2089yoDDHuJJMScBOa+vZ0/FNaIt6kpDPy4MbiXQ7YOScDO6bB1ik5vnJ3rBNNK8T34WTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616852; c=relaxed/simple;
	bh=6Im1afP1sgkC4nogaoxmhp/Qx7QYuTEir2dfH5M9TBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgkAPuxDaHHmyrMe2g0fXmVP+Gv5KhVDuNnoSjvxrsAtKTm8RlG8nig+yPIOmLyfMBRlEqNHyBies6k8Ldfa0+WJBvQR27DewXxN4cAPOpGradFJJ3up9LEzD1C0P7o4F+b9Y/4yoWwXdgOjt7qhH2MeXOIyboAyMaBYqkjuPgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6pGDaZO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqUM+jou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SN4p1421868
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwA8zZfKe+4R4i3Dro//bDZHxe7EZ0deZWYOSGGABX4=; b=n6pGDaZONI6sPN0M
	LyohQzLltHQCj2BUIXV/aLaKnkuEAZUtbc0Go9+5Y5rpgquXed1zmukahBzn8Ri6
	DBGxVGFaKP7wsFd/JRqjg7J5IxEaZZePG1u6c6Xlmaw1hKiSCifmrCwlCFQP89J7
	BZiMmGs4pz6kXRrmb1z/a8k2e7yNKQpkvlV6hrunZdakrGIBmqUz+Ea/03XF3W6t
	KjOf3Rwo/GMr65yPoE41078/1ukwOanl2MuQ8D0VQuiVIPsdY2UoKR7boCvkn3zT
	lzLWk/HAiOx3T479zTCyYgBCJZCVngIbCQ8Q81jcLGAdGEHHUBRPfYx9+CZuTmpO
	Z7xESg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u0w1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:34:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cbdd1bf8b0so182056185a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616849; x=1773221649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwA8zZfKe+4R4i3Dro//bDZHxe7EZ0deZWYOSGGABX4=;
        b=UqUM+jouYA89m4xUExsVDDjJhlSqCvydW//kREn2CCfo4Vnificb53oQ98uv83U2X9
         iCwlwSb8GH1EaWShCLDILMKFaRdgGW/yvSh6bu9ESPGfqNHpxF8ONG8ynY/RUj/J14fS
         51T6VZKRj/4hZ1TFPr6bfhU3gZoxvaXXF8trsLuC/hN/eAziBIT2HbQ9QkBRkWklFrbe
         bsnBK3EdJWI/Efyb36TxdEjOh27Ip6Dfh4wodBh36aAMYJ0m8/ZkPlSGkNHI67jzwzs7
         O4GgW8VN/7AtGyOdNwv1zkBfsMHfXxchwtfbUQ4DgxAituVl5QEOTHXll0rYZMlofZh6
         gPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616849; x=1773221649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwA8zZfKe+4R4i3Dro//bDZHxe7EZ0deZWYOSGGABX4=;
        b=Q14M3yTwo1l1oUZUi6w6UZc6zme3rJ3Co1sCOmFU/fQh7LIMHV/Mqj8CQpTIaMirSK
         oCxX7X8jhegO9yp0++52iltlgRSebOgk/bX16wOnHtOv85uLOxL/rGT338vSaJiyD/wM
         TTq44UPKGd5hWzi9aC23T2mBgVBxlcXWk2TOftc3yKGFOEKGRjgWU03eZfjcIGd4xQwr
         /SQ1SQvdnH5/kK71CCq2JhP8n3oGaDH0jjd2rESJXqiF/UWquNLDreJfg6Bp9OyXa4hn
         gGfHYK3VRqCG6nwm9phg9oxNhvKuZMaC5GAtvjJZ6mPwQCt0C+Xh+lXfLO63VBQoqK+e
         yuDw==
X-Gm-Message-State: AOJu0YzD/SOmwZSs2JOxspq0z48OWkTte8TMLPRhR3aapCBwYdHxOKen
	GsTRQWdPsD8TEy9Gd2dIRDji1+Qh3cs2ztMa4fuyir+djbpFplMFAbwimm+ty4TSwqV1PSCRqLL
	NTd6YNUaUCUgC4Z2mrumtQd1e1fupQst0tm3nUch6mjzuwwKzhH0/CSEGJmASXTezgw==
X-Gm-Gg: ATEYQzwuQndDMO/Ye3DO8Thv/z68yAXHmJPV/C8P1qXB9uUwm0DVi97kjnwZz23dZVK
	+4ZCkndJJd6PtTFmLw4QtN6KMDVlWga4sQLdB/F0VNN8Kl1fBU0TMkDupg45GrwqirEWt8Csva0
	80azzUnIw3LvsEIA/NKC9mHuOV989z/DeJe2p18S9ceISihyXEhBpl38kzgOGc1Q33fYeebq4xm
	IcoXRvKh780Yl4CiHYhhzLpghP7Zcn4fPEeOyCV7vXdobHOOBsBYLrq22y56UKut7dd+GaXifUA
	y7uSsuYF++hltADVe+xZgHfelXnMcmQVdWnUFzwAca0NFnaqvFRmaSN9AcehIKzk1wXSp21MZCi
	0EUP/8nzHWhByMsRCmC8vfWy8Q0XwYo99X1UaX5Cjeu8T/epE6QhOzD1+k2Wkd8dUArYpT2WOXq
	Ht6UQ=
X-Received: by 2002:a05:620a:c55:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cd5afe710amr118337385a.10.1772616849049;
        Wed, 04 Mar 2026 01:34:09 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cd5afe710amr118335985a.10.1772616848636;
        Wed, 04 Mar 2026 01:34:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd46753sm5281095a12.8.2026.03.04.01.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:34:07 -0800 (PST)
Message-ID: <a09b3e50-1967-486d-9489-351fa04ee8da@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:34:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n_z5AdpB7tIyUrzT3hzGeho2zLxO31TU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfXy4c9NKsv/elq
 dviLG2kvH99aYOmO89Zs5zveXYwwcSuXwYCLEB/vBWrLHcTg5p/42AV0o8lPaItH5xJEqjKjGR0
 X5IMTixbCHtZW4YAP6qgBSLaodTwa2SzZTZVqgFfVB49BI7ry6hkrhpuagwIzDZqOCkP2CaYiMv
 FlULlCEB9aLvxbWv6wriPl4lf3tuF8BdnYqLaNbsKxtblNol9nvIPtQ3rOtGMckaGw6fsbB5VnY
 g/kgucvWLUxjANgTsRMsTQmvEeIkuPwrlKa6aLDYqgLTKY91hdNFZ431GIctjgEoOwx/6U0QQt9
 7RjEUeLen0d0LLaRVDxPJO4NPZNxi7HSyBg3usc05/uTrHmdpx+qNL2DXFN1xnAIteivGdisklj
 SD6CWbr5kk25t8K50w1E93rnx7HtiycC32Lnsb0XyTJxQT5rRTcbHRhZHZBuGCQJ3izlyFAnQrr
 HpiRNXoGa1le8e0tljw==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a7fc91 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kFDTxuPyl3r0weC5jlwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: n_z5AdpB7tIyUrzT3hzGeho2zLxO31TU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-Rspamd-Queue-Id: 69D0B1FDAB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54451-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 10:18 AM, Vishnu Reddy wrote:
> The driver was using a fixed default FPS value when calculating the VPU
> frequency. This caused wrong frequency requests for high‑frame‑rate
> streams, for example 4K at 240 FPS. Because of this, the hardware was
> running at a lower frequency than needed.
> 
> Add the FPS measurement based on the decoder input buffer arrival rate.
> The measured FPS is stored per instance and used in frequency calculation
> instead of the fixed default FPS. The value is clamped so that it does
> not exceed platform limits. Add a VPP firmware overhead when running in
> STAGE_2.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

> +	/* 1.050 is VPP FW overhead */
> +	if (inst->fw_caps[STAGE].value == STAGE_2)
> +		vpp_cycles += div_u64(vpp_cycles * 50, 1000);

let's use mult_frac() and trim the trailing zero

Konrad

