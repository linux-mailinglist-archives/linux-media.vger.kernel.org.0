Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F50839CB6B
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 00:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhFEWPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 18:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEWPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 18:15:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3986AC061766;
        Sat,  5 Jun 2021 15:13:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E7148DB;
        Sun,  6 Jun 2021 00:13:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622931191;
        bh=77FTQ3AWVNkSmA6RNgFH4ikvhUmfZejYCCux6ZU2gUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HyJEuKbyypIvOC9Zy0lI9Welz+jjhTOiqSmdUp8MiJgShbP4qwROx2nGLPuQI5gjQ
         PzreO0Nd0tn0RMN9aPAoxPm0nxJpdU3kB6z2DXiulhAa0YBDasmFJrL59xw7/JDSEv
         p/Nl1ayfMSsIHuRlM7nSJpnjQcbXCB5YRq/DkBwM=
Date:   Sun, 6 Jun 2021 01:12:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <YLv26gjSMMQfwC44@pendragon.ideasonboard.com>
References: <20210512214702.GB27652@duo.ucw.cz>
 <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
 <20210513160724.GC19588@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210513160724.GC19588@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, May 13, 2021 at 06:07:24PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > Who is the right person to talk about Librem 5 cameras? Is there
> > > mailing list I should use?
> > 
> > I think most of the coordination is mostly happening via the gitlab issues in
> > 
> > https://source.puri.sm/Librem5/linux-next
> > 
> > Maybe Martin and Dorota who are working on the camera drivers (put in cc:)
> > have a more suggestions.
> 
> Thanks for pointers.
> 
> In the meantime I got silent video recording to work on Librem 5
> devboard --
> 
> https://gitlab.com/tui/tui/-/tree/master/cam
> 
> -- but quality is awful, probably either hardware or kernel issue.

It's due to the lack of an ISP. As the i.MX8QM doesn't have a hardware
ISP, the backup plan is to implement one in software, with GPU
offloading (as the CPU alone very likely won't have the computing
power).

> Is pulseaudio supposed to be running in Phosh? I have trouble
> capturing any audio and am wondering if I should attempt to do full
> reinstall.
> 
> > > AFAICS from bugzillas, it is still not compeletely working. I see
> > > megapixels packaged in the repository, but without required config
> > > files. Are there work-in-progress configurations somewhere? Would it
> > > be useful if I tried to get it to work on the devboard?
> > 
> > Megapixels work is mostly happening here atm:
> > 
> > https://source.puri.sm/dorota.czaplejewicz/megapixels
> 
> Ok, so you seem to have that one under control.

-- 
Regards,

Laurent Pinchart
