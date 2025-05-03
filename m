Return-Path: <linux-media+bounces-31654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D211AA818E
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 18:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90CDF189F55A
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35B927A477;
	Sat,  3 May 2025 16:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ljhpZSAH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B6156236;
	Sat,  3 May 2025 16:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746288584; cv=none; b=QUduvDMQenOMpzv8d7eRc7+xlrZOM3B5AndH4sREt5jgbp8wsfL1F34APN5cjXMDRvWlL2Ahmq+3pPxFCqUVqHUBocNt0fyogQXUMTPC1sTcxbkSXMmsBog0KCxD+DXR9L6lpoQnKR3kxwU5Fq/NWZsE9q9WL1k/RuaL2hVrHwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746288584; c=relaxed/simple;
	bh=jrq4vPTyneDMCKioU8U1Yk7Vo+EMEjGhQXFLs/D/VTs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QmwJv6mOVMzK2xxgI7pwyZTY07rewmEcx6z+x00+MBEYz+H1zTg2fx+VO3ykn5wH/1T36xguZ1zBmUe9Dx4RPYDSUEkfkOfxfIYRWNN7hTgwwQVMOhyOa17y4BaGLjwY31xvjPJzYvIS34skTcKCJ3WrWwVpj3WRDi3f0YVui28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ljhpZSAH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746288574;
	bh=jrq4vPTyneDMCKioU8U1Yk7Vo+EMEjGhQXFLs/D/VTs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ljhpZSAH6dYvmut0LqTm5qrtzlSefwMJ8U07C1aGLlSv7xnBo/UFnQa7iURJbE4OE
	 ODt5lZzbrezinGOLquWQ6Q4Cpxvfi6SWvEj/P1g1mlIH7lWdR76gKttln81jckRzHY
	 kBrxwTrYfdBj25xW7cbH3JXugCLdhr42ZM7iAvYTy3b+yOjvnRSmSrHUGUI8tXWGQA
	 GHVPIGHqN6adawaAbTbtoJUYomh+BcoQj96HMnDs8L9kJDBQ50t9aIEV5Yq499X5XN
	 CP/lhjlgJ5Oel439sMhQ0jlzpJ4z7Jv17PtD9rV7RXN9rBy9RRnq6rwCbmIBRrBKo3
	 Ay41LYFap9Bfg==
Received: from [IPv6:2606:6d00:15:ec4::5ac] (unknown [IPv6:2606:6d00:15:ec4::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3C5717E03BF;
	Sat,  3 May 2025 18:09:31 +0200 (CEST)
Message-ID: <1b204ed7bc63373f52973b96af68e64e24be8cde.camel@collabora.com>
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
Date: Sat, 03 May 2025 12:09:30 -0400
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
	 <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
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

Le vendredi 02 mai 2025 à 00:43 +0530, Dikshita Agarwal a écrit :
> Firmware sends buffers with 0 filled length which needs to be dropped,
> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> Also make sure:
> - These 0 length buffers are not returned as result of flush.
> - Its not a buffer with LAST flag enabled which will also have 0 filled
>   length.

This message is quite vague, is this about capture or output buffers ?
If its output buffers that don't produce capture, I don't see why they
have to be flagged as errors, or why the payload size matter. Then, if
its about assigned capture buffers that did not get used in the end, you
should put them back in the queue instead of returning them to user
space.

Returning a capture buffers to userspace should only be used if a frame
could not be produced. That imply copying the cookie timestamp from the
src buffers into the capture buffer. Please make sure you don't endup
returning fake erorrs to userspace, which may lead to some frame
metadata being dropped erroneously.

Nicolas

> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 4488540d1d41..3bb326843a7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>  
>  	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>  
> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> +	}
> +
>  	return 0;
>  }
>  

