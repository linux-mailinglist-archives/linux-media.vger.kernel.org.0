Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B0F1B1D10
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 05:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgDUDoJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 23:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgDUDoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 23:44:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0A0C061A0E;
        Mon, 20 Apr 2020 20:44:08 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 499842A1019
Message-ID: <b175a589070b7f1fad8b7c2eecff2fc816a3ccf0.camel@collabora.com>
Subject: Re: [PATCH] cedrus: Drop unneeded CONFIG_OF dependency
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <mripard@kernel.org>
Date:   Tue, 21 Apr 2020 00:43:59 -0300
In-Reply-To: <20200420152941.GA610656@aptenodytes>
References: <20200402194653.13535-1-ezequiel@collabora.com>
         <20200403082206.GA626942@aptenodytes>
         <a36a825bc048821b4b7088feea71bd31e9e17211.camel@collabora.com>
         <20200420152941.GA610656@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Paul,

On Mon, 2020-04-20 at 17:29 +0200, Paul Kocialkowski wrote:
> Hi Ezequiel,
> 
> On Fri 03 Apr 20, 09:21, Ezequiel Garcia wrote:
> > On Fri, 2020-04-03 at 10:22 +0200, Paul Kocialkowski wrote:
> > > Hi Ezequiel,
> > > 
> > > On Thu 02 Apr 20, 16:46, Ezequiel Garcia wrote:
> > > > The driver is perfectly capable of being built without CONFIG_OF.
> > > > Remove this dependency, which is useful for compile-only tests.
> > > 
> > > Thanks for the patch!
> > > 
> > > Alas, the driver won't do anything useful without OF enabled, so it seems
> > > useful to keep that dependency.
> > 
> > I'm not convinced about this argument, I like to have
> > dependencies on things the driver needs to compile
> > (except the machine option, see below).
> 
> Is there a general kernel-wide policy about that?
> 

I don't think there is.

> I must admit that I never really understood if Kconfig depends are supposed to
> strictly reflect build dependencies or dependencies that must reasonably be
> expected for the driver to be useful. The arch dependency (which is farily
> common) seems to suggest the latter.
> 

Indeed, it's a good point. Just forget this patch :-)

As a note, some drivers use something like
(ARCH_FOO && OF) || COMPILE_TEST to allow compile
testing in the absence of OF support, if that's
something that you care for.

I do think the ARCH_SUNXI dependency makes sense.

Thanks,
Ezequiel

