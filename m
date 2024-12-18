Return-Path: <linux-media+bounces-23735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42E9F6FD3
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBFB3188BB85
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEF21FCCEE;
	Wed, 18 Dec 2024 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SYaZCMyQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0B156885
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734559280; cv=none; b=BL0S3XWQkt+iCNg5nwzTTtSAp8O1+j9m5+RWLThtJE3hxL9bcocLamJWXR9Am81R9qYNVvhD5kJU7o2rtqUIDiHRk1xOckHalGqYcR7GOdJyrri9pv7DORIdyvcKhRdFco5tD4c+Pp2PK/tNTasQc6fXP/NunSi2qcu+YnAAixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734559280; c=relaxed/simple;
	bh=QTRwfsFFaoxSFaaiZTOr23+06coLjVGoS2KVzWWMkcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku+4edrV4xk3EPmnqBAiX5YoxHC4JinqqryGIBONdVrPQM6gc119WGKGpHSPrjRfx9jyyv+FpwwTXAU72HK+qYmPaxbEbxqrFNlb2yUY/ZKPWdKuuLDdJygPDJ5gBtAUj7kQgDVwFaf4hDL0X+oZ27GRMiFSPF+CxYLdchrZ3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SYaZCMyQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso133369a91.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 14:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734559278; x=1735164078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OhIXOs+VtM4MTPYUPmQmGRnf2axa6+ptzRXoX9SEbm4=;
        b=SYaZCMyQE4mZJTB3PRLVGfV934NTkG1+kqKOdPFpBc8K3pRRId/IragcJwiq5aez/6
         9+RlDIOzfJxJj2Ne+RqLofN6q7Aj5nJTkqfrAogDy/jh2F4BFT0YEntD6Z3AtxtIveVe
         /etNbYYCT/aRMQVDsny9QyqUYNiSAZt7rnQf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559278; x=1735164078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhIXOs+VtM4MTPYUPmQmGRnf2axa6+ptzRXoX9SEbm4=;
        b=w12M9bIXkHEtudnMrEngoxEm3jPD+cJc/seXq2EQAGw5ySCPQKkaZEcGO9YuGKMag2
         jh46AiFW+nqlqjWLfmauU3wkT8k2o/8+m4NpZyupSTl9ymlIRqa98+rUBfHEa9wWc/Mu
         su7WcgCFR/Y2nlY85O5TSrzgZb8ygEqr2C4jJ9ETUDeY7sfucOy55Qtlb8rOOdMwzji+
         8bVCmMYjDznZpy9+0NaFYcPRxG0ZTl3VaHYc687ymU0d049LLiG+289wKuc/hSrbznx9
         ap4MNJ8oTdSWkja5keWYAw08rAsIuOE/mxeSlQHFpHhvjIG4f3W1Eiv5Kq1G5ppmikJ+
         lBcA==
X-Forwarded-Encrypted: i=1; AJvYcCVgPQ8O2tRFUtWLOMdUa8Zo+22qAoDQh1ThfUQ1bJvcqlL63lXdywRVadEGgP7X2cc5b62ht5SA0BrLJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrkbPmWvfaFxZxVE75jlEeTfuhloQHBL2H/RHgLzISxa7xhijL
	zmPKOmJ2VWO3iFEMM5uzqVwp4NBvEYctwPVu7VjIMf7Yn74811LiYEI/8bXh7Y73wjiT47PZ6Mc
	=
X-Gm-Gg: ASbGnctIPwl4jmXkyBNvWdTjXCcVLgcWvzdJNXDDojsUvNP6hD1x3efL0wZxDK2AxvU
	NheQ6aVTBhMjIUVU8KSuuHD0WBSkNswhTUvM0d2LUr9mlRMyD9+ycZU1fPCYgJF1lsC8stDewp5
	SLPwFGAgaW23JtYx+diQxw9nIyiWHAbCLvY6+ypRkKiU1YLI6zmiMXM0rgbSa+9myotVA/BxkH+
	iwmLMx1mewEB+tXALg4c8j5xs1UJQPlVuqyWW3+eXAwG7k49wZOBdDEfSyGBD5SjB2ZI7KgQsre
	Chjhrb1Pojke4VBDgG82vko=
