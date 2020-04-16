Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9961AB9CC
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 09:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439174AbgDPHWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 03:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:43854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439171AbgDPHVh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 03:21:37 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4A84206D5;
        Thu, 16 Apr 2020 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587021696;
        bh=cKDqjuGeUc9qH777WOCbMahh7GWs7zT6G+Q0mKBd48I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ehl247d6Hp3G+4g3SBIgJo8V43K38wUZ030GDJ8HQu6WBC0S7M1mLftkTgvR12jj2
         lSOufZuMkpTkD/RZeQX75K+BwRtSS3SwN2P+yesmoOk+747e1LZTosAnV9hlpNsTXd
         OqImzMM2VnSp2elpn67WfkwQ1fxfJ8E84jRFR1ZM=
Date:   Thu, 16 Apr 2020 09:21:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: Script to build the media documentation as if it were a single
 book
Message-ID: <20200416092132.2cbfce7e@coco.lan>
In-Reply-To: <e83dbd40-2a34-3bad-be5f-e451c3a5d020@xs4all.nl>
References: <20200414153739.30b58bdc@coco.lan>
        <e83dbd40-2a34-3bad-be5f-e451c3a5d020@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 16 Apr 2020 09:01:55 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 14/04/2020 15:37, Mauro Carvalho Chehab wrote:

> > ================================
> > Linux Kernel Media Documentation
> > ================================
> > 
> > .. toctree::
> > 	:maxdepth: 4
> > 
> >         admin-guide/index
> >         driver-api/index
> >         userspace-api/index  
> 
> Wouldn't it make more sense to have the userspace-api before the admin-guide?

There, I just placed them on alphabetic order.

But answering your question, that depends on the audience ;-)

-

Yet, assuming that we are doing a good job, I would expect a lot more
users than developers[1].

[1] Granted, there are lots of gaps there for it to be a generic guide
    to media subsystem. I'm planning to improve the admin-guide in order
    to make it more consistent and useful for media users.

The order there, IMHO, doesn't matter much, as someone accessing it from
LinuxTV.org would likely use this URL:

	https://linuxtv.org/docs.php

Side note: I need to add a pointer to the admin guide there - and at the
wiki pages.

Thanks,
Mauro
