Return-Path: <linux-media+bounces-55607-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDi8KZDRs2ncbAAAu9opvQ
	(envelope-from <linux-media+bounces-55607-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:57:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0BD280168
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A51C30315E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBF3305E10;
	Fri, 13 Mar 2026 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsawEOP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIDTb5Qt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52603242CF
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392180; cv=none; b=db+KjlQ84hHXo3Xns1T4/QPestIAYjkuwAaesSgP8G94HnAcha/WfGBktJMfxzR7r5YkDiBHwC96n5qURyMwJ/SMJ4rzvAkkTRU93eXSEuIW5ZI95Nqj4cQcSwjiKZPO7O2GfXvSuG0pzk4w+HRXrdRX/fisxNN7mXStgr4P93g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392180; c=relaxed/simple;
	bh=x6+eV/R96m8je37vMamUbxvckpVf8Jd53USvzCJFYeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEZNJo9Sp8aRR7zLejctovXNFXELrHF8wRZ3gleYE8MOq9+QcM0VtgOARKEl3xQ+57LRb5+/zhw/NyRcghSmFaBNgKgJeFaQ/ncMGIuCWuOiuNDYoFtERWc6mnD2eJw3MKIyt371bZygpDwMc//MUVBqddSLEuzJoaOGm4/CvK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsawEOP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIDTb5Qt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oVJk793568
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hHJ+OTXo+29v/laS7IzAJmVSdR/9siZcimaLF71wORA=; b=OsawEOP2mO5/7uE0
	JLJ+tIMOGTKsnCzX+tNE33rJ9jHuD+cheT0EY9MNEJIQpUBSCnZn0hVb0lcArYRH
	sFlfI8XtCOJ0qSpYrB2gPSc1Xf3n3lIuYMQazf94DZX1WGcE7gUvawhlzsIiMyIf
	LCmZA8n2fCGkok2ncrCw5iZqrqHrpHN9WCRHYtwXZWP3zWgQL+05D+rlzNPsUQfl
	hlQ2VZ5ViuHFCXTWppA08zqdD4sqsd8xOMAd9ZTrqHGZbRiA1JtvhRZ9tEtYy7V9
	UznpbxPjUp0Nlo8vOIILjzAxpvAq++s3WrDg8ZGMN4JUdnFlTP2v8okdT/34fwVh
	Gny5XA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt0f85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:56:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aece14b507so5172335ad.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392178; x=1773996978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHJ+OTXo+29v/laS7IzAJmVSdR/9siZcimaLF71wORA=;
        b=YIDTb5QtBnIXM6YJ7GZwcA/9UYR966T5LLDHIffKEjW+pdQbwHeTuv3hKFSnlXWu6O
         VhFLTylBD1bODOH+QFMqNwS9R0TYWUJdPUaNtNfqOjiC96TfCvNVMG4rrdGp01b2YgnH
         i9kIv9Z504POGv7SqnkcoGuE/twWSa96rqeRQdJNkpRdFwZZWr5A7ZNGc7i24Pu7sPve
         xgXnFwcmSSisqItRleZuszAOCv2nnXdH4hdmpYtsHbbeS/hWMBi22K1J+tK+ELTG11j+
         d8jIK8euNehOT2vxaGxrkcnhwr94Ahl3K8vLosmzhOOv/6QxtTBzOX3RTBL+r55eSuXj
         SIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392178; x=1773996978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHJ+OTXo+29v/laS7IzAJmVSdR/9siZcimaLF71wORA=;
        b=Mb2weBIxtbGaGXtSlcLIq6Y6+iKbhvL3Cy63PCK31E7rCfyKO8IENRB8Syojd1cva2
         v0H97VxbNf09I/1FQE9q4bBNj5fXjmXhFtKTS5WhayLKHJ01CN+EJoltJ3to3zZ8ozI7
         3BlIqXYKIWvLqKt+SM9K2Ra99OsPLjM+k2Tnf9AF0Jt0XtVWHo8esfxPlZ+vMO/M1IQq
         Go7KYJNBFd4miAd6im/2j8aC3kA9XmXaorrN/C3g6YJaSWYrkctVsj+TtSx7y5XxoTk/
         wTQMMwmZ81CX9djM6H8wUrZMRTMSQSDdGNvBKesMIfRWQI7GytcAYQFQQe6QK+H8cGq+
         PWCg==
X-Gm-Message-State: AOJu0YxQ7YfJm//KEO+zg8FAXksnKf2/mhvRAcOrBtwc2YGh7RqpA/wK
	vbTK2BPjCGz8JSbq0YMum1V6wd9+CBj8YqsdBy349NyWCg2lwGC6hKejOeJ8DyUU8YHL4EA7EmW
	38aXtvYk/8But5oUpLnzSaTeioP0T0FdZ/yNbpK6L1HD8ajkDBbHvprsrFEJ+Zx3B/P9JJGuVcg
	==
X-Gm-Gg: ATEYQzx+UJFgs0wIeVjj49aaFHB/jte7ehtT5tiwxrHumzfFDYsoSftx4R5eAwW2gA+
	GOXy9pwd+QjG3TN2wfG44AHKPDr3eIwDXGXglSWfWK7+zyehL0JKSFhixTMg4oH3NnE+ymUTKvj
	KbUYasZ7kM3jA8ZM8TU5uvQGYkpFNeaz6mpT+qUhTx5VIZp1BpLq2Os+59dQ9mj00002Xk7MrOo
	BwBjEjtuv4cjX7R+MRChPe3XHi34tXsOwd6A6pcFHCpRcdmPJKVmdNRbM4QA3/QYqiWpv5z2FE8
	m4s6pc1qy/qrMVnfhPwrzXnWMgKTX3paMraLqEGt6PItXCAHpulKf+lVU9MeAKBOxaqtkbfs3mo
	sxi3WPeiHk3gCPc+5/fHJsBm8dESTReksYC8Vai1ADdId4RY1RcNE
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr28452505ad.37.1773392178086;
        Fri, 13 Mar 2026 01:56:18 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr28452215ad.37.1773392177599;
        Fri, 13 Mar 2026 01:56:17 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece858d18sm15261675ad.86.2026.03.13.01.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:56:17 -0700 (PDT)
Message-ID: <efa27939-67d1-9315-96cd-8b6e7f99a3f3@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:26:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3d133 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fdpG-Y04AcStmw4gtO4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m3RnISvHK4WIObGqaz0lUAqWzcWzlAOf
X-Proofpoint-ORIG-GUID: m3RnISvHK4WIObGqaz0lUAqWzcWzlAOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OCBTYWx0ZWRfXyFkLKMMiIfap
 FlYN2+URZa+3rzyDl8c3xyTqjKyN28qfCaabXGFEKVSBrQ2UmjTg1y2wUvER4tww7VEh+2IkxLM
 fGGdLKuqcJNFeiDmDihwrlUKAGWYU1Qn4wzPFGDwEhhJH0dofKul47XGHkSZwcn2plHOgN48AH6
 B/L0ikuw6CvgSBjiAh2OyPu1eOOaTTkCB/mHfU8RYAO7e/E+OLLdbHtOVVZMz8p6Nq7EgiFM5Ba
 WvZS8GeDY5cZ76pCwoIQl0VTeb3vBCkzd8CsaJTZ2F2/1MbcWUEJup7kuy0SYza0leQikzk01K5
 6ZvzVQ4MMMgxQdiTa+xK1kB0uilxlJ8OlsVrhGkUoDye6GAWm2eXu/6c19XrQwFT8Iv2ILa31K5
 +OKdvmtyfVc3sFLwYKJyq/av9rF3zYboG5Mc3XvF9ING53ag8SIgG+gDPJ6Un+9WMcbRGxEmA5E
 zKKBwTOK664UvCwdsEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55607-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B0BD280168
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d1daef2d874b..1a870fec4f31 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
>  	IRIS_APV_HW_POWER_DOMAIN,
>  };
>  
> -struct iris_platform_data {
> +struct iris_firmware_data {
>  	void (*init_hfi_ops)(struct iris_core *core);
> +
>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> -	const struct vpu_ops *vpu_ops;
> -	const struct icc_info *icc_tbl;
> -	unsigned int icc_tbl_size;
> -	const struct bw_info *bw_tbl_dec;
> -	unsigned int bw_tbl_dec_size;
> -	const char * const *pmdomain_tbl;
> -	unsigned int pmdomain_tbl_size;
> -	const char * const *opp_pd_tbl;
> -	unsigned int opp_pd_tbl_size;
> -	const struct platform_clk_data *clk_tbl;
> -	const char * const *opp_clk_tbl;
> -	unsigned int clk_tbl_size;
> -	const char * const *clk_rst_tbl;
> -	unsigned int clk_rst_tbl_size;
> -	const char * const *controller_rst_tbl;
> -	unsigned int controller_rst_tbl_size;
> -	u64 dma_mask;
> -	const char *fwname;
> -	struct iris_fmt *inst_iris_fmts;
> -	u32 inst_iris_fmts_size;
> -	struct platform_inst_caps *inst_caps;
> +
>  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>  	u32 inst_fw_caps_dec_size;
>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;

Thinking further about this split, I see another potential issue here.
Some of the inst_fw_caps are not purely HFI dependent, but also vary with
the VPU architecture. For example, on AR50LT (Agatti), certain capabilities
such as rotation/flip are not supported, even though these platforms still
use HFI Gen2.

With the current approach, handling this would likely require having the
structure in lets say iris_plaform_agatti.h which would be included in both
iris_hfi_gen2.c and iris_platform_ar50lt.c which would lead to duplicate
inclusion, the same concern you raised in kodiak gen2 patches.

How do we tackle this problem?

Thanks,
Dikshita



