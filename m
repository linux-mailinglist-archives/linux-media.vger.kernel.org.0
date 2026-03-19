Return-Path: <linux-media+bounces-56304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H+ULoy7u2mtmwIAu9opvQ
	(envelope-from <linux-media+bounces-56304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:02:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEB2C846B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E834A3006B49
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE09E36D4EF;
	Thu, 19 Mar 2026 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYoDDQZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRW0b9Xt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E6370D55
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910909; cv=none; b=jCncQWGNr4AJErv0zxXrepOjqoCnNg1sWyeqXyTo73VXqS5fwe+2o63SW/+RZ+wwmfXxXffXB1hoI6bb9MvigRd2mHIpbpeq+dsLrFk9EJSCvcRfQzJirKKRQ7BrCCI0/17CJcTHiCwumX2QuVOcHEei3hOzmjgr4kdr/VVEU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910909; c=relaxed/simple;
	bh=pUlPuby5FCrzzhCXAiHAq5t1s/9M+vm39MPiJ8gJFOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WEtjWvBQ056fY4Mj1cccttegkiQVfHGgKW3b6KeR9qD7+sXVTlKGTjB4ym0mch9ooEe7b8+EDPqpr6PuxDcwowjlOyq1n7BXs7Czb+cwvdr7DOE1A203JH6L1yImQXVWNIubE/VT+iegI6l9CJvrSE+cJCbs8Mq6aIjwZqvz/eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYoDDQZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRW0b9Xt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wCF3927153
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTxZNUAl/xRiwP3hZFey+yB2ij2EK2jS9EK16CmBvWA=; b=NYoDDQZntaVHBa/i
	h487uDegUYYevdXfM3r8P8V21xgAUfi/2QfuVCJKHJQdQa6ALrZFfLUCftfm0Pc7
	b+pOY/wLApOD/YkPN55qdvS4OPM7P0F47qADbcLUNyxDNHCDRqAl2jwfUTDE0MPl
	z+qKrBeXKn3nnPzITzw6CiBVFhhm6iEVo3sqtBmHoxCvva7RtxBSGAJaNZ5MwGfq
	S9hjg/0Wd62BOMqrFG7dOYNTRXBkk2qwISR7US6M3qTaavfkvvrZIciN64vx154B
	CzpihmPVUTEajzdPbS2iuzMkoMRrqP8lqw1zwey4dj5gH9VfMvoeSYFAisrT4Xby
	jUnc8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1brpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:01:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7381a9a932so937045a12.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910905; x=1774515705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTxZNUAl/xRiwP3hZFey+yB2ij2EK2jS9EK16CmBvWA=;
        b=XRW0b9Xt2ti1ZjWhBNiXDc2t3GUBsUQAn0VGvVh3jYHPOQM88ggX2KzXPqzU2GuRyx
         JUP52AI0jywmmGI5WZMZOxM/CHMre473A3UlpMJ2WgYi0D/MuQCs7Wxl6xew6fE54JRt
         CssnKzr0eTp38dYrDRitAuGauh00KaXzXAGxjOG5v4TJyxnOSH6l03zngM5Tko3ukioA
         4gKBKC0/DFKy3qvYxA5rBQmeBkkwbhRJbvTnSEmfw28pa9ocRRVQC7oRYxyrfTX9AXoP
         csZqIgvDfDSBBoEnmAf746neYE3+VL7dU1O+8Mb17mLaQASPBTVNcha8PAXQ3ygzZKeU
         8KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910905; x=1774515705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTxZNUAl/xRiwP3hZFey+yB2ij2EK2jS9EK16CmBvWA=;
        b=UCYHuzCjDNIapnEf1evHs7uUF0Er47L9M9SEKHO3kSi1nnYnW4FMozo1XR4WS8y3lY
         1z6y58F/Ltw7KzH6JI2BCLGw4rHMn28Vp66Bdfxnzhwje1QfRJZdmSD3NEnnZrUKlr2y
         V96C7EmD5jFZrdxWT4Hl8bQK05x/z+ewSaqyaNztwVa7c/4TPfWyBm9pQ/+64eT8b3gO
         OPO/JO3WXrRMV/yrujmSkxeKH+JjCvTuTVx/rwDlL3U/INaIZcdWMtDxd1QLIVF1M9Yv
         bLqFlRRfVl0yiZ7otSfW8s3z+50RH8FrrMPAvUa/t5QaMmzXvlyL3Wru1wA4XNUbloXw
         lS8g==
X-Gm-Message-State: AOJu0YztrouYi1K3aMWXsm4vidRpMeKXwjtCOjQyBs4lTcVrJNvWor/v
	Ab/jo3rPCuI4PQLMFTghtsrKLvedkB/S7uhZBzxY6t59bf83i/px3xAwt0qVeFE+W6Rc0+4c3HL
	0rRI82OlGPgw1bn805v6xQbD5Bj0hBnmvYUiluwZwxgTlpr8WMpo76KPk1KYWVSAevqHqTN/21Q
	==
X-Gm-Gg: ATEYQzz48Fd8Wb5lGjZq2RDPu2q9/luz0piEBXtNvKOjPK7LDJcSoLMGZzKTCyxf0d7
	PbANwUaPxHOS+xMDbFAwF5vpKv+qWX04u5GoLrnjDRr9Quz1EGBuKP0hlguuMeeNfXX8ocebFfq
	fX7SEc0fJjwBNRw+NXm4H0okZFcMSrkTr5z8n+Yd5np+E5kz9etYwq0LwWskzcBKDOrtGabujr9
	3wubJZzpEbc0MZyyuBOFZJSpyBJec8NvxwslzqZ0d97V9TI+A0P4s3aX0TU5gdEOdXWi48KuSSK
	QQoxTSxRxCdyoV6Zkwf9+uc2eX9+MVwRvR8ZpSNGQcj7koV+qSp5iYxfuFyZzGPzrLXXp4OaEPV
	uGoAvFlQyAuFoHe8zPn+KMJcBMjNiMXX6HIxZZjgaDl1wSlOoXK5qzw0=
X-Received: by 2002:a05:6a20:9d91:b0:398:9099:6079 with SMTP id adf61e73a8af0-39b99c8f8c6mr6353051637.7.1773910905193;
        Thu, 19 Mar 2026 02:01:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:9d91:b0:398:9099:6079 with SMTP id adf61e73a8af0-39b99c8f8c6mr6353011637.7.1773910904582;
        Thu, 19 Mar 2026 02:01:44 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.254.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56791csm5213281b3a.15.2026.03.19.02.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:01:44 -0700 (PDT)
Message-ID: <bfba4e6e-94d7-4968-bae6-4beb3b01eb9f@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:31:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-1-55a9566ebf60@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-1-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3yfnKebHHQIoIFPPg-OGmD8MvSJ693Lm
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbbb7a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=vmayvKaVtNuonzR42S3udg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OinizHH6AUJIbddlOokA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 3yfnKebHHQIoIFPPg-OGmD8MvSJ693Lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfXyurk8XcwLxkm
 I0chdsymIvjSbJ997tA3IKSgjp7c1mo/ifUvRkBMtopS1/uVslwuJNyc56NaCcBnidRaPHbAElD
 /MCu087wPtnXzaG6oCGUKtEIFsylCQqfuYmUEg8Bg1H2XKXYBGrS9PDZpxGb42GhHimdMfV6lnq
 2n7CmeP9D/VFgYauOd1SBdPvYPjzckUZ/v4TPPLG31k1yFg8MMOr+IjshSFylAqK3gMvKaZVqz6
 buHymofd0iylwk20knEAsUkXHWIAz3fes5zET3qZza909yPpF6ZrCD5ejrJXX9Z/IEt7/pSD9xc
 /H6urEgcXY6Ou01iW4oJPRlfueIB2yqZVQ1KashLGuC/iH8XHNgXl3SmTNalaeJGgH6WM77mLkG
 /WHZSXOUQQ0KFxuepe6P69sxL40itU808EJ8kqUVkPufTeqKwZicmQguY7PeNn8SB8nzcgled2N
 Sp3fOHwSSaTbJ7Hc6ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56304-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dikshita.agarwal.oss.qualcomm.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0CEB2C846B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The PAS ID, the authentication service ID, used by the Iris is a
> constant and it is not expected to change anytime. Drop it from the
> platform data and use the constant instead.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>

b4 trailers -u ?

Regards,
Vikash


