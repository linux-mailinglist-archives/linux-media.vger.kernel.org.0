Return-Path: <linux-media+bounces-51635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKA/AeyjeGmGrgEAu9opvQ
	(envelope-from <linux-media+bounces-51635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:39:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB793B3A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01735302B3B9
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6D53491C4;
	Tue, 27 Jan 2026 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/5zBG0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXemKso1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD89347BA7
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513935; cv=none; b=ue559mY9j95kiJI1Gqu7CEsuairFEGxxXzkUVG6CCAWDtbmrLTgAfiakBYqcEdi3Pq7YLVI/NxmnJM77pZC15ptRrLxILgZa4nQnQ9/CR80OWA2zV2cWltbjn6F8uCul+HvfG0u9qJpmXCO8kUTPpS75xErGGmeXJ9AtaauXb4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513935; c=relaxed/simple;
	bh=4pV20Gz9PKwkZ5/VngqKVCw/t1dMQ1g/M1OVB/nOx1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yh1m+BeaavNOspoxOKpTEG6CmawUNFnjr7X4Gzee+7KX96D7lqkwsxHGVVxHgeSpvAOevEjBZASet7aahUJi9/pbmF6lu7xq5vjEcYLahKcoxtfNUrag1uNruPNW1tfO98Pf/T2LNl7Cxo17MO6uJ7jWUT7xjLJ9DC97pOY9wNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/5zBG0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXemKso1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA9MsJ1268740
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hz1SIJhR6/vturCkaD5yeEklndzYcQeAIiFV50Y8hw=; b=O/5zBG0FqC4pjx+/
	Hzf+OU1yoBRVL2BlNqOqW0cf0k1i2+uy8asbNlf18ytOg3BIbrGI0UpnJ+nVx2Hj
	MigAON63PLkrin0ZEt7MpwTuuqFtUhBMORfkA+71ukfhbcwOKLWQDcG8NXVTFhH5
	F/TFMdbzzHxP/g/xqh//+axReJktHijuZy6WNSQPs0b053kF1W6ZBaB/aVqOs/5z
	fd2F/c9mwhTBYfzuulJMmp1bzr+jF03j5PYBfWCKG563NgZ7jxv703hDSYlI5Yyi
	UXhpEG64NTvTm0l6vcIhxkolYp5XKskclpmusMzAxaAwcwZayJzikOGWU9rUbhRF
	pRzw9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasgny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:38:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502aca58e75so13797531cf.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769513932; x=1770118732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hz1SIJhR6/vturCkaD5yeEklndzYcQeAIiFV50Y8hw=;
        b=aXemKso1F5LYrqPc4OIMy/vbWAhXmSTfy2CCLMnFW0Z9W+rdwIyEBcouH5c/JRY8Xo
         5xnkv0b/UyKR9ry9ChRCTVG7mHqxCjpaaXXUpNwLtkzarK99qKMwkv7YxKZlZIL5sewl
         zB7mrsrTgNtkfDS/XE/Bbu3DY4Hi83XKhdtrAThNHnci2HJc5V/RyoQTbU1IZhQri2gA
         +514uRKGxCG9J4PPvymQkU0KBa3jhJM3ORBu+pe/0Lk7768E7YJTa/Y/888gPnOaqBFL
         Ku5uR5cnRTqR+zu2xNzPl/uii19uBkOsg9r+vdvDfExa+8yOJYDL5q0m+6TPime5E3zn
         /Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513932; x=1770118732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hz1SIJhR6/vturCkaD5yeEklndzYcQeAIiFV50Y8hw=;
        b=qOE6BSxOEVWrLhUPyHUvGsc6Hd02QpmnB6VFdTxB8zawsmZY9SdsoJi/BAGIoHjWas
         dhr128oJ1kjW/fPOAu6l0eF3CYvkOtVPkKjUbAO43vL0aFwjCwbC3H/Z3zRLFdaET0pt
         PuGeOTiX/SPZVk0uwlx1kz8WZcpFTFgexI/fqfN58VGGcasEl9P86GQvtVcEyk4RbShk
         BEgq5bu23nk88h2aBEtuuSbWIi/p2vzW+A2qSJZ5cJ8TSLeVWguDRpm6z/4ghVAGxdFq
         JHasK+R0UmJBEbfIf1QS+F1nL2qjypKlvudr+uYueyqqDaSFPt4sVpczdTx1mXZuyg0g
         mR7g==
X-Gm-Message-State: AOJu0YxtnXTLyhJjPA5cgbjNeI6UoHWQhdMFM2KAFbT+Ee20XrzRMH/m
	MgHI6R2SHxqfwkRVfNTShzjlSQ/AgAWDSJQ8kMJeLA0bwujo+dl456VX5DO4hq49AVF19uu1v3P
	kKRQjtT1mfVAMTl7d6JCv3mmZul0FxvczIso/ejjY8Z9CMHRLvZ8lvgmHk2/6adQ5rg==
X-Gm-Gg: AZuq6aK+etkOcOcXsD9sbUCTBEk1ELp8Dw6+ChwtJzz9xlQ3RsVZlbT1tHXr6DVli2z
	5qXi/QuAMeyVcUTW7G8gXDhwndudW3CZqZY5y4dMqZKoEfhGm9LS4jaUsNP2EOxn/MTpKtYv9g9
	m/fur/sy6rmdupNQ8KCxiKr/kkoOPntoe5MjxGtZXGxIKO9Vwd/7bPuE7V8AbllKjDM+w/Kmr/K
	a4oyy8Ds+mnMn/oA6+62QhcZZ8VxrWtBVA5BHaX7xjB2tKPTZOGYKfXVXS4Z5nw5dS6tcKHtNHn
	rNuqn4uL0gZRph0WHy5GDBnFKekZ4ENEHa6i3qZgvCkNYzSxHF0kzuC9/clHHjauPb1OKbofWig
	9RotfkYUFjIbR7nFvFwW81oEhvHbezI3WqhBo4ICqN70uyeH4OecX6vdbKzqh6VZdLQ4=
X-Received: by 2002:ac8:7f41:0:b0:502:9a94:2f87 with SMTP id d75a77b69052e-5032f9f29e6mr11148621cf.7.1769513932462;
        Tue, 27 Jan 2026 03:38:52 -0800 (PST)
X-Received: by 2002:ac8:7f41:0:b0:502:9a94:2f87 with SMTP id d75a77b69052e-5032f9f29e6mr11148421cf.7.1769513932029;
        Tue, 27 Jan 2026 03:38:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3e054fsm6509873a12.7.2026.01.27.03.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:38:51 -0800 (PST)
Message-ID: <431d614a-ae8f-4174-aa6c-aeabe85ca10e@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:38:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sc7280-chrome-common: disable
 Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T3m81VzTQQ7bMMPCTUZtQKO8loCLSRwV
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978a3cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=znYhJWbmiJ-TVPbaOPcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T3m81VzTQQ7bMMPCTUZtQKO8loCLSRwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NSBTYWx0ZWRfXyXJfU5PZ7UTH
 jiOG8UvtXlHBbPkHAplygXyjQSN//nFzdil607euRj0DIVSAG/Fyod9ldcQhu1KMUUMSQ5gwbms
 JkWKcEqhxIJcO1yifRrmwmNqUM46EKPaxlzBjjKHwnWwIMH9F80RDnwvD5VJ7uHg97qtQPynFRU
 0xOS4woHDAa9WakX3nKufHhY04NZs8ZD+rdLwkjAyo+Wo5g0V4LJwTfIw7g0ugIYLR2z7ufW20c
 NW8MKQR03i6hd9MO/r5BEJ89UB7TSa69Wra6uRgT/j/aUwdJoSX1+LibxO3onYRKqEUZwil5JIw
 a0MGfw0eBJBSLYVkCj3UpbrCYRSai7YYR3HNhhUwfqzsp5gwhLW1Ocr/7QeXQd9TiOO/OlsvtDg
 9v0nrDA5Jb2DBIbvz7RJkbdr9GdL3ub5MTWY8cXq3PW9dlLKaMdLcqy2dhgfKVmVgBluCOLb8br
 hn7UEsw8yci0pynkNAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51635-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,chromium.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57FB793B3A
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> Iris driver doesn't support non-PAS/TZ setup for setting up the Iris
> core. It's expected that the ABI that is going to be used in a long-term
> would be different from the defined venus-firmware subnode.
> 
> Granted that the SC7280 Chromebooks were cancelled before reaching wide
> audience and granted the feature ABI changes, drop venus configuration
> for SC7280 ChromeOS devices.
> 
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

