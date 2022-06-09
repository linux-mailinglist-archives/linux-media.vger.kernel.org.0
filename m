Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2925448E2
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 12:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbiFIK3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 06:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiFIK3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 06:29:51 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6C3194254
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 03:29:50 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id r206so31320158oib.8
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ribalda-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NEfkIqme8dn9dJYrSg1n7je0e0IoxbVwQHxXscwobvI=;
        b=EQrrKc2pyM1DpXQsKmI8eBceQT7jCdTcsJEzlF+C/byJ8K26T0zxmoVSqHV+CYuF6f
         8TVQVEU769B2dJlNkMwb/eyCF+cAdNhnDX7jyRUUsf7a9Uoioe07JVEJeMoTm+dPnlvN
         N1NBzwjqVjYkGPxmD/D5qKTh62DZJmbta+/GDwiB4iwO40yA0Y6uEDHrQxqwuOYRvW/z
         3P8eh1twjt5/C7XfzhxcI1SD52X3FcRcMBdIZ6AsWCtpdGeu2TUNDnJgNzzdLZg2JbIu
         rsVRT4tIVTfVzCDAZyy8oyXL3SRRQ4yJLext6Dc7yP6BElsOKVNkeUfGRHJuAWI6JVad
         /7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEfkIqme8dn9dJYrSg1n7je0e0IoxbVwQHxXscwobvI=;
        b=RxLsyS7jIvkBUVQmpqNaYTcMBXI/DicEQOv0zlb7d/KjlZIFkJs7wr4Fhe2/ZLEYf6
         10e4o4wfBPSYeLY9tPt3EgaDcu6ypWTLceoMjvFPDisAHZF39spHiG1xWULZegTbvnKE
         5teJBrGPrh8H5QVxejwZEsCsvBik2LZeqbAB+o5xOzuqr1p411GCmm0p8cMOWhPs6tpi
         Ue1o/cVbXkUY3J57VxvYiZThDsyqQtR0MLZkU+kxOFK9bbsgkJWiXc9zxoUCAIwWShov
         RP3mLUI0Wad4FYOOtzPR2s0qeqkvYIJGdF9ue7/DFhiJpLIOXnnx2RRdmsYuziN3SM0d
         5vMQ==
X-Gm-Message-State: AOAM532072CLVGGMxUpgqDINYjJGj79ZRTysX7p4OVxBcCTKHKR08yXy
        tuzlCk4O5Fh9mHo8/1pq6x2LBOeqivx/cEeXFR4=
X-Google-Smtp-Source: ABdhPJz/7OKCn3vu8RPNtXqTB4+GxdfEIvV6rfcySuZLSrJ7iP1eI3z+56Yws86AMIFgGedaBhD3pg==
X-Received: by 2002:aca:3bc1:0:b0:32b:243e:2542 with SMTP id i184-20020aca3bc1000000b0032b243e2542mr1218333oia.175.1654770589764;
        Thu, 09 Jun 2022 03:29:49 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id z18-20020a9d62d2000000b0060bf670dd35sm6310447otk.49.2022.06.09.03.29.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 03:29:49 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-fe4ac3b87fso351420fac.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 03:29:48 -0700 (PDT)
X-Received: by 2002:a05:6870:d69c:b0:de:9925:2baa with SMTP id
 z28-20020a056870d69c00b000de99252baamr1308496oap.279.1654770588607; Thu, 09
 Jun 2022 03:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
In-Reply-To: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date:   Thu, 9 Jun 2022 12:29:32 +0200
X-Gmail-Original-Message-ID: <CAPybu_2=MkqBeesQe56pw1nVCpaRyukH80ifk6zasbcykyq5bA@mail.gmail.com>
Message-ID: <CAPybu_2=MkqBeesQe56pw1nVCpaRyukH80ifk6zasbcykyq5bA@mail.gmail.com>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
To:     Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, May 9, 2022 at 8:46 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> Since countries are opening up again and travel is (at least for now!) a lot easier,
> I am considering a media summit during the ELCE in Dublin (Sep 13-16).
>
> See here for more details about the conference:
>
> https://events.linuxfoundation.org/open-source-summit-europe/
>
> Of course, this only makes sense if there is something to talk about. So please reply
> with any suggestions for topics!
>
> Also please let me know if you would expect to be at such a media summit in person.
> If only a few people would be there, then there isn't much point to this.
>
>
> I have two topics:
>
> 1) Discussion of the media subsystem development process: any bottlenecks, any ideas
>    for improvements?
>
> 2) I can give a presentation on the work I've done in the CTA-861 standard (used by
>    HDMI) and the edid-decode utility.
>
> I'd like to make a decision on whether or not it is worthwhile to do this in a week
> or two. If we wait too long it might be difficult to get a room for the summit.
>
> Regards,
>
>         Hans


If all goes well, I will attend in person.

I would like to propose a topic as well if there is still space for it:

At ChromeOS we have been working on a new way to access cameras that
do not fit in the current V4L2/MC model.

We want to introduce the project, start a discussion in the media
community and think together about the approach and how it fits in our
current ecosystem.


Best regards!
