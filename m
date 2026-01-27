Return-Path: <linux-media+bounces-51637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B3yKICkeGmGrgEAu9opvQ
	(envelope-from <linux-media+bounces-51637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:41:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2093BC7
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A3D3025164
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C0434A3AC;
	Tue, 27 Jan 2026 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGQolWPw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6QXreCC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F0346E71
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514093; cv=none; b=eC3JWIqtk4D00G2ZGFQE9crWtwotwnx9rfeG2XhKXKfQw94kiExGmCgpyX8+wHcNZhHxxzAJ0Pg0H50BQ6tCugZQZ0AQP6/F8YNlyglo2qgxTMazX6Pl02NABcaoPXzeBKXh9voo/B5WRBX9BUoMgJ+KO+atEoW06/2GV6+M+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514093; c=relaxed/simple;
	bh=Xc+XEbWu7NydMS1y/ul3bnMWcOeJ2XSUcR1hvGpsXAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOaqbfTTrJS8Sj6K5ljrjzT1Y8muqja4wEeYCTLPTGDRq3b9vVzH3LqaGviQ6WCEJeoSxgPLjXdFCaDoXpKOyFbnS8D0tnR3N3OxcpvPN7P7jNf8qJ4dLthHziPBkwmzrVj08Dc+aZ+hALx/M6AjZadiLXRiaZjR/kxK02++Y34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGQolWPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6QXreCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RADYZu700158
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/LYpTnA6P+gHv9F67L52mGzLDD2sDygJZB/kfqndfY=; b=AGQolWPwXRqBElCS
	Tblvac8tvTr1pjU6aBZHdCx1Bl7yNM+UCWThWDDPshKw8d02Q1W0uW9023pw06xv
	hByoN6hdAmQY/bvmzkhv2c6D6nkyClm+U7xB+WvOEzQkgcxhoJsc3ZenKeercntJ
	bAIEYjGsjGc4NZNzDFigGkKDgNl3adYhjogbE0MCuY3kVynQxCU/xGSYlrUMMWQY
	iMGcvbCm+W1T7asQq+Uv9d9bfYG2UATBOJSIbjdCtAJf2SLXRT+heRZhO4sAEImS
	B9sLjDRg8SL/b+F4eOQvTbbdYfuUelrBlfj8oYtDTgAkqxTI0zTRJ52OIYHyiIj0
	k9VvNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3tm34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:41:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so152967685a.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 03:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514089; x=1770118889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/LYpTnA6P+gHv9F67L52mGzLDD2sDygJZB/kfqndfY=;
        b=G6QXreCCfOPePV2gAjYXMEF/RDcGuv9lVK6avxAyTms1fS9c4eGb5Tz6rKBN6eimQf
         jiWX16soKyHUQjDhFMtJcc42S3ImPO20ha4Vsh8pSg5Ec5eh/PB1HmmDwkrUpMiX5cr4
         oVq1RgNLLpkXPRTJSHVbbMsmnwX+KEE4juLvWU2h3gFBrRqQ9g0q7V8Kipq96lQ/Nhqx
         RLZsGt5GlYhTOyrfIV+BwsPFdag3En2sYE77JdQZCS0SGGNJcCT0RNEpn4/SWFS1+iPH
         Zf9m0JUvCZVbdcPjBLrWv6T053SFVmntxGBMqsY4QPra5jXgchJl7S5RcsCAOF3P68J4
         mHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514089; x=1770118889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/LYpTnA6P+gHv9F67L52mGzLDD2sDygJZB/kfqndfY=;
        b=k7ECgyUjIRx1HRfHtHOjQDhZM4UNp/7p0gLKWBHMMV7VDD21AKjMmIGrDRzcUQSqGw
         AHtRwwfds8wTCIfrW/UQ5J3HIz8FTg8aYfZ30lqf8k79xk5gUa/MYIKTwDThYv76Nh5a
         T7zrx+WisD3u8kS1ltPhmUh1a9Fc8ctwZ1Bw3bwLh8TXAC5lk5X+L1mGobWwK2/0i4Gb
         DOsDTFkXFwwLJysciy+s/eB90ybkIgJRlrGy6cc8zzavzLOnuLyt1TMdvLrqaEcDI+Su
         rOCcBZZFrJa3VH4C55uCtp/gp2azxcwBFYwUSfJJuo5zzgv1O+Xgu46033GJuWP2DZyc
         hD4Q==
X-Gm-Message-State: AOJu0YyXrShXcNyS3iVLWtjty94M7x/qjACHBRcdxfh0GJmulLijLD5Q
	FGw+mqwHv/c8cA3oRPmsfdQvhYfvKHUGAzkdltLUZlqQnx9mxq7px+3/7caV2r6f8UvtIKYtSXo
	cVvfn7x6vl1znmDCmbNbqdbRKjdMkcnbQKTU8X+1NpWLZTYoGOEvy2gdTPeMZMUDkuA==
X-Gm-Gg: AZuq6aLNP5ekaQ9PsSEXZg4dRXzKO621dqo/eI67m1BT1Q/j8pTuTHT3oXfAair5gva
	kFQu2EIANQPNcPAmeQEZVC3AKgk6YGuUw5/f+QAJKi+/g0GY1l2KAVi5dCnUhW1sGJyXd+bKY56
	8lGF+ckUY6EFtTJqE0Y5rl4Cl/d9y+3/hOruukpGqcWsgIumU4L4/wIz5Id2eUZNa4vEPpf7O+O
	3StwSnZuA1mvGqdHErgqJNlV0HUBiXv9eyjBO3qtnABqT9qpgPwFbxVybR4FMiYK2vbwIpeXFH4
	0oNa3hjnTzANNJB1Wz6bCWObuwQ8T+ZqAH+PwWkrD25iP/FfC9E91VuL07no5voDDEhOJImR3qO
	rY3oephaTxCswVrEmVv9ri7dqUcIxSd8QZyjacnMmCt/UtebCWL18j2j6DCYDiJYRlfA=
X-Received: by 2002:a05:620a:3199:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c70b7414f1mr120435085a.0.1769514089510;
        Tue, 27 Jan 2026 03:41:29 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c70b7414f1mr120432685a.0.1769514089057;
        Tue, 27 Jan 2026 03:41:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbc85sm783768066b.1.2026.01.27.03.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:41:28 -0800 (PST)
Message-ID: <458cbc02-5649-4ad5-a6d6-3ef8c4dfe2eb@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:41:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-3-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-3-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mY1bNAjms9SREW6Wf_IZQnUGc_dAzI0Z
X-Proofpoint-GUID: mY1bNAjms9SREW6Wf_IZQnUGc_dAzI0Z
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978a46a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=taCg-2STDlqsnU512KsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NSBTYWx0ZWRfXyLAwNzjhhhAJ
 TClia21fNWkYFiBt6g3BeYJ8t4jUuE/WCjJK0yr9ownkGqQt1T5pMMCehI5pslz8xXUZN3We3WM
 bX5LbMVmnM5xg1qmULPTZ6xAn4n/FXCOsNFq5cuzlOdFw9fqdq4hb9vSpPoo2eN1v2Tcq0vHfGo
 FGGITdxWd9HI88QAZks9avPgTltthaabjTVeKeQUVHnHLsB5h25APlV2N2pRKYDtrHXxHnDdbNj
 gQF0eaxEDe7xMMnIhJmdavUEvZbGbnCwb5SxBDNgEkte+gDEE7o62G31em4byfZDA6YegAU9He3
 K7Rwhis4Z5hNC9lT4GOWopFsK+w67JyhLLN8U3RgT5EjOpU7aGvNIqsXIBX18DW3jNj/E46wIn3
 qH+mh8X9hvJj233sugclMi4D7BX+C3Rr1JWVJ5p7G3j0QR8SDQHTK+VYP1GtzSXhSk2R1isHYYb
 V19ExR5v1SDHNJKcgHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51637-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FA2093BC7
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> Future platforms that are going to support non-TZ setup will use
> different semantics and different DT ABI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

It's worth highlighting that this set of properties is not enough to
accurately describe the full capabilities of the hardware and will
likely one day be replaced with iommu-map anyway

Konrad

