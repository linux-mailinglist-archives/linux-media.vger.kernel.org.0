Return-Path: <linux-media+bounces-58213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ8bLUwd1mluBAgAu9opvQ
	(envelope-from <linux-media+bounces-58213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:18:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 365C03B9BE7
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 11:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A865630429A7
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 09:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773E32135C5;
	Wed,  8 Apr 2026 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaltLony";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6LgxhFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4703AEF3A
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639863; cv=none; b=cra+IzbhKIY6oFutEVc0GofT0iuboZ6qid3i5WQXbtSaU8SrDXp2kEVj3uBOd5zqwH5EuCGP5FQisgalKvITIWFcje3qV4Rn2jYa9FC2Q6MtuH1Jt2yFdeVjARmNeYZtxAz9z4VaJXQwvXXixrQxZaobbSNpC4pw19ZmtJrlci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639863; c=relaxed/simple;
	bh=5SgtmHDKYJakcPQU7t/Fr9x1JX6LqLotnyM8VacRCWo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O6AgcnqTmglfg9DnoNmTjQYscAXKztTspIfnNfXWY1TGMVnPEXMnyTi6nJt5677WEo7NC2uXO3mEYxHwSOR0bbWr4/u8G/SdJw6kWpMVsjeguwnBAd5skCUAXPUavX87Asysn05IiHA+GnxsSKjxVKToZHlYpXcZgbhrjuXMYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaltLony; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6LgxhFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385QCK9263342
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 09:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=; b=jaltLonyHTzMahw/
	5o1OSpHW08r4XpbN15i37+WTyb5ntcFKjd+Myy47ADT1beruc0in9UxI6GqsF6Yw
	qTQKH4he5o8tTNnQ06Lf4ZaUgRmaTxV0CzLHRzGYMAh0ezWH7Z92p1OiM1aLYrly
	3H2vVzmCW9uHEgsftdtrobwxOEyjJdvqsRW2XgeutXINVPjF+fbIUxQ3DK9+ufWF
	xo5ejSDOnlriWpOKU+mGSIkNgrQfIBpNaJsDkqcBQuDNbn3BsJToLD9m/Rsgros+
	n4lCF+tSM2WDrXZSsa7re1F5zscBNF0/PtuY7665uX+q0vBd50zS/e19LsjOvEG9
	5AA+pQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t22jjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:17:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24308165dso150059065ad.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639861; x=1776244661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=;
        b=i6LgxhFpCCrKC2pGpXmLgmBTPGi2vDWB9/fwrc1VrSyv2VNkIhwQ1YZzqqPC3Fq1T4
         BFOz2X+JjFWDFzib47TXPytItvLSnqpkbbD2DxaREQbC+lCyLlG2a3KvDS8bulA6TtQ5
         1jr8r7xPYXrqy6KHkaOqCgGlX8GiETveZDXd062/STHcx4qTvV9+F4VMOZokTYNuXg6/
         eF57UlOrT3wQoeqfe5mf/0Nb8jXGiaQPESQhY264BXEz2Dycul5cKZ7ReNZu0bBlO7CH
         wcDhsgaL53x4HH7vz0jRG1b+dzPAsKxH+2qSnsSA9ypbUCZ82IKcvDHmnYZHVGrxv2sg
         1N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639861; x=1776244661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYLdUNJQh7BrO+HAqncIdNbsC2A6tIUVlp7sdlHn+3g=;
        b=PvHt2wmLLOomZH7/WAeT8DQ7lvAflqNYZNiQJGdHv5ZfTudCdOkKCmQEjOCvpCtT2m
         wjcUgdxlaOn6Q6EYNVyGHDKJah9ltQKXCAZ8oPnCLZw9Rca3s+1mtZU4fAW9NvuyvEEm
         sN2/hqs74JVx5xwqV61HWnIF5p0cPKtP1oNygmHZwVPjwZnr2/tb5dCAifGhMzJP+CQP
         H96MCtlyq7L+rLCzNi/a2Jk9T+gjF6WCQvMYLQZKm3JalYRb04fRNB0pGndTAmD9yrOK
         6uwmuB3/8zeOt5eUe4sUzKqknYucpXitN43VFtILjVIjtoDYJsd1iLWPYTb3hToZmFe2
         JynQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe1xpHXydhnXLe98VgKzowHrTTGfZKAj7db9hXgl42dNY7nAj90J2s8pC9ozS07ynxIaMBVhRwFT0/XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tN7VZ2Ceo9plIk9bHXyLIfNVEf9SkFjnRIhofLTHl6QCyTiF
	m+4zU6hEGmec8LEqWE1OKQ96P3RdYYmOeSa8Zuka0X8pQZGoDw+PU48jdHLsWAeqdTvHC3CzLKt
	/lvNm9mlNI2YpaobmGJjfLdydXDxOR7/vP7QZD3uKZQucnHHI+stfFPlLWeVhMLvLOw==
X-Gm-Gg: AeBDieuh2290UyWLel1Y2J2WON7HkwWkJ8W0NHdwOCarpPCU4A9h79ynvvVDnD2XWit
	LdekjxUyC90VoV5wKCmXTizr+H8Uh1ff4RqS/OPrReMH1HHL+MtS441iVr8LhHz7MPkzCDm8mm0
	oD2MAsNRSJPQj5vFgKEkUP5QSHETN2G6j/jwJFIVtEdhSJ65NMDr/R64tCnjnF3w72lWmPq7nJD
	bJly9jAvvjwZeXQYKNssO9dzIj7QWN30EAtrcMwvMNq6v//uw0Z9x4RJn2e5CJcEmZZPLabdumV
	nCT6aaquF1VTwENMcuw1BYAXYbF2SxHTBxvBjovVdxzWIUlOT3Lh1Bf7lCC2WTpJyiyd3o0Nmda
	6rYX2bUdFhrce+jEMhUKPV8nYgYUPnV1uZIqxs9t+qHwMerKnp0Bkd4l2eUnYZsTZi+ryZu284s
	i3o90oV4nlUq1ai2Wt
X-Received: by 2002:a17:903:2f08:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b281706ecfmr219601775ad.1.1775639861536;
        Wed, 08 Apr 2026 02:17:41 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b281706ecfmr219601445ad.1.1775639861075;
        Wed, 08 Apr 2026 02:17:41 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbce2sm196458655ad.79.2026.04.08.02.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:17:40 -0700 (PDT)
Message-ID: <7e7f7778-9a26-45f3-89c1-0113969cc1d8@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:17:36 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
 <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <437123c2-35af-227c-3fe1-7d45ea1243da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d61d36 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=cPr5IrC0RMkJ9YLvWl0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfX5IwNPADrOmyH
 OrY1wlk0pUvImbaUwFNImcYu+8xZWBopF1CH1q+Oh3ClbodTgZWqVZ0Ebof6CPyPlwl1Eqt8plU
 Ur/68nguKvd2LW2tNLp/DoBdULL78HjfpHRBGtDnTz11w5SxUA8pSsCIQAP2yjNNcO0V1i1RWhY
 IgXI97DzXQZesA/TCNQznO8kBHAdwlQqTxyHJBO8dWzNYWr1OjuloOPF/PnhBuSxlQ64ywextJ/
 H9rmw3OTw7dhNy4932T0E+kYyK3VFpcyDqt0O4pCT8uBQZx9BRTNiZsFlB8t3cxWhsSd7hyd0kL
 VnPjRGHO52qNBRJfcAnOfrKoSu3wPzBaFSxRO6RQN64/5Py6fHbvXG6NiM2QI6TqilbYeQR6Hks
 f3bURZokxeu4AEU3IDFgy7e3AG+H4RFblmjr0q99A6wj84VpXBrE8g+2i5whTnow6JCBpGGEgDn
 drdszJwslQSJnE36rlA==
X-Proofpoint-ORIG-GUID: HJ8VVlaQwKZkP9gfkLIjdQHWkpRn6BDu
X-Proofpoint-GUID: HJ8VVlaQwKZkP9gfkLIjdQHWkpRn6BDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-58213-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 365C03B9BE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/1 20:40, Dikshita Agarwal wrote:

>> +const struct iris_platform_data x1p42100_data = {
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> 
> this needs a rebase on latest platform rework series.
> 
> Thanks,
> Dikshita
> 

Will fix in next version.

-- 
Best Regards,
Wangao


