Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A666D233821
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 20:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgG3SJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 14:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgG3SJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 14:09:59 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC003C061575
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 11:09:58 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t15so5275325pjq.5
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yJTC9tdJwPLZ8XKjWGq9++9+N0X7BqXA0dHtAoYBz9A=;
        b=UnWw23WTINjuXuXNdaist30khDs1c76D+z0KQ6m6AhcqH3uxHqK6lgZjSuWJv0sKZB
         ISppBq8MZDjG7NwpJvrVyTZAyCbuxv+WVOZwjfBnCD8oPjVeuRiGC/BCpfSioAViXnLU
         MpYyhsEcJEiFHC3eeB31X7rhndwhn7eiNYZH9q0ZyhNUA/fEUVceSRygOXbjA9zwAdo0
         DNsh5v6JHb+u+zadCmSgzxMyE7LIxOBD29WMeBvW6T6H0BOtA8XiXMPP87UGnFHva4bS
         1kuf2/03DYjqJSHHuM8v6+WuM0ncGcvH24PColr0vX5JF9RMfvhuyRx2b9SK9GLyCdzx
         qpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yJTC9tdJwPLZ8XKjWGq9++9+N0X7BqXA0dHtAoYBz9A=;
        b=sn8cvywoytJ0v9T/rsoiV8zSXJ0L3+t2gYYfAH1iMitQWVeIKoyONGLupKLDxsQGPO
         3lmBXiEoVIOR3ziFy49vyyyiJTFGvHId1Wf0inWMJF+41beqwqcXVZRAd96uh3jM8hss
         7/AOoO2XIW0hVz3yufn9x1lVUVt1lMkRethZQaYFMSp0t/y51ZMdaQ9m4RABcMIIt6W0
         jz9VIJRQOpNSPdIhi6VzHpFXNI+H2ETUjyuM/5kx9Jk59v494VC78QI2Fe69kis1vSiw
         3EoUn3y0RNWEsD1K3tCDOHvB0Bc+uRID0udA1j95d1pKPxampJQGAVX/5XUgyL64er85
         NamA==
X-Gm-Message-State: AOAM532AzzcrAYakEak2Dnq+1DFXxsGOv9EOhCjPnQVisI6KLcbi9Sv3
        +7lBKBZMQ5v5W91Lwk4u5Jb9Iw==
X-Google-Smtp-Source: ABdhPJyx/HxNt8rspjLNKULshkc3XEh52fqmPI0aPPmFIUc16IcVv/T2Z88hD58BvEbeAlzS8tsQXQ==
X-Received: by 2002:a63:3c41:: with SMTP id i1mr79055pgn.349.1596132598057;
        Thu, 30 Jul 2020 11:09:58 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id y6sm6166676pji.2.2020.07.30.11.09.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 11:09:57 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Thu, 30 Jul 2020 23:39:49 +0530
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200730180949.GA14700@kaaira-HP-Pavilion-Notebook>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200730105112.GA7079@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730105112.GA7079@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 01:51:12PM +0300, Laurent Pinchart wrote:
Hi,

> Hi Kaaira,
> 
> Thank you for the patches.
> 
> On Fri, Jul 24, 2020 at 05:32:10PM +0530, Kaaira Gupta wrote:
> > This is version 2 of the patch series posted by Niklas for allowing
> > multiple streams in VIMC.
> > The original series can be found here:
> > https://patchwork.kernel.org/cover/10948831/
> > 
> > This series adds support for two (or more) capture devices to be 
> > connected to the same sensors and run simultaneously. Each capture device 
> > can be started and stopped independent of each other.
> > 
> > Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> > capture devices can be part of the same pipeline. While 3/3 allows for 
> > two capture devices to be part of the same pipeline and thus allows for 
> > simultaneously use.
> 
> I think this is really nice work, as it will make the vimc driver even
> more useful for testing purposes.
> 
> I however just noticed that the patches seem to have lost Niklas'
> authorship. Niklas posted v1 ([1]), and while there's absolutely no
> issue with taking over a patch series (especially when the original
> author is aware of that, and approves :-)), it's customary to keep the
> original authorship.

Hm, I had a meeting with Kieren yesterday where he explained this to me.
I wasn't aware of the distinction between authorship and a Signed-off
tag, I thought signed-off implies authorship. Now that I know this, I
will amend this in the next version I send.

Thanks!

> 
> Authorship, as recorded in the commit's "Author:" field (displayed by
> "git show" or "git log" for instance), is distinct from Signed-off-by.
> The original Signed-off-by line needs to be preserved to indicate the
> original author's commitment to the certificate of origin ([2]), but in
> itself that doesn't acknowledge original authorship of the code.
> 
> I'm sure this is an oversight. Authorship can easily be changed with the
> --author option to "git commit --amend".
> 
> $ git show -s
> commit 8be3a53e18e0e1a98f288f6c7f5e9da3adbe9c49 (HEAD -> tmp)
> Merge: fc10807db5ce 3c597282887f
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Jun 24 17:39:30 2020 -0700
> 
>     Merge tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
> 
>     Pull erofs fix from Gao Xiang:
>      "Fix a regression which uses potential uninitialized high 32-bit value
>       unexpectedly recently observed with specific compiler options"
> 
>     * tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs:
>       erofs: fix partially uninitialized misuse in z_erofs_onlinepage_fixup
> $ git commit --amend --author 'Laurent Pinchart <laurent.pinchart@ideasonboard.com>'
> [tmp 6a7191c2aee9] Merge tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
>  Date: Wed Jun 24 17:39:30 2020 -0700
> $ git show -s
> commit 6a7191c2aee9e4a2ba375f14c821bc9b4d7f881b (HEAD -> tmp)
> Merge: fc10807db5ce 3c597282887f
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Jun 24 17:39:30 2020 -0700
> 
>     Merge tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
>     
>     Pull erofs fix from Gao Xiang:
>      "Fix a regression which uses potential uninitialized high 32-bit value
>       unexpectedly recently observed with specific compiler options"
>     
>     * tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs:
>       erofs: fix partially uninitialized misuse in z_erofs_onlinepage_fixup
> 
> Not that I would try to take ownership of a commit authored by Linus, I
> doubt he would appreciate that :-)
> 
> Authorship is normally preserved through git-format-patch,
> git-send-email and git-am:
> 
> - git-format-patch sets the "From:" line to the patch's author
> 
> - If the "From:" line is different than the mail sender, git-send-email
>   replaces it with the sender's identity (as we don't want to forge
>   e-mails with an incorrect sender). It then adds the original "From:"
>   line *inside* the mail, just after the headers, right before the body
>   of the commit message.
> 
> - git-am sets the author to the "From:" line from the e-mail's body if
>   it exists, and uses the "From:" line from the e-mail's header (the
>   sender's identity) otherwise.
> 
> If you use those tools authorship should get preserved automatically.
> 
> Of course new patches that you would add to the series should have your
> authorship.
> 
> I hope this helps clarifying the process, please let me know if you have
> any question.
> 
> [1] https://lore.kernel.org/linux-media/20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n431
> 
> > Changes since v1:
> > 	- All three patches rebased on latest media-tree.
> > 	Patch 3:
> > 	- Search for an entity with a non-NULL pipe instead of searching
> > 	  for sensor. This terminates the search at output itself.
> > 
> > Kaaira Gupta (3):
> >   media: vimc: Add usage count to subdevices
> >   media: vimc: Serialize vimc_streamer_s_stream()
> >   media: vimc: Join pipeline if one already exists
> > 
> >  .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
> >  .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
> >  drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
> >  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
> >  .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
> >  5 files changed, 73 insertions(+), 10 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
