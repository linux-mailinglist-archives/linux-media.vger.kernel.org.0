Return-Path: <linux-media+bounces-18197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE397693F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 14:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFCBB28478B
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6B91A704B;
	Thu, 12 Sep 2024 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Nlf+ARJf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932519F42D;
	Thu, 12 Sep 2024 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144598; cv=none; b=Luuvlwn5VgyFQZFRqDf7dJrhTDsJUWvhDZqnTbPBhg1dqMJvrsNxtOMFrUXks/uJwef8grkLcne+2L2mlSmvWjN3+dpSAtGmy1SU+asY5TLdUVknuMp0bTdSwYZA3SMVEMS1Yn0pxFqUCqyvTbynYApUUjlerT/BZZiNPdaT5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144598; c=relaxed/simple;
	bh=e0+ULRJe/0UPjAGbqFTaPDEPJA7zDqYn2Tg68Qzn/vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cOpclnd5fqxqdVSc4n+j2JFELZreESlgcQ9rjnTFHCGWBEtUjSvJvnj2/ZAGK6L6n1VxAiWitWN8CV0Lee2wtX7gycAKutQbtV0A0w6w7su8zjnlCAUgQQB9ZHi33RhxvB5RaskDyomFncJ/vqpcgjSx5jU2YDOURn3/2DjJ49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Nlf+ARJf; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C9XnPZ002414;
	Thu, 12 Sep 2024 14:36:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ycOodbDvrhisx/5OptdgsTR2uHOjLnY6oXa5ZUn9Ewk=; b=Nlf+ARJfan7qvNcb
	wKVmVHjIjlPE/OfQkt/x0tPUVrVc01CZD/nD1x/z0K88NJB9IYu2B8bexiQhqytm
	apcdr+HAidJPid4giMBZlfsI++fIwgMAuho4nBq+6zEgLbzDOtisqTKe7eQcxELO
	SZl4MGZ63X/LuKq4Jd4BeftUCAhgXiJfND07sGHUGTPRm/50dozk48ZQuTs0Pb69
	ed0ZLdHeQVTosEIK7b3Ua9bPY6Zq6MoGRAU3IOEsuf3KFKhttMFzexx+GcbBjNoL
	Ea54M6iiPL/gZok/R137I9XT7v5pSw2DPq/zrMOqbizMXUyAfLSSnyA7VoO2wDpO
	8Vyydg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gyaakyu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 14:36:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC36D4004C;
	Thu, 12 Sep 2024 14:34:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0198B269E16;
	Thu, 12 Sep 2024 14:32:43 +0200 (CEST)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Sep
 2024 14:32:42 +0200
Message-ID: <7869d6b4-6b6e-4fb6-95d9-bbe497caeceb@foss.st.com>
Date: Thu, 12 Sep 2024 14:32:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: uapi: add WebP VP8 frame flag
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Sebastian
 Fricke <sebastian.fricke@collabora.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz
	<andrzej.p@collabora.com>,
        Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
 <20240911135011.161217-2-hugues.fruchet@foss.st.com>
 <01020191e212f333-703af7d0-fc68-4f47-b55c-6c0c3de6708a-000000@eu-west-1.amazonses.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <01020191e212f333-703af7d0-fc68-4f47-b55c-6c0c3de6708a-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Nicolas,

Thanks for reviewing.

On 9/11/24 19:12, Nicolas Dufresne wrote:
> Hi Hugues,
> 
> Le mercredi 11 septembre 2024 à 15:50 +0200, Hugues Fruchet a écrit :
>> Add a flag indicating that VP8 bitstream is a WebP picture.
> 
> Sounds like there should be some code changes in GStreamer that you haven't
> disclosed. Mind sharing how this new uAPI is used ? I would also expect this
> commit message to give more insight on what is special about WebP that makes
> this flag required.


GStreamer changes here:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/138ecfac54ce85b273a26ff6f0fefe3998f8d436?merge_request_iid=7505

Verisilicon datasheet is not explicit on why WebP must be signaled to 
hardware but WebP decoding fails if not.
Seems to me that such a simple addition on an already existing flag is 
something acceptable and preferable to the development of a new complete 
uAPI for WebP decoding.

> 
> I would also need some more API or documentation that explain how we can
> differentiate a upstream decoder that is capable of WebP decoding from one that
> does not. I wonder if it would not have been better to define a new format ?
> That being said, I haven't looked at all in the specification and only rely on
> your cover letter and patch series.
> 
> Nicolas


> 
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>> ---
>>   .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst      | 3 +++
>>   include/uapi/linux/v4l2-controls.h                             | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>> index 0da635691fdc..bb08aacddc9c 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>> @@ -1062,6 +1062,9 @@ FWHT Flags
>>       * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
>>         - 0x20
>>         - Sign of motion vectors when the alt frame is referenced.
>> +    * - ``V4L2_VP8_FRAME_FLAG_WEBP``
>> +      - 0x40
>> +      - Indicates that this frame is a WebP picture.
>>   
>>   .. c:type:: v4l2_vp8_entropy_coder_state
>>   
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 974fd254e573..e41b62f2cb2b 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -1897,6 +1897,7 @@ struct v4l2_vp8_entropy_coder_state {
>>   #define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF	0x08
>>   #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
>>   #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
>> +#define V4L2_VP8_FRAME_FLAG_WEBP		0x40
>>   
>>   #define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
>>   	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
> 

BR,
Hugues.

