Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC1C1FF973
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 18:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731993AbgFRQk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 12:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731986AbgFRQkz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 12:40:55 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B33AC06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 09:40:55 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id 187so3445887ybq.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7KVQ+UY06ZBMaDAtYXVJAVmpCw0fwlhszKzSBWWFLFc=;
        b=KPP8oQEMR0zmgeqRoIRxLLqc4LjPvp4A2buPF+6AzYBT6ZLviWiyOdgA4oRMq7R2Kr
         oBT6IB95hu2XLPt2DJO2v5TxLUEqTW1WLnRh18lbDrCNPj4/shFDlTPi21I5/AkSmona
         aDiz9ROMu4+RPdr54NfaIfgvdsfsSqv0sy98Z7F5dxDT9qnsKjULZ42glV+6hrBKAO4p
         0uQbmw9A4N1bHhGBCSQCoF3Au0xcGrHV1XKP45kSzYbmMYyIroh0SIDoQN41v/y4mxG3
         VWlKneP+2DAFA01lQoquF3JAdT8ifIO2fPngK8lI/S+imS6ZFI9qM7ZGeP0/al3vTonB
         vmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7KVQ+UY06ZBMaDAtYXVJAVmpCw0fwlhszKzSBWWFLFc=;
        b=HwwBkjYnuVlAgVkjKCHfqexFmcKpbxuyu3wX1nquyHlRYneSPPw+XcK6IZzy23/9iJ
         9CyUYu9t4hfwWyZwaLVo0FyVuls7yqZ86wX5px+O7ipoZ8vDpAmR0HtQCLRWE/8R09vX
         fPJYuozmL3NEEr/4+zWYQYYtlW7Em7zQM9ieQxsILih9P96POoxwsZhC0qXYgfOVQ6LI
         IP7heXFlvc0Iy+umeGObgPMbumMJZmQXlUMUbhV0f/8SaT5eSvSjpE3z1jxk5LpxDuCI
         h1IuTB6vi6iYpcDhRlc5hoqzAAWc1za6BxrURXGpV9DQrihCYc5GWRF+96TmLiSGZFdk
         9WNg==
X-Gm-Message-State: AOAM530wpn4LQPv3jRmWBWkuGYwNP/+sYHoj5OhJXxEWDEMW8LMRXFuy
        cwT3cUMJmwntY9zBBTtYR9rIkFTc++l5mAvAGWT65w==
X-Google-Smtp-Source: ABdhPJwU2OUvoaFnPo99OM4W4yl4Cv19fD5DpP0a+qTwglpEIChQQFrzhaGrlYY0oSs26GAJ5m42viwQMpme+SWK8IE=
X-Received: by 2002:a25:10d4:: with SMTP id 203mr8154404ybq.250.1592498454333;
 Thu, 18 Jun 2020 09:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com> <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl> <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
 <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl> <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
 <72ea0f61-5fd4-47b6-4b0f-db620ee661db@xs4all.nl>
In-Reply-To: <72ea0f61-5fd4-47b6-4b0f-db620ee661db@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Thu, 18 Jun 2020 09:40:43 -0700
Message-ID: <CALTkaQ0SFiX1rNkz5WOGCs=ZttYG9utKntsRyQKB-aWzDj-Cvw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 9:33 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 18/06/2020 18:25, Jeff Chase wrote:
> > On Thu, Jun 18, 2020 at 3:05 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 18/06/2020 10:59, Jeff Chase wrote:
> >>> Hi Hans,
> >>>
> >>> We are using two of these in an Intel-based Chromebox. I see that the
> >>> cros-ec and seco drivers just statically define the PCI BDF of the
> >>> Intel graphics device for their boards. I don't see an example of ACPI
> >>> passing this information. I can copy cros-ec and seco by adding a
> >>> board table and then use the UID of each device to select the correct
> >>> port. Adding board-specific configuration to the driver doesn't seem
> >>> ideal but I'm not sure what the proper way to pass this using ACPI is.
> >>
> >> You are right, it's not ACPI, it's using DMI matching.
> >>
> >> I have zero knowledge about ACPI, so I have no idea if there is some standard
> >> method of retrieving this association via ACPI.
> >
> > I'm not very familiar with ACPI either. I looked for but did not find
> > an ACPI equivalent of_get_mac_address().
> >
> > I believe it's possible to reference the PCI node but it would take a
> > bit of work on both the coreboot and linux side.
> >
> >>
> >> This particular chip can actually be used both with DMI matching but also
> >> on an ARM with device tree, but since you can't test this on an ARM board,
> >> there is no point in adding support for that.
> >>
> >> However, compared to the cros-ec and seco drivers you can do something a bit
> >> different here: those drivers just return -ENODEV if there is no match, but
> >> since this driver reads the EDID it can just continue as long as it does not
> >> set the CEC_CAP_CONNECTOR_INFO capability.
> >
> > Is it necessary to add support if we don't set CEC_CAP_CONNECTOR_INFO?
>
> It is very desirable. Otherwise userspace will not know which CEC device is associated
> with which HDMI device. Since you are using two of these chips for a Chromebox, I
> suspect that you actually need to support this.
>
> Also, I am (slowly) working on wiring support for this in all CEC transmitter drivers,
> so I prefer not to add CEC drivers without support for this.

Okay, understood. I'll look into using DMI matching.

Thanks,
Jeff

>
> I really should have noticed much earlier that support for this was missing. My
> apologies for that.
>
> Regards,
>
>         Hans
