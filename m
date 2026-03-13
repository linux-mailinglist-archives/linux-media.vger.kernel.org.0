Return-Path: <linux-media+bounces-55578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBlhNXO5s2nbaAAAu9opvQ
	(envelope-from <linux-media+bounces-55578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:14:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A927EAA1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60C993059AE3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA5A36604A;
	Fri, 13 Mar 2026 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMhQVKwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4kT8E1m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070C3659EA
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385922; cv=none; b=u4WzXtvLS4b2TY9HxZh8xFPUx5GGDs+QjTzB6REMmgO2ui4QWnt4gAwKPhhSQ5xssC1fEl2dw04cLHy13kgtqE2kmsMo5FNUYQK+xciXycRkb5/kUEdQKZIsaXn9zdM3znA34FbuKRtHnUH0zW4uwdbpQrclMJ1r78bUK9lbXzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385922; c=relaxed/simple;
	bh=D6f/BwYXcJOrXzpLqcA4NOX61Awax9Bd1wbehrI+Ae8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkKabvm6nGqSz9rsnPTzCXeT64rQ9VxvxxBGfplBIRyDqWcWiRORoupTLrVlP1P/+Wn/dhjZFmMMAWjKs5Z6ZjVEtTa5Ya/jBPgzOfOD1Jid2lZH0I1Psk7CupUQkGKNpzm7laOZDg8245/x8p8dle1A1IDULyC2k+2M30wmzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMhQVKwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4kT8E1m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tYMh3229734
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHVR46XjyvGbQEw/YQd7mH/wCqOIBJhQ6+YqoOc2ars=; b=IMhQVKwOvVzdfHGB
	R2Qbis7dwg7yhdh/j+9uF184x3PSMPr8SrQlnUIDMIXJsecadv7V5BiKO3wTEWem
	qLuwvVF3B2IzdWnv0+0jW7UFaL6faZb/xy3CeB4viCrzRR5Emlad2vjkwL2/++k8
	3dPCUl3tmV/ON+WV8F5V4x0t1rwVTPXWILlK+nq3bk5anZL2/FBINez3naLiBiK5
	BzuWv46GyQ5lXGiBN5Rr2Uuvj3xj825QBhqYI5YwFu4V2fdEAilxZ5cgSQjbXKxY
	UDMNxC6YkWCi8Glxo3BuiJ6vg/x2IyqZ4x4mXwXJ5codktAC1E/NmVvTjeRZ6598
	3tDShw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7h01e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae6961bff0so148872305ad.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385920; x=1773990720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHVR46XjyvGbQEw/YQd7mH/wCqOIBJhQ6+YqoOc2ars=;
        b=f4kT8E1my5E+1tustQDZ2WRRx8BXGw4c0C0NLRGuR5AvL3dHMQVS+PEPgZ/UJneOGQ
         2Wl/7zdX3uhln0vGKSjSHIH+VRfxvpar11qreNIuzzIUW1w6uN0wjktovm43UBC/SQPX
         GleR+zNQ32QVl316XPbJEcVNYB+8v77sznQtTHem0M5TiEFDbSSobJCgk+6DiBDPMqQ/
         J0uLlb0bTIvZzxoxI9u4Q6WCK2iWEz2/q9Y5xzLQZS+X4YLrwX9wHwRigKKPTJfFQlnU
         SbsVY/XpieiJEeotsLOVWE+aVuiRL6Q04jGZSvSPDwD/HBKBY5SlkxwJtzdx05+GBpbj
         rEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385920; x=1773990720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHVR46XjyvGbQEw/YQd7mH/wCqOIBJhQ6+YqoOc2ars=;
        b=ppLIlhPyQxuO8DMefdoti6/DDeqUWs9y+DMzbaw1i9ydwmpFkJ4ionsVCkzIHP0CgG
         F1NLmbf+qFYh2X2UFLzKemW+A8p0ko8fV3YMT/wDEdvhl0pNYIqaa9gZLMpiKUYyrVAz
         wV8p/RQa0q0A7qfr5g0a7+FRSwCev6jGtVLX6EkpEI5rsgczfTLOiRF953RdhWnroLaB
         SwTGTce1AIFSE0LmTC/uTZa6FxNc94ujTKSevuCASuigMAVkDVn2dJnX1HeBmeVHFV6K
         cVzEWXrQ8b7bdMQ9rdA0f1t8HvgOOJc+jgcThthA1FxcG/GxCLJQy/HHm8EnUmk5H4Ck
         zpTg==
X-Gm-Message-State: AOJu0YzjXre86zCYd/+USSnAM8w/BQJn4LRy7o83WiNQ3OiB26Cbb0U2
	Rsm+N9zvZq4u3wLrURBl85towGc9o/cp/pFQpHrE62xZzYsPnxlQXW1dJ/5WEKSLT73m5enAO2b
	OgeuJsTOxO6TJMG4sLGAsQ68DW+FXnrbY9YTiaBQ+bkhPTtGHA7mdxGVvbIq4pbfRGA==
X-Gm-Gg: ATEYQzynaz0XJ4JD/nh+6QJS4P9707Z7rJ1dxNFZlFfHZHfaZFGypg+COpBPR99gu3y
	T9bPZKjOFPVWqE8ImrIdVzBHsR6oOSSvspImjEg7uGxdfNFaJCQ0vWFu5Qby4kXZ3pL0Oqns6dS
	aMpKSIQUf6WYZK6pnbZYXT5fTuHSF/TgRoaWn1rdjTDnBM6bTEHCWMsyoIljND4LfwqyXYdG8LN
	SsSpbL2FcIQcV34eepx4WWOeW2GlgX3QFgaf//0fmVLOWWI6w560GGxXV7OkwnfKAGF4M0dOcvI
	mXNXpwH/eAj7elwXBrFzsT3mydpWrQSYnHfEn83SFB5MVVYub5K18eracxjDj9SKSSeU+uHj+I6
	4VUoMNZnUDV4AgwnzldtkyIkycWBJew5ZFNvUMEx1jTg8K5NdvuBk
X-Received: by 2002:a17:903:1987:b0:2ae:cc1d:f902 with SMTP id d9443c01a7336-2aecc1e0051mr18831235ad.25.1773385919976;
        Fri, 13 Mar 2026 00:11:59 -0700 (PDT)
X-Received: by 2002:a17:903:1987:b0:2ae:cc1d:f902 with SMTP id d9443c01a7336-2aecc1e0051mr18830895ad.25.1773385919498;
        Fri, 13 Mar 2026 00:11:59 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cde9sm14362255ad.15.2026.03.13.00.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:11:59 -0700 (PDT)
Message-ID: <cc94318d-fc77-3a25-e835-d50b2a7559dd@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:41:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/8] media: qcom: iris: split HFI session ops from core
 ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-4-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-4-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LihA8IqX0Db9-fz5z39F9hX4h9F1TQ-3
