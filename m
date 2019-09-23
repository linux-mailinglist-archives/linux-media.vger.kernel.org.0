Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44EABBBB2E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 20:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732957AbfIWSWL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 14:22:11 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:40791 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfIWSWL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 14:22:11 -0400
Received: by mail-ed1-f52.google.com with SMTP id v38so13820522edm.7
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Eyf11OLeTOUgFgGdRz17nxGpRZLfv7nYGI3PK/LlGKM=;
        b=Rbg6BkJrkdJfYw7VZKp9sR38D7OLvfAizcvDQT1e66hVD7ZirAdPaASnzG6ZQwVmzD
         warg0+RnVXPYBHxkhhkY9uzCIbVo0WN79itJ3ApeytavFlDteq36kCyIQL2WNwQMfFOa
         ArXj/hCyrrEyO7nxiIUbPfOT7GL1byab1oHXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Eyf11OLeTOUgFgGdRz17nxGpRZLfv7nYGI3PK/LlGKM=;
        b=ZmbfoHw+okyeYghWH5AuODMZFbxziRbsHP0WB5TyFGIAx/u8SOnTNLWHXZU1/OKpGf
         Eo93qxTPvLliJCQsNLSq6WZu8S9Zcsz1uTPrGo3rF+hWWU/2RNFakzffXnx2A7snj+mi
         RO1OPnkC9I77xCpHrDaJDZAgU63F1JnzTYb4ZF3qMrdiEY9aU6Ds7xPHKDrJFRbdIewR
         3nt05eMl0+eL8k/W+EBNTrdScoX2kTRCyccy00hgXbRVhcmgfAWgqodZGo5crwKcKAi4
         A/ecAEdM6eUjGJgl2f+t6yBlk+PJeIoUV1G3Y1lRhbaUi9UN6LDCT6/ccN/8ASfohlF8
         X0Ww==
X-Gm-Message-State: APjAAAXG+FjdR9XIKp/UP8vl1nGjtcGR9QevM7RKL95hc9sJfCpd5acO
        mkG3t3UJzQPK6VNNy2GiixT0Ifu64PCSLcxaINhNyw==
X-Google-Smtp-Source: APXvYqyv18t6m8DFtPBSfT12HDHmk+hygViiCL5QPjAASANml6h467oiGHlZMAd+zO3+lGCVsc87bAXCUbIb9MJBl9Q=
X-Received: by 2002:aa7:df8e:: with SMTP id b14mr1517464edy.65.1569262929125;
 Mon, 23 Sep 2019 11:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
 <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com> <20190923155709.GC5056@pendragon.ideasonboard.com>
 <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
In-Reply-To: <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Mon, 23 Sep 2019 20:21:58 +0200
Message-ID: <CAH1Ww+TS55RwJZVebvZnHtNXe7ECe7DARDiPtg_f4w+7a7z3FA@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Hans:
On Mon, 23 Sep 2019 at 20:16, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 9/23/19 9:57 AM, Laurent Pinchart wrote:
> > Hello everybody,
> >
> > On Mon, Sep 23, 2019 at 04:03:54PM +0100, Kieran Bingham wrote:
> >> On 23/09/2019 15:47, Nicolas Dufresne wrote:
> >>> Le lundi 23 septembre 2019 =C3=A0 16:21 +0200, Hans Verkuil a =C3=A9c=
rit :
> >>>> Hi all,
> >>>>
> >>>> Since we have three separate half-day sessions for different topics =
I decided
> >>>> to split the announcement for this in three emails as well, so these=
 things
> >>>> can be discussed in separate threads.
> >>>>
> >>>> All sessions are in room Terreaux VIP Lounge - Level 0.
> >>>> There is a maximum of 15 people.
> >>>>
> >>>> The second session deals with libcamera and is on Wednesday morning
> >>>> from 9:00 to 13:00.
> >>>>
> >>>> Attendees for this session:
> >>>>
> >>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>
> >> Unfortunately I can no longer attend ELCE.
> >>
> >> (My second baby will be a bit too new for an extended stay away from h=
ome)
> >>
> >>>> Boris Brezillon <boris.brezillon@collabora.com>
> >>>> Alexandre Courbot <acourbot@chromium.org>
> >>>> Tomasz Figa <tfiga@chromium.org>
> >>>> Ezequiel Garcia <ezequiel@collabora.com>
> >>>> Daniel Gomez <daniel@qtec.com>
> >>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>> Eugen Hristev <Eugen.Hristev@microchip.com>
> >>>> Shuah Khan <skhan@linuxfoundation.org>
> >>>> Helen Koike <helen.koike@collabora.com>
> >>>> Jacopo Mondi <jacopo@jmondi.org>
> >>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> >>>> Hans Verkuil <hverkuil@xs4all.nl>
> >>>>
> >>>> If I missed someone, or you are on the list but won't attend after a=
ll, then
> >>>> please let me know.
> >>>
> >>> I would like to join this one to, as after ELCE I should have some ti=
me
> >>> to spend on this. I understand thought hat this would make use reach
> >>> the limit, let me know if there is any issues, I can spare my seat if
> >>> needed.
> >>
> >> You now have my seat, and I've just made you a required attendee to go
> >> in my place :-D
> >
> > Thank you for the offer Kieran.
> >
> > We're reaching the room capacity, and I know of several people who may
> > attend ELCE and would be beneficial for the discussions. If anyone in
> > the above list only has a general curiosity about libcamera but doesn't
> > expect to really contribute to the discussions, and would consider
> > giving their seat if required, could you please let me know ?
> >
I would like to attend if possible since we are going to work with libcamer=
a
but not sure how much I can contribute so, no problem to give my seat
if necessary.
>
> Looks like I have a conflict with my talk for the an hour so towards the
> end of this morning session. I might as well give up my seat so it can
> be given to somebody that can attend the session in full.
>
> I am attending the afternoon session on Wednesday.
>
> thanks,
> -- Shuah
