Return-Path: <linux-media+bounces-53258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIsiKgYcnWmPMwQAu9opvQ
	(envelope-from <linux-media+bounces-53258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 04:33:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877E181678
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 04:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9456B30484F7
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 03:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3454726B755;
	Tue, 24 Feb 2026 03:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpsmBFFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNduJN2p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E43EBF17
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771903996; cv=none; b=YaAJFCox2U37LpWGQU05sPRUY4UEhOVScbXDcQVe63ZSzzsunNWTZXtp0EIERuOTAssdn4BVZ8y6uCrhSemb4+s5zeC4sxwlmYBnoLD2B/y1mxVVbUPYuXVfw8jhW48jJX+ruF+sh1/xMPJ08lkQpubKIlm4STMa6BPa9Vha7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771903996; c=relaxed/simple;
	bh=alwlXydTZQTHU+SrbhxPkAVBaJ0ViLt6EMzcXAEspXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnEp/b+XEX7kYhg5nTxVDkBWu2Fs36dwIRzfm3uefOyJ7WiBtcxWNZJonCpiqvnBlpgATLBBswyt+d8yBrpBoysUCO6u+brPasb0ijEgswlXjTgo+mhLaJQswie2s9uzhrTzHuem/i0U9wyBpWro21VfoyK3GFBlyec8mUu5S1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpsmBFFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNduJN2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3Kp4I1396472
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 03:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=; b=MpsmBFFfOVHfn/pk
	Gg4QcxaaZhK4U4eeUQBi7urMNKOvTDwSza1oS2UzSLIHLFy6kA7W7NleuM4sn6pl
	M4x4z6TjyHPZgg4ou/d8h8DibM3bcqEdiwQu0FeW7LgGxLih+lLSrErJxFh5rbzX
	joWxCc85TVP2OaJiKwZxzYkKcrm6kl8YijJF6ZMr0v7LH8HP2qqM6Z0p5yvz6YbR
	XjQe9GyKv84EeXPKNaDjKC9RSLpcMfINW3laTZ+VfF97K/O+0n8fHtp5xtJi4egN
	BJECOTqR8p85DNs0EfpaZlyZzaGKFuO8gdAkbKig/BVcURryr6jTJC7DzqVx83T0
	W1ob0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx09k0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 03:33:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so3840748eec.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771903994; x=1772508794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
        b=kNduJN2piySqJTsIrsTMpdTiJaI6B/J7hYurgu9hLrqYQF0OoTJTnsUWe15cFyFWhl
         gFEViEMqiNyJ4LpPTgUavfwUJbBj3HRKEzfxWvw1XNgdUaLw0kKeKf1yMK4AgjMUpsK8
         egIa8T9fWOz6a8Jf3raNro4JLZWeykiCgMUyjFTTNQRmvH2NjrbN2ka6VW2kC/2lqhBb
         Gqe7StgDHok/1VBNns4+GpNi05KyUSj8JBFwciPznYc5guB+ztF4T6n7+VwEHpPsiqRq
         ++VO8rcvQMdLWqwyUKjOkFPUGrmIfK3iQq8OQMeVG7zU0sWzr1zb4gcXRxW4DcKaoPeh
         C89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903994; x=1772508794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
        b=tEX8K1tqNCVaBlEeWFiSujQ0CHVYJo5/Iil5VcEC0mtccluqLxzEkn3IpLBdMHWgZw
         YjqVpYVvXSex2iA8oD1cXw8Pmui+IkfsV1rUUPnSTmekk+e2KHQpag+dQL95/aMO+tD+
         LQDO5d3grMNDHYLmvoD045FlTEIG+J0l1EdByXNh/JyINTPe8JDMAMMyaw0clpGPu6JK
         3EftGvoalFiaC4qKvwrVZZ0hl80IqIKdD+X1g5UgJSLE2lA/alhPjRQ03dqU4GpL3CYt
         q1YUwJSiKTi3l+aVm0SQehuKSl2vdOpbaBa9p7iGqux9nDljMYjrTh0tm7Zf6SKPajPI
         dxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd0Ica8oJiwAcRZSQSXpLTvvpPHlT60DvJA+C8f8LQnZeP7sljgSOZ5RqvmmsQp88DEmKs5embQ2wzkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeREZqZvhyok8GT86zRn3N+XOEmGwGINCHtDMx1ILF58Xx6rJb
	VyYdvEoFbObPponu3FkOWRNj02Yygf9LaSJhi1Wq5cV1ZsA3UOtT0eSxwVfT0NUBCetco7TBQaN
	Uy2Fx9LMhyj8X1Eha9jXOGu/BX9L01lBxMFkxS00UmzuaBBChmmDEYr/QbWFOsAwGUg==
X-Gm-Gg: AZuq6aJWjzf9jRhMqtQIDS0JYxNGY5vlz05mwWjs27Ck9hs7dwi//9iQzVXVbvo3G8U
	usOHNIUlwFf4AAf8E1Kcxl6RUa5pLe7SpxdpX8WrkZE8aZsbKZZMk/0sScA4678Cac8NDVY9rXb
	LXsxTPdLcv6XdV/XyoEF2+zznwblcojM/aXCW+2pkygfQavQstLhWTS7ebWDsehjf8Az6tDw4+H
	1sRA8SGcAG5ByEFNTFgO8dc5HU+V2owlaBWNHiMQwZ3GbHxV95axRRAatOCMYkPcZNRxaTpg7te
	yC8BV8g3RJPIqVMnxpITBBGvKZ7tJIYBsxCrCLuOQSY2Y1m/bg1X3YxkHPmUHpb4BBkj58eqIx3
	DBn8HgfQ5oIJV3Z0NJq149ODhEjeI3EBalYzD57AKzi04ZkROChsaPpM=
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr3365893c88.23.1771903994055;
        Mon, 23 Feb 2026 19:33:14 -0800 (PST)
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr3365882c88.23.1771903993530;
        Mon, 23 Feb 2026 19:33:13 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm10325680c88.6.2026.02.23.19.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 19:33:12 -0800 (PST)
Message-ID: <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:33:10 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tim0YrS5McQkxMS-Taj4QLOL-n0wJbea
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d1bfa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=88Pab4rnIKjo3RbOS5oA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Tim0YrS5McQkxMS-Taj4QLOL-n0wJbea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOCBTYWx0ZWRfX0i7z4OvX6AOr
 kDEG80yC53nSh+53noeqUU7H2zjgf3blOSrzRUC0K7OVZEBldYUyM5ibDmHC7RgEhv9/wXK2yzo
 6k6TLXX6/0cAoP8bOMHZjUedroPaIKNZv5muyaTk8KGSSS37nGOMOJy4YGzmTuq/BgGBccQ9YFv
 1Tcd11T/5ekniFpihNq2Xn6SKjUIDNrSd8bD2562uJ3VrGJMvgXMFkvdPcu8SNSjpsJANbsSVMT
 ohu5i3/H8nBOeAa6Q8UpxwXBxaN+KZWpwFxXKSlQItK3JN2f2fco83d5Y0e6RqsqzLVcxGpxD22
 QFLP65pJ+7RH/UnDIt6Asu3tLefDx704+IrByofj9VDSbPYMexEnljVRP6UBABoixEAf0enHd2h
 Xlgf0ULCRo1mtUekEfoYFh7J+EsGWJSI3PxKNjfBswXociunVu2jQGxmsb6EJRTXJe2pI+bL6Y3
 VnE1cfPvXdfIPcyPUHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53258-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0877E181678
X-Rspamd-Action: no action

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.

So existing applications written over character device UAPI needs to be
rewritten over new UAPI and it will be broken once this driver gets
merged? Are we going to keep both the drivers in the Linux kernel
and not deprecate the /char device one? 

Is Qualcomm going to provide the wrapper library in the userspace
so that existing applications by our customers and developers
keep working w/ the newer kernel if the char interface based
driver gets deprecated? It is not clear from your text above. 

---Trilok Soni

