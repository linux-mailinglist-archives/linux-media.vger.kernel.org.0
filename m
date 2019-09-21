Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09B3B9F8F
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2019 21:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732340AbfIUTNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Sep 2019 15:13:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:41768 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727755AbfIUTNP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Sep 2019 15:13:15 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 643B04FA;
        Sat, 21 Sep 2019 19:13:13 +0000 (UTC)
Date:   Sat, 21 Sep 2019 13:13:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] single maintainer profile directory (was Re:
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <20190921131307.77d01ebb@lwn.net>
In-Reply-To: <20190918082326.49a19a24@coco.lan>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
        <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
        <201909162032.F4462D3@keescook>
        <20190917102817.263517b5@coco.lan>
        <201909170930.B8AD840@keescook>
        <20190918082326.49a19a24@coco.lan>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 Sep 2019 08:23:26 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> A simple/lazy solution would be to apply the enclosed patch - or a
> variant of it that would place the contents of MAINTAINERS outside
> process/index.html, and add instructions about how to use
> get_maintainers.pl.
> 
> Jon,
> 
> Please let me know if you're willing to accept something like that.

[Sorry for the slowness, I'm kind of tuned out this week]

I guess we could do that as a short-term thing.

In truth, though, this thing is a database; printing it out linearly is
perhaps not the best thing we could do.  There should be better ways we
could provide access to it.

Also, that file is nearly 18K lines long.  If some unsuspecting person
generates a PDF and prints it, they're going to get something along the
lines of 300 pages of MAINTAINERS, which may not quite be what they had
in mind.  It costs (almost) nothing to put that into HTML output, but
other formats could be painful.

So I dunno, we need to think this through a bit...

jon
