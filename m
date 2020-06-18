Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626D61FF92D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 18:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgFRQZm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 12:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgFRQZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 12:25:40 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AD8C0613ED
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 09:25:39 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id s1so3411362ybo.7
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgmY/bq5WADl2wSclx81HU3mqmUZ2s6wpM2K8ozYh/I=;
        b=kEL4bK1dZihZhgR0VJn0n8rVXRz97FPvI/9DomeJV+waSl8+8r9Za2shd+TkuUNHkC
         b+18+cX2chruXAaqwmI/EAgUqJoBI+d2ppIh4a78ZpCXlHZy7Jry0515kr1wUP0hu5fN
         Us2n0H6ot/ceJ6RGgcVesjzKEUlJdHdHQIGkCN3S2/7AX/pXwZA6pRyLW+/uiS5wDA1B
         mwLjIUIotTejrOlCP4TKBJ5iXHgA7Yvsc2ikxD19VbNFprTsdStiyFfEW/mMBrqynKgZ
         /MQlf3tefU1IjF4EErrxHkjBiojIFdvqx0Wi4p1cgZrGHTra4jtUq1J6vuUWTVcK6Az8
         4fCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgmY/bq5WADl2wSclx81HU3mqmUZ2s6wpM2K8ozYh/I=;
        b=PmwMRRRsrSCwdr51bnudf3oyGEKG/WvLN8EGJZCf87WfE6bKSqpNECVQKcWFJRb+EH
         jx6FkN23s0bleBFgIVHKr9x0qWKS5uAc4sR/LOnTta5oXUGekKOfKrChSVeSgAVm6vOX
         D0s5Jyh3QQ6gJ3MbsXbpFtAiLVwygcKiGGeLeSVL+AAjLR/Fi4XNetEf2X1tg/A7YNfN
         BNfi7wdYWtjHRaauvbQnB49SgaahChh1UHTVK6XjfJv8LBgzUEXe2p7i7KnWoelUjGOK
         JFmGx3TUrcllZU85IIjXyWzV1Lx8cD8gsxssdr0VV/UyWGUykNoTWZV+Pgpxt8W5kK7c
         dIkA==
X-Gm-Message-State: AOAM530jtYhAoe1LWDKkBk0ucZGiI9BLARH1+pUQB1ptnFSJc7nYK0d9
        LToVUODj55Ez2ExG9gC3UdOUiy3gXYaapws181ytRWDNq3s=
X-Google-Smtp-Source: ABdhPJys2YF54jyVQf4tf4V70Bc9TNuyAA2nv2hmqW+kJgty7KpaY2znKEl/u7pwsvwCS082rBUbvAPgJZqdo/+5+Fk=
X-Received: by 2002:a25:ca45:: with SMTP id a66mr7951696ybg.164.1592497538900;
 Thu, 18 Jun 2020 09:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com> <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl> <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
 <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
In-Reply-To: <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Thu, 18 Jun 2020 09:25:27 -0700
Message-ID: <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 3:05 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 18/06/2020 10:59, Jeff Chase wrote:
> > Hi Hans,
> >
> > We are using two of these in an Intel-based Chromebox. I see that the
> > cros-ec and seco drivers just statically define the PCI BDF of the
> > Intel graphics device for their boards. I don't see an example of ACPI
> > passing this information. I can copy cros-ec and seco by adding a
> > board table and then use the UID of each device to select the correct
> > port. Adding board-specific configuration to the driver doesn't seem
> > ideal but I'm not sure what the proper way to pass this using ACPI is.
>
> You are right, it's not ACPI, it's using DMI matching.
>
> I have zero knowledge about ACPI, so I have no idea if there is some standard
> method of retrieving this association via ACPI.

I'm not very familiar with ACPI either. I looked for but did not find
an ACPI equivalent of_get_mac_address().

I believe it's possible to reference the PCI node but it would take a
bit of work on both the coreboot and linux side.

>
> This particular chip can actually be used both with DMI matching but also
> on an ARM with device tree, but since you can't test this on an ARM board,
> there is no point in adding support for that.
>
> However, compared to the cros-ec and seco drivers you can do something a bit
> different here: those drivers just return -ENODEV if there is no match, but
> since this driver reads the EDID it can just continue as long as it does not
> set the CEC_CAP_CONNECTOR_INFO capability.

Is it necessary to add support if we don't set CEC_CAP_CONNECTOR_INFO?

Thanks,
Jeff
