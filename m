Return-Path: <linux-media+bounces-63237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AqmNA5qHWrqaAkAu9opvQ
	(envelope-from <linux-media+bounces-63237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:16:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56B61E2F0
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 13:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A799305E191
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 11:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8255F39E9C8;
	Mon,  1 Jun 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXtx2Dex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkzRKhJo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30A395AE1
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312162; cv=none; b=udBmUcY+J+n/FSBqWVWJHOIWKk/gvd3feTtGyaPgMoDABJqbQvnqloN+7WHdEhe507gwZv1sDae+c8vt4KwX38ECnOg/Um9FOnSIzR7D/h0kN7b83YjyZ+MRVXtMeRgLde92DhbdQZj5zlTWxzF5VBAu8wQPZIE4vNxTDNizPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312162; c=relaxed/simple;
	bh=3alUzHGu1q1rZwyrAelJu/jmfwWJ8k4Cvig7EsHZoFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xbov44FVtC+dcqveJuz9VyrHMKcl+GsKP3vFzWzdjW+6qzaDQvnIlTZHwxdH+Zi026u67kuB++682UFaMxKOVjFKEus6pk395FwiWrpE+897v4qC2m7/ti8LbgKgQ/ENK7lXJ88ckLQcCvTCEzw+uIgzyG8kZ4j25GfKUarXOmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXtx2Dex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkzRKhJo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dkQB4110318
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 11:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=; b=iXtx2DexuH/iRCc9
	CdcMNyuvlKZO6CRDVnxcdqrrgBVrUSFfuZCo7NhPUadDNuKWBEQsvBgrFRfLiCp7
	5VgxULzkLrO+h56lSjBpZl1u1jIkmBURaafSWpPndyMEbQulcZIw0t2c0Uc/6i8W
	sPqDT6YztMuh9CN8M3s1C3kpZqu02Zsie0XhioKJ0R7XqWLWtyDQE6yMDtS9W+Ka
	CoWntX0X971J89iW0RuaOTdByUy54yqtEl/qBTeAaR0RDR9rbQFJQTVvVm5uBjqa
	DPbESJvokHE2kG3WgrftxkO++i9pt/aTfJaEPfWclqM0Ar42YnS7YMsX0M7CkOSv
	mSNNqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3rjea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 11:09:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso35822435ad.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780312159; x=1780916959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=;
        b=bkzRKhJoTLKRPysn/l+Er7znAvuroReNbuVjbbxy/EkY6JQRkLdwGPsPoS8ktctajy
         VP7pp5AHh35ygzKIijZvYaOsl/s1ReA6IcmTN62vqNcC0c0PRm97IxmVj8JKa5rmH4TK
         KqE/VwsRPZI3bLCGuVb1eJK++n7AeEMZOBWD9ozEcXiPbpmxIPmuIwZyaljfnIhRTLRB
         Vz57/R8D2smy//yMxr+F1hCzYDUSGgrcGmcb5ppdEendGJ2nP1fF52T/fjCahBnqQSMM
         lGAMAvORlEu8orRoT/mzp0ADlYlf1f2qn3bT9Cm9ctWBFwykOoJx6Hsa7XjJYCn1DLF9
         pHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312159; x=1780916959;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=;
        b=Jn2Q0Jr18MAq1h8PIrpK/4XSYY3S3bknJPNqAfNGaDU2c4KS/RGjOCaWdG5urVBAro
         Yllw7pah7HOad49tLAygAw+TTGpchrZ9KHJTm+PO6gz4ko0FsGpq7puUbJa6k92EepK7
         zJcrP9PwCzDKX7ggU3JiBvEYPqpKtQ0Za9vJ7R88neEdJRgMtzbS/bXtGHVZSY4IhYaA
         kHEEkSWzRA3iwAH/EjE4MTOXm4/D6hJ3BvwY9robPSnxRiRfd5Up13TW/j/aMAv/jbVp
         2kympmaj67V08xL9ZEFOgS+McdWNBUywYxvux9QaOl2elpAPMlZUCyQ2Tgx4UxVrUo7N
         8MMA==
X-Forwarded-Encrypted: i=1; AFNElJ9gwcy8RmXfd0eocdUH/wvrCgO0WHa9UJF2XLPItTnqPc6Qf41NlI/UIHp01+bv9OwO20H8uGoWPP0UIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qFr1j3VNGefjXgi0Aj/tDUd2fvrI/ifZQ9pJE/AUuz2o71Bk
	eq6WB47FkS48/cJxG/U9TeYOzlYex7CIG8ZoZK+pAua7T3x2wUdIfzaegsXo8slwHK8k4grBO9E
	XS7KHlWVNhiepop1kFMt7jis/iAQHQVkUvffCghIQJk3VGsorJLXTU8/7Ms4c/ep/CA==
X-Gm-Gg: Acq92OH3EAsntDsJlWREDOZNcUZh/swNlTOTQB5nWUJbAIabYSf2td714M9jeO8+hlk
	mxKbHL+0daiRRrmI9fnXuZpkjXRgTtfIvHTGlptVZBsOT8sngVMRGOAYyzTzol4+J3+Q2Yxx0ZH
	evxrRys1254MlQ8d1dGQKJDYV5rMDXbep1VBLqiaMw05BM+Hogi07uodH5jceR7m2bW/QLRu8Sm
	MBdZvtALBUlbrCjMHIr+EE5i38eoJAJSeBlIhOWqB15YYYgHV4rzcEuWJU+CyKQMMFd/SCCmyPh
	8gfJ3PVnUK759EhT30Fs7eabeKfWirT8riPrr5I4kL9fVFGzHvLbHtpX2/V9n/fWSn8X2lQkUyg
	37astlcg1iLnH8fGKmtABVGRGDXwh1KEXyyIDwZ8k3DNLEYvjWIQmNtmcNraUeA==
X-Received: by 2002:a17:903:41cb:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c0f8075731mr14858555ad.34.1780312159490;
        Mon, 01 Jun 2026 04:09:19 -0700 (PDT)
X-Received: by 2002:a17:903:41cb:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c0f8075731mr14858115ad.34.1780312158973;
        Mon, 01 Jun 2026 04:09:18 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a1e095sm107010925ad.32.2026.06.01.04.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 04:09:18 -0700 (PDT)
Message-ID: <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:39:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Content-Language: en-US
In-Reply-To: <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d6860 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Xj-fFaYqki_RdGdrlmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMiBTYWx0ZWRfX/OL8Zt/Yvw3y
 VapBV32MhYC24IgjZArZD5FVPsXvgTxJsApxD4mfA+W3UJQjxjKLC6Pi6GRxgHS1NMM+YTQd1iv
 7S4jwCC4Wz7SPwlEnRhPZwMd3BkpFwqc9rbmL/AHxeDKTO+3vmkPe9qLbZpd0ym6S792Yqirek5
 EfMDjkTH+Z/CVltHh8rAPSRwvHAFoecjfgmBj1vM2KdjUYd1IwyBM4sfrwnX5w5Gbc4bu6RwXQN
 LLIera4DEjt0Ti1W9cytMMxG4dPxHDRcrqbW4jcMFuwolYS2h2dQzJ+U9PaWnHcUzXQrIt9/bMS
 TdMxjtetrHe4hSvWMdjGZWSicce3e6MqoMCCV2hi8dHGo4To8wHEi8yPrYJqAjjjoasqYyTzZnB
 o6EBVv7hfiSTcxcQVK2lvm6AyBjvpfWUWMYkXGva8a0ym9ZVMpLCeK3fgwBjsMnp+7y1B5uh4n4
 B1dmaUHRsTPiXwGbezQ==
X-Proofpoint-GUID: _ISgXYjI_-EtU5AyyV4eu3VWQDZZXt-W
X-Proofpoint-ORIG-GUID: _ISgXYjI_-EtU5AyyV4eu3VWQDZZXt-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-63237-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C56B61E2F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 20:20, Bryan O'Donoghue wrote:
>>           ret = 16;
>>           break;
>>
> 
> This is a pointless enum add.
> 
> NAK.

You're right. Since Glymur reuses vfe_res_x1e80100 directly, CAMSS_X1E80100
already covers it. Will drop the redundant CAMSS_GLYMUR enum in v2.

---
Regards,
Nihal

