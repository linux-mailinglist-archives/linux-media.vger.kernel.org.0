Return-Path: <linux-media+bounces-54448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE+6DnD7p2mtmwAAu9opvQ
	(envelope-from <linux-media+bounces-54448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:29:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF5A1FD92E
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19C573018C34
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFE0397692;
	Wed,  4 Mar 2026 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZJa9yr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGJEBzdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4E396B7F
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616547; cv=none; b=qRTW3QAm7fpcjtyf34XnN4onVKQ76vgd4lFkbcBhEYoWoNDWz7x7s6bfU0Tp1XbMYaUO10uzQ1h8TdK5fV4WP585ydTtF0EYFf+UKKJ+VJkoJHcFJ1fX6P/bjew2UFo1mWixO3RrU2pgIMWoNQE8kMS8yC3DVIzU3HL19HX99RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616547; c=relaxed/simple;
	bh=+iZwt2542TCvLOegTbYJXlTOngpzejOxddz+prY+cYs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bqbXp85gatFQ2TjqBr0Fe3kWdnAv45yMIKQg8wvanWLRx6TKyapCT58ew8/AZ3fG75KgwFra/ehfJV9T6EBagLnq3fZXdkI0HnXv9FLM0FNb00VLbkH6HOtvGsZWaZvn0pBW3WqLVkyLZjL0+ePuBxsvUmkIJ7RMavzZCpll1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZJa9yr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGJEBzdW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246DKYw1203575
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW5EUg1yaoYe86hPewYMQORzz9/C/R4GlG4Kgu4d2j8=; b=VZJa9yr6rmrbFWTY
	jkihApjPB49cJJk5FW7LGKhpiWIi+deLiNSYs1kIz4vjiA6/N8jx3+5Kstnv/apO
	Uod6i5/9Azf4p3Z/EKp1DI0M1+5+G4aRU9k7e6whI3uVNS1pmxRXA/Nflh4Ar5Ox
	/EB9RyXVTQJzsEE4D13ZfGo1B9axh+zWaCpJgweouIP65+5DAzOM+EWqq8sfHysX
	JEB9C1zkfuspONJCxSViQMNmlzDgjpjiLhjRR96U7NUiAsg18RrZY1NqLOVGewmF
	n6K3ysWL6LLrDXOq4yMzvJQC9tT31bASsyunpYjeRNXtBcHZdgPfWKlFdUo3UAcK
	bOnw+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0nye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:29:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso4203654485a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616544; x=1773221344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DW5EUg1yaoYe86hPewYMQORzz9/C/R4GlG4Kgu4d2j8=;
        b=XGJEBzdW+PMrRH6RuAizH10hSSJ/VgcYx80rWP6yzYxkq+Ubj7rehYw/UuiLb6juZm
         Us81dzXOZJe12b13ypeb92Apf/wHh5kDcwTblrn7eFr+8+7Hq/zFhP0vfJ4MmqJxkqYt
         7C5zS7GEaRCZqL7N0rizCLv5sPd4BYprG9MmXtJZoQS4xDJpWcPUnyuLvIQ5ymGcsCBa
         KAOTwhRIPPxgMua2GVte4SoPFq76IsCFQ8ESeUr/vGpJA/xlpcPLW169ZXZKit3fcjYK
         X6eYEaujDDTu7GdS9kWJTvXxrzb6ZGyeoUA45TQxMhiQgiKeD6AmGXHsjFoQXYkBE7ZH
         MK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616544; x=1773221344;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW5EUg1yaoYe86hPewYMQORzz9/C/R4GlG4Kgu4d2j8=;
        b=qx5DIR5/alb4HIl1PcWP9CmkUxsWryNHOejNCvi/YNVb8KkkZHLrPfxgwCYk+duD1o
         vMzsL6m2tWnfbCWd8iCIWxlR7HdB0d6yf+bTPPPwsFvcGSae/fbLJmInEQGIs+Q4Q7rA
         o8YPoYoJmmheYhhQkBtjMjGh6ivJ0EOBqr8FsIgzvXf0vLdlj0zMCFWQhqJqPPDozXHl
         6j1PBFZyhtzD8N0ITPzns/7g+V0OVA0onvGzs7zHSGhSrveCFGCEGZo8qdA4fbR3DqXY
         /mSB6fbi3juWWoqSvF5sWnPP7Ht/4voOvAbzAiOFKhnE/CsneHWyTWS5yEBHujJ0VLsS
         mDZA==
X-Forwarded-Encrypted: i=1; AJvYcCVRTHX8hGFEJcfnfzkK2O+9nZfLlF0z1JY1AMUZS0DSEJtipxQ3dD/CCvgZAKq6h36D9fp+wNpz+Va5Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/643SqR9H4jkCwEQBhLniyYs/73Y/dabNLmld3iX6fapQKZz
	gzDwoHyJzyL5+Slv+bVSZN45z28lkUHM6LimBf1eTs3dldTv7kba0rYVYWXpdxpaU/NSNdEaPr9
	uaVnBsF6yxeXETgTweMbpVpVEOuzZiah6Okbhq9+pIdW5DD3Tbf+YaKYdJrf+7eJsD/2dTOPzgg
	==
X-Gm-Gg: ATEYQzyhoGA7ENbAevVXIIJ26hL+HygpVkq/YzFbTzhp6ESZNd87dEYbNUuGhzle1fh
	g1lpsnk8Pvn+A6coIQZanKI+TKNEf9HweRQYLneeLAaHsZ/0IsF7elAilsKXB3h5gkKXyrIC+SW
	zkyX+K9nQ8z8oBRq8fxNyS0DuAAJ6Y0hi2mhrKzF35pRDlYCj6dsCNhourOk4ht9zW/srzb+kN/
	0Fdbl+9lwqnBIJyoxS//sy31kjsL1BMje5EJwqOV5pv14OZ8x5QxVcX+Ge9aJK+F6P4HbO8CTrN
	RRuuK2cw7yo1zvxTEilHRJmYllDNjMplRuqnEYgpvf7SkM7dO4wdhFDLTWZ7QxUa16T0Ke/0B4z
	AxiZBxpM8/0QLpdljRnSFX1Wb8U6Ea4zr6vw5FH0fC9tmBcMk5QFqeOSllA6n41dDg9hYGlfUJu
	DkqLnSNRKTZPBTt9nti6Q+NYo3YsDy9AASaIctl1P3ueGpx3XGJQsONHHpXOLLylM7fFxbKLCma
	57Pe+AK2o54wgf0
X-Received: by 2002:a05:620a:470c:b0:85e:b7b6:81e2 with SMTP id af79cd13be357-8cd5af818c4mr135783185a.50.1772616544408;
        Wed, 04 Mar 2026 01:29:04 -0800 (PST)
X-Received: by 2002:a05:620a:470c:b0:85e:b7b6:81e2 with SMTP id af79cd13be357-8cd5af818c4mr135781385a.50.1772616543833;
        Wed, 04 Mar 2026 01:29:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab123e8sm713717466b.4.2026.03.04.01.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:29:03 -0800 (PST)
Message-ID: <0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:29:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
To: Sakari Ailus <sakari.ailus@iki.fi>, Arun T <arun.t@intel.com>
Cc: mehdi.djait@linux.intel.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-2-arun.t@intel.com>
 <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
In-Reply-To: <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MSBTYWx0ZWRfX5tMMs+a03nWm
 ARl18RoI4VU0alAAWYsaA3bL+k2zHIoAKQKsTv3OtYneuqGoCiWUuZUrfDXDMKt+osyuOglHaM0
 BN+lU6vyt1WUr/hLYLwy6+3z+M2cR8WdqGLGGo2IDcZ2uKcOp6T+mCl3QF1NVtwGax3SUJh4Vmb
 VR07l5ilIXSak5r6Gr5fFL9hfteZMJydXmp6n2zJeFBHxFTW5RF8/rIWWS0C572GLKbrY1BQw/4
 mtvlvnsHO0dCaIUBC3tc0t0cqZlMKtJ9tuCrcYykI5ggwwI4DSrTc4qX2AOWR7ACI/RRbgEPcj6
 hwJlz0jUSEfq/yBsGyretOrkINHdosgcSAYbMfXY39V6gBPRalBoYsnzBU2dJBwbRFTCNwAYMRO
 uwY6ZRBrXn4K2PvAHnx+YmdN4mHZrndeLS8Jr5ayWbyibjsBID98ZYvVAqi7bywi/o/B+ZUkkTz
 s1bo1FQai0Zl+ItbYAw==
X-Proofpoint-GUID: 5vX27IFbfWpkzuZRCowA2siWAiyfrIwk
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7fb61 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=htL7Jlt0GR6tHhuy9c8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5vX27IFbfWpkzuZRCowA2siWAiyfrIwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040071
X-Rspamd-Queue-Id: 9EF5A1FD92E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54448-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi,

On 1-Mar-26 15:37, Sakari Ailus wrote:
> Hi Arun,
> 
> Thanks for the update. Please avoid using --in-reply-to argument for git
> send-email when sending a new version of the patchset on the next time.
> 
> Could you cc me to my @linux.intel.com address on the next time?
> 
> Also cc other maintainers, see what
> 
> 	$ scripts/get_maintainer.pl drivers/platform/x86/intel/int3472/
> 
> prints.
> 
> On Fri, Feb 27, 2026 at 07:05:41PM +0530, Arun T wrote:
>> The Intel Nvl O13b10 sensor with the Intel IPU8 ISP.
>> The sensor is powered by a TPS68470 PMIC, and so we
>> need some board data to describe how to configure the GPIOs and
>> regulators to run the sensor.
> 
> This can be rewrapped and fits to three lines; also see
> Documentation/process/submitting-patches.rst . Most editors can do that
> without too much manual work.
> 
>>
>> Signed-off-by: Arun T <arun.t@intel.com>
>> ---
>>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>>  1 file changed, 150 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> index 71357a036292..71dc0940a94b 100644
>> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>>  };
>>  
>> +/* Settings for Intel NVL platform */
>> +
>> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
>> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
>> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
>> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
>> +};
> 
> That's a lot of regulators. The sensor driver appears to use only three,
> even after the second patch.

