Return-Path: <linux-media+bounces-462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74AA7EE61F
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 18:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B46EB20BC1
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 17:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2048348798;
	Thu, 16 Nov 2023 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="DdDg3sKA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B708B126
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 09:47:53 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SWSDP0Zcyz49Psw;
	Thu, 16 Nov 2023 19:47:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1700156870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QSAp7oiGQeX2RXibZ5/NGdTU4xJXmZ/WU1spNfm008A=;
	b=DdDg3sKA9VZiVPM1lD0NjSuyoXVjOculJ9wfCGJKIbR1mcPDxMwJ6xXY82n/JQuJVFQYnJ
	QCMCKEmSGZ8eve1xPOAoJDj7Bd/JDNZ8z2Mcb9//Je/zr9qUOAkQFP9pEnmGafMe2RGk1a
	6vSKVaBHg9oJ+DHtVNYZOShoIqrzTpvwjznu8vay7I6BeM1+8fKBuyMUxBQ4uBHASy7Z6W
	6kgbzMqEuY778eTUYETqjeEQSrIOLTYkhGbf4NqXdimYjBTz+fGCemCDbpW/7LG/OMp0YW
	ULPTFfkjbu1S4WmJhu+vW0C32XLQwKGQxNKcOZ+Rmb1cesE3M/0eH+5JxL0e5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1700156870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QSAp7oiGQeX2RXibZ5/NGdTU4xJXmZ/WU1spNfm008A=;
	b=mXazyzrgm/yuIwCtyMBTrW3O+yGbCshFpyF6Dbjwc/gqVYaPxKlAPNJqOSFr2olukif3QC
	oTWxe7tdwP70k1eFvaG58gA8eetWMyycnmrz8m69Z0OcOVhlJ/S2sdhQZP8U1g7XscwFwf
	4ME2a3ak9XDzgvZrswG/4P2/3LIg6uhvRddcK/gi+ABUO/RdaokKm0B5EjM3I4bCAUWyWh
	G6YmeCRRvJ35BMi42cwtvLOKe01nxJ3srkYFJCwP4OHHQjwiZ3VZ1f0pJKHsBgReTn6MxT
	7hTMADever5qUfm9QYUW67/KjHnHvHMl2nDy3uB8RijWCFBxx9VaMOihfPxrxA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1700156870; a=rsa-sha256;
	cv=none;
	b=hg4pk443ssMLE8LTRdKcdj5Ui07pGTzSFCb/kLSOOcZIA/VHtlqf2PaihyVCXGBW1+RhIG
	hu/uFdBV3p2uDPb1Wqsay+kuAZmTsn9yg7InQe1V7X+o1NJkbpBHNHbArzCEFh/4ntiT2D
	AVb0ZUMGXoCSorH0AJbtDluGJugDchfr232fdU/ld0J5kPRTH1KVTrOBpOzm/E5KpgfO5A
	1xjPwFtAY8pQ4hZbtJ+bFkN54jTmeLx4TDrB44YRr45+Y8A1Wm1R83qNALRWaliQ8AqxE2
	/eHZFEPsMVUv75sguHH4hX+dFDCXxHmP4XqoAtm9IRw82EIe11Ctwcof+CinqA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A4755634C93;
	Thu, 16 Nov 2023 19:47:47 +0200 (EET)
Date: Thu, 16 Nov 2023 17:47:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL v3 FOR 6.8] V4L2 subdev patches
Message-ID: <ZVZVw2h5mcMpq8j4@valkosipuli.retiisi.eu>
References: <ZVEyCfzm4ninES6K@valkosipuli.retiisi.eu>
 <e414e2e8-d098-4315-bd45-67a16d144648@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e414e2e8-d098-4315-bd45-67a16d144648@xs4all.nl>

Hi Hans,

On Thu, Nov 16, 2023 at 04:29:58PM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 12/11/2023 21:14, Sakari Ailus wrote:
> > Hi Mauro, Hans,
> > 
> > Here's a bunch of patches from myself and Laurent, cleaning up V4L2
> > sub-device state information access API, drivers using it plus fixing IVSC
> > driver firmware parsing and IMX319 driver. A few CCS driver fixes and
> > documentation improvement are included, too.
> > 
> > Please pull.
> > 
> > since v2:
> > 
> > - Fix sub-device state access conditional compilation (was dependent on
> >   sub-device UAPI).
> > 
> > since v1:
> > 
> > - Fix IVSC driver patch error handling.
> > 
> > 
> > The following changes since commit 3e238417254bfdcc23fe207780b59cbb08656762:
> > 
> >   media: nuvoton: VIDEO_NPCM_VCD_ECE should depend on ARCH_NPCM (2023-10-27 11:44:19 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-1.2-signed
> > 
> > for you to fetch changes up to 61ab89c1916219ccbeca9f6cefb1680212de8d1c:
> > 
> >   media: v4l: subdev: Return NULL from pad access functions on error (2023-11-12 20:51:35 +0200)
> 
> As mentioned on irc, this PR no longer applies after the starfive driver
> was merged.
> 
> I did a run for this PR with the starfive patches dropped, and I got a few
> kerneldoc warnings:
> 
> include/media/v4l2-subdev.h:1425: warning: Excess function parameter 'state' description in 'v4l2_subdev_state_get_format'
> include/media/v4l2-subdev.h:1425: warning: Excess function parameter 'pad' description in 'v4l2_subdev_state_get_format'
> include/media/v4l2-subdev.h:1445: warning: Excess function parameter 'state' description in 'v4l2_subdev_state_get_crop'
> include/media/v4l2-subdev.h:1445: warning: Excess function parameter 'pad' description in 'v4l2_subdev_state_get_crop'
> include/media/v4l2-subdev.h:1465: warning: Excess function parameter 'state' description in 'v4l2_subdev_state_get_compose'
> include/media/v4l2-subdev.h:1465: warning: Excess function parameter 'pad' description in 'v4l2_subdev_state_get_compose'
> 
> Can you fix this for the next version?

It seems how the macro was designed in the last version of the sub-device
state information access functions caused this. I'll figure out how to
address this.

Thanks.

-- 
Regards,

Sakari Ailus

