Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5501F256CED
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 10:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgH3Iq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 04:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgH3Iqz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 04:46:55 -0400
Received: from coco.lan (ip5f5ad5b3.dynamic.kabel-deutschland.de [95.90.213.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC9942078D;
        Sun, 30 Aug 2020 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598777215;
        bh=u353U1qg0daJPQcN0ugvdw2KcI1/+xrfuDqSvC+SpJk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gC9yb33TjEr3Tt1EhX54/BDubBeo8pmlKql5U6ujNkxaDzUIBJO0Ek6/wton5ANTc
         sYt4Df1G15clXEf/FYJhSQVJxQV6JCwdNNOsCt08+9L3b3c1/4yZQbkw2aYifSxgQB
         13RCAo5be1He+3Pr6JrD7F1Q6Ms8iiV0SirkjUL4=
Date:   Sun, 30 Aug 2020 10:46:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [GIT PULL FOR v5.10 (v2)] mtk-vcodec: venc: support for MT8183
Message-ID: <20200830104650.0dd4d751@coco.lan>
In-Reply-To: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl>
References: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 29 Aug 2020 10:43:12 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Note 1: the MTK_SCP config option causes COMPILE_TEST to fail, but a patch for that
> is pending for the remoteproc tree: https://lkml.org/lkml/2020/8/21/489
> I've verified that that patch fixes the COMPILE_TEST failure.

Breaking COMPILE_TEST is a very bad idea, as it means that the robots
will stop reporting issues on this driver, including our own Jenkins
instance. 

We need a solution for it, like:

1. postponing the changes that caused it to break to be added only
  after the merge window;
2. ask an ack from remoteproc maintainer for him to send his ack
  and having the patch applied via our tree;
3. cherry-pick the fixup patch, applying it before the patch which
  broke the build;
4. pull from a permanent branch from the tree where the fixup patch
  were merged; 

Looking at lore:
	https://lore.kernel.org/linux-remoteproc/20200821115832.2893484-1-acourbot@chromium.org/

I can't see any reply to this patch. Was it already merged there?
I guess not:
	https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

I'm not a big fan of (4), as, if something bad happens during the
merge window with the tree containing the fixup patch, we may have 
some bad time merging media upstream, specially if such tree would
contain something that. So, if we would use alternative (4), I'll
likely place all changes for mtk driver on a topic branch, to be
merged upstream only after the pull request with the fixup
patches got merged.

Thanks,
Mauro
