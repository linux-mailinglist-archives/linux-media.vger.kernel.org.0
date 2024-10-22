Return-Path: <linux-media+bounces-20038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 794CD9A9D39
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233B41F2437D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A5A187864;
	Tue, 22 Oct 2024 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QKT8a2e9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22617B51B
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586530; cv=none; b=VEKAvMkZVI3ymaBpce1mbFcqnWwAi0JmBztaspx/mUtw8CuWHebbqcD5+le1uaA62GxSCJ2+dRzaTjUVrqFttVukxYWRvuW0w5MQ00ZXtx2LLQfhC5QhIVo6pqM6oNXronQeSJR+aweq2F/lNyFh+jksBwYbvzvxOzyMA+CGY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586530; c=relaxed/simple;
	bh=c0NMTTR5JL1Di73BNEWR805V2eCvwQdiqw0CWy0WIXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=reO5B6r8Vd5CDYq4++mD3JZ4crhc/ZgTJUSAO3PlEHIz1cWxcEU7k8FDEwEAgMT122OKFLzfClIImmNc172mAsGegBkfH/FP11Dh7HHHa1RIFWGAnE1Iy18O6RKaebFzOMBt0Dy/P5MiiwytjgllRzScg6/dXemw8SDp+/jS6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QKT8a2e9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cb47387ceso47689455ad.1
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729586528; x=1730191328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8i0a7jvEXBZjJllrGzrgyCiwD9G/M2/DO+l81c5UZVc=;
        b=QKT8a2e9KyoEkR4obPOgDRhgghUWltKWJawLuqSc/3t5j9i6m2IjQ9ya3u/ai4w1zu
         2OBR6afaqL4KqcHKuoW6Ww4yYpRD70VCsH8yW6lJavqW6LVh1kxuHgaFadL4TZo1lrpG
         mLW6Em4nICYkPLBy+3qqqz7p65qYp55LHrxuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729586528; x=1730191328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8i0a7jvEXBZjJllrGzrgyCiwD9G/M2/DO+l81c5UZVc=;
        b=KtZ43OTh2q43J/UkWWAJaQPxIO194SYhU8AW+wzTWZFavCwFuN7iIi+MQSaZnFtg3k
         fmvXuiqFf+MP3dRfJeEgqycf9qtKbfn5wImMVVqvGaBOj9b9EJ1f68e8Zw+ym3i7GdDY
         UIvxKqd0q1AjgZ8hM85+oyK0vUwA76l10Lx8dh3nzOBopOy7fXo01LiiSoyXM/CKqq6N
         f1MMWM0cx/rbtqA8rbYO7IEEq/wdWN7uXzi4DjchbwzPis2wfm+itJXxEOtw0y745ieG
         LOl2mqdSJMhFyA5WunEuwlT8d9rzDT2pZC6/jvvee4Un/EloByjej0RPBi8F46ygMXCV
         HAMw==
X-Forwarded-Encrypted: i=1; AJvYcCWifXo0oK12Hm+IfO62wYlgp7RWsz8mUyCcpONWTa1fr0JttcfIDaKiEkVdGuCeMgx2eArYsZhgLyOA0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK02AqLS3lh76Y3NVvs5MlTsJZUzDWKNDVhvraklCnIrGjnaF2
	OIAxvonEkw/ljar3oVz0VfyZJ4L+1Hpz3AB0p4ntlFy2ysU0uM/D5uapE6TFvz7vAr8Cp4fxYtg
	=
X-Google-Smtp-Source: AGHT+IHn/PBQCx9domyBSbuGD7UQQe6Xtw5nhvr4WZmkl8ZtHIDjn2yqg9Xnu/PLS1eHu/misqIzNw==
X-Received: by 2002:a17:902:d4ca:b0:20c:f0dd:c408 with SMTP id d9443c01a7336-20e5a77401dmr214655765ad.20.1729586528013;
        Tue, 22 Oct 2024 01:42:08 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db915sm38107905ad.199.2024.10.22.01.42.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 01:42:06 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso3936601a91.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 01:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJ3g7JPvDQB7QdwoAZ4kFbg50Grdb4U9gW2855z+VtLCkLSENxX53NHQN/XMfUJncIYFbeJ1TSnpDD/w==@vger.kernel.org
X-Received: by 2002:a17:90a:3dc2:b0:2e2:991c:d796 with SMTP id
 98e67ed59e1d1-2e561602e2bmr15745613a91.9.1729586525467; Tue, 22 Oct 2024
 01:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6714a6cc.050a0220.10f4f4.002b.GAE@google.com> <20241020160249.GD7770@pendragon.ideasonboard.com>
In-Reply-To: <20241020160249.GD7770@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Oct 2024 10:41:48 +0200
X-Gmail-Original-Message-ID: <CANiDSCsMAiEPhDLx+1aSHUsuYrFrC0vGn9q76nYOGwX=1pGjwA@mail.gmail.com>
Message-ID: <CANiDSCsMAiEPhDLx+1aSHUsuYrFrC0vGn9q76nYOGwX=1pGjwA@mail.gmail.com>
Subject: Re: [syzbot] [media?] WARNING in uvc_status_unregister
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: syzbot <syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com>, 
	hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, senozhatsky@chromium.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sun, 20 Oct 2024 at 18:03, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> >     media: uvcvideo: Avoid race condition during unregister
>
> It looks like the issue comes from the fact that uvc_status_unregister()
> gets called from the error path in uvc_probe() through
> uvc_unregister_video(), likely for errors occuring before
> uvc_status_init() is called. uvc_status_unregister() should return
> immediately in that case. Ricardo, do you plan to look at that?
>
Just sent  https://lore.kernel.org/linux-media/20241022-race-unreg-v1-1-2212f364d9de@chromium.org/T/#u
to fix this issue

We probably want to queue:
https://lore.kernel.org/linux-media/20241022-order_status-v1-1-3904fafca340@chromium.org/T/#u
at the same time

But I am not sure if I should also mark the second patch as Fixes

