Return-Path: <linux-media+bounces-67100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4guSAIs2T2rpcAIAu9opvQ
	(envelope-from <linux-media+bounces-67100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:50:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BB72CE34
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cozis1wM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iXOFa1az;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67100-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67100-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FFCD301A170
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 05:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1DB3A872D;
	Thu,  9 Jul 2026 05:49:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734C3A7858
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 05:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576198; cv=none; b=J8XVSC6D2am+Iho711ddg5d1a0GjpcLlIrhOkN2T+1XbZMplK+LkQkXTOSQBfUrk+L8wZsKR/9IbhTRa9PxFN/CqXM7d+tg+0TM4Jy1kf1wOBgitOPeaqrKTkMm+r/PWqjkUcJuR0inZizzAfkXTs0/8e96CeJ9Zxvrmg2vxbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576198; c=relaxed/simple;
	bh=3N7yfM3uQ1okr5kka4rpaQGPCFucS7dK3w5eGF5hkEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tddBrTEmbD/OmKFloHAm+a8P6nZO9NGg+J3xMUCRGmZutjMXR94krCzQDh72CWPr/hwgdyI//n8gd3lyb81kwHxkjo3ZzOqzmjQTMosAW0ixl3L3DEJT5fpeT1HNl2rzlhqpSvKDcFWY3deLKpLnBjut/IijMRI7X3JFwr54+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cozis1wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXOFa1az; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66953sfS589207
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 05:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NALSQ0Dw5Lbqt1NCbiSIryndvAMq6kLYEDbo/CY7xs=; b=cozis1wMS8L2FUgx
	cepcsHXh0axn8p70eC4gXcGvnSVEzEUff/y8/Ky99iBpGK8p90colMWMc2PFfBL0
	tvB6OhzqP1YGXGkh5yaY2umWomva21QRb1TxbT0eIG5ZutGQjMCDKVzGqMKqHUwo
	c0CIFphtqLF9FJj1NgD7XUGojKvPouvnGHRDybeg5YtPhWPS2rMJiU3+xaMOeKSi
	7mAmIr2+1T07vW+v7vQeL+3wgoEXHnL0g/K38b8F9nEMObXIA0MLyvByT9fryZay
	TRKvrdY6auPqCuphQxKQD0YJUYbl9hoOjnoYn7nrtwGIzuoe5A50Gc6PcoMt/XkD
	9LcEwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vg50w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:49:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so990616a91.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783576195; x=1784180995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NALSQ0Dw5Lbqt1NCbiSIryndvAMq6kLYEDbo/CY7xs=;
        b=iXOFa1azc4G9UT5elS8z9t4dVStefaMGGxJRUlc2CgE3O3v7PNmmzka3SUsrPMrNOA
         0XbKBXHOG9xvG0Szbw3Y0jNlMxIGjouHg0DEnDo9WGda/CtxDVNc5jGUFq+6Ui6asOrR
         vmGHO6EaHFYJm2kaW6Hou8ON135MzFdGIFOXWugNHBU6N5ykH+IrG2++36whsJ7ewjLz
         QH6MMUMK5l2yFOO9LQPU0OyjFhw+1rrmM4bWQiNsBV+keUU+ZfHqEcoQWBcm5MUk0fRY
         J2+QMz6mHhJpN5A0VHiyguYteBkaDk17aN92+8dpE4r07tMmTEuuejgxkf1mPt0DD7iS
         jO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783576195; x=1784180995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NALSQ0Dw5Lbqt1NCbiSIryndvAMq6kLYEDbo/CY7xs=;
        b=b7xiQss81RrY/mWazrzXpcPCXH7IA/EFUZX5J58QxaE6YngTmW/Mv2NiXEEZviKSmU
         R4WrqiWAc9pCHaJogc1MD2WM+NBf4kFNKT5+EFU9lb13r7IhaGLD9Chv0qDLz8Bk8bbK
         jWS7buGNLQNNE4CoR3FagHX0lbSgi8APXN5oWCHzeDD1qMTFLPJjBINw75/c/tepUoOn
         t5Vq0fq4su+ADCcWKHO6NO0GiHbJxRD0oyvBy8t9502JAAIrYjnOWF/waFhiKUhFNGMK
         G2S+OGmjOhdaR8mE5q0+R7VURmHt4daWkg31gMS+53mE19LLDAdDMemct7hEr4qRTgiT
         h0kQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Oe8f+mhAa37guH7ZmWYq6ChpfmZRhTcWKJyw4dhaD8ftBge/pgVGtGjEoovvV5csOz+pg3uaMsYTBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3sLiBxTZLAqLLgMoBZWnK987l6bHc94WkQKglIPI+hdz7/K6v
	xn7dXUDaEJh9ScVLcwDYhyx27VX1zEqemdBUTasPvunqMqNY0tS1vORio0rBYqKIMEQf/T5WYQK
	b8fKyFYlhKk65eF761j85RwY5uc4Fis01iU1Z7X5HBYLv8nCYHycECo+We/oMmatdew==
X-Gm-Gg: AfdE7cnkWvuMPZs0TJflAelPk1z1Me3GnotYvcFmMydSS4BHotz93AXTNb8eyrwR6CK
	Osd24R/dVbHDVfkUkfQgHNyMp8GEq4l+du0kFOS22V0cOWCJzeCoI4Q5BXeHEl4uYMa7WpIJCPf
	CUu/tptw8EQWOvZs+u626Ld6AzMEDIpg9BZPota0Rbk1K8/4fLZHccBjV/DZtG1myR8Szg49vib
	2cAaVebW9EAXYlOryBewTVvlikbfYp8wE2o12vVC5dMX1NmI3dl9Ne1aPtTQjtpwChClUXRqdW1
	USehbWb2e7pYyGwgowgDCnRRRjXGU9l1ztR+s5H37bNBzKLFBPtXAPlH2/tDnleEHDMXlDD4paf
	6/AogYHuQnh6XVX96ULMFG/H9ys5zxHwVyHBty+9d4YsFVT3O9A==
X-Received: by 2002:a17:90b:2c90:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3893d2429bdmr5476208a91.0.1783576195306;
        Wed, 08 Jul 2026 22:49:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2c90:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3893d2429bdmr5476176a91.0.1783576194794;
        Wed, 08 Jul 2026 22:49:54 -0700 (PDT)
Received: from [192.168.31.103] ([152.58.31.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm562981a91.10.2026.07.08.22.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:49:54 -0700 (PDT)
Message-ID: <734537a8-7ece-4d2e-8e72-d090d4788b22@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 11:19:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <81e84294-b438-415d-82ef-a523c4381eb4@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <81e84294-b438-415d-82ef-a523c4381eb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfXyRGWjE8NY/TX
 KrZErLMONFfKQ5qIOnFWB1qE4jxC9wfvGWeTBNQssG3Uk/hb2HB+axXYYZeGaZgpQnJlZgIm4Lt
 NjI87pmikFiYHBbE2DbzHzESw7kWi29TwP76LeDPgEt3CntcQvu+EzJJM2Y/vtOh6WjHgfbN24z
 W2NRDbQ6dJ+wjPliTjh1V1S+uZ82Y9j7t+FqYuaKbGPfpSXYsfThfG4J+/iumWrfNg/4BRBICmv
 l/10w/aRcl0/XEPh6wF+zFmveUMKxtXAv5jF6n07cb3/LC1sgJs1CDGyR94/XwY4E/vNrPpzM1p
 Na5Owje5ASusyxKLWcTFVo40yHb6Ip2sav8YgSkHkhPob3bctLu40q8liIIGkp2eEcWrWOXOMNV
 k06rvBcxX02BWQFay4dumBrREzyzKhcGGwUPvIda0PSm+fmPKIBWbEHzHE3kZe3vxM7qytK4jE9
 /XFUrjhAja/dXwOr/Kg==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f3684 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=9AXozQ6IwN0d4JI31gUtBA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QsZEBUMWvTWtZ6nCauIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MiBTYWx0ZWRfX0hbyK4zGfXn4
 12q8G5sChWrTB8A7fpOb/ewaxSAy6Y6dbbdKc1NTD2ZnIpQp7ZiuVIl+zRQf8hxG6PKtkgqZHtf
 3RhHkB3md5cpxJ2sBctwG26K67PzjZg=
X-Proofpoint-ORIG-GUID: HPBC6KRTuC-eMkiO8nFrYTmvmyUuZNlz
X-Proofpoint-GUID: HPBC6KRTuC-eMkiO8nFrYTmvmyUuZNlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67100-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 672BB72CE34

Thanks Mukesh for the review.

On 7/7/2026 5:37 PM, Mukesh Savaliya wrote:
> 
> 
> On 7/5/2026 7:27 PM, Aniket Randive wrote:
> [...]
> 
>>   static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>>   {
>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>> @@ -471,7 +484,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>       }
>>       cur = gi2c->cur;
>> -    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    time_left = wait_for_completion_timeout(&gi2c->done, 
>> geni_i2c_xfer_timeout(gi2c, len));
> Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an 
> arg ?

Yes. we can add extra variable. I though to avoid extra variable.

>>       if (!time_left)
>>           geni_i2c_abort_xfer(gi2c);
>> @@ -513,7 +526,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>           writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>>       cur = gi2c->cur;
>> -    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    time_left = wait_for_completion_timeout(&gi2c->done, 
>> geni_i2c_xfer_timeout(gi2c, len));
>>       if (!time_left)
>>           geni_i2c_abort_xfer(gi2c);
>> @@ -591,7 +604,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct 
>> geni_i2c_dev *gi2c, struct i2c_
>>    * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message 
>> transfer timeout
>>    * @dev: Pointer to the corresponding dev node
>>    * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
>> - * @transfer_timeout_msecs: Timeout value in milliseconds
>> + * @transfer_timeout_msecs: Per-message completion timeout in jiffies
>>    * @transfer_comp: Completion object of the transfer
>>    *
>>    * This function waits for the completion of each processed transfer 
>> messages
>> @@ -601,7 +614,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct 
>> geni_i2c_dev *gi2c, struct i2c_
>>    */
>>   static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>>                              struct geni_i2c_gpi_multi_desc_xfer 
>> *multi_xfer,
>> -                           u32 transfer_timeout_msecs,
>> +                           unsigned long timeout_jiffies,
>>                              struct completion *transfer_comp)
>>   {
>>       int i;
>> @@ -612,7 +625,7 @@ static int 
>> geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>>           if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
>>               time_left = wait_for_completion_timeout(transfer_comp,
>> -                                transfer_timeout_msecs);
>> +                                timeout_jiffies);
>>               if (!time_left) {
>>                   dev_err(dev, "%s: Transfer timeout\n", __func__);
>>                   return -ETIMEDOUT;
>> @@ -736,8 +749,15 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>           dma_async_issue_pending(gi2c->tx_c);
>>           if ((msg_idx == (gi2c->num_msgs - 1)) || flags & 
>> DMA_PREP_INTERRUPT) {
>> +            size_t max_len = 0;
>> +            int j;
>> +
>> +            for (j = 0; j < gi2c->num_msgs; j++)
>> +                max_len = max_t(size_t, max_len, msgs[j].len);
>> +
>>               ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c- 
>> >se.dev, gi2c_gpi_xfer,
>> -                                      XFER_TIMEOUT, &gi2c->done);
>> +                                      geni_i2c_xfer_timeout(
>> +                                      gi2c, max_len), &gi2c->done);
> Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an 
> arg ?
>>               if (ret) {
>>                   dev_err(gi2c->se.dev,
>>                       "I2C multi write msg transfer timeout: %d\n",
>> @@ -852,7 +872,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>           if (!gi2c->is_tx_multi_desc_xfer) {
>>               dma_async_issue_pending(gi2c->tx_c);
>> -            time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>> +            time_left = wait_for_completion_timeout(&gi2c->done, 
>> geni_i2c_xfer_timeout(
>> +                                gi2c, msgs[i].len));
>>               if (!time_left) {
>>                   dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>>                   gi2c->err = -ETIMEDOUT;
> 


