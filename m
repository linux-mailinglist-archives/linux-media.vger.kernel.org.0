Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF7C20218E
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 06:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgFTE4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 00:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgFTE4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 00:56:55 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6795C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 21:56:53 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id b15so6036402ybg.12
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 21:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=njifydMtEuMxZtctLxGXRWRJtps1Ov+j22zol3btDD0=;
        b=So2kKRDTrCYHvbYY1Y/Nkceijcp8dLKnVbwrAYvQ/PZkklJNGZCPcLECBTkPaQYbjI
         mewmD+fOCnA9K4G0IBec/1eEl2y+NoFHvsm3EgY5cZg4Mbe4zLqCRteWUM67y3Vy3eFA
         QlJf7uEr+k+EBrSvHep5fZPwxzeOBbpY+mmWu18DVP5veUfJMIONlXoFet2NlrJnDIwB
         GCk+jz3dykEbc3K6jAq8W3XlAJxz2dkfj6IYMO3UO3Ns7JlBcwIt55zU/OhiMcp9TK0G
         wUbM3gbonVb+6j8X3GGDWJHAxiODSPMSZKqP78zQv8GREBww3YWZgPX23GDNqZbZ4Lfr
         fn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=njifydMtEuMxZtctLxGXRWRJtps1Ov+j22zol3btDD0=;
        b=XbIL7xBMsKkS+jYH5O1lm+6wpbg5y5rdwuU6E2yUw0paNczSy/tztvfCcZaMKNrmM5
         bZEB9wAYOG3kexhENfYhKwel/NgQrAA7hiSUPTKb4tsl4LIIVicsE6vxyOJNBWjFvmSJ
         FogpGQY4ePs4sUu6rfpTxuGz7oVEq7WJaHFdwCuD+E6mlB/3NXMfGNjRSLoQzKSnJUpL
         q7twehS+PfP8CvXRGQ+bkV7vWW3DRI5Ek05Tz49TAOBBMJgmxvlCPU53MrSBh/sq/3rH
         FzfdJELTZmEbOo0H2XHwgAEl3H+Co5ndgi7NePKQp65DQH4dSi2YHWb5lLa4lUC+SzcD
         G1dw==
X-Gm-Message-State: AOAM532Gf4nCaKAeo+RW4w6+aumLgNT8irDiI7ZZwvFFXBUfwtDXw337
        qxXrcorDevjOoOanqMG3F6ZHWrFfAKkSMjy2ewD5LTZlhO0=
X-Google-Smtp-Source: ABdhPJwZ65JjxEyiCk/0vIPouumrQgtyJKAobdy+mgxxfzcnBORgzfhH/Z+BkEAiUXYQwKbPvt1aunmwiMC+4gE06T0=
X-Received: by 2002:a5b:108:: with SMTP id 8mr11067270ybx.285.1592629011969;
 Fri, 19 Jun 2020 21:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com> <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl> <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
 <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl> <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
 <72ea0f61-5fd4-47b6-4b0f-db620ee661db@xs4all.nl> <CALTkaQ0SFiX1rNkz5WOGCs=ZttYG9utKntsRyQKB-aWzDj-Cvw@mail.gmail.com>
In-Reply-To: <CALTkaQ0SFiX1rNkz5WOGCs=ZttYG9utKntsRyQKB-aWzDj-Cvw@mail.gmail.com>
From:   Jeff Chase <jnchase@google.com>
Date:   Fri, 19 Jun 2020 21:56:40 -0700
Message-ID: <CALTkaQ23yCWbTSaSAfM_63_nhKBTf-n8vr-EQoU=SehAfg6RaQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > >> This particular chip can actually be used both with DMI matching but also
> > >> on an ARM with device tree, but since you can't test this on an ARM board,
> > >> there is no point in adding support for that.
> > >>
> > >> However, compared to the cros-ec and seco drivers you can do something a bit
> > >> different here: those drivers just return -ENODEV if there is no match, but
> > >> since this driver reads the EDID it can just continue as long as it does not
> > >> set the CEC_CAP_CONNECTOR_INFO capability.

Hi Hans,

After looking into this I don't think I want to actually register the
cec adapter with the hdmi port's cec notifier because then it will
start receiving physical address updates from the port. Since the
driver already updates the physical address itself it seems like that
would cause some issues.

I'm looking at just adding the connector to the adapter directly using
`cec_s_conn_info()`. But it doesn't look like I can get the conn_info
without registering with the notifier. Do you have any thoughts here
before I try tackling changes to the cec framework?

Thanks,
Jeff
