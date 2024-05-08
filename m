Return-Path: <linux-media+bounces-11129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8E8BF898
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 10:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B973B23B2B
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3307A5338A;
	Wed,  8 May 2024 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="K9uRWPjf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2CBA27
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715157214; cv=none; b=QSUMvVh1fxBxBabncaQlz08XhEtRqzqKFBkZ+Xv9UUv+hL1uBAuceaY4tmTLrYQ7dk2/3GBXFs/ACxRb3Lrg6Z7jO4qqc8bMpcOeV1oKk6xV0WOYseGWKYqbabnqeCRUwdVDDFBHtoOKI6gNhzOm6ykJpi0ltr71Gpq57miXORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715157214; c=relaxed/simple;
	bh=yVA0FiOqbqE2S/DFz9MrWAmt57JjHMvIMtAeb/3chdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6dNZuPribCjwzUGEwlUsJM3s6EYRjUbsgEMhAElhHso8uAb/j1qT+ODISPDBd9AedRj+kRueOA/8V+HH9lykr0k+/OVI8sHTgcvqyYjxbJ/X9EzuUEYslhim79fK4FTMh2S3SkIQeekXV+7+RtXrjZQwsxieL0MQSNUGSWAVyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=K9uRWPjf; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f101b5d3bso703528e87.2
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715157211; x=1715762011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y4EwFqVETg6O9C1VDyvCbQ1UYKFlViM3dNLmDxh+rE=;
        b=K9uRWPjf6ZKRGjUAajZTF5RzrGQjVjybeBJbVmsdjx9FVOH+eO07nJN3V6C1PWMMP5
         EVEcrSWLEOBKYK88VF4rFtOBl5YdyH6j3lmPgbh0x40X5Riptr6FdMDokW+cj6jqMR9O
         7UrwUzq6gZhYtz6C+/w8JxprCZyDk68QN2TWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715157211; x=1715762011;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6y4EwFqVETg6O9C1VDyvCbQ1UYKFlViM3dNLmDxh+rE=;
        b=q+wNLr2HSTsMF1gg8NiReFbOPI49yRErd05su0e1+cHJSgyIh+CQdi9CLwVBpMCcMn
         X/Olt/3/oCWqQAXLOyyFckjJ5ohGHSMBrmXwf5qTXo7E3ELZQUQNzwNm1xzOjsYWVYxD
         byceStDlppYKYeFzghjpoCvm2vO/HWIUBYg/Ow+rPcj/kE7l3SQZ238DDCYSCh3PDpGF
         WB9f3vrW7wxPhtcgb2/CH0A00NfoZFJSBako+CtgV+QzLL+RPAew861M4Pc/UkpEQmdf
         oIer+UVzKz1k7F/SCYQqvE0YnTPbzY61EctCxxbxMAjgmMuotJgwm0DWYWCCuz3duacs
         Brkw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Q4/gWPYVHhnPfpznDK59s2rlsbE35bMdqDYmv4sZ60/GJsBzhSosBBJ6tk+Bhe8xJvESNZo8HWDt+npXl+oIsJgoTNykUODywhQ=
X-Gm-Message-State: AOJu0YyrIVinE87aAU71H6ewqixwRS/mfmTklg0JzDbyraYHso7a7HXw
	exDJ3jgML/yXncDt2Y4zma7fkUzgV706illspA/jDw2pJUs69ByGDq8MY7kCzQ8=
X-Google-Smtp-Source: AGHT+IE8WloieXoBNrz84YwZxVbzeE/8sdLkgTaGX4kiUy5piDKudNOJ6ss5nr4szNlRJ4Cd4qE+HQ==
X-Received: by 2002:ac2:499c:0:b0:51e:ee83:bb8b with SMTP id 2adb3069b0e04-5217d242e7bmr1063993e87.5.1715157211274;
        Wed, 08 May 2024 01:33:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q11-20020a056402248b00b005726b83071esm7424373eda.4.2024.05.08.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:33:30 -0700 (PDT)
Date: Wed, 8 May 2024 10:33:28 +0200
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
Message-ID: <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> Hi,
> 
> On Tue, 7 May 2024 at 12:15, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, May 06, 2024 at 04:01:42PM +0200, Hans de Goede wrote:
> > > On 5/6/24 3:38 PM, Daniel Vetter wrote:
> > > I agree that bad applications are an issue, but not for the flathub / snaps
> > > case. Flatpacks / snaps run sandboxed and don't have access to a full /dev
> > > so those should not be able to open /dev/dma_heap/* independent of
> > > the ACLs on /dev/dma_heap/*. The plan is for cameras using the
> > > libcamera software ISP to always be accessed through pipewire and
> > > the camera portal, so in this case pipewere is taking the place of
> > > the compositor in your kms vs render node example.
> >
> > Yeah essentially if you clarify to "set the permissions such that pipewire
> > can do allocations", then I think that makes sense. And is at the same
> > level as e.g. drm kms giving compsitors (but _only_ compositors) special
> > access rights.
> 
> That would have the unfortunate side effect of making sandboxed apps
> less efficient on some platforms, since they wouldn't be able to do
> direct scanout anymore ...

I was assuming that everyone goes through pipewire, and ideally that is
the only one that can even get at these special chardev.

If pipewire is only for sandboxed apps then yeah this aint great :-/
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

