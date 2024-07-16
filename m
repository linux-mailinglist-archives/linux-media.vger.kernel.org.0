Return-Path: <linux-media+bounces-15051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C863893266D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62E12B21182
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 12:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA241197A6C;
	Tue, 16 Jul 2024 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PVikP0um"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84721E888
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132503; cv=none; b=Qtv/tFFijZBtazEXBUx/j/04H/L88baCkO5mFT89SrpnvuOlFIsZwCrdEw+EUZHbjBD8zT4aTf7iUOqPT3IOuNRIIsZ5zSdYejai/Nm8ptpGYYeoeIzl/GhyuCRXQ+RBg7NzfaYIwInEe7/6UUIFcWG8qz618y5VD5eBa0xj0s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132503; c=relaxed/simple;
	bh=OzLNg8Xpih9MPuK9srq9gSaVDuX/3rLnyI1mSTwIL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4j/JwMl2/lF3uCjLlvNzs7m++E+SA7RO2qSRhdzNHs1N94lUUVr9dfZOtEE/Ftr9o4mTuStkV5moCvK3lYKtxXqNQxi5L7s+gSKxSJdAUnXmB0OFpJRA/CsrV3hxwkTbTYQLediSBpFtjT1L8RjHywlbneCy9K8uqK9dZbDb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PVikP0um; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721132500;
	bh=OzLNg8Xpih9MPuK9srq9gSaVDuX/3rLnyI1mSTwIL+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVikP0ume7KpY7IIu927ztBxm/yC77tamCagdYZ7SMa+ZZ39WCB9tynWUO5pch7bD
	 9EKjlOS6F2e5zewda87m6RzMnZSRC95ztb+T43eedZbHO8o1og6AlqRn70jn36+QRb
	 zVjIhC9ixCf/kCL8ujpi0lhPXb/M5liq9AzP7ZY9C4NfTIYjauF4vZIYE2wrpGblGd
	 55WSboN+PmFWET4tZ+QcPYccjXY32YDBY0mL04wcnX7J8JemYKAWqXOgAh9ooZtMpa
	 810O3IxfcF3mb+aNefjxzecWGNckS4KhMYvl5dYdJ5Le3moZnVbJ8tXe3UggNfiQhT
	 tBSZLYQ5m8Dbw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2EA1C3780EC6;
	Tue, 16 Jul 2024 12:21:40 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:21:39 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 1] Documentation: media: add missing V4L2_BUF_CAP_ flags
Message-ID: <20240716122139.jts5u7boxvgengkx@basti-XPS-13-9310>
References: <df3f1c25-5956-4273-9e0a-5db712583f30@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <df3f1c25-5956-4273-9e0a-5db712583f30@xs4all.nl>

Hey Hans,

On 16.07.2024 14:08, Hans Verkuil wrote:
>The documentation for V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS and
>V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS was missing. Add this.
>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
>+        is valid.

Looks like the default is VB2_MAX_FRAME, if this isn't set, could you
highlight that here, I think that makes it a bit easier for the easier
to understand when this is needed.

Regards,
Sebastian

>+    * - ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS``
>+      - 0x00000100
>+      - If set, then ``VIDIOC_REMOVE_BUFS`` is supported.
>
> .. raw:: latex
>
>-- 
>2.43.0
>
>

