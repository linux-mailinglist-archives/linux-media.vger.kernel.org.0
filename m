Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA33C164425
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgBSM0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:26:04 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40395 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgBSM0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:26:04 -0500
Received: by mail-oi1-f193.google.com with SMTP id a142so23582093oii.7
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 04:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0I9/93wesnW5p5Iy7uDQ4O93z/E6hH35/HcBbTWAnrQ=;
        b=OQdaBOUCwxQJybBR9Miny9SfUOAqI5fMPLbFxXKrCKJIlIssLdzetTHKU4PkAlY6cl
         CtWxyQsU+SZVA82JuigtPvhn2kKY7eMy1Vi5sWw0O9C5oTVIZ2QEzqCoGpVEvfFymd8/
         oNm+o667qbPPhFCvWXbejcMDWHNS514Lhgw4dwab9MKmMt1z1MG30utpCLVA1Dx3SngZ
         EfBDaAjVrAWB9gBUW1S7WvOiPyurgGnBFlN8YfHHkUejuWmQJUwGu37k8Pd3iMUnl7Ff
         xsLi8NdwmpZE+5HKywghECJvU+XkbTaA+HD20oChvxeAc7QvIb4lwZWiSbO5DlGBaBpv
         Kgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0I9/93wesnW5p5Iy7uDQ4O93z/E6hH35/HcBbTWAnrQ=;
        b=DubD0dnkdBFWSbp090JJBuLd7kncMHFUiIa8FBueduh1GQVPVj6nKGVKzx856WaK6M
         mZv+Yp+LwSCLnP7f7avL9NiFqyPUuZzSTNRGCvaIrBrNjsD8kkq/viqO6FiGVPCwEqib
         4V22AdcxA2BB1mo4Y9LvXQcnminXcP/bNWxngm4WDMSFsCT2GEaT+uEvcWhke3WaFslY
         SWlsP5gq/1xDBvX2DLmJJFm2gjir4v2aBieZDrYfh3UIzzKwzT7JhxyFJC8TI43X9362
         kR3b6kCaiKXlWTfLrw9oYiSCz/bjKnetacAdVlW4OswigVsWweNOmT+mIQs6KHNDi6Vo
         m8xA==
X-Gm-Message-State: APjAAAWBFFpvb4bpqbsZntnxbyIWe8mlxuRTY5H+/UoBaITPX88p+ZfM
        4+kkFWqJmVyKt12PVIRs4CWxEcMlY98r8VB10Uc=
X-Google-Smtp-Source: APXvYqzWNH50l0c+DxfXdeYkBZoWhqfwypSwTFM3E3H1HAWz6u7TtmyWoDbt7Jv+proGAvxs5fSW/tcSZloDNuP9ylM=
X-Received: by 2002:aca:be57:: with SMTP id o84mr4467876oif.138.1582115163737;
 Wed, 19 Feb 2020 04:26:03 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8tnsxJP2CfwgrkPum6mYQEEP9+0=Fap4dFu-3x+fXdadw@mail.gmail.com>
 <20200219120808.GA5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219120808.GA5070@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 19 Feb 2020 12:25:37 +0000
Message-ID: <CA+V-a8ux+8=PzWupMnpNRZsZCwG4VvVfN+dYayhEG=x927SWFg@mail.gmail.com>
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

On Wed, Feb 19, 2020 at 12:08 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Feb 19, 2020 at 11:42:42AM +0000, Lad, Prabhakar wrote:
> > Hi,
> >
> > I am working Renesas RZ/Gx platforms, these boards have support for
> > connecting MIPI adapter mezzanine board [1]. To enable this support I
> > am planning to create a dtsi which will include the board file and
> > enable the necessary VIN/CSI and the camera endpoint.
> >
> > For example: to add support for G2E board I would create a file named
> > r8a774c0-cat874-mipi-adapter.dtsi which will include the board file
> > r8a774c0.dtsi and enable necessary VIN/CSI/Camera endpoint and when
> > user wants to enable this support for the G2E board he could just
> > include r8a774c0-cat874-mipi-adapter.dtsi to r8a774c0-cat874.dts
> >
> > Would this be a good approach or is there an alternative way which I am missing.
>
> DT overlays are another option. They can't be applied on a running
> system though. It doesn't seem like the mezzanine boards can be detected
> by the boot loader, so overlays can't be applied automatically before
> the kernel is started. One option would still be to provide them to
> U-Boot and apply a selected overlay based on environment variables.
> Another option would be to apply overlays as part of the build process,
> which shouldn't require modifying the DT sources to #include the .dtsi
> file for the mezzanine board.
>
Thank you for the insight, overlay is something which I wanted to
avoid and have the
dtb as part of kernel itself.
How about just creating r8a774c0-cat874-mipi-adapter.dts which would
include r8a774c0-cat874.dts
file and enable the VIN/CSI/Camera endpoint, so the user would just
use r8a774c0-cat874-mipi-adapter.dtb
file when the mipi adapter is connected ?

Cheers,
--Prabhakar

> > [1] https://github.com/Kevin-WSCU/96Boards-Camera/blob/master/AISTARVISION%20MIPI%20Adapter%20V2.1/AISTARVISION%20MIPI%20Adapter%20V2.1.pdf
>
> --
> Regards,
>
> Laurent Pinchart
