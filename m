Return-Path: <linux-media+bounces-33716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF87AC9AA9
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 13:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CAAC1BA041E
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 11:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762A123A563;
	Sat, 31 May 2025 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ravUc4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F43239072
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748689871; cv=none; b=ju1tla0P81v2PR8LpyfNB1wIajp816DoDum+MRb/OIQCa64FThfuKjOs2JuuIJoNhEziSeiCfgMrvETr5YsNLf6ZNexw0jRkQco162p+1NBNcQRXJ67eA5TnnY4wB4PsjRhgs9DIOq9bdSi+JFZnRbPkvfR3xeX0WDNWA9fi2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748689871; c=relaxed/simple;
	bh=5b46GiRsDSu/uXYhQaQ/gNjsb8GW7abqp6ixGsVYxaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEmP5ZLjg3PC9Jv5AQWBH483PSr6EOotXiJAni0bNzwXRkipmYcGxzSJbQlELX+BxhzCSl1eFEJOtZBv0165Og4mF6R++84GLn8rBTjtQFqSg9Btd2QUMnWdaU/woyBvtZ92y21C62R4ljo9Il3vH+6vGrNRFUxnovl6XNvAZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ravUc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V4ai8P010723
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ+vE5pX8HZbB5flVQGgvGJmT1zk4uOzkDXJe6TM4M4=; b=G3ravUc4nBNsbkOQ
	Rjnu9S4rlJRPOyooCSimwQq0FtSVYBF1UVuI43oCa/NAuvo2OC6TXHwTo/dmwamh
	osWY4F5qH82MNUs5wpxux6M7OkpU83ECW8OGOuJP0cbf4+b+eDJX1WLGr2uiYDK0
	JV1I/5YzafEbaXxNJaHtjEuSW3SLcpgSib+cyaSLynzL9FtEDD5ZZg7TKz5YD5J5
	SFEc9TxFrxchAIcVaM1falgXRASIXiKcu1md2yD+/swedlp978FzRN3554PyNYJn
	+t0HETJV2aPW5wJGik0Ld6dq6B0wiFody0HYCf3ESwCb18a0k+NrgwHg5GG5DINL
	E/PiwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm4gh1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 11:11:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso22412785a.0
        for <linux-media@vger.kernel.org>; Sat, 31 May 2025 04:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748689868; x=1749294668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ+vE5pX8HZbB5flVQGgvGJmT1zk4uOzkDXJe6TM4M4=;
        b=Kh6Uw0bWIMwlfAWe5UuzW/CDWcg7KFS/IXQ6KsrvY3pkxWEjuuLzMJ4jxyjY2CMV0Y
         suPEUtxtv6zEXIVXOR5xOlaWQhAq3yjXs4ozpPlqUBEiu7BxGxHhWEvU6AQEt04HkKwy
         1U3eoGmevERvDHIC0GQ08KAe98hkSS/KHPQo1/d1MHEmwNGbWEhcrpRlaeg9FETkDXd6
         p+7rxvsuo0X3Z0dbkqsp7y2DOilLABqLe0sG/b43g2WGiEHZtbHweHv9aUW8sQbGSkDQ
         LLZaUEdwSWYhBQrNlHDRQR69yz/IO0a9bvVnhMp/WwoJPsOxvlh0p6fsUVtWeGh9ROP/
         jG8A==
X-Gm-Message-State: AOJu0Yx22d1eAvL6hwxIn5/rz4xX3eWs/oHUcjPxQ+NpSfEQyy4ExEQW
	/LHRlXjdM/MVgwGtV4lphcRMjVoCFyjtc9K0UsYqIC+CHL2Eh7SYanD+R/uscEqTtNE+VhW3vu1
	Aa5RR1m7WvjF1Q+7V4MzS+fv0vNc8n9hkdEe0Sqv+y81c2J/gTimA/hohUQgLuEmT9Q==
