Return-Path: <linux-media+bounces-15050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4A932645
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA51D1C22AE8
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 12:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAEE19A290;
	Tue, 16 Jul 2024 12:10:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547331CA9F
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131804; cv=none; b=hX7oUp1vCqnJq8BJxpW8gE18LD+/E659a+qGHA/abSdo7qNv3s0YX0C0XH237dAEZ8A2pKWxqOBSctomDhklQEvSnIIsdQ0Vq/YkquSmcOoxztfUV/bmBfaoAFOfosWf9fn8xsQgOCt+jnnNgiM8pytm86J4uKKwjsF8rgWPp9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131804; c=relaxed/simple;
	bh=q34GsS7YZENiotOC/VWzod3G0qyLGr2Kkqtm5xuB73Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gpqB0DjfUpA96ktm10oioVoHG4/W9Sij/UhTf0Gv+Fo3Azwvhx2FbikHF/iQ3r6WLOQT6mx0jPX4GGEybuXQVxH0MRSDeEfCGSQci4yW2s5BcrwDgGeZlRoRgoOW3nVXyjxE7jKS8RaeRFCWDVdF8HAcnBj2Jq0GjE8+4F5bQ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D4DC116B1;
	Tue, 16 Jul 2024 12:10:03 +0000 (UTC)
Message-ID: <3557fe53-ddba-4b86-b256-00b9b9ff924a@xs4all.nl>
Date: Tue, 16 Jul 2024 14:10:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1] Documentation: media: add missing V4L2_BUF_CAP_ flags
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <df3f1c25-5956-4273-9e0a-5db712583f30@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <df3f1c25-5956-4273-9e0a-5db712583f30@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

That should have been just [PATCH] in the subject line :-)

On 16/07/2024 14:08, Hans Verkuil wrote:
> The documentation for V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS and
> V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS was missing. Add this.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index bbc22dd76032..1df3ce1fe93e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -166,6 +166,13 @@ aborting or finishing any DMA in progress, an implicit
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
>          :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS``
> +      - 0x00000080
> +      - If set, then the ``max_num_buffers`` field in ``struct v4l2_create_buffers``
> +        is valid.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
> +      - 0x00000100
> +      - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.
> 
>  .. raw:: latex
> 


