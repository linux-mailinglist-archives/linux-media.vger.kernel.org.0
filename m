Return-Path: <linux-media+bounces-18615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3670D9871C8
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34D051C227BE
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6721AE87A;
	Thu, 26 Sep 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MIEy9WG1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4C1AD3E9
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347319; cv=none; b=kVvwK1mCOoJkM2zJ3TY2L5c12Bs12ccx7qoKaBtfH+pMMGHdkUAm0xeZF7OIuNU5puuXdEJpQycnF1RbVzt5gq7YuHBsVb5YhzG/16qA4O8lIPX17oYjm+qrYUqKg4WS72AeW926qqKV5Pmi8e/UY8/w0HtV6c3xlPwohz0epuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347319; c=relaxed/simple;
	bh=PwH9F7VICy6eEJJRC5gQLU1RkXTG7n8NhjxDaTkU5Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGilU/PAVtJbSimFcdFVFQAaZ67A5ttnFCWrkg3CvBuZAN7qM3z1KeBX1HCBbYNUMmcC/DLe0qLf9tzal9zO9B93O/pRO1NDcXq/uGZoWiARkuw8bV9zF0i5oNSpS6yuPw5D5/SpF3ewKqGyIHQlecT1y3+El3lfkExiucpKAjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MIEy9WG1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31453169;
	Thu, 26 Sep 2024 12:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727347228;
	bh=PwH9F7VICy6eEJJRC5gQLU1RkXTG7n8NhjxDaTkU5Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIEy9WG1orwyeHoONxGzOgrmmSOW6BzCfGtki1cdDEFQn5YopWs7DFGDUtJXRw3Qo
	 iNlJqzZUha9d4V0eY9kEqIQTi/QiRS1gqHQ/1Fb/MaGuobsTxs9j3PEkex/cWfCxvh
	 v+azYLGGPSSX7mWNCWbdysSANuwEbg44aLRU5JLk=
Date: Thu, 26 Sep 2024 13:41:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926104154.GE21788@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
 <20240918132323.2a384f87@sal.lan>
 <20240925195653.GJ30399@pendragon.ideasonboard.com>
 <20240926003815.6537fdbb@foz.lan>
 <20240926103002.GB21788@pendragon.ideasonboard.com>
 <ZvU5sF7KC03x-LMu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZvU5sF7KC03x-LMu@kekkonen.localdomain>

On Thu, Sep 26, 2024 at 10:38:40AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Thu, Sep 26, 2024 at 01:30:02PM +0300, Laurent Pinchart wrote:
> > > See, the main repository is hosted at linuxtv.org. We intend to avoid 
> > > as much as possible rebases at the media tree at linuxtv.org, on both
> > > fixes and next branches.
> > > 
> > > The media-committers tree at fdo is focused on executing patches at CI
> > > and should only be used by committers. All other developers should base 
> > > their work at the repository stored at linuxtv.org[1].
> > 
> > That I don't like. We want people working on the media subsystem to test
> > the very latest code, and to base their work on the tree that their
> > patches will land in. Otherwise there will be conflicts, and the risk of
> > conflict will increase as we pick up pace with the new workflow and
> > merge patches faster.
> 
> I was under the impression the tree at linuxtv.org would be synchronised
> (very) often or even updated based on a git hook, effectively making it a
> mirror.

If it's a mirror then it doesn't matter which tree people use :-)

-- 
Regards,

Laurent Pinchart

