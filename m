Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B990D3A793D
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 10:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhFOIoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 04:44:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:42010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230454AbhFOIoA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 04:44:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FC6261421;
        Tue, 15 Jun 2021 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623746516;
        bh=DOqkVmnBr80KyQKj5AB82+ytMFP18EFZJKipaflcsy0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ka8rw4ixk0Wloh4el+pbnwNGpFhUGQ4CoZGE35yxnEcDn3sLFq3O9RVry4JkUc3sL
         bmYQlwsKwK2eIOJGGQpGOgRPKYQfxvuSvMPfiQ+H/O2Ai5dbFhzSiFUeGtZcOF3oO6
         jfTSuQsCSgvn4brhCxNnbB2du6lGvUWyQJEkfUxTUMaEZWegX2Gzp9ZbSjI+kmlGOk
         aOFSGuEsdUd02va9aAy2F3BgpIs615TGqZfM6JN896vxt7dD5q4OdgSoGbCX/9ytKn
         7ArzznK9rT8Ii6qZfb4zy/H3YF1LFXuqublKdEOUk1zZGFBOMwtRXgfNhJ/uExUZDL
         PoepvUPRFUwCQ==
Received: by mail-wm1-f48.google.com with SMTP id l9so13630110wms.1;
        Tue, 15 Jun 2021 01:41:56 -0700 (PDT)
X-Gm-Message-State: AOAM533UlchaLb4xNnwk37u4xXgwUwZdCofdx3UaUeyVMr7T3dfdxdwf
        dSftkXTTR3FGfIZG6y1MUDbTNT+5Dnyk5sz4hTQ=
X-Google-Smtp-Source: ABdhPJxaQoNcNsZ00Pqi6S1MjwkYI6mlR4YjuOa9Sfkn6PYpJUxlyeUCejATypHdd5AYLoYMq78YjYfGyYxcHZdkwQM=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr3915283wmb.142.1623746514904;
 Tue, 15 Jun 2021 01:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210614103409.3154127-1-arnd@kernel.org> <20210614103409.3154127-8-arnd@kernel.org>
 <YMePUYfDzdsErRab@pendragon.ideasonboard.com> <2d988daa-cb25-9f0d-8309-99f4de2a1e58@xs4all.nl>
In-Reply-To: <2d988daa-cb25-9f0d-8309-99f4de2a1e58@xs4all.nl>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Jun 2021 10:39:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2vgaOLtMBR84LCmsu8NA7b7bPK2jJoiqTxvgTzX7Lobw@mail.gmail.com>
Message-ID: <CAK8P3a2vgaOLtMBR84LCmsu8NA7b7bPK2jJoiqTxvgTzX7Lobw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] media: subdev: fix compat_ioctl32
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 15, 2021 at 10:27 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 14/06/2021 19:18, Laurent Pinchart wrote:

> >
> > Should we drop v4l2_subdev_core_ops.compat_ioctl32 and call
> > v4l2_subdev_core_ops.ioctl from subdev_do_compat_ioctl32() ? New drivers
> > should design custom ioctls in a way that doesn't require compat code.
>
> I agree, we can drop it completely.

I agree about new drivers defining their ioctls in a compatible way,
though Ideally
I'd say subdev drivers should not use custom ioctls at all. There are
two other drivers
that define private subdev ioctls and that lack a working compat handler:

- the omap3 isp driver would not work in compat mode, though I don't think there
  are any 64-bit SoCs using this hardware. The Sitara AM6 and J72 SoCs
  are the only chips in that family at the moment, but these don't
seem to include
  any image processor.

- The Intel Atom ISP driver has a broken compat ioctl handler that I remove
  in this series, but the  v4l2_subdev_core_ops->compat_ioctl32 callback
  would be the correct place to hook these up if they do not get fixed.

> I'll skip this patch, but I'll take the other 7 patches and make a v3 PR with
> updated Reviewed-by tags from Laurent.

Thanks!

        Arnd
