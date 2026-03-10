Return-Path: <linux-media+bounces-55153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH45EwwfsGlygAIAu9opvQ
	(envelope-from <linux-media+bounces-55153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:39:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC1250911
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6936F367FE83
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0095E391E5E;
	Tue, 10 Mar 2026 12:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2E2/h1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5j6Ydih"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C8325486
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145552; cv=none; b=XxMR40JpBrRFlcAY67o++RBt/c6Su+Kme1DGsNyQ2mIvV/rRk+/rI4Yd6sesy2PloHtxgQy80QGRreacEbhZzdhq9QyXgnGQcXoQaolhmPmdQt3di8242C3G/Nu/GuaZukeUOOdzBeDQntFwxUQA2mmR3B8M6VqJW7nVBct+X5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145552; c=relaxed/simple;
	bh=uivgBP7K/awXFJGAmcE0/jOh3d0JyXcOb2NQTmTqwlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNj1CYRiHXMh+CHZZMltxqWiyFKPigRr0bJHlcdzlL0PbRWKQjgOAlHE8+Kz/UIhO8Jjsj/xGv6/7im05FyTG8yovuuyGBj5k1D9wrVhs5HnP603bAQvr+VKL6VQ/Io+sB+n+Gu9XY1cX4N7D+VN3OEtYzxb3S/dW77qiSBmqao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2E2/h1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5j6Ydih; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABHaWH3243827
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=; b=C2E2/h1S9IIaiEH+
	afjDal5/1jJXEex6fe77nvxycyOLnufZhgmzh6+OyjCXfH379LQTXZMBEI8kNSLI
	eP8kAGAFE4TnZlLgVoKX9BD4Yh8N8E7Rh9yxmMRRkFsoWYJoLqMJpQAiOpYDlXsR
	svYHQ5g9EU5N42NKUf1bZqn9KHI2i4vqdLrIEKlIGtuZZdzANPqUT/3Qa0M6SzBo
	441KsnGfXtQlP9U1CnDlaALMQUAf3lByqSZeX6oA8xBcjEUY8Udaxj81x3/spweZ
	Ntbz3kIv8cIVJdYJVPpcHmPC2ICxTG1YKndwfsbX2kzrPeyoCIeUFw2FdayD4/xK
	dAAVGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja287fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:25:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so1209449885a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145550; x=1773750350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=;
        b=P5j6YdihAp3MSW8AaXzYmfvBqE4fw+ydOSCOXkxSTYPINywxHWePVsdmREOtASGomS
         i/3/rMMzpAggvjQcBLqextuV+Pi3xezB8X426Ja9ApXxNWb0t1Cb1GnIRbjEKrZ9k+G0
         EyuiZNMhj9n6Lfq3bud5pmqt7bfLak7uZwzJbxFRiEzGyJHFMsxTjqUpa1DtGf29gzho
         LTu74MjsLTFhJP60n3FrsUBj6XWon55wki/tMNaE6GjsyhV15ZfX4mBGPD9aEqrGfkA4
         NMHj2kzKDEyLI8ovFRsdhYpvVUNzy5IAk24FsHGuftFkN9yyqNV8cyuZIjD5gJa9ZM6P
         7Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145550; x=1773750350;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=;
        b=KysQ+mRJ/AkW6mvv9Z7hcvxXqRmgvG3rmpsW1oVK5IhDUxg+AcAYwRod10xz9d1fGQ
         wOcC5ewmZmtlEFuBvEGNnsHVxerrtk8ckHtAlEclc+nR0KKqrF/4UizYNG0NyAR6KIoH
         ShkJpBha6woQqXB8l03N0TMmNlstk6SQ0t06QR5Ma1UJI0tRPFgJmGdQse3lpnMCvNrv
         EfrYc6QbK3bfqkS9LzVWmP3YbPKHYJIsd2qIXJJjTb0yEJ05F+EPKf9nolWfWX3OLHa7
         g90/ZUSo5Q0qW8S60Tj6HX4cX4G/KoOxThXQi/65EtQu0RWIkzFyfgBtGRAy4xHefZOW
         FlKg==
X-Forwarded-Encrypted: i=1; AJvYcCXW8NVnMcF9UmL/Bo5mU48DmVIBy9fZLAV8ifwVaixoVsN720y5qcu4OpyS/yont3PIXdRYmV98CiZ9Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yziu2PVQUsceG9thfuB0LI10VUK8kTYXqxGn7ePH9cZr9t8aFjF
	9G1Wklwa3oqhfzmiEwS8pfC4Lm3IkQCd31qg7L3+PAEm8vy3Gn+MvDF2B6ZEVjC5KiJZRzNLejE
	TKgcDsoWIGHaGAaTTL9EjdxjjWe2RmSHGsVYJaTYiaYcJHXn4eRxIxlzZQTFsfn01OA==
X-Gm-Gg: ATEYQzx4u1sqdEGUO8i5LVjU6g18LTIBcB3aUL618WJ/JtQcejMGq5CTApqlzPnDut4
	nmglPTWr64xFGsRO7n1RgNMkliOT2+5DHcmac8SoXf9C5cDvryQlgSnfnr6etKuhg/7N0IulnlB
	rK5ol9lovniVywHgcPN9q8iC65Pcok9NjfmPCd3Uop79Js6oMK7ysHk6VSel3+hpo+Iy05/jWy4
	4Qsqniv9jgQOH10EIUbzhIyKDOdkDq/0N0OTXGmueFQtT1euRl0BZnMDpaACtxHz+YPElAW2NCZ
	oNi1Vb6NYSrIX8BIeGGuPuBy2Bw57lI9Bi+ws+kAigvV8duHRmKIBDN20nY5/qq43v/nVa8UBWF
	2r/38qkNno9vhLoiOgpd3hIGuBiZXJkd48cKVZxBgHjhFgLHA
X-Received: by 2002:a05:620a:29ca:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cd982d4247mr136295785a.56.1773145549431;
        Tue, 10 Mar 2026 05:25:49 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cd982d4247mr136292885a.56.1773145548994;
        Tue, 10 Mar 2026 05:25:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d8a7sm2641960e87.92.2026.03.10.05.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:25:48 -0700 (PDT)
Message-ID: <b8d70886-3b39-4b1d-a91e-ade3a71a3fd5@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:25:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b00dce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=F0yalOKIwk99E2MxTuAA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cIbIzUx6wXSdXbyjTOj-WoM48XLbZ6E7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX+2hR4JryVenM
 wmFWX+8CSex/xawR8vbLWxrkc36NmgfkOt6e130D0kWfRoxfu4rM0vMeekPNlvviq1US2Y2caKO
 t3gEZ5044li9Yz8CszG2K62pMOY/Mco3o2xCe/siRimwVGxKk3fJWlIfwetHFjAox/RyivrRY1Z
 XZ5w3YlmQkvAgDBTXAdRWEXd0PMLdcl3WkwF/8Ml7c39jvK+kSM0ARiqFBh6oFvUlxGVczBQoQC
 TCqczDWZx8rldokUWf7ejCycNjc/LQKkTD0EW3kyAYR0WwDV/iOTTZZ/IpiuX+x9ThdHTSreUQH
 rTHVe5ak6DSedNNTAtJ92i08EttuAGvnRs9xUwtvOkUsuXMJMU0a6I55mZKl9iCF6fyE1nnMGXX
 Dgl5O8j0CR3PBfVA6CaV2qE9upWaTO1dGcmY1p/bPu43pGy45qhesk7olSlqwFTa9Lqg+Npugcs
 kcx3O4tpOX5dnhVeLMQ==
X-Proofpoint-GUID: cIbIzUx6wXSdXbyjTOj-WoM48XLbZ6E7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-Rspamd-Queue-Id: A0BC1250911
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55153-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 10/03/2026 12:22, Krzysztof Kozlowski wrote:
> scp_ipi_send() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

This email bounces:

"Your message wasn't delivered to mathieuu.poirier@linaro.org because
the address couldn't be found, or is unable to receive mail."

I got it from ack here:
https://lore.kernel.org/all/aS3AU0gEEOvWs4Uw@p14s/

so a hint: it's nice to have templates for responses, to avoid making
mistakes in own name/address. Mine is for example very long, so even I
could not type it correctly...


Best regards,
Krzysztof

