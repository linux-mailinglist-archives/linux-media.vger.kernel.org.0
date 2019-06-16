Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE4147600
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 18:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfFPQ6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 12:58:49 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51630 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfFPQ6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 12:58:49 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 8B8EB801E0; Sun, 16 Jun 2019 18:58:35 +0200 (CEST)
Date:   Sun, 16 Jun 2019 18:58:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: Remote "Mouse mode" buttons, Keycode choices, etc.
Message-ID: <20190616165818.GA23022@xo-6d-61-c0.localdomain>
References: <e1c968df516b751769765e0b0947caea607e7b7f.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c968df516b751769765e0b0947caea607e7b7f.camel@hadess.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> I dug out a fair bunch of remote controls I got around 10 years ago[1],
> and started trying them all out.
> 
> I bumped into a couple of problems:
> 
> - the Snapstream Firefly remote ([2] using the rc-snapstream-firefly
> keymap and the ati_remote protocol) creates 2 input device nodes, one
> for the remote keys, one for the mouse mode. The mouse button on the
> remote just sends KEY_MODE, and doesn't change the mode, nothing is
> ever sent on the mouse device node
> 
> - the Streamzap remote ([3]) uses KEY_NUMERIC_[0-9] keycodes, just like
> a small minority of other devices. Is there any reason for them not to
> use KEY_[0-9] instead? Or for all of them to use KEY_NUMERIC_*, for
> consistencies' sake. I can send patches for those.

This may be a bit of fun; consistency is good but this will change behaviour for people,
right?

So.. be careful :-).

