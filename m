Return-Path: <linux-media+bounces-51957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAicJsBDgGnW5QIAu9opvQ
	(envelope-from <linux-media+bounces-51957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:27:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6BC8A6D
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B72383005E98
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 06:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F8E2FB0B3;
	Mon,  2 Feb 2026 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgW82qKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAGV2/1g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F32DC774
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013628; cv=none; b=aTEonHw5a9Xc6j81d9OBcX7nsb4gGH2mHeKq1l2/RghHuSwgfw/dpaRpEXVxINfG//nyM0o6NzLxXOJv1WbkGwVr5l6q8nU7wEV9ldGc2+Oup0URHEUnJrFFXbTcCDBUMOgk9Gs38d79nCaYAr+w8FI7kwLzDWhQi7nIGtygul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013628; c=relaxed/simple;
	bh=GGQHGgcUkz4cUcz1cuTqDMCzyIO1+sLpwJsoipbt1kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZafJhBN4SPsp9X/WlO7KhIKCu9vrQdXJgR7DuMngJNbaBoD1MuUDuHdg5F4AqHDYIhHLLlg9rEpSyDJroKC5WbnzVvjH0qIK5cy2cmo0xz+JScmyUtrdeEFBDGZXKFmYJXO/vECxF+/ENrtohzCIeANnopK7ZsvtxfJgA9X6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgW82qKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAGV2/1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MmE2K2342806
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 06:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKd3xBOJcYKdlJUCSNr4cOBREmaInmTWxJQ5ABfknjk=; b=DgW82qKm2GQl7LcC
	clj2LCa2vdLZIFftDZpscBq+f0Su+XgDDZ9ChPRe9oJvK4Rgiq8Xm9hcTrna6JB8
	n2Z0OtTch73vcaS6qCgN99dBajyUBShIigJb7inYRJ0QuE8HdvVnV1PQhIa0ZiFR
	2TxBXvPqEsW2tKF3SNaxCxDLlguy6eSm3gIpaynDL21VRnNT0Y+Kyl/WCy1xIYRR
	E/PRKmXpjeYX0QlRhpzio7QLyCOPgFSzidFcll1ORPj7LB73p6VvZeXPtejPkr2U
	KdJlfUeRHyrr4DKJ0yHcALUXLtn5fTwYdV15Alv1Oiby1xHGS8HDqvrZpC7uAl4N
	KenI9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard46r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:27:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81eef665b49so9924677b3a.0
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 22:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013625; x=1770618425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKd3xBOJcYKdlJUCSNr4cOBREmaInmTWxJQ5ABfknjk=;
        b=VAGV2/1gKdTMfbC2nfrdGDSmeV30IaFwTiObybJWDJM/IdoSHzrDCtHiNCY4hLoFS7
         C1W0pUFb5VmZVNSKPYuPnRwjjYYcPmEZXRJcTU7FXXD9mJJ5TVCda+JLRdMXSkMdVS15
         6xNlLZnMq58i52pvfNpHlA3SRR/ksTUtKotER0KsFb/TpFtLaafZuIPQPaqDcrz3Sow8
         uXez7v58g6ZGXxwzaB1WamMHRbu6nHFySXmjstkmnB3JK4+KVXCSOSoQBupa23BKYTvP
         BEkDnVQGvofIMGwD6yD12/YirSsGEjSy2SV/nPNXBiYcgF3Is68rf9OJdlX2CT8Mkyhq
         Yy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013625; x=1770618425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKd3xBOJcYKdlJUCSNr4cOBREmaInmTWxJQ5ABfknjk=;
        b=L3p+KD7zBPAxDRbzhMKCfcNw0tP53lFIjD741/PUuaFb5FtlY2cIXUNi5ELElHMsDb
         qjhJcJRpdjrTxK28t4dlfkR0+i76/kCyfJcyJQdpYPuWSBhZgLBNo7C/5aOH+jXVD1P5
         FWt7DhnTqKRpmv/1zKV1IXsXhL3Rtx323O8ZbFG0j/kMpqbnUv4RSjTOIsHYt8ai+mH6
         wCowsBLhMc3qTP0KvWnOYdRC7TUTxU9Oc6y2PuOo+SJJp+ytwyR0RJevxIxl87iB6PUz
         EYxfKB1stWBWXTosQSrot8qOKSol/jKZ2CpUB27KPS7rLW0hTXqBg3Kv6nNSYA8gIg6D
         x50w==
X-Gm-Message-State: AOJu0Yzgf2fzkkwaG/thATf/b3ahsJpMhFAZWIV3wOy8LxFqL6wbl5SQ
	zWa0PdPR9yPL4KEY7eP27Fr+Azbnwcr+h64L31/Iu1BPASgZveDdmc88wblckIrU46yw/LDEkMY
	PLPENsqkNfuh9wjN2xRuglWFQ2BZ2hPimvqpBwIqJLC3EuKHrf5BlceN+6/YSLEuksw==
X-Gm-Gg: AZuq6aImLLmCUeL1Eitn28ke3DYgToNhFizOUsC8IuvCoUta8gtk6tY0NVLcuyLeuvP
	nGinUtvbQNok3slNDsPvO6pZhZBRXnAGxDJLBk+n94LjTX7dGzSieP9cwPuQ+0wABpt7jF0kOXe
	OWIeAFRbndMBYUZPGVZ7sbmf5K/OY8CsQzIZ+xdij1IBi0hzmrPFfI/qWY3OXOWY/YzM26idQf7
	Gs5nPqi5DzPjAM32xPKK+ZceDLt5cZl3oNMICQpWnPGoznHhWRpxVQ2IVFsAt9BS3P+BfpgPW6m
	vZ8/RxpCKY9TFprDYrvJWvHREhJvaRnkH4tbrSH2znqysBkkn0mljceF7Q104fyieeHwBHx7YWe
	HqtdbJ6zrvPbj09c+hBQdQchJ5J3X8VaMU46oSn4CPplI
X-Received: by 2002:a05:6a00:4b02:b0:81f:4f47:c6d6 with SMTP id d2e1a72fcca58-823ab980923mr9045805b3a.65.1770013625108;
        Sun, 01 Feb 2026 22:27:05 -0800 (PST)
X-Received: by 2002:a05:6a00:4b02:b0:81f:4f47:c6d6 with SMTP id d2e1a72fcca58-823ab980923mr9045785b3a.65.1770013624694;
        Sun, 01 Feb 2026 22:27:04 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a42b3fcsm13855359a12.20.2026.02.01.22.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:27:04 -0800 (PST)
Message-ID: <d41ba6a3-6f5f-5c4e-600d-70fac7666ac3@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:56:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/5] media: dt-bindings: qcom,sc7280-venus: drop
 non-PAS support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-2-e10b886771e1@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-2-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NCBTYWx0ZWRfX+DtDV3aR4KrE
 tTqMNzQnbZnaZSd9gUfaZNvjZYdHXbp3IYkmrkzbNzlZ86qZLXRDhkJo8OQqhM4oCtMgdbomXiJ
 LNLhYeKmKqbqr0V7glg/t1lcQ9lUaoeWBdYJmSJaQ/GhNIJi1DRzo7SSwzBnN+Qo8GlBnHFGiMR
 G91mVQvye7h/Vk8ow3+AGqGzJFgzh/ZY0TEeTqd8IEUw/4AOEjdFDB1jEADd9tNVekfhXjApmiK
 ElZnIo9PbN0SjqssENlAoj+BdzSGxInFOt9DNiLT5WiOSjA8Yi0skC35CPftEzeNvdQwBIOODS/
 17Z8zKubXZn+V99MwqTwL25+Cyhiw66v+d0/tW/DuzoNYz4CBCyhjRGCsz3I7bjNFRIVb+WnA0D
 NfunzYuEtAGSfyKhJ2Oyi/UoRdLGHPT+SDn/f/oYPetQ1nRhn6wRmGV+6bAOYBUh/QKlDAernYw
 5VMuXEoy1hKAo72j7Lg==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=698043ba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=77rIbJGYNedRJNbebaQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: UAQxtXFhn1zGRAmK6hRx5A5B9JsQgDn0
X-Proofpoint-GUID: UAQxtXFhn1zGRAmK6hRx5A5B9JsQgDn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51957-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AF6BC8A6D
X-Rspamd-Action: no action



On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> The only users of the non-PAS setup on SC7280 platform are the ChromeOS
> devices, which were cancelled before reaching end users. Iris, the
> alternative driver for the same hardware, does not support non-PAS
> setup. It is expected that in future both Venus and Iris devices will
> use different ABI for non-PAS (EL2) setup.
> 
> In order to declare only the future-proof hardware description drop
> support for non-PAS setup from the SC7280 Venus schema (breaking almost
> non-existing SC7280 ChromeOS devices).
> 
> The dropped iommus entry reflects the extra stream, which should not be
> treated in the same way as the main one (which doesn't match the usage
> described by the iommus definition).
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita


