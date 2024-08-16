Return-Path: <linux-media+bounces-16370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACEF954698
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2981C21D23
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9113F17C9B8;
	Fri, 16 Aug 2024 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgRpBmDW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE81741D2;
	Fri, 16 Aug 2024 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723803422; cv=none; b=kiEWNJLNtJQlxCBlSNVhqTv1p0tNxeUIBj1OlJQiHLTlgM2qyJflv+d5IwrPoE8ODRhDqWnzHxCulFmxreOgflCmSlfxF7kGHwG2hXdhD++BFt5zyJtXdU3829k7Bg3Ge+nU07CO5Zc6Q974ux7e/lUs5jFpTKP/qcolwdOtNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723803422; c=relaxed/simple;
	bh=UKvo9fd9PTLfDAV/lhr4KvN7L5eqiqCppa2M3BLPd1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffVzn+7cMabzZuh7P6bXuZAcBC39GxSjz2fToyICfSbPSN3OBCCzlsgKYuN/KnB/IzgbO/HiloLBCmTxH+OAgJG5NVGs725Cwr0q8+rf9ZTd+wPvnbjDPrkzh//dWfAEk2MtHZ3C1FdiQRhsG7mu7WbG2EEoUvr/oCFGQn1ooxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgRpBmDW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD4FC32782;
	Fri, 16 Aug 2024 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723803421;
	bh=UKvo9fd9PTLfDAV/lhr4KvN7L5eqiqCppa2M3BLPd1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pgRpBmDWNjgg+MA+1x4kD9VkLeNa8/xH+39Qtj0Bmi2BUrnYokjJCuEGylCkaRi1g
	 ggWMs++Zi4fAhER016y4yTBN0C4b/6IDt22WRbTMHzLNvEKpD96OP7jkjSfwZPGwMS
	 bZ2D/uyRgvskVIah1LX4uF0eQ9QdXyn4x62X8M6wC8VsBA/521mdvT/ggcPf35Jbxb
	 hk1ULfeqt6sJwJbdmEvosp7DNTNELbxoI6A0m05UxJB94T5e+QIvdxOgSEmnwTeM4v
	 nrBcU7RTWJIU8o3q+MZXdrxmsi+G5O81PNEOiqjo29xPNW9GuFCj1DvpDVi+4EN03k
	 80VVjxtOV69Cw==
Date: Fri, 16 Aug 2024 12:16:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 2/2] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
Message-ID: <20240816121657.69898770@foz.lan>
In-Reply-To: <CANiDSCtk=_Qb4aC15otZiUrdysV2h82ihbA2eP2kWyQSovq=MQ@mail.gmail.com>
References: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org>
	<20240814-coccinelle-followup-v2-2-88b4e4a9af56@chromium.org>
	<20240816101642.5ef4e461@foz.lan>
	<CANiDSCtk=_Qb4aC15otZiUrdysV2h82ihbA2eP2kWyQSovq=MQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 16 Aug 2024 10:20:47 +0200
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> Hi Mauro
> 
> On Fri, 16 Aug 2024 at 10:17, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Wed, 14 Aug 2024 14:10:23 +0000
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >  
> > > Split out the wait function, and introduce some new toys: guard and
> > > lockdep.
> > >
> > > This fixes the following cocci warnings:
> > > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> > > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> > > drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809  
> >
> > Hi Ricardo,  
> 
> Hi Mauro
> 
> >
> > Every time someone tries to fix this lock, we end having regression reports,
> > because of the diversity of devices, and the way they registers there.
> >
> > That's specially true for devices with multiple frontends and custom
> > zigzag methods.
> >
> > On what devices have you tested this patch?  
> 
> I do not have access to any device, it is just "compiled tested".
> 
> I think that the patch is mainly a refactor, it does not really change
> how the lock is handled.

While I liked your approach, in the specific case of this lock, I have 
to disagree: there were at least 2 or 3 previous attempts to fix 
issues on it, with patches made by someone and dully tested on some
hardware, ended being reverted due to corner cases with some boards.

So, I'm not willing to take the risk of accept patches touching
dvb frontend locking schema without tests with real hardware covering
common and corner cases (multi-frontend, custom zigzag, ...) and/or 
a formal code verification to proof that the lock works on all 
circumstances.

Regards,
Mauro

