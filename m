Return-Path: <linux-media+bounces-24448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4CA0605E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 16:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8147C162B44
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DE21FE477;
	Wed,  8 Jan 2025 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MrPawb7D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27401259497
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736350604; cv=none; b=N/pyWpXckDjHVxLg6OzuMyKhPQjNFmhrqqeiTVblMkb2WnnlbvaJBpwdO75vXqJVY3pVVfiIYDXMo1mVV7SFT60M3kvjQ5ilCDi3KeRB9NJDNKAPFebFpZ3ZcrMjqH/dPK78GkXkI4JgyONz3Z/FX8R4E7waO20sOOWixq1URik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736350604; c=relaxed/simple;
	bh=G0waaliWwZKIa/vgBsZ/H8rFN7pUMChsiJXIO6AZWH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsLz6+ccZiJYT4BGRRP9KWHBRBQuOLkQHdaxFmGZ8SMXBtbmamVxwU+wgpPp4cdQhuEJFZGiU/3JI9eTBwNouAQMMNpOSwyPOYxwOlWVTNIWKgec7pLv0eMX52bLnYP/5CNsZxuskLt9ajFDIv7hXQepYDqgS4ZNTTuJzW5HRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MrPawb7D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BC36465;
	Wed,  8 Jan 2025 16:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736350547;
	bh=G0waaliWwZKIa/vgBsZ/H8rFN7pUMChsiJXIO6AZWH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrPawb7D+nJVgCbjxdrgF38IkP+2Kh/tuuWrs9dMe0bxy5CT/eb2JKiQzGRBi7ccC
	 UpHH324ymi+T8muK8Lc4U9uYAHFuWd0t5TuRCeHo/oKSIBqm2NwLvBAQ4yRs1HJi2J
	 2HcPM39XaonMWNvWZd6TCJ7Zd20Z2OQq+ev+19cs=
Date: Wed, 8 Jan 2025 17:36:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Tomasz Sikora <sikora.tomus@gmail.com>, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, ribalda@chromium.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <20250108153637.GE32541@pendragon.ideasonboard.com>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
 <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br>
 <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
 <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>

On Wed, Jan 08, 2025 at 12:32:07PM -0300, Thadeu Lima de Souza Cascardo wrote:
> On Mon, Jan 06, 2025 at 02:15:24PM +0100, Tomasz Sikora wrote:
> > Error in line 1034 dmesg.log
> > You can see more here https://bbs.archlinux.org/viewtopic.php?id=301737
> > 
> > pon., 6 sty 2025 o 11:56 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > napisał(a):
> > 
> > > On Sun, Jan 05, 2025 at 07:31:09PM +0100, Tomasz Sikora wrote:
> > > > Issue video camera
> > > > ls -l /dev/video*zsh: no matches found: /dev/video*
> > > >
> > > >
> > > > 01 15:43:24 Linux kernel: usb 3-2: Found multiple Units with ID 5
> > >
> > > Can you attach complete dmesg output? And more importantly, attach the
> > > output of lsusb -vv?
> > >
> > > Thanks.
> > > Cascardo.
> > >
> 
> Thanks a lot, Tomasz.
> 
> Without this patch (it could be an older kernel), do you see a warning in
> your dmesg? Or messages like:
> 
> [  395.090938] usb 1-1: Failed to create links for entity 5
> [  395.091385] usb 1-1: Failed to register entities (-22).
> 
> Otherwise, it might just be that your kernel is not built with
> CONFIG_MEDIA_CONTROLLER.
> 
> I reached that conclusion by emulating a similar uvc device. Yours has the
> entity ID for both the output terminal and processing unit. Though that is
> not valid according to the spec (even UVC 1.0 mentions the IDs should be
> unique), we should keep supporting such devices.
> 
> I am currently working on a fix that will restore support for your device
> but improve its support for configs with CONFIG_MEDIA_CONTROLLER.
> 
> I appreciate your help on testing such configurations and fixes.

The output of "lsusb -v -d 1c3f:2002" would help (running as root if
possible).

-- 
Regards,

Laurent Pinchart

