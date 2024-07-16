Return-Path: <linux-media+bounces-15054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF69326AF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9536DB22BFE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6903019AA4B;
	Tue, 16 Jul 2024 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iBnq9x+V"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ECC17C23D
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133347; cv=none; b=j1PgYYqBYSYGyh8hJRtV1F3RvmJuYTfukPa8GBZmGwOZ7zp1TmafuN/1LYhZMR9XAefUF/TzuA4DBJG0IZV4PZnCAy+eX8LISr9QQM05o03TyTy8q+kKzbOf/NEYwKTdWXlCtR6mz+ZFzstKj2NEFsbCMA08N3YFVgVbBwQbDTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133347; c=relaxed/simple;
	bh=9JHkMz595q6kSIHJ0hWACE35JuRTzH2tICZiUsMPrhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtFR9O9r8yt6SaE3xAaMQYQk3MKR2wQSwYdZtTpeCdmpT/0EHTyLLZI20mfxpp4Cez7SvIRJNij7CQdkX7FrUxksCRS21usDYn/ODRLZYAM2GW67HJ7uHhOKoeJNuKXeD72rZPkj+aaTgcX9VO/U8ml12tqZSD8NH1M4QULj+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iBnq9x+V; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721133344;
	bh=9JHkMz595q6kSIHJ0hWACE35JuRTzH2tICZiUsMPrhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBnq9x+Vpham/3pB0VJw+Z8VW/sXJ44cLJoreUZBeCcPmliewhPaqugNNu8RZB4OL
	 H44m0jm5LJW5nBP7IzHZ1zCrKaQilV7WUZLTC02Pk4/KiWYNye/wR3bgwVYzx17Plw
	 TsMojOwioUDktJICX17w3RjTQeXhUL6+tGVAjHvx3zo8p6rPZWDGlA8KU0hUoMvpeu
	 BM377anmMtVV8nIVytcI53p4kkmuZm9dIZqkxlYb906qKJ7Q4YquYflZzeHxoRmjsv
	 X3nQZlqyVHr73aiVTBt47IIX4/s/JoHg5557Qx9nESWY4qEsah5CV6NtJOpuh3Ffgk
	 QvmpLk+voUeEw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4DBD73780EC6;
	Tue, 16 Jul 2024 12:35:44 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:35:43 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCHv2] Documentation: media: add missing V4L2_BUF_CAP_ flags
Message-ID: <20240716123543.rwfg5u4zexa6sigk@basti-XPS-13-9310>
References: <47829e6f-4749-4259-abd3-6cb5b5713006@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <47829e6f-4749-4259-abd3-6cb5b5713006@xs4all.nl>

Hey Hans,

On 16.07.2024 14:28, Hans Verkuil wrote:
>The documentation for V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS and
>V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS was missing. Add this.
>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

LGTM :)

Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>---
>Changes since v1:
>- Report what the maximum is if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS is not set
>---
> Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
>index bbc22dd76032..1df3ce1fe93e 100644
>--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
>+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
>@@ -166,6 +166,13 @@ aborting or finishing any DMA in progress, an implicit
>         :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
>         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
>         :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
>+    * - ``V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS``
>+      - 0x00000080
>+      - If set, then the ``max_num_buffers`` field in ``struct v4l2_create_buffers``
>+        is valid. If not set, then the maximum is ``VIDEO_MAX_FRAME`` buffers.
>+    * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
>+      - 0x00000100
>+      - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.
>
> .. raw:: latex
>
>-- 
>2.43.0
>

