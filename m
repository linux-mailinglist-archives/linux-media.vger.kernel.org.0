Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D7E26AA1D
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 18:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgIOQxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 12:53:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbgIOQtC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 12:49:02 -0400
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C3B620809;
        Tue, 15 Sep 2020 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600188476;
        bh=oAXHI568oWBa/lKZ9N6fvqRmWCvqMCh6HsYhxn9dX2g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P/SE13b6SGRoIOu+jgx5Cdd6URPeUochvQNV0+PgrY9BdqS01jpGP+6DWTB12/DhN
         4AD5IHPv3Jrvzmje2A9HG+yCXEDwRiINQriZOPxE6dQZO/dgmvPHpgzy27zkq/PPja
         xynj4vRqPR7iG//LZoSPjFCY6y1rQkBGWkrM3VnM=
Date:   Tue, 15 Sep 2020 18:47:51 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Sep 15 (drivers/media/test-drivers/vidtv/)
Message-ID: <20200915184751.2d680848@coco.lan>
In-Reply-To: <55ef0376-7809-c875-5dcc-5bb46d6204df@infradead.org>
References: <20200915174932.3aa7d103@canb.auug.org.au>
        <55ef0376-7809-c875-5dcc-5bb46d6204df@infradead.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

Em Tue, 15 Sep 2020 09:33:14 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 9/15/20 12:49 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200914:
> > 
> > The v4l-dvb tree lost its build failure.
> >   
> 
> media driver build problems on i386:
> gcc (SUSE Linux) 7.5.0
> 
> build#1:
> 
> ERROR: modpost: "__udivdi3" [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> 
> build#2:
> 
> ld: drivers/media/test-drivers/vidtv/vidtv_s302m.o: in function `vidtv_s302m_encode':
> vidtv_s302m.c:(.text+0x1f3): undefined reference to `__udivdi3'
> ld: drivers/media/test-drivers/vidtv/vidtv_mux.o: in function `vidtv_mux_tick':
> vidtv_mux.c:(.text+0x3ee): undefined reference to `__udivdi3'
> ld: vidtv_mux.c:(.text+0x40b): undefined reference to `__udivdi3'

Geert already pointed those issues.

Daniel should be working on a fix. Hopefully we'll have a fixup patch
tomorrow.
Thanks,
Mauro
