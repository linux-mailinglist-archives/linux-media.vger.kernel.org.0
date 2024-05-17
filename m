Return-Path: <linux-media+bounces-11591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1628C8492
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 12:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B828B2363A
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9506A2E639;
	Fri, 17 May 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FmTE6+RC"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853C579FE;
	Fri, 17 May 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715940628; cv=none; b=CQpmdLmmzMSy6HwTOoiO39JTkt5H1jS7hPKoNSXG0W2/JZ8bLmmEy3R+oyiFqACpOMhGqrzxrJsV1SWPocQUHrhCT+jbQBACqdHKlX41cgNEgoINKvVlXQzVT4Un2INnf4P4w6slJ0WF5biGoshzdmckUyF6yVeks1bT8A9suBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715940628; c=relaxed/simple;
	bh=Evik6onvs6xMRifrorVjfmXNCxhy0LQcjtsDkY6/Kfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jktpDcQGpJhqRkNKApwPWuAQKHV7KIPveybZDEyJHQofeAfYnZsdun3tf0jkUngvtJb+C6sfwXin4yIfg6WA2Y4wbRnC/tf4KUCVcjBVde4gq/GIcsJhEpECUOE0a2sdK/h31KRd5h2ti+s9ZUecC3/7Pg+9RiID24aP8zPma7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FmTE6+RC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715940624;
	bh=Evik6onvs6xMRifrorVjfmXNCxhy0LQcjtsDkY6/Kfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmTE6+RCX82xGiK8mXi6AhjYKJTKMVQ3OXIWT9H2tTMwZIMaQ8hs/iKUZhQ5zl115
	 LH9x5aj/tHHSMGzhGGt6zHSkv8o91Y9Iv+K09/X7ZI0vsbnnu0z2xDXjdLXTt6J7cI
	 LKKSD4uOenesIExSaUKuRIpO8qo8guoCU1cETlktC6DQ8xdw+rdQU3p4jP9CFrioGl
	 kNVYcQQwxTNf79vw2ubngVAv67xEuWJesetC0DN8tZmr59eljbIPqTegRldkAA4UiU
	 242MsUJT4zdvXp3xWkm2S7SzuIG7KIk9s8p2ONx+L/vkiXN4GRGftUB2tEnoSAScwz
	 bljk2kUEeVJkA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9AC843781104;
	Fri, 17 May 2024 10:10:24 +0000 (UTC)
Date: Fri, 17 May 2024 12:10:23 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Message-ID: <20240517101023.5hy7kp4j2dmitpav@basti-XPS-13-9310>
References: <20240517094940.1169-1-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240517094940.1169-1-nas.chung@chipsnmedia.com>

Hey Nas,

thanks for the patch, I think making the macro more explicit is
generally a good idea, but in this case all !OUTPUT are actually CAPTURE
types (besides the one deprecated type) and when I look at the
definitions of some of the set commands like S_FMT, I can see that they
require a type as parameter.
So, could you explain in the commit message, how it can happen that the
buf_type is undefined? And if so maybe that case should be fixed
instead?
I have improved your commit message below, but please explain why this
is needed, e.g. which case did you hit where you found an undefined
buffer.

On 17.05.2024 18:49, Nas Chung wrote:
>We expect V4L2_TYPE_IS_CAPTURE() macro allow only CAPTURE type.
>But, Inverting OUTPUT type can allow undefined v4l2_buf_type.
>Check CAPTURE type directly instead of inverting OUTPUT type.

My suggestion for this commit message:

"""
Explicitly compare the type of the buffer with the available CAPTURE
buffer types, to avoid matching a buffer type outside of the valid
buffer type set.
"""

Basically fixing the sentence structure and grammar and focusing more on
the reason of your action instead of describing what the code does
(which should hopefully be obvious in most cases)

I hope that helps :)

Regards,
Sebastian

>
>Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>---
> include/uapi/linux/videodev2.h | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>index fe6b67e83751..32b10e2b7695 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -171,7 +171,13 @@ enum v4l2_buf_type {
> 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
> 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>
>-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>+#define V4L2_TYPE_IS_CAPTURE(type)				\
>+	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE			\
>+	 || (type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
>+	 || (type) == V4L2_BUF_TYPE_VBI_CAPTURE			\
>+	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE		\
>+	 || (type) == V4L2_BUF_TYPE_SDR_CAPTURE			\
>+	 || (type) == V4L2_BUF_TYPE_META_CAPTURE)
>
> enum v4l2_tuner_type {
> 	V4L2_TUNER_RADIO	     = 1,
>-- 
>2.25.1
>
>

