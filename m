Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E330017C882
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 23:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFWsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 17:48:55 -0500
Received: from ms.lwn.net ([45.79.88.28]:45568 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgCFWsy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 17:48:54 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2401E537;
        Fri,  6 Mar 2020 22:48:54 +0000 (UTC)
Date:   Fri, 6 Mar 2020 15:48:53 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] Move media uAPI and kAPI docs to a better place
Message-ID: <20200306154853.7d5c3165@lwn.net>
In-Reply-To: <cover.1583316037.git.mchehab+huawei@kernel.org>
References: <cover.1583316037.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed,  4 Mar 2020 11:51:01 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This is something that you always wanted: move uAPI and kAPI to
> separate books.

Oh goodie...Christmas is coming early this year...:)

> This RFC series start doing it for the media docs.
> 
> For now, this is just a RFC, being only an initial step for it. I'm sending
> it on this early stage just to rise some discussions.
> 
> This changeset basically moves:
> 
>   - the media kAPI files to be under driver-api/media;
>   - the media uAPI files to be under userspace-api/media.
> 
> This version keeps including both inside Documentation/media/index.rst.

The moves make sense to me.  The including part I'm not so sure about.  It
seems kind of strange to have the structure of the rendered docs be
different from that of the plain-text docs; it suggests that one of the two
placements is wrong.

My own choice (as you suggest later) would be to keep the structure the
same in both domains, and to use cross-references to create paths where
they are needed.

> The driver-specific information is messy, as each file there may contain
> either one or more of the following items:
> 
> 	- driver-development information;
> 	- on a few drivers, drivers-specific uAPI.
> 	- modprobe parameters;
> 	- List of devices supported by each driver;
> 
> The last two are probably contents for the admin-guide, but not sure
> where to place driver-specific development information. Does it
> belong to "driver-api" book too?
> 
> I guess that driver-specific uAPI could fit at the userspace-api, but I
> don't want them to be at the same place as the core media API stuff.
> 
> Suggestions?

That is a good question.  I've wondered for a bit if we need a separate
hardware manual for documentation specific to a given device.  In cases
like this, it could perhaps consist mostly of cross-references to the
relevant documentation in the other manuals.  It's hard to argue, for
example, that "modprobe parameters" should be somewhere other than with all
the other command-line parameters...

Thanks,

jon
