Return-Path: <linux-media+bounces-7929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1DB88DBF7
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 12:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD231F2CC76
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 11:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EB554BDF;
	Wed, 27 Mar 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GIb/sul4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86769374C6
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711537496; cv=none; b=lIoBEcPabI0Xar1bq4l/boFvON0f9++eGSBk0jiQJgH+e6aaBTaLR65hY6qP2up5tmmmlwEyDg2yHSrz3vlWDmVjldOhlHCWC0JTGKP779KdMS3vZNqdExaq5XZqtwz9VFVUalx5uxinx+pXH8WzIYlyI0qlpOeJfrt7IKUdAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711537496; c=relaxed/simple;
	bh=s1Ut+n1kFMUi4nvtasg/8l/6hCb8DBu+OY71KNZfJFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlmXxWbgHGe54yi/ecFM4ScDglRuMYQhqhxfoIs3FTYu9aUnMJiax+FmXCZL2LjweMHfrfnArPbS0BsiiUIaxgrHZxR5SvzDTaBnKPQJhCaNnl9rwadzMS55X//6I2GqKGH1htr4B8BYL4FxFAJulhR9+tjepi6A4FsX6UNsHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GIb/sul4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so3714826a12.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 04:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711537493; x=1712142293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKzsagGBVd9L344KjOkA0F6xiEm7Fp9dvHCT2Fl89Bw=;
        b=GIb/sul4UDvz/HSBsxpcclmhUsqmJ0EhalVPFXRZPamhDmZRLzP0F8mgl705iWY9pS
         FnMabd/Tq8WOr/7TEdc96plaM2ZYocdPLWCZtAHtC7HWHi7F0sYoVLMcO7ZQM1+Rp1O4
         G6qwKK2kfX1FxB8fGW0O/AhkXOYokDUYpOGEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537493; x=1712142293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKzsagGBVd9L344KjOkA0F6xiEm7Fp9dvHCT2Fl89Bw=;
        b=gWZ3/P+Re6z5QYkt2FIKzMCRYNCWf5hsJy4llYimQEcteCRlQxNFC/P26GJCCdiSYn
         UrcXikZ8+qyPO4ASMuX6FDn2zI/dFIowC8W7uHiuoLmIoJI/FXQO8OSLwCaGkQmU6yEc
         sfkqCEbLGT/9jpOp9k+s6uC54JZdLBvQIeexNvOHwx4BJR/5sTtx6cBfMs4Z7jgQjTuW
         R/YLhJd6kfJ0hWshpRxQXnNyzyoTZytgG+G2uLR3tCZ8/lKoQGOV0vB9IMLZTOxQifUU
         1pa30gsPfmvGEOTp5jN9RZxs+YjXvpcK4gunedzvWYHcxO0NeFrbtPrPkQi1cLfdqthS
         V3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUWk35pVArKF3tRE4WIX7WJBQb7Pw9d4j/ddv6jiU3CvBlA6z1d1Wa6+wZCLIcCdkFDOLVqx192DLp/dPW2HYg3Xv2Lbowz8dmOgnA=
X-Gm-Message-State: AOJu0Yyk8f3dajFQYh9NljBItJKCk+eHyD0wzINCz/ePMRdMiU7EijPQ
	P3rpvm5Moba3VTiBRZxKThR8slauYnhqUEoagK1IkminrCCjY214HZoAN/jkTQ==
X-Google-Smtp-Source: AGHT+IH/wktEiKSFpAySvoxBD2qS+UaFluDO/01xoGZf/YTORmbuYvu5PGwwqUPb07fY5mYUt2/Yxw==
X-Received: by 2002:a17:90a:7406:b0:29c:7170:fa33 with SMTP id a6-20020a17090a740600b0029c7170fa33mr5144380pjg.29.1711537492933;
        Wed, 27 Mar 2024 04:04:52 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:38ea:49db:93f2:42f7])
        by smtp.gmail.com with ESMTPSA id eu15-20020a17090af94f00b002a03ef914cdsm1344886pjb.34.2024.03.27.04.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:04:52 -0700 (PDT)
Date: Wed, 27 Mar 2024 20:04:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Max Staudt <mstaudt@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 0/4] uvcvideo: Attempt N to land UVC race conditions
 fixes
Message-ID: <20240327110447.GD1041856@google.com>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>

On (24/03/27 08:24), Ricardo Ribalda wrote:
> Back in 2020 Guenter published a set of patches to fix some race
> conditions in UVC:
> https://lore.kernel.org/all/20200917022547.198090-5-linux@roeck-us.net/
> 
> That kind of race conditions are not only seen in UVC, but are a common
> seen in almost all the kernel, so this is what it was decided back then
> that we should try to fix them at higher levels.
> 
> After that. A lot of video_is_registered() were added to the core:
> 
> ```
> ribalda@alco:~/work/linux$ git grep is_registered drivers/media/v4l2-core/
> drivers/media/v4l2-core/v4l2-compat-ioctl32.c:  if (!video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev)) {
> drivers/media/v4l2-core/v4l2-dev.c:             if (video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (!video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (vdev == NULL || !video_is_registered(vdev)) {
> drivers/media/v4l2-core/v4l2-dev.c:             if (video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-dev.c:     if (!vdev || !video_is_registered(vdev))
> drivers/media/v4l2-core/v4l2-ioctl.c:   if (!video_is_registered(vfd)) {
> drivers/media/v4l2-core/v4l2-subdev.c:  if (video_is_registered(vdev)) {
> ```
> 
> And recently Sakari is trying to land:
> https://lore.kernel.org/linux-media/20230201214535.347075-1-sakari.ailus@linux.intel.com/
> 
> Which will make obsolete a lot off (all?) of the video_is_registered() checks in
> Guenter's patches.
> 
> Besides those checks, there were some other valid races fixed in his
> patches.
> 
> This patchset tries to fix the races still present in our code.
> 
> Thanks!
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

