Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D91BEBAC
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 07:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392299AbfIZFkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 01:40:07 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:45287 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392290AbfIZFkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 01:40:07 -0400
Received: by mail-ot1-f48.google.com with SMTP id 41so900880oti.12
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2019 22:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4XDYBz6wmKWWXHYsbsWBn8kzvHSYqFW74Xb0Kq3/Lp4=;
        b=IUxJhWRr3jE07XjkEE52nvcuJY/TG4qe0tjouYRXUTxwl5vFkkMu0piQyDR2wusXiA
         k4mYrhgCtX1zBwg5QYwIumQDrYEeG9UUFgCehPba8xTJmFLO37ciekWxKVBUtA5gzq1j
         NGAWAJU9ANV0Htaauegkjmm/avcGCeeo/YMCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4XDYBz6wmKWWXHYsbsWBn8kzvHSYqFW74Xb0Kq3/Lp4=;
        b=gniu87W67z/zqt2yCmmtj3j+cPpDAlfe/sTtBqt0p2G9zvwpsnDF2sOjnwPgAaZPih
         dFKsB8J3MHjC+86IWPq6K2UrQxZEfyND0GcyjUIUOuKuDIsJrZqSWHPO5muQRdUAXgA8
         YZQd4pEjO25uL6v03daelBI72id6pisNMHZeF0mcSv+FsigIqdou4uU7NHq4k16S1cLm
         2VWy/+qKxcnjDE5QFNCsww1onCAp4d85AjnJ9UjVDM+20cQv/eFaVnuE4/6PJMsGPWA4
         dlLSKgB1HTbs+5Imp8hIP1C7qcyHOq4DNvFcJCHNNHDUezxzqMEwQUIfufB4n/SRiYNb
         vPMA==
X-Gm-Message-State: APjAAAXP4J5FlikuGpeO8UTfLqA1CGEHSzGx2zZTrh9Ih62slmRkgqRZ
        RK/9GFOQj+XvP6I8/IP9BV29FsBhnlQ=
X-Google-Smtp-Source: APXvYqyQKRvj0VpG9hkEflnNrLIMt/skBSl1Oo9mJU4acch5IQdcIrGCx+QOUfagv9XpROpbk2lT8Q==
X-Received: by 2002:a9d:68c6:: with SMTP id i6mr1338694oto.350.1569476405634;
        Wed, 25 Sep 2019 22:40:05 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id t12sm350682otl.35.2019.09.25.22.40.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 22:40:04 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id e11so935168otl.5
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2019 22:40:04 -0700 (PDT)
X-Received: by 2002:a05:6830:d5:: with SMTP id x21mr1291187oto.36.1569476404012;
 Wed, 25 Sep 2019 22:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
 <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com> <20190923155709.GC5056@pendragon.ideasonboard.com>
 <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
 <CAH1Ww+TS55RwJZVebvZnHtNXe7ECe7DARDiPtg_f4w+7a7z3FA@mail.gmail.com> <20190923184437.GH5056@pendragon.ideasonboard.com>
In-Reply-To: <20190923184437.GH5056@pendragon.ideasonboard.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 26 Sep 2019 14:39:52 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXRd8VLu=Wy9zLEOrN1NghW-XmDwYU2nkXLS1LRub-sAA@mail.gmail.com>
Message-ID: <CAPBb6MXRd8VLu=Wy9zLEOrN1NghW-XmDwYU2nkXLS1LRub-sAA@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Gomez <daniel@qtec.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
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

On Tue, Sep 24, 2019 at 3:44 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Shuah and Daniel,
>
> On Mon, Sep 23, 2019 at 08:21:58PM +0200, Daniel Gomez wrote:
> > On Mon, 23 Sep 2019 at 20:16, Shuah Khan wrote:
> > > On 9/23/19 9:57 AM, Laurent Pinchart wrote:
> > >> On Mon, Sep 23, 2019 at 04:03:54PM +0100, Kieran Bingham wrote:
> > >>> On 23/09/2019 15:47, Nicolas Dufresne wrote:
> > >>>> Le lundi 23 septembre 2019 =C3=A0 16:21 +0200, Hans Verkuil a =C3=
=A9crit :
> > >>>>> Hi all,
> > >>>>>
> > >>>>> Since we have three separate half-day sessions for different topi=
cs I decided
> > >>>>> to split the announcement for this in three emails as well, so th=
ese things
> > >>>>> can be discussed in separate threads.
> > >>>>>
> > >>>>> All sessions are in room Terreaux VIP Lounge - Level 0.
> > >>>>> There is a maximum of 15 people.
> > >>>>>
> > >>>>> The second session deals with libcamera and is on Wednesday morni=
ng
> > >>>>> from 9:00 to 13:00.
> > >>>>>
> > >>>>> Attendees for this session:
> > >>>>>
> > >>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> > >>>
> > >>> Unfortunately I can no longer attend ELCE.
> > >>>
> > >>> (My second baby will be a bit too new for an extended stay away fro=
m home)
> > >>>
> > >>>>> Boris Brezillon <boris.brezillon@collabora.com>
> > >>>>> Alexandre Courbot <acourbot@chromium.org>
> > >>>>> Tomasz Figa <tfiga@chromium.org>
> > >>>>> Ezequiel Garcia <ezequiel@collabora.com>
> > >>>>> Daniel Gomez <daniel@qtec.com>
> > >>>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > >>>>> Eugen Hristev <Eugen.Hristev@microchip.com>
> > >>>>> Shuah Khan <skhan@linuxfoundation.org>
> > >>>>> Helen Koike <helen.koike@collabora.com>
> > >>>>> Jacopo Mondi <jacopo@jmondi.org>
> > >>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>>>> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> > >>>>> Hans Verkuil <hverkuil@xs4all.nl>
> > >>>>>
> > >>>>> If I missed someone, or you are on the list but won't attend afte=
r all, then
> > >>>>> please let me know.
> > >>>>
> > >>>> I would like to join this one to, as after ELCE I should have some=
 time
> > >>>> to spend on this. I understand thought hat this would make use rea=
ch
> > >>>> the limit, let me know if there is any issues, I can spare my seat=
 if
> > >>>> needed.
> > >>>
> > >>> You now have my seat, and I've just made you a required attendee to=
 go
> > >>> in my place :-D
> > >>
> > >> Thank you for the offer Kieran.
> > >>
> > >> We're reaching the room capacity, and I know of several people who m=
ay
> > >> attend ELCE and would be beneficial for the discussions. If anyone i=
n
> > >> the above list only has a general curiosity about libcamera but does=
n't
> > >> expect to really contribute to the discussions, and would consider
> > >> giving their seat if required, could you please let me know ?
> >
> > I would like to attend if possible since we are going to work with libc=
amera
> > but not sure how much I can contribute so, no problem to give my seat
> > if necessary.
>
> Thank you for the offers. My goal is to secure a seat for everybody who
> is interested in attending, and I will make sure to let all parties know
> of the success (or lack thereof) of that initiative as we get closer to
> the event.

I won't be active on libcamera, so please feel free to assign my seat
to someone who will be.