Also the names still do not match up with the sensor driver, the sensor
driver (after patch 2/2) has:

	"dovdd",        /* Digital I/O power */
	"avdd",         /* Analog power */
	"dvdd",         /* Digital core power */

Where as above there is no "avdd" only "vdda" and "ana" which are
both candidates to actually be "avdd" I guess you want to change
the "ana" one but please double check.

Note all other regulator_consumer_supply maps except for
the 3 actually used by the sensor-driver are *wrong* and should
be dropped.

Even if there is a VCM, then the second part of the mapping
to "i2c-OVTI13B1:00" is wrong. The "i2c-OVTI13B1:00" consumer
will only consume "dovdd", "avdd" and "dvdd" supplies so
for that consumer there should only be those 3 maps.

Regards,

Hans




> 
> Is there a VCM there, for instance?
> 
>> +
>>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>>  	.constraints = {
>>  		.min_uV = 1200000,
>> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>>  	.consumer_supplies = int3479_aux2_consumer_supplies,
>>  };
>>  
>> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1200000,
>> +		.max_uV = 1200000,
>> +		.apply_uV = true,
>> +		.always_on = true,
> 
> Setting always_on to true shouldn't be necessary here.
> 
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
>> +	.consumer_supplies = int3472_core_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 2815200,
>> +		.max_uV = 2815200,
>> +		.apply_uV = true,
>> +		.always_on = true,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
>> +	.consumer_supplies = int3472_ana_consumer_supplies,
>> +};
>> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 2815200,
>> +		.max_uV = 2815200,
>> +		.apply_uV = true,
>> +		.always_on = true,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
>> +	.consumer_supplies = int3472_vcm_consumer_supplies,
>> +};
>> +
>> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */
>> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1800600,
>> +		.max_uV = 1800600,
>> +		.apply_uV = true,
>> +		.always_on = true,
>> +	},
>> +};
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1800600,
>> +		.max_uV = 1800600,
>> +		.apply_uV = true,
>> +		.always_on = true,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
>> +	.consumer_supplies = int3472_vsio_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 2815200,
>> +		.max_uV = 2815200,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
>> +	.consumer_supplies = int3472_aux1_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
>> +	.constraints = {
>> +		.min_uV = 1800600,
>> +		.max_uV = 1800600,
>> +		.apply_uV = 1,
>> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +	},
>> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
>> +	.consumer_supplies = int3472_aux2_consumer_supplies,
>> +};
>> +
>> +
>>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>>  	.reg_init_data = {
>>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
>> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>>  	},
>>  };
>>  
>> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
>> +	.reg_init_data = {
>> +		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
>> +		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
>> +		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
>> +		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
>> +		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
>> +		[TPS68470_AUX1] = &intel_nvl_tps68470_aux1_reg_init_data,
>> +		[TPS68470_AUX2] = &intel_nvl_tps68470_aux2_reg_init_data,
>> +	},
>> +};
>> +
>>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>>  	.dev_id = "i2c-INT347A:00",
>>  	.table = {
>> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>>  	}
>>  };
>>  
>> +static struct gpiod_lookup_table intel_nvl_int347a_gpios = {
>> +	.dev_id = "i2c-OVTI13B1:01",
>> +	.table = {
>> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
>> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
>> +		{ }
>> +	}
>> +};
>> +
>> +static struct gpiod_lookup_table intel_nvl_int347e_gpios = {
>> +	.dev_id = "i2c-OVTI13B1:01",
>> +	.table = {
>> +	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
>> +		{ }
>> +	}
>> +};
>> +
>>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>>  	.dev_name = "i2c-INT3472:05",
>>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
>> @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>>  	},
>>  };
>>  
>> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
>> +	.dev_name = "i2c-INT3472:04",
>> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
>> +	.n_gpiod_lookups = 2,
>> +	.tps68470_gpio_lookup_tables = {
>> +		&intel_nvl_int347a_gpios,
>> +		&intel_nvl_int347e_gpios,
>> +	},
>> +};
>> +
>>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>>  	{
>>  		.matches = {
>> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>>  		},
>>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>>  	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
>> +		},
>> +	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
>> +	},
>>  	{ }
>>  };
>>  
> 


