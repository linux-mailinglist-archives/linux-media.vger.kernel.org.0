Return-Path: <linux-media+bounces-52266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJrfCWSwhGk14QMAu9opvQ
	(envelope-from <linux-media+bounces-52266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:59:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70811F45B3
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 710823023341
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 14:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72584421891;
	Thu,  5 Feb 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i36AdaAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDmLjuig"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B83EDADD
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303545; cv=none; b=JyW8yOlwdJgIAHBzZqiTCICEGOrNHnU2+p9BwRLJffUPCQUVHTQ1GLAJPhwfIWt8GkaJbkwuStvszn6uI2N1xC0T+AZuczEfEBIKckbwZa4ri+kJSFaLekihC1hRIVjCkGFoB4CNiBa6/w57rb6mXIcdk+tfIfh7WvRQueKTmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303545; c=relaxed/simple;
	bh=eiU+1bS+g6As9p2FvLqaVvB+ahkyOhmYrIL/xT0QYvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiJhwrx4z9yhdrFW0XVtmGVXtLIqA7jQrCPvG7BKoM+oUzltMZNDLvcHHjiE3fNnapV2mHLBVlAgKSvWYjNmfCCRfY0+wtJD1AoWYoo9pL7OYXhE017Y50ZdMyBsvsLTyebblqkf061qB2Z0R9JPoHKEQHdU0n8jGdeJuUNWueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i36AdaAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDmLjuig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BlZcD4135739
	for <linux-media@vger.kernel.org>; Thu, 5 Feb 2026 14:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCooReUn47NbAdYaF/BXRuhgYBtDMcYnTCtHV+u8eeo=; b=i36AdaAYbpWmcnO3
	3/q37l9Ekg7KWIBmAIQ73jGthMjG2PzhVOkjFimXfkMQrcv79f1WpklVeXWhoVT3
	Yf2Q3zNJ9NhWDaylIFY3efvNDH/+R8jBCVlQqCKTW3TNL7BCvemjwnzRwh+cKn/Q
	+GTLkUV5Cuyogu2T9jjOxiJhGSkflqgSkqYCK+APSJlebpPndF+PxTGgaxKUVFwn
	Us2qzgWnLNKEtrR4fjxL9AeJCvVvbN9WqG9WL2UcqF0NupHfuj1WKx1gPOQgrkf2
	3pgXNMKAsXOEw7L2orzccJ7PyRJoKPf7WGNb0y17AsqD1KeZt5pXqHfeqzuC1MLz
	xkifvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tn40jkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 14:59:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c533f07450so36890685a.0
        for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303544; x=1770908344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rCooReUn47NbAdYaF/BXRuhgYBtDMcYnTCtHV+u8eeo=;
        b=JDmLjuigeEt+Le6uMrFcRs7BqTsGUp1qLJ8S45hn8QdgQNvpO1MgRwxbIryhuQhfQ6
         ODCHTG2mTDQei3CU6jfwUissb/l83XKkXsG0j61QfIREsnZkAVqVp0E6duujNjkGT561
         Ptb9j/A0AMy2i6jSHx5W2CAz+zsc/T5Y8FqLwfgfL+ZzZEpm/QGZifq5CVpfvUFkZCIb
         SVmJxt0bERBkUnfQ+AUUYeTfMe4w1y0GWwRLHEp6pGKdA0x3uQeK/GEvG5JCjF8frUi6
         4m/PA5scjXSR3LmETgX4QTgpA1h75fw5L4GvyzWUFahx0Y1mHIR7WJvsh0zn1GDIrv8O
         cRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303544; x=1770908344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCooReUn47NbAdYaF/BXRuhgYBtDMcYnTCtHV+u8eeo=;
        b=e4EctkFxnDPmSvmVSiEzUAzBdkt1NfmDB8rT8VUxXZxTv5Fag86fcdqh54NmfjZ2pj
         ApkYt20lTSsRa2SKV/6v46Kk8I6z5kvHtZOmCgRRmMzguqlOrO3BHHfo4p8i5Bf/tFyG
         iW71i8R+G8SdcuOMTCbax8DZM5O05bDnGsbA+0k988XuAap0vvKZnyawOufnNxoHfsHM
         9tFK4dFyoQHP4isj+fUIRfhjITAU+Xl9367MENpXtEql71brVoTpdrnH2jDZRyBctr30
         cM2yDvGKpPjAfg+kl/KxuoNAxUAXHbpCRxFHDRp5E57hhluGcL3ZdioLzb1DvJ0BBFFQ
         AS6w==
X-Forwarded-Encrypted: i=1; AJvYcCU6gFPQVLnILZkVtC9KLiJHfrjbW0sYoK+p8zettAlnOCTPakXC8xbLdZ3ZPEeY994NDKYy+IA42I3zwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb3OrivFJCP0cD98HcsHkq+LW0qHyBBtkBCO8vI/KAsMr0MO0F
	24osdtzZLqRzyJ8XkEgI7mVzbAjHIwytKaq/MdOnEZxrauhitxT2iIY7RWmzq09Das5Itrl8QgQ
	F3QojIRjnCSBaIDXPeedGqbsmdYprJ9+81rF2tERwz2qNsan5C1ZD3oe+OoB8qhhI6g==
X-Gm-Gg: AZuq6aJ3Ytf8krTgmOR12yLHD8BBbp5SZCIM1nSKYHuIYsQEGeH0pCsBKULVdtaRAVy
	IMQPZYT9o7f1fiikqfEIUdKuq7mUfPPrV5g2dCLXNbUSus8DrQIklbYMuO8TLI/dstZZXfmRZxf
	l5wvDWcjOYNC+GNUC+UPtXPHQJ+qtlqBennoT5p8jRpIeiNWRlgDxs2zgi5sbyI1IWphiGB+jjW
	mbbToCm6ddGCx9L0W3USBqnN8221/qUYhv1XEgU7oS1a7fX4HafrRMugm6a0vp4CUlwopnWn4eL
	ezs52vkaXmxmFqp8nyqjWUNMMU75tO6JB0Cjtq6inmfOXJ9R+SiCnzaBPsBs2Z9Lpm5+609106a
	5TWyadReC8yx1tbKSCKYy6YJ3fnmOOHDRjNMytko4cMipn3BHS2pyiCqwiCazQtXuDbc=
X-Received: by 2002:a05:620a:1924:b0:8a3:d644:6930 with SMTP id af79cd13be357-8ca2f85818dmr660199085a.5.1770303544186;
        Thu, 05 Feb 2026 06:59:04 -0800 (PST)
X-Received: by 2002:a05:620a:1924:b0:8a3:d644:6930 with SMTP id af79cd13be357-8ca2f85818dmr660196685a.5.1770303543674;
        Thu, 05 Feb 2026 06:59:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949ed6b7esm2186812a12.11.2026.02.05.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 06:59:03 -0800 (PST)
Message-ID: <1e026cc9-c89a-4c6f-8def-fc9eac5a00e8@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:58:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix QCOM_MDT_LOADER dependency
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205145623.1360105-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205145623.1360105-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xLOBLi0q64j3OE9xNTwSCoBUI8yIXnz_
X-Proofpoint-ORIG-GUID: xLOBLi0q64j3OE9xNTwSCoBUI8yIXnz_
X-Authority-Analysis: v=2.4 cv=Dfgaa/tW c=1 sm=1 tr=0 ts=6984b039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3VnJ6WgW_pJ2kVnysBMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfX2rF50TYhzDA2
 aoZzr2EPkFjcNAVNDmqWBaKGrv0vOWYVeUSqpFoP+JRIiaHCXuDF7PyzECIldQofppuA+LHsbkq
 0E9MBEydvwGbjMlXkisutcU5EFHdh9XvD7p3B2wpZofjEl2pCXqme1nmMdRDRRgU9m+a6wHcS6L
 PqsUOoSdQYf2Brixh1uXbQeVTCWa3J6kVmcZMwMdP5Igj/0ScxPawn002iq6mp2u1CTmF1XF5y7
 K10fU9+fyK6FWsIYYM4tnvZkzzOMcWpt9zAnTMEVp14wZzZTGX5RNLhmnXZl7P0hiVcCJ5lwQXI
 OWX8fioUT2p665T1fRer52Ksrxxvd90RnzksI2y+JP2npqUAqk+4eGV6jfWEIKPKOUBc1RwRXwQ
 pAUDP5PjWjome5txv45+OWY8f6Yh1TYiGIH6EBjFZKllJZWvwB7jjLapScrTR+tZnWbpLUC7/As
 XNzILsVze+8W41669Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52266-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70811F45B3
X-Rspamd-Action: no action

On 2/5/26 3:56 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_IRIS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_fw_load':
> iris_firmware.c:(.text+0xb0): undefined reference to `qcom_mdt_get_size'
> iris_firmware.c:(.text+0xfd): undefined reference to `qcom_mdt_load'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I see that drm/msm (+Rob) does that too, but perhaps for a reason (old
I.MX platforms with Adreno)

Konrad

