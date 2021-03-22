Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1131B343AD0
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 08:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCVHk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 03:40:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230018AbhCVHkZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 03:40:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA2D261973;
        Mon, 22 Mar 2021 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616398824;
        bh=sOH9HuItd2CUwo03Yj1I8YJQuHTOMD4EULY4jpgfDf8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lf1kPK5PPKldOLTu+NRbryMY0D9//hjH6vR8JTjkMdSvQWXYaYhF4y6JWoX/2SiCC
         JVc4+UE745Kh42zUTNod9A7GVbEX6oKUfZsQe+V8OyiVw9zoTkBVNCd5e7cm0uaU9o
         F3JwHKGcr8P8h59BSvYZn66Y7lCjmiA+WnIRz2gQxzN88JcQJeUiORdn7PbDvGKYP2
         u2RejLLWd3WZ4HzAr68ymG6/+SLHCH/2x8J/sLqBpqtLAZ8U+4T02ac1tK+AoY2u8B
         5gUtUY/gF107pF/A4k4DBWOs43T/0sxMqQSf6rabG6ojoaWDiSQFIivGpgDHx6bydz
         jjbUK1Ovg3wkA==
Date:   Mon, 22 Mar 2021 08:40:18 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: add a subsystem profile documentation
Message-ID: <20210322084018.6029c292@coco.lan>
In-Reply-To: <87y2ex5hjn.fsf@meer.lwn.net>
References: <95af047a293d8209cf80c05be2b31261cf142853.1614862252.git.mchehab+huawei@kernel.org>
        <87y2ex5hjn.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 08 Mar 2021 16:53:16 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Document the basic policies of the media subsystem profile.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/driver-api/media/index.rst      |   2 +
> >  .../media/maintainer-entry-profile.rst        | 206 ++++++++++++++++++
> >  .../maintainer/maintainer-entry-profile.rst   |   1 +
> >  3 files changed, 209 insertions(+)
> >  create mode 100644 Documentation/driver-api/media/maintainer-entry-profile.rst  
> 
> This all looks good to me; would you like me to take it or were you
> going to send it upward yourself?

I prefer merging it via the media tree, as we're planning to document
additional guidelines that drivers need to comply to to be upstreamable, 
such as using V4L2 standard ioctls instead of vendor-specific extensions
to configure parameters that are handled by V4L2, not requiring a 
closed-source daemon, etc.

> 
> Thanks,
> 
> jon



Thanks,
Mauro
