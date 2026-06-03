Return-Path: <linux-media+bounces-63487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h7UyFjbAH2qXpQAAu9opvQ
	(envelope-from <linux-media+bounces-63487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:48:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6816345CE
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:48:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l8j4zNtb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KTdz3UQq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63487-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63487-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40E71304CF27
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A523BB105;
	Wed,  3 Jun 2026 05:46:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4562F39C2
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 05:46:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465607; cv=none; b=LC6ENgfd1acHu9kdazIpl9hnZVd5mO9Qz5QWBgyAKBWG0Yrj4bny4RgCJNTeg/bS9OEkT5MPbKWhRfSn/Jsu4BczRwHdt/CKFHMQszCQQNiaE06/oCqVEshywxVwTEsu5xUj5+5yF3SjFNAEyMg6N1XBbCqeNfo1voAmds2wpQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465607; c=relaxed/simple;
	bh=0YcqXif0Sc0+zfmEVlu6cC7JsndqG3qCjJYzOwNGScc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs/Jft6E24yg0LFRshfzMlCQZwSW3ewO8JZmidpQCAqir1WJR0/C2yk9BMluZfb4JhpEppdMABCIEEciMrQaZOiI6Q5GH4zztl5Ub2usw56PPiOyKlYuIC5RDWBVlWbJKBd0dXqf2ZPEKLdZcLfmQwS92Giy+6BGoVqoytXZ3g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8j4zNtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTdz3UQq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535WD2L1826277
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 05:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=; b=l8j4zNtbaNo9Nw2A
	dI861FKta50sP94zsAFz9s/HbxVQJGYtbZTU2VKRrawcVwcmjArJCbq0vLiB7uko
	TqsWqSXPjhAYWSPF5mi1LZCU65HiO7bA10vMCnENN5ctlYxx742kBHkKvrWgFODQ
	X5Xw8JTjr/cBAoH7UvLA1+rBgO2rLZEQFrVs/NTqTgbLtYeXyEGSwvdywLjO90QK
	rUZBHOjPcSqFNwUow8/nseSuP41yZlhym007DBINCXH8wwdLwLK+IlmzKZFXcDYy
	LvqTBWpN4jSXiXqGARQS11F5LpoA+bicR5UPgRXZ7kF47zWEJkUo0G+erkD7mDGJ
	QqVu7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabggupp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:46:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso4383324a91.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465605; x=1781070405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=;
        b=KTdz3UQqOZZUWyJfULYlihRQUhjWBks9I5j0vQ27NfJoMePkLvlGreIJ1u1gC/pCEc
         u7Ff7kPQ+qpMKVM3t8ND8QZHORwViN9U19BdIi5oaGPZy7bTt6N6/da3M7sG+pRbx8Z7
         6+mRvWxAprKpy2FO/P7aqQydxosOEPNJseEZr9e9r2cgXZR1XoL5sl17z0DxjKZwtx0o
         qJG+vGyHHoiGIRYQvX/kCbyRAz7crsWvSzTGpZoCZWP5bAfOTFuErcD3YYgQo447ZMEg
         bV2yA60tiPQygZLSFMF6pcIQ4Vw6Nmt+7KL+ILgmIkN1h3T/bs3C9kbpO+vGgi+UDzIk
         H1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465605; x=1781070405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ3nOU6oOP2wb3RgvzWm2gp1FwA+8QQfS/PIwJ4FYWA=;
        b=NXUbWkhvfgJoV54GFka1U47g/bob9TLGkQiT6HZFO6JvyN6JU3cYgGoye3Ce9vgVQa
         VR07KTfAM4N3sSvoUwAxPssY3VxO8XOVAkl1yrrkkCCxAZ/WhxIo7tc/3SDw5ncCOMOW
         qqSdh1Nm1QAbPPQikYbNPUb2Hh3rmIU4DESiw8+EQIrwE1bCMai2tXI6+Xd8r2LpYXfX
         d+E92C787rc3RSulTggxypWUWjr6azwaVL5NOXxopM0sFYPnqU7sE8O+8211gh2ISj3I
         9g2X792fTAJJSQidc3MDwtPIpt54iy2QweSmNz9rftvSS/yJvGQPuAqC8ies721QAIIs
         G1sA==
X-Forwarded-Encrypted: i=1; AFNElJ96alFWj8VNto3C4ww1EVHfsndSYdU71zZVsx9Ha1qA35Ab8Kr9i10fgMdzIjEmEtUKDsz2eK9w/prWpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsf62Jr+mshpzaKKNhwQaBmCGZ9vG52G/nEqJSXfQOtAz5t/ZM
	HJzVZ4UJq9JCCqBZ5SHy/OofDpFP+Pvb8WlspQaTmPfWCbtCBwoCBHZFhWxc/sd4RoigS/ISz3b
	QWKZuyhtsKoA6ax/VifQeYk26312qZqljTYoIJMzmgqopsv8p7XWnIs0EgUNrVw9bYg==
X-Gm-Gg: Acq92OEaX5QVdxh8E1pvblkW7NJ+3KapgE9wvMenuPmaT+ajYoS7sSlnNeaXw7APtYx
	mML91bU2AGQaa6rzzCDqNm1Cw7ntn/gjicrBN6KQn9sK83RgLOz9B4wXGD6AZUnTpk4LZIoYYRU
	vZ19WcaRdGi72HEZX7qREdc8bqGytvhIRLE5xAbg0szsiDAcTAk0HugWJhKs/SJor2G0OwVMepN
	Y1w6Tzjom7dBGyqRSS1n22OaAToSL8yzokTGUXgDf5NcfEaUQw5Ahr6VZ/iO5cu+eS2+o/5yNTp
	1ZowtP5i1Ladz3mtKTl4FRxg1ysi0jVTXONrmp6fwZj37ea7qlvbymImSdDworgyP81MscoPmO7
	SVMllaOvVk/B7jXekHxq5nXbl5GhCb+oU7y4FeX3lnlfbE2pdznCP1UCpRP9X
X-Received: by 2002:a17:90b:3a90:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36e33bb9354mr1974874a91.18.1780465604779;
        Tue, 02 Jun 2026 22:46:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3a90:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36e33bb9354mr1974830a91.18.1780465604223;
        Tue, 02 Jun 2026 22:46:44 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ca4dsm10999325ad.76.2026.06.02.22.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:46:43 -0700 (PDT)
Message-ID: <f146f972-6508-4147-86f1-2b88c80e1c89@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] accel/qda: Add memory manager for CB devices
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-7-b2d984c297f8@oss.qualcomm.com>
 <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <a6n2qquynwzlquzqmnmjmkg6vkrldj42muuejwzln5wna2qmhi@ki2slzuyt5qw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a1fbfc5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LzV4jstc-Az_XmsxRYMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: G4V2OB46HjdnEQ3tOJ5gi8124hElPF1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MyBTYWx0ZWRfX45M3RLlH8Wpw
 QrzQRWx7DC1E49j0ME2DRNmGa4UBZAaQFwy7C8dlCAkldQVvRSK+Ki3Rr37B7BX7XcGZryzhvHR
 nlodlT3rp+th5AEaQkRAOW0AKZRVFDnCjJjojloF830Dth0aXVhXTYMnlMT1t9B5sVXYDVH66Fu
 68M1xqvzZMast8NEqxgd3pDGX9BRCkU8oXqkRjEMSH2H02vcChmKcgQm6sgXfNA12oL28x+TSmY
 UoGGfvJRfV+TwmXGIKVNVjdaNTE1TQOEKz29TO5KLb8tbZ2C0vW8xcxw9SgskVN1+FLU0JhdOpV
 VSDUt4UAmEzG099HhVXyBcUxTfbbDlk+DXK3KSJ+wp0xMcz3UCPsA6C6T64Q8asz516auUg/hte
 MshRgV3gWtHDZ9QNn97Kn943wodH7AawAHPW+If1CbfoqX+E0+93Z8KArljV+B1eJkm3zI+hpib
 nNBogg+yWPvr2c8P0Ow==
X-Proofpoint-ORIG-GUID: G4V2OB46HjdnEQ3tOJ5gi8124hElPF1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63487-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB6816345CE

On 20-05-2026 19:57, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:57AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the QDA memory manager (qda_memory_manager) to track and
>> manage the IOMMU devices that back each compute context bank (CB).
>>
>> Each CB device registered on the qda-compute-cb bus is assigned a
>> unique ID via an XArray and wrapped in a qda_iommu_device descriptor
>> that records the device pointer and its stream ID. This registry
>> allows the driver to look up the correct IOMMU domain for a given
>> session when mapping DSP buffers.
>>
>> The memory manager is initialised in qda_init_device() before CB
>> devices are populated and torn down in qda_deinit_device() after they
>> are destroyed, ensuring no dangling references remain in the XArray.
>>
>> qda_cb.c is extended with qda_cb_setup_device(), which is called
>> immediately after a CB device is registered on the bus. It allocates
>> a qda_iommu_device, registers it with the memory manager, and stores
>> it as the CB device's driver data so that qda_destroy_cb_device() can
>> retrieve and unregister it during teardown.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  drivers/accel/qda/qda_cb.c             |  47 ++++++++++++++
>>  drivers/accel/qda/qda_drv.c            |  34 ++++++++++
>>  drivers/accel/qda/qda_drv.h            |   5 ++
>>  drivers/accel/qda/qda_memory_manager.c | 111 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_memory_manager.h |  49 +++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c          |   7 +++
>>  7 files changed, 254 insertions(+)
>>
>> @@ -61,14 +62,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	}
>>  	qdev->dsp_name = label;
>>  
>> +	ret = qda_init_device(qdev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>>  	if (ret) {
>>  		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
>> +		qda_deinit_device(qdev);
>>  		return ret;
>>  	}
>>  
>>  	ret = qda_register_device(qdev);
>>  	if (ret) {
>> +		qda_deinit_device(qdev);
>>  		qda_cb_unpopulate(qdev);
> 
> No, this is not how you unwind in the error case in the kernel. Follow
> the established patterns.
Okay, I see your point and the same you highlighted on previous patch.
I'll update this.>
>>  		return ret;
>>  	}
>>
>> -- 
>> 2.34.1
>>
>>
> 


