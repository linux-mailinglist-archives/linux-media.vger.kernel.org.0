Return-Path: <linux-media+bounces-10611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A2C8B9A30
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A3CAB2274C
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B65664DB;
	Thu,  2 May 2024 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwG9cxcY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015B60DE9
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650177; cv=none; b=hV2RBfpiIm1yUToeHkpepNa5JNHKqgXSDQWYzMtgvz34JCjG5Sb6WmalNl1moR25xrC8ZKdMisemYLfHwbkQMEZLdsjEpAeaGh93Xy4ykkpvj+NtHe9/y5/66hFXm+oZIhrTYnev4SJwxbaLwcIledp5qRUyG88QjQKPaw2rUT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650177; c=relaxed/simple;
	bh=sBE3/u8QimjrRY9BrfcvM1t9rfE3khEgWmKYUh/Ghiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C23f8n0dZQm6FtNzoecR9h87w8XOq06vS0Dn+rif+mWh8F78SC04WsnLzjYWM4Re/KEhuI5oHiYkrOqUFxiHA2YWNLcQ+JMEEb3VWhc1RDEw3LRoTq6/g0Egon68RaFM5kfJdrxcjut7O3S8sUEnkTZzFElU1kNMWWYcFrsCVYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwG9cxcY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A89C113CC;
	Thu,  2 May 2024 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714650176;
	bh=sBE3/u8QimjrRY9BrfcvM1t9rfE3khEgWmKYUh/Ghiw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kwG9cxcYXtBzy8QLdR0ZDN9fdrlS6ZrvsmjfbmboOdrhrIr3AuiDjiQoKm5bNtnnO
	 T6QfzdB3JmInbLvLyovaxT70FK1YpCBvajk8Kd5bCaDzrshOgt86FR9FNI1Wxg9O9R
	 kwSOEApcZZuoa/PsVdADhGjQawyS2SVhvkoNdnRg2njQLz9AsyouNmCS/mc1JZE75t
	 6Imf6NfLknWIRZU3+bG5WWmwt7L+BP5h08aF4evJJ3JZTDYLVjeDSziHWegAUYMHHX
	 GIe4bf7nsQze7E+qI1XLercvr6K9mP8eldSOZei+NKxm+YSh74hPft3SCyRZLwu2qB
	 YCP+GFzaL3XQw==
Date: Thu, 2 May 2024 12:42:51 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Ricardo
 Ribalda <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT FIXES FOR 6.10] IPU6 and Unicam fixes
Message-ID: <20240502124251.0aa5879b@sal.lan>
In-Reply-To: <ZjNs9k7NH7pubibu@valkosipuli.retiisi.eu>
References: <ZjNQbS9CF1U6lGWx@valkosipuli.retiisi.eu>
	<20240502112547.3170d33c@sal.lan>
	<ZjNs9k7NH7pubibu@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 2 May 2024 10:37:42 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> On Thu, May 02, 2024 at 11:25:47AM +0100, Mauro Carvalho Chehab wrote:
> > Em Thu, 2 May 2024 08:35:57 +0000
> > Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> >   
> > > Hi Hans, Mauro,
> > > 
> > > Here are a few fixes for the IPU6 and Unicam drivers, for issues found
> > > since merging them. Most are are due to Kconfig options.
> > > 
> > > Please pull.
> > > 
> > > 
> > > The following changes since commit a1c6d22421501fc1016b99ac8570a1030714c70f:
> > > 
> > >   media: staging: max96712: fix copy-paste error (2024-04-30 14:33:08 +0100)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-1.1-signed
> > > 
> > > for you to fetch changes up to f28348ebadf7c7127646672f363e055cb19f3b66:
> > > 
> > >   media: intel/ipu6: Fix build with !ACPI (2024-05-02 11:34:26 +0300)
> > > 
> > > ----------------------------------------------------------------
> > > IPU6 and Unicam fixes
> > > 
> > > ----------------------------------------------------------------
> > > Laurent Pinchart (1):
> > >       media: bcm2835-unicam: Include v4l2-subdev.h
> > > 
> > > Ricardo Ribalda (4):
> > >       media: bcm2835-unicam: Fix build with !PM
> > >       media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
> > >       media: intel/ipu6: Fix direct dependency Kconfig error
> > >       media: intel/ipu6: Fix build with !ACPI  
> > 
> > The above were applied, thanks!
> >   
> > > 
> > > Sakari Ailus (1):
> > >       media: intel/ipu6: Fix vmalloc memory allocation  
> > 
> > I didn't applied this one, as it sounds to me that the fix is
> > incomplete. I sent an email with the potential issues I found on it.  
> 
> This is a compile issue at the moment.

On such case, please include the compile error at the commit message.

> There may be other bugs (like not
> releasing the allocated memory) but it's a different problem. That's why
> I'd merge this one now.

If I understand well, there are then a couple of issues there:

1. the driver doesn't compile if no vmalloc;

2. the driver currently only works with vmalloc, as currently the firmware
   load logic seems to depend on it:

	if (is_vmalloc_addr(fw->data)) {
		*firmware_p = fw;
		return 0;
	}

3. the driver has memory leaks: it doesn't de-allocate what it is
   stored at *firmware_p pointer (nor the isp structure).

I would expect a patch that would at least fix (1) and (2) altogether.

I mean, if the driver can't work without vmalloc support, it has to
either one of the possible fixes below:

- depend on some Kconfig symbol that will prevent it to be compiled
  when vmalloc is disabled/unsupported;

- depend on BROKEN;

- have the is_vmalloc_addr() and vmalloc()/vfree() replaced by
  kvmalloc()/kvfree() at the same patch.

Regards,
Mauro

