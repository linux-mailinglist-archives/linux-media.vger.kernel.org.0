Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7525F164629
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 14:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgBSN5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 08:57:07 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34254 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgBSN5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 08:57:07 -0500
Received: by mail-ot1-f68.google.com with SMTP id j16so214136otl.1
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 05:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j8vovJNm85f5usRJ1zcPBGMV6jnEx/0KxRYN+gnAQ+M=;
        b=sWeSfpFGruDVn86qR+hCqpqBGNLZZx5Ph0QBUt4bcsFc0tzS5U/AbhqIXyoS+JQfoZ
         HrmUnapjD0UL++fI2dmE/qJEkCECxyj//5I4MazefjyAgWbbJ1eyiO4XA0+JkqVMcGWQ
         Y5MZjm1KWzu9+RiNNXAgTp8KGpmjDAgdTuHcfTVzISUhOjPxXjLuRcQErd3iSgaiIpze
         4n7NStpwrhTCtjwFfDgZ9d9V2oB44EawnMZcaUcgiz2rxUz22Qb1nga0yjVi6GaE1JQM
         VhhTsKfzwt0faqsEm93hldVBz/D2L2GcZ67t/knGkDweK3piMtMZd5OETk4v3rnCnwah
         vekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j8vovJNm85f5usRJ1zcPBGMV6jnEx/0KxRYN+gnAQ+M=;
        b=EdoFr3MxHVPJ+NxwbocmDmTox+wR2ItLIGLdZmplfkJ0tpUZUmFImV9eJfArQ79c0H
         pC20ctesSwQMyk1nDfj03/wz1SDry9FHYzLzz987X0Gvf1rxXqGb2NCumO38E+sW+5qk
         smN4ikonp7b3o3KvN6rD7mOxMO7VovGZpIdro2Ak3lV5MrUeF3mf6/me5+vSW6EvXdJ8
         BSxVVe65O4k8pYlLlqS9VmmZqfPOx0yb+dIe0yi45LcoFQ66nOL59LmC0hzOJukb3JLS
         Bnd/LawswkGDU0bmsQ2kWIi0kihrB8SGBLYe8w61RKx8n1RVnXp7Q5cbRrxTioc6bKyH
         BueQ==
X-Gm-Message-State: APjAAAVqmFbwRODQ9kYhmwWeAuQ/zLFw5IqimGiID6mtBjasEbSedYVQ
        8DcU4xXywpcT34ZfDMjK+AZ2RC6ZlQLySLy6Is0=
X-Google-Smtp-Source: APXvYqxobnzqgBR/e8PcDr4UtJBmbiIcf1koeAjfRvRXQpVMjv0sBo/r0Koh2tq5Hw9XfirY5kkDRQ5O76+4MCO41f4=
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr19765073otl.325.1582120626053;
 Wed, 19 Feb 2020 05:57:06 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8tnsxJP2CfwgrkPum6mYQEEP9+0=Fap4dFu-3x+fXdadw@mail.gmail.com>
 <20200219120808.GA5070@pendragon.ideasonboard.com> <CA+V-a8ux+8=PzWupMnpNRZsZCwG4VvVfN+dYayhEG=x927SWFg@mail.gmail.com>
 <20200219123247.GA9960@pendragon.ideasonboard.com>
In-Reply-To: <20200219123247.GA9960@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 19 Feb 2020 13:56:39 +0000
Message-ID: <CA+V-a8vcJiXwT5L2G8+HyrrxQOSJt0Zz+TeT4AbmQqcqxe7feg@mail.gmail.com>
Subject: Re: [Query] : DT: Adding mezzanine board
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Feb 19, 2020 at 12:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Feb 19, 2020 at 12:25:37PM +0000, Lad, Prabhakar wrote:
> > On Wed, Feb 19, 2020 at 12:08 PM Laurent Pinchart wrote:
> > > On Wed, Feb 19, 2020 at 11:42:42AM +0000, Lad, Prabhakar wrote:
> > > > Hi,
> > > >
> > > > I am working Renesas RZ/Gx platforms, these boards have support for
> > > > connecting MIPI adapter mezzanine board [1]. To enable this support I
> > > > am planning to create a dtsi which will include the board file and
> > > > enable the necessary VIN/CSI and the camera endpoint.
> > > >
> > > > For example: to add support for G2E board I would create a file named
> > > > r8a774c0-cat874-mipi-adapter.dtsi which will include the board file
> > > > r8a774c0.dtsi and enable necessary VIN/CSI/Camera endpoint and when
> > > > user wants to enable this support for the G2E board he could just
> > > > include r8a774c0-cat874-mipi-adapter.dtsi to r8a774c0-cat874.dts
> > > >
> > > > Would this be a good approach or is there an alternative way which I am missing.
> > >
> > > DT overlays are another option. They can't be applied on a running
> > > system though. It doesn't seem like the mezzanine boards can be detected
> > > by the boot loader, so overlays can't be applied automatically before
> > > the kernel is started. One option would still be to provide them to
> > > U-Boot and apply a selected overlay based on environment variables.
> > > Another option would be to apply overlays as part of the build process,
> > > which shouldn't require modifying the DT sources to #include the .dtsi
> > > file for the mezzanine board.
> >
> > Thank you for the insight, overlay is something which I wanted to
> > avoid and have the dtb as part of kernel itself. How about just
> > creating r8a774c0-cat874-mipi-adapter.dts which would include
> > r8a774c0-cat874.dts file and enable the VIN/CSI/Camera endpoint, so
> > the user would just use r8a774c0-cat874-mipi-adapter.dtb file when the
> > mipi adapter is connected ?
>
> That would restrict usage of the mezzanine board to a particular base
> board, while in the general case there could be different types of base
> boards compatible with a set of mezzanines.
>
> The reason why I mentioned overlay isn't really to apply them
> dynamically, but for the set of tools around them. Bootloaders can apply
> overlays, and we can also apply overlays to a DTB as part of a build
> process, without patching the source. Is there a particular reason why
> you would prefer avoiding them ?
>
Just didnt wanted to maintain to the DT overlay separately, but looks like
overlay itself would be a way to go.

Thank you for the inputs.

Cheers,
--Prabhakar

> > > > [1] https://github.com/Kevin-WSCU/96Boards-Camera/blob/master/AISTARVISION%20MIPI%20Adapter%20V2.1/AISTARVISION%20MIPI%20Adapter%20V2.1.pdf
>
> --
> Regards,
>
> Laurent Pinchart
