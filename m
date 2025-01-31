Return-Path: <linux-media+bounces-25469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF66A23EFB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 15:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E33A61889F8E
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 14:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366191CAA93;
	Fri, 31 Jan 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quKJce7P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971A81B6D14
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332395; cv=none; b=nl3qs7NIGe5lcwWRNgO2LYMUPdFJt9TLdq7Rl426QlWxbw0+Z2CnDAUh/G5QY+SsWlVblMJ4ocVuszwcXYuMO+u04swn52nPSM/M76rRq8qi6A3AXF+7k/3TuA89Fo03mYZK+YR9iMDNETCFYM6UqnIX4OKp9QU+kJlFV80yLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332395; c=relaxed/simple;
	bh=bbHMOvmpYtnde+6m8uTF/xjqCpT2Eu/9mzGqaBCJiis=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOSLrfSoQBeoho0ooMqyTc9ILrj+g3cl1+b0/hrLIutmHB6aZYGLL8GpfRNrBJgusKwRs2f0eRyLDPWZXvmjT/yeOxr8zMrFmMhVdEPMNHoM4GuawdGnYm4TSTezo+szxOSLq1d46dlzl57cBWYsoCkrApVG1GQTqQrI8p/f+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quKJce7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8437C4CED1;
	Fri, 31 Jan 2025 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738332395;
	bh=bbHMOvmpYtnde+6m8uTF/xjqCpT2Eu/9mzGqaBCJiis=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=quKJce7PGpVtHW8tbuFwCHSdcLDPUzR6Ns5eJy0WbyJ7O705k08n4DcxScdDrzv0+
	 RYHVWdngoW0sM0lTJ0hRHVbzq2l9gB3nIYx4QZsfS8NI8l9we2Cqrn5Ap9+5nsiRRF
	 QH4sfH63fkMDoY3/KQCdobVs4ALUmybsOdbIA4tXAaZ0jwq5P+8N2LqlmrqdH6JxLP
	 4RjEgA3Qpby450GC4LsNHlvEIX7h1/fagzNcGY77iycDsSlQTnFCmQpbf7cvH97YUs
	 3XjnTw1bgY/nYBO25AyvKwsj8ZMZ2/xkcHTN0gI6A3kyMOiruT6o9xjiovHK8gByzP
	 PruR8SsyYX6ng==
Date: Fri, 31 Jan 2025 15:06:29 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Thadeu Lima de Souza Cascardo
 <cascardo@igalia.com>, hverkuil-cisco@xs4all.nl, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, Tomasz Sikora <sikora.tomus@gmail.com>,
 kernel-dev@igalia.com,
 syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
 syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
Message-ID: <20250131150618.6987c1c7@foz.lan>
In-Reply-To: <CANiDSCvr2PVmzir-0NO3P_WaPMcbLj5xe9KWtxCB=+dQFuj8ng@mail.gmail.com>
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
	<20250114200045.1401644-1-cascardo@igalia.com>
	<CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
	<CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
	<6d67c5c2-be60-454b-b03c-ed89c74262b8@redhat.com>
	<CANiDSCvr2PVmzir-0NO3P_WaPMcbLj5xe9KWtxCB=+dQFuj8ng@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 31 Jan 2025 12:17:25 +0100
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> On Fri, 31 Jan 2025 at 12:12, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi Ricardo,
> >
> > On 31-Jan-25 11:04 AM, Ricardo Ribalda wrote:  
> > > Hi Hans  
> >
> > Which Hans, me or Hans Verkuil?  Since this needs to go out
> > through a fixed pull-request I think it would be best if
> > Hans Verkuil picks up the revert directly in the fixes
> > branch ?  
> 
> Whoever started in v4l2 later needs to change their name :P.
> 
> I was thinking about you this time :)
> 
> >  
> > > We are seeing a spike of reports with the signature:
> > >
> > > "Found multiple Units with ID XX"
> > >
> > > Could you take a look at this patch? I agree with Thadeu that the best
> > > strategy is to land the revert asap and when the storm disappears work
> > > on a different solution.  
> >
> > Ack, Fedora is getting some bug reports about this too. Since both
> > you (Ricardo) and Laurant seemed to be on top of this I didn't take
> > a closer look yet. But this definitely is hitting users and we
> > need to fix this.
> >
> > Since we still don't have a fix yet we really should revert the commit
> > causing this problem ASAP.  
> 
> Hans (Verkuil) if Hans (de Goede) adds a Reviewed-by or a Acked-by,
> could you take this patch to the media-committers/fixes branch ?

I can pick it as well. From what I got, Hans de Goede is also ok
with such change.


Thanks,
Mauro

