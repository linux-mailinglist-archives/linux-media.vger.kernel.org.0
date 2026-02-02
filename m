Return-Path: <linux-media+bounces-52031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKZbFR3AgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:17:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B4CE113
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4A630143DC
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9B83783BC;
	Mon,  2 Feb 2026 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0o4Rh5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+MfAt3I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED836F43D
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045041; cv=none; b=EyU6T2rY5tQZ+KK+RS4rvgzu8k3UBmHwyf/C//cmuK0v1oqK1ktQzn9IGJ5JSV/RolBQIo65EpIPsf71NgIGg45ZLJF291pY/BlcE3zYtYP05AwQEkSzYqxtzhZ+nFOUiTS3jL7BHH0vbZP6AkPLqje48rPbRel88wORTxscd4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045041; c=relaxed/simple;
	bh=UNy4yDJeV+m4ntYxGYDyc8ert9Faoypz6hlYzsx1LBo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o7oZw2nTi4e8kHuaiOxvyXWhgSb+loeKaxyPOlSfHIBVUBR5wrcYwfud2BxeB/0fpS1TqjNVXt5sA6HkB0NLVqhkSYtfDLPRtvlsCMtwvGoTkzMetWWj5ElJwcc9TNcXkrJdEwqGn79evH8dIY8ASbtR70uWra6kJyxlbPpToic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0o4Rh5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+MfAt3I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5YWa3459184
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 15:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjsroVNnTA3WFPJbo7FKiQMN9RAOW7J9k8+sWZ+5fz8=; b=d0o4Rh5c3ImSc820
	FXpLVQaFKliucWaGQOpevLW3MyqP7IBt/fse/xMcfyML/uH2u+elx44xbrVSVnyR
	Od6V0ZMNqq7BsN9fMvYAru7DV9jC5SiZe3NeH7qLYiVNXhYQtnMtMg0EsWDq6xCU
	eL2zNzeZV2yI/0+gE2u3fbyutnPbYcqbC0cx/E+Ka+d1RMgIAQ7nhikcJ3yegNR0
	5KBk+rQTJV91AS9RGe81q02IkezKnQZowob1/bij2HpEBhB+h91KadPhE9foAdQj
	25BihkcEbAd4P9rrIlbiMAIcyz1hKzlK9q/erq8Kf3/9HadizWnQsbCQbXBTj9rx
	I9epAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbgnnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 15:10:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so1219037685a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 07:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770045038; x=1770649838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qjsroVNnTA3WFPJbo7FKiQMN9RAOW7J9k8+sWZ+5fz8=;
        b=K+MfAt3ILp+FHftamuoCI2UHPRV6ygM0jTFBpm8f2CwQDV215kVTJO4FV/Xk6LODwp
         f0+W1DJcbNKDQBgtSQ0R/HfLYrEDh3ExloOwRXlYdgQgn6BZMz/su7pq4quDUZmDDDe2
         H/kLX9XnO9h5cVRa79tN0PdMIrfbQq6LDVx9w2ArXnXGCLHKWEEyyrf9XNAv9rKTUapD
         1Aw9jFke5zAtbStZmqyztyD84uWcICL4vsA9vt4xQn8kYkn5j1eTnmVXB6z6J+sx7J7e
         5UZOw1Tnom7iiwk8amVXWS4IXXFHkp0hBQ3R29DNXfYEJZVYaioZXPyXPuOoyTx3z3lv
         LPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045038; x=1770649838;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjsroVNnTA3WFPJbo7FKiQMN9RAOW7J9k8+sWZ+5fz8=;
        b=Z2AZeCBQky2RKRrEU+JrVBWg/gjlNhAMHfEWol1EcLUgnYkfRNkRwl8SpEeKqhQeMU
         eOKZ8zTZlimHxx01XvY/5NkELNHBhwbM9YFIQKcgLe5yN0NII5sUm1fIewYdrXgNA9eY
         obyHBfekJRGyLSMlBQfNoN0M3rn5fE6lSanvFu9Lvs9Bv0rKBvFCFiFZOhmOLTUKNquk
         8+PBMQk3NrjWKQmDNCxHNj57IMtfMYedyTcFZPgySA9l8RO6fj8qlhU9Ua02Bgnz9LVy
         dTSj6ZxQ2v6q2MFN40s+sVC4FOgf4by7yFamajGqsmK0l2ubLJXMYdbxeTv3NpeXa61d
         J9VA==
X-Gm-Message-State: AOJu0YxiYJlWtfReMVBdu2c/N2mj+uJXZCfnDTytGE5+h3Ei1cryXFGC
	+jQfKELMCw59GwN9cEFK5Yljf8GwbX5/llKiW1Al6+ZKzh1S37ym2/8lUxRO1g0bj7DzJLaDIDH
	KUTTkQaE2sgVuaiK4V1/02rj+MqzO3ppbpy2veYoGDQFLJB4jMmJmrYLmNhCNECH+Yw==
