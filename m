Return-Path: <linux-media+bounces-11156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7668C0168
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 17:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6D2EB26D15
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 15:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EA212838B;
	Wed,  8 May 2024 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="i9NmfYy/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4CB1272B4
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715183356; cv=none; b=d5/mUIyo7WKYBLy5XE8EN5a3ONApbT4OqVus+tp90lA7XFlUfzyskwoNlRjhZC390bxaXj7UGBCIYhbZ/oFfk2UEfff9R4Zp658wpFr1g2F+1qxmVLHktqVT5H24A5p+fCxtHHSF7UAYLP8OuiQWxyhD8MdMR5XSwUVWgkTzsSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715183356; c=relaxed/simple;
	bh=dDldPAWgK3aHYxFKJeEMDAHPihDjHWlCbgRnE2GA0II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfeVZj/mjrUz6VX3noagYqn+WUzRQ9cW5Y/fFYQFbqONRWKCmYT6uONNMgVQtaWluOIVkitOJCOrQ9G34V50Ujum5TEyycjHFEHrY/BEiAbNfc1IPxkFQ1H4BQT7gk8RyaCMQ3Wp8Jg//xBTzmDLSTAXTiqhi0gwPWTUW3m3SrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=i9NmfYy/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a0906a7aso131354766b.1
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715183354; x=1715788154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoDqdwsBKbW6uamNTf2oglOPRrPuT52r8TIKcUq8IZI=;
        b=i9NmfYy/riqdrrMCeh//gZF/MwoaYfymy7aP0+5sILKjmifMJwz9nRlO9w2nXSiqBO
         Lv+NtYL0qknyDjaYosvL7Ii3E25oQ5ZSJAzZWG63RRmjIj9Qp4GoVV6TCiNNwD+fYmTy
         NR6s8tiAasRCfChRaRSmr281HfQEeo+ezfsig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715183354; x=1715788154;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoDqdwsBKbW6uamNTf2oglOPRrPuT52r8TIKcUq8IZI=;
        b=Fbyy+vTAV1YB6ozglF3XnI0wBgF9Rbb7NG//Mtq0vnHfCwd4ieEeZOKa6LghJVN6na
         O8xsi4k6xVLRhWT56OOrmTkkJSt/1eb6qu/riVw+TnEQ+2CNT668nmw5ozxrrCaPLEDt
         enODylbjjC3QvBHTxIp7c/aXzkqSDAqmALnKqlxh7A2AxyEwIzs6qWHWC+l0dgVnjFLt
         LdkJgyXjz4gJnA0ywGW/B1zjI8foHTaI2OyqQrGis+Pc5hWaBAw1oDnJEUXlHJr/FR1o
         bT9n+2P3l16uIEXrXTFz7W8sG1TBewm9sidWAJSv/ezyrFcRcO0wIOLDhteTELp0h26J
         b/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2/mhchddj2zBwhz2fxtrNnznHyzzttJ0W5UyHd8j2k1FC8dbDMeEmHNM1x7LepQxO8tOwhh9DD8UJzkUHEX1ImOXPqTR7MpTpS7U=
X-Gm-Message-State: AOJu0YwAr0tlMYk4LltNzz6dzI7afDDwWIDT+dRYQwUNfLrIhMJaGpHn
	8REKSBPpgQLZIlhCp9O4BxIK/Tbq+o8FhnGrw69V8XzVRgpw579D+lnbZQCXkc4=
X-Google-Smtp-Source: AGHT+IHNn3Lgz5HYD12HsLRBBsnhqDUZ5S5EpU/nc5htxmMB22rLQkSpt/QiZ47OvSMSsvksPpaYBw==
X-Received: by 2002:a17:906:df14:b0:a59:bce9:8454 with SMTP id a640c23a62f3a-a59fb94f6d3mr192308366b.1.1715183353735;
        Wed, 08 May 2024 08:49:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id uz14-20020a170907118e00b00a599adfd49dsm6452017ejb.64.2024.05.08.08.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:49:13 -0700 (PDT)
Date: Wed, 8 May 2024 17:49:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> On Wed, 8 May 2024 at 09:33, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> > > That would have the unfortunate side effect of making sandboxed apps
> > > less efficient on some platforms, since they wouldn't be able to do
> > > direct scanout anymore ...
> >
> > I was assuming that everyone goes through pipewire, and ideally that is
> > the only one that can even get at these special chardev.
> >
> > If pipewire is only for sandboxed apps then yeah this aint great :-/
> 
> No, PipeWire is fine, I mean graphical apps.
> 
> Right now, if your platform requires CMA for display, then the app
> needs access to the GPU render node and the display node too, in order
> to allocate buffers which the compositor can scan out directly. If it
> only has access to the render nodes and not the display node, it won't
> be able to allocate correctly, so its content will need a composition
> pass, i.e. performance penalty for sandboxing. But if it can allocate
> correctly, then hey, it can exhaust CMA just like heaps can.
> 
> Personally I think we'd be better off just allowing access and
> figuring out cgroups later. It's not like the OOM story is great
> generally, and hey, you can get there with just render nodes ...

Imo the right fix is to ask the compositor to allocate the buffers in this
case, and then maybe have some kind of revoke/purge behaviour on these
buffers. Compositor has an actual idea of who's a candidate for direct
scanout after all, not the app. Or well at least force migrate the memory
from cma to shmem.

If you only whack cgroups on this issue you're still stuck in the world
where either all apps together can ddos the display or no one can
realistically direct scanout.

So yeah on the display side the problem isn't solved either, but we knew
that already.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

