Return-Path: <linux-media+bounces-21731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE39D4A61
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 11:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58A5BB214FC
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 10:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4621CBE81;
	Thu, 21 Nov 2024 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Jg62Vrgc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C553126C05;
	Thu, 21 Nov 2024 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183372; cv=none; b=OYh4mela+l3ZgsGwBU/Uxb1vj/dOR/T5i9QrJ85w/lvgShnjJuPZ5LPLdp8tA7wTwP3UXvlyKXAkm1XxiQx5dohohMyfeoTG296wV/RFo+WwH+4glf9drEZHg6tywx2qA8sMgs2Yi5AdiPyRWGSIcTG03ddao0pO00BgSRCEqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183372; c=relaxed/simple;
	bh=SAZnTR6nFodWMC2jvQ3/SQAYg1GfYwllTStdi7ONILs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LE1TzF9wecZL7sCCws2+/90kmH8feHyJIpXTBfH1hE7kNPdlUBI6/7W16MKgVuYR7t+sr7f/kl+n4hElBqFlRcbmwjHZ9XsC07yq4/iJX2XxcxGLcAvahU5K5JhkwCS6bPNHDU5rstGyUHjX/EYkkItDtgIBcDA311oEe9Ah6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Jg62Vrgc; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL42NIT028349;
	Thu, 21 Nov 2024 11:02:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tMHARmkV5I92PboMXt6Pp6b96tFSvjo8btyHafNWUhQ=; b=Jg62VrgcSnv4qCny
	oQebn5uJV1AxeI36qhwi5I6pL937pOlrroCBrUdkVaFo5w4HbaeD53p76/IUApwf
	qM6Dr0CsmJ4wyjefnDlakjfTE/rStJZ4UYBXr8h4EbzbRpqU9YEkTkKHUbA3iV0a
	wqOnQzXDQCQ1xD4KYWkTo4MmkKTCWtTtfhK0HX+OyKZIVZbOYQ7xl7hPuQDFvvd5
	6fl5r6lyn002AmIX/6mLf3c6pvdiXCJFtZKCaXAmtZee+bdbeIXpMUmWZfgzPb+j
	y2VfK3yMbl1Way/ApSItKtVtJoi4YYSUqOcWd2T3ll3nm0JHvsOQwvAkb8qLByIx
	n2W2mw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf5t69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:02:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 41F8F40044;
	Thu, 21 Nov 2024 11:00:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112F225E1E1;
	Thu, 21 Nov 2024 10:59:54 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 10:59:53 +0100
Message-ID: <752c2573-97bc-4b5a-87d1-ca52b854a48d@foss.st.com>
Date: Thu, 21 Nov 2024 10:59:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: uapi: add WebP uAPI
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
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
 <19cf9e45e00ccf68f35339d8d694e026ffa48037.camel@collabora.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <19cf9e45e00ccf68f35339d8d694e026ffa48037.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Nicolas,

thanks for review,

On 11/20/24 15:21, Nicolas Dufresne wrote:
> Hi Hughe,
> 
> thanks for the update.
> 
> Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
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
>> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
>> index 35674eeae20d..df3e963fc54f 100644
>> --- a/Documentation/userspace-api/media/v4l/biblio.rst
>> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
>> @@ -447,3 +447,12 @@ AV1
>>   :title:     AV1 Bitstream & Decoding Process Specification
>>   
>>   :author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd
>> +
>> +.. _webp:
>> +
>> +WEBP
>> +====
>> +
>> +:title:     WEBP picture Bitstream & Decoding Process Specification
>> +
>> +:author:    Google (https://developers.google.com/speed/webp)
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
>> +	This format is adapted for stateless video decoders that implement a
>> +	WEBP pipeline with the :ref:`stateless_decoder`.
>> +	Metadata associated with the frame to decode is required to be passed
>> +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
>> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
>> +	Exactly one output and one capture buffer must be provided for use with
>> +	this pixel format. The output buffer must contain the appropriate number
>> +	of macroblocks to decode a full corresponding frame to the matching
>> +	capture buffer.
> 
> I wonder if we should document the constraints, I think
> V4L2_VP8_FRAME_FLAG_KEY_FRAME must be set, which imply that last/golden/alt
> timestamp are ignored.

I will add something about that.

> 
> With that clarified:
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
>>
>>   
>>       * .. _V4L2-PIX-FMT-VP9:
>>   
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 0304daa8471d..e2ff03d0d773 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
>>   		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
>>   		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
>> +		case V4L2_PIX_FMT_WEBP_FRAME:    descr = "WEBP VP8 Frame"; break;
>>   		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
>>   		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
>>   		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index e7c4dce39007..09fff269e852 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -757,6 +757,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPTE 421M Annex L compliant stream */
>>   #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
>>   #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
>> +#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP VP8 parsed frame */
>>   #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
>>   #define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
>>   #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
> 

BR,
Hugues.

