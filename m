Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 602C7509DA
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 13:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfFXLg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 07:36:58 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:39513 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbfFXLg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 07:36:57 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5961CC000E;
        Mon, 24 Jun 2019 11:36:55 +0000 (UTC)
Message-ID: <49c8fc2dade79b62a3e0cffc61c484f295cb3181.camel@hadess.net>
Subject: Re: Remote "Mouse mode" buttons, Keycode choices, etc.
From:   Bastien Nocera <hadess@hadess.net>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-media@vger.kernel.org
Date:   Mon, 24 Jun 2019 13:36:54 +0200
In-Reply-To: <20190622175621.GC30317@amd>
References: <e1c968df516b751769765e0b0947caea607e7b7f.camel@hadess.net>
         <20190616165818.GA23022@xo-6d-61-c0.localdomain>
         <212f7db1f2d0b88a749bf3378bfaf3185590b6db.camel@hadess.net>
         <20190622175621.GC30317@amd>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2019-06-22 at 19:56 +0200, Pavel Machek wrote:
> On Fri 2019-06-21 13:39:39, Bastien Nocera wrote:
> > On Sun, 2019-06-16 at 18:58 +0200, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > I dug out a fair bunch of remote controls I got around 10 years
> > > > ago[1],
> > > > and started trying them all out.
> > > > 
> > > > I bumped into a couple of problems:
> > > > 
> > > > - the Snapstream Firefly remote ([2] using the rc-snapstream-
> > > > firefly
> > > > keymap and the ati_remote protocol) creates 2 input device
> > > > nodes,
> > > > one
> > > > for the remote keys, one for the mouse mode. The mouse button
> > > > on
> > > > the
> > > > remote just sends KEY_MODE, and doesn't change the mode,
> > > > nothing is
> > > > ever sent on the mouse device node
> > > > 
> > > > - the Streamzap remote ([3]) uses KEY_NUMERIC_[0-9] keycodes,
> > > > just
> > > > like
> > > > a small minority of other devices. Is there any reason for them
> > > > not
> > > > to
> > > > use KEY_[0-9] instead? Or for all of them to use KEY_NUMERIC_*,
> > > > for
> > > > consistencies' sake. I can send patches for those.
> > > 
> > > This may be a bit of fun; consistency is good but this will
> > > change
> > > behaviour for people,
> > > right?
> > > 
> > > So.. be careful :-).
> > 
> > I'm not really sure how one can be "careful" doing that.
> 
> You could do an config option and then pretend breakage is user
> decision, for example.
> 
> Or better just change it and see what happens.

Patch sent :)

> > You can check this patch to lirc from 2008 to see what it might end
> > up
> > looking like ;)
> > https://people.redhat.com/bnocera/lirc-fix-remote-keycodes.patch
> > 
> > It doesn't really answer my question about whether this discrepancy
> > was
> > intended though.
> 
> Probably not intended.
> 									
> Pavel

