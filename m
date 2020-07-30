Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF2D233B39
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 00:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbgG3WVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 18:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729896AbgG3WVw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 18:21:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6791CC061574;
        Thu, 30 Jul 2020 15:21:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3E8E9B1;
        Fri, 31 Jul 2020 00:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596147706;
        bh=tM5TlcMVeVfAp5tWdQqULIkY3HLWphBT2H+vuHd4/WA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FuVe1YBcxZePZ3n52Wd8pYv6SLBrmV454ELevuXc/WEkt9IGGls2wa4f79h2BoIJ8
         bpPERfOjN467GTgsrpJ/vKZQFN/2sbVP4K1f1tBFkvXBTAsWuOTyvPznlazcmWIlrP
         /Qv2lTXriW9lgFTR6MOmQaKIeOGj5V69n9uKk2dw=
Date:   Fri, 31 Jul 2020 01:21:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200730222137.GF6107@pendragon.ideasonboard.com>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200730105112.GA7079@pendragon.ideasonboard.com>
 <20200730180949.GA14700@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200730180949.GA14700@kaaira-HP-Pavilion-Notebook>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On Thu, Jul 30, 2020 at 11:39:49PM +0530, Kaaira Gupta wrote:
> On Thu, Jul 30, 2020 at 01:51:12PM +0300, Laurent Pinchart wrote:
> > On Fri, Jul 24, 2020 at 05:32:10PM +0530, Kaaira Gupta wrote:
> > > This is version 2 of the patch series posted by Niklas for allowing
> > > multiple streams in VIMC.
> > > The original series can be found here:
> > > https://patchwork.kernel.org/cover/10948831/
> > > 
> > > This series adds support for two (or more) capture devices to be 
> > > connected to the same sensors and run simultaneously. Each capture device 
> > > can be started and stopped independent of each other.
> > > 
> > > Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> > > capture devices can be part of the same pipeline. While 3/3 allows for 
> > > two capture devices to be part of the same pipeline and thus allows for 
> > > simultaneously use.
> > 
> > I think this is really nice work, as it will make the vimc driver even
> > more useful for testing purposes.
> > 
> > I however just noticed that the patches seem to have lost Niklas'
> > authorship. Niklas posted v1 ([1]), and while there's absolutely no
> > issue with taking over a patch series (especially when the original
> > author is aware of that, and approves :-)), it's customary to keep the
> > original authorship.
> 
> Hm, I had a meeting with Kieren yesterday where he explained this to me.
> I wasn't aware of the distinction between authorship and a Signed-off
> tag, I thought signed-off implies authorship. Now that I know this, I
> will amend this in the next version I send.

No worries at all. The process is complicated :-)

> > Authorship, as recorded in the commit's "Author:" field (displayed by
> > "git show" or "git log" for instance), is distinct from Signed-off-by.
> > The original Signed-off-by line needs to be preserved to indicate the
> > original author's commitment to the certificate of origin ([2]), but in
> > itself that doesn't acknowledge original authorship of the code.
> > 
> > I'm sure this is an oversight. Authorship can easily be changed with the
> > --author option to "git commit --amend".
> > 
> > $ git show -s
> > commit 8be3a53e18e0e1a98f288f6c7f5e9da3adbe9c49 (HEAD -> tmp)
> > Merge: fc10807db5ce 3c597282887f
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Wed Jun 24 17:39:30 2020 -0700
> > 
> >     Merge tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
> > 
> >     Pull erofs fix from Gao Xiang:
> >      "Fix a regression which uses potential uninitialized high 32-bit value
> >       unexpectedly recently observed with specific compiler options"
> > 
> >     * tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs:
> >       erofs: fix partially uninitialized misuse in z_erofs_onlinepage_fixup
> > $ git commit --amend --author 'Laurent Pinchart <laurent.pinchart@ideasonboard.com>'
> > [tmp 6a7191c2aee9] Merge tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
> >  Date: Wed Jun 24 17:39:30 2020 -0700
> > $ git show -s
> > commit 6a7191c2aee9e4a2ba375f14c821bc9b4d7f881b (HEAD -> tmp)
> > Merge: fc10807db5ce 3c597282887f
> > Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Date:   Wed Jun 24 17:39:30 2020 -0700
> > 
> >     Merge tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
> >     
> >     Pull erofs fix from Gao Xiang:
> >      "Fix a regression which uses potential uninitialized high 32-bit value
> >       unexpectedly recently observed with specific compiler options"
> >     
> >     * tag 'erofs-for-5.8-rc3-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs:
> >       erofs: fix partially uninitialized misuse in z_erofs_onlinepage_fixup
> > 
> > Not that I would try to take ownership of a commit authored by Linus, I
> > doubt he would appreciate that :-)
> > 
> > Authorship is normally preserved through git-format-patch,
> > git-send-email and git-am:
> > 
> > - git-format-patch sets the "From:" line to the patch's author
> > 
> > - If the "From:" line is different than the mail sender, git-send-email
> >   replaces it with the sender's identity (as we don't want to forge
> >   e-mails with an incorrect sender). It then adds the original "From:"
> >   line *inside* the mail, just after the headers, right before the body
> >   of the commit message.
> > 
> > - git-am sets the author to the "From:" line from the e-mail's body if
> >   it exists, and uses the "From:" line from the e-mail's header (the
> >   sender's identity) otherwise.
> > 
> > If you use those tools authorship should get preserved automatically.
> > 
> > Of course new patches that you would add to the series should have your
> > authorship.
> > 
> > I hope this helps clarifying the process, please let me know if you have
> > any question.
> > 
> > [1] https://lore.kernel.org/linux-media/20190518010744.15195-1-niklas.soderlund+renesas@ragnatech.se/
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n431
> > 
> > > Changes since v1:
> > > 	- All three patches rebased on latest media-tree.
> > > 	Patch 3:
> > > 	- Search for an entity with a non-NULL pipe instead of searching
> > > 	  for sensor. This terminates the search at output itself.
> > > 
> > > Kaaira Gupta (3):
> > >   media: vimc: Add usage count to subdevices
> > >   media: vimc: Serialize vimc_streamer_s_stream()
> > >   media: vimc: Join pipeline if one already exists
> > > 
> > >  .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
> > >  .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
> > >  drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
> > >  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
> > >  .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
> > >  5 files changed, 73 insertions(+), 10 deletions(-)

-- 
Regards,

Laurent Pinchart
