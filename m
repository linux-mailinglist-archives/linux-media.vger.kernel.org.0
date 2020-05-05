Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AB21C647B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 01:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbgEEX0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 19:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728642AbgEEX0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 19:26:16 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EC4C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 16:26:16 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id d197so3016ybh.6
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 16:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dSNUOaj5KxlkmD3E6We3JZzhQHqRCx3I4wcT9gUGuhg=;
        b=MQyPrHImzLs/VQfBJV923ppx7fQWNvo0uqdxIdrZDaFeE6/xsKpn1noL2Ke51fqI7+
         3t5sbTe6qX4wp2AcvVt3jgCB/KDPBHj2c4YQgmN4AHEcsjwY/P865XqvLIt9fNxMfl+S
         eD/qipQkbesQ7vYbA0IurM6pfOgqPb1vBO97mkv7Yhf2NiFgTjIgDJQTgEFTBxZrt8og
         4LzaA9jPda8IzrCaN9HXotXumGTYXpS++DxyEokv7hyUi2em5AKqQztF6EtcTSafZqg4
         OP4bX1uLqV2FnlBG9Dzx5NOA3ufeNdD8UCNF61lczzJ0V4FFtk7Ykn5/G2noFvFTPhGU
         Lxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dSNUOaj5KxlkmD3E6We3JZzhQHqRCx3I4wcT9gUGuhg=;
        b=nmzAW/sin8dF1CmmnqZtOzNtpemcymXF2KMmurLB3CDExkvAIUEWDkcMOvLxWJsASR
         qb8unTVse2nH1b5MVRTvHdTS5cx6YGKeYnmgXqIBXkdlrbNMF3cUGFGfWPtHb3EC78AL
         soj218df3UWZUjog0OhmmV/8NSzWiiHKUbaXu2DGFKO6RFTSqSaRuTaNCr2jfLQuECl0
         LD6n6vJdPCM8heMPiz9FEOl1Va5QxI23fZ7fb8HjoWMXJVo9nnfKPmSDma20uB0bEgUI
         n9AUfxUULIdA7T4nqKBd+uCnJpixWwZ306suBQnw9KdfeO/TLL5tz+zB5zkZrLC9CxV/
         2MtQ==
X-Gm-Message-State: AGi0PuadC66h23L1fhsDae/AZPZCQCwXjVo8RRsrUpjyqrbiBokTN+bP
        nML3PFLZY3GBWXV28zPtUHrQTqhVHfZ2ank/KV0tnA==
X-Google-Smtp-Source: APiQypKKDQU2Sw118oCoUpMcYow1NLSmmvRnupnXJQZ/a9ro8u95AnjtEu8uifc2boNhNYZe/1BXwzxYTQKsis2AMhs=
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr9039706ybg.34.1588721175380;
 Tue, 05 May 2020 16:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200424053819.220276-1-jnchase@google.com> <20200424053819.220276-2-jnchase@google.com>
 <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl> <CALTkaQ2dnWdkAsqYXF+msN+Jnz_1RuvbQtJd4PFwVT_Q7FTc5Q@mail.gmail.com>
 <290277ee-f1a1-db02-9885-d4193a40e8f8@xs4all.nl>
In-Reply-To: <290277ee-f1a1-db02-9885-d4193a40e8f8@xs4all.nl>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 5 May 2020 19:26:04 -0400
Message-ID: <CALTkaQ0tp91FJJbrzj3=+qP5z4myuUyOA9fO0L-V4CMG6Qc=nA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 25, 2020 at 5:16 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 24/04/2020 21:33, Jeff Chase wrote:
> > Hi Hans,
> >
> > Thank you for the quick review.
> >
> >> Is the register documentation available somewhere? I only found the product brief.
> >
> > No, it's not publicly available.
> >
> >> The chip can only detect OK vs NACK? There are no error states for Arbitration Lost
> >> or Low Drive conditions? Just checking, not all hardware has support for that.
> >
> > Correct, message transmit completion just has a one-bit status.
> >
> >>> +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
> >>> +{
> >>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> >>> +
> >>> +     dev_dbg(&ch7322->i2c->dev, "cec log addr: %x\n", log_addr);
> >>> +
> >>> +     return 0;
> >>
> >> This can't be right. I expect that logical addresses are set/cleared here,
> >> because the device needs to know that so that it can ignore messages not
> >> intended for it.
> >
> > As far as I can tell the device doesn't filter based on logical
> > address. I'll have to save
> > the logical address to the driver and filter manually.
>
> That can't be right. If this CEC adapter is assigned logical address 4, and
> it has to Ack any received messages from other CEC devices with destination 4,
> and ignore (i.e. not explicitly Ack) messages with other destinations.
>
> If the CEC adapter wouldn't know what LA to use, then it would have to Ack
> all messages, regardless of the destination, which would make this a complete
> mess.
>
> There must be a register that tells the CEC adapter which logical address(es)
> should be Acked. It's usually a bitmask (one bit for each possible LA) or the
> LA itself is stored.

Sorry, you're right, of course. The register isn't in the
documentation I have but I found it referenced in some sample code. By
default it seems the device automatically stores the logical address
if it recognizes a polling message (with src == dst) that was not
ack'd. The behavior can be configured to allow explicit logical
address assignment instead. I assume that would be preferred?

Thanks,
Jeff


>
> It might be that you still receive all messages (in which case monitor_all
> is effectively always enabled), but it really needs to be told which LAs should
> be Acked.
>
> Regards,
>
>         Hans
>
> >
> >>> +}
> >>> +
> >>> +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> >>> +                                  u32 signal_free_time, struct cec_msg *msg)
> >>> +{
> >>
> >> Does the hardware correctly handle Signal Free Time? If this isn't handled right
> >> then one CEC device can flood the CEC bus, preventing anyone else from using it.
> >>
> >> In some devices it has to be programmed, in others it is hardwired.
> >
> > It must be hardwired -- I don't see a way to program it.
> >
> >>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
> >>> +     int ret;
> >>> +
> >>> +     dev_dbg(&ch7322->i2c->dev, "cec transmit: %x->%x: %x\n",
> >>> +             cec_msg_initiator(msg), cec_msg_destination(msg),
> >>> +             cec_msg_opcode(msg));
> >>> +
> >>> +     mutex_lock(&ch7322->mutex);
> >>> +     ret = ch7322_send_message(ch7322, msg);
> >>> +     mutex_unlock(&ch7322->mutex);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static const struct cec_adap_ops ch7322_cec_adap_ops = {
> >>> +     .adap_enable = ch7322_cec_adap_enable,
> >>> +     .adap_log_addr = ch7322_cec_adap_log_addr,
> >>> +     .adap_transmit = ch7322_cec_adap_transmit,
> >>
> >> If the HW supports CEC monitoring (aka snooping), then I recommend that
> >> adap_monitor_all_enable is also implemented. It's very useful for debugging
> >> CEC in userspace. Not all HW supports it, though.
> >
> > Okay, I'll add this along with the logical address filtering I mentioned above.
> >
> > Thanks,
> > Jeff
> >
>
