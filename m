Return-Path: <linux-media+bounces-21021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B89BF3DD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 18:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3E9B1F23F61
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 17:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3D2206509;
	Wed,  6 Nov 2024 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2wpFy1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F951DEFE7
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730912666; cv=none; b=lf4Vx3sndMkUbbkz7CHAGzn96PdCIm0pP0yiU2prg2Su48AHFbTefo183Olm1Vsq+/EIEqyFLSxNlQbSPZfNsqs3YGNovmE8SafkKiDHFiMZqqk3o8touzMa97o107+8dGD4Rs+ilitNeCu4aqEF7XDFp5o/pUV6hX9VMUVCJu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730912666; c=relaxed/simple;
	bh=IqW57oiCoBaCk36CniFqvizF47SHTBcgPQmGYek9qt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak52WhCk5s1LHvYkRbXc0+dYFy87QCg0zJ37z40edu3sdeXYnpPbDuSpTOOeZYri90e3St9lc4pp/TELGJPD/IKokiRRN4NPvYNlk+z/fwgjL2yB5PIf66UnFCUP/3NlQQZLubRQBTGqVRl+lfMHMMTw2l8dqtLdwuys2xIArkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2wpFy1V; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so41212a12.3
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730912664; x=1731517464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDaQLdznzK7seqYSBe/wCoaA0MUN6ZM7xHd32DKGHh8=;
        b=E2wpFy1V4LcM8Sjf+T9lJHkgp2HZjgkTNCNRFwG9qGmsNMUBBtUNhBb80D0twCHrzx
         bMFYUFq+sO8wZlQpMd0bKECkSAhALJ8iTIJgzTkooIQsSkZvOLNs1hUOFAt220fGk9tS
         yfWCygVv7RshrRCSmfy3KKk8EAzEyRbhuZBMzGPSmVh6Djt5GgUMS7IVSvPDRvxN18yv
         gOsFRCkEV06ZGoJkNYZjArFQyAqJXhgs7SQ8XpfIS0nopGY0cE868Ar7Lo1qZldUsxmq
         OHoQS87UBu56IM/w1wYKDuwWCfv8vD73LQ++DmK6vccFlKZNGiqybV1K2A9X/nk00Am6
         iRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730912664; x=1731517464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDaQLdznzK7seqYSBe/wCoaA0MUN6ZM7xHd32DKGHh8=;
        b=YsOIMInP9lQWH/0l8oJRsNiJCWIAS++0LMhZTPJpQBQ9ScPjxFXABImgc2cq1fdORY
         3iatBq8o5fNuqSCKQsUNuJgkXIOjRWIQPf0mLPMSQwYl415Lta6T5Fvzp6/eIbwTe7L2
         PjKtXnXZ1/5punAzgvde4ldBv03nvLDU8pHAhSHYShJcMIDm9ti1/HvriPM96mn3xyEK
         CgBATDuvn5ml3JGfew7bDWrGdL7/behXguQyHlm+teKkxdqrhoR4tfvZRDMO4ycKNrWl
         8RqJC6r2Ii4P3l58WysE50RHY3mjBaMm6pnoNLETY+nGqsuZRxTbdnZwHmIJ82Cf/yeG
         9WHw==
X-Forwarded-Encrypted: i=1; AJvYcCV0nbC3W/3abBdmfFDh87qBRYnSvrhJnxFpl20va94nUd662TMkLc/b5Nb+io/2tOjiwDknZwmqb5h1ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrNAkt6Nef3EkqFQsgEfHNBUqAifSrH0BAo/1i8x6McAXmETh
	2jLw/zuDaOPSgpuZsOrDM2u89hxIzsI6hwL6KZQglZFrcLsvcTMdFIyiUAbO5w==
X-Google-Smtp-Source: AGHT+IFTRmyv3jddEWzwMk7l4ToMoo9qEgn6PMk6nfoP7kxnLFshmvLNCipLw+gSEmO7+UOuZw7W7g==
X-Received: by 2002:a05:6a21:3292:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1dbf68ada69mr7915594637.17.1730912664141;
        Wed, 06 Nov 2024 09:04:24 -0800 (PST)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a7ffesm11355388a12.23.2024.11.06.09.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:04:23 -0800 (PST)
Date: Wed, 6 Nov 2024 09:04:18 -0800
From: William McVicker <willmcvicker@google.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	yunkec@chromium.org, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org,
	kernel-team@android.com, stable@vger.kernel.org
Subject: Re: [PATCH] media: videobuf2-core: copy vb planes unconditionally
Message-ID: <ZyuhknpDgVLl39zL@google.com>
References: <20241106121802.2939237-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106121802.2939237-1-tudor.ambarus@linaro.org>

Hi Tudor,

On 11/06/2024, Tudor Ambarus wrote:
> Copy the relevant data from userspace to the vb->planes unconditionally
> as it's possible some of the fields may have changed after the buffer
> has been validated.
> 
> Keep the dma_buf_put(planes[plane].dbuf) calls in the first
> `if (!reacquired)` case, in order to be close to the plane validation code
> where the buffers were got in the first place.
> 
> Cc: stable@vger.kernel.org
> Fixes: 95af7c00f35b ("media: videobuf2-core: release all planes first in __prepare_dmabuf()")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks for sending this fix! I have tested that this fixes the video playback
issues I was seeing on my Pixel 6 device. Feel free to include my

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks!
--Will


