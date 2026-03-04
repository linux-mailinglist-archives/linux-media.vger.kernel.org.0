Return-Path: <linux-media+bounces-54450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM2SL1v8p2mlnAAAu9opvQ
	(envelope-from <linux-media+bounces-54450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:33:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC41FDA71
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FCC5303A849
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77953988F2;
	Wed,  4 Mar 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDo55Ke0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TirpKM9g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6213976A2
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616777; cv=none; b=im2oQ7guJCAYz2hEEWPElzuPjHwX277TGmqSUeMcuJqFM18Kx8354Im9I+cMq1zypHuuWU03wHyIFriUmoAvoe82xS81AuB8YJknRgCfxSCNuOBjLNjWAL3wb9SseWIGRM6F9h1uEURBfJYCucuJtaW4dwGKrsKw8rtLtRc/X5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616777; c=relaxed/simple;
	bh=Z/eJE9wFLrz8E+sUg7CGHUvq6+8QleCiP7NDH8UwBIY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PeoJrrYggG5CZc+PK2YChxcBGBG1GTl7y+9PYTalEJZsmrVI+4aK8frhYfZ8gLtchnrTykFmAcSNmD8SE3iDDoLx/XKbIRJvLFx8GFf/b1hz/Bg3aa5BY2U0s/ZxmVUMuqXpvBAzbmAqwNJ1YW0c4cPoML1yDa5fkFqPaK6zZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDo55Ke0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TirpKM9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245Ss8l3110945
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bx3wpMkjZfdqRG0nPg8aof67AqNz/1s49xLwUjoGMng=; b=dDo55Ke0HYDMNGzK
	+Jd7adVzH9AX56D2xTbafJZMtcDuD5PGwkIkzA6vZMc2IbTDxxxgk82FDLqwC4qs
	Sp45f9qA6q1a8fVr9UkP8uros5vORMnWQkbiN4iGy/Ddri3/kaQg8VlDCXEfT3Jp
	lfvCp932loKgmRCSloII/3AVCV9relFNZp2W0CALOlwanIlTXv6xXBxSpn81neoX
	pH+IbzrPc4HNcCNqJsWij9UuKM84ma9gdlTjRwaZSPsjpshjK+2k4BkKvqmHTFc3
	+xHnFNn8C8PNpNbKBlibogvyS1I4dRucwMm/4bjsqKD7Xh7iKoVv5tyxpYrx5RsT
	i0o/0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2akyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5359e9d3so4542848485a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616770; x=1773221570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bx3wpMkjZfdqRG0nPg8aof67AqNz/1s49xLwUjoGMng=;
        b=TirpKM9gKYGT6qKkkWcx967quXrlmoDWK1Ooe7bHj6LzwAUKwGVSgrwuT62o0vWSZG
         L71lC9n2I5ehd/HkKN+R9juRBLVt5EDmYQcpfVU4hsdoFynCboEaaLxBZRlxGrWeg5W6
         tIRoHIbbfAPuLQVoARnmjyBw6uNRrpuZe+94enYMdKhPmUirTMQiayzYGBHZKvBRjZbD
         bVEpRIb7ZlozFj0MiufGwidMhh2kiT3Cb/tZ3KvalPOToR0JKHqIaUFYHwukn8qIrH38
         dNOiOn/VBU7vWjatPyEWaWjJFOJtaBtRScf6+qSQXm92/a2Ny6qaN2HR+U25taQUQmvv
         nKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616770; x=1773221570;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bx3wpMkjZfdqRG0nPg8aof67AqNz/1s49xLwUjoGMng=;
        b=p7DzygxihJ0BwXb7BHrDVBaBZtdEl0LtJKtWp/YdHQe/2MDdrt10hIqD7Ome/z1LSm
         OzvaUqZK0nWHatYM1hC15vLSeQIP/GY+RrSvC1mC9c/XYD2/bRnyR2vjBB6vN+n+tbj0
         fgAdomWlS0RXS0xmgP0t2ayZReGS7Jd8shjuMY0g9PKpfUXhY7ekvSS9C6vh1f6EElcx
         JkEfvcRDBAApQs3oDK/W7l7w2fIU5otalgJ/XJGCyqYtSPyUZyx5vUWZmRhDGPVMZSX4
         eSEHcbpkPWl7qKO6p49+udnBOIjqzt0oVmQQzGG8I6A0StPgJzyWTI3PUUcD3nmUc48J
         JMyw==
X-Forwarded-Encrypted: i=1; AJvYcCX26xabKgfDwTpwVJkyiECbGS2fZLvidwT6W/O4VUTWbEdx+a8muBGULiZsyol3j7yvqb7D/rCPRpGOIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLwCCAF3bBPQCpWRsjrxLF/ZmBgAJxTiLEKvfwogq4wA2FZcAj
	Y3k1eJDUJ9M8oJjPJTK3oaN8KkV7/1ycGIAtOYbdv2ZgXVsbB2FmZEQnOwnHbUi6akS8w3rPz8Z
	U0LaT4AiGY4ZaAowHyxhN7AtZMBXyAD8cQCSkrU0Rp8K4CpKTI+jUJbdLcrAoHWlV7r/qHGuzbw
	==
X-Gm-Gg: ATEYQzxC6G39+SX5WkNtfiTcMbWAxuq9+1JUKSMDmCEDJn5h3c8P7jICmpBlCZZGNkY
	kzP9o3HMu/fKOYgg6CRhf36PdVWpiyydq73k304d9gEicEfn+OB2M9DqhRabEGBGFhFaT5/YaRm
	i/T1VHAk1o5jMqAzOw6CYJSmkcHf5vHB5kSD78HOFs6kJ+lr6knvXfyb94SbyCJVGG12Dme7h9S
	M5I/0pRMnCdtxG5CkPd7XmV5hiPZ/cIw94gSZv65+CMp2icJavSzI08n+PxroJt9m9cedfXqAyl
	933+5R4XRMaV2Vbki91C6CCQQDaTfAcFJDxwxy/0Gp2jO3DE21cIKaAQrIrbHaXCmnvFwJR1OF5
	YtbGXmQU6dEyE/JToUhmpygCeCDRNi/pNcWhfmxr0KrVzCn8hqVqhw96aj5i9exZUHoVL5ULKJn
	NkLKjC5nBUj79E3HJgQedd+zZma+8UiP5G6nRPjOe58PiwhgyHOleuQOqtTRQD5/6CjCi3dQ+fH
	kXotpF8IDloOBie
X-Received: by 2002:a05:620a:4406:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cd5afac71bmr157118685a.54.1772616770374;
        Wed, 04 Mar 2026 01:32:50 -0800 (PST)
X-Received: by 2002:a05:620a:4406:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cd5afac71bmr157117085a.54.1772616769914;
        Wed, 04 Mar 2026 01:32:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm1168978a12.17.2026.03.04.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:32:49 -0800 (PST)
Message-ID: <66ac63ff-7369-4683-b802-5f5d30f3f530@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:32:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
To: Arun T <arun.t@intel.com>
Cc: sakari.ailus@iki.fi, sakari.ailus@intel.com, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, ilpo.jarvinen@linux.intel.com,
        dan.scally@ideasonboard.com, platform-driver-x86@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mehdi.djait@intel.com
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260302174644.1258718-1-arun.t@intel.com>
 <20260302174644.1258718-2-arun.t@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260302174644.1258718-2-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a7fc43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e0fhDsDLZYdukTk1vE0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QPFn060IWTmcmKXN1Dftk3UP9VMXdfY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX+OH5I7qWZydc
 lP3isjDTMpmWXbEXfYXmv1rrhXNgELsRi9XbQfsdqddcMfkGBWadG5j0pHOfbPEHCmaGkiCBKW7
 h4nwwrrkrAtxHUgu+2WLaFmzvf3f2ikrnEjaqK/xhHn8//YgfBl9/oytPRhyMe0sMb0c+kmgfLR
 /jKp42x+/Fe5cTDKGJ4Gt9mZbXIgyvgDWbNOyaEej32XKprQyUsdbjY+rZrvJ1Ysq011fXshQSj
 fdor4Mjg2JWXpgMgSzMQAlmccrN6PeYKjY7j/u3mnDTc+Yo7MynXG8nEnVg1TsybFG4mR32WZRb
 E+2RajH87m+AXQOc+Vz4Ho4Rh2Jw2XZtYFcWqattFn85+IBILyzCKzxYBrPsWbmf5J8EPPsgQ/1
 tKY7ojmf/bSea9NRZENfrKmoXpvJWRdksPuRR1T9/rMPEhN7CuGE1CcUvCt8hdPPXMqTIIWiLhL
 5RyDhCy2YbWRlFVyvwg==
X-Proofpoint-GUID: QPFn060IWTmcmKXN1Dftk3UP9VMXdfY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040072
X-Rspamd-Queue-Id: 39AC41FDA71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54450-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi,

On 2-Mar-26 18:46, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..1efc0f8e9ba8 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
> +};
> +

I only noticed this v3 after replying to v2. As per my comment on v2:

https://lore.kernel.org/linux-media/0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com/

this is still wrong.

Regards,

Hans





>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>  	.consumer_supplies = int3479_aux2_consumer_supplies,
>  };
>  
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
> +	.consumer_supplies = int3472_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
> +	.consumer_supplies = int3472_ana_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
> +	.consumer_supplies = int3472_vcm_consumer_supplies,
> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
> +	.consumer_supplies = int3472_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
> +	.consumer_supplies = int3472_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
> +	.consumer_supplies = int3472_aux2_consumer_supplies,
> +};
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>  	},
>  };
>  
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] = &intel_nvl_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &intel_nvl_tps68470_aux2_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table intel_nvl_int347a_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static struct gpiod_lookup_table intel_nvl_int347e_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups = 2,
> +	.tps68470_gpio_lookup_tables = {
> +		&intel_nvl_int347a_gpios,
> +		&intel_nvl_int347e_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
> +	},
>  	{ }
>  };
>  


