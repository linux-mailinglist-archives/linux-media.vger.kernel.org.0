Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAA94407F0
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 09:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhJ3Hxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 03:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbhJ3Hx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 03:53:28 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF394C061570;
        Sat, 30 Oct 2021 00:50:58 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B54B1C6398; Sat, 30 Oct 2021 08:50:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1635580255; bh=B6xxsFKcxsnoZINIW68sJnCNuORZBtnCQnJfRvlhnqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VSmTGPbHFoUJUiIVZZTc0RKiRuFCAFddB7dQOgPHBkKhB5450aO/GKjsWV16Y3fQ3
         Urj7Zieso/3Zx90HD056zlBwRKlYbsbH8BWh7XXyWqGbOQxC+C7peFJP7Cn8rSZZAr
         cy+VK9XfhMsU7Ww5hoM47JxaIHvdHv0lsQNDDu3xzqdSFWTsV8DqVifs9bBB+RXQ7m
         nro2QYiqs8R0JrznG06YpJavh4nhWqvCb9oiLyKTTMpBJS9asldeCYhs56hwYhAm86
         cuW9Z6y60r8fvR25R8CosdeEXtDeKVpTo6X+LRJBLGD2NcDljGa8YWMmreEC9q7ihO
         bSbfDtKHTCk3g==
Date:   Sat, 30 Oct 2021 08:50:55 +0100
From:   Sean Young <sean@mess.org>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     =?iso-8859-1?Q?Joaqu=EDn_Alberto_Calder=F3n?= Pozo 
        <kini_calderon@hotmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-image-5.10.0-8-amd64: Hauppauge WinTV-HVR1110 DVB-T/Hybrid
 bug 125 ms polling on ir-kbd-i2c.ko bad DEFAULT_POLLING_INTERVAL
Message-ID: <20211030075055.GA11395@gofer.mess.org>
References: <CH2PR04MB6679933D6BEE6C51BE6BEF9889D89@CH2PR04MB6679.namprd04.prod.outlook.com>
 <20210913072649.GB2393@gofer.mess.org>
 <YXz3Lpqq/x3WGQTQ@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXz3Lpqq/x3WGQTQ@eldamar.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 30, 2021 at 09:41:34AM +0200, Salvatore Bonaccorso wrote:
> On Mon, Sep 13, 2021 at 08:26:49AM +0100, Sean Young wrote:
> > On Sun, Sep 12, 2021 at 10:15:31PM +0000, Joaquín Alberto Calderón Pozo wrote:
> > > --- ir-kbd-i2c.original.c	2021-09-08 23:45:23.723210301 +0200
> > > +++ ir-kbd-i2c.hauppauge.patched.c	2021-09-10 03:55:28.003529072 +0200
> > > @@ -742,7 +742,7 @@
> > >  		return -ENOMEM;
> > >  
> > >  	ir->c = client;
> > > -	ir->polling_interval = DEFAULT_POLLING_INTERVAL;
> > > +	ir->polling_interval = 125;
> > >  	i2c_set_clientdata(client, ir);
> > >  
> > >  	switch(addr) {
> 
> My understanding is that Joaquín would need some help to get the patch
> submission as he is unexperienced to make it a proper patch for
> inclusion in mainline, would you have enough time to bring this into
> shape for him? I'm not familiar in this area to propose a proper
> commit message myself. Joaquín confirmed though in
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=994050#32 that the
> proposed changes seems to solve his issue.

The change is in media_stage:

https://git.linuxtv.org/media_stage.git/commit/?id=c73ba202a851c0b611ef2c25e568fadeff5e667f

This should be merged into Linus' tree during the v5.16 merge window, and
then make it into the stable trees from there.

Thanks

Sean
