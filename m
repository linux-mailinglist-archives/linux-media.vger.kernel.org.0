Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA317409A40
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 19:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241396AbhIMRCq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 13:02:46 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:37416 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238966AbhIMRCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 13:02:45 -0400
Received: by mail-lf1-f42.google.com with SMTP id i4so5371323lfv.4;
        Mon, 13 Sep 2021 10:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+e1KGdaTcArSitzpQ5kAkfchGna7Wslk+nX3KrALFo=;
        b=ki+ASjI1vAiV/VUCJ+3cKhQGgQdXL3Uk3DnvzxPIQjherERLDuAHdKA3UsaM97Fp4Q
         A0EN3/Xv74aWwXG3PKzHm+6p+NuhOBDJYFTEFxGjYMqfEbn6hbj50Pli3MgKfxVNByOJ
         KWm8rNM1lWBa8QV+glINd3OURpt/cvho623WLsfzC3qeJugXx0DCcP4HUY+GzYp+wbwf
         NffSaeq1F+1P8fNX4BgZbld3ZuEec/g+aFVjRlYW70uZOKDKlruW6yJ2HvUcfpZ49IFq
         2ACnVVzzOxy7WLQ9KdajWfPWrp052nfdX95QZ5UENUq6/DUWlkzlNe0HKIFTZ4nCK3lY
         aRFQ==
X-Gm-Message-State: AOAM531jy+D7Dm9/nKzbsGUu9aTxYjq5yNcaZf6LmGL7q+TC4d7GJYcD
        LCvUuqRkR7kYQvE5pfOvQjgzuot6LSNoqQ==
X-Google-Smtp-Source: ABdhPJwkTIRR0cDCPKbF2wqWn3ZUKN+3HxROqq4XRGtjmqDM38T0f/Gwj0bF5puD1mheNeEBXenWlg==
X-Received: by 2002:a05:6512:118b:: with SMTP id g11mr9474546lfr.205.1631552487726;
        Mon, 13 Sep 2021 10:01:27 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id d19sm380605lfa.252.2021.09.13.10.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 10:01:27 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id i4so5371198lfv.4;
        Mon, 13 Sep 2021 10:01:27 -0700 (PDT)
X-Received: by 2002:a05:6512:3d94:: with SMTP id k20mr9560866lfv.633.1631552486991;
 Mon, 13 Sep 2021 10:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210831174822.83870-1-pedro@terraco.de> <8e7ff5a2-0629-228f-c9d5-35d39bf92ce2@xs4all.nl>
In-Reply-To: <8e7ff5a2-0629-228f-c9d5-35d39bf92ce2@xs4all.nl>
From:   Pedro Terra Delboni <pedro@terraco.de>
Date:   Mon, 13 Sep 2021 14:01:15 -0300
X-Gmail-Original-Message-ID: <CAHKDPP9J9Y1O2LDp1MYFtbuLGBcYcbJ2v9mP-H41e3zE0feFPw@mail.gmail.com>
Message-ID: <CAHKDPP9J9Y1O2LDp1MYFtbuLGBcYcbJ2v9mP-H41e3zE0feFPw@mail.gmail.com>
Subject: Re: [PATCH v7] media: vimc: Enable set resolution at the scaler src pad
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Gabriel Francisco Mandaji <gfmandaji@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Mon, Sep 13, 2021 at 5:28 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Pedro,
>
> Your 'From' email is Pedro Terra <pedro@terraco.de>, but...
>
> On 31/08/2021 19:48, Pedro Terra wrote:
> > Modify the scaler subdevice to accept setting the resolution of the source
> > pad (previously the source resolution would always be 3 times the sink for
> > both dimensions). Now any resolution can be set at src (even smaller ones)
> > and the sink video will be scaled to match it.
> >
> > Test example: With the vimc module up (using the default vimc topology)
> > media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> > media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> > media-ctl -d platform:vimc -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
> > media-ctl -d platform:vimc -V '"Scaler":0[crop:(100,50)/400x150]'
> > media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
> > v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=300,height=700
> > v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> > v4l2-ctl --stream-mmap --stream-count=10 -z platform:vimc -d "RGB/YUV Capture" \
> >       -stream-to=test.raw
> >
> > The result will be a cropped stream that can be checked with the command
> > ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
> >       -video_size "300x700" test.raw
> >
> > Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> > Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> > Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> > Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> > Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>
>
> ... that differs from what is used in this Signed-off-by.
>
> checkpatch.pl complains about that.
>
> Which of the two should I use? I can fix it myself in the pull request,
> but I need to know which one I should use.
I would like to stay with pedro@terraco.de.
>
> For future patches, please use consistent email addresses.
I will, sorry for the trouble.
>
> Regards,
>
>         Hans

Thank you very much,
Pedro
