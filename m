Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9767E7314CF
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 12:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245715AbjFOKFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 06:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245755AbjFOKFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 06:05:18 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D552717
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:05:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9829b12b80fso105079566b.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686823514; x=1689415514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GcXc7oEkJIqfHQrM7DT44JanmFGkZij22S/C5m0f+u0=;
        b=Gx+ysIOs9WTPUhOOyHDPVq3CyE6EJXoBp5k3eQOHsONn4L7+jWCTgBAs+x6kC8D0g0
         Vx+HYXwEaXZKl7k6iE5Ehp9AbTIN/8ZeczSm/ZI9urnjdoNN+YKwHvSeZMA34wCVJXah
         jZwZOeq09M/e0/OhiiY8E5YWabd0RoRpUMjhPgI2fFPCucKSi0XQA2QJ27TARDc8wl+0
         +m/edF0I8m0zIqb1e9xTz7/3OWXC7+BXqltEeBaMH/lRXJqZBv8gNsumqdaA7p68zDha
         WlcyDX1ci+Xz49yNJ4gNEX70uo+ohvkuE3KYMr4AWX8TrXOqpU/YfNmxUvaxM/PK7Vpq
         Hbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686823514; x=1689415514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcXc7oEkJIqfHQrM7DT44JanmFGkZij22S/C5m0f+u0=;
        b=Bb67NS8WzlgKNFD62mYWQQMSGpEeUjloa12hB3Ubu3x/wiEPTcxCfh4geZyXpbYe6R
         rghJHsRjgCeLN4D/RdIuprTpFNzoIrambgemRfwxUuYM1Kbj/Hv2spzYVcYxM6vjaI1r
         yZ+IqAkoe8Xn2TGyvHqMaj4I8ZJ9GgK+nNgtBxxC3WAhpEaIJNhp0XZgCqer288PilwI
         qPFG2zOmkx7031EgvTDlNNXUNPfUHwSYWADcyrPpvHm8nT/Ml5hmSy0lP13hLmLIKDCi
         0w+ziRh1jG2widXNQrk8qophjI/g1/+Hl6LWKcKHwhHYFtDGbWRTj0r0I3MSLwF1NveA
         Y3EA==
X-Gm-Message-State: AC+VfDynzaFFXauSdQZU/Tq1Bv69PleYb8Ojx3lDFX9fHByoJUtsgZQF
        0hVN1Eq+pmh8qbK5WfYgvEZgD3wru/k=
X-Google-Smtp-Source: ACHHUZ552Y+uhUykmuMa4nDlJxR1Da62db2TsNnBGaqdo5w02t4CLG8KbwgzYHgA3FV0aQg3I7lrTA==
X-Received: by 2002:a17:907:745:b0:978:adad:fe18 with SMTP id xc5-20020a170907074500b00978adadfe18mr17604723ejb.21.1686823513811;
        Thu, 15 Jun 2023 03:05:13 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-242.cust.vodafonedsl.it. [2.39.142.242])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906491000b0095342bfb701sm9363484ejq.16.2023.06.15.03.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:05:13 -0700 (PDT)
Date:   Thu, 15 Jun 2023 12:05:11 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIriVxMVVxG2dsUO@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
 <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
 <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
 <20230615092100.GE741@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230615092100.GE741@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent, Sakari,

Can I cherry-pick this patch and use these new functions also
for cci regs of the alvium driver? Are on going to be merge?

Let me know.
Thanks! :)

Regards,
Tommaso

On Thu, Jun 15, 2023 at 12:21:00PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 15, 2023 at 11:11:20AM +0200, Hans de Goede wrote:
> > Hi Sakari,
> > 
> > On 6/14/23 23:48, Sakari Ailus wrote:
> > > Hi Laurent,
> > > 
> > > On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
> > >> Hello,
> > >>
> > >> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
> > >>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
> > >>>> The CSI2 specification specifies a standard method to access camera sensor
> > >>>> registers called "Camera Control Interface (CCI)".
> > >>>>
> > >>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
> > >>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> > >>>>
> > >>>> Currently a lot of Linux camera sensor drivers all have their own custom
> > >>>> helpers for this, often copy and pasted from other drivers.
> > >>>>
> > >>>> Add a set of generic helpers for this so that all sensor drivers can
> > >>>> switch to a single common implementation.
> > >>>>
> > >>>> These helpers take an extra optional "int *err" function parameter,
> > >>>> this can be used to chain a bunch of register accesses together with
> > >>>> only a single error check at the end, rather then needing to error
> > >>>> check each individual register access. The first failing call will
> > >>>> set the contents of err to a non 0 value and all other calls will
> > >>>> then become no-ops.
> > >>>>
> > >>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> > >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > >>>> ---
> > >>>> Changes in v2:
> > >>>> - Drop cci_reg_type enum
> > >>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
> > >>>>   8 bit width making reg-addresses without an encoded width default to
> > >>>>   a width of 8
> > >>>> - Add support for 64 bit wide registers
> > >>
> > >> I'm in two minds about this. This means that the read and write
> > >> functions take a u64 argument, which will be less efficient on 32-bit
> > >> platforms. I think it would be possible, with some macro magic, to
> > >> accept different argument sizes, but maybe that's a micro-optimization
> > >> that would actually result in worse code. 
> > >>
> > >> 64-bit support could be useful, but as far as I can tell, it's not used
> > >> in this series, so maybe we could leave this for later ?
> > > 
> > > I prefer to have it now, I just told Tommaso working on the Alvium driver
> > > to use this, and he needs 64-bit access. :-)
> > > 
> > > You could also easily have 32-bit and 64-bit variant of the functions, with
> > > C11 _Generic(). Introducing it now would be easier than later.
> > 
> > I took a quick look at C11 _Generic() and that looks at the type
> > of "things" so in this case it would look at type of the val argument.
> > 
> > Problem is that that can still be e.g. an int when doing a
> > read/write from a 64 bit registers.
> > 
> > So we would then need to handle the 64 bit width case in the 32
> > bit versions of the functions too.
> > 
> > And likewise I can see someone passing a long on a 64 bit
> > arch while doing a cci_write() to a non 64 bit register.
> > 
> > So this would basically mean copy and pasting cci_read()
> > + cci_write() 2x with the only difference being one
> > variant taking a 32 bit val argument and the other a
> > 64 bit val argument.
> > 
> > This seems like premature optimization to me.
> > 
> > As mentioned in my reply to Laurent if we want to
> > optimize things we really should look at avoiding
> > unnecessary i2c transfers, or packing multiple
> > writes into a single i2c transfer for writes to
> > subsequent registers. That is where significant
> > speedups can be made.
> 
> This is something I'd really like to see, but it's way more work.
> 
> There's an important need of applying changes atomically, which is often
> not possible to strictly guarantee over I2C. Userspace ends up writing
> V4L2 controls as quickly as it can after the start of a frame, hoping
> they will all reach the sensor before the end of the frame. Some
> platforms have camera-specific I2C controllers that have the ability to
> buffer I2C transfers and issue them based on a hardware trigger. How to
> fit this in thé kernel I2C API will be an interesting exercise.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
