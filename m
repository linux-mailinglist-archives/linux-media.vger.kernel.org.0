Return-Path: <linux-media+bounces-63738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ck1/AXYKIWpO+gAAu9opvQ
	(envelope-from <linux-media+bounces-63738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:17:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08163CEEA
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:17:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WKiA7Lo6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BamWjvgi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63738-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63738-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECD4D30226A8
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 05:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5BE3BF665;
	Thu,  4 Jun 2026 05:17:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C4331A6E
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 05:17:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550247; cv=none; b=Qr9gR9VnUGgr/mQ1SnPWa9xEdOymAigCRUFbrOZnYibXx7nkyLQjJqrulD+CkjrBy6Ji2VGhrsXEUclQ6ArgWNoiLxAIlCxjBkz6spQBIDC45Hn1dkDu/uPILnjwcu6uIy7P3sstX6+pVt37k7mCV/FZFi3Yrn/w+C+gJfmBoPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550247; c=relaxed/simple;
	bh=bSDC8NCULjXgRLV8koD7qYS4Pp2cM1Ezaszm8DK/eDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocF+pQgX7+T5OoWkmbRUniBq9Z7ILuTlehNQJ6FPMC+eMWuqWbYdRMWpGzqz++6EbmPMDXGizvTgzRuvFVKkuWvS/JpvMwDDq5rfZVByayALMz2OGjSaWGvdzTHr7PLqckmHHDMpf2IxOzMcCbNJdyRcA65grIJsbfwCVRaxKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKiA7Lo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BamWjvgi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540o0lX313689
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 05:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjRFSiCeKBsFoWJCncYJG01Lt2ia4LM9GCm1RkkjZqM=; b=WKiA7Lo6R4RQXcRQ
	4NguGQn8xrPP51iyOSl9J8h5G0RAGAvBBCHlxz/a0eN0k8tzXLFYQJ3sFtZRJrSj
	PBd0b1hD6pmqtVymsG2lcyEgEtygiHF3I2nUVdftknitCTpw3QPqICZ9QfV0llbX
	MF9gzivwI7jCGEUWsF9a/GFKALcvZaLdmu94ksx/k+/EjsDh9vKuDvij9TaJH+j3
	1BDNGtXthZuxhf/7614Dq4DS6ImowezIjcBSSND66on9qGIbyVSd7TbZbYk2R46j
	MuCBqxtx/DWEkUVNDVglZEI249SNFHRJNUWbyWSs8tOXcgwWghKwKJFYQC0k4zbc
	9DBNtA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0rw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 05:17:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c1e08848so5319725ad.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 22:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550243; x=1781155043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjRFSiCeKBsFoWJCncYJG01Lt2ia4LM9GCm1RkkjZqM=;
        b=BamWjvgi64IyBqo+zJLV5NXRfQ/ztp6iJIQ3jM1W5LP/NhxdSOyn+aQ7LDplFYbZY1
         qqZnIudNQ/HCe48fVYl+QmKAB0E+Wh02QMuaCFlwvOjxnW5w2o3KdRC5N/kovnqWwuWL
         8BXLOF7tX/T5+GLdYtJ3uZ1vonUYiKJaOA1ELt85MY7ZD7HY6pB2EQkO+2YldjptopIu
         TDiY5/fqzael099r/KLRuIwj6F2PLy4g7SHeNbot9+iUU9EtPplv3pmFYATdsAxSn2Ma
         C1pTzhkH4fuIklWxkrRhBiuetGfEc4bH/RjoWpWvrx9FZw0rP0r7qsIY4lCeGuGJW5Xr
         5N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550243; x=1781155043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjRFSiCeKBsFoWJCncYJG01Lt2ia4LM9GCm1RkkjZqM=;
        b=ql5Q0ord27qNSZhhY+h672z97MeVNO+hxalATCA4oImBdgOafdNBj9uIScXKLhu4N/
         IqmkOF6E/COFVfHjPAALE9TO7TNbhYkAUmbDNQZWekCvfS2kg7+oMKg6aalR+V5c70WC
         bBgWgiwa2qGal4PR5eqhkx1E5weRijjCUQa8qV/Y9mqQxr+7TsttoFzibumcLSaB6un9
         BV5FVqM8zUAXUI5Ck3qYemWV2U/KmIQZllG0cVi+i/utNJBKnEqAzAwcVSiYvCSwi/47
         hl9iNRBQkDC1ImjS+TrkGincjWMtb4gqhvMSBjFoLs5JwtBtmVp4JlplfxqPJdYeCGMC
         yLTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uJGVWEu2MKKymoJLzcqIb0vpO05BLfaFKlsUuN5sDS7yRNoAhrriqXfIr4vO51DuFnE217/McWYewyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyesztpsmS1SGftnsraxS21p5NP281uW/Jjz4B72dhRdAkUAMGM
	Fmfu206pNfJ3k9f+A455KpHtSeL+aaEOgDl2mkDPtXgBrmB8KQsXTy60oguYq0CvQaV2iFyKISa
	rwRdPizuu2wKD+JLega+gy11Y2SEu0n8VvBJfYFx98nK5H6trBeOjXHA+jg0qYgmDlQ==
X-Gm-Gg: Acq92OHqa+XoZ5M12AVVHW/0xxFRUe46+luWQWAJfMC0JR0HyulOlwKsSr2ZJU2sDKK
	Z60MlRu8IxOrP06LBstFfCRmEVK5+6nFMqNxcAY8z5Imhd5WMtS+53u4328V2WMyROr4jJ5aMu1
	TLOqIsjUPKflZ8Dtuat217L2w+6o4TG/vexUl3GWOY+LcZyE2lmJ3n2D6YsTRKOtKbq+DX8bbg2
	nr6e82AT11gYgUVIinR0djES2lyoEPvIZOM7YYa1oNEbX2lGt0dvcNYInkcfCuZiBonxfx+1aFc
	Rn9sM3tf6+UbRh6Q5cu7vJ/mZQ3gfBjmR/vWn2fuMbb5/5Kkp9Co+9Op47mSsvW+MJY76Td8+iC
	BllYQJF96u2LNfDpfUP9AvJ5DtE961P6tQiEIs9fHsdN9X+fmFHMEEAwJ/YRS
X-Received: by 2002:a17:903:3c45:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2c163fa8b9fmr65640115ad.19.1780550242840;
        Wed, 03 Jun 2026 22:17:22 -0700 (PDT)
X-Received: by 2002:a17:903:3c45:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2c163fa8b9fmr65639565ad.19.1780550242253;
        Wed, 03 Jun 2026 22:17:22 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm56330175ad.78.2026.06.03.22.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 22:17:21 -0700 (PDT)
Message-ID: <568987b0-6f54-4b51-b1c0-416435e3f564@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 10:47:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] accel/qda: Add DSP process creation and release
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
 <20260519-qda-series-v1-13-b2d984c297f8@oss.qualcomm.com>
 <w44qzw2ryg7bpbte3hegopmtkfjd2gby532rdjarm4i3tylpv2@2rmruincfdgc>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <w44qzw2ryg7bpbte3hegopmtkfjd2gby532rdjarm4i3tylpv2@2rmruincfdgc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA0OCBTYWx0ZWRfX1fFVGVzn8V3+
 n6volNPUlsPikWYacjrtHLd/unzlK7U9j+KRnZpQ97UoIJS/rFFh/k6keqVpvg8YpWa2Q3yobR5
 AwzMFTRcyFmml++NaXOcw2Qt4LIL9NorEQTQkAcDY0qd9W4Vh8ruTfdoRQ0zJmz3ekMZ3GAB/ii
 0mZHybxMNNVNOuYTyokpSA6GuENbm0Dn9pli8IvV11qu0USfsX0mNUCOsPD/bjeNYHENKduepM8
 /Xux2SdRU6bZsLQMKY7OIw65ZHL422hO+Hgzxi/tm1OAbW4N2AAVvXdlSCu0xiK1vMovTSHtLUA
 04bw0FHHfreVrRpQMpnokVUMSJpSwQth2sxxQk/xDWYVlRX9Y84Qn3VmupvssUi5gj+OHqQrvJv
 wHyW91u+MuoiD1Y7xNMJVMHtJ6Ji5xAJqdMqegA7sfH/D+gB4jZWoOjjFba2LviaGGAzdwAEMwU
 +ySkxBkhxJ7omjVJErQ==
