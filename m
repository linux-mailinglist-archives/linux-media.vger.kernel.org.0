Return-Path: <linux-media+bounces-21223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B139C3211
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 13:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08679B20CC5
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 12:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F0E156F3B;
	Sun, 10 Nov 2024 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYsJbvt9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E2A142E7C;
	Sun, 10 Nov 2024 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731242894; cv=none; b=JRnvOj7Pz+8FzBjQNFI93eRcJFcY6KYacESssksyfi9vBnt2SRv1Afxfmz2m9yPpx0M5ensQPy1GaC6BsHvs4QYNA6fwvnH0bA6t32yZks4EHADh/UB5yFDVhdWbksGoKCqbFAzV7xpbAunx1ZGoVIPUHKH7rnpD7MUADmatYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731242894; c=relaxed/simple;
	bh=ZBBP9tCs7B8oMNkOKGW5MTUmJLU36fHH0WHhmx+Si30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwfDqcgyTTYKAELAhBEOT0Mh9KmzXNOGq85ZS4atg9E0O48fQu2wLTUYrRCdGDgiKt/CryliTDIvlBR1PzBEhue/KmuYjwEDLvZCWYv6QO5deNBo1HLDFDjUqxDIUnt4VnFSGuumqcp1eF01zKgGBXiSy2xhZigcaK/FIRw2RZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYsJbvt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4A7C4CECD;
	Sun, 10 Nov 2024 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731242893;
	bh=ZBBP9tCs7B8oMNkOKGW5MTUmJLU36fHH0WHhmx+Si30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RYsJbvt9E4P4f2k3tcOJO5gfGQ4ASX7P2P0frhgmFcO/Kt+k9TEHpToqphAOzCSmz
	 yCYNVgycQkmikZc0iM4XrjCEgZV6GafhrPnqw0egfnfLSQZHfAHCCT/XfToTEdLE5v
	 5Vs3y/3Cr1gtMEg98EW8Fcj31uIxKKK6MJmjyxVbjHT+PhinSlVTGF0MSQH4XuhQBN
	 u5tfS4tvaJOFxVRE20iMPlJh4V1+Co4hU8FxlCDlZ2FUUCnvajrfYVUGaNr6E6Kwf0
	 Gx18DElbhz7fXcw6co6foJZpf5NAUv3rePR234xUcgv/X0CJYuAMOj37QjJjDeSaPD
	 PGUphnYeQwSdg==
Date: Sun, 10 Nov 2024 13:48:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Yunke Cao
 <yunkec@chromium.org>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241110134808.328da075@foz.lan>
In-Reply-To: <CANiDSCt=Qht8CwAxCkpn=5owtQ_JBUkK+9yaLsZ5W2RJJxbz8A@mail.gmail.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
	<5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
	<CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
	<20241110110257.5160a7d1@foz.lan>
	<2fd9053f-34b6-4e97-a898-98fd71a485e8@xs4all.nl>
	<CANiDSCt=Qht8CwAxCkpn=5owtQ_JBUkK+9yaLsZ5W2RJJxbz8A@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 10 Nov 2024 11:37:46 +0100
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> > > Privacy matters only when streaming. IMO the Kernel check for it needs to
> > > be done at DQBUF time and at read() calls, as one can enable/disable the
> > > camera while doing videoconf calls. I do that a lot with app "soft" buttons,
> > > and on devices that physically support cutting the video.  
> >
> > We could add a vb2_s_privacy(bool privacy) function to vb2 to tell vb2 if the privacy
> > mode is on. And if so, take action. E.g. calling QBUF/DQBUF would return a -EACCES error.
> >
> > That will ensure consistent behavior for all drivers that have a privacy function.  
> 
> I am not against adding a feature like this, but we still need a way
> to notify userspace about a change of the privacy state when the user
> presses it.
> Controls are great for this.

It doesn't sound a good idea. See, from users PoV, they want the stream
to start with black frames when privacy is on, and dynamically being
able to enable/disable actual frame output. So, the best is to have the
stream running independently of the privacy being enabled or not.

Thanks,
Mauro