X-Gm-Gg: AZuq6aL8ph7EgceNtajsydv+yDcab6sGG6vEsUOwIWnma8zWboFeikAEEaqQjUaIoXQ
	rkv6Kg3vmGEuBMsgaCQj4K8UURB1rPug5v3JZQ7IUXbMPSdfDEeSKsvnEqHzWZIbS9PogBWSAow
	Gz2xfXOBY30TsCDiqjURePzYZ/8Dvaf66uGfP3dx8clQS4nI0yKbL9+h7yzuAFlOLk6EUC1btJq
	fi/2y6qQhioP/s2RitSvUFPFdA9tn8Qu6NxPO8n2zl3qswpz0FgCCr8RziTV8SMAJEbqoudLNtH
	bf4KO4CT5M2cEv8rv+v7XRjx7B/FPjApGiduCWW32oBKMAPjCJr3bfOzq1FQcnUR/QmNe7wEfFP
	9unP47igOfK5ZFuruHIJymjOdr6kcwHuJkBgQlajfRUXlfz6+2AnB329zx0QmfiK4SbpN4gstDz
	nGxZKODnqJPtx/cOdYTiJRy+Sdxx6D0ZLmMN1qQIs0Aac9q7gD6OD3vKMAqteHO4zaLJ7WgOjng
	rep
X-Received: by 2002:a05:620a:461e:b0:8b2:e5da:d316 with SMTP id af79cd13be357-8c9eb338d00mr1483020085a.87.1770045037884;
        Mon, 02 Feb 2026 07:10:37 -0800 (PST)
X-Received: by 2002:a05:620a:461e:b0:8b2:e5da:d316 with SMTP id af79cd13be357-8c9eb338d00mr1483012185a.87.1770045037140;
        Mon, 02 Feb 2026 07:10:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86991sm899192566b.4.2026.02.02.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:10:36 -0800 (PST)
Message-ID: <f44ec888-a2b1-4ade-b4ad-1cc3ff82903a@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:10:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 1/2] platform/x86: int3472: Add board data for Intel nvl
To: Arun T <arun.t@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260130092431.2335363-1-arun.t@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260130092431.2335363-1-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EfkHX-n7SIwMun6sQzWp5RpfA1Trjkgg
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980be6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=_nQcPkY42JPOdq3XkR4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: EfkHX-n7SIwMun6sQzWp5RpfA1Trjkgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMCBTYWx0ZWRfX2LRcn929nks2
 Px5A+fGr/ROoH5Pl6kvhBSaqr1cV+d5PG+M/ni3BKcw3aeYW5+fRdbaT+KSb8hoG4sSLWWyI2e/
 rdlX89BZj1qKT1No3Wce2vbCFF41AUpt3cp4Bb/08iUbeehcxbZePBjo6RoiF+ual0aRtaeyNDY
 806rLop2WcPv9eU0B1otDd6b2e6eSqggjWt8BGFefxGIbHT5QQOq1UJ652OrRHMUsyL/Nuydcvp
 +L9RadMbugAcyhTKExlue1tWeX9Znzm2O2BDJ1M+BGZzLkd3TqXCd7Ed+Cv0Qsy7Ztg7a/9PZzG
 n64AvR7KW9j8MqKVBbMV9wv2SVbhCxfPZIXsT27NCBEa+V9M4FRu0kGpFV4FMZkfIT6ELOrZiTR
 urFIns/Clkv94q6PFLFna4tlm33kc2uz5YUja07wYmdFqkWTuXvt/v6h2vTBI16bHWuFJKsKTnH
 peS8yM7xcJYsCWg1IQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-52031-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE6B4CE113
X-Rspamd-Action: no action

Hi Arun,

Thank you for your patch.

On 30-Jan-26 10:24, Arun T wrote:
> The Intel Nvl O13b10 sensor with the Intel IPU8 ISP.
> The sensor is powered by a TPS68470 PMIC, and so we
> need some board data to describe how to configure the GPIOs and
> regulators to run the sensor.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..7820ff811df8 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int347_ov13b_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int347_ov13b_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int347_ov13b_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int347_ov13b_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int347_ov13b_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int347_ov13b_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
> +};
> +

You're defining many regulator supplies here, but in your ov13b10
patch you only consume:

        "avdd",         /* Analog power */
        "dovdd",        /* Digital I/O power */
        "dvdd",         /* Digital core power */

So you should only define those as supplies here.

Regards,

Hans


