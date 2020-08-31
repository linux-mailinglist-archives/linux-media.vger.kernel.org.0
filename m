Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1F625738D
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 08:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgHaGKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 02:10:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgHaGKO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 02:10:14 -0400
Received: from coco.lan (ip5f5ad5da.dynamic.kabel-deutschland.de [95.90.213.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2351320707;
        Mon, 31 Aug 2020 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598854213;
        bh=Zmks2Aquajz6LBrPelA2l2f7kJoyZKXZ/tvfFh814XM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MW3+yUjiCpBdBV6RhrZGNl6oxSVwO3lkfEEjxJyQA8X+Eyq/KayU70FJH+bgDWZVJ
         s+qiyyyzaFB31czOuCEqzSIamUNr3Pf2DsuBN7wLfmMkfI6ITIfQ8OrpJ0nVQqrPON
         zRZ2k4pin+zmgABzeyht9Nt+5VpwY4YOX1ilOadk=
Date:   Mon, 31 Aug 2020 08:10:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v5.10 (v2)] mtk-vcodec: venc: support for MT8183
Message-ID: <20200831081008.2d2c153b@coco.lan>
In-Reply-To: <CAPBb6MXoyg7UY57SWR-wOrty0hEmW=VAA-1zTi7q3moruRiZ-Q@mail.gmail.com>
References: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl>
        <20200830104650.0dd4d751@coco.lan>
        <CAPBb6MXoyg7UY57SWR-wOrty0hEmW=VAA-1zTi7q3moruRiZ-Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 31 Aug 2020 10:33:44 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

> Hi Mauro,
> 
> On Sun, Aug 30, 2020 at 5:46 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Sat, 29 Aug 2020 10:43:12 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >  
> > > Note 1: the MTK_SCP config option causes COMPILE_TEST to fail, but a patch for that
> > > is pending for the remoteproc tree: https://lkml.org/lkml/2020/8/21/489
> > > I've verified that that patch fixes the COMPILE_TEST failure.  
> >
> > Breaking COMPILE_TEST is a very bad idea, as it means that the robots
> > will stop reporting issues on this driver, including our own Jenkins
> > instance.
> >
> > We need a solution for it, like:
> >
> > 1. postponing the changes that caused it to break to be added only
> >   after the merge window;
> > 2. ask an ack from remoteproc maintainer for him to send his ack
> >   and having the patch applied via our tree;
> > 3. cherry-pick the fixup patch, applying it before the patch which
> >   broke the build;
> > 4. pull from a permanent branch from the tree where the fixup patch
> >   were merged;
> >
> > Looking at lore:
> >         https://lore.kernel.org/linux-remoteproc/20200821115832.2893484-1-acourbot@chromium.org/
> >
> > I can't see any reply to this patch. Was it already merged there?
> > I guess not:
> >         https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next
> >
> > I'm not a big fan of (4), as, if something bad happens during the
> > merge window with the tree containing the fixup patch, we may have
> > some bad time merging media upstream, specially if such tree would
> > contain something that. So, if we would use alternative (4), I'll
> > likely place all changes for mtk driver on a topic branch, to be
> > merged upstream only after the pull request with the fixup
> > patches got merged.  
> 
> It also seems that the series with other mtk-vcodec changes being
> merged in between, the series does not apply as-is to the media tree.
> The conflict is trivial to resolve, but please let me know if you
> would like me to rebase and resend along with the SCP patch once the
> remoteproc maintainer acks it.

Hans did a rebase on this version 2 and all patches apply OK.
I guess he also did build test with the remoteproc patch applied, 
and build fine. Yet, Jenkins were unable to check the build patch
per patch, due to the Kconfig issue.

Once the Kconfig issue has sorted out, feel free to send an updated
version, if something else is needed. On such case, please preserve
Hans SoB for the patches that won't require non-context changes.

Thanks,
Mauro
