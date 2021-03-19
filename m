Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392E1342833
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 22:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhCSVvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 17:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhCSVve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 17:51:34 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EABC06175F
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 14:51:34 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id k8so7634023iop.12
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DKTlH/HZmNj6dLL/nLiH92MVCB+96dq5rHSrJPS3hsI=;
        b=N047SIaWQi2axlUlWQDPDILhuf+euN7GVAcjciVlMzMfbAc05FE3lM2PwVOgMwXXTK
         UJdtFz/s784jH/47aArgIFJnVRj3jcgV3gjw3HtGnstbK/LwQishXIM6M2YTSuNooNAB
         Lp8HLLQc8NwkfdRH/GLOBY1B71cKu6apaRPtfww/sEVSz8Pldx2uXk+4uQWFS67mI5vv
         gntSO7+b0Xf/DmM8S9HKsL7h0hGQF6D6NMSTpH4ntjdTX8wq0Nhn9ZAk5zLUFVANqtL4
         02/PoUNsLy6jkoDQRilrs3CGam4haFdw+5IGsetWd/FrAR/MKkwTeHEaWj0Fm4k/H33G
         6BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKTlH/HZmNj6dLL/nLiH92MVCB+96dq5rHSrJPS3hsI=;
        b=LlpZ9Qijh/rEnmgRexDxeb9tsJuDV8C3ekLyd8YojWkzBFqD75jHpxpM5I8akE9NQV
         20fihymq5sRbwd5Na5UooH8wR+0aPKRqkKg/9bJPfOLU77DfnmaN9wWlfTSRFMSHvQqk
         CFLU8Sj00TjbPYXPA0ecztWd5lyZfS5XzYBipIehpZ0s9aNQvk+Fax6VNRYvlVL90He8
         ukVzJNZNMp40J44oEy6bKIIS/TaA7apujuF9CiSJVsDtS3UiC4Xia2MAEy3v7cBc0omu
         Mzl41rxlNRu8Qg4ZrNWL+KpB65V2b6dQBakoS6f1hnT8BwDLz00p8rDKXxVX3+TeCglE
         KDew==
X-Gm-Message-State: AOAM531SOm06wkSdvQd4Ui0XhrYp7VrFi+dPtjbNA9gH51mPclgX+mOz
        dMgAfskX9/SXANGS2If5kwjNzXZJ+4XYwo7i0V3AkddbhT9Oyw==
X-Google-Smtp-Source: ABdhPJy49D1PBBNq56HEgr5l3UkglPuRZCEOiYjA+IpYODVkgihr+eyho7oS9L+73i4jS+k0RTMUaVtlbtMLX/vj5Ds=
X-Received: by 2002:a5d:9386:: with SMTP id c6mr4080459iol.203.1616190693184;
 Fri, 19 Mar 2021 14:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMbLOeCCwrfoGvaV4vWPfF7tHnE-b4sFUNmK8v=ekRZAtjA-4w@mail.gmail.com>
 <20210318094836.GA31678@gofer.mess.org>
In-Reply-To: <20210318094836.GA31678@gofer.mess.org>
From:   Nikolaos Beredimas <beredim@gmail.com>
Date:   Fri, 19 Mar 2021 23:50:53 +0200
Message-ID: <CAMbLOeAP0CDezNkgSo0afiDU9iSrtEMhi+eq9cthamOa4NXpKw@mail.gmail.com>
Subject: Re: Revisiting ITE8708 on ASUS PN50 uses a 16 byte io region
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for your response Sean

