Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DDD25B38
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 02:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfEVAm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 20:42:57 -0400
Received: from casper.infradead.org ([85.118.1.10]:49300 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfEVAm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 20:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MNpE+na0fxVVnfb74QQ+GsjFMyVre83YVvd0C+LOHOM=; b=V6tnkIbwWWINAcQXYbV7TZBbG9
        m6IuxqvwOiV+8S6BkKlbN9jYIHbyefegEObTXJpwJf9351uWuHtTDo19be7YcosOL7rieP0BePnTP
        ojSUD5Io2GSdDcdeKi3wLYF8COo5gi+8it7jPvNZXfHXQAGu4gDnnofX8Z9W2cAGNu8v3HUkhoA9u
        KnnreAHpaVBWxNLBV4J3qlxYnUfkcOEq4LoI+24UpIafyf0eI+K3Na7YTTUSBiyLNQ9fMLySdymmZ
        G6jiCJ947LIkrkgxMh5qAFS7kdODsTOFLnwwn4inTtBR8HFBo3XbCcis8PHIMoALMt3Ca9GvfANCe
        ZNRwqtlQ==;
Received: from [179.182.168.126] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hTFLL-0007HV-AU; Wed, 22 May 2019 00:42:55 +0000
Date:   Tue, 21 May 2019 21:42:49 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Dominik Danelski <dominik@danelski.pl>
Cc:     <linux-media@vger.kernel.org>
Subject: Re: Problem with compilation prevents me from adding a new device
Message-ID: <20190521214249.24dd8f68@coco.lan>
In-Reply-To: <1558470015.3271.4@pro1.mail.ovh.net>
References: <1558470015.3271.4@pro1.mail.ovh.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dominik,

Em Tue, 21 May 2019 22:20:15 +0200
Dominik Danelski <dominik@danelski.pl> escreveu:

> Hello,
> 
> I found this 
> guide:https://www.onetransistor.eu/2017/05/magix-usb-videowandler-2-linux.html 
> which explains how to get Magix Videowandler 2 as an audio-video 
> source. It is achieved by downloading drivers from LinuxTV project, 
> slightly modifying them and installing. I wanted to incorporate changes 
> from the guide to the upstream code, but first I wanted to test 
> everything once again. I tried to follow the described method of 
> compiling drivers (before making any changes) and I got stuck with a 
> following output:
>   CC [M]  /tmp/media_build/v4l/videobuf-core.o
>   CC [M]  /tmp/media_build/v4l/videobuf-dma-sg.o
> /tmp/media_build/v4l/videobuf-dma-sg.c: In function 
> 'videobuf_dma_init_user_locked':
> /tmp/media_build/v4l/videobuf-dma-sg.c:190:17: error: 'FOLL_LONGTERM' 
> undeclared (first use in this function); did you mean 'FOLL_FORCE'?
>          flags | FOLL_LONGTERM, dma->pages, NULL);
>                  ^~~~~~~~~~~~~
>                  FOLL_FORCE

The media_build basically downloads a tarball with the media drivers
from the media_tree.git tree and applies a set of backport patches.

Today, the media_tree.git received an update with Kernel 5.2-rc1
development. It is likely that the media_build tree will require 
some changes after that, as some upstream Kernel APIs may have
changed.

If you can, it would be better if you could just use the git tree
and build a new kernel from it. Otherwise, you may need to wait
a few days for people to add the needed backports from changes that
happened upstream and got reflected at media_build.

For em28xx, you can do whatever it takes for videobuf-dma-sg.c
to build (I would just remove " | FOLL_LONGTERM" from the above),
as em28xx doesn't use videobuf-dma-sg (it uses, instead,
videobuf2-vmalloc.h). This legacy core driver is used only on a couple
of PCI drivers.

I suspect, however, that you may find other breakages over there.

> /tmp/media_build/v4l/videobuf-dma-sg.c:190:17: note: each undeclared 
> identifier is reported only once for each function it appears in
> 
> What could have caused it? I suppose that the code already in the 
> repository has been checked and such thing should not happen if not by 
> my mistake, but I did not change anything after cloning git repo.
> 
> Regards
> Dominik Danelski
> 



Thanks,
Mauro
