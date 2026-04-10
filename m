Return-Path: <linux-media+bounces-58534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJBrHyrO2GngiQgAu9opvQ
	(envelope-from <linux-media+bounces-58534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:17:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 281853D58B1
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B44FD30247AF
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FC337B41A;
	Fri, 10 Apr 2026 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWzGM3WQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4pby/NM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888AC35F191
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816210; cv=none; b=EwQENTJy1n/JtoR+QCeVr4ZOKJvQgzlUhDS4jcONzTtUGIrrxkHeMe/2ZnRa/NsMarspkgQOhXgod6pmLEkPweArdNvYt5qlzZAde6ZTYy17r44HkBIg+mHFsvj4CNnCcveFdIAaXnYsZuuVs37DSfSsD3t19GPYd5u259XZavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816210; c=relaxed/simple;
	bh=tK+6dhkESyt0FrN38dVAeRjm5dFErjPyTdH2KYDm+Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8zz2rHHpf9UN0xqQy6dI9UHRe1o0ml4e8ra3I+MTNoNRGYgcLZlTMfYUsRJx0VXbKJCd1tlwlX3shL8yzqhachL6oARHZxWE7Vo+vtlSgJpun6M8CD8Cz4CHpMgtTu9pQrNPEtmPA3dAtJMkPl0X4KAQ88eqPDSQpC1vSq6Ecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWzGM3WQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4pby/NM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8F3913934572
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWLLA9vRgMxLzH+R7T6INqv0GkwFLsTjR10pSbI4x0k=; b=LWzGM3WQFiAU6RJR
	tY+utxEjkSbrUkh+oCfMPUEip3mr5IU5MUs9rvy+Q0Sweo8DjNPzls4lw5jA0vMe
	AV/mfjWUPxuvkuSKqCu1n4NV9f2wWLcABtvwqc8uGeqbmxht7jsb2V3M5QQglWHD
	oiKk8oTKd5hNQLNzL02ZNHytIfs5TF3uzjTGpp3anltCrvaGhbXDH59ofMADu/0D
	wykL2rzD/2ucsx4sGjEsIE69Bv1nDK20oaNRsJ1Tw/nhapoBSmwLkSnhnV7E7IDd
	6ZgwC7caIvvorbU8qrlp/rkjfdh6VFkCsoaHZuvHrsUMOFfe3UN83C+KG2Y+bu9l
	CWw8yQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbmsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 10:16:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d92f8408cso2327487a91.3
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775816205; x=1776421005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWLLA9vRgMxLzH+R7T6INqv0GkwFLsTjR10pSbI4x0k=;
        b=a4pby/NMK5z5KUm77pb1zWdxoZkpsWNPg9TciaMl0qK2KHt+lNnIpKvr5cEEEUMIAF
         6rSq8M55aAEqOMqrRJ5gvX/Qyk8jqP3AmVMwQ6R+ozIxt7aIkXls1YRceWsJFYsbV/jt
         hfUFWgH+PPQjJ/jtVf3FSWLaZN0QJSd7DSDqJyMEcWXflitokc9qhlDleGPFkWkSgVUv
         VBp/KuaVE3t7YX0SpY3Pq8zAvyplnCeVA1nK8fa8SctoaY/Ay/sjITslifmpwfq/JY33
         O9hFtTV+gebGi4btoYB5q+iinXdEmsiN+A20ME0XNvWlL6UlCp7PEXvvWLj8fW2fAr1n
         JOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816205; x=1776421005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWLLA9vRgMxLzH+R7T6INqv0GkwFLsTjR10pSbI4x0k=;
        b=RuTyD7SdtgqI4H0LnsykpueOS96/57oi4GiqvoJFcaN0mNaKM7ExpmgiyYVjTP7PIT
         6o7i5jNI7ZGDATwsCtkBq+AbD/DBBLT05Qh8PJkscsarUbcCJvfhYO4m8Z2Itjzlf6FR
         p1datLmLLvjVdbD7BCy9gP0VgP+lRUeC4In86aqyRfbOS5CKZig8uLIXpolhLISDjcl5
         meYV4nIghEpIzVNlyJAzDKwQce2+Bk0vYHxEal6JB1FqJ50k2TXevT8rUOnj4B+cZkT3
         y2QzjcBiINYlyQ3CaMWtwDFQ4qb2aIwMxAtzhSHX1mSrMcYi8jM951CYTamNGphRShvs
         xN9g==
X-Forwarded-Encrypted: i=1; AJvYcCVxAy0DwY95eLdqA9xTUBtwNuDAFx182fKs3HZQJE18ox5UHq9inq0NM/U2oaUo9lc91nNJKtHjTojgtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4EONRWxcIZHmDTl9UxjVbvAM6Q3aM5j8KvPQIfPo/XAA3Wiay
	CtLK5t96WxZsO94Nl7dD/qCYPNWyeAULzC3uZGNvxZoDCxjIgtCCJlllbP/ISo/2QW+GZWwyaCE
	tV25LWuWretcPIRSAobz2YkEaAFUx8DAJFhcaZZAbiMr+xbDNYlfCv6kGNubKlOcAQA==
X-Gm-Gg: AeBDieuF459RGxGCJNwRodb9lK5pf0cr+JUs6Y5S/qkk7tx2ylDqKw2skodnmBtsnqm
	s2bAnYOhfJ8RHDstpJVzbwltF0idPU25L77aFn/z2lbImGsmaO8xhoDCtXVojqe7StCsazlQf4A
	o5SSjMEvqW7cTn+P9UZKmewGbBThcJffm1ANmcZHZyZFaX1OuwCdMEo3ZERTPkzx3XMx0W6Jx3K
	Tp+aZNXebd/t1dfBmbw89LDeBu87vMCud9G6loIpJPLfn2KXxoN7aUVKaprGopXaSHrkeRljItm
	/fMBaXofXNzRj9emjkaop3cazWwz1yu0k2qEQxfiTzI0z0+JFGGlaBAmt91tidic5Cqqcx/37rq
	OIQjFGbkn3PT7Fo8QaHRVi021EU5hJOKj3/CsDvKwlYwy6yKLipvKvz4=
X-Received: by 2002:a17:90b:4fc9:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-35e42815bccmr2699521a91.15.1775816205346;
        Fri, 10 Apr 2026 03:16:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc9:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-35e42815bccmr2699460a91.15.1775816204836;
        Fri, 10 Apr 2026 03:16:44 -0700 (PDT)
Received: from [10.217.218.160] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e4517fsm984703a91.4.2026.04.10.03.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:16:44 -0700 (PDT)
Message-ID: <587ea315-9cc2-4ac8-919d-fe34b076f63f@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:46:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] i2c: qcom-geni: Avoid extra TX DMA TRE for single read
 message in GPI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
 <818da0cf-06e8-4a26-955b-67a3d5392e91@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <818da0cf-06e8-4a26-955b-67a3d5392e91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bc6LWVJVNGCSoAyFyGzexvMbV2eAFAlZ
