Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2FE6054A1
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 02:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiJTA5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 20:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiJTA5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 20:57:40 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A973F160221
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 17:57:39 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id s30so27692470eds.1
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4L8xjPkB4zawT5RrZS1W3/mUloyyZ7wh8SmaEhaLHAQ=;
        b=cVbaJ/Z7XN5Q6coqhgbNJVpwcocq0igZh2OoRy3NM3DO370x0LTv/fq7gcqha9Q4G7
         g57MtYl0VWph8oXETb88kBDbIDZP31DYLKsz1ES9kW680rxnCKy/GKMxyEe/13/qZIPH
         KK+Rqgh96Eb/BqylALp+DswH7MM8vZyeVDZnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L8xjPkB4zawT5RrZS1W3/mUloyyZ7wh8SmaEhaLHAQ=;
        b=22MxGEKv7BZHGuBmCb4djYEfrZfodjm/H83ggPMdrjSYRCbvJNZ+sjc74bYaFq3knE
         sj7068zyCaUcu3GgBy2KTrJ1nHloBrUNZ3mi3PUoh4PYCvtprITcVC1CIl4GM6qrpKjo
         2He7Qp97bRAsVA80OcFPOxbroyYiO5aQIReldA+M+5juDn9F5iMj/fbk9UdAHBVhVhM/
         4BPpfThF49P6INd8Ybykg2vHbH/qwelNtz1PlqbBhKgGlXQl4I9NU9o/eu8eJ+HlXXMv
         /4/59CGfDt4JXKbQvk+etETC040x5/MbZMq/+y87ew3JbuNe351IXTsXGvz+hjfenlO2
         Cwxg==
X-Gm-Message-State: ACrzQf2BGNna/5Rhv29K0mKlVu3kiNKH3ANvig42W027xDlt4G2eiAo1
        XeJawdjsVOV0GK37SieSnUlfALzPOfWoI9dS
X-Google-Smtp-Source: AMsMyM7yK6Pef2juHyJoRHDdks1sW59gzL12W0uey0XvE2f8guxEJA3NM57WXrSsqnAm4JZbJNDwMA==
X-Received: by 2002:a05:6402:c7:b0:457:cd5d:d777 with SMTP id i7-20020a05640200c700b00457cd5dd777mr9639944edu.245.1666227458214;
        Wed, 19 Oct 2022 17:57:38 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063cb100b007867dcd3f15sm9564410ejh.104.2022.10.19.17.57.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 17:57:36 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id r17so43808760eja.7
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 17:57:36 -0700 (PDT)
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr9150671eja.122.1666227455915; Wed, 19
 Oct 2022 17:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <bug-216543-208809@https.bugzilla.kernel.org/> <bug-216543-208809-AR52CPrAl3@https.bugzilla.kernel.org/>
 <Y03IXMGpZ2fCof2k@rowland.harvard.edu> <CANiDSCuiYCNM+6F2+3efps2uR_Q+p-oBSu-gVmY6ygf4_1U49Q@mail.gmail.com>
 <Y07AAmc2QnP5HiBg@pendragon.ideasonboard.com> <CANiDSCsSn=UJfCt6shy8htGXAPyeEceVzKva3eD+YxhC3YVmxA@mail.gmail.com>
 <Y09WlZwb270lHPkv@pendragon.ideasonboard.com> <CANiDSCvnWpnw=+QHMfykdbocUyZ2JgN0Mpyvq+fu9u4XWoqwwA@mail.gmail.com>
 <Y1AS7DzY+Vo8ovUx@rowland.harvard.edu>
In-Reply-To: <Y1AS7DzY+Vo8ovUx@rowland.harvard.edu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 20 Oct 2022 09:57:24 +0900
X-Gmail-Original-Message-ID: <CANiDSCsLwJ3iFnXV+EURRe4-b2ei+g=30mkKAhydM7z731_q5w@mail.gmail.com>
Message-ID: <CANiDSCsLwJ3iFnXV+EURRe4-b2ei+g=30mkKAhydM7z731_q5w@mail.gmail.com>
Subject: Re: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nazar Mokrynskyi <nazar@mokrynskyi.com>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@roeck-us.net, Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alan

On Thu, 20 Oct 2022 at 00:08, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Oct 19, 2022 at 01:22:48PM +0900, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > On Wed, 19 Oct 2022 at 10:45, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > And I would like to avoid having to roll out manual changes to all
> > > drivers when the problem can be fixed in the core, just because nobody
> > > can be bothered to spend time to implement a good fix. We don't have to
> > > aim for a solution at the cdev level if that takes too long, an
> > > implementation in V4L2 would be enough to start with.
> >
> > Do we know what a "good fix" would look like?. This is a race
> > condition between cdev, v4l2, and usb_driver. The only entity that
> > knows about the three of them is the driver.
> >
> > If we "fix" v4l2 to provide a callback to notify the framework about a
> > "bus disconnect". It can prevent new syscalls, but it cannot interrupt
> > the current ones.
>
> It doesn't need to interrupt current syscalls.  It merely needs to wait
> until the current ones complete (and help them to complete early by
> making them aware of the disconnection) and to prevent new ones from
> starting.
>

The USB subsystem is not aware of the current syscalls running for that device,
it just triggers the callback disconnect() to notify the driver that
they are not allowed
anymore to access the hardware.

Even when/if we fix this for real, a "basic test" checking if the
device is disconnected is a
nice thing to have. I think of it as a protective programming :)

Something like:

if WARN_ON(is_connected)
   return -EIO;



> I have no idea what facility (if any) the framework uses for this
> already.  However, if it turns out that proper synchronization needs a
> new approach, I suggest trying SRCU.  It can be viewed in some respects
> as a kind of read-write mutex that is highly optimized for rapid
> read-locks and -unlocks at the cost of very slow write-locks --
> appropriate here since every syscall would need a read-lock whereas
> write-locking would be needed only when a disconnect occurs.


Thanks for the pointer :)

>
> Alan Stern



-- 
Ricardo Ribalda