On Thu, Mar 18, 2021 at 11:48 AM Sean Young <sean@mess.org> wrote:
>
> Hi Nikolaos,
>
> On Wed, Mar 17, 2021 at 04:41:15PM +0200, Nikolaos Beredimas wrote:
> > Hi,
> > There was a thread on this list last September
> > https://www.spinics.net/lists/linux-media/msg177724.html
> > about the IR module on the ASUS PN50.
> >
> > Even though that discussion never fully resolved,
> > it did contain the solution to get the IR working on the PN50.
> > I have documented this at
> > https://forum.libreelec.tv/thread/23145-asus-pn50-challenge/?postID=152207#post152207
> >
> > So, what I had to do is edit a single line of drivers/media/rc/ite-cir.h
> > and change IT8708_IOREG_LENGTH 0x08 to IT8708_IOREG_LENGTH 0x10
> > and the IR module is now recognized and working
> >
> > How do I go about submitting this as a patch?
> > I am a little overwhelmed honestly.
> > Do I follow https://www.linuxtv.org/wiki/index.php/Development:_How_to_submit_patches
> > ?
> > And which git tree?
>
> Thanks for fixing this. The patch should be a diff against
> https://git.linuxtv.org/media_tree.git/
>
> This is the guide for submitting patches:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>
>
> >
> > --- a/drivers/media/rc/ite-cir.h
> > +++ b/drivers/media/rc/ite-cir.h
> > @@ -406,7 +406,7 @@
> >  #define IT8708_C0WCR 0x06 /* wakeup code read/write register */
> >  #define IT8708_C0WPS 0x07 /* wakeup power control/status register */
> >
> > -#define IT8708_IOREG_LENGTH 0x08 /* length of register file */
> > +#define IT8708_IOREG_LENGTH 0x10 /* length of register file */
>
> I don't think this is correct though. There are other devices that have
> length of 8; I think the correct solution.
>
> I think:
>
>         if (!pnp_port_valid(pdev, io_rsrc_no) ||
>             pnp_port_len(pdev, io_rsrc_no) != dev_desc->io_region_size) {
>                 dev_err(&pdev->dev, "IR PNP Port not valid!\n");
>                 goto exit_free_dev_rdev;
>         }
>
>
> should be changed to:
>
>         if (!pnp_port_valid(pdev, io_rsrc_no) ||
>             pnp_port_len(pdev, io_rsrc_no) < dev_desc->io_region_size) {
>                 dev_err(&pdev->dev, "IR PNP Port not valid!\n");
>                 goto exit_free_dev_rdev;
>         }
>
> Thanks
>

Indeed. This was also pointed to me by another user at the LibreELEC forum where
I documented my initial "fix" (which although fixed the problem for my
specific hw,
would probably bork every other ITE8708 in existence).
I have implemented the proper fix per your suggestion, and have tested
it against
kernel version 5.10.21 which is the one used by the latest LibreELEC beta.
I think I have reached the limit of my abilities here.
Following is my first attempt at submitting this as a patch,
against the master branch of git://linuxtv.org/media_tree.git
NB
---------------

Accept larger io_region_size for ITE8708 in ite-cir.c
ITE8708 on ASUS PN50 uses a 16 byte io region. This issue was
first identified by Michael Zimmermann in
https://www.spinics.net/lists/linux-media/msg177724.html
and prevents the driver from loading on the ASUS PN50, throwing
the 'IR PNP Port not valid!' error.
Current understanding is that the issue lies on erroneous DSDT
ACPI tables on ASUS part, that advertise the register length as
16 bytes, and not 8 bytes as defined in ite-cir.h
(IT8708_IOREG_LENGTH).
In any case, this patch changes the strict not-equal check in the
ite_probe function to a less-than check, allowing the driver
to load despite the fact that the DSDT claims a larger register.

Signed-off-by: Nikolaos Beredimas <beredim@gmail.com>
---
 drivers/media/rc/ite-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 9388774df9d7..5bc23e8c6d91 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1333,7 +1333,7 @@ static int ite_probe(struct pnp_dev *pdev, const
struct pnp_device_id

/* validate pnp resources */
if (!pnp_port_valid(pdev, io_rsrc_no) ||
-     pnp_port_len(pdev, io_rsrc_no) != dev_desc->io_region_size) {
+     pnp_port_len(pdev, io_rsrc_no) < dev_desc->io_region_size) {
dev_err(&pdev->dev, "IR PNP Port not valid!\n");
goto exit_free_dev_rdev;
}
--
