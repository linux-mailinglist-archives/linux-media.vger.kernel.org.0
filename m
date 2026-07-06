Return-Path: <linux-media+bounces-66764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KQ8fOgbES2qyZwEAu9opvQ
	(envelope-from <linux-media+bounces-66764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:04:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066F71259A
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:04:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BvcmKcLw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fEUBL4vk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66764-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66764-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 941EF32A4518
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FF629D268;
	Mon,  6 Jul 2026 13:35:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4871D36F912
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:35:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344955; cv=none; b=EJvyEVXeC2Q8+LsiWx7VCy6RXkPd1ne6Y5VpyiKIO/qFdzAdfnKo6p/eZe1mKyTV1kI0+WbmcVsnJZwohyePkcnTKqE7AKI6TBMv70OUTvtLv0znshfOBTPEoHZzYgiLNsFYp04ekVPdv1AQ1jWD1SzvecECpgBwPrTK82Bvs8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344955; c=relaxed/simple;
	bh=7+EcHPsqPKuxMjEbafR7XdJa9NmC/qZ6QB9cB2FI8Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHa01OVZEMcQ3mpYkGjIHNMh9UvN9tM/9wlaCXhWugwYCP5dI98h1bW5jVdv6A26aR0I2zxwrJ1aftx5ZuMzsxBVOvRua0HXjm+p8VVPJygp1YhHx84wsz5ymq/KO50y8JzgPR9vZCTDbisigaMuV/i2ALvm8T3+e4Dj/cqmz6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvcmKcLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEUBL4vk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxUOl219063
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 13:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ORcaahqRgxRIWCKkn4IfYNW8wnvPsQfKV3sYqHDg/R8=; b=BvcmKcLww5opSpNl
	sE6pK20yDHOHIYJ5CJPXyeORTn2+bKWMloXmQdZfr999Fuw+6gTVRzvqU2MhbDSn
	Srz1H7KPjpKCRU9L7OZ3X2huTsLe7Ah1ibh6DctBaQ58BoS0AJ/hp3W9z86hlKoQ
	LBTYUGZ9WaJzAqeQRgsE9AUXMD0jOiDDCuH7UcWIspmXNHAMW45xLTExf4f+cwYA
	/ck1pE8KJj+oNE6jY8VofI37XYpOciQ0lLoMGbri8WME86dl/vipkFt0w2Z/RoAB
	CvidN1IJ6EL1F+Rd6Jk43ST/J04woqhCowQayM3Yi4L+rDmYXOf6r+qJBZwhEAoP
	KukPNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs9amj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 13:35:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e7ee64b25so512106385a.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344951; x=1783949751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORcaahqRgxRIWCKkn4IfYNW8wnvPsQfKV3sYqHDg/R8=;
        b=fEUBL4vkL5/Y+HWIuQJFD5VXuUufogiCAUM0zAJzQ8O0jomxcrqPixH0I1HzeQF1yZ
         xyTCcbLFhHGgnl5d+1bZvfuJqZAQEDm6S/A17/pWxRJfxipXhVb+I9Ov+61jO85X4rby
         C69lr5uhmEfeuThnTg4MHDxE98HprGwPExXbpxeVPGuQW9E1EjxPYGMvVhJsdAS8le4H
         S+RLqTUIugiTujuU0msU7pTF24iSo9G4uoksHe0wdl+HZK1JMDrhyD1NhnwpcjQNNZFG
         9JxuGQTVu4znEQEkzOLcGLU39bU2coE8I2/SGYs9NDTl8As9/Wtr5D7EZbAcNCivNs+K
         sWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344951; x=1783949751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORcaahqRgxRIWCKkn4IfYNW8wnvPsQfKV3sYqHDg/R8=;
        b=cwlWL+ZUQ6hfq5lQuakdJzs4xBhPfew236UDpmnv94tFIU2i8nK4yv3rp1uCtVerst
         +RvOGA4ANvXGcSQCPizuohIPZFMp/HGVa5mZ55pJ5Bx9aPEE9A1UUplmtfMrWOj+ItKD
         pcQwoWO84f9ylBtkD5iODxata5gJ44QmJQ5WoFs43ugHI6DCvzuFibSEKUIkfHSz4N5z
         Mn29Q+mv34g/1eidUC3pzTZujVk+f5Fb9QlnJvpvTLRWTwwHWLMDf31lsqD9Wpe8GbTx
         70CJ7/flup1zCaIRF76adbLJEhIedtPQgHJm6goX/Ngq5EenAXLDk9N2UGm2XWC8Bdsq
         tFdQ==
X-Gm-Message-State: AOJu0YysUanEkxAhAhCjFe2ymeEBTzqqGpASjRRnfwxesoQ9pRmhibqe
	WSKD12OVT/lQLhms1TZbWgJjHHkiGvFiOSaUfprZJTUJ+AGHroHxmnuY748f1I5TEY2qE1cze+N
	aB54wS6UrQHcdVQZaCTggKJ8MiDytu4UUObr4m8ZjbHS1MlkITsqAj9/AsyKdjNRK6A==
X-Gm-Gg: AfdE7cnOpdubZ4wEOK7H3ckkwEMHGdWUz1tqEoyqP9AF1HChqe/dUPPd9W/vccUdFVG
	VbbJXvPad+ziRNac0oh9jBUmlIU6hg61g3UkyuQASygCpmIGmwRDezcWl2PniCnJlcY7V66SYY7
	eTeADzOCfSe27w2Pu6QB+1oOBs2z8ji6O1dA4hQbDvkM5Qwl2nyN7RLVRhq58oc7IcTZHxb4CQG
	oUbYEIvZB9qcjVxFmDnz/Pku8AMQ+UQtPPy1nuXqpUA5osNij7WbX66PN4S98QrTM9i+qCEuLyb
	w4+1joXxZtynCpvPi5Kf5JFSl/6ddVvpGgWThSnXdkU8o4PGMCYvLjAJ/5oPnqm+rmhZMYwL1Lk
	OwDDestCmyo/coYPaIFeMNsj/hZJFUOQVKLLOkOYz/h2Gv5Ol5+NCwvDNTAS20RvknNATFT17
X-Received: by 2002:a05:620a:7004:b0:92b:6805:9181 with SMTP id af79cd13be357-92ebb72fb12mr69240685a.73.1783344951177;
        Mon, 06 Jul 2026 06:35:51 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:92b:6805:9181 with SMTP id af79cd13be357-92ebb72fb12mr69223685a.73.1783344949133;
        Mon, 06 Jul 2026 06:35:49 -0700 (PDT)
Received: from [10.38.242.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90c92634sm937881485a.27.2026.07.06.06.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:35:48 -0700 (PDT)
Message-ID: <73962ea3-3440-41ca-ad69-ecfed0ae9edb@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 21:35:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-3-0071442caa2a@oss.qualcomm.com>
 <1cb443d2-e4a7-4756-a6aa-af5c34ca7d51@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <1cb443d2-e4a7-4756-a6aa-af5c34ca7d51@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ChGHMgoDowM7eVGJiP5DhldtDAfkAI3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzOCBTYWx0ZWRfX25WuNKTRvtSV
 mQxTz6zzDxNyvuUAsMiIWi4QrZpfAp1v0sSX1U6DSJvpqF3ulZWdZOuMHWg9Vdqzafwu+uwZwyz
 whUtsKwHSFhWhuQJuPp9TungOXmhGB30n6/ug8D8I9ZJ+B85u4cEfDaqwaEtjeLKJZ2moBcTBEe
 DyJ0ynXKkRWl/wydn0+CSEziEfGtCp1cyjN+XuVZ8LT1l6nc5t82zKB6FkBjPyqmfJuQg8Vz/4O
 Y9SAYnn4ZeZPs/EB7OcmT2gvQGsxqxp658SkPD4Nl7d1tVr/gaZYGr3Nxomtlgp2dlG6Kt40eTG
 94T8Zb0juj0CSerMjqplZxWF34gCPwVt26zUgZCkic9GVQJEdN4aEb0UwV9BbGCuY6HRKNCuQTR
 hDnFWB/aokSi+atKbA40YeQWrCckbcgMcEtAFkSLqv+8cNQig8J/ok6MNtIiNRO9pfZJP05Avna
 QxmBN1Fq6fGBi9m/suw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzOCBTYWx0ZWRfX9FJr3z7sqmo7
 TZKBb+gRF19KF1cef6nn2c4qXVFsS16ARAobq3dxymnWDZuqp6TPbkDvN+4X5B1/VdyABGkTB1Q
 mmLbHvqPcBEQ/itYIiJJcL589T8gIL8=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4baf38 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tusJaFQeCDIdJXWls_4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ChGHMgoDowM7eVGJiP5DhldtDAfkAI3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66764-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6066F71259A

Hi Vladimir,

On 7/2/2026 9:16 PM, Vladimir Zapolskiy wrote:
> On 7/2/26 13:52, Wenmeng Liu wrote:
>> The OmniVision OG0VA1B is a monochrome image sensor closely related to
>> the OG0VE1B. It shares the SCCB control interface, power supplies and
>> the single-lane MIPI D-PHY description, and differs in its chip id, the
>> test pattern register, the register programming and the output format
>> (10-bit RAW instead of 8-bit).
>>
>> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
>> its 640x480 60fps register sequence.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 234 ++++++++++++++++++++++++++++++++++ 
>> +++++++++-
>>   1 file changed, 230 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 
>> acc06b10bf896f734926289099a70fbc2bb628d5..f1f4fcd195c4e2dd69f78ba3f01f768a052e6c5d 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -17,8 +17,12 @@
>>   #define OG0VE1B_LINK_FREQ_500MHZ    (500 * HZ_PER_MHZ)
>>   #define OG0VE1B_MCLK_FREQ_24MHZ        (24 * HZ_PER_MHZ)
>> +#define OG0VA1B_LINK_FREQ_480MHZ    (480 * HZ_PER_MHZ)
>> +#define OG0VA1B_MCLK_FREQ_19_2MHZ    (19200 * HZ_PER_KHZ)
>> +
>>   #define OG0VE1B_REG_CHIP_ID        CCI_REG24(0x300a)
>>   #define OG0VE1B_CHIP_ID            0xc75645
>> +#define OG0VA1B_CHIP_ID            0xc75641
> 
> Please keep the list alphabetically sorted, also it's fine if
> "OG0VE1B_REG_CHIP_ID" is reduced to "OG0V_REG_CHIP_ID".
> 

ACK.

>>   #define OG0VE1B_REG_MODE_SELECT        CCI_REG8(0x0100)
>>   #define OG0VE1B_MODE_STANDBY        0x00
>> @@ -45,8 +49,9 @@
>>   #define OG0VE1B_REG_VTS            CCI_REG16(0x380e)
>>   #define OG0VE1B_VTS_MAX            0xffff
>> -/* Test pattern */
>> +/* Test pattern - OG0VE1B uses 0x5e00, OG0VA1B uses 0x5100 */
>>   #define OG0VE1B_REG_PRE_ISP        CCI_REG8(0x5e00)
>> +#define OG0VA1B_REG_TEST_PATTERN    CCI_REG8(0x5100)
>>   #define OG0VE1B_TEST_PATTERN_ENABLE    BIT(7)
>>   #define to_og0ve1b(_sd)            container_of(_sd, struct og0ve1b, 
>> sd)
>> @@ -55,6 +60,10 @@ static const s64 og0ve1b_link_freq_menu[] = {
>>       OG0VE1B_LINK_FREQ_500MHZ,
>>   };
>> +static const s64 og0va1b_link_freq_menu[] = {
>> +    OG0VA1B_LINK_FREQ_480MHZ,
>> +};
>> +
>>   struct og0ve1b_reg_list {
>>       const struct cci_reg_sequence *regs;
>>       unsigned int num_regs;
>> @@ -72,9 +81,14 @@ struct og0ve1b_mode {
>>   };
>>   struct og0ve1b_sensor_data {
>> +    const char *name;
>>       u64 chip_id;
>>       unsigned long mclk_freq;
>>       u32 test_pattern_reg;
>> +    /* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole 
>> lines (0). */
>> +    unsigned int exposure_shift;
>> +    /* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B 
>> keeps 1. */
>> +    unsigned int pixel_rate_mul;
>>       const s64 *link_freq_menu;
>>       int num_link_freqs;
>>       const struct og0ve1b_mode *modes;
>> @@ -272,16 +286,223 @@ static const struct og0ve1b_mode 
>> supported_modes[] = {
>>       },
>>   };
>> +static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
>> +    { CCI_REG8(0x0302), 0x31 },
>> +    { CCI_REG8(0x0303), 0x02 },
>> +    { CCI_REG8(0x0304), 0x01 },
>> +    { CCI_REG8(0x0305), 0x90 },
>> +    { CCI_REG8(0x0306), 0x00 },
>> +    { CCI_REG8(0x0323), 0x02 },
>> +    { CCI_REG8(0x0325), 0x68 },
>> +    { CCI_REG8(0x0326), 0xd8 },
>> +    { CCI_REG8(0x3006), 0x0e },
>> +    { CCI_REG8(0x300d), 0x08 },
>> +    { CCI_REG8(0x3018), 0xf0 },
>> +    { CCI_REG8(0x301c), 0xf0 },
>> +    { CCI_REG8(0x3020), 0x20 },
>> +    { CCI_REG8(0x3040), 0x0f },
>> +    { CCI_REG8(0x3022), 0x01 },
>> +    { CCI_REG8(0x3107), 0x40 },
>> +    { CCI_REG8(0x3216), 0x01 },
>> +    { CCI_REG8(0x3217), 0x00 },
>> +    { CCI_REG8(0x3218), 0xc0 },
>> +    { CCI_REG8(0x3219), 0x55 },
>> +    { CCI_REG8(0x3506), 0x01 },
>> +    { CCI_REG8(0x3507), 0x50 },
>> +    { CCI_REG8(0x3508), 0x01 },
>> +    { CCI_REG8(0x3509), 0x00 },
>> +    { CCI_REG8(0x350a), 0x01 },
>> +    { CCI_REG8(0x350b), 0x00 },
>> +    { CCI_REG8(0x350c), 0x00 },
>> +    { CCI_REG8(0x3541), 0x00 },
>> +    { CCI_REG8(0x3542), 0x40 },
>> +    { CCI_REG8(0x3605), 0x90 },
>> +    { CCI_REG8(0x3606), 0x41 },
>> +    { CCI_REG8(0x3612), 0x00 },
>> +    { CCI_REG8(0x3620), 0x08 },
>> +    { CCI_REG8(0x3630), 0x17 },
>> +    { CCI_REG8(0x3631), 0x99 },
>> +    { CCI_REG8(0x3639), 0x88 },
>> +    { CCI_REG8(0x3668), 0x00 },
>> +    { CCI_REG8(0x3674), 0x00 },
>> +    { CCI_REG8(0x3677), 0x3f },
>> +    { CCI_REG8(0x368f), 0x06 },
>> +    { CCI_REG8(0x36a2), 0x19 },
>> +    { CCI_REG8(0x36a4), 0xf1 },
>> +    { CCI_REG8(0x36a5), 0x2d },
>> +    { CCI_REG8(0x3706), 0x30 },
>> +    { CCI_REG8(0x370d), 0x72 },
>> +    { CCI_REG8(0x3713), 0x86 },
>> +    { CCI_REG8(0x3715), 0x03 },
>> +    { CCI_REG8(0x3716), 0x00 },
>> +    { CCI_REG8(0x376d), 0x24 },
>> +    { CCI_REG8(0x3770), 0x3a },
>> +    { CCI_REG8(0x3778), 0x00 },
>> +    { CCI_REG8(0x37a8), 0x03 },
>> +    { CCI_REG8(0x37a9), 0x00 },
>> +    { CCI_REG8(0x37df), 0x7d },
>> +    { CCI_REG8(0x3800), 0x00 },
>> +    { CCI_REG8(0x3801), 0x00 },
>> +    { CCI_REG8(0x3802), 0x00 },
>> +    { CCI_REG8(0x3803), 0x00 },
>> +    { CCI_REG8(0x3804), 0x02 },
>> +    { CCI_REG8(0x3805), 0x8f },
>> +    { CCI_REG8(0x3806), 0x01 },
>> +    { CCI_REG8(0x3807), 0xef },
>> +    { CCI_REG8(0x3808), 0x02 },
>> +    { CCI_REG8(0x3809), 0x80 },
>> +    { CCI_REG8(0x380a), 0x01 },
>> +    { CCI_REG8(0x380b), 0xe0 },
>> +    { CCI_REG8(0x380c), 0x01 },
>> +    { CCI_REG8(0x380d), 0x78 },
>> +    { CCI_REG8(0x380e), 0x08 },
>> +    { CCI_REG8(0x380f), 0x30 },
>> +    { CCI_REG8(0x3810), 0x00 },
>> +    { CCI_REG8(0x3811), 0x08 },
>> +    { CCI_REG8(0x3812), 0x00 },
>> +    { CCI_REG8(0x3813), 0x08 },
>> +    { CCI_REG8(0x3814), 0x11 },
>> +    { CCI_REG8(0x3815), 0x11 },
>> +    { CCI_REG8(0x3816), 0x00 },
>> +    { CCI_REG8(0x3817), 0x01 },
>> +    { CCI_REG8(0x3818), 0x00 },
>> +    { CCI_REG8(0x3819), 0x05 },
>> +    { CCI_REG8(0x3820), 0x40 },
>> +    { CCI_REG8(0x3821), 0x04 },
>> +    { CCI_REG8(0x3823), 0x00 },
>> +    { CCI_REG8(0x3826), 0x00 },
>> +    { CCI_REG8(0x3827), 0x00 },
>> +    { CCI_REG8(0x382b), 0x52 },
>> +    { CCI_REG8(0x384a), 0xa2 },
>> +    { CCI_REG8(0x3858), 0x00 },
>> +    { CCI_REG8(0x3859), 0x00 },
>> +    { CCI_REG8(0x3860), 0x00 },
>> +    { CCI_REG8(0x3861), 0x00 },
>> +    { CCI_REG8(0x3866), 0x0c },
>> +    { CCI_REG8(0x3867), 0x07 },
>> +    { CCI_REG8(0x3884), 0x00 },
>> +    { CCI_REG8(0x3885), 0x08 },
>> +    { CCI_REG8(0x3888), 0x50 },
>> +    { CCI_REG8(0x3893), 0x6c },
>> +    { CCI_REG8(0x3898), 0x00 },
>> +    { CCI_REG8(0x389a), 0x04 },
>> +    { CCI_REG8(0x389b), 0x01 },
>> +    { CCI_REG8(0x389c), 0x0b },
>> +    { CCI_REG8(0x389d), 0xdc },
>> +    { CCI_REG8(0x38b1), 0x04 },
>> +    { CCI_REG8(0x38b2), 0x00 },
>> +    { CCI_REG8(0x38b3), 0x08 },
>> +    { CCI_REG8(0x38c1), 0x46 },
>> +    { CCI_REG8(0x38c9), 0x02 },
>> +    { CCI_REG8(0x38d4), 0x06 },
>> +    { CCI_REG8(0x38d5), 0x5a },
>> +    { CCI_REG8(0x38d6), 0x08 },
>> +    { CCI_REG8(0x38d7), 0x3a },
>> +    { CCI_REG8(0x391f), 0x00 },
>> +    { CCI_REG8(0x3920), 0xaa },
>> +    { CCI_REG8(0x3921), 0x00 },
>> +    { CCI_REG8(0x3922), 0x00 },
>> +    { CCI_REG8(0x3923), 0x00 },
>> +    { CCI_REG8(0x3924), 0x00 },
>> +    { CCI_REG8(0x3925), 0x00 },
>> +    { CCI_REG8(0x3926), 0x00 },
>> +    { CCI_REG8(0x3927), 0x00 },
>> +    { CCI_REG8(0x3928), 0x10 },
>> +    { CCI_REG8(0x3929), 0x01 },
>> +    { CCI_REG8(0x392a), 0xb4 },
>> +    { CCI_REG8(0x392b), 0x00 },
>> +    { CCI_REG8(0x392c), 0x10 },
>> +    { CCI_REG8(0x392d), 0x01 },
>> +    { CCI_REG8(0x392e), 0x78 },
>> +    { CCI_REG8(0x392f), 0x4a },
>> +    { CCI_REG8(0x391e), 0x01 },
>> +    { CCI_REG8(0x389f), 0x08 },
>> +    { CCI_REG8(0x38a0), 0x00 },
>> +    { CCI_REG8(0x38a1), 0x00 },
>> +    { CCI_REG8(0x3a06), 0x06 },
>> +    { CCI_REG8(0x3a07), 0x78 },
>> +    { CCI_REG8(0x3a08), 0x08 },
>> +    { CCI_REG8(0x3a09), 0x80 },
>> +    { CCI_REG8(0x3a52), 0x00 },
>> +    { CCI_REG8(0x3a53), 0x01 },
>> +    { CCI_REG8(0x3a54), 0x0c },
>> +    { CCI_REG8(0x3a55), 0x04 },
>> +    { CCI_REG8(0x3a58), 0x0c },
>> +    { CCI_REG8(0x3a59), 0x04 },
>> +    { CCI_REG8(0x4000), 0xcf },
>> +    { CCI_REG8(0x4003), 0x40 },
>> +    { CCI_REG8(0x4008), 0x04 },
>> +    { CCI_REG8(0x4009), 0x13 },
>> +    { CCI_REG8(0x400a), 0x02 },
>> +    { CCI_REG8(0x400b), 0x34 },
>> +    { CCI_REG8(0x4010), 0x71 },
>> +    { CCI_REG8(0x4042), 0xc3 },
>> +    { CCI_REG8(0x4306), 0x04 },
>> +    { CCI_REG8(0x4307), 0x12 },
>> +    { CCI_REG8(0x4500), 0x70 },
>> +    { CCI_REG8(0x4509), 0x00 },
>> +    { CCI_REG8(0x450b), 0x83 },
>> +    { CCI_REG8(0x4604), 0x68 },
>> +    { CCI_REG8(0x481b), 0x44 },
>> +    { CCI_REG8(0x481f), 0x30 },
>> +    { CCI_REG8(0x4823), 0x44 },
>> +    { CCI_REG8(0x4825), 0x35 },
>> +    { CCI_REG8(0x4837), 0x11 },
>> +    { CCI_REG8(0x4f00), 0x04 },
>> +    { CCI_REG8(0x4f10), 0x04 },
>> +    { CCI_REG8(0x4f21), 0x01 },
>> +    { CCI_REG8(0x4f22), 0x00 },
>> +    { CCI_REG8(0x4f23), 0x54 },
>> +    { CCI_REG8(0x4f24), 0x51 },
>> +    { CCI_REG8(0x4f25), 0x41 },
>> +    { CCI_REG8(0x5000), 0x3f },
>> +    { CCI_REG8(0x5001), 0x80 },
>> +    { CCI_REG8(0x500a), 0x00 },
>> +    { CCI_REG8(0x5100), 0x00 },
>> +    { CCI_REG8(0x5111), 0x20 },
>> +};
>> +
>> +static const struct og0ve1b_mode og0va1b_supported_modes[] = {
>> +    {
>> +        .width = 640,
>> +        .height = 480,
>> +        .hts = 752,
>> +        .vts = 2096,
>> +        .bpp = 10,
>> +        .code = MEDIA_BUS_FMT_Y10_1X10,
>> +        .reg_list = {
>> +            .regs = og0va1b_640x480_60fps_mode,
>> +            .num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
>> +        },
>> +    },
>> +};
>> +
>>   static const struct og0ve1b_sensor_data og0ve1b_data = {
>> +    .name        = "og0ve1b",
>>       .chip_id    = OG0VE1B_CHIP_ID,
>>       .mclk_freq    = OG0VE1B_MCLK_FREQ_24MHZ,
>>       .test_pattern_reg = OG0VE1B_REG_PRE_ISP,
>> +    .exposure_shift    = 4,
>> +    .pixel_rate_mul    = 1,
>>       .link_freq_menu    = og0ve1b_link_freq_menu,
>>       .num_link_freqs    = ARRAY_SIZE(og0ve1b_link_freq_menu),
>>       .modes        = supported_modes,
>>       .num_modes    = ARRAY_SIZE(supported_modes),
> 
> Can you please rename "supported_modes" to "og0ve1b_supported_modes"?
> Likely it should be done in 2/3 change, but it's up to you.
> 

ACK.

>>   };
>> +static const struct og0ve1b_sensor_data og0va1b_data = {
>> +    .name        = "og0va1b",
>> +    .chip_id    = OG0VA1B_CHIP_ID,
>> +    .mclk_freq    = OG0VA1B_MCLK_FREQ_19_2MHZ,
>> +    .test_pattern_reg = OG0VA1B_REG_TEST_PATTERN,
>> +    .exposure_shift    = 0,
>> +    .pixel_rate_mul    = 2,
>> +    .link_freq_menu    = og0va1b_link_freq_menu,
>> +    .num_link_freqs    = ARRAY_SIZE(og0va1b_link_freq_menu),
>> +    .modes        = og0va1b_supported_modes,
>> +    .num_modes    = ARRAY_SIZE(og0va1b_supported_modes),
>> +};
> 
> First og0va1b_data, then og0ve1b_data declaration to keep the natural 
> order.
> 

ACK.

>> +
>>   static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 
>> pattern)
>>   {
>>       u32 reg = og0ve1b->sensor->test_pattern_reg;
>> @@ -334,7 +555,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>>           break;
>>       case V4L2_CID_EXPOSURE:
>>           ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
>> -                ctrl->val << 4, NULL);
>> +                ctrl->val << og0ve1b->sensor->exposure_shift,
>> +                NULL);
>>           break;
>>       case V4L2_CID_VBLANK:
>>           ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
>> @@ -376,7 +598,8 @@ static int og0ve1b_init_controls(struct og0ve1b 
>> *og0ve1b)
>>       if (ctrl)
>>           ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> -    pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
>> +    pixel_rate = sensor->link_freq_menu[0] * sensor->pixel_rate_mul /
>> +             mode->bpp;
>>       v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, 
>> V4L2_CID_PIXEL_RATE,
>>                 0, pixel_rate, 1, pixel_rate);
>> @@ -721,6 +944,8 @@ static int og0ve1b_probe(struct i2c_client *client)
>>           return -ENODEV;
>>       v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>> +    v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
>> +                 og0ve1b->sensor->name, NULL);
>>       og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
>>       if (IS_ERR(og0ve1b->regmap))
>> @@ -853,6 +1078,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>>   static const struct of_device_id og0ve1b_of_match[] = {
>>       { .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>> +    { .compatible = "ovti,og0va1b", .data = &og0va1b_data },
>>       { /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
>> @@ -870,5 +1096,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
>>   module_i2c_driver(og0ve1b_i2c_driver);
>>   MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
>> -MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
>> +MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
>>   MODULE_LICENSE("GPL");
>>
> 
> Looks good, thank you!
> 


Will fix it all in next version.

Thanks,
Wenmeng


