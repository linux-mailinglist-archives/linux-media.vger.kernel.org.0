Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25893804D9
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 10:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbhENIHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 04:07:24 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:33390 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229654AbhENIHX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 04:07:23 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 7869FFB03;
        Fri, 14 May 2021 10:06:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id U-HdwX2yb7sw; Fri, 14 May 2021 10:06:08 +0200 (CEST)
Date:   Fri, 14 May 2021 10:06:07 +0200
From:   Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <YJ4vb0JWzglDbdDz@bogon.m.sigxcpu.org>
References: <20210512214702.GB27652@duo.ucw.cz>
 <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
 <20210513160724.GC19588@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513160724.GC19588@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
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
> 
> Is pulseaudio supposed to be running in Phosh? I have trouble
> capturing any audio and am wondering if I should attempt to do full
> reinstall.

Pulseaudio is what we use in Phosh for audio yes. If you reinstall i'd
use the byzantium based images rather than the current stable amber ones
(librem5-flash-image --board=devkit --dist=byzantium) since that's way
newer software.
Cheers,
 -- Guido

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
> 
> Best regards,
> 								Pavel
> -- 
> http://www.livejournal.com/~pavelmachek


