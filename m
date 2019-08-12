Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3920F8A652
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 20:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfHLS3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 14:29:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46648 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfHLS3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 14:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kxb5BHX8j8/3KMkqf3WkF+xRjLZ9aAybEwRAEV6h6uE=; b=NO5leLp8JZDHW9rlAHhjBF3Cj
        jTrZ0jkTJv+yUNrdgFLfBlQ+FRs3OVqUDVbOyF2d9x5aBkb926a7Szwsq/pDfHkhzlHviui3m9fnS
        I/KWUjmmcqKQWxbzeKBOPizcoY/ZvMCzv6lfVUgnQQ2VlAdpFeqxEgpoJW+c1RO0NvcLEgGaCsheN
        eXoPsYatVLWLo75JAwWDkCIM2znXqJIhlNYXSLZKPtw2ntvytZJkcVYOFPlPgwPZnAiFqoAfBxvKd
        EWdV1248EdYUQk9z9t+O4Z+O3BSJPk+Y2j8cCWTTkP++tEJq18/NB6ZBrz6fK4p/SmWOZOXnrB33E
        cUyKosEkA==;
Received: from [179.182.166.35] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hxF4B-0005Yu-LL
        for linux-media@vger.kernel.org; Mon, 12 Aug 2019 18:29:12 +0000
Date:   Mon, 12 Aug 2019 15:29:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     linux-media@vger.kernel.org
Subject: [ANN] LinuxTV CI builder
Message-ID: <20190812152908.5e3d65f3@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Just want you to know about the latest news:

==================================
CI builder service for LinuxTV.org
==================================

Some of you may probably noticed already: thanks to OSU Open Source Lab[1], 
with is providing us a few VM instances, we now have a Jenkins server
running for the media subsystem. It can be accessed via this URL:

	https://builder.linuxtv.org/

[1] https://osuosl.org/

It is doing periodic builds on the projects related to our work, specially
for the trees hosted at linuxtv.org. I didn't add a job for a few projects
with already have another CI instance running.

Right now, we have the following projects being built:

	Userspace:
		- camorama
		- dtv-scan-tables
		- edid-decode
		- libcamera
		- tvtime
		- v4l-utils
		- xawtv3
		- xawtv4

	Kernelspace:
		- media_build 
		  (against Debian 10.0 Kernel - v4.19);
		- media_tree:
			- allmodconfig: x86_64
			- allyesconfig
				- x86_64, i386, arm and arm64
		- pull requests received by patchwork

Patchwork job
=============

The patchwork job is currently meant to help me to test the pull requests
sent by a media core maintainer, doing part of my own testing workflow.

Right now, it always apply the pull request against the master branch.

This will help me to merge patches quickly, as I'm doing a quicker review
on patches sent by a media core maintainer that the script won't point
any issues.

For patchwork pull requests, it should always do a build and provide
an answer for the build, testing against bisect breakages, and running
checkpatch/sparse/smatch, patch per patch. Currently, it is sending replies
in about 10 minutes or so, but the build time actually depends on the 
number of patches and if they're touching core header files or not.

Email policy
============

Except for the patchwork, the other jobs should send an e-mail to the ML
(and to me) when:

	- a build fails;
	- a failed build got fixed.

It shouldn't be sending e-mails if everything is fine.

Other CI instances related to media
===================================

Please notice that we have some trees with have already a CI instance
running:

	- ZBar:
	  https://travis-ci.org/mchehab/zbar

	- Kaffeine:
	  https://travis-ci.org/mchehab/kaffeine

So, no need to duplicate the efforts by adding them also to our builder.

Please let me know if you find any issues.

Future Plans
============

I'm planning to add support in the future for the CI to also handle patch
series builds from patchwork (against the master branch), but, for that to
work,  it seems that we'll need to upgrade from patchwork's stable version
to  the latest one - or wait for the next patchwork stable version. 

I'm also planning to change the media_build logic in a way that it would
not download media driver tallbals that failed on the builder machine.

Any other suggestions?

Thanks,
Mauro
