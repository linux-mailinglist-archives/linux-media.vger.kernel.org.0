Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13AA8AE14F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 01:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbfIIXAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 19:00:40 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43660 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfIIXAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 19:00:40 -0400
Received: by mail-io1-f66.google.com with SMTP id r8so8035146iol.10;
        Mon, 09 Sep 2019 16:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jZ0CxXKKRSMIVhulRY/LrdyN0Mz2dv9hIkZJA2zVyA4=;
        b=BXlqN0nb7CgtNFmpukaK+ZjX8twylN31bZG8XHiLPs54wqhxw3eJFRorm6HAkDxywO
         ZnO5MOYQNS1DP3xMjX9fcoHh/u8Xdn0ciMbKiR8tZU8Y0Qbp7jywhOE58YrqjwuR/wB/
         M/L0PMfVWztCWCfNBX1LPUL29h1gYBlUZY7k4Bos7MSTtE8C9QHpHqCLmMYesKnNpPkw
         7lAczT1Mhm6WvTDBiQ+XpTeRXdzgfbS3YETUs9PNAra8W6rU4h4r01uJnQOckCq2bjl1
         xYNj8zDSBOGEh7xy2VEmJxO4Hx+wG9KunfwTkEAJazoarx9vVxzJnlsYL6d8fBITZHSB
         iydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZ0CxXKKRSMIVhulRY/LrdyN0Mz2dv9hIkZJA2zVyA4=;
        b=GwInGQsPz1+H0CR3Z9srq58lFekD9W4Xrd0k82eWB8oLM9VBUsF+dBsI6z1bojjsTB
         OI+UfR3Us//pdBkbyM/9rSEDHlyv3UCYocW6FFNU7N2c2QixrrnHHLvWHr7QBJZ3XjM4
         v/ai8sM9+hlkFFUR4EiUOXAag3NpR1PojUkzTJIyzHR4GaznkVvP1Tcz8RWFHVPiyE/s
         7i1sCfwdQWrN2Q7p6FAYJKKeCDvLzkHUI4aSkdegGWipxKOcPYgKtg2GHzZ5m7JT+Zr/
         CFgIarPsS1WflEXT6sqpcIDKZoM4iRUpBXu8foUDhDy1NJx1A4Lbw5t/KiCVqwrkEzAL
         CY9g==
X-Gm-Message-State: APjAAAUuon7t/jZmC5HSDMiQ6lPMjzqR0k8jrvIkEp9UJnoXvV2cLBke
        a/VCMfMhaf2e8xLZ2U9alyHt6svgrfmsEPgHJK0=
X-Google-Smtp-Source: APXvYqz5tkoILqOQfxq57H0P9tkxTC4goh/x89GWft5Ac8gJdidd31xRroqiBoQR1/ne+PiqKrF5ml3SwPNBcKg8TWk=
X-Received: by 2002:a6b:c895:: with SMTP id y143mr27207977iof.271.1568070038089;
 Mon, 09 Sep 2019 16:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190901211139.2405-1-lucmaga@gmail.com> <1fea2f25-98d1-f9f6-a483-17c74f89452e@xs4all.nl>
In-Reply-To: <1fea2f25-98d1-f9f6-a483-17c74f89452e@xs4all.nl>
From:   =?UTF-8?Q?Lucas_Magalh=C3=A3es?= <lucmaga@gmail.com>
Date:   Mon, 9 Sep 2019 20:00:26 -0300
Message-ID: <CAK0xOaGZx5dyDMAFp+JxnrfOYH3yYdvtcJzWdAmHyeRwUe38Lg@mail.gmail.com>
Subject: Re: [PATCH] media: vimc: fla: Add virtual flash subdevice
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Helen Koike <helen.koike@collabora.com>, edusbarretto@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
Thanks for the review. I fixed most of the issues you found. Just have
the question below.

On Mon, Sep 2, 2019 at 9:04 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> > +
> > +int vimc_fla_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
> > +{
> > +     struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> > +     struct vimc_fla_device *vfla;
> > +     int ret;
> > +
> > +     /* Allocate the vfla struct */
> > +     vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
> > +     if (!vfla)
> > +             return -ENOMEM;
> > +
> > +     v4l2_ctrl_handler_init(&vfla->hdl, 4);
> > +
> > +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                            V4L2_CID_FLASH_LED_MODE,
> > +                            V4L2_FLASH_LED_MODE_TORCH, ~0x7,
> > +                            V4L2_FLASH_LED_MODE_NONE);
> > +     v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                            V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
> > +                            V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_TIMEOUT, 1, 10, 1, 10);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
> > +     v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> > +                       V4L2_CID_FLASH_STROBE_STATUS, 0, 0, 0, 0);
>
> It would be nice if this would actually reflect the actual strobe status.
>
Regarding the strobe status I was reading the code and find out that
V4L2_CID_FLASH_STROBE_STATUS is a V4L2_CTRL_FLAG_READ_ONLY
but it's not a V4L2_CTRL_FLAG_VOLATILE. I found this intriguing. How an
I suppose to get it if its not volatile? As I understood it changes over time
if the strobe starts and the timeout expire, isn't it? Shouldn't it be volatile
if so?

I've already made a simple implementation were V4L2_CID_FLASH_STROBE_STATUS
returns after calling V4L2_CID_FLASH_STROBE and becomes false after the timeout
time passes.

Thanks!
