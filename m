Return-Path: <linux-media+bounces-21733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA22B9D4A88
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 11:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41621B217FB
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 10:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC921CD20B;
	Thu, 21 Nov 2024 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6vd8F/En"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CED1CCEC3;
	Thu, 21 Nov 2024 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183898; cv=none; b=GRVbZ/lO8D8c2dNStVH+DJkmHUqovYs2Y2dfOqiYPTFoy9HFdjrsWeop5yAklfB3FhwFvJk/FobNM4UzWZWo82D8lNeXpQOMgT9gtcwnj5IbeoBthO+Qo12uUDWtY9T4FEQAUqasYDJznuyzp8/4xXONmQyq+tv3t19BmQ9uL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183898; c=relaxed/simple;
	bh=iNxDi1bzXgFEOuU2sj8iEmR1QPk/gKgS2MM3WbWY5u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f/l5cVR1xjXSW8QEIJwVoHJmH/XJugLLPGjbz8IhSIn8TC9EcGIVqx6IcFu9Fjcjjnoby1V4erL25d0agSX2zBxv/EjjJ2BR0zsloION6yoa0IEtVfKMDK3E38718E4b68Me3EjYYumcpugoaD2SiVEeUIi2lThnKMYMf4SAT60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6vd8F/En; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL6ZhtZ001379;
	Thu, 21 Nov 2024 11:10:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Pd6rBNZoxGrLvF9FQXRoGek58FWnqhqX5GnjHcs3NLk=; b=6vd8F/EnNyXjiTE4
	Kt/8PzXjQwodIPp7yu8Qh8X9qbzbGbVheYiTaL+VWQWDDMW63+wz4NVUaf44XZDP
	0uvVS8pwa7D/ZfB+y4XVmj24XG7YZcVC70AUfEn8sjoUy5TsD5JoiDzThmNP35lT
	Y5KRrrRQEuII6h+26WNWqcbsphCsY97aMtevxwNTj2N22dgmztMwluhcZGQJrBJv
	3rUQvHWOUPjQ1fZ07ItAAGC+Wgh542nkBZfS8dH90Jjc/Rxm0+Ntr+K2grWrG0nL
	DL62qCnU1+gp/wS2SL6ug56aWN/LroXHtsEHYhLqGheyqrIwNl2AhY0KAmcu6J5H
	b9fn5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xknwegxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:10:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7F86740044;
	Thu, 21 Nov 2024 11:09:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3856B266B17;
	Thu, 21 Nov 2024 11:08:13 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 11:08:12 +0100
Message-ID: <2404c3d0-140c-4481-b45f-f762cce8ecf6@foss.st.com>
Date: Thu, 21 Nov 2024 11:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: uapi: add WebP uAPI
To: Diederik de Haas <didi.debian@cknow.org>,
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
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
 <D5R4DD00Z0A4.3BHMO8E5IZ6CH@cknow.org>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <D5R4DD00Z0A4.3BHMO8E5IZ6CH@cknow.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Diederik,

On 11/20/24 16:43, Diederik de Haas wrote:
> On Wed Nov 20, 2024 at 12:01 PM CET, Hugues Fruchet wrote:
>> This patch adds the WebP picture decoding kernel uAPI.
>>
>> This design is based on currently available VP8 API implementation and
>> aims to support the development of WebP stateless video codecs
>> on Linux.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>> ---
>>   Documentation/userspace-api/media/v4l/biblio.rst  |  9 +++++++++
>>   .../userspace-api/media/v4l/pixfmt-compressed.rst | 15 +++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c              |  1 +
>>   include/uapi/linux/videodev2.h                    |  1 +
>>   4 files changed, 26 insertions(+)
>>
>> ...
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> index 806ed73ac474..e664e70b0619 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> @@ -169,6 +169,21 @@ Compressed Formats
>>   	this pixel format. The output buffer must contain the appropriate number
>>   	of macroblocks to decode a full corresponding frame to the matching
>>   	capture buffer.
>> +    * .. _V4L2-PIX-FMT-WEBP-FRAME:
>> +
>> +      - ``V4L2_PIX_FMT_WEBP_FRAME``
>> +      - 'WEBP'
>> +      - WEBP VP8 parsed frame, excluding WEBP RIFF header, keeping only the VP8
>> +	bistream including the frame header, as extracted from the container.
> 
> s/bistream/bitstream/ ?

Thanks for noticing this typo, will fix in v3...

> 
>> +	This format is adapted for stateless video decoders that implement a
>> +	WEBP pipeline with the :ref:`stateless_decoder`.
>> +	Metadata associated with the frame to decode is required to be passed
>> +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
>> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
>> +	Exactly one output and one capture buffer must be provided for use with
>> +	this pixel format. The output buffer must contain the appropriate number
>> +	of macroblocks to decode a full corresponding frame to the matching
>> +	capture buffer.
>>   
>>       * .. _V4L2-PIX-FMT-VP9:
>>   

BR,
Hugues.

