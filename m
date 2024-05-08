Return-Path: <linux-media+bounces-11131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A98BF8E1
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 10:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7915B26ADA
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 08:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3DC6D1D8;
	Wed,  8 May 2024 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="X9Dksld9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077C6CDA9
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715157527; cv=none; b=EnauXuuamGyoL/RZ+3/TmPWn6bNTRx5EN4Px9nUg1JYWjwhnHLraPy6frIJt9mRRNb7Y/KXG5smq677u99S76r12DPECaSwo322ffXP0wOMrFdcSMxdstWDelxKAOuke7PB0C7MgW9E8tZy6K6XQJ1jhfRfkbLsTadrggzlp5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715157527; c=relaxed/simple;
	bh=V5spKHAJYycDPIb8qjonfW7CCAIoHcDr+o3JbjTG3F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=h1EGQgX0tT1CYzcxwFLrh4Rm7dzmx6uBuLk0dc+/bU0tjgv2koN5+nlo7RkMwpBbZrvbHBCB2HYz3WvdRmLF8mKEZFonJVOm3UuqKnWrOP+GWq5jRzqokSHA72uy8jW8YOr1N7BQqGBZR1F9WkcEX3XWiKFz0PhSY7U0uLPkxyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=none smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b=X9Dksld9; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-792706dbdc6so36656885a.0
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 01:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1715157525; x=1715762325; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5spKHAJYycDPIb8qjonfW7CCAIoHcDr+o3JbjTG3F8=;
        b=X9Dksld9Hez5TXYfe0vX/RwJZUXUSojsLUbLwU4I1s2L9JAR8+Tcev8RFoUoRJjEA8
         KV6Kvcb4Vxh9qgcnT+BmHh78QJCPk12NI9GOapqf73lHse6mqJ/zd/5vb2EzoE9uLx1l
         NytKZoC5ybMLpv/O75by4/gSjyCB3GJQ2Zi+g3NEDXT3WC4sbLEuG9+qPjmJ5m8RKetj
         L5f3k4PTY+4THtT0DciShUX5uw7vdOLJnagUZhQu7Zh+WIkh5K2sZf9GWHiVTK8QCxGj
         bPC2gUyNxYCG4MYbCdmQD3DyvyxZILEqhziLxv4OPujtgGOSCQG7JpMBkjhyRZPhfzN3
         9D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715157525; x=1715762325;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5spKHAJYycDPIb8qjonfW7CCAIoHcDr+o3JbjTG3F8=;
        b=LCKHCLVpbGEPzEczKmaAwLo7kCaM3rO0kUHz1a7zuO1DOgJR+op/4CHgQUKaHGtXbi
         6pZWkSGzMh+uDzhILmRHHzf4e9oTlbTFYTHZSCeYQvIFk1RrzXAEGzrSEL6lqCI/S/yr
         wMJcVNc7+3h2FvW89mIHUU+GzD8FzJeh+ttcl4JG1TmLcSOVrZ+xlb/jasvc8FL0NTqx
         ZmnvDR6KfhILQeRDlSrXrhBXD2v0PtLKvwmMD2SzILh6wm9zuo/2qBAFKG95Rzfs60PA
         oTQbzIhWrtt12Vxov/7QyzVGRxQoOpCv1aKukjtEz/D4TZ4Pqb05pK4hUxOPMclH4Joa
         //ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXbVUlf7uMbEmw7XhY2+V9RqK9uAhZL8E389QR+a6TIQcI6NtBdRHky4xQa2W9tLnEV48QxBff/tloHbxpuLjkBj3IigRvamDZgfj8=
X-Gm-Message-State: AOJu0YxXU+QitjvMAUcpvHoUw3nDL68HRidN9UH5a0lZUzvNqDgAqihl
	gCEI/xWMlXTHJWnmDk4VZDhDB8Zn21M39DpVTQlgguzu7xUD1rVduXeJgNWqGDt29hT2eq4E3fo
	sYRFY3zQUdE80h5cJejOi2nigO1iNBo8uI+Fw5g==
X-Google-Smtp-Source: AGHT+IGBmSz6eFLsDLHd1HFg7kcp7kmSokUNcM7b494MpO41SWF9RR8A0fpKHutyvvQMYFPwHGwiGt9z4eDnQ5YljZw=
X-Received: by 2002:a05:620a:4593:b0:790:b14b:21b9 with SMTP id
 af79cd13be357-792a6481401mr809884385a.18.1715157525012; Wed, 08 May 2024
 01:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat> <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com> <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com> <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
In-Reply-To: <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 8 May 2024 09:38:33 +0100
Message-ID: <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Daniel Stone <daniel@fooishbar.org>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Ripard <mripard@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 09:33, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> > That would have the unfortunate side effect of making sandboxed apps
> > less efficient on some platforms, since they wouldn't be able to do
> > direct scanout anymore ...
>
> I was assuming that everyone goes through pipewire, and ideally that is
> the only one that can even get at these special chardev.
>
> If pipewire is only for sandboxed apps then yeah this aint great :-/

No, PipeWire is fine, I mean graphical apps.

Right now, if your platform requires CMA for display, then the app
needs access to the GPU render node and the display node too, in order
to allocate buffers which the compositor can scan out directly. If it
only has access to the render nodes and not the display node, it won't
be able to allocate correctly, so its content will need a composition
pass, i.e. performance penalty for sandboxing. But if it can allocate
correctly, then hey, it can exhaust CMA just like heaps can.

Personally I think we'd be better off just allowing access and
figuring out cgroups later. It's not like the OOM story is great
generally, and hey, you can get there with just render nodes ...

Cheers,
Daniel