X-Proofpoint-ORIG-GUID: 8M_xZiqDTfC2xFLhIpQAdEdzyMj0RA1o
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210a64 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=asIQMUHu0qG-B1vOHVIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8M_xZiqDTfC2xFLhIpQAdEdzyMj0RA1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63738-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5A08163CEEA

On 20-05-2026 19:30, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:46:03AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Implement the REMOTE_SESSION_CREATE and INIT_RELEASE FastRPC
>> operations, which establish and tear down a user process on the
>> DSP.
>>
>> DRM_IOCTL_QDA_REMOTE_SESSION_CREATE (drm_qda_init_create)
>>   Creates a new process on the DSP by sending an INIT_CREATE message
>>   via the FastRPC INIT_HANDLE. The caller provides an ELF file (via
>>   DMA-BUF fd or direct pointer) and optional process attributes. A
>>   4 MB GEM buffer is allocated per session to hold the DSP process
>>   image; this buffer is stored in qda_file_priv and reused for the
>>   lifetime of the session.
>>
>>   If attrs is non-zero, INIT_CREATE_ATTR is used instead of
>>   INIT_CREATE to pass the extended attribute and signature fields.
> 
> What is the difference?
This attaches attributes with the PD that is being created, I'll add
more details>
>>
>> INIT_RELEASE
>>   Sends a release message to the DSP when the DRM file is closed
>>   (qda_postclose via qda_release_dsp_process), freeing the remote
>>   process and its resources. The release is skipped if the device
>>   has already been unplugged.
>>
>> qda_fastrpc.c
>>   fastrpc_prepare_args_init_create() marshals the six-argument
>>   create-process payload: the inbuf descriptor, process name,
>>   ELF file, physical pages, attrs, and siglen.
>>   fastrpc_prepare_args_release_process() marshals the single-
>>   argument release payload (remote_session_id).
>>
>> qda_drv.c
>>   qda_postclose() is extended to call qda_release_dsp_process()
>>   under drm_dev_enter() so the release message is only sent while
>>   the device is still accessible.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c     |   8 +++
>>  drivers/accel/qda/qda_drv.h     |   5 ++
>>  drivers/accel/qda/qda_fastrpc.c | 140 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  39 +++++++++--
>>  drivers/accel/qda/qda_ioctl.c   |  52 +++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h   |   1 +
>>  include/uapi/drm/qda_accel.h    |  32 ++++++++-
>>  7 files changed, 270 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 704c7d3127d2..4eaba9b050c0 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -36,6 +36,13 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
>>  static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>>  {
>>  	struct qda_file_priv *qda_file_priv = file->driver_priv;
>> +	int idx;
>> +
>> +	/* Only send the DSP release message while the device is accessible */
>> +	if (drm_dev_enter(dev, &idx)) {
>> +		qda_release_dsp_process(qda_file_priv->qda_dev, file);
>> +		drm_dev_exit(idx);
>> +	}
>>  
>>  	if (qda_file_priv->assigned_iommu_dev) {
>>  		struct qda_iommu_device *iommu_dev = qda_file_priv->assigned_iommu_dev;
>> @@ -59,6 +66,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>>  	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>>  	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
> 
> Why is it being added in the middle?
no specific reason, I'll correct this.>
>>  	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
>>  };
>>  
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index 420cccff42bf..4b4639961d95 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -28,6 +28,8 @@ struct qda_file_priv {
>>  	struct qda_dev *qda_dev;
>>  	/** @assigned_iommu_dev: IOMMU device assigned to this process */
>>  	struct qda_iommu_device *assigned_iommu_dev;
>> +	/** @init_mem_gem_obj: GEM object for PD initialization memory */
>> +	struct qda_gem_obj *init_mem_gem_obj;
>>  	/** @pid: Process ID for tracking */
>>  	pid_t pid;
>>  	/** @remote_session_id: Unique session identifier */
>> @@ -83,4 +85,7 @@ void qda_deinit_device(struct qda_dev *qdev);
>>  int qda_register_device(struct qda_dev *qdev);
>>  void qda_unregister_device(struct qda_dev *qdev);
>>  
>> +/* DSP process / protection domain management */
>> +int qda_release_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
>> +
>>  #endif /* __QDA_DRV_H__ */
>> diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
>> index 0ec37175a098..305915022b91 100644
>> --- a/drivers/accel/qda/qda_fastrpc.c
>> +++ b/drivers/accel/qda/qda_fastrpc.c
>> @@ -524,6 +524,138 @@ int qda_fastrpc_invoke_unpack(struct fastrpc_invoke_context *ctx,
>>  	return err;
>>  }
>>  
>> +static void setup_create_process_args(struct drm_qda_fastrpc_invoke_args *args,
>> +				      struct fastrpc_create_process_inbuf *inbuf,
>> +				      struct drm_qda_init_create *init,
>> +				      struct fastrpc_phy_page *pages)
>> +{
>> +	args[0].ptr = (u64)(uintptr_t)inbuf;
>> +	args[0].length = sizeof(*inbuf);
>> +	args[0].fd = -1;
>> +
>> +	args[1].ptr = (u64)(uintptr_t)current->comm;
>> +	args[1].length = inbuf->namelen;
>> +	args[1].fd = -1;
>> +
>> +	args[2].ptr = (u64)init->file;
>> +	args[2].length = inbuf->filelen;
>> +	args[2].fd = init->filefd;	/* DMA-BUF fd forwarded to DSP */
>> +
>> +	args[3].ptr = (u64)(uintptr_t)pages;
>> +	args[3].length = 1 * sizeof(*pages);
>> +	args[3].fd = -1;
>> +
>> +	args[4].ptr = (u64)(uintptr_t)&inbuf->attrs;
>> +	args[4].length = sizeof(inbuf->attrs);
>> +	args[4].fd = -1;
>> +
>> +	args[5].ptr = (u64)(uintptr_t)&inbuf->siglen;
>> +	args[5].length = sizeof(inbuf->siglen);
>> +	args[5].fd = -1;
>> +}
>> +
>> +static void setup_single_arg(struct drm_qda_fastrpc_invoke_args *args, const void *ptr, size_t size)
>> +{
>> +	args[0].ptr = (u64)(uintptr_t)ptr;
>> +	args[0].length = size;
>> +	args[0].fd = -1;
>> +}
>> +
>> +static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *ctx)
>> +{
>> +	struct drm_qda_fastrpc_invoke_args *args;
>> +
>> +	args = kzalloc_obj(*args);
>> +	if (!args)
>> +		return -ENOMEM;
>> +
>> +	setup_single_arg(args, &ctx->remote_session_id, sizeof(ctx->remote_session_id));
>> +	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>> +	ctx->args = args;
>> +	ctx->handle = FASTRPC_INIT_HANDLE;
>> +
>> +	return 0;
>> +}
>> +
>> +static int fastrpc_prepare_args_init_create(struct fastrpc_invoke_context *ctx,
>> +					    char __user *argp)
>> +{
>> +	struct drm_qda_init_create init;
>> +	struct drm_qda_fastrpc_invoke_args *args;
>> +	struct fastrpc_create_process_inbuf *inbuf;
>> +	int err;
>> +	u32 sc;
>> +
>> +	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>> +	if (!args)
>> +		return -ENOMEM;
>> +
>> +	ctx->input_pages = kcalloc(1, sizeof(*ctx->input_pages), GFP_KERNEL);
>> +	if (!ctx->input_pages) {
>> +		err = -ENOMEM;
>> +		goto err_free_args;
>> +	}
>> +
>> +	ctx->inbuf = kcalloc(1, sizeof(*inbuf), GFP_KERNEL);
>> +	if (!ctx->inbuf) {
>> +		err = -ENOMEM;
>> +		goto err_free_input_pages;
>> +	}
>> +	inbuf = ctx->inbuf;
>> +
>> +	memcpy(&init, argp, sizeof(init));
>> +
>> +	if (init.filelen > FASTRPC_INIT_FILELEN_MAX) {
>> +		err = -EINVAL;
>> +		goto err_free_inbuf;
>> +	}
>> +
>> +	/*
>> +	 * Validate that the DMA-BUF fd is importable.  The fd itself is kept
>> +	 * in init.filefd and forwarded to the DSP via setup_create_process_args().
>> +	 */
>> +	if (init.filelen && init.filefd > 0) {
>> +		struct drm_gem_object *file_gem_obj;
>> +
>> +		err = get_gem_obj_from_dmabuf_fd(ctx, init.filefd, &file_gem_obj);
>> +		if (err) {
>> +			err = -EINVAL;
>> +			goto err_free_inbuf;
>> +		}
>> +		drm_gem_object_put(file_gem_obj);
>> +	}
>> +
>> +	inbuf->remote_session_id = ctx->remote_session_id;
>> +	inbuf->namelen = strlen(current->comm) + 1;
>> +	inbuf->filelen = init.filelen;
>> +	inbuf->pageslen = 1;
>> +	inbuf->attrs = init.attrs;
>> +	inbuf->siglen = init.siglen;
>> +
>> +	setup_pages_from_gem_obj(ctx->init_mem_gem_obj, &ctx->input_pages[0]);
>> +
>> +	setup_create_process_args(args, inbuf, &init, ctx->input_pages);
>> +
>> +	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>> +	if (init.attrs)
>> +		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
>> +	ctx->sc = sc;
>> +	ctx->args = args;
>> +	ctx->handle = FASTRPC_INIT_HANDLE;
>> +
>> +	return 0;
>> +
>> +err_free_inbuf:
>> +	kfree(ctx->inbuf);
>> +	ctx->inbuf = NULL;
>> +err_free_input_pages:
>> +	kfree(ctx->input_pages);
>> +	ctx->input_pages = NULL;
>> +err_free_args:
>> +	kfree(args);
>> +	return err;
>> +}
>> +
>>  static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
>>  {
>>  	struct drm_qda_invoke_args invoke_args;
>> @@ -568,6 +700,14 @@ int qda_fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *ar
>>  	int err;
>>  
>>  	switch (ctx->type) {
>> +	case FASTRPC_RMID_INIT_RELEASE:
>> +		err = fastrpc_prepare_args_release_process(ctx);
>> +		break;
>> +	case FASTRPC_RMID_INIT_CREATE:
>> +	case FASTRPC_RMID_INIT_CREATE_ATTR:
>> +		ctx->pd = QDA_USER_PD;
>> +		err = fastrpc_prepare_args_init_create(ctx, argp);
>> +		break;
>>  	case FASTRPC_RMID_INVOKE_DYNAMIC:
>>  		err = fastrpc_prepare_args_invoke(ctx, argp);
>>  		break;
>> diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
>> index ce77baeccfba..1c1236f9525e 100644
>> --- a/drivers/accel/qda/qda_fastrpc.h
>> +++ b/drivers/accel/qda/qda_fastrpc.h
>> @@ -127,6 +127,27 @@ struct fastrpc_invoke_buf {
>>  	u32 pgidx;
>>  };
>>  
>> +/**
>> + * struct fastrpc_create_process_inbuf - Input buffer for process creation
>> + *
>> + * This structure defines the input buffer format for creating a new
>> + * process on the remote DSP.
>> + */
>> +struct fastrpc_create_process_inbuf {
>> +	/** @remote_session_id: Client identifier for the session */
>> +	int remote_session_id;
>> +	/** @namelen: Length of the process name string including NUL terminator */
>> +	u32 namelen;
>> +	/** @filelen: Length of the ELF shell file in bytes */
>> +	u32 filelen;
>> +	/** @pageslen: Number of physical page descriptors */
>> +	u32 pageslen;
>> +	/** @attrs: Process attribute flags */
>> +	u32 attrs;
>> +	/** @siglen: Length of the signature data in bytes */
>> +	u32 siglen;
>> +};
>> +
>>  /**
>>   * struct fastrpc_msg - FastRPC wire message for remote invocations
>>   *
>> @@ -153,10 +174,6 @@ struct fastrpc_msg {
>>  
>>  /**
>>   * struct qda_msg - FastRPC message with kernel-internal bookkeeping
>> - *
>> - * The wire-format portion is kept in the embedded @fastrpc member (must
>> - * be first) so that &qda_msg->fastrpc can be passed directly to
>> - * rpmsg_send() without a copy.
>>   */
>>  struct qda_msg {
>>  	/**
>> @@ -245,7 +262,7 @@ struct fastrpc_invoke_context {
>>  	struct qda_gem_obj *msg_gem_obj;
>>  	/** @file_priv: DRM file private data */
>>  	struct drm_file *file_priv;
>> -	/** @init_mem_gem_obj: GEM object for protection domain init memory */
>> +	/** @init_mem_gem_obj: GEM object for PD initialization memory */
>>  	struct qda_gem_obj *init_mem_gem_obj;
>>  	/** @req: Pointer to kernel-internal request buffer */
>>  	void *req;
>> @@ -256,11 +273,23 @@ struct fastrpc_invoke_context {
>>  };
>>  
>>  /* Remote Method ID table - identifies initialization and control operations */
>> +#define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP process */
>> +#define FASTRPC_RMID_INIT_CREATE	6	/* Create DSP process */
>> +#define FASTRPC_RMID_INIT_CREATE_ATTR	7	/* Create DSP process with attributes */
>>  #define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
>>  
>>  /* Common handle for initialization operations */
>>  #define FASTRPC_INIT_HANDLE		0x1
>>  
>> +/* Protection Domain (PD) identifiers */
>> +#define QDA_ROOT_PD		(0)
>> +#define QDA_USER_PD		(1)
>> +
>> +/* Number of arguments for process creation */
>> +#define FASTRPC_CREATE_PROCESS_NARGS	6
>> +/* Maximum initialization file size (4 MB) */
>> +#define FASTRPC_INIT_FILELEN_MAX	(4 * 1024 * 1024)
>> +
>>  void qda_fastrpc_context_free(struct kref *ref);
>>  struct fastrpc_invoke_context *qda_fastrpc_context_alloc(void);
>>  int qda_fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp);
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> index c81268c20b04..33f0a798ad13 100644
>> --- a/drivers/accel/qda/qda_ioctl.c
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -109,6 +109,7 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
>>  	struct drm_gem_object *gem_obj;
>>  	int err;
>>  	size_t hdr_size;
>> +	size_t initmem_size = FASTRPC_INIT_FILELEN_MAX;
>>  
>>  	ctx = qda_fastrpc_context_alloc();
>>  	if (IS_ERR(ctx))
>> @@ -124,6 +125,27 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
>>  	ctx->file_priv = file_priv;
>>  	ctx->remote_session_id = qda_file_priv->remote_session_id;
>>  
>> +	if (type == FASTRPC_RMID_INIT_CREATE) {
>> +		struct drm_gem_object *initmem_gem_obj;
>> +
>> +		if (qda_file_priv->init_mem_gem_obj) {
> 
> Why is it non-NULL here?
I had added this check in case the init failed earlier and there is a
retry for the same, but now I see it's not correct and should be handled
in the error path. I'll fix this.>
>> +			drm_gem_object_put(&qda_file_priv->init_mem_gem_obj->base);
>> +			qda_file_priv->init_mem_gem_obj = NULL;
>> +		}
>> +
>> +		initmem_gem_obj = qda_gem_create_object(dev, qdev->iommu_mgr,
>> +							initmem_size, file_priv);
>> +		if (IS_ERR(initmem_gem_obj)) {
>> +			err = PTR_ERR(initmem_gem_obj);
>> +			goto err_context_free;
>> +		}
>> +
>> +		ctx->init_mem_gem_obj = to_qda_gem_obj(initmem_gem_obj);
>> +		qda_file_priv->init_mem_gem_obj = ctx->init_mem_gem_obj;
>> +	} else if (type == FASTRPC_RMID_INIT_RELEASE) {
>> +		ctx->init_mem_gem_obj = qda_file_priv->init_mem_gem_obj;
>> +	}
>> +
>>  	err = qda_fastrpc_prepare_args(ctx, (char __user *)data);
>>  	if (err)
>>  		goto err_context_free;
>> @@ -161,11 +183,41 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
>>  	return 0;
>>  
>>  err_context_free:
>> +	if (type == FASTRPC_RMID_INIT_RELEASE && !err && qda_file_priv->init_mem_gem_obj) {
>> +		drm_gem_object_put(&qda_file_priv->init_mem_gem_obj->base);
>> +		qda_file_priv->init_mem_gem_obj = NULL;
>> +	}
>> +
>>  	fastrpc_context_put_id(ctx, qdev);
>>  	kref_put(&ctx->refcount, qda_fastrpc_context_free);
>>  	return err;
>>  }
>>  
>> +/**
>> + * qda_ioctl_init_create() - Create a DSP process
>> + * @dev: DRM device structure
>> + * @data: User-space data (struct drm_qda_init_create)
>> + * @file_priv: DRM file private data
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
> 
> Where is INIT_CREATE_ATTR, which you described earlier?
INIT_CREATE_ATTR is used while `sc` creation so the DSP considers the
request is coming with some attributes, the ioctl functions are going to
be the same in both the cases, so keeping it unchanged and the decision
is taken while `sc` is getting created.>
>> +}
>> +
>> +/**
>> + * qda_release_dsp_process() - Release DSP process resources for a file
>> + * @qdev: QDA device structure
>> + * @file_priv: DRM file private data
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_release_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv)
>> +{
>> +	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, &qdev->drm_dev, NULL, file_priv);
>> +}
>> +
>>  /**
>>   * qda_ioctl_invoke() - Perform a dynamic FastRPC method invocation
>>   * @dev: DRM device structure
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> index 3bb9cfd98370..192565434363 100644
>> --- a/drivers/accel/qda/qda_ioctl.h
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -9,6 +9,7 @@
>>  #include "qda_drv.h"
>>  
>>  int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>  int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>  int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
>>  int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> index 72512213741f..711e2523a570 100644
>> --- a/include/uapi/drm/qda_accel.h
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -21,8 +21,9 @@ extern "C" {
>>  #define DRM_QDA_QUERY		0x00
>>  #define DRM_QDA_GEM_CREATE		0x01
>>  #define DRM_QDA_GEM_MMAP_OFFSET	0x02
>> -/* Command numbers 0x03-0x06 reserved for INIT_ATTACH, INIT_CREATE, MAP, MUNMAP */
>> -#define DRM_QDA_REMOTE_INVOKE		0x07
>> +/* Command number 0x03 reserved for INIT_ATTACH; 0x05-0x06 reserved for MAP, MUNMAP */
>> +#define DRM_QDA_REMOTE_SESSION_CREATE		0x04
>> +#define DRM_QDA_REMOTE_INVOKE			0x07
>>  
>>  /*
>>   * QDA IOCTL definitions
>> @@ -37,6 +38,9 @@ extern "C" {
>>  					  struct drm_qda_gem_create)
>>  #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>>  					  struct drm_qda_gem_mmap_offset)
>> +#define DRM_IOCTL_QDA_REMOTE_SESSION_CREATE					\
>> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_CREATE,		\
>> +		 struct drm_qda_init_create)
>>  #define DRM_IOCTL_QDA_REMOTE_INVOKE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_INVOKE, \
>>  					  struct drm_qda_invoke_args)
>>  
>> @@ -99,6 +103,30 @@ struct drm_qda_fastrpc_invoke_args {
>>  	__u32 attr;
>>  };
>>  
>> +/**
>> + * struct drm_qda_init_create - Accelerator process initialization parameters
>> + * @filelen: Length of the ELF file in bytes
>> + * @filefd: DMA-BUF file descriptor containing the ELF file
>> + * @attrs: Process attributes flags
>> + * @siglen: Length of signature data in bytes
>> + * @file: Pointer to ELF file data if not using filefd
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_INIT_CREATE to initialize
>> + * a new process on the accelerator. The process code is provided either
>> + * via a file descriptor (filefd, typically a GEM object) or a direct
>> + * pointer (file). Set file to 0 if using filefd.
>> + *
>> + * The attrs field contains bit flags for debug mode, privileged execution,
>> + * and other process attributes.
>> + */
>> +struct drm_qda_init_create {
>> +	__u32 filelen;
>> +	__s32 filefd;
>> +	__u32 attrs;
>> +	__u32 siglen;
>> +	__u64 file;
>> +};
>> +
>>  /**
>>   * struct drm_qda_invoke_args - Dynamic FastRPC invocation parameters
>>   * @handle: Remote handle to invoke on the DSP
>>
>> -- 
>> 2.34.1
>>
>>
> 