X-Proofpoint-GUID: LihA8IqX0Db9-fz5z39F9hX4h9F1TQ-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfXwRf1hxmGngTJ
 MghZuHj3spTCzDBLZQUlWGWmc10Wvdmy2zS1VbHWHZqmo0h3ykl8NaV4O+zSkXXtjgG5x6xkUbn
 8BcSSw9pEOapJnJQkIBVLFLGGu5iRAucKjtnPNfDbcQBXMIOnYc02zW5UPPveguI/DpxXFeCK6n
 yHBMAsMiUa6qkOd76ADpfMLGAljUGZxh+u2Wonqx8iT4d1DYUGQZN2bOXSFvzV/nVOWRytYDT06
 45L+6lgcA5mMciJhETw24JU0qaXt8F6aVJ8rh0ooQB7lJ50RWFiRf2jltlXNTfE6vIh98tdxEXD
 5W0BkNYBILjktTbJpH2Neuw+cNgaAsrXJOoJBziVjB8Sl0pBvqDOTzoNonkm4zoSlTD+Jxs8ae0
 zKpoTDb921ah2sYjh8jCvQi7+GVa4gmYeWEtjpN3FmfVKs/WfWaTheHELR6wsPDFWoeDcLrw4b3
 GWlBW5BU3tXdVJ15y7A==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3b8c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=loUjW8O-33FAN067BsEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55578-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 567A927EAA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> Calling HFI instance-specific ops should not require double indirection
> through the core ops. Split instance-specific ops to a separate struct,
> keep a pointer to it in struct iris_inst and set it directly in the
> get_instance function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  4 +-
>  drivers/media/platform/qcom/iris/iris_common.c     |  8 ++--
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 46 +++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  3 ++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 23 ++++++++---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 17 +++++---
>  drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  6 +--
>  drivers/media/platform/qcom/iris/iris_venc.c       |  4 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  11 files changed, 72 insertions(+), 47 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita


