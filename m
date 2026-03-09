Return-Path: <linux-media+bounces-54915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CElKKHdwrmlPEQIAu9opvQ
	(envelope-from <linux-media+bounces-54915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 08:02:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213E234A0B
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 08:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43F98304F32E
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 06:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D15363C56;
	Mon,  9 Mar 2026 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5QfXdgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq9lh9yR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A02EA754
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 06:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039581; cv=none; b=ULk3kgsXirxu86nBP60BCZ3A1uc/MS8HhZIJEX97JCbpP3zOA3f1dGdLSe2nBhD6O+5RjgTZsJT0hZsj2bKa8hIYlxiCTC7742xpJ9n58GbO/UvDfGH5O91nHDxI1oWtWcsShtx7Me67swkGyp0M3BBI5nC6whSgbVnHzjzpHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039581; c=relaxed/simple;
	bh=FvVlZ/Lcen9SEsi9VK8j2x4eoHrMDtIyP/b5GXbxpaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QOl4DmdlHFOf3Z1f2CcgZGXhGeZ2P61/yUA7sxu7cTxHThg2o5p6DVl+SbFi1f+WyZ80Kdri/00DnpK1mfZx96nVO28aEPxNrTScXf4HIKbExzfpASbZ0D3W7XipfI6FuOOKuwwUXJMGxhHqPkHaDWkVeTQ0lo+gEcOJblUfr7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5QfXdgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq9lh9yR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62942o5s224227
	for <linux-media@vger.kernel.org>; Mon, 9 Mar 2026 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=; b=i5QfXdgAcg/AgJni
	irNAv/e8dbLAEbvQsR2oIvr8dzvfhC4LlOP5b0CUTzKKvbHMVURDzdsbElcrqk37
	leb3d0XeO+wsZvb4WSyXwVHqYmgLUGuVSXsvUTqfbQsQxrYL5qOoI96G9Sd/6BFb
	1d4IM7k4Cfc0ikPSe8fnxEOzpXFI03B8f3fSK43H3iiPAKvy4sACg/wvTt55A7pt
	3u4Q3kGPEbgcz57stZVWCbucXmDT9odK4Bnl2AN2bzeNenaT0oCZyvSZ9ylxkB+z
	FvwsrcIZS9B9tZgDXowO674ls3TgjKtQRQ7IwMCSo/bnwHIlVK8Ay+idNqfBPxnM
	xRMw6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg49gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 06:59:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae405e95f5so89162685ad.2
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2026 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039578; x=1773644378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=;
        b=Jq9lh9yRemESfvXKxWWFUEpDQSyTjzbvSe6DiCoT+37aI7+RW4RHgXJ12Yyf5czfPI
         R16qDwGnD7Cfk+6FbNwLZQt6WwwrJqv6IBoXJwME5BKO3dCbx8dXCkas8Yr3qzPgUHZ+
         Uqfc9FMHpIxEOZ4t/riHqHxuxLMakzIChi81da5+ZDHo5WQzH0Ge4QTxwmJtbckgJ2gI
         rv4Al/4F1NvpUhkNDC90LRwtrnsA2LD96g+ky8nK/M0n4zCjnuTunc8NRga7JauAKyGr
         zZ1QtEJ02o6f/Wugmg2B1OGSDGQ0atQ/r1jaSv5Mt0ZgluUK1grh8eSwrs+mBA4fOuuL
         FttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039578; x=1773644378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=;
        b=rqKIW8AqTCOhJ3KXzIVAKfFjCh1SwgJbi3jgw0l7cxDNl+YIO/cy44nFHgrB97xXdS
         17La6utHMHrM7+hsozLmEb55NSkKjnOJUnDNtwOeMsAK0IJXufW858snCLYzSWr6wF4Y
         nRNJZAKbM79mHPeZPxsy7EbSKw1rd9Pyr8uoJPfgutFJEnYXfyYMOun+Tr+BPOA2Jg8T
         llDrJ5z0bxPtoKpExyaUEbNurFq1u475E26XqxbqzY/METUCQDps86wZZovn3ffcvTSj
         dsYMtu0sM4o4r6PGtDYbGvvZIzWp5lw0uw/yfkgWDuvf1vLzUbnPecNfONBK9omiPjjO
         j61g==
X-Forwarded-Encrypted: i=1; AJvYcCX94b7SKSbg90uYMjPOSMkMTf8+y1xvHC8stOdN7w8JnrK8V14/DrQKzc80bawbk2+A+EejrKw/CujCIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCA9rZBm9kzoPG/hqBXAklRJRbVs3lB/yHlIvXbWTYy+K8n3+L
	GAQqd73MC73s6xeytzG5wKsmp9ch3IkzCgAZl1PcOSEQ+zgSuB2TUDnkixzIa6p4BomZIIexjKi
	IZ1Mrc1UxyQkGlwlW0tcyhKgG+2OYIAwyicmpbdEcVY/dEG9V+HMFXqZ/scx0Y9stIA==
X-Gm-Gg: ATEYQzzmRZHH9KmNW/cjUIzdMO9Ee7euQcWqngvhyHVvASdlSjsdRJ7oQpg6UMr2yib
	uifrMMWw4a3M0ANUtqp5gBIy6qzEMKqJMAxXCUanW/i9U2YSHABzHVEpmkpzFgNAI9q4R9CWm5r
	hSPrLSP8O/WC6xTWsNZ6lJszVmMvsOv3viIFgUsulYxioJmX5fUGKtbx1vXPbyuElwmZ/a6GALp
	k8nifKzrkEhDNfacUlTG1MXIm+cg5cLiUjnLNLQyIdeABcijPdYtAVf+nKF7RHrOGeTfC+ebJn6
	PrwGRFSkCtiZ9OKKbSGxBAr+ja0zdsqgYESNChi+5Mjt2kI9KJF5MHly2zaJf0lZIyVdno63zbU
	R8QXjTJ1dhBM4fM6E8lqdZPGImceX8FLL+FjAI5SoGVqmMrsogQ==
X-Received: by 2002:a17:902:f651:b0:2ae:61bb:4255 with SMTP id d9443c01a7336-2ae82418927mr109317825ad.11.1773039578330;
        Sun, 08 Mar 2026 23:59:38 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2ae:61bb:4255 with SMTP id d9443c01a7336-2ae82418927mr109317495ad.11.1773039577848;
        Sun, 08 Mar 2026 23:59:37 -0700 (PDT)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e5c167sm99741945ad.1.2026.03.08.23.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:59:37 -0700 (PDT)
Message-ID: <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:29:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
 <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VfwbEF_sbmwur_ifM2N40NHEiQhasw5a
X-Proofpoint-ORIG-GUID: VfwbEF_sbmwur_ifM2N40NHEiQhasw5a
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ae6fdb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=_EeEMxcBAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YM0dgK5nqTTLF_VjvEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MyBTYWx0ZWRfX3eK0L1BWiXso
 P1/f0iPCHuJyQyRwoMACKSLUACRzJ8g0KDGmRVyyeXwMVEIX8q0EITEy1w9XdyvEGM1IRDoFioO
 AfxYTUChySGuTRGtzkf5DqrFLCbWnIbhp6Neo3ivcL5D7wUHZNIwWJ5A6+cjug3QDtAGRM8lLye
 syS39/VsNWtO5k3VoZS/155E+FiFqFAt8eI1QL8PqxPfN87iIPVY/dIrft79S22Zd1a6qMYUin6
 MQrMWKCV9CKveIUL0p+91/IEzDfQDhofU8pexrxd+mNMVFTRBmx7MUc5vTTs7tEu3/R3PiQWPUs
 yMtP/MUn67rl76SDjjco03MAN4Kx61OuclioNxAr9dwakOzFYxeDQq1xtd2VzpSPxlTt+Y/hwcD
 rqMItbQLjX9e8YoEcaX7Z6l0YTBW9NNrqeKl5fNxTsw2d722ACiELsqYq6ydvBKz7r6j72vYRuE
 ES5/roR7E6AXh3kfF2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090063
X-Rspamd-Queue-Id: 3213E234A0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54915-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/24/2026 2:42 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
>> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
>> it with the existing per-process memory manager and IOMMU device model.
>>
>> The implementation extends qda_gem_obj to represent imported dma-bufs,
>> including dma_buf references, attachment state, scatter-gather tables
>> and an imported DMA address used for DSP-facing book-keeping. The
>> qda_gem_prime_import() path handles reimports of buffers originally
>> exported by QDA as well as imports of external dma-bufs, attaching them
>> to the assigned IOMMU device
> That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?
dma_buf_attach* to comute-cb iommu devices are critical for DSPs to access the buffer.
This is needed if the buffer is exported by anyone other than QDA(say system heap). If this is not
the correct way, what should be the right way here? On the current fastrpc driver also,
the DMABUF is getting attached with iommu device[1] due to the same requirement.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n779
>
>> and mapping them through the memory manager
>> for DSP access. The GEM free path is updated to unmap and detach
>> imported buffers while preserving the existing behaviour for locally
>> allocated memory.
>>
>> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
>> which records the calling drm_file in a driver-private import context
>> before invoking the core DRM helpers. The GEM import callback retrieves
>> this context to ensure that an IOMMU device is assigned to the process
>> and that imported buffers follow the same per-process IOMMU selection
>> rules as natively allocated GEM objects.
>>
>> This patch prepares the driver for interoperable buffer sharing between
>> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
>> lifetime handling consistent with the existing GEM allocation flow.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ...
>
>> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>>                 qda_err(NULL, "Invalid GEM object size\n");
>>                 return -EINVAL;
>>         }
>> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>> -               return -EINVAL;
>> -       }
>> -       if (!qda_gem_obj->iommu_dev->dev) {
>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>> -               return -EINVAL;
>> -       }
>> -       if (!qda_gem_obj->virt) {
>> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
>> -               return -EINVAL;
>> -       }
>> -       if (qda_gem_obj->dma_addr == 0) {
>> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
>> -               return -EINVAL;
>> +       if (qda_gem_obj->is_imported) {
> Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!
>
> Userspace needs to mmap() them through the exporter.
>
> If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.
>
> ...
Okay, the requirement is slightly different here. Any buffer which is not allocated using the
QDA GEM interface needs to be attached to the iommu device for that particular process to
enable DSP for the access. I should not call it `mmap` instead it should be called importing the
buffer to a particular iommu context bank. With this definition, is it fine to keep it this way? Or
should the dma_buf_attach* calls be moved to some other place?
>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>> +                                          struct qda_gem_obj *gem_obj,
>> +                                          struct qda_iommu_device *iommu_dev)
>> +{
>> +       struct scatterlist *sg;
>> +       dma_addr_t dma_addr;
>> +       int ret = 0;
>> +
>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       gem_obj->iommu_dev = iommu_dev;
>> +
>> +       sg = gem_obj->sgt->sgl;
>> +       if (sg) {
>> +               dma_addr = sg_dma_address(sg);
>> +               dma_addr += ((u64)iommu_dev->sid << 32);
>> +
>> +               gem_obj->imported_dma_addr = dma_addr;
> Well that looks like you are only using the first DMA address from the imported sgt. What about the others?
I might have a proper appach for this now, will update in the next spin.
>
> Regards,
> Christian.


