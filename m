Return-Path: <linux-media+bounces-51146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKs7FdLnb2lhUQAAu9opvQ
	(envelope-from <linux-media+bounces-51146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 21:38:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B845F4B6D5
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 21:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C705E925817
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 18:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE124657EE;
	Tue, 20 Jan 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyEsyoJo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGlJyQ1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E8232785
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935512; cv=none; b=JKCe8QsNXzGDkt9loVuxNqYgahlnsXOc23LYe7VE5pVLKy7ueV7JGC0RMLHGgNskR006fW3Tli2XILB/t5opEARKlhCIV380MePYSmvnuQGB6cXGJhhdy00bsH9T3WRdHhmPla9oWpmSiBvsIw+WdozBldXOI1X5PTWmP/FAnhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935512; c=relaxed/simple;
	bh=tuJI+bZdE38xqpRoGqY5Ek5ezzOOPhAo/pIML6D72VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8vdiLw6PNHSn4LqG3acYo6P7P33tj64KxcdiGvQn//kjBt9lZOJu9XdAuCd0gQqUIwIh8yBcsdixbG3MvVY+R2coD0YTW5J4yzL4IgdX65O04JXNdZ2S5lvG6ZL2k/mZKa8LtXY3xTr4Pp+M0crjkTy4EdPL6zuXHej3nb23U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyEsyoJo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGlJyQ1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KD1N4S385722
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 18:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Pt8ZH2d9C50JLSWpW2IpAcAr0/x53HA+0v+ovrnVR4=; b=QyEsyoJon21Ij7Tj
	XDGmKg0KMsOyZeOm1CpYxAp6A1hhvIvy+qbSDqMLnVNupYVXtK+3ro8NU2m0PN6p
	N3eKcpKIc62Jywmlpzaqf/XdeHhQgialP7s/HkeecjS/A32m+v2KFLBuDD8AuBo/
	MIi9+DAIWRD6W4oFhkBXR/RKO74ZXl09M256f8uK6D8u67qyFsMejKks/7CTCBa2
	Js2oskuJETx7b/VzsmyM/rWq6392mG6KvOJbJob5IC3AxEjg+rorOJVC0+LCApyk
	1h5H0RoMz7qwlSUeM6XPzudPs6epVxtHw5gO2Us/9GF7apDGdM9lWNbneL/RxSHs
	g57fqw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7q97uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 18:58:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12337114f3fso8549507c88.0
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 10:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768935509; x=1769540309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Pt8ZH2d9C50JLSWpW2IpAcAr0/x53HA+0v+ovrnVR4=;
        b=WGlJyQ1ZH7OXwuU19dn+7pUVxyyH6TGj9mP1EV8OGAc7RX1Z1xKnbvnjZP/LYudbyy
         PUuQmFTuoagqCykVzusFhUVWjHLF6iJZK5O0I58pj/C8g/eZb94qpXwEs1phZAp9npNR
         GjQomVeKsOd33Qc5AewV24OEPV2oCZ2dxDWWMIho6rziJrQGn28WcnXCPbPkSpt+atjK
         Lr9FexYa6zYUh5ysdf4cawCOJbPaBW4oWH1e1KAtKk3AfiP8jB0B+zpBwXsMKfcHjVfo
         KMmSRHjYwsjcr94lpAaCvd00WAfV2sSiDCNRnPfVXYEsB7LMPlH8Y/v1y26CGSHp+KA0
         UICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935509; x=1769540309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Pt8ZH2d9C50JLSWpW2IpAcAr0/x53HA+0v+ovrnVR4=;
        b=B3cTwV7BOIAps2MLIySK2+jAZXhsqL1+/4rWQlznb/Qw1rLTZZx7kADJskiFjTHXuP
         oD8w5AqvYyq1Ocx5vQh7LA1qzJhoN287jBZfvMyj3BV9kNfym7nnarCqApqDIkR48XWa
         mAlhxsW+KxHmefERCTinQXfOVJMSGuyPZvX116rwLK8HhLipmnDlamB3Et7pgKEP3wL7
         T9f3qy2WT1zHVFDHf923LX81LJy3sfWCnrqmcf9Uobl4CpFLYvTz6njJKXxDwmRtmiFN
         1/XlWdJ48L0rHdVWp0J5eU9WkxUls24DKusX3s4qffKuAM8/mSKoXwZrjgvYIhdfFLuB
         swAA==
X-Forwarded-Encrypted: i=1; AJvYcCV+jtRBfqO/uk6j2rP6A0OemK/V1LoSxK3TW3s/47Nn6i5Po4I3xPy3ofb3g0g3a0aPCE29rarYKQo2kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjUkmcCd46WA5r/UolEl1rKNJ8bti/UqK+8ZmtWJfh9YCTxarV
	hH5Ob5n02sJ21WNP9P7vNJID8ogLhru6Lx3ccZrVF7RfMQs9d55+uXyzJ/NcKBFWNb9wO2HzmN6
	baysjuZD2WHLMF7/Gq017JYPQX4ztWTYtJ5oWL0AGiSMhU1z3mzcWaixBFQm0nuu69w==
X-Gm-Gg: AY/fxX7zRFXGXlTxM5FqW6ckcyY0WX7iH/25dx2t5pLF/he93zbGcoeTHgddGmyKs/G
	5tY5r14/N7a6rbF3cgbKnRQWGBEUQQYFsOHTTqM7hgBNfpPxwv235mus2iV2ZDtq5hSv+wC/2DC
	AZT0wmVn5jYZnDksW4vrTfss+uhu5ltWTm7+oMGVTWgYia66rpQ2Xk89aD7GkSOAvnvEDwO5mNV
	IpcqGsvfMqr//mNKIvYSz56x2WAfKKNz1P2jGbkW0MAm5Xb5aUJ84qo8wrAHh1WPZ+nw9mjWQEu
	01Jw2iU2gFZqNGHv/nxp+jhH0jZLfRP8t2Aww+CWse7452WCKytBaDAq2b30aTwVDokNz0mcT39
	4n3mXdvgEdxx091VV9gxoHZSL4rCGZaVAbwvj4MlsRLovGyIEusyAHrFOX+KypzZQpg==
X-Received: by 2002:a05:7022:2208:b0:11b:ca88:c4f5 with SMTP id a92af1059eb24-1244a776fd6mr10924868c88.35.1768935508799;
        Tue, 20 Jan 2026 10:58:28 -0800 (PST)
X-Received: by 2002:a05:7022:2208:b0:11b:ca88:c4f5 with SMTP id a92af1059eb24-1244a776fd6mr10924840c88.35.1768935508234;
        Tue, 20 Jan 2026 10:58:28 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10736sm22091198c88.14.2026.01.20.10.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 10:58:27 -0800 (PST)
Message-ID: <86661c45-d9ab-4ce1-bb92-d9da49e6851f@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:58:26 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
 <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
 <20260120-kickass-taipan-from-hyperborea-e53ea6@quoll>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260120-kickass-taipan-from-hyperborea-e53ea6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qzlWvmt4nmiABifAFRBHeQA3pE8glHuO
X-Proofpoint-ORIG-GUID: qzlWvmt4nmiABifAFRBHeQA3pE8glHuO
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=696fd055 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lh10_vM5Hw23kVgsv4AA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1OCBTYWx0ZWRfXynOTjOuzFmvR
 VpfdhpVr9tQiFp0DdnrN6xnfOC4UuE+n5j0j/UvP/QXbh9AKrkzA14QRmsGBjG7CuIQ/kDqd7M5
 JuBzGTdXXWSzJYiR2lLft95D8edR9B8CphrFebdoIrNi1BBZSOJf5YNuDeBgUTRP5SYH35WXETR
 JvJscvETLAbt0j0OnGSUAV6I8Ba23N4zUQC1SNnRJVyxOCTERjmLrrPqdK5aXJbEMtFl8vlU/UT
 VMueK/OGkUnEjIK361LuUbeu7+dWD9x0gRT+aHGmS39I4O2GShpdYC8Gzd3tvkf/pX/rdETrmRz
 Be642QRSkbaF0HAF1ik81xeE/LODVuGSfCupH2u/BR/tXLXdg8F+Ezkv8TavYtwthChfNfkWMze
 EAs32l2i/3P75yL6P5IGHoQMquxdxPPehNExaiBgNfjpJUIq4C3B1PmJU/1sOlLwChgccyThVSq
 pylX2CiINDaAEzsEzcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200158
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org,oss.qualcomm.com];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-51146-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B845F4B6D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/20/2026 1:35 AM, Krzysztof Kozlowski wrote:
> On Mon, Jan 19, 2026 at 10:42:51PM -0800, Hangxiang Ma wrote:
>> +      - description: Registers for RT CDM 1
>> +      - description: Registers for RT CDM 2
>> +      - description: Registers for RT CDM 3
>> +      - description: Registers for RT CDM 4
>> +      - description: Registers for TPG 0
>> +      - description: Registers for TPG 1
>> +      - description: Registers for TPG 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
> 
> Same comment as last time - nothing got resolved, nothing got concluded.
> 
> And before you claim without supporting arguments "we are not blocking"
> let me clarify: yes, you are blocked, because I am not taking bindings
> which are known to be incomplete, not finished and already being
> changed/worked on.
Hi Bryan, can you please advise on how to go about this? I don't think I 
see the driver support in CAMSS for separate CSIPHY nodes on linux-next. 
Are we mandating anything about this wrt ongoing patches? Thanks.
> 
>> +      - const: gcc_axi_hf
> 
> Best regards,
> Krzysztof
> 


