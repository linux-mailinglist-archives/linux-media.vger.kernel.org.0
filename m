Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC1B3BA48A
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 22:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhGBUIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 16:08:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:38924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230176AbhGBUIB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 16:08:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC92E61402;
        Fri,  2 Jul 2021 20:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625256328;
        bh=A5DPEhW29twzmAgw1KpwYljJlAP9IdpKijYxozZYulY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Uj7Ib7PEjvndHX9xr55xNqv5cFYINZijTMsxJFyia65wSZjgKUABhYPQBffW5sOHm
         mtisKUg9RiyZ+xHvGz2NntJH3fbJqrY1g2OaD4k5TzN9fiblQQQ7lKCZ3FEpfwUQWF
         06dIVlH3md7smIwZOvXQ1IyZFnqr79syVAKtThzNkbbCouflevPDjS3dP7VaJIOSb7
         8v5pWYcAACK6jTgv17G2biiJHnPs2PxxDfL6CZLhbIZDnst0d2r6Q05jxYHkthh0j3
         Mz04ltqCLxygq++7laenWMkK8NW/2c8Rkin21K9CTxjc2qVU3fQF8T1LcznRVX76a6
         OtXPBRtwwJVsw==
Date:   Fri, 2 Jul 2021 22:05:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Tony Houghton <h@realh.co.uk>
Cc:     linux-media@vger.kernel.org
Subject: Re: DVB reliability problems
Message-ID: <20210702220523.1807450b@coco.lan>
In-Reply-To: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
References: <CA+GXpVVR4LBUjMduNWs7pZAcwoTHmQUExJcvBtxsr0oeubRVLw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 2 Jul 2021 18:06:26 +0100
Tony Houghton <h@realh.co.uk> escreveu:

> Hi,
> 
> I've been having problems with my DVB receivers lately. I'm not sure
> whether the problem is in the receivers or their firmware, or Linux.
> Some symptoms point to the card, some point to Linux (because they
> should try to prevent the system from hanging even with bad hardware
> if the hardware is peripheral?). Perhaps the majority of USB DVB
> receivers are actually useless junk?
> 
> I'm trying to develop a good DVB PVR, but if I can't fix these
> problems there's not much point in continuing. I hope someone can
> offer some suggestions on what's causing the problems and/or how I can
> diagnose them better, and hopefully get things fixed.
> 
> Frequently one of them will stop working. The main symptom is that
> after tuning they fail to get a signal. If I don't "fix" it asap by
> power cycling the PC (reboot seems to be inadequate) the situation
> seems to escalate until the entire system hangs, either when trying to
> use the receiver or at shutdown.

This is a very weird behavior. Never saw anything like that happening
with an upstream Kernel. Are you using anything else like some
proprietary driver or dvbloopback?

Are there any messages printed by the Kernel when the machine starts
to die?

If you're not using dvbloopback or a proprietary driver, I would
suspect that your PC hardware could have some issue... perhaps it
is overheating or there are some power issues on it, as it doesn't
make much sense that a fail to tune would cause a system hang.


Thanks,
Mauro
