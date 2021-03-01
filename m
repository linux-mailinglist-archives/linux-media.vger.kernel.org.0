Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F60E327FF1
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 14:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235921AbhCANsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 08:48:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:40646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235917AbhCANs3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 08:48:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C49CD64DBA;
        Mon,  1 Mar 2021 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614606468;
        bh=/CSTthiMwxi8nZQN4nYoEUucKpPH+FiRQ1OvJb1RD2E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NbdJ8IMAyGRddRdseDH76pvVnTM7oymXMnGyv5E5n89fLgXG+umWik9lLFlsGzT3M
         0sNFAMUYKV4kO6Wqe/9+qRMdTfN6ch6m6Uc0cJV4tDor4Nn8WoqzhB2q55wnb7O6th
         zwP3gtWRARS4HSLIRsc6y8IfnWezpXmgvLJO/GZfM0XGf5z2zSky1lfew/jpYlzhx8
         H8HnpjQTsHftXrXUVLSXdiTUDD4twH00Wb/iPOg+rILlRfwT2eEKUxIeic/lxnP9al
         9VqtHLCGcumPwUE8woNpsFKyLT+v54cbjkz+HeLtnQulmwMv4eTgUpTGDZab9c4qOC
         O8qbDT3dEFKdQ==
Date:   Mon, 1 Mar 2021 14:47:41 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: add a subsystem profile documentation
Message-ID: <20210301144741.11a5751b@coco.lan>
In-Reply-To: <e757851a-91a1-225b-fa6e-3c7d44a6cc5c@xs4all.nl>
References: <7ac41052a64ae3cfceaa9d08a82afc9dcf2392c5.1614599129.git.mchehab+huawei@kernel.org>
        <e757851a-91a1-225b-fa6e-3c7d44a6cc5c@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 1 Mar 2021 13:27:39 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Mauro,
> 

Thanks for your review. I'm addressing the points on a v5.

Yet, there's one that, IMHO, we should elaborate more, if we add it to the
doc:

> > +Provided that your patch is at https://patchwork.linuxtv.org, it should
> > +be sooner or later handled, so you don't need to re-submit a patch.
> > +
> > +Except for bug fixes, we don't usually add new patches to the development
> > +tree between -rc6 and the next -rc1.
> > +
> > +Please notice that the media subsystem is a high traffic one, so it
> > +could take a while for us to be able to review your patches. Feel free
> > +to ping if you don't get a feedback in a couple of weeks or to ask
> > +other developers to publicly add Reviewed-by and, more importantly,
> > +Tested-by tags.  
> 
> What I have noticed is that sometimes important bug fixes are missed due
> to the high traffic volume. I would like to see something along the lines of:
> 
> "If important bug fixes are not reviewed or picked up within a week of posting,
> then do not hesitate to ping."

I see your point, but "important" is relative ;-) I mean, a bug
is almost always important for the one reporting it. It doesn't
necessarily means that such bug is visible by others or if the
subsystem's core has a serious bug.

IMO, if we add a paragraph like that, we should better explain what
"important" means.

Thanks,
Mauro
