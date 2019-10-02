Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DEDC4BEA
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 12:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJBKlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 06:41:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59122 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfJBKlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 06:41:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=K8NTwmVbZXIDEenHzpqtkedFBqezWRvxmlBHp3Hj0pQ=; b=Y+XRyf9G0kMhMTCYVRpLHtfdY
        +05aw70lKOz9fCWQiz+k7aXWHWP/xQzMhixJE/nVQkUYGCyEzMrToDAGtQZwuTjzFaHXVy0mXEjf0
        QrYPF/4ERMlaxT66Snhq0O+S/Bb3C6Y22QaYLSATMsurRfO7RsBXCO47zZS+OzdDN4FzAQdhPG5U5
        d7r7jZCEJi7p66EcCjdq46TiOlF52phDZDzxGFAGlSyuJKBW0jAitTvuJUfXUqtOxRooEBB1dnL7R
        qMFhnfacDNMgf7xR/etJzroL/oK5DDo4vPj4tHTH4dao+thCEolsQN4uBWCXsPaf+eVEMFNbcfF5t
        /fvq4b2Bw==;
Received: from 177.157.127.95.dynamic.adsl.gvt.net.br ([177.157.127.95] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFc4D-0005CV-WE; Wed, 02 Oct 2019 10:41:10 +0000
Date:   Wed, 2 Oct 2019 07:41:06 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: Build failed in Jenkins: v4l-utils #43
Message-ID: <20191002074106.6fc8c73a@coco.lan>
In-Reply-To: <90907ad0-6fe3-5293-aeeb-44ecdfb840da@xs4all.nl>
References: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
        <6a1df171-bd07-5eef-1917-4171fb3bc359@xs4all.nl>
        <20191002063658.3771c1fa@coco.lan>
        <90907ad0-6fe3-5293-aeeb-44ecdfb840da@xs4all.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Oct 2019 11:49:20 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 10/2/19 11:36 AM, Mauro Carvalho Chehab wrote:
> > Em Wed, 2 Oct 2019 10:25:02 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >   
> >> Hi Mauro,
> >>
> >> On 10/2/19 10:16 AM, Jenkins Builder Robot wrote:  
> >>> See <https://builder.linuxtv.org/job/v4l-utils/43/display/redirect?page=changes>
> >>>
> >>> Changes:
> >>>
> >>> [hverkuil-cisco] keytable: add new generated keymaps
> >>>
> >>> [hverkuil-cisco] msg2ctl.pl: add newline after log_msg
> >>>
> >>> [hverkuil-cisco] cec-follower: drop the hardcoded UI commands list
> >>>
> >>> [hverkuil-cisco] cec-ctl/cec-log: use new CEC_OP_UI_CMD defines    
> >>
> >> You need to remove utils/cec-follower/cec-log.h.
> >>
> >> This file was generated but the generated file is now called cec-log-gen.h.
> >> A new cec-log.h was also added to utils/common as a companion to cec-log.cpp.
> >>
> >> Unfortunately, the old cec-log.h clashes with the new cec-log.h. And since
> >> the old cec-log.h was generated and so is not part of the git repo it is
> >> not removed as part of a 'git pull'.
> >>
> >> Anyway, just remove utils/cec-follower/cec-log.h and it compiles again.  
> > 
> > I manually removed the file at the builder and at the slave machines and
> > asked for a new build. The build now succeeded.
> > 
> > That's said, we should really avoid disruptive changes like that, fixing
> > the building system for it to do the right thing, as users of the v4l-utils 
> > will also face the same issue if they update their git trees.
> > 
> > At any time, a clean git update with something similar to:
> > 
> > 	git remote update
> > 	git fetch origin
> > 	git reset --hard origin/master
> > 	./bootstrap.sh
> > 	./configure
> > 	make
> > 
> > should work.
> > 
> > Regards,
> > Mauro
> >   
> 
> Yes, I discovered it too late. That said, I'm not sure what to do about
> it since the old generated file is not under the control of git.
> 
> A 'make distclean' before the 'git fetch' would remove it, but after the
> update it is just an orphaned file.
> 
> I've actually added a 'make distclean' in my daily build scripts.

That's a very bad idea. The builds should check and pinpoint to
regressions at the building system too.

If I understand the problem, you're saying that now cec-log.h depends on
the generated cec-log-gen.h, right?

If so, this could be easily fixable by adding an explicit dependency
rule to the Makefile.am, like:

	cec-log.h: cec-log-gen.h

Thanks,
Mauro
