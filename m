Return-Path: <linux-media+bounces-49077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B7CCCF4E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 18:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3327230BC535
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 17:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717FA345CCD;
	Thu, 18 Dec 2025 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Y3L0rlzt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCC2D7D2A;
	Thu, 18 Dec 2025 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074030; cv=none; b=KrVVqgVhDaomT5J3viurCqu5H7ZEoNwQDt99NScAymVnB6SqXD9yK/cKb2hL6odIN03UeOe4bw2xqX6oIvKXW/3WlLcGkGxTEPBtcxI59PiWImkZ4lVrzi+7i0z/Yhi2NikwfoFLaw8WkJ0Wrqh8ILmguRG1ZpwXj8G2NYTaKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074030; c=relaxed/simple;
	bh=jyONJbw/0cIrVZMpbyyVVeYLnSbbKNv01M34w2zTEKw=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=MZeOkCrg+paiJ1SUzYzZ/BBOfBqHHkbN0JvRJnS5C2t+ni8l8PKA1sGBTRNE2sYqzQCde29LrjmP4SKuRiPiN/nZMBGh5fX50l/M4knnOHKxmGvveo0CJ0VP2nzZFC2z+lRd+Frksc6zeJBbbwJ5xL57XZS/ZM0hiaRoUBqQLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Y3L0rlzt; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDRHdk604961;
	Thu, 18 Dec 2025 15:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=f
	xCDg/MKHnjAnmYHw2JuWOHe9hJSFo/91W4J8j6Nhcs=; b=Y3L0rlztNAgUOlKOd
	+amJthsyZawmEjzH/Meg6IeW3A5yS4Dm/ZGrY4W753p9yU9qVMrVE6/yVKJus3AT
	WFZN/e1e6w7/LJ7IEvWqt43l9f6k4o7T8MNtjsto9B3jxAL6DMrr45mEYayqGXcv
	hNKfkMfD7WZs4/xo2i5YjV3L27VXciTIhQSpANrJfrTwO8yCBb0PDx90/h3CBacL
	BeauHW6UNkS3CCk0vjv5A8to0YbPAOLj+sDcu6LUTL0AUEfEsRqybUCM1ojZcuET
	fRRZmE4nRiBCMnkNPJBAIZIPFVbXnmIgVsn0gctukEr2ZxsgySklHdzXpm9w7+U7
	L++dg==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4b41p0rjhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 15:42:40 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.8.252) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:42:38 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
In-Reply-To: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>
References: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Disallow exporting of PM/FW protected
 objects
Message-ID: <176607255864.59162.15026790132663645315.b4-ty@imgtec.com>
Date: Thu, 18 Dec 2025 15:42:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=WsMm8Nfv c=1 sm=1 tr=0 ts=694420f0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=kOokcG3ghCoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=4YpX2-rxloMmsslGTpUA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEzMSBTYWx0ZWRfX7rJT4wRN7sZs
 UzGMBm/xp681y6F2icWlA/yTOYzI/djnHvF2O28qYeGZsLufFWhJRfbin7MPT2qwxdMkzmAuhhm
 VMPmYehdAXQbwARkyOsfEl0XROwe85dWNl6JN+p/umoohPMnnRaEXoiSjlm8UN4lLwYBEiUiEPd
 CWQJMQinlSm4+TQ8MdWlYHA+9EIMz3HrQZed7KzTESdv954Ym/dBuFtrmZLe+9xeuMDru4uSIpV
 tsD3fhaVcxnaF5/thTT8AaaYSssKV325gePppwgdh5Iu+d3huIwHdKNxbEUcArVvN1hjQuCjOKW
 KXdm7V9rmSTv4BAeOe2Uqdty+nB0CeBENDnCMSnrFxysgfashppWg7hS1LX1SovSGjQBMBuLjW0
 IsptEsWnpbdnEratwrZAvbyVMWn0CiruElBMowXOpFsRaJx+Fl1o0iJ48M3yCCXeFWkvutnqLwA
 2yQYA0J1XlwZ7QEvxzw==
X-Proofpoint-ORIG-GUID: xf0Erm76vroEA5vdl8oXfefc7ihb7DmX
X-Proofpoint-GUID: xf0Erm76vroEA5vdl8oXfefc7ihb7DmX


On Mon, 08 Dec 2025 09:11:00 +0000, Alessio Belle wrote:
> These objects are meant to be used by the GPU firmware or by the PM unit
> within the GPU, in which case they may contain physical addresses.
> 
> This adds a layer of protection against exposing potentially exploitable
> information outside of the driver.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Disallow exporting of PM/FW protected objects
      commit: 6b991ad8dc3abfe5720fc2e9ee96be63ae43e362

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>


