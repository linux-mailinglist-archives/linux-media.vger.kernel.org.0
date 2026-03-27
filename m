Return-Path: <linux-media+bounces-57210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GxhL7JXxmmMIwUAu9opvQ
	(envelope-from <linux-media+bounces-57210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:10:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C13423AB
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E11B305309D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEC829D268;
	Fri, 27 Mar 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9EHlytI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoRDDkCT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562F40DFB0
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606074; cv=none; b=h7ZH2ZgNWvIAjxjSEHMDac3aCt1vlH8sf4TeALui+lTXfIk7oxN+P2vN1BHBZWX6PyaQpaS+2c/lcJrkQgiIWE6XTnH2TRbCmCFkWifj+e4jZyBwTYeNlYrsbnXc4YAXhuxBoQp6FegPHddn6rqb2HuD97qtLxlsxXyauptj6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606074; c=relaxed/simple;
	bh=oJywBROlv+qVPJo1tFw4l5AOhXKRmUFUOcF1LcaLAFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTmk0UwOm6mecC+HFF1ulk47j8fzxfnMBsFIeMiYK7iSVKTnzIrnmSrDvAzB4xd5CcpPX4YwakcKe9UD7Xdmy3vsI6J6tjjL2gdr7vP7kbl4rwNvfAY/EehJPOBslb3mxTsCI2KbbNBuRmGqG1xcIS0TyYQCUYonuyU6HkZbBxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9EHlytI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoRDDkCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3t11860237
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPdH5qml1h9BZi0j2A2fsbs34QlWxVd/aklZ5kvyOTs=; b=e9EHlytIdywEPWTD
	39TnP0cmNofvASKvqU/gBxM+mf6hxXLeXbj5KdhdZ6WBNeDsrXHlnGjbzqdwgIzX
	x4dJxAslVv/eeQBvs+LNVl3R8uWMP3bThaoLIoK2V4/d+o7VsxmUb00CDBMcVWIh
	Jz76tazr9xvVXke/qU3s59wp6eDAMgiSPjFFGACIeKsi1YR+IQsN/KH9240yD5UC
	3MpkETytN29yoEeeTpjcWtYKblQpydUseX0pjTLYbVv2+6RZR+fLmwX8ebA0akGq
	kVVtWkZe36msYVJfqMhLi9h1pO+jiyF9e+jVnrYAMTrADYVLzG3X5vdRaS/SSo3R
	E8c50A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2hpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:07:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c7a84a43eso4089595b3a.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606072; x=1775210872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPdH5qml1h9BZi0j2A2fsbs34QlWxVd/aklZ5kvyOTs=;
        b=YoRDDkCTZQWtX55qWruqYyS1EpI536GKbIBlPbEhu1lRryCr7UG3kb3lU0mwQIiAsz
         dpuFPwFrGq9CXz+jGLstx2adylNfuZlbv9aWSN3ntZZV1B1GVlsle7XEpnkXiHIhylO2
         mJQOPBn9Sv5XeqJQmI4Qcz+l7Ouu7JfTSTHTdjwNeCBS4o5PFNU7bJL+dZQl8VkFcP7A
         /VCj2XmdXx6i+NTCMhKBK912pJeXcP9EafOM7bQZEzwt0EmLT0dd3dKIg/3JIgk8MeZi
         6c6A1VLEnBaBcflVHECZHJOEn5cpUib7AMjod0k4W/SnvXQSQmO00mvKH9c5e1F4doXr
         42ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606072; x=1775210872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPdH5qml1h9BZi0j2A2fsbs34QlWxVd/aklZ5kvyOTs=;
        b=slXK9xgZR9bcrggntg0xWx+WY0x6zgbrUyi94FafCFP25HrSEJ2Dch7f3HwISf+P6c
         PPWQ/hg2OhgTlbCaEqC78FoOmw+AmaYdlXmzvV/1i8Kq20SI6rrJHsdew0YI37+3QYWE
         HbgaCaLpdqwyRtL9hqwiBXxHlPJuizlgX5J8eF4U6ajnV7DHnGh0c4H5hI3lSxiZu6MD
         3e+NMvA6PFdHeOzw+IKNfDCGMZYYXRFvysH81Lp1AXvuJMMg5iUUAo/nd/+jRu0A/a8A
         XheKuHlt02uNYoioT+K9j4bEulJJZKnx6J5A3T01DFZq2Ly1e72ivUbQ4647hfDn3svJ
         OeHw==
X-Forwarded-Encrypted: i=1; AJvYcCVe5UdoU/KZC0aZFEA2Gop2y98PJvuYke7SAufG9+Es8IfrPlApkEhA06hsT3UO2WRqEQrokAoiMEbwNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfu25KeP1IDhoBcRV5xZ6N6gGIQJ7gOR6QVR62jbegnys5NBJ
	KRgLk9JupFqhKIovFVP3MnY1xkd7SJMJBkNX8gHZxVXlMmSIahDPAFFxL9kFOplw+kzYS6vmWs2
	GMj/ZKWuq4kkD4OcKN4v+oxfMovtHE96jZ2d9cyl1O9cfYi3tUyYPtHkRdtlXRZYYAw==
X-Gm-Gg: ATEYQzyahs82pLo9qog3tmvB+XjLfWIu+D36AifQYWJd1dcSzeTBauF3UwWO9P5UWOo
	Dy2Gdmzn1YX9Ae6RAY8lu/YfA2OlfPMnCFjUMMA48wMrmCjpUM9BqN+hksMu5oX6/y0Fgb/AA9s
	DjMy2oHEJZ9scKOpzAyZ1mAZHCzQuiksoFeR6lu3MFVPWiyKnuQ6s7csq0oUj6YdVaj/zJOSoq0
	ovwj0cpMaCEYxQqUAiW2wM6ioITTUuDh06+Vkp/n1b2O+WfDuaZi1LDxW/DWsFfVudY1vxokuoq
	2Nm+/1npHPjXj+Hohus5HMMZaebelpu5lqzdeIqNFm3dbW0HdORaI9yGNgk/5R/8ecL83whK0vK
	wfqYPj6n7WLCJfH8WwL5WCnMUyu6RKGnKo/dX4U1R0fVoKU0IKeSoHas=
X-Received: by 2002:a05:6a00:3405:b0:82a:68fb:cd6d with SMTP id d2e1a72fcca58-82c959d4ac7mr1873014b3a.3.1774606072001;
        Fri, 27 Mar 2026 03:07:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:3405:b0:82a:68fb:cd6d with SMTP id d2e1a72fcca58-82c959d4ac7mr1872992b3a.3.1774606071485;
        Fri, 27 Mar 2026 03:07:51 -0700 (PDT)
Received: from [10.217.218.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e5ee6sm5012429b3a.7.2026.03.27.03.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:07:50 -0700 (PDT)
Message-ID: <e850f14e-a938-41cb-80fe-fb92f647fc31@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:37:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Skip extra TX DMA TRE for single read
 message in GPI mode
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
References: <20260326-skip_extra_dma_tre-v1-1-deef018895dc@oss.qualcomm.com>
 <341f2f06-eae0-44b1-b513-61a4a129bae2@quicinc.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <341f2f06-eae0-44b1-b513-61a4a129bae2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c656f8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3qtGEnkgDDs7DTPDeWgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: bhtFznn6nWan1-nCz0K1RzHe--qxnUUx
X-Proofpoint-GUID: bhtFznn6nWan1-nCz0K1RzHe--qxnUUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX4FjpMehR+lhX
 miCc7ehmYg9ZuYQWTadrdVaFQm9rjgcnQ5U8x1W2P75wbD0iBY+NGelM3RgG+BeVtydffe5JxfP
 SCZouHB56IoJA1yrb4xGbGoxItn+u7KiiJICZKl5o5lL7tOrpDYRVE3wuLdurATMvH7VrH5k/RF
 xFObXDt0zfsFqE0+1zTy2lLb6o89aau43tPnfYioLJ3NMxgnkKMpLfI5EFcholhabSoEepM10Wp
 hnG9MQNORPBodWkvpGHmR36g9p0jRqLzZ1tt198GnXg8b8WTsDjeRss8mS10E7d8Dc019i8KpUW
 lNGnRbf+Kx4IuECaZlXKnrLqQT+GIeWaPgK7gWn6ux7XspDMgxpVgy2ES+Nbkcnj0n3s5dqUFmV
 mjs2Y7zpdzrEZNd4+2nudLvf4FlI2iq7YLqSHIiWoWaL3tTJi3z+88FDc/GScDgq/JaPfa8uo5Z
 vEKS4coWnHYBd7AtJSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-57210-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C7C13423AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/2026 11:51 AM, Mukesh Kumar Savaliya wrote:
> 
> 
> On 3/26/2026 10:01 AM, Aniket Randive wrote:
>> In GPI mode, the I2C GENI driver incorrectly generates an extra TX DMA
>> TRE on the TX channel during single read message transfer. This results
> What's the impact of this extra DMA TRE ? do you see failure/timeout, 
> anything ?

This write operation is unnecessary. For a 1‑byte read operation, only 
the CONFIG, GO and RX DMA TRE are required. However, an additional TX 
DMA TRE is currently being added. In addition to being redundant, this 
also results in unnecessary DMA buffer mapping for the TX DMA TRE.

>> in an unnecessary write operation on the I2C bus, which is not required.
>>
>> Update the logic to avoid generating the extra TX DMA TRE for single
>> read message, ensuring correct behavior and preventing redundant
>> transfers.
>>
> So for read, we do unwanted write too ? if so, please write it 
> accordingly.  Correct behavior needs to be justified against wrong.

Yes. Currently, the driver performs an unnecessary write as part of a 
read transaction. For a single‑byte read operation, the correct behavior 
is to issue only the CONFIG, GO command, and an RX DMA TRE. This TX DMA 
TRE does not contribute to the read operation and results in an 
unintended write and redundant DMA buffer mapping. Hence, the current 
behavior is incorrect and should be fixed to align with the required 
hardware transaction sequence.

>> Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index a4acb78fafb6..2706309bbebb 100644
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
>> @@ -639,6 +639,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>       gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
>>       msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
>> +    if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
>> +        peripheral->multi_msg = true;
> what's the actual meaning of multi_msg here ? IIUC, this multi_msg is 
> set to true for single transfer  ? any better name if so ? Yes, need to 
> change it out of this patch.

In the GPI driver, a DMA TRE is created only when either the operation 
is a read or when multi_msg is set to false. This is controlled by the 
following check during I2C TRE construction,

	if (i2c->op == I2C_READ || i2c->multi_msg == false) {
		/* create the DMA TRE */
		tre = &desc->tre[tre_idx];

Previously, when dmaengine_prep_slave_single() was invoked for a write 
operation, this condition evaluated to true and a TX DMA TRE was created 
on the TX channel. With the recent change, the flag is explicitly set, 
which correctly prevents creation of a TX DMA TRE. I agree the variable 
name can be improved for clarity and propose addressing that in a 
follow‑up patch to keep this change minimal and focused.

>> +        goto skip_dma;
>> +    }
>> +
>>       dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
>>       if (!dma_buf) {
>>           ret = -ENOMEM;
>> @@ -668,6 +673,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, 
>> struct i2c_msg msgs[],
>>           flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>>       }
>> +skip_dma:
>>       /* set the length as message for rx txn */
>>       peripheral->rx_len = msgs[msg_idx].len;
>>       peripheral->op = op;
>> @@ -740,9 +746,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>       return 0;
>>   err_config:
>> -    dma_unmap_single(gi2c->se.dev->parent, addr,
>> -             msgs[msg_idx].len, map_dirn);
>> -    i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +    if (op == I2C_WRITE && (msgs[msg_idx].flags & I2C_M_RD)) {
>> +        dma_unmap_single(gi2c->se.dev->parent, addr,
>> +                 msgs[msg_idx].len, map_dirn);
>> +        i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
>> +    }
>>   out:
>>       gi2c->err = ret;
>>
>> ---
>> base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
>> change-id: 20260325-skip_extra_dma_tre-a3cf22f81d9b
>>
>> Best regards,
>> -- 
>> Aniket Randive <aniket.randive@oss.qualcomm.com>
>>
>>
> 