X-Gm-Gg: ASbGncvGkDt/silNFc6327vzD9x6MixdbJBowvpE6n9t6OACytZ1ErOlmWhM7DtKB9m
	4JllmUocsMWX1wj4Z4WRgv1snqOq+3Z4YlL+JdAaqsh4gRsigGaf2w2dee/faxKJe6aknl4dgJ2
	vQEToYvHbL0skBt70KXaGtCfyZQtY6YV6zcFKLzBrmrB8gqQ0WL+voLiK+syI+b0B/UMjtHpVf1
	kKm9avXoCmM8eUtUZW6p/MkQLgDpkXM3YhYr+fN810LS5B8q5qqud3EPZ4dQFVtolpkDeSwlIcL
	WALpWl0rxAx+x8Mu++W2Sdw99jo70Fpi3YXaxi0NjmTk+cqhNZgHBnoC6ALrXoG++g==
X-Received: by 2002:a05:620a:40cb:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d0a3d978d1mr297825485a.7.1748689867844;
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSvAl3+81zPxT8GtGObctxByRCmdXGFKJiq1TFWGEKnxHTfUWMUwJ0OE/8YtwwGaBL7+oiOg==
X-Received: by 2002:a05:620a:40cb:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d0a3d978d1mr297823185a.7.1748689867482;
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e760sm486122566b.52.2025.05.31.04.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 04:11:07 -0700 (PDT)
Message-ID: <8c57ed65-002a-4ddc-9056-6b7908c0ff52@oss.qualcomm.com>
Date: Sat, 31 May 2025 13:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RrDFLDmK c=1 sm=1 tr=0 ts=683ae3cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=3ipQxu46YsJ9vmREi38A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RS1L8fgR--L8EfbTNh52CreJsT8puyrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDEwMCBTYWx0ZWRfX/e4dGIgwiXSL
 gWReWHojkVOUkWPcReYdWlosGkgSAmomUTm+cQinHlqEhdsRw7IToZlh6/N2/lj9qn9yVRmAcaz
 Gitd6KiFTfc/rx+JhoxdRtkeob3D9FnGumE/CsfQiav9TMM50xGOtzYW5Uf1sFDKLIwjX709kzh
 S5+wHLLyalvVeRLPdcreN9U46uI0heGtD4Wm3FUN+8tgjj790/Y5p+wRaoOWah0I5/3hLOeT79a
 eMXPkeLKnmNvDkeYLsqpz4C2qArHsMY6iBBHTto4XsGvBRLAKkHALtXrrVuLZrQ0rQA29/VIwTb
 ZrKePOlO9yIfhMzqQIazjww2W1botAcs8R0LMPE3SSH/M9qcPv2uV7KaSyC3bYELSlik4KGmkNr
 Ak/QfIpjdzFV+AFLzdE49MoP5DWaw6aRrYrJrvpDnX84LFIt5izJi0sEVUSRUcKVkI8mUfTu
X-Proofpoint-GUID: RS1L8fgR--L8EfbTNh52CreJsT8puyrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxlogscore=968 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310100

On 5/30/25 6:02 AM, Renjiang Han wrote:
> The frequency value in the opp-table in the device tree and the freq_tbl
> in the driver are the same.
> 
> Therefore, update pm_helpers.c to use the opp-table for frequency values
> for the v4 core.
> If getting data from the opp table fails, fall back to using the frequency
> table.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

You can save yourself some error-checking pain in this patch if you
do something like 

ret = devm_pm_opp_of_add_table(dev);
if (ret == -ENODEV) {
	for (i = 0; i < freq_tbl_len; i++)
		dev_pm_opp_add(dev, freq_tbl[i], 0);
}

to programmatically migrate everyone to OPP..

But - tangent - I'd say efforts to preserve compatibility with DTs that
don't even contain frequency data for a given target are rather futile.. 
Such descriptions where we only know the frequency (be it the tables that
we currently have, or the constructed OPP tables that only contain frequency
data and no voltage corners) are incomplete, and if the system manages to
not crash if the driver requests a TURBO/max freq, it's all because we got
lucky, as this consumer is not voting on (MM)CX.

That said, it's probably to keep the breakage to minimum, especially
given this is an old driver for old hardware.. I'll add the missing
OPPs across platforms with an intention to drop the hardcoding somewhere
in the future

Konrad

