Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D026CB55DD
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 21:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbfIQTBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 15:01:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55571 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729728AbfIQTBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 15:01:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so32645wma.5
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BhrzmIFijyJs8g+TQazhtEehXPAnsC0rpRPGak1WDWc=;
        b=u5OQbZU2TyyZ4Vl2IqfhCfmY5usH9KEDhiUe7O4dnTidVHJ/Dza+hbMe+wDqAaldMB
         LLh1/d2AgxVByB3jdoYBs0HTpfzMpJ0OyXBFrk9NG81NZWm8sAE53Nkkxyrrut5m2m5q
         atzhSERyo7XeagDHsoN4xJL/3M1Oqek/nI3ulPOiiJFLw7xnOSF5EAy8T6hnwUDuGhnP
         uK9M0gRAlaak4aSNMCuBS/iwuZ4mCRyp7s+PKsajVBiR3KaXcAl6jtEXkLyWaM9OYRZY
         8CeUgjNJnzN18DqI5MjWFmDY8tdxK/DHEtPUleq6TuoaPGVoPYKah6tCq0sQDDIxAxSO
         IIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BhrzmIFijyJs8g+TQazhtEehXPAnsC0rpRPGak1WDWc=;
        b=J6fYU6akC0X3F4CCTB6rUjtTgk4H+O1yIPeegZSydjA8DJKlpApl5fRMU4l6rQy95n
         jV+S0yRyOKU+2I/vanrqJGuL6CnFRky03dYzLcYa4Mbm1Zyu+9PgBj7n7oBpLU1C5p5S
         20hX+ko6eI4gmGt7+7rTQVmCyX0vdnXAUopVy91nvLhVtULCJylaXC25T6XkteV/38S8
         om9p1X9la1r5YB+00D3mAZuoJTabTi1Ku/vmU9uhZc73vv9NKvebnwIHwWPPPqGTO728
         iVXGYUMej7QM51g10dwI2PN9GCkqr2IIDNi1V+i4NEzbys3ypAIyjhCfcOrQNk/WFGyx
         BX6g==
X-Gm-Message-State: APjAAAUVBJjPi8WBTQ24++scW7ZnhZiILGDzpFF/rg0jwwMfM5tHloW5
        nw2cKJhrIiQwZirXsotOsRXBQg1CUReJoToxE7lfY9tF
X-Google-Smtp-Source: APXvYqy530lMRAKBm/8y8HTSX42B1bzE2QuTpQ7u3jPXkBK9jsAshbryHk2zcafaWmdoJIMlzxSxWvVsOdcydPaFchI=
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr5057746wml.14.1568746866056;
 Tue, 17 Sep 2019 12:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1F0OU6j9ZbQyXwuc1JbEYrbOEK0h7hHBf-VhWrefhvpw@mail.gmail.com>
 <1568730830.8808.1.camel@pengutronix.de>
In-Reply-To: <1568730830.8808.1.camel@pengutronix.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 17 Sep 2019 12:00:55 -0700
Message-ID: <CAJ+vNU1ME9RT0_Jdy9j0ocvfU8imyBqZip6Y8Gfj27B6P4JvAQ@mail.gmail.com>
Subject: Re: coda9 jpeg support?
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 17, 2019 at 7:33 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Tim,
>
> On Fri, 2019-09-13 at 09:00 -0700, Tim Harvey wrote:
> > Greetings,
> >
> > What would need to be done to support JPEG enc/dec for coda9?
>
> here is a WIP that still needs some cleanup for upstreaming:
>
>   https://git.pengutronix.de/cgit/pza/linux/log/?h=coda/jpeg
>
> Basically I'd like to avoid adding yet another JPEG header parser to the
> kernel, as we already have at least three:
>   drivers/media/platform/rcar_jpu.c
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
>   drivers/media/platform/s5p-jpeg/jpeg-core.c
>
> I want to allow probing without the BIT processor firmware for blobless
> JPEG-only support, and I'd like the JPEG codec to be able to run
> concurrently with the BIT processor codec.
>
> I'm working on this this week.
>

Philipp,

Thanks for this! I'll keep an eye out for your submission and provide testing.

I have pulled your branch and boot-tested it. I see the 2 new video
devices but noticed that the JPEG decoder shows up as an element for
video4linux2 the JPEG encoder doesn't show up (gstreamer v1.14.5) -
any idea why that would be?

Thanks,

Tim


Tim
