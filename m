Return-Path: <linux-media+bounces-21492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5F9D096B
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 07:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70FD51F210DC
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 06:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDDE145B24;
	Mon, 18 Nov 2024 06:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmjA8Ud+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BBE10E0
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731910685; cv=none; b=fARZMbDSDT70dQNp3yTfgIrJXs6nXSJIo6xrUXwIrZB5PRUNa+rJrDANGJSZH7mkDxb4+QXvlhVLVHGrQbI53SFU/73EXwA4wgsqopdv73ilfVPFpTz/q5KDkaJyPCWTVHQ/LkHx5ijgVX7m/Ipsf4uXVlD9o2bzDQ715R7tVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731910685; c=relaxed/simple;
	bh=it5Hv+++9txwV3eQka9iVsj2SIqIztLYkKl5r3TBrd8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mk2uXgRQf8Jr9qayUc7Wi0Y8FwejTiA8DG1ccEKNWq8MMe0DWbzDWtEMRlq/aKkuOmYS9JHX4HOnfKmJhaMpUC44NVs0pkq8Fj2RYW2L1LElxpih8QSLz+ksXq6eaga85ww0riLDqcOAya3hSTUREKxeovrzzmWUW7jHzSDiI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmjA8Ud+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA7FC4CECC;
	Mon, 18 Nov 2024 06:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731910685;
	bh=it5Hv+++9txwV3eQka9iVsj2SIqIztLYkKl5r3TBrd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FmjA8Ud+KXUEYKgtlUWLhG2nxIwcJeZRHAXm26Jc/sQa95fVTAjBoxDfAjgHIv8Uh
	 0lm5xp1nvDCxG6CYVAUvMiTmMSla54K44U5jtIaWH2v+Tgt48G2UJg3808tP7/u9Io
	 2aMT+e4qLNRGOKkv8R8v1YHUfP2hThmOjPYMM5h28hO6MqeHox92eAUPnO+vlPSf2H
	 cgIJKg8Nw2nQg87nw1q4+7w7RNVhNk6v0Crlz0XBTghVCiy7npD+RY1y1aLz2ok1gJ
	 ewuNYnshZvU8OClMAqbZ+t9SopSOXQjmT9hLAB0GRGI9NbBlrYInwTjPOtVZFUKf3S
	 TkG6QsX+arv9A==
Date: Mon, 18 Nov 2024 07:18:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Hans de Goede as USB VIDEO CLASS
 co-maintainer
Message-ID: <20241118071801.51894f08@foz.lan>
In-Reply-To: <20241117213837.GJ12409@pendragon.ideasonboard.com>
References: <20241116113855.50976-1-hdegoede@redhat.com>
	<20241117213837.GJ12409@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 17 Nov 2024 23:38:37 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Hans,
> 
> On Sat, Nov 16, 2024 at 12:38:55PM +0100, Hans de Goede wrote:
> > Add myself as co-maintainer for the UVC driver.  
> 
> Thanks for volunteering to help.
> 
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>  
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 91d0609db61b..1da403e89159 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24063,6 +24063,7 @@ F:	drivers/usb/host/uhci*
> >  
> >  USB VIDEO CLASS
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +M:	Hans de Goede <hdegoede@redhat.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  W:	http://www.ideasonboard.org/uvc/  
> 
> I think we should update the git tree entry as well, as we're using
> https://gitlab.freedesktop.org/linux-media/users/uvc/. As that's
> temporary until we can merge patches directly in the multi-committers
> tree, it may however not be worth it. What do you think ?

The official tree is now at:

	git://linuxtv.org/media.git

Such tree is not expected to be rebased, so IMO the best is to point
to it. I just submitted a patch mass-updating the references to
media_tree.git to it. Such patch has to be backported, as even
stable versions should be pointing to an existing tree (and we may
soon get rid of the media_tree.git and media_stage.git trees).

Assuming that we have a smooth process, I don't expect that patches
at the uvc merge tree to be there for a long time. Also, this is
meant to be a short-lived tree with the migration to media-committers
(which is a tree that can be rebased).

So, IMO, it is not worth pointing to the uvc merge tree.

Thanks,
Mauro

