Return-Path: <linux-media+bounces-54064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBXAH65TpWnR9AUAu9opvQ
	(envelope-from <linux-media+bounces-54064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:09:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F941D5495
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B929D3012E5B
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DC138D00C;
	Mon,  2 Mar 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ls3MwxnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0qYREoQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138D34CFD4
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442532; cv=none; b=o9coYd2oKDUNttk1kbiW2R4XUJMfgz1bNyZsR9w5WEWZcp1gKFFFhm6tkYVh7987jIcBNNNzzauF/qbKCwTTdae796DbXb3RtuufDMh8r+NKCkoKGskv4zWpygtwjOSzVFbGPSJNUHS1IUobzTg2gEAcQt/h32pSHU8B827aI3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442532; c=relaxed/simple;
	bh=m79/X+bzTpXZL9AiiyjJ6wo5Md/bncCfMY3V5a10w4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqIclxCxWaAwbatlTc5bG323lIOHqMlTsdEkJnj2eEslNWJg802acI8+Yrtk261oBkS6VGDGF4c6bDkcEoTjf9BNaZ6llK5b/05lSSsOBdFMP6+xUDCWBLcceFPupSshCgrGNeO96hMxEGmU9XWLpBneWruF9ZY02EBv9M38m9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ls3MwxnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0qYREoQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285Xgg662204
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=; b=Ls3MwxnSvG7BIlnK
	IyfnLH5p9oe0dLepe1a+nqOGmpRu/4qG+sSO2gKmIHFKo06/ya1XPUOlwIW8eJLo
	2pI6ZrmU7TWboPLUzkOpLJrZS0MdecFq3rnqNKndUzd3HTHAzh2h05tEBXCHKNWw
	UUnXHYIFMOHVnoduZQXFCNyXoMdMckQOumOzGjKlJMap5hlsoeJjDo95nd5KKVrk
	MLS5arA2twyVRrIQrypnewUMTD/4e7RD6eerC/2c4QVVBBTiAfeeZg5qDvJoZUCv
	4ZHwYUF9OM8jLqjubqvJqSVdZEqjaym+yMXm0R4xenGrRwgqPN/2Bum3YHPUdqNR
	Hf4F2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2r9m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 09:08:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8274bf81f2eso1118160b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442529; x=1773047329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
        b=A0qYREoQARxtPBKXuwQB13IAp/GOvAXMjy66p/XI8tqvlimQDTXILK+uA7M1lOQ61h
         4HkpuWfJqjQlSdkzhTmR++lZYswMo5uapdAjUXy0eezz6rTYAOkpM00RYFNefDZhme04
         d3cDmitIFjn9hZC8i/VYoIfI8Z9MlcWX+d8OJVen77DJEPnRZqMoUamPuuvLpR9rMftR
         36bouWF0XJ3b0ciIkKtfbse7u6EyFt/jhK5v8XztN+EYkz8N8Ih4tTKqYhTs9hMv9QxE
         0fgDtJ4ZQ3OX1Nrvl31IakbRGw3EflgHbxWViGdzznl4bpZkay95ij3ukKWVhnFN2gAP
         yiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442529; x=1773047329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
        b=J17yfToCh+wyXjRlkH5jH9Iw7h5Zn3//2XQYsU0UXaOLWWfY77QHFQbneakXi2OtSS
         lFenTYQDiW0Cz/zepizP/RkGYprXNyzre4Q6pcIIf6uYvKE0W/VKkSeM/4fEvVWDxh8I
         P/+HJq6a69+goE8l8DJsLLMiOkBl0fYNJUSrZ0esXY04Y6zZJMGVzE7SGW3XVR2eQIJP
         sV3IUm/tsvP1E6s6kmmR/vAbmP3S25pqqxa+olv7wUb4+uMpM8XAlwwMMizdmJ6fbPqJ
         cmaAiaT+zeJoE0f0vG4s8uRWT6zCBnp6xRvC6kUnz5uIkEOWE5zBVAu7NBKoOd1oFHX4
         rbIA==
X-Forwarded-Encrypted: i=1; AJvYcCUskoUAmVzjTJil4Uxapu7ZHI57SnETN0Z3hk84UPkFuRq33hdbzFiJgMX90d1DKDu0sHTDm2IxglkwGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjdqP9WiVt3Wgt6DNaEPuGjzTeqHyaF17Bfd1Zt5yuC+07aiw
	w4uNQNqj8D1N1BSHS5PGL9d/90sVx9CQHF8PV5oAh6sXPqsSWN3zyAzofRd7w8AGVSFGPIgt6jv
	Znh8TREzbipMksts+UeZ8t1qJlhD5SS5v1I0HZkC5USizPVsOroqNGzWm18nUAXy4+g==
X-Gm-Gg: ATEYQzxFzV2/cqeTk5q3jUmD52iG/RlY3/YQUg/eSPIwRm41Hb+jD96qwaLrJhutBGB
	LtJicHBK3y5sde6ZaxJ7fEQIC0n9/Hig8pcCszhghXLZiYF/ImGHzA5pzBvg1YLPYbmax5E5tdC
	NJwBDjsYGvQpMWDaRcDfHhSd4sd/vj59rYwtL7vw4u1WUUGZDricqmqQSq3smrsaVBBy2i7LJRF
	V8SUs+6MUjVeh0TD2MKs8TVyRgbKBGPyzZ7JRX0Ai7rX9kLJ2C8uVa5sgzdpImgl2EmBIeaeE74
	PkpiE0eSoubqsUot6foYdTE7f0GFR+jMet68BPgf2B8r0enT0VTsgu62mIJG5xY0bquxQcxVcFq
	jDEJG+QKzHzS9DkWl3Prr8xhuG0SxSmTkL1Rf6j5iDJNdZYhA3A==
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-8274d93af23mr10970985b3a.13.1772442529567;
        Mon, 02 Mar 2026 01:08:49 -0800 (PST)
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-8274d93af23mr10970955b3a.13.1772442529070;
        Mon, 02 Mar 2026 01:08:49 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff1c9esm13696576b3a.32.2026.03.02.01.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:08:48 -0800 (PST)
Message-ID: <a46bd6ea-ec33-431a-bcc2-1ade0b40c5ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:38:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
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
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tRxDp-83ztMLfSTJ-TIlCEMgdwNy2y_3
X-Proofpoint-ORIG-GUID: tRxDp-83ztMLfSTJ-TIlCEMgdwNy2y_3
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a553a2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ukUgU1k7PXLouMuqi7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX246xg0z0dEFw
 ghAD9y2WjeBOFOS423TU9cPRRTLXFw07rNl7EnQ7tGajfnUyAKsAEv3puYKl2mcOgmyQGfkYm8H
 8jrkdbNO8mU9NhvBu/furN9vaSQG76Q2CJReDm0qXz3zffGOrm/OkpprW2cTjKWOPJGCwDCIIgt
 riezKFvVqce44l3L5I027vwRB43LFI5J6BopfTM7ubvPHGoSx4T3oK/VfN84aWRJpi3imEojcoi
 sItydFiqt+FrylmeE7rtjFdvo7CWRqfEkRi8XQsq0jy7eMiV5WP3MH6idB7gGj7WQKfyJ/3lgwu
 UeeX60+/gxzLcnHVAqh6/Y73gWsXTo+h/nvrmPnAG3bq5mqPzuw2bW/Twt1bfzqVs8a/z2RAGtN
 x5gUfPVQ/7WAjY7tK1lUTb/DbdmE3/2aNQ5mKjrI9nUDq/jMFcoMTgTEh9KZYaOeoI+KQ6HPleP
 XXjunErDBgxBXZlq7vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54064-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69F941D5495
X-Rspamd-Action: no action



On 2/24/2026 2:35 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
> ...
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +       struct drm_qda_gem_mmap_offset *args = data;
>> +       struct drm_gem_object *gem_obj;
>> +       int ret;
>> +
>> +       gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +       if (IS_ERR(gem_obj))
>> +               return PTR_ERR(gem_obj);
>> +
>> +       ret = drm_gem_create_mmap_offset(gem_obj);
>> +       if (ret == 0)
>> +               args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +       drm_gem_object_put(gem_obj);
>> +       return ret;
> You should probably use drm_gem_dumb_map_offset() instead of open coding this.
>
> Otherwise you allow mmap() of imported objects which is not allowed at all.
Thanks for pointing this, Christian. I'll read more about this and fix as per your suggestion.
>
> Regards,
> Christian.


