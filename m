Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8914192A6E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 14:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgCYNvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 09:51:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32881 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgCYNvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 09:51:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so3234903wrd.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lOsNC531XACTtIuPtUgZeHVrQrHshlecbxgyHUHhDKA=;
        b=JVMOBqei+k17yKCYfOCH6y3ZOzWuShrL6SI0fMqpEDRvkgqx9284/0BRaUJM49gmvh
         SDtT5s2jpJeQHOREET2kI4XUs8HQH2OOjd/MBT/rBwrYPJivWhPvOtx/MaJPr/fGDsNr
         m/OqdtYmtqkSDDmS8wRwbi0O51GggH7jnm1iT6I3Nl6590mIlJrvJpx8CmQiMpKKV5NK
         JbvyPnawG+iDnRTW41aTGTMo0u0qNDpdxQTGJfVZCFpVbfFk/hRmLG3p7z6RsFlv+YN7
         MU7il0v7QY9ejsmFD50OT5EPQYX8oy+s/ppjt7XSvc7JGZIlrcSD116EKzMqDCwFzPCB
         yhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lOsNC531XACTtIuPtUgZeHVrQrHshlecbxgyHUHhDKA=;
        b=Njs55qKAggvzj0BA7i1xRFWjyp1ltif3O7ZBGBISPI6vaZoODuWRoFRoRwg1kFyxCR
         qATqtLh6HMxG8QYAMiVUjOiSAddWFXGGBptHao6b+HLZ4hH9ojhmkEE1Cr5fxkfgiO4D
         gkwzxqANgPbXsyZW9RLvMlSBxS3ePo1So1lkg69m7yWJzblGPC08jjXXlZ2bza5LznbB
         QsDS7wX7ksIH6OpbJRJLudZg2vDzKbmZAqrym4tKDjrLCh8tZYQO+NagkPnUnORXKAKR
         lY79Zl+ShPen4wxqekWot/2wXEGRTlulDMGRINWk+dA/Sy9ilQhhK68qV0++ezjc0oGI
         agvg==
X-Gm-Message-State: ANhLgQ2qvmVi78LZpAgTaUoxwmrz53QqCjz7ddp2V+48EOygFZDPv4ZX
        f7OSPOckb6AODg1SAJR19ruI8yBsa5kIW5vO/65fyw==
X-Google-Smtp-Source: ADFU+vueNW+ud3adc9sdMQGJpfGgl8pZxjCLD1WyE2eGeE9k+4E8bJq+1frTxYs8uznWf6pRZX9wnqRRnofKdjL1lYc=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr1360714wrq.47.1585144262458;
 Wed, 25 Mar 2020 06:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916115207.GO843@valkosipuli.retiisi.org.uk> <2c0da850-7073-0fc6-7246-9e530a54cf26@xs4all.nl>
 <CAPY8ntCOAeq1OLS4dn846ubujnbUxSwMu-Tfb9fcNgaDcn3_JQ@mail.gmail.com>
In-Reply-To: <CAPY8ntCOAeq1OLS4dn846ubujnbUxSwMu-Tfb9fcNgaDcn3_JQ@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 25 Mar 2020 13:50:44 +0000
Message-ID: <CAPY8ntCL+j=hia=WHJnpcGosD7hTxR2-aJWYrY+E3qpT-+g=0Q@mail.gmail.com>
Subject: Re: [PATCHv2 0/2] Add helper functions to print a fourcc
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 Jan 2020 at 11:52, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Hans.
>
> On Mon, 16 Sep 2019 at 13:00, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 9/16/19 1:52 PM, Sakari Ailus wrote:
> > > On Mon, Sep 16, 2019 at 12:04:31PM +0200, Hans Verkuil wrote:
> > >> It turns out that Sakari posted a newer patch in 2018. I used that
> > >> for this v2: https://patchwork.linuxtv.org/patch/48372/
> > >>
> > >> Mauro commented on that original patch that there was no need to
> > >> have this available for userspace.
> > >>
> > >> I disagree: why wouldn't userspace want to report pixelformats?
> > >>
> > >> It happens in several places in v4l-utils, and there the pixelformats are
> > >> printed in different ways as well. Providing a standard way of reporting
> > >> a V4L2 fourcc is very useful.
> > >
> > > Thanks, Hans!
> > >
> > > Can you take these to your tree (perhaps pending some sort of agreement
> > > with Mauro)?
> > >
> >
> > Certainly.
> >
> >         Hans
>
> What happened to these? Patchwork is flagging them as rejected[1], but
> there's only been positive responses to them on the mailing list.

Ping. Why were these patches rejected?
  Dave

> Thanks.
>   Dave
>
> [1] https://patchwork.linuxtv.org/patch/58781/ and
> https://patchwork.linuxtv.org/patch/58780/
