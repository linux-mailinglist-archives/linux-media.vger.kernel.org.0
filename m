Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD40654E9A1
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 20:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbiFPSpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 14:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377864AbiFPSpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 14:45:41 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F1C2CE0B
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 11:45:40 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id h187so2884503oif.4
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ribalda-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nOjwen9Z+HBTFrOxrSnqhDGqzGzI7PhwVt6nSPKpXbA=;
        b=RV73RVED+2TorK9VvLQZ5uRPtWWf2gubzKCVzkr2Htq6zvMEQkeCuGFbsCOdSqMlrp
         jVkfcA7/BN/cRH2O3viTm1l66M/8HpvHNwDYSmc5OVuLbGzCagU9PDJC+iRAo2/8546t
         5+l3o4FtV1Y3ZNN5kwF6ld+kiUSHkgN4e0Wo/NByIYYYuQ398OkOxZQrurQanjCPuvgu
         jZG0uicmdDTsceS0W4iql5KJT8pdDRslbC/ZXhkkUhZTXs8V1xIdX4oiZhRFxD23j6Os
         7SQtXmPfwFkIFLPQexO/oMAg17P8ayNgGJMo7yPxZYVR+sPefKva/+m0E7x/pgLAYbZa
         rvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOjwen9Z+HBTFrOxrSnqhDGqzGzI7PhwVt6nSPKpXbA=;
        b=Qa/kuRtUVmkb9kUzLx6hu9X8GCaypg4utpm+UljxSxMJybuuoZ1qpQ/UD3XDaj1MMt
         JBWYkcLYdr6U2Z0d65PJ4rIMfZcQ17ffCgEukA0o8ySgTT0mW5+M/1g6LUlu2kjRwtVh
         LN18TgS02pzQpPHqjJXG28yeHwgS17S93TUx/NOke4/49ryb39FBXMcS3pWbpLpDzXLc
         FGAQb156xMEyr8dP7+v8ztbCGcBqxBhYNaLzbxN99zw8QcnOex0ak2+wyPFkCFOSGrG7
         HLI+B2t8iU9e3Ak/7+D+AIXX2+tvA4TUvM4e1G/0IJNNmHOOoyAsbZplIj/vt+6/iJY2
         z/4w==
X-Gm-Message-State: AJIora+29NKFuSsCSzAFA/duWGWVpk2BFVXByLPoY8yyK9JMEeSHJQa+
        7ruBoaiOsIAggbJ567X4GLcMFFdQ6c7YBf46
X-Google-Smtp-Source: AGRyM1vZs49gc9Gtobnu7us+xA83B4uuuXMAI+b9xB5WgQeFqB/Uw9ZUkQTuQZ30MpXZcQzyq9LVAg==
X-Received: by 2002:aca:4b95:0:b0:331:4dcb:4937 with SMTP id y143-20020aca4b95000000b003314dcb4937mr214448oia.110.1655405139465;
        Thu, 16 Jun 2022 11:45:39 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id r23-20020a056830419700b0060c03836d04sm1149628otu.77.2022.06.16.11.45.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 11:45:38 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id a8-20020a05683012c800b0060c027c8afdso1583052otq.10
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 11:45:38 -0700 (PDT)
X-Received: by 2002:a9d:7618:0:b0:605:a132:7d57 with SMTP id
 k24-20020a9d7618000000b00605a1327d57mr2588070otl.262.1655405138421; Thu, 16
 Jun 2022 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
 <CAPybu_2=MkqBeesQe56pw1nVCpaRyukH80ifk6zasbcykyq5bA@mail.gmail.com> <YqnQSU3geEdZ0SGo@pendragon.ideasonboard.com>
In-Reply-To: <YqnQSU3geEdZ0SGo@pendragon.ideasonboard.com>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Thu, 16 Jun 2022 20:45:22 +0200
X-Gmail-Original-Message-ID: <CAPybu_136RGzfTLyH2JTyKMsb74gUUH9=Ziog6j8c2ZQWftb_w@mail.gmail.com>
Message-ID: <CAPybu_136RGzfTLyH2JTyKMsb74gUUH9=Ziog6j8c2ZQWftb_w@mail.gmail.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, Jun 15, 2022 at 2:28 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Jun 09, 2022 at 12:29:32PM +0200, Ricardo Ribalda Delgado wrote:
> > On Mon, May 9, 2022 at 8:46 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >
> > > Hi all,
> > >
> > > Since countries are opening up again and travel is (at least for now!) a lot easier,
> > > I am considering a media summit during the ELCE in Dublin (Sep 13-16).
> > >
> > > See here for more details about the conference:
> > >
> > > https://events.linuxfoundation.org/open-source-summit-europe/
> > >
> > > Of course, this only makes sense if there is something to talk about. So please reply
> > > with any suggestions for topics!
> > >
> > > Also please let me know if you would expect to be at such a media summit in person.
> > > If only a few people would be there, then there isn't much point to this.
> > >
> > >
> > > I have two topics:
> > >
> > > 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
> > >    for improvements?
> > >
> > > 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
> > >    HDMI) and the edid-decode utility.
> > >
> > > I'd like to make a decision on whether or not it is worthwhile to do this in a week
> > > or two. If we wait too long it might be difficult to get a room for the summit.
> > >
> > > Regards,
> > >
> > >         Hans
> >
> > If all goes well, I will attend in person.
> >
> > I would like to propose a topic as well if there is still space for it:
> >
> > At ChromeOS we have been working on a new way to access cameras that
> > do not fit in the current V4L2/MC model.
> >
> > We want to introduce the project, start a discussion in the media
> > community and think together about the approach and how it fits in our
> > current ecosystem.
>
> I hope there will be space to discuss this topic :-) Could you maybe
> provide links to the talk you've given in Paris (video and slides) as
> well as to the public git tree ? We'll have a big agenda for the
> workshop, it will be important to focus on discussions and not
> presentations, so we should all prepare by reading material in advance.
>

The video of the presentation has not been produced yet. There is a
raw version with all the sessions of the day
https://www.youtube.com/watch?v=v--rVT4RsCE&t=26706s Will share with
the list the video once it is has been edited

The slides are here:
https://kernel-recipes.org/en/2022/talks/rethinking-the-kernel-camera-framework/

and the source code here:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/kcam
 Although it is WIP at this moment.

If time allows I want to write a design doc before the workshop to
make the most of out it.

Regards!

> --
> Regards,
>
> Laurent Pinchart