X-Proofpoint-GUID: bc6LWVJVNGCSoAyFyGzexvMbV2eAFAlZ
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8ce0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=v7GTtkQuv75T_6NhELgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NSBTYWx0ZWRfX5G5ZXBS5ihHi
 XvwENi0du3G9Qr6L51+33s3DJUR9r3KTD0h6kkbLlECljyMJbMHJ5LDZJzi44GidZIZ2jCUJk/w
 YxIoixGbgHjQO0tbW+azK7MDOV0uMaH68RXebKRVcLaFxm2nfqDg1ptW9oaGizEgoSD2+o5NYro
 +ZHdZEcNg5/sgEV2fK+sCTBT2w17PLlvTdX4tNgP2hCp8f1pG/LeeoELEZ9mk4J8/tR5PPV2idY
 CJ/e4ndKwVQRFehtxZSzkyIad544QD+F1qNguDhvoBoFssuui5Iq21C818Cb9CfMSXx89rAPV6z
 YlpN3NAthB+2Y5podh+Q27N4xSVX1OGoHWryH+V0+woM2Z/iW4SnBOi5fcKHPoY/oboKmYOT1y0
 fOpQQp0D/jnGTM3k4nIfs7FPjZGqTc2vAi/6YJwzvQQCG2jV8eqeLgWh5l1CWR8xHHTG2uKhLUI
 f24QtK/oQ/l4O/aIgtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-58534-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 281853D58B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/6/2026 10:08 AM, Mukesh Savaliya wrote:
> 
> 
> On 4/3/2026 2:11 PM, Aniket Randive wrote:
>> In GPI mode, the I2C GENI driver programs an extra TX DMA transfer
>> descriptor (TRE) on the TX channel when handling a single read message.
>> This results in an unintended write phase being issued on the I2C bus,
>> even though a read transaction does not require any TX data.
>>
>> For a single-byte read, the correct hardware sequence consists of the
>> CONFIG and GO commands followed by a single RX DMA TRE. Programming an
>> additional TX DMA TRE is redundant, causes unnecessary DMA buffer
>> mapping on the TX channel, and may lead to incorrect bus behavior.
>>
>> Update the transfer logic to avoid programming a TX DMA TRE for single
>> read messages in GPI mode.
>>
>> Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>> Changes in v3:
>>    - Added comment in the driver for better readability and changed the
>>      position of 'skip_dma' label to allow dma engine configuration.
>>
>> Changes in v2:
>>    - Updated the commit message.
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 20 +++++++++++++++-----
>>   1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index a4acb78fafb6..78b92db7c7fd 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg msgs[],
>>   {
>>       struct gpi_i2c_config *peripheral;
>>       unsigned int flags;
>> -    void *dma_buf;
>> -    dma_addr_t addr;
>> +    void *dma_buf = NULL;
>> +    dma_addr_t addr = 0;
>>       enum dma_data_direction map_dirn;
>>       enum dma_transfer_direction dma_dirn;
>>       struct dma_async_tx_descriptor *desc;
>> @@ -639,6 +639,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>       gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>>       msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>> +    /* Skip TX DMA map for I2C_WRITE operation to avoid unintended 
>> write cycle */
> Seems you are missing writing important point - For read message ?
> Important is to clarity what's the condition we are handling, Skipping 
> something is anyway clear from goto skip_dma.

Sure, will add more description in comment for better understanding.
-Aniket

>> +    if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
>> +        peripheral->multi_msg = true;
>> +        goto skip_dma;
>> +    }
>> +
>>       dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>>       if (!dma_buf) {
>>           ret = -ENOMEM;
>> @@ -658,6 +664,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg msgs[],
>>           goto out;
>>       }
>> +skip_dma:
> Better name - skip_tx_dma_map ?

Sure. I will change it.
-Aniket

>>       if (gi2c->is_tx_multi_desc_xfer) {
>>           flags = DMA_CTRL_ACK;
>> @@ -740,9 +747,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>       return 0;
>>   err_config:
>> -    dma_unmap_single(gi2c->se.dev->parent, addr,
>> -             msgs[msg_idx].len, map_dirn);
>> -    i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +    /* Avoid DMA unmap as the write operation skipped DMA mapping */
>> +    if (dma_buf) {
>> +        dma_unmap_single(gi2c->se.dev->parent, addr,
>> +                 msgs[msg_idx].len, map_dirn);
>> +        i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +    }
>>   out:
>>       gi2c->err = ret;
> 


