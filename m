Return-Path: <linux-media+bounces-54052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEQdF1tHpWkg7AUAu9opvQ
	(envelope-from <linux-media+bounces-54052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:16:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E11D4877
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 09:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1372302C746
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 08:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1F531619A;
	Mon,  2 Mar 2026 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipmP+1UO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDubrXbc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012C331230
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439323; cv=none; b=ntkXI1UaXYdRVEShZf0MsqO2/M7VICvtkSuaep2n00egRw7LPMOW/km1mDxR9LLk1KNk6CHvpnFWdACKf3OIIMb3VjTuMZHLnxeaDheK85pPE/Xj3iez/hivZ2Kk/PcL1fZD3IaUyA+Uz+Oc0PCGNpE8TS1x0ONU7VSt1Sg1zmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439323; c=relaxed/simple;
	bh=z/OjeLU/BgW56NOv04DU8XYhWIRJ/b3uSHrxF7ye9+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=np02YjqWsCW32ZHRYpK16vqXH4qvMN72IJ5JBjC99mr+UGwnvUAxWk2iV+xqBAE4GlEbV7VE7S5VZ70BMtQOMcxNTXjBIkdw60iOBv8ADMYQuBG5F7ND3imBlcaPhM04WQFbH8hyMlRKpSVAdsCkT3XLsp+o7Mt2uKFvTKOcv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipmP+1UO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDubrXbc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62262pHv993989
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=; b=ipmP+1UOIkbkHrz5
	4Zh5zcejX0AEK4qWy0UQjcCFbrK7VJKAgWA2ZJ+yrMI1JZRb+MYGUxihgsBrJdvu
	dvEsH9Lyyh56EIP2l2/7mw5OHLnTHNZqC10WkhgzC74NlRMcT0BEoBinGtL5Dj9H
	eGrnwxMXT/K9CL7f6sG8CgdUghPuGyzXdkJMoFw04R/N2URMbdxQtDe9in8qrJ51
	tbqk52bdQkuOU+H9AxehKcQ/pjSxjsfc1xNC/DvenXdB2VqfLs3YaYnqy5eG5C/u
	wenPMG+sP7wp9rocb3lxPS5efhm3jHsVbc3cG9Lrok2jOZnioUctBTMXKlsf5411
	Q9pBtw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq4qha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 08:15:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35979a03106so1839833a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 00:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772439318; x=1773044118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=;
        b=gDubrXbcAKsjVzidLtnGh/erGR8OB0pFipZ8d5H5LQLpVEKU42oiG55OAUVL5RPaGT
         1Ha129YV+7Pq8izyOnAf7zXT/T5lrf7iyYEkeKTXoiwdvAS2IpnLVWostKcmbPvLfkuq
         8qyYb6872Ylnr7lvGBUD/rZzQEzRunuIlazgScLZ9ISO5rOBPC5P3GGCng7o9IlI/qou
         oaM7+LlxsWsBIhWlxW0WXwhrCaWB71lC7UYzOuYCF3Rf7KycvqIvTYgyy46jrjsvLVEe
         qR8/yKDtx88bhIOu98RdG2eOMRnkwTBUygoz7H4HkM2iH/LbKELSC4EC5azPAsXeuzhI
         pL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439319; x=1773044119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nxlvKtWHlixlnWM7lk5L+nk5CDxPToMPWa0ATJIt+U=;
        b=U5yRMgsOp+iZcET0W+9LeRODXNcPtjhh/1qnNKm1pBXC4PYl0IeQWAwko511U8wVHW
         2q15pNuxMn+49yVXhVkK4nsixKyPjS4WASECnjAb4hFOU6rtyvmOBVyfPUhZl3YQsrJf
         KEhQVOoS9+IkpHld4GRx8twATFyQBdjVhVW42zfqCAAQ2BFcyl0B3Vi1qqVzDZ8HUIMn
         yD46cISZK3xkJf3qdyqUWLAigdvlxLPI87ePyXFTcmSr9GNaR/MWGmelZK6H7ZtjWHhR
         SbxGLYl/EzLEy0F7gekdRvXrp+P+C7gEAidhndNHTeBGLESJgsPGZeh6+gMXWYonXrim
         nLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIAmqLQAM+X4kpfgi6sIrggSuWflDkMoAsOcrNgSE564l90hNcSh3432SFagRFOe1EQBVGrU7Lt1f4hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1i+4h6q+hhh9Z/F6w/r8HhFCUEKYXT+EaZeFsV11zSfIjd6a
	UZn4FSfgv4NJxcLRiNJ+9ysWbmQmdeWBgCwSw4Bq0o6wZ2bmjY4Ex61WSr1UUapXSYvLOp+XB4K
	0Ba3pwwqpvhcvVGFo9BobL1/HYOQ9JHxwE1mnuETTFbgeBdJjLVJdjkVxTldy33GeyA==
X-Gm-Gg: ATEYQzz3m9uFVzU436KC4Ums1Rz44T8fhBMCu1R5bro2Y3wcz/j9dX2rYKVxq1SQVNq
	Hp0k57oKliHZStW/meszGPrU8r0ZzsrUPGkNf+8cEDW5k/FYyaOgWOgZjpgxiXAzcHMiEgoz5RA
	hyAABKG3ZFbyoDSnZPyu5PKqQH+qX31ND+ZIn9PU4vMqYGfgeKiAVT3ZnuaBC3vLvUmNELJDbdR
	yNaD534UC5dn8uabmTT7LGbq3tVGH2A9xY3Tpv/bshkKFwML4hMib0udJoyFU5pm965XXTWM0iS
	RMUDtNUSIOMPqzZlh3X47hxEKcUv4S2WAm87OA81tjR05zLrzQWt3e4lQPJsO/U7bpShvfGfP7e
	zKszMOFlDab40E4W/rM+RAGLDk0emdJWUo/K4ogFSd4na4gRbSQ==
X-Received: by 2002:a05:6300:85:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-395c3b03cc5mr10176287637.35.1772439318621;
        Mon, 02 Mar 2026 00:15:18 -0800 (PST)
X-Received: by 2002:a05:6300:85:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-395c3b03cc5mr10176246637.35.1772439317962;
        Mon, 02 Mar 2026 00:15:17 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa806295sm11137313a12.16.2026.03.02.00.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:15:17 -0800 (PST)
Message-ID: <5448e807-2435-42f4-b98e-2beb6b66a6f4@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:45:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d7s4e7xzfqfbcf5o3grc6xqm74dzwpck6ge7hyrwewmyacpuez@lcd6nhzyjr55>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MGM_MOwp08XA6F4MCB06At6uwAVZbTXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MiBTYWx0ZWRfX/g696vmvGlqI
 X3ctIdf5ejJ/i3HeC2fur2iQ/pIYy9n6Wdz7m92KxvmP72e2fLCZhDH2ymESWRgaauUw3msisuw
 aYre82VEdnLXB7nNjfaSku08gYEr2EAXgWJ1TPh129clVWnIr3qgv+2RZbEh5p6JKCwIeHXnKlB
 L6J/oDdq5jU77dDcROD01W0DcS+4B+XSu6dWVH5es8cU/aWpyaFm1eC7oc/EiG8IjvqVccyTEdX
 NCc6m/+1mF1lrjnS7JtYm1YITHaKdFu2QC4lLye2l+1YsTHR8nua+qIhZvlldmusugpMSBsPXZI
 jsPhtNdIfuQ9x6p/Xl9w8Y7GHBHd7heWkejJyNa3O4J0tKulu7RKnglxyebukKzOFsUtNF904X5
 wlB+2NsVflM2rlQrKMNR48IZBKWfRIN3QZzWV5ezfSPeBNDP1/Hab0fLp0lQZ5U1I7FyUtC/7uY
 dazvO2Z1WSY3rN++5lw==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a54717 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Dp_If50ftEsHmqaufPoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: MGM_MOwp08XA6F4MCB06At6uwAVZbTXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54052-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F38E11D4877
X-Rspamd-Action: no action



On 2/24/2026 4:20 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
>> Introduce a per-device memory manager for the QDA driver that tracks
>> IOMMU-capable compute context-bank (CB) devices. Each CB device is
>> represented by a qda_iommu_device and registered with a central
>> qda_memory_manager instance owned by qda_dev.
>>
>> The memory manager maintains an xarray of devices and assigns a
>> unique ID to each CB. It also provides basic lifetime management
> Sounds like IDR.
I was planning to stick with xarray accross QDA as IDR gives checkpatch warnings.
>
>> and a workqueue for deferred device removal. qda_cb_setup_device()
> What is deferred device removal? Why do you need it?
This is not needed, I was trying some experiment in my initial design(CB aggregation),
but it's not needed now, I'll remove this.
>
>> now allocates a qda_iommu_device for each CB and registers it with
>> the memory manager after DMA configuration succeeds.
>>
>> qda_init_device() is extended to allocate and initialize the memory
>> manager, while qda_deinit_device() will tear it down in later
>> patches. This prepares the QDA driver for fine-grained memory and
>> IOMMU domain management tied to individual CB devices.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  drivers/accel/qda/qda_cb.c             |  32 +++++++
>>  drivers/accel/qda/qda_drv.c            |  46 ++++++++++
>>  drivers/accel/qda/qda_drv.h            |   3 +
>>  drivers/accel/qda/qda_memory_manager.c | 152 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h | 101 ++++++++++++++++++++++
>>  6 files changed, 335 insertions(+)
>>