X-Google-Smtp-Source: AGHT+IGGfKJGG/Q4rAljVk3UqCKn/d5qyBT4D8dPr4LFamb33e8GDxrNMQYtV+VfQrw1JC+Y6Es7dA==
X-Received: by 2002:a17:90a:c105:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2f2e91c4d7cmr6811278a91.6.1734559276765;
        Wed, 18 Dec 2024 14:01:16 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62d9cdsm1929702a91.16.2024.12.18.14.01.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 14:01:15 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so33705a12.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 14:01:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvg4Mi6UG0kPyKgdf0aOLJbr7uixEwFQatW41KGl0Bniu6j66l0qUThIJppm7uoFTmhobKStgiOcCtaA==@vger.kernel.org
X-Received: by 2002:a17:90b:2f4d:b0:2ee:6263:cc0c with SMTP id
 98e67ed59e1d1-2f2e93a1b2cmr7028286a91.37.1734559274989; Wed, 18 Dec 2024
 14:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org> <7d61cb1b-292c-4b19-b972-1666ba2a0a83@redhat.com>
In-Reply-To: <7d61cb1b-292c-4b19-b972-1666ba2a0a83@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 23:01:03 +0100
X-Gmail-Original-Message-ID: <CANiDSCsTw_d2N+dNXkYZf+TFB9yRvs+WaxsifGqCwqRdyppULQ@mail.gmail.com>
X-Gm-Features: AbW1kvZmlGnwwc1e3uFYQZ5apdq_Z7TRnYcTbV0R3xeDuFaa0Ege5gyxn_Kr4ho
Message-ID: <CANiDSCsTw_d2N+dNXkYZf+TFB9yRvs+WaxsifGqCwqRdyppULQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] media: uvcvideo: Prepare deprecation of nodrop
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

[Sorry for the dup email, I forgot to reply-all before]

On Wed, 18 Dec 2024 at 22:53, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 18-Dec-24 10:39 PM, Ricardo Ribalda wrote:
> > We intend to deprecate the nodrop parameter in the future and adopt the
> > default behaviour of the other media drivers: return buffers with an error
> > to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.
> >
> > Make the first step in the deprecation by changing the default value of
> > the parameter and printing an error message when the value is changed.
> >
> > While implementing this change, Hans found an error in
> > uvc_queue_buffer_complete(). This series also fix it.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v2:
> > - Improve cover letter wording.
> > - Add new patch to fix vb2_buffer_done()
> > - Link to v1: https://lore.kernel.org/r/20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org
>
> Thank you the entire v2 series looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> for the series, assuming you have tested that
> the modparam magic in patch 4/4 works as expected?

Yes, I have tested v1 in real hardware using ChromeOS kernel 6.6.

looks more or less like this:
# echo 100 > nodrop
# cat nodprop
1
# echo false > nodrop
# cat nodprop
0
# echo 1 > nodrop
# cat nodprop
1

With the first echo throwing a warning.

Thanks!

>
> Regards,
>
> Hans
>
>
>
>
> >
> > ---
> > Ricardo Ribalda (4):
> >       media: uvcvideo: Propagate buf->error to userspace
> >       media: uvcvideo: Invert default value for nodrop module param
> >       media: uvcvideo: Allow changing noparam on the fly
> >       media: uvcvideo: Announce the user our deprecation intentions
> >
> >  drivers/media/usb/uvc/uvc_driver.c | 23 ++++++++++++++++++++---
> >  drivers/media/usb/uvc/uvc_queue.c  |  9 ++++-----
> >  drivers/media/usb/uvc/uvcvideo.h   |  4 +---
> >  3 files changed, 25 insertions(+), 11 deletions(-)
> > ---
> > base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
> > change-id: 20241217-uvc-deprecate-fbd6228fa1e2
> >
> > Best regards,
>


-- 
Ricardo Ribalda

