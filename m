Return-Path: <linux-media+bounces-12317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E28D5B59
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 09:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ECCB1F25C93
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 07:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26C481211;
	Fri, 31 May 2024 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YPIXj5EK"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44F7FBDA;
	Fri, 31 May 2024 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717140349; cv=none; b=uV2oeV2SgxT+cVkMzZqZ/8bvqzJwZZcaUuYOJbhHOPYglltyTyQYv3LY3WQ37d/q74LYn3A0x1F5jMWEmm6LegcSM0aH9kyllsQ1TbCtzebt+1HY38wHmvn9L3SfZ3RajK5i/Q0i3RBVsI1w0eu80AO1zifINPb/cgXAE4pq7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717140349; c=relaxed/simple;
	bh=9hfWcXMuYGMPfhmaRRJ51XoHYVqx1Ee7zCNj8NIgJbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBeO3Vw1+HGpjX0uMxHjbFXmI5jDX72SWr70N/q9vTmp8GPxcA0DQ9geDbJVyU1nu1BvliDZxLZIGwbxTb4K5CR7HPPxDOBovH2G+BVaie7NViOCg0Mcv9PZNR3kxsNczjbNoQN6hmN9WwNfurPfFtEteDYPvlvQWUkfxVse4tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YPIXj5EK; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717140346;
	bh=9hfWcXMuYGMPfhmaRRJ51XoHYVqx1Ee7zCNj8NIgJbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPIXj5EK4gw4TuewdLSslkB1LtTSIi/e9jlIde0LJynoRt8Uep9SW6IBY3ev49rVt
	 RdvUbqtXpb4ykAoni8wv8RsI/6yAJhMU35Y0kt5qsVdikH8MfjEnKps3k7G5BA1PID
	 ggVBhkZgK8iL0XUQgbDDgFHigOg404V4QiF8PKhOAr8sLRPBzrBFj4OHKpCh+97wQF
	 NN4HIemgc3A9Hvyk/sX3oNldHGiL39/www8y3achbAWC5wIIC/wLaqyC/e7EohC0jC
	 DBgxeamNl9g1MOm2zwerZEdScGI/rVUuMgUUDWcdvJziKsW+koNRUWFEeZ8ElqyMlM
	 UJlhiKf0+eiMw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B508B37820CD;
	Fri, 31 May 2024 07:25:45 +0000 (UTC)
Date: Fri, 31 May 2024 09:25:44 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	m.tretter@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
Message-ID: <20240531072544.c3tw2uy25zctgs2j@basti-XPS-13-9310>
References: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240528020425.4994-1-nas.chung@chipsnmedia.com>

Hey Nas,

just before you send out V3 ...

On 28.05.2024 11:04, Nas Chung wrote:
>Explicitly compare a buffer type only with valid buffer types,
>to avoid matching the buffer type outside of valid buffer
>type set.

s/matching the buffer type outside of valid buffer type set/
   matching a buffer type outside of the valid buffer type set/

Regards,
Sebastian

>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>---
> include/uapi/linux/videodev2.h | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>index fe6b67e83751..fa2b7086e480 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -157,6 +157,10 @@ enum v4l2_buf_type {
> 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
> };
>
>+#define V4L2_TYPE_IS_VALID(type)		\
>+	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE	\
>+	 && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
>+
> #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
> 	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
> 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>@@ -171,7 +175,8 @@ enum v4l2_buf_type {
> 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
> 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>
>-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>+#define V4L2_TYPE_IS_CAPTURE(type)	\
>+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>
> enum v4l2_tuner_type {
> 	V4L2_TUNER_RADIO	     = 1,
>-- 
>2.25.1
>

