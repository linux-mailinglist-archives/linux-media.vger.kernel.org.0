Return-Path: <linux-media+bounces-14446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638291D9BA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 10:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496DF283202
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83FB81ACA;
	Mon,  1 Jul 2024 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NReaSIe4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9249C347B4
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719821599; cv=none; b=i/DggV6/i836T+o6/+o2cWgeyZOEV93vzahhP6aUFK3z+w5xCNOJPPglEOscix5XUN2K3b2NAYFjpZBN16TtA3WTgrNAu0DT5GieolbjlO67vpW5PVqNHzSxfs5JoNWtYV8hOcUYA8+f7y9zok1+dKmuzrK67gUwJOTuuPZoX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719821599; c=relaxed/simple;
	bh=hTA5H1kxJqoc24YgOxtJ0kPJ8ILBfBNoWO9ZdEWUL6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3QA+qpR/QnYRnYiMt8YA467k41uKdTunIgwa//PtgGDVUj+j1rhuqp5q0IEW5sryrHNlIuMXoO8Frd1BfR6y+7go+7+wS8kl4k1HC8dinF576MGsPFZ97Lf7vtnVXZ83d7C3VvoyHKLo3Y8CTgTsrk4wfC89AppT53H/O2ogCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NReaSIe4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cd80e55efso4549676e87.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719821596; x=1720426396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gqgIjBbJFNQTz+FjlDyYIsRmqrtCxhYYEA7HKA9NBxE=;
        b=NReaSIe4Au4W/ezQj1wCj/pnQGUvAsULDIURF4826YbXUpZeLY3RD0/iq25Jh6wdE8
         +8b71kTE7OPCLoEHdj0FaMl8QXlqf/hBC9wM1u5aI8tZDRoweuFliiz50HX3zQpJ0quN
         /XepoiW0d348giPJv5UEfPFyc8+cQhYRVXm/9zIjcKgunPW3cMYD1K32nMB1ej7fZ4IO
         qILfuoZ4e89kAMzjv/pCQOMF1/77PLXhwm3CyJM5aGFBilT1j6BtiEx8KLa9H7BIuBIx
         r/XUyzpn+Ltu+tdImE4PKbuGnqROBMbC9AHAEPdMlLub2/7O4fAvXD/VzTrj4/oKoj/x
         F3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719821596; x=1720426396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqgIjBbJFNQTz+FjlDyYIsRmqrtCxhYYEA7HKA9NBxE=;
        b=d9aKUFJBe4m9mjeztrppqgvzL7kS/MD6DDNCaHW2tOZ4ze6BOvzmAGBeDOdaL/hsfk
         /DM4rPWe0MlxlW9amzQStad5g+lo8UYX/w+CV5+GImSYp+zGVzsQqLSRuhOJH0u6wSuW
         KHoo3gf2M69wTUA4LVie9FYbfvI+Ae5lFGFJf2Bu0Eo3kPPXOScyXzziGJkACbOSS8bD
         hA1ae4voVVIjFMo5rcscPWMPhYy8FM0rEx0eb2apEk05jvS7tFkc8JJ/vzsRg3iLSh8m
         gnCO6wNZtvV5mXjF32g0OC+uwEUXAuEKXNFZEdqrodSQ9uArPKLVJY9eqogARfuGXnmA
         hRdw==
X-Forwarded-Encrypted: i=1; AJvYcCUSWJQvIAXDeD+GjUJZV6Ia+gtK0HSzYV+RVXLrXOP5M0RmeWrd60tOTp806kbbOtyD4mgbaUeFHzGUG71cAHd0SxRw7UFcmWEV9DM=
X-Gm-Message-State: AOJu0Yxpx9TMvAEFDLGchxYIoU5bnDmX/Blxv8rYBKPdo4xeVZ9jxzQU
	2zKmZd2CymPtA4uHb4cBRgqiWlOzKZ+W/C4MfUhQEWHYx933DZE=
X-Google-Smtp-Source: AGHT+IHtl15jurydZ7PfpWtIPHWpLUVhENEtDbLmFECMn7XwRUZ8K/FgTAd1Rbq7RDKartMFpGwROw==
X-Received: by 2002:a05:6512:3e0c:b0:52d:b226:942a with SMTP id 2adb3069b0e04-52e825ccc64mr3937511e87.0.1719821595308;
        Mon, 01 Jul 2024 01:13:15 -0700 (PDT)
