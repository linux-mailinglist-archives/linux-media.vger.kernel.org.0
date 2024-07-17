Return-Path: <linux-media+bounces-15074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A5933B14
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 12:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E0B6B22577
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 10:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14B17F39A;
	Wed, 17 Jul 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FEYxioEW"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFBC17E917
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721211590; cv=none; b=rceeZdQkAMTTlCtaebqgPystkO1tkqSjzZRgzfQ+Vn8GNufvwFmITaM+Xc7AJkq6S8peUL7YBq4K4g2F0/4Rf4WCgSEVgAN8oYqMTM0zvq+uw1uhRwhus8DKz1noxxNeWi9SJdWAWF+aSxb823F7fXGNrxFLQzW6gkWLItE/pMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721211590; c=relaxed/simple;
	bh=L+VGPSk9LbaFau92NMsvqcpdZIMOXU7kdvETGxY4xOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2k23pyp5o0QgzYT19auzhk9hNv9N5FDCElafiBOA8NDTpyrlv4jZDGveO0nAYJWDKauRcYhFKkQgBxmvlbTGpdZEKZqykPdgIzEaSyZlEsJQH5hKxLQkHGXr2BiyHrfpPfHh/dU8PLeG1LqTZGtcfKC7oHlwfVjAo3171HoU+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FEYxioEW; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721211580;
	bh=L+VGPSk9LbaFau92NMsvqcpdZIMOXU7kdvETGxY4xOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEYxioEWc93qGje+ieeJlO4q/re3L+XGiw98a2cC/ugu5fVHiDmHsDgKfkqa8U4wJ
	 2u6iQzpwTsRAGKpGqXxm9GkAZlOy5N1fG4Z7Jcnz0Yvvy2hWR6UvcjutEfe2mH5QTe
	 +HfZOBOGHWGDA9o/tdQhV2VEPFBUuHFpfh2l9Goy1Tq3eoTsU+zKKndmJhkhycPwxg
	 IqS/M1kgO+T5ItGRxvSb64rRbcV9WFi/lloSIbgImD6A6ksk13kB4KXhSqiqejmYvX
	 6uSVQipWgCBzFDs+rJIMSjMdHUr+RNkZGeM0WaKmBKQkDiuedIbcFWqf9m72/2QHBk
	 ndemmMGTHiCDA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 94A2E3780613;
	Wed, 17 Jul 2024 10:19:40 +0000 (UTC)
Date: Wed, 17 Jul 2024 12:19:39 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] media: v4l2-core: v4l2-ioctl: missing ', ' in
 create_bufs logging
Message-ID: <20240717101939.tunmbahdu24yhvpq@basti-XPS-13-9310>
References: <4e617844-0040-4b29-a532-a5f903501bdb@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <4e617844-0040-4b29-a532-a5f903501bdb@xs4all.nl>

Greetings,

On 17.07.2024 11:58, Hans Verkuil wrote:
>The v4l_print_create_buffers() function was missing a ', ' in
>the pr_cont call, leading to logs like this:
>
>[93293.533425] video0: VIDIOC_CREATE_BUFS: index=0, count=0, memory=dmabuf, capabilities=0x00000297, max num buffers=32type=vid-cap, width=0, height=0, pixelformat=.... little-endian (0x00000000),
>field=any, bytesperline=0, sizeimage=0, colorspace=0, flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

LGTM.

Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>---
> drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>index 5eb4d797d259..64c3e79d6378 100644
>--- a/drivers/media/v4l2-core/v4l2-ioctl.c
>+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>@@ -484,7 +484,7 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
> {
> 	const struct v4l2_create_buffers *p = arg;
>
>-	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max num buffers=%u",
>+	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max num buffers=%u, ",
> 		p->index, p->count, prt_names(p->memory, v4l2_memory_names),
> 		p->capabilities, p->max_num_buffers);
> 	v4l_print_format(&p->format, write_only);
>-- 
>2.43.0
>
>

