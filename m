Return-Path: <linux-media+bounces-58219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH6IO2Uv1mlZBwgAu9opvQ
	(envelope-from <linux-media+bounces-58219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:35:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBB3BA9C6
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 12:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99806301533F
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 10:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4315C3AE719;
	Wed,  8 Apr 2026 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="v0dGvejY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6631D37C929;
	Wed,  8 Apr 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644423; cv=none; b=HzU6I2eDe56WUu1GRc2+LsduP+AKkAhoGj9hCegI645AIFw49Ian7AfkiP2K1yxkssm0jRIdXs7wy1bh37h/k0aWKO4Ok0t4dQ8b8HYZr1SNOI0hzZ16euUicqr2ZesoAL2x96XBih9lxaA+hXPpuEPm42/1o1bbQ4LyhfWzXxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644423; c=relaxed/simple;
	bh=2xCwmwcBGgcIhZc8BW5ejsoW569ZAMP4U39Xk7sun3M=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=FZT6+10GPL6/yDaXvR8+kMEFg0CmTywzqU3HCSBSGKDXZqPwDCWGRXFDa6HdXInCu6ximLdFVQurJJ/aI/VE+WPHjjF4+eAtevCyb1wt0IRZMTXPgveYl5vIydPRQHlKs0MXvvFxqGxVbRzWa+l9+zbBJ8v1817cApo8inb0dkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=v0dGvejY; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385eBuw2995154;
	Wed, 8 Apr 2026 11:33:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=Y
	RbIUfy7PDUjzpSHaVbdZAuNWadSqt0BWYZ64+s6FzA=; b=v0dGvejY1qOLi4OWX
	cSd8OYKCKN5epd3EIE+jSol+If6RExyox0ntJaT9DgWfxFpfbmvKfk73L/bQDNKf
	sA48anNK2CaLzgXR4Z8XUDeALOEw08iIXfNMBL/oYWQyu+dkbQYRh2MSAth1z27d
	IESyxiozXQeKIombfglswcVgXVCnwmg7YviHcMUw2//n0S+qwLaWreQ1Y55xpOdO
	ceUMNds3TrKZN3Q3dB7Km9G8gR0OIBeNpn8l/4xyf7QvIK69hH97jiApPibjuhAI
	oMlV0FcUPmFVA9rzRIsLnnAQXcRL9ef9FSf3xAYR3b+Y4i0v3kkYY9HPINzOHrjU
	H2jpQ==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4dd4s2gs5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 11:33:03 +0100 (BST)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL02.hh.imgtec.org
 (10.100.10.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Apr
 2026 11:33:02 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.178) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 11:33:02 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Brajesh Gupta
	<brajesh.gupta@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alessio Belle <alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <stable@vger.kernel.org>
In-Reply-To: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
References: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
Subject: Re: [PATCH 0/8] drm/imagination: Job submission fixes and cleanup
Message-ID: <177564438213.82099.271553295476946768.b4-ty@b4>
Date: Wed, 8 Apr 2026 11:33:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: _TMcyOQ8vC78jZMMA64wGo11iNMJ4oFu
X-Authority-Analysis: v=2.4 cv=cL/QdFeN c=1 sm=1 tr=0 ts=69d62edf cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vO48zYV2LvQA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=TDz46OUBVoeO_pJfSP8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: _TMcyOQ8vC78jZMMA64wGo11iNMJ4oFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5NyBTYWx0ZWRfX/eQQBFVBZg2E
 Ol7j9k4HU3URWdMzOVwSOImzIkGBeYxlGqzExnLAasSyRg/51K4G5pLUuiuri0pu1HpawO4x1KI
 G+P+zkm9OAwZwpYAGtSi78AT9wmrPRrMjLQQRE9lMi3wYAUcJToHanw0t8vduYtwfso9mvHULNu
 m5HjA9ISZkKQKT2hKV9reG8Fl2jRI64qTa2EUWqEDqTZDIBLUj4edSfev+lEzljuBTe0MwXLi2z
 gmYxh1NhVdu1n0GqodK176OBD8IFLEGsczmNJPDngu2ZhFwrk3oQvrkfWk6optu263lnp3KVQt6
 aMAjI5ktnBDJdDHXSyxg1FZAV/NpgrRhcr8WWNSOXXi9TdVPqsSJvmUkuYEfXQdZLbqbGDvxB2I
 W7zpm1oxzvLI1oJ40oh3NoQ/IPFyZ0lo9DMxPoc7Nik6NIMUVbdoqPyfuK5nz+C0CeC/Ik9f3Hp
 MpRDyJ38fg6uOCpHtxA==
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58219-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,imgtec.com:dkim,imgtec.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[imgtec.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2DBB3BA9C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 08:56:35 +0100, Alessio Belle wrote:
> The first two commits fix rare bugs and should be backported to stable
> branches.
> 
> The rest is an attempt to cleanup and document the code to make it
> a bit easier to understand.
> 
> 
> [...]

Applied, thanks!

[1/8] drm/imagination: Count paired job fence as dependency in prepare_job()
      commit: 9cd74f935306cd857f46686975c43383e1d95f94
[2/8] drm/imagination: Fit paired fragment job in the correct CCCB
      commit: 4baf9e70cb756d78dd56419f8baee2978a72d0c3
[3/8] drm/imagination: Skip check on paired job fence during job submission
      commit: 18998b3cb7595850b8b2da55adb3fdc7aef8bc22
[4/8] drm/imagination: Rename pvr_queue_fence_is_ufo_backed() to reflect usage
      commit: c162e655092de8de2e0f7776d72919dd5e3b84f2
[5/8] drm/imagination: Rename fence returned by pvr_queue_job_arm()
      commit: 5dae1a21f1e7128a19c68212422383f700699d01
[6/8] drm/imagination: Move repeated job fence check to its own function
      commit: 402562e60c6c1b15ee359ba7ffed907baa886a99
[7/8] drm/imagination: Update check to skip prepare_job() for fragment jobs
      commit: 5c81eb2970133ad073214eb1e5b0c34a1ae793eb
[8/8] drm/imagination: Minor improvements to job submission code documentation
      commit: 62a36c2da774800bef893bc4bf8922fb9c07c1d0

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>


