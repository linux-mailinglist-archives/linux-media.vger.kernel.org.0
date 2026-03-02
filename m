Return-Path: <linux-media+bounces-54077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OhoAxVkpWmx+wUAu9opvQ
	(envelope-from <linux-media+bounces-54077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:19:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4121D64F7
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4CDB3025C51
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 10:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44AE39B4AD;
	Mon,  2 Mar 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9Mcxopk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y52mq3Jr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A232E1F06
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446366; cv=none; b=AsPAbXAqQJZmLFvUg06yJsSEfDYZcpsEwmG0S7oZZk/OtgTqpdkQ1LVLU2rU6VzKScQD+sx0oRaSm5rU91ki3rfQW7GnmHMnUP8wd6WO1qxmGk+pL8DFPcbtW+HnMeHSssQ5ve0iwKzX1417zOHqpWJpAoNqlZ515NcIEV5qoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446366; c=relaxed/simple;
	bh=CIIMhn3McArRDaeoOfcnUn1JTR+N9J0Ef9jm7IK7od0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e64zdHqloV6jjr2vSIaRELc9vpK26dTbBK8Mvu8/mspiDBCji4uH1j0not3Wjg2H2fqYA1GGeYVyoP6ZlyCuMfWN6xnFSxK4/c5XUmUvM2jp8OC4upR3x+raMejRoYfDxxnTs78eS8h/bL6aOrkHu8tfufj/zBA/0nurnmTpRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9Mcxopk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y52mq3Jr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228GxtN1932246
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 10:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubbob+1wg4HlG3B3+x+CMsZSPa7kvzw4na3apzS4rx0=; b=R9McxopkenPFwsEa
	uTHzckATe97Tv4pLBBAlwjvE+xCqv5PMh3FEVDzrl7ipCwA8wcoGEegK5kdGuTgW
	D1PCsOD9A7MxnKwfweoPTYQ5FByMmEhI8EcTtB3AlCBGmm9RBB9GiE9dE4N2rXrO
	h38j9kf0DOga6xkwal/tX6k9EENuzhZaQXQOSXDa1kAID4khRZkRtm8j5bsRlohP
	8lYP4kSUYcZgUEEbYwRack3uAtG/d/PwKUGx8Izq+CJOnN/7hGpCE8uVYuwTBhID
	vY4OpbXzouopqj+E9/wTPy5sHH2BMODz0An/ysCSF/Xszvaqsz31EJUL3dgM9QsP
	949f6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkw4q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 10:12:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so11369925ad.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446363; x=1773051163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubbob+1wg4HlG3B3+x+CMsZSPa7kvzw4na3apzS4rx0=;
        b=Y52mq3JrS+Bhoq2swEn1jqPWL2zU08atcrRelBuU3XyqL/mtnChWtkzM7Vxgwjy49t
         eWVr79cgb6joA6JMpxT8C30TWLuV7UY+9FDW6YDEE8iotg4Jp3Isp84Kk8B/IvW+EP63
         HTbRqWFrPjzbbXWIzZT80nsTE2RVtTiS4dO+m5U7QJDyLMpzS+fMz05tKOL4+NYR0Cdb
         0k0BwqCZVqDzxT+e84mKAbPJQAxvwNbbITLinrIcgr2xPo2z6pT5+A5f/ZEN0zMtNtm/
         HR+96bHSJqjQCjAx+UK7BMyx9rikM+ZQMdWSqV35OW0yKFCGhtvE1qZUCikwrPxkXCN1
         33tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446363; x=1773051163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubbob+1wg4HlG3B3+x+CMsZSPa7kvzw4na3apzS4rx0=;
        b=iTbp/5QAZf/UM5vF0MgyEjoMJ2AqzCcPv9tbdhkLQG9D9O94howudWwYFVMj/5WDJx
         W9tq/QpNUAKGu3DWskV8AADP6edWP2N/Boxf/UqrTGkjtvvMsoBkXkyR9CQB83m2+8Ow
         8NXsvUOVLJbAMNy6sk2RaHYPlyD1/58hLzqqCzIx4rkpWgJDB/01mRX8o/UvmSjq7zFS
         Mn9Icn+qbjS+NgP/a/KqZMSwvTmTl24UJQL174zCuIy3xli/I1RgMaciebMPT3JGkFte
         arsp7/2auhE8U0ZEZp4AA+dwu+yN++Bd11lEwWEBK7RhkBJyK0OxEFKSQWnOBo6JOgzG
         DVBg==
X-Forwarded-Encrypted: i=1; AJvYcCWdmkk/FK1hXZjK2zFeEcojjajFJubx4/Zif2vEftW2+WvN6D9HcEStRCG4A2AaurT/VNgEfOZmGpO66Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQNPGFVrUp3cR6wL21IZlAMmJTspuy0BCTfOq40P/CU0GmIO0
	uI//+hlKCgA24zxjHO06VnkA2Rh0G+h0iPfagf1PnFMuQ4KRAr2k/r5HEPegbymNLCJyTKULGfd
	LIdlRCHvEfbkt2+tsdRwzYhTTEhYkhmlN+WtvNY/duSCq1A9zSg6Bo3EVhKYtU1sn1g==
X-Gm-Gg: ATEYQzwSA6/Akt7OiaHJ63xP55gutnVPdPVqeBUmH1JWKC0RYGPjnrYkK6rejE7R8S6
	zZabqG1dIBxYtlUGCl2owHvtIhusLeKItVOGA/NBPSI5sWC2lo9VempTxnes52j/CmdAihODxVC
	FsltmXnIkt38AehUUu+wwfdwIpMDvgNfelDc83pnVXolBIuOtmeW0IPmgaZboYY3d7Ww7UgbBsS
	BopylBl11CSl8aaY1KGZP4gbp6gHp1kn7mRkEf0JZKB4IkLF3c4RXfTd40AIBwdoUH01cv0TRlp
	HUNEXsjRscinFXdqqhuDGFff5RCrwqy1RJ+18hed2i7Ujqv8O/GU+o7yjTz3EfnTSBP1n+jc1hv
	Pd3Yrwdw4qIj4Tb8Az3RU7LSuqD5gejeGY84AH3JcnC1pIjZHr6kC2Q==
X-Received: by 2002:a17:902:e88f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2adf79c2f84mr157989385ad.26.1772446362769;
        Mon, 02 Mar 2026 02:12:42 -0800 (PST)
X-Received: by 2002:a17:902:e88f:b0:2aa:dc83:242c with SMTP id d9443c01a7336-2adf79c2f84mr157989045ad.26.1772446362253;
        Mon, 02 Mar 2026 02:12:42 -0800 (PST)
Received: from [192.168.0.172] ([49.205.253.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3c4d69a2sm66087915ad.48.2026.03.02.02.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:12:41 -0800 (PST)
Message-ID: <3fbf91f8-b8fd-4116-9fd2-b101154ac2d7@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:42:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
 <20260206-batch2_iris_encoder_enhancements-v5-4-fb75ed8fa375@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260206-batch2_iris_encoder_enhancements-v5-4-fb75ed8fa375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfX9cJi+664x45n
 C7fqOdrGbf8S9sM2pCrqdGmrXzhTCQhhiseetRE9qgT4R+8xpBeD0YB+QcbE/GkDqZ2wPPI3Mj5
 rR71u7pYT69kXKOPKKjmtv8Hr16qhZ/GMk8VkOldvWJ7jTGOMGW4/QuF04B6mFSoGBHp16sssEV
 K25f8IA57CBmD0jqX+0T6KehLXnxdvEzL79Ilo+7QB8b/MyUXl2cxaSQ8hcfei5r1bE5QWLdNIE
 irfr97Regws3a5wd9a+/qOw4SqKTE2QO2LOxM0ctkwT+0GLNbEgZxBGWLEHB1G0hebBUzRCPTpb
 18r5w6zjqVRLLaF3Vx5pcHGlCR0cD5Qgrgj7beKZLaR6AdslIAU/znc1+XbsNoQnH1Pwo/dK4Gt
 yBClTrcwZVWrEw0qgsezw9T3y1CW6ohbIQxPg2JDyy3aBAN/eKaborrYSv6+3XcgQFYbzp7YN2V
 s3EKWGknkjhLKUdj8Kg==
X-Proofpoint-ORIG-GUID: B1tKJKuizOEVOey2eapnSMbFmeCy2Qgg
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a5629b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=WNU4mP0iZEZjDg176sUGxg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kPUnIz1Ah4fUb2HUMqcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: B1tKJKuizOEVOey2eapnSMbFmeCy2Qgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020085
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54077-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E4121D64F7
X-Rspamd-Action: no action



On 2/6/2026 1:42 PM, Wangao Wang wrote:
> Add hierarchical coding support for both gen1 and gen2 encoders by enabling
>   the following V4L2 controls:
> H264:
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
> HEVC(gen2 only):
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
> V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

