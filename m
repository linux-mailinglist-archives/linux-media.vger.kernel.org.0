Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BB13B2E00
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 13:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhFXLjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 07:39:49 -0400
Received: from meesny.iki.fi ([195.140.195.201]:53016 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhFXLjs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 07:39:48 -0400
X-Greylist: delayed 45043 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Jun 2021 07:39:48 EDT
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 3C860200BB;
        Thu, 24 Jun 2021 14:37:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1624534648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fs4kJDRUqNJIfjnGjOlgzuJwkDxbw7N1uDMlg37pA4M=;
        b=DforvN1ll7fSVHcRQG+/kA7MMztwpnq4t/J25iIUtiCE3P1sKgOIjKZ3JfxD9i7CSaVhGV
        k7pB7w7mcR+U8+7r1GgQCyG1FgiwJBhRX5YvjkRpNfc/N94opi8NFIJloOH6WccJ1h87Jv
        tSdHV/VyLwk9WWyfGxBOVlQcI+sjfVk=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4CFB0634C87;
        Thu, 24 Jun 2021 14:37:11 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lwNfj-00019x-1Z; Thu, 24 Jun 2021 14:37:27 +0300
Date:   Thu, 24 Jun 2021 14:37:27 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] media: v4l2-flash-led-class: drop an useless check
Message-ID: <20210624113726.GM3@valkosipuli.retiisi.eu>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
 <e1629ac223470630eed4096361965d154aff70b7.1624276138.git.mchehab+huawei@kernel.org>
 <20210624093153.GJ3@valkosipuli.retiisi.eu>
 <20210624115925.357f98b6@coco.lan>
 <20210624101443.GK3@valkosipuli.retiisi.eu>
 <20210624133238.006c7b64@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624133238.006c7b64@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1624534648; a=rsa-sha256; cv=none;
        b=LPjSGdWQaRAY1M1wSn2NS2JeH5SWEfVWlboe5JQ0TJHj2CltduF/YY84IeqBz3slUqTs5R
        fdGNT2lwYSf71qKnQpJq3krNC+OTlt9LbautQ3nbkC4/SZ1brfjXgc+6J36H5dAlPIktj9
        OIuieGi87P+nwac4n7rzf27gdeNVYmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1624534648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fs4kJDRUqNJIfjnGjOlgzuJwkDxbw7N1uDMlg37pA4M=;
        b=K4NoTLK7BpeCkdRvjdUscyzQ+desl9uFkl6uZLWAMHRdEK31Q0+onhFWowAwkIDKqJ0bPe
        PmH4rzT8ot1q4QkS97V89xFn7u9BdC5sAzXVF/sSTRG7SnLa/WzbvEMJ8iabIOZZ6oRG/7
        LlxEbFXULVM8o/CMSnXmzRS7Gis+tjI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 01:32:38PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 24 Jun 2021 13:14:43 +0300
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Mauro,
> > 
> > On Thu, Jun 24, 2021 at 11:59:25AM +0200, Mauro Carvalho Chehab wrote:
> > > Em Thu, 24 Jun 2021 12:31:53 +0300
> > > Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> > >   
> > > > Hi Mauro,
> > > > 
> > > > Could you check if your mail client could be configured not to add junk to
> > > > To: field? It often leads anything in the Cc: field being dropped.  
> > > 
> > > I have no idea why it is doing that. I'm just using git send-email
> > > here. Perhaps a git bug?
> > > 
> > > 	$ git --version
> > > 	git version 2.31.1
> > > 
> > > The setup is like this one:
> > > 
> > > 	[sendemail]
> > > 	        confirm = always
> > > 	        multiedit = true
> > > 	        chainreplyto = false
> > > 	        aliasesfile = /home/mchehab/.addressbook
> > > 	        aliasfiletype = pine
> > > 	        assume8bitencoding = UTF-8  
> > 
> > I tried sending a message to myself using git send-email with an empty To:
> > field and it came through just fine, with To: field remaining empty. I
> > wonder if it could be the list server?
> 
> It seems so.
> 
> > > So, this is not a false-positive, but, instead, a real issue.
> > > 
> > > So, if led_cdev/fled_cdev can indeed be NULL, IMO, the right solution would be
> > > to explicitly check it, and return an error, e. g.:
> > > 
> > > 	static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
> > > 	{
> > >         	struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
> > >         	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> > > 		struct led_classdev *led_cdev;
> > >         	struct v4l2_ctrl **ctrls = v4l2_flash->ctrls;
> > >         	bool external_strobe;
> > >         	int ret = 0;
> > > 
> > > 		if (!fled_cdev)
> > > 			return -EINVAL;  
> > 
> > The approach is correct, but as noted, the check needs to be done later.
> 
> > I checked that the same pattern is used throughout much of the file. I
> > suppose if smatch isn't happy with this instance, it may not be happy with
> > the rest either. Admittedly, the pattern isn't entirely trouble-free, as it
> > requires the parts of the file to be in sync.
> >
> > Addressing this takes probably a few patches at least.
> 
> See, the main issue is not the smatch report, but the point that, on
> some cases, it will de-reference a NULL pointer.

It does not, since the controls aren't added for devices that do not have
these parts to control. For instance, if there's no flash LED, the flash
related controls aren't created. So this is primariy a static checker
issue, and secondarily perhaps an issue of the cleanness of the code. But
much of that originates from how the LED flash API connects with the V4L2
flash API.

> 
> And yeah, the same pattern is everywhere within the core.
> 
> IMO, the right fix would be to ensure that fled_cdev will always
> be not NULL, but if there are good reasons why this can't happen,
> extra checks are needed along the core (or at leds core), in order
> to prevent de-referencing NULL pointers.
> 
> > 
> > Could you drop this patch, please?
> 
> Just dropped from media_stage. It didn't reach media_tree.

Thanks.

-- 
Sakari Ailus
