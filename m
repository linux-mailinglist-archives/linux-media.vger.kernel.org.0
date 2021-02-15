Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5339F31B62E
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 10:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhBOJHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 04:07:11 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:56735 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhBOJG7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 04:06:59 -0500
Date:   Mon, 15 Feb 2021 09:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1613379973;
        bh=2nAm6Q9p3kMTXLrc/9PsknifgDbenAAUOXq3KGVIrtw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=AgihlhiMBiKpn2AUSMU4MbjjTvrJBs+g1bQ2Z7b8VBvkxoiItg9javlL+V3ZfoiJg
         IeooACpUH4OVaTrX3hHe50R7sm6h7VarQsTDXwyUY0Kv2r0T8K2L7j6BN3BGh6YmFN
         PUlSgqUWc7yVU6DKZKu3NupB73Q44cDX7zsQhs/W7NO8/2MB231MTcFGSjaHuphS36
         Lh6Fo5qoe2kWu5gZL9fnUkA5fFUgzM8+xnMEpFS/pw6coIuKaBSinCXUm/QS79liZU
         c7G7x2oaubgXNU9wYybPMmwYc+gxXHoVLzrLxg6VUtykma0fnggRK7xzshR7XzIso0
         zXx+fQn+jz0+w==
To:     =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        lkml <linux-kernel@vger.kernel.org>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: DMA-buf and uncached system memory
Message-ID: <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, February 15th, 2021 at 9:58 AM, Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:

> we are currently working an Freesync and direct scan out from system
> memory on AMD APUs in A+A laptops.
>
> On problem we stumbled over is that our display hardware needs to scan
> out from uncached system memory and we currently don't have a way to
> communicate that through DMA-buf.
>
> For our specific use case at hand we are going to implement something
> driver specific, but the question is should we have something more
> generic for this?
>
> After all the system memory access pattern is a PCIe extension and as
> such something generic.

Intel also needs uncached system memory if I'm not mistaken?

Where are the buffers allocated? If GBM, then it needs to allocate memory t=
hat
can be scanned out if the USE_SCANOUT flag is set or if a scanout-capable
modifier is picked.

If this is about communicating buffer constraints between different compone=
nts
of the stack, there were a few proposals about it. The most recent one is [=
1].

Simon

[1]: https://xdc2020.x.org/event/9/contributions/615/
