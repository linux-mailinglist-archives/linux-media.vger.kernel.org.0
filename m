Return-Path: <linux-media+bounces-31709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA384AA935B
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 14:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8171888DCA
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 12:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927611D90AD;
	Mon,  5 May 2025 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zauusnj0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9626FC3;
	Mon,  5 May 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448684; cv=none; b=shrmHvcrDykqUGFPqgfLIBJdqJ9NkN8CKTwdjSYbzgzTxLh1mjgMdtnNj4ZHnnPZwZ8JXQPNG/ZbOmNTn6rq39tQkcTxDd/VkkuC/ljQgKo53/ycYsN/b4knhzfRsSd/GVxEDykPlnKlMx7FK+V/ECcM6Jba38ET9hZ6Izx6oS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448684; c=relaxed/simple;
	bh=pYBN3lsmWkKdV1oODnXSMo3X/39kVT+oxVXpOMKSOCo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VdCxAeoESKRWtEJOaEG5NwMgXhNcrzTU3uOy65yOJ401xau3oSmJ2tl6RIWubiFh62bz5j0k0E69QYMPEMnp+sLYw3k2ogbqPpmBAAQQxHorQTqfbCVwhKkKhv13ykBEL/YDzdq7clW5HhlbUHF/6NvrOMoYrjY8CKSTRQoRogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zauusnj0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746448679;
	bh=pYBN3lsmWkKdV1oODnXSMo3X/39kVT+oxVXpOMKSOCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Zauusnj0dYv2ApLcBldHcDtboyBrosevqNbqns6Iw8XL60YdE4hIyAHxyGULJqysP
	 HWUabOhVCZMU0Bd4XNCpJtI0QmheyTSqB5xx6ZimJp2+fHa13NMDXoA5QZsuHwmdyI
	 0lpJ1ZVvYonR0kdee85X6wjJcU/aWBOcQMj9a2EmvHslJ5cFnzdKr2wSfJgkYetyCl
	 NpBWIDzKnOVO0O06M9THMbKHC0Pu8QGBm8DXkEO7+iZq3B/IRZ29JyI+CpTRbqtE7H
	 vY5dvKG5PejgSmBu/h2vh6cEyqUZ6JbCVAitnAuT6MPUw8F8+u+3SIqhlsDRdUWX1g
	 lHldAH1mEIc1g==
Received: from [IPv6:2606:6d00:15:ec4::5ac] (unknown [IPv6:2606:6d00:15:ec4::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C44717E12D6;
	Mon,  5 May 2025 14:37:57 +0200 (CEST)
Message-ID: <fc4d70d3d3a98da8c0a8679bcea87d8d1e83fc5e.camel@collabora.com>
Subject: Re: [PATCH v3 13/23] media: iris: Send V4L2_BUF_FLAG_ERROR for
 buffers with 0 filled length
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Vikash Garodia	
 <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Stefan Schmidt
 <stefan.schmidt@linaro.org>, Hans Verkuil	 <hverkuil@xs4all.nl>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
	20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org, 
	20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
Date: Mon, 05 May 2025 08:37:56 -0400
In-Reply-To: <36757fb1-b1a9-5b49-c5b8-62cde4dea1c5@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
	 <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
	 <1b204ed7bc63373f52973b96af68e64e24be8cde.camel@collabora.com>
	 <36757fb1-b1a9-5b49-c5b8-62cde4dea1c5@quicinc.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dikshita,

Le dimanche 04 mai 2025 à 20:53 +0530, Dikshita Agarwal a écrit :
> 
> 
> On 5/3/2025 9:39 PM, Nicolas Dufresne wrote:
> > Hi Dikshita,
> > 
> > Le vendredi 02 mai 2025 à 00:43 +0530, Dikshita Agarwal a écrit :
> > > Firmware sends buffers with 0 filled length which needs to be dropped,
> > > to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> > > Also make sure:
> > > - These 0 length buffers are not returned as result of flush.
> > > - Its not a buffer with LAST flag enabled which will also have 0 filled
> > >   length.
> > 
> > This message is quite vague, is this about capture or output buffers ?
> > If its output buffers that don't produce capture, I don't see why they
> > have to be flagged as errors, or why the payload size matter. Then, if
> > its about assigned capture buffers that did not get used in the end, you
> > should put them back in the queue instead of returning them to user
> > space.
> > 
> > Returning a capture buffers to userspace should only be used if a frame
> > could not be produced. That imply copying the cookie timestamp from the
> > src buffers into the capture buffer. Please make sure you don't endup
> > returning fake erorrs to userspace, which may lead to some frame
> > metadata being dropped erroneously.
> > 
> The capture buffers which I am trying to handle here are of 0 byteused
> which means they don't have any valid data and they have the timestamp
> copied from src buffers.
> How these buffers will be handled by client? if we don't associate error
> flag to such buffers?

Please share a link to the stream and specify which frames are handled
this way by your firmware. The answer to your question is entirely
dependent on the stream you are decoding.

Nicolas

> 
> Thanks,
> Dikshita
> > Nicolas
> > 
> > > 
> > > Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> > > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index 4488540d1d41..3bb326843a7b 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
> > >  
> > >  	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
> > >  
> > > +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> > > +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> > > +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> > > +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  