Received: from sophia ([154.79.248.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab06563asm308572066b.117.2024.07.01.01.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 01:13:14 -0700 (PDT)
Date: Mon, 1 Jul 2024 11:13:11 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: jaffe1@gmail.com
Subject: Re: [PATCH 00/10] Add loopback support across multiple vivid
 instances
Message-ID: <ZoJlFw3O3qAKYcnL@sophia>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
 <0aae5a22-9c4f-45ce-ba34-2ddab250aac9@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0aae5a22-9c4f-45ce-ba34-2ddab250aac9@xs4all.nl>

On Tue, Jun 25, 2024 at 09:56:24AM +0200, Hans Verkuil wrote:
> Hi Dorcas,
> 
> On 24/06/2024 11:52, Dorcas Anono Litunya wrote:
> > Hello,
> > 
> > This series sets up loopback support for video, sliced VBI data and
> > HDMI CEC across multiple instances in the vivid test driver. It also
> > updates documentation to reflect changes made.
> > 
> > The first 7 patches do not implement the actual work but are necessary for
> > setting up the next changes. They address documentation issues,
> > fix a g_edid bug, resolve a vivid crash when no outputs are configured,
> > and add the instance number to the video input and output enumerations.
> > 
> > The 8th patch adds the controls and infrastructure needed to enable
> > loopback across multiple instances.
> > The 9th patch enables the video looping code and CEC support.
> > The 10th update documentation to reflect all changes made.
> 
> Thank you very much for all your work on this during your Outreachy internship!
> 
> It was a lot more complex than we initially anticipated, so I am very
> pleased to see this patch series. It's a really nice improvement to
> the vivid driver, making the emulation of S-Video and HDMI much more
> realistic.
> 
> It was a pleasure for me and Johan to mentor you.
> 
> Thank you!
> 
> 	Hans
> 

Thank you so much for the incredible support from you, Johan, and the entire Linux
community during my internship. I have learned an immense amount, and my interest in
contributing to Linux has truly been ignited. This experience has been wonderfully
enriching, filled with support and opportunities for learning.

I am thrilled to see the feature working and contributing to the vivid driver’s improvement.

Warm regards,
Dorcas

Warm Regards,
Dorcas
> > 
> > Dorcas Anono Litunya (3):
> >   media: Documentation: vivid.rst: Remove documentation for Capture
> >     Overlay
> >   media: vivid: Add 'Is Connected To' menu controls
> >   documentation: media: vivid: Update documentation on vivid loopback
> >     support
> > 
> > Hans Verkuil (7):
> >   media: Documentation: vivid.rst: fix confusing section refs
> >   media: Documentation: vivid.rst: drop "Video, VBI and RDS Looping"
> >   media: Documentation: vivid.rst: add supports_requests
> >   media: vivid: vidioc_g_edid: do not change the original input EDID
> >   media: vivid: don't set HDMI TX controls if there are no HDMI outputs
> >   media: vivid: add instance number to input/output names
> >   media: vivid: loopback based on 'Connected To' controls
> > 
> >  Documentation/admin-guide/media/vivid.rst     | 185 +++++--------
> >  drivers/media/test-drivers/vivid/vivid-cec.c  |  88 ++++--
> >  drivers/media/test-drivers/vivid/vivid-core.c | 250 ++++++++++++++---
> >  drivers/media/test-drivers/vivid/vivid-core.h | 125 ++++++++-
> >  .../media/test-drivers/vivid/vivid-ctrls.c    | 262 ++++++++++--------
> >  .../test-drivers/vivid/vivid-kthread-cap.c    |  86 +++---
> >  .../media/test-drivers/vivid/vivid-vbi-cap.c  |   5 +-
> >  .../media/test-drivers/vivid/vivid-vid-cap.c  | 115 +++++---
> >  .../media/test-drivers/vivid/vivid-vid-cap.h  |   2 +
> >  .../test-drivers/vivid/vivid-vid-common.c     | 134 ++++++---
> >  .../test-drivers/vivid/vivid-vid-common.h     |   5 +-
> >  .../media/test-drivers/vivid/vivid-vid-out.c  |  25 +-
> >  12 files changed, 859 insertions(+), 423 deletions(-)
> > 
> 

