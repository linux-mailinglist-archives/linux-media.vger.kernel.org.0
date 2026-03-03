Return-Path: <linux-media+bounces-54311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIrZNOW8pmlVTQAAu9opvQ
	(envelope-from <linux-media+bounces-54311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:50:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 410141ECF2A
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC85E305D1E2
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FFB31F9AD;
	Tue,  3 Mar 2026 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEeYwlk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fugf0zqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4FC315D51
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534819; cv=none; b=lyOyLioYJGblddHv4dc6AQVWk4DNZVz/ca+pAuSgAsm0tSwTsISvv0s+ZLQvKTIDSBPabL8ZRyXlk6t39edqugvNpiX1WoqEwTEGsA85IEHIyPzBGDrFZEM5PeD3YUR/vkdV8PbmattqaCbKQPBINrMfgF1hKMv3fL8OgC5E8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534819; c=relaxed/simple;
	bh=GBQKgN6kGGPo8iDrDErfLf5dCq2wspOVI0iefN3XQ34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbepsZYedK3BOmtFAzJS7KI9nhzn9hsZZdLKzm7so15yiwJvo3qCi/HzN3rtyFDowZVjeRomgqh7qYKjc9mx2MOM1C8wDG7ol2JfVKuyoFJ3T+MKBhgBROdzRrYxXbFzLi23Y2xwRKL7osrvB0vkPXdKQzU4CpMRMEMbHnZNJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEeYwlk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fugf0zqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n5PY1838277
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 10:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=; b=AEeYwlk5qFUBS7rQ
	xJ/9qEJcTVhNDbxYZsNhDsg8T8Mhemx9Y2rb5nujNZIAf9oikiDcMuqxw7NEeJXb
	2GQgGYnl/+NRdcFvkNyQGToskXr9OHxER5uO8Ln7i956jdPq6TpTY78bAVb0UpLd
	7ZydUCHlQMvnS5xmn/l4D3GGmnE6TySa9W2HXAlX94TDu1adgCsAvktinodgy8ND
	YUu4uLyFHx9URrIWjMJkudYhLrUlFiW3ShZXJ3pzSjn+RMJ6CR9Ztkw5lDOc7unb
	MzBtM9UzO3HdABqOm4MMSaB0WDKT4PlW34+iua1J/r9h53OZ1F1ipjHIXUbggrKp
	KReCRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngg9vmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 10:46:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so469019885a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534817; x=1773139617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=;
        b=fugf0zqK9ar0p/dZscz5d5SwrmFyfIbZGt2NGz+ICaAfb5lFLV4Rdf6LYWdabE/DkD
         1ww0qZye8hyxHRB14S4aA7cR0lL4aHWwPWmjmo4QEKejiV0fDcyKE/URU08tVsXNNbig
         7Lm8HtMlGQBY7aAzceXrbQNNCkoP+/5CfVtIdW//bA1iUGsk1esA8lOG+InbGeP1q5Yk
         BnmEa+M1UqMF9OqQmDmDKtLUQpX47J740/2sYy5B605OlTgVo0YG20GW/c8ol2RMKoAE
         joT1M+inUcLjNBSD2PA47VlXyDYulNyaZcCiXSaUM3AqDBtLQUIIbfsA6wEteX+Ukik/
         KHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534817; x=1773139617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=;
        b=tTyfk7AT24EdfFMy88QLp230pp61GpRZtSHw7JcmqKLaDzMPeQaKujxNKpRVJJ0ckf
         g9URbivJ8+CPdzLWRIGS9bo6zA1FSsIL3SYl3vgfvXzHqs7YHpnQkZxjzk2LxHjqJkE7
         DYyQkGdXR/xDSyUu6UiqCVo6sZ/3g6CAc6bA7rAC3QB2fFwl+9v/bObrsLYGWIp6K3E0
         NHhxmEm0N/y6lb2P4kUCz16rNKG4JkMazQGhu2hm2IyfCTDbtWv2f9xaEMrqm/FkOIgI
         SWG6iSQh/ldXESNDHOZ+B4eNj7GQ4n2SnFHb7umMn7jqji8DyLeer/XUZH6IzNjUKtk4
         ByzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGWen0RdJb4UZ3uE3F9O7hrPjeuOEMNllk2fYRlD4oWTMhFYwYKQmPfgkuw90rLbQ5lVBtfFdMnu0ptQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRd4aTQc2oyWNMP1eWkB9zC66kDyKDTvP/gr6u4UK9Mb4BAVrm
	QTqKe0RlIZbkDIEGTPldjpgfUL8VMpI5fjNzzig2h1Vfcxjt+N8/4ob6mUa7Q503TXo0ALMKnMv
	elp/nUtRFtp5M/pspaYiUwaJFoKbPHCZ7YdjZq/pSEIzQ7rmIHCOGWZY4Q6kKypSvRw==
X-Gm-Gg: ATEYQzzW47sqOJkb2U/HsMeNRiNVfzd1rv7QoSFmVIatF8ROTbXMHxx/2CrNV6XFNp1
	TFiJdevQrgrGA8k1I+Wl9lcV+xowgLRGNzDSUQ+MmoqlEiA31OmbdGI62Zru0xFDHXqXWTIg83d
	7eEzMZyfeM0Jt+qYQXIOR3XAMthSirIpc6XkRpX20YD0ZMmPv7aV1xKUHycGFS1zfShOWss3X7H
	kca98iGZUuW3a2O63yB5v0OxT8twHBF1b+lBahdHFQbSVEln0QwRfSX1Jdxu19FC4+YXJj9MQxS
	pMLK3n96FGQmaOIvuWvHO1he3hv6ZdNsGEMnQshiVeo5ApW+FVQAD9zpOcFnzT42jqyE5jQkM0M
	+Kw69a4bFuOMTA7twO+B5gTcY0MkwId4AgPrIqfq66cZP1H8kPtVAeynqAidtdO870xhqCf7dXZ
	go21c=
X-Received: by 2002:a05:620a:458b:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cbc8dabb6cmr1494511585a.1.1772534816836;
        Tue, 03 Mar 2026 02:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:458b:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cbc8dabb6cmr1494509485a.1.1772534816383;
        Tue, 03 Mar 2026 02:46:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm577333066b.44.2026.03.03.02.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:46:55 -0800 (PST)
Message-ID: <8644d2d8-04b2-46d5-a74d-6d90b5103825@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
 <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
 <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a6bc21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=aUHzePZ-ChQT42NVv6YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U-GIQL6LuhzBFt8HWZJR-YfENTZQtQSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfX9EhqvuW5y7X6
 LsULMg3MT/68ZX4hoLeO6CRaCOX7QQPfw0T89MO/w5NrYq7OY/7WAHBBEo481r34ti9935/vQ6l
 rMnkRFRgvuZ3tkuw8Mp/hRFmrl3acHChvtLEAZ0GRwl+F/X8EEpLd7dpqWEVgAb/vmlgQqKjLL9
 HQuoc+t4CqRweidphpknIslS/lcqJ63DepX0KKwsF2U9tcokJli3EK/g9HlqmznMrWh2hCl3ulG
 yip/4ScjVR8qHe0e69WTsDc5e/DeicyJyo6VuQNAK9g9/mQZXsmFi5LdcWjTPujxsOej7tbcyUC
 6TBtM90DuZbcDcxIBI8xwhE11zUiaz7kM4MVo/2R3jgxD+saudZWAotOnYsJMcR59Zrxa/MFJwi
 NTsaVXP4AnhCjEY159UOSTxeEueAnkguWPsXN5YpZamLHMcGNv0+dfiubohpBj5/o5yc3liWHV0
 6S0aFUVeI2wj4DDPHSA==
X-Proofpoint-ORIG-GUID: U-GIQL6LuhzBFt8HWZJR-YfENTZQtQSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030082
X-Rspamd-Queue-Id: 410141ECF2A
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
	TAGGED_FROM(0.00)[bounces-54311-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,ixit.cz,kernel.org,gmail.com,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 11:39 AM, Bryan O'Donoghue wrote:
> On 03/03/2026 10:22, Konrad Dybcio wrote:
>>>> Squash down and Co-developed-by
>> Suggested-by, perhaps
>>
>> Co-developed-by usually reflects pair programming and requires a s-o-b,
>> and that carries legal meaning.
> 
> Hmm yes but this is his change so he owns his own Co-developed-by and his on S-o-b ;)

Oh I see, I was under the impression that the original commit was authored
by him and that you're referencing my request to submit this update from
some older revision

Konrad

