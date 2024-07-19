Return-Path: <linux-media+bounces-15140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E809375EE
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 11:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5DC11C234AE
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B29127E18;
	Fri, 19 Jul 2024 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H5U15b96"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD397F487;
	Fri, 19 Jul 2024 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381917; cv=none; b=I3pmOGHXX4OUvtnwdMlz5yxsMPdLZ4xKqhvoa7dBqp0Db2gj1ynByEhPlZpE5fHdu732wp3bMaOLkmANjcI5QnseCPoiVofvTvHPPB+cWtK48z85CueJrXQeNpA+FnBv4fdkiOqAuj9+vKAMJqx2FWBEO+cq8rT2a76zuSl1vDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381917; c=relaxed/simple;
	bh=l5EtkbtTmp+QwD/m59M+rHtc9b7+dQo0hYOf5L/2fR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0K/N8Dqa3nfxiGWNf3tyx1k6lbNffcp8n5gKpEs6g4ngyQ7Zpv8KpMpn6dSmngUd9MPOUQsQ06s5P836ns5S5k8i5ZR3OEHHa9KRiDlFhYfvYNwfhUuzu/kGqCnJHY/Dlb8UTARfNqe54EupnUcwpQ9/qVfcqYBOtTE6dtco78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H5U15b96; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBB8E471;
	Fri, 19 Jul 2024 11:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721381875;
	bh=l5EtkbtTmp+QwD/m59M+rHtc9b7+dQo0hYOf5L/2fR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5U15b96KUvdWcQKP831UDGXX7yQAmsdbshRTOvwQN8/o7IUio0QYTB7nEN9rmXiI
	 KBlm5oHiPcCGYwrzlmsO7eAnF5MmHf83t4Ly5EOO7IkVZcuIckWfpDMROA14Qgrilv
	 q9mOK8uHFKcQoYyjDR6sWuC0XQFEMkFla0FhwgRA=
Date: Fri, 19 Jul 2024 12:38:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: Linux logs error `Failed to query (GET_CUR) UVC control X on
 unit Y: -75 (exp. 1).` (75 == EOVERFLOW?)
Message-ID: <20240719093819.GE12656@pendragon.ideasonboard.com>
References: <af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de>
 <2024071939-wrought-repackage-f3c5@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024071939-wrought-repackage-f3c5@gregkh>

(CC'ing Ricardo)

On Fri, Jul 19, 2024 at 08:05:35AM +0200, Greg KH wrote:
> On Fri, Jul 19, 2024 at 07:22:54AM +0200, Paul Menzel wrote:
> > Dear Linux folks,
> > 
> > 
> > Today, starting the Intel Kaby Lake laptop Dell XPS 13 9360/0596KF, BIOS
> > 2.21.0 06/02/2022 with
> > 
> >     Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
> > 
> > Linux “6.11-rc0” (v6.10-8070-gcb273eb7c839) logged UVC errors:
> 
> Does 6.10-final have the same issue?  If not, can you use 'git bisect'
> to track down the offending commit?
> 
> There have not been any USB changes in Linus's tree yet, but there have
> been a bunch of media changes, so perhaps something in the uvc driver is
> causing this?

We've merged quite a few changes for the uvcvideo driver recently.
Bisecting the problem would help greatly. It could also be helpful to
set the uvcvideo module 'trace' parameter to 0xffff (e.g. add
`uvcvideo.trace=0xffff` to the kernel command line, or unload and reload
the uvcvideo module with the parameter set to 0xffff) and give us the
additional messages printed to the kernel log.

Could you also provide the output of `lsusb -v -d 0c45:670c` (running as
root if possible) ?

-- 
Regards,

Laurent Pinchart

