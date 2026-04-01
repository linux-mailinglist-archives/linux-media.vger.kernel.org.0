Return-Path: <linux-media+bounces-57834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK4dJJewzGlzVgYAu9opvQ
	(envelope-from <linux-media+bounces-57834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 07:43:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB697374F0F
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 07:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471483036D4D
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 05:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED16314A84;
	Wed,  1 Apr 2026 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gS+87nU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJmGQwTR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A02314A65
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 05:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022202; cv=none; b=J449r3DMVobmvwrAsS1vIFuYJrVVY5BpaQsD6HC5HuMbgJj2l+U+b1XdSkYT14Nhc0XV5J4UxfnKQQECV1BEh36pBi/+i1c0WLH5s5n+e5vEzS1QEiBupRWSJeAXnuzkHZw9KwqAdIa0cCNryhsJlRL6kz1ubPIXKMgTAjHwGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022202; c=relaxed/simple;
	bh=Mh9atjZ3vWCFgxqhRAOyKjH+ZWbXXCe8gyF45fWZt9s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y9QKSeYU2Yvx5uHBHuDP2BI21ZYYXuCj7xdCifl8SBZw1tTUKuWtbl9BbzJKuXgY+m5Zv7sZAqczDdxHdZ+GjyCvfB2E5blI09BrfMfODLkoB1HRrGh1AsxqpQDHfZHXT6vIS9L/4HIy7Cbch/XN9CeRdWjG00mvkgsVlisWXpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gS+87nU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJmGQwTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6310BaIK639203
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 05:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0+jdnxme2hDijRq1AfMX9cx1Hmd+xEJTiwAquw1psk=; b=gS+87nU4AHpcqyOR
	QuMxPY9UvPBvdVaYLwuCHLeiU9GeA0Cic78v6+O5fJrmCw/bvtDLQpUr4kXRNSBF
	CC+sjMeT3g6lkSPR8T3ehjfDO5lJpl25fWmIa+P11SnUUT9Zz+djNFDcabC/zd83
	kcm039I8dPEqtJCfHqaXOxnjFtrC786vlES3C/m5PdwFI+2I0xvIjtpX7HDldG+p
	vduMa3cUQkPyMHv3p/5MJTpO6DbqLkrhGJmxP24BRUXKDIQu+WdogpUz7vcJKAde
	E/ib3sWjAYeMfpO1L6iR/3d4vo47A4hoiRXAYz0jtR5VrD3UsPkPEly5IfImYV9K
	dLKDGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auhed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 05:43:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24308165dso111153695ad.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775022200; x=1775627000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0+jdnxme2hDijRq1AfMX9cx1Hmd+xEJTiwAquw1psk=;
        b=fJmGQwTRUC6jadn0yBqw2Ucvx064tGwYxMCb/UFSpRLn2zIBrgk0uaEs4E2ORkCzQZ
         KKH5BCt64coqHBrUtEp7HrpR4yyb/qgSQFhCHNV0wfZGxba/18pnMCWQaC4SXyKtVuMU
         gP4gzPj/GMT+wbvPRmgSDHIwkbi8aU+jApcpmp2eVRx83QnvO+gcHs6G5gos8rfuUbe4
         eEiCiOOxxiv7HwRYNXRT+u1m6vlKA+UoZ+oiBsDUsu6rpUDvE3b3Ghjy+1JiEwtSIPF4
         Yr6A1DkzEASw4zG0r+1rp5QLdnrosR0/VCPOQbNYbRx2pZ/9BThVmlVGYTSNfZwmmRq6
         Wm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775022200; x=1775627000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0+jdnxme2hDijRq1AfMX9cx1Hmd+xEJTiwAquw1psk=;
        b=D2xZAw8FenmgvWUPxnD8oWjGRER5h3QeJ0b9cSApW5yA4l8wMqHkMkaid9WVthyv1N
         e6+KD+ahJUvczqPlD8fpv6Ti+mXtyKoLjxpbW+XQI8j3dsAtM4gX/YVdS6+fjpbZvbG1
         idUTgcAL7oKwpAnEbHgkrXlrV9zFWILgk0L3C2FXm/Ue7KaxqkRkJy9haOqapnhW6LzA
         AA26LuEONGGc8cKJ8ZhUkGkTMsPO6OxZyMMZ+MIqM85z9efNfpsputwsNPEZt//BPV45
         kzDK8UGGrzsxWdZzwD+XBPopH9MLSvvhxq0ZTvrASo33FeX09FQ3dclOQVnXCaSy86C7
         HAZA==
X-Forwarded-Encrypted: i=1; AJvYcCXcdFlIibFU9fWAaTvTs3tLQr++VHXGVojdBha+jTfyWpb4ADPCCq1tcHcJ9nFdImMbz4M2fOlMRubxTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3M3Jhq7ThJY/0vutMkQ4c2Eh2CB2+VjN/1Awa7h/AIy3qygI
	xQ6/etiKPO578wMwJhXTDUS/wjzcNTYiw53mmMlM6u+RzfsxiT267zZj9TMD1v7eKRqOm3+feYD
	UhP75Bl1u2WGY7hwrNxvecF5NSIh1z1KaKVPVDTJbRxHOlgahCH0jFbkf2pAHWUfulA==
X-Gm-Gg: ATEYQzza423E9Q1Bys5keB/8MpcToj5y+eLqUs5XQV9yOLMsOGK4ckcfUDywIJ9hU+f
	KT3bxRwEmkZOD/7hr5004sytIObGDJYqzjc8L8vvdpr5GfFBOgPcukCN3USGzzy5II1YSznxnZA
	LBgKcOYQk01dSO0uvvdqKCkohIMlU/cYKc06n6XhX0KVbKyPoMWtN/sq7+Aa7gSuMH3uHBf7bo8
	W5c/wvFEts5HCYpOkb+mVNUGrhstxrqPept7uAI34E5Iv/E7GXCw0Lq2JilfEortm+wvAKgdIKc
	dTxBKApF5sfwE7JsWdumbNtR+1DPkLGJKl8fgxeYQ8kFyWlTGKjljJkQSz2jqIMiweb5xgqYIPs
	paW57C5nrxwR/IXtxP7+nAZWjFCJrkxvmxZ9dpGQ+V8/RQCHukPlDwI/8fTRMwfH1V5ifKWHeEy
	qJTGr8l9wwZED+Olff
X-Received: by 2002:a17:903:1986:b0:2b2:4728:aa6f with SMTP id d9443c01a7336-2b269c4755bmr20430375ad.26.1775022199722;
        Tue, 31 Mar 2026 22:43:19 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2b2:4728:aa6f with SMTP id d9443c01a7336-2b269c4755bmr20430105ad.26.1775022199254;
        Tue, 31 Mar 2026 22:43:19 -0700 (PDT)
Received: from [10.249.16.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766396sm130136685ad.45.2026.03.31.22.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:43:18 -0700 (PDT)
Message-ID: <9e8d56ec-bfb0-4e37-971b-aea136373bd6@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 13:43:14 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA0NyBTYWx0ZWRfX0UtUBNdnrsGn
 RsJSo9NokM2XKz2Uz3qVWr8DQDrMldvclWligSwgd8pt/3/+UQLUygW0Vm1q+iFjTuqVBRIUJtc
 xx9G/9nmGE62qgp2/GlXBKA2hyeRgXViRWF1G9Sr9HntF911gFJvS1tbklq95FliJqjeSGj4YKT
 aSw6OXjeiGhJNMumPzCSVo9RHQT5ggorySB9JCuZXLSJkFuV5SDt25DLz/ORMXLeFHyKouJLYgp
 u9fx39/kLhGRB11RahI7QZXlKpmMrhWvAmoO/AZsUdqKHgHOQIxc7SxISUrpPWuoAjxhlqpHqtb
 njoeAIYTLRqXmk3H2o48521vUD8ZtFDF+8bLVXrIyeVmcERfA1zv6gi4LSUvB6AiB1MF99MbsZb
 KlukrN9GYhxFEecRjmQIyfiSILefcA/z996aAccY0NoApxtWLrMunxWrTuOFSV6z0pq+qTtiqe3
 qV5PHU7wfyU2E4Ns5fg==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccb078 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JiXDhBHymGWixQE-QVsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ecsPpsg6LOg-k03DI45Nq21haxbAcsis
X-Proofpoint-ORIG-GUID: ecsPpsg6LOg-k03DI45Nq21haxbAcsis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010047
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-57834-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB697374F0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

I’ve rebased this series on top of platform-qcom-7.1 branch, and it now 
applies cleanly.
Could you please pull this series for the upcoming release?
Let me know if there are any remaining issues.

-- 
Best Regards,
Wangao


