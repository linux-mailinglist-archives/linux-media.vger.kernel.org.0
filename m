Return-Path: <linux-media+bounces-53100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAx4LH4sl2nmvQIAu9opvQ
	(envelope-from <linux-media+bounces-53100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:30:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C22160299
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 597C63024130
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACF13451CF;
	Thu, 19 Feb 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlF9nt+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jc8HYw4p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC903451A7
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514995; cv=none; b=L+l7dCbd7b6m+tKRFkmSFiabRiW95Orc1rkLas37v7wg7Eg9FqvH3fvo47ClfgqHE9ioN7p5c3zMp0PwgYGGmKItso1Rkm8S5jA+4eqZOecnGlfp5QvJJOguaBatPYqpG3fWdldfE1w6V+83rh5qYwYF/dBfw4Q1/GWLPpKloBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514995; c=relaxed/simple;
	bh=yR28F9lH1bLJqt5fv3KxuHXjCquwJr0yj9N9h+AWQ5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kID+TRiIWuM4eCMcJOAMjoruSy6Iw6wi436eZPWZ9xD+Va5YjKGoWUxrj4ya1SphCxEjUDLwoNi4JoX9kwCMN7LeWIlZLB9COqKZGnMUrsecx46O+KQZgzQHRurpaep09+yyTVmGHv0ppFySrjGoyRIUvW1GrbGaBcRUwt80oNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlF9nt+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jc8HYw4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCOVqi408593
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yR28F9lH1bLJqt5fv3KxuHXjCquwJr0yj9N9h+AWQ5w=; b=TlF9nt+xtOZFLh31
	rVqqa6u6456xX3KD+4qqLu+6P1IjViF7Hi6WQMpGWX+S5S1eDBCECAT7i5p/XW3o
	mukyzsAocVsxHvhxhioQ1+4Wexuvh3114NlvYXe9vqg33wWfJ9/Ir2XJViH7Dm0X
	0XWTbQngRLgPengLcKzNG8p/RZ3JX7tLNdvKSjK0I1pWyXr56k0Kd6P/xqPovkPE
	sA7lEw8r4IdnJON2lJ4gDmbpL+Ixj5EpVq1mnatVCup3QBTWl/gdksCPeg5FOv+z
	0Ix/COFx2LgwgcCCPtQWw3WR0I4cGbFQ3NjdTw0E27junzKZaG/w8q46U+9bgh4r
	m2qQeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2gegjm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 15:29:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb485c686cso96666785a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 07:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514993; x=1772119793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yR28F9lH1bLJqt5fv3KxuHXjCquwJr0yj9N9h+AWQ5w=;
        b=Jc8HYw4p+kBsj/erOwyoofNIgKsCoOyspwv8F/qzxY55FbmSlQd9fn0lbJ16XS+Ub5
         a71zTOZU9P6YW4hE2rmMqDBrL8dix33jXhqAcdTss4Ih3ucaJFG0LCqVWX6Y/sEkpsC7
         UiI+iUWE6J7X3GirczjaUrJmTP9X/VOicGGZ6z+fXbpxzmFyu5f+75vvpPq3IehLtz53
         6W23y4UtJ/C5JEshsVCrFsTCptdvTnmp4iBXFgQIcWP21Forj07mOj3pcRndPKqI8gMA
         CNek4ybWx2Ujo5u78dH6zRMz7pYfhoACPm7aT+YeTbHvyCN0B/9pxrM184HOB8e31xoj
         Ouqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514993; x=1772119793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yR28F9lH1bLJqt5fv3KxuHXjCquwJr0yj9N9h+AWQ5w=;
        b=HZeFlmpzYma4r5dNVnWGcEbFcHLMoj5WQT2BbvlW+EQH8i+KzAd3Wy8sYK5iGH8Grh
         YDFoXHXQLSEG7XYlhp/WVXGJ2D3rS9nRCUhNVfLFCNI+id8jDRtGGvKwG/to4g919cSA
         ftxS8uvAwRmcuF3F47Z/ZF1GvbFT+ny6U7TqT/E8ZpLc19fxIyVrd8/wltZaDmBh57p3
         UZScDUF45qP0grhrxEDH1/cd62aqu7hMrhKEhGtAyET2JxzMONtmxBcnPGVbGdotbkR5
         A+9uhiAb5Nxm/SRVP728Wrp7xw7pixMRfi67ECjrM5u2hghuo0LO335VdpfwbKSdn1Q4
         JHVw==
X-Gm-Message-State: AOJu0YxsX4ieOUFScbVHY6LGhMGpKVYKxGJulbKwF0hUmen0L3zEofXW
	KRfoJEGRY+1m1at4xXkvo6S8o4++kwoQ5Vb/DbTD6xEgeCwnK6lJx0besK8nFDUgcPmJQKIVOLd
	Q7w5Ux2IJgf0Cbl0AzWXXPJ3AaE0aTVV/HF8XGG3qkGyjPqlWNtPlaVsCVroTO9vhJA==
X-Gm-Gg: AZuq6aJFcecN4PGyWvnHq0dffI2aCn8aIE5WwoGtqlUqcaRIKkcyToG+Oqb9I30EjF7
	E72tMvnCRiJhgJOFNZJpSme4d9xwBGX34znTmtKKAYv2tlExFlacy/K8Hd7CuZdmzuZBO8kHGSQ
	G9Km3oql2Jct/y6m7aKdRxCa4aT/frbw7vyhqATAi/4nCWGLz2IlWXKP4T3zdw7b2oh+3N3oDOY
	aQqmGChtMGc0x+ra44Xd3LfbtgrMVAILJwyBexhrH9DkhbcELE88Q1Y9BY2/KLJpmjMH9G+hwAf
	PJ2aCpPBvoCQDcXIrmSnaqaQmiMF8pHMTxLy088sIpoyw4PvE7hIct7IIaJ0yZzDZ/1/132yjOQ
	kKRasvKntVWRN0jUo/bDhbZg/6CAcEmVjVD4+yymB0WjR5i0O8rBBFGqHL9l5TQpPoA0MrIeZ0L
	KoESk=
X-Received: by 2002:a05:620a:460d:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb40740010mr2083573685a.0.1771514993035;
        Thu, 19 Feb 2026 07:29:53 -0800 (PST)
X-Received: by 2002:a05:620a:460d:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb40740010mr2083570585a.0.1771514992449;
        Thu, 19 Feb 2026 07:29:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bea8a7b15sm2569507a12.4.2026.02.19.07.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:29:52 -0800 (PST)
Message-ID: <5d5cf1ab-ba3b-48fc-abc5-5fce86c27c9c@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 16:29:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219152737.728106-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z5/h3XRA c=1 sm=1 tr=0 ts=69972c72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VXswiKP3D3WzcaDjsLoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CBt137u83rCpk2XwfBMyMdPo99sKmo6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfX27t3RnVg3928
 uDaVtofJVjXashfuzgLxLPM34pkxlj3RvbE68NfwfJ9yOuJs2DAOhpSLkBVI5rZjxEto5dACdTR
 KVvFrbiYjqhUqGzdkx+FxFrWASZG0jOOyIiUKhd8QjpZWiK6SFCihHiUXXq/1pObtJHwlfHSxTv
 G3rjiSH5fkXI2WHUu5PDfWtw55L/nWFMXyLe/HWk14KWZjZ51dO/s5tWTcHBG6LN3zc16gt0/Oo
 IUNlSjfpSJY8hQtZ7devW1kQ1j7h3kpvYHRMcc5nMtTwKQrkaivpAcqMyuM0+48R4xs054FBFoG
 U5AV06qXPCDQs+/awklMd0nqj8wGWToW0O1MTbAv7TChgkkQ8Ne0XW8Z3TWm2Mo2yWzm6/hLCH3
 yq8VQYI3G6NtkLn6Y13h1xWVPco7ox/zGRRmBfmcwnNd886uyMla8Qp2BNisExw1v0m8pI3ToB8
 5z339Ds6Dt6IXgr5bSA==
X-Proofpoint-ORIG-GUID: CBt137u83rCpk2XwfBMyMdPo99sKmo6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53100-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06C22160299
X-Rspamd-Action: no action

On 2/19/26 4:27 PM, Loic Poulain wrote:
> We need to properly map camss WM index to our internal WM client
> instance. Today we're only support RDI interfaces with the RDI_WM
> macro, introduce a __wm_to_client helper to support any interface.

Do they actually differ between platforms, or can we simply remodel the
driver defines?

Konrad

