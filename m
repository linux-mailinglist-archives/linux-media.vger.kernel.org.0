Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015821B7F0A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 21:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgDXTdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 15:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729256AbgDXTdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 15:33:53 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CCCC09B049
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 12:33:53 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id 19so11578476ioz.10
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 12:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HNuMYxfjwGPC+1jTTYtTMM55VcfYeYfWrdW1KEr8xRY=;
        b=VvM7nsGUt7pp9ndkQZB8KkXo4k0KWv2pzPtzuuMU2pMNneU8cftEBccuLo2PcczwAN
         BgFebrKixBIKF/VtqFhOrRl9liwOrp2UTNpkHW0QOncfySrbhkYYKaxtCOcADwUeriVu
         UAS5HUc/0WMI9yAEBUBbDx6qZMeA7iYAiQJLxjHJ+Tv0s9iCSkS3DZCGGthZNDCmzA0c
         Q2XGb6dIW3ZqfW47wRXhqMw+ZkzG33eyRAC/GulqqeGnijMSIbCWnlz8k98noCEuWSmN
         eNOLku6bswd4Pkj8wgXeOXyQ7VbaMUVNORfn03bhCGcKMOR/RoqYdMhPGJx53cC7s2xv
         9EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HNuMYxfjwGPC+1jTTYtTMM55VcfYeYfWrdW1KEr8xRY=;
        b=bxjNuKOTXPFnKHM49GNhrXC0SDFmuhF8b1FA5EU8+1N9sxlyeSYY9/LOKACNRvoa72
         x0KWtFrVVCHPbqtGS1sfvJ4+lYWtZ88rte3fOYLwLtquOjOb29vk+x3DzXnsSatA5j9p
         V62qr4LTk6Eb2H7eO1Dg6AEK/wuXxiruxPIPbIGIZHHx631IR1fG8cSItAD6kvOB8GRH
         0WGmDFZt4VyJAo1WAcNgP/lSui5GLvB27cyDOHiN1CmIREoBNcSrq7jujGhWCpxzcpGZ
         caHC2x83E5zy8xxedKS+esIKJQK73wu18oTu85ocxU3BuzUrGu/7XvITUQNt/Qspanfv
         n/dw==
X-Gm-Message-State: AGi0PuYCv6d9QVdlEVjOAy4nGB4VREJUwOrWiUQ1+id7XRMXxdIDZvlS
        0+Ls/ZgZAQm6FMDq9e3+jFwyh5pTGwd83RMtw4ydWQ==
X-Google-Smtp-Source: APiQypK+tAyZdsSD4T9QkiAxKF5gM5wpe2bXg3S0jvmEFZRNhjynTDdgGezVLreV/JA3xXv/0XyHMUb0QhD/L7v4ecY=
X-Received: by 2002:a02:ccf4:: with SMTP id l20mr7418563jaq.28.1587756832473;
 Fri, 24 Apr 2020 12:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200424053819.220276-1-jnchase@google.com> <20200424053819.220276-2-jnchase@google.com>
 <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl>
In-Reply-To: <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Fri, 24 Apr 2020 15:33:41 -0400
Message-ID: <CALTkaQ2dnWdkAsqYXF+msN+Jnz_1RuvbQtJd4PFwVT_Q7FTc5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the quick review.

> Is the register documentation available somewhere? I only found the product brief.

No, it's not publicly available.

> The chip can only detect OK vs NACK? There are no error states for Arbitration Lost
> or Low Drive conditions? Just checking, not all hardware has support for that.

Correct, message transmit completion just has a one-bit status.

> > +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
> > +{
> > +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> > +
> > +     dev_dbg(&ch7322->i2c->dev, "cec log addr: %x\n", log_addr);
> > +
> > +     return 0;
>
> This can't be right. I expect that logical addresses are set/cleared here,
> because the device needs to know that so that it can ignore messages not
> intended for it.

As far as I can tell the device doesn't filter based on logical
address. I'll have to save
the logical address to the driver and filter manually.

> > +}
> > +
> > +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> > +                                  u32 signal_free_time, struct cec_msg *msg)
> > +{
>
> Does the hardware correctly handle Signal Free Time? If this isn't handled right
> then one CEC device can flood the CEC bus, preventing anyone else from using it.
>
> In some devices it has to be programmed, in others it is hardwired.

It must be hardwired -- I don't see a way to program it.

> > +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> > +     int ret;
> > +
> > +     dev_dbg(&ch7322->i2c->dev, "cec transmit: %x->%x: %x\n",
> > +             cec_msg_initiator(msg), cec_msg_destination(msg),
> > +             cec_msg_opcode(msg));
> > +
> > +     mutex_lock(&ch7322->mutex);
> > +     ret = ch7322_send_message(ch7322, msg);
> > +     mutex_unlock(&ch7322->mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct cec_adap_ops ch7322_cec_adap_ops = {
> > +     .adap_enable = ch7322_cec_adap_enable,
> > +     .adap_log_addr = ch7322_cec_adap_log_addr,
> > +     .adap_transmit = ch7322_cec_adap_transmit,
>
> If the HW supports CEC monitoring (aka snooping), then I recommend that
> adap_monitor_all_enable is also implemented. It's very useful for debugging
> CEC in userspace. Not all HW supports it, though.

Okay, I'll add this along with the logical address filtering I mentioned above.

Thanks,
Jeff
