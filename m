Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E59BEDF6
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 11:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfIZJAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 05:00:14 -0400
Received: from mail-ed1-f46.google.com ([209.85.208.46]:34752 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbfIZJAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 05:00:14 -0400
Received: by mail-ed1-f46.google.com with SMTP id p10so1277153edq.1
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vAXI7crSD4Wq2qHZaksoeYKvWaFQqBOk51szFqvEsNc=;
        b=jzBID5Ft0UOnJ7PQSElqWftSDjH+jp7MVVmCxmFJFEVP8vXABNEmVRO+oj4lgQGq5Z
         XTjB1FIfgncgbyyfe1ZIE1NAIZyL1lzRAK0BB/YSpW0NiU9STF3+AMPW0KZncVVvR3/q
         1jMsvmjxfEiVwPI6phlXlj2DFGoQTblUCWUUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vAXI7crSD4Wq2qHZaksoeYKvWaFQqBOk51szFqvEsNc=;
        b=EhwDOwOgBC+guM/LPKjgfC6xG/kib+COXKHHkDtVHUe1dF5M/t7liBqp4eYV+Q9ULA
         7mSwpx1pB4Z1no8vKrQyJs7vS5yRYSiEhx5+DsrLepc9Jsc92IsL7WHBhx8tjYfdwW8W
         s8UUvP1BA3qF+X3lgivHWspCse75YWsXqeb2fJb/KjrgHChcKUCCtkyXHbqdkeHFMBtU
         fjOFSRAuRl1Ux8ymOQedAJaMgoQQ7909yNm0uDSCRuxqmhqzeEmsfwuB4zLV1fnVux5y
         umDdp3vLEd0h6HSJz7QLwXx7fD31gB13tXqbLSkn8yXKmk1u+kSTjKxErpnxcf1U+VzR
         sOng==
X-Gm-Message-State: APjAAAUaXpFvJmFgqBnxfHBlBOTogBMjWGBsQ7yYKCiBc+wWjpLRbecA
        WCdNcfxIplVYyYc2Yhp5pkgDt1PsS7sKOw==
X-Google-Smtp-Source: APXvYqy4xYU0gBDTA9wO/4WrqBi1r9ln2Wo2zQ96PTA7M4azAvrgh0O1VolwXvg6TWpVpqqtTNXB9A==
X-Received: by 2002:a17:906:11c3:: with SMTP id o3mr2067357eja.297.1569488411972;
        Thu, 26 Sep 2019 02:00:11 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id oy2sm154899ejb.2.2019.09.26.02.00.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:00:10 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id v8so1784857wrt.2
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 02:00:10 -0700 (PDT)
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr1944375wrw.7.1569488409921;
 Thu, 26 Sep 2019 02:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
 <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com> <20190923155709.GC5056@pendragon.ideasonboard.com>
 <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
 <CAH1Ww+TS55RwJZVebvZnHtNXe7ECe7DARDiPtg_f4w+7a7z3FA@mail.gmail.com>
 <20190923184437.GH5056@pendragon.ideasonboard.com> <CAPBb6MXRd8VLu=Wy9zLEOrN1NghW-XmDwYU2nkXLS1LRub-sAA@mail.gmail.com>
In-Reply-To: <CAPBb6MXRd8VLu=Wy9zLEOrN1NghW-XmDwYU2nkXLS1LRub-sAA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 26 Sep 2019 17:59:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B8iHOG+R8OO_v_HmGNptGgjhMeTVQY43dsFMkG4b=8ZA@mail.gmail.com>
Message-ID: <CAAFQd5B8iHOG+R8OO_v_HmGNptGgjhMeTVQY43dsFMkG4b=8ZA@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Gomez <daniel@qtec.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
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

On Thu, Sep 26, 2019 at 2:40 PM Alexandre Courbot <acourbot@chromium.org> w=
rote:
>
> On Tue, Sep 24, 2019 at 3:44 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Shuah and Daniel,
> >
> > On Mon, Sep 23, 2019 at 08:21:58PM +0200, Daniel Gomez wrote:
> > > On Mon, 23 Sep 2019 at 20:16, Shuah Khan wrote:
> > > > On 9/23/19 9:57 AM, Laurent Pinchart wrote:
> > > >> On Mon, Sep 23, 2019 at 04:03:54PM +0100, Kieran Bingham wrote:
> > > >>> On 23/09/2019 15:47, Nicolas Dufresne wrote:
> > > >>>> Le lundi 23 septembre 2019 =C3=A0 16:21 +0200, Hans Verkuil a =
=C3=A9crit :
> > > >>>>> Hi all,
> > > >>>>>
> > > >>>>> Since we have three separate half-day sessions for different to=
pics I decided
> > > >>>>> to split the announcement for this in three emails as well, so =
these things
> > > >>>>> can be discussed in separate threads.
> > > >>>>>
> > > >>>>> All sessions are in room Terreaux VIP Lounge - Level 0.
> > > >>>>> There is a maximum of 15 people.
> > > >>>>>
> > > >>>>> The second session deals with libcamera and is on Wednesday mor=
ning
> > > >>>>> from 9:00 to 13:00.
> > > >>>>>
> > > >>>>> Attendees for this session:
> > > >>>>>
> > > >>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > >>>
> > > >>> Unfortunately I can no longer attend ELCE.
> > > >>>
> > > >>> (My second baby will be a bit too new for an extended stay away f=
rom home)
> > > >>>
> > > >>>>> Boris Brezillon <boris.brezillon@collabora.com>
> > > >>>>> Alexandre Courbot <acourbot@chromium.org>
> > > >>>>> Tomasz Figa <tfiga@chromium.org>
> > > >>>>> Ezequiel Garcia <ezequiel@collabora.com>
> > > >>>>> Daniel Gomez <daniel@qtec.com>
> > > >>>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > >>>>> Eugen Hristev <Eugen.Hristev@microchip.com>
> > > >>>>> Shuah Khan <skhan@linuxfoundation.org>
> > > >>>>> Helen Koike <helen.koike@collabora.com>
> > > >>>>> Jacopo Mondi <jacopo@jmondi.org>
> > > >>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >>>>> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> > > >>>>> Hans Verkuil <hverkuil@xs4all.nl>
> > > >>>>>
> > > >>>>> If I missed someone, or you are on the list but won't attend af=
ter all, then
> > > >>>>> please let me know.
> > > >>>>
> > > >>>> I would like to join this one to, as after ELCE I should have so=
me time
> > > >>>> to spend on this. I understand thought hat this would make use r=
each
> > > >>>> the limit, let me know if there is any issues, I can spare my se=
at if
> > > >>>> needed.
> > > >>>
> > > >>> You now have my seat, and I've just made you a required attendee =
to go
> > > >>> in my place :-D
> > > >>
> > > >> Thank you for the offer Kieran.
> > > >>
> > > >> We're reaching the room capacity, and I know of several people who=
 may
> > > >> attend ELCE and would be beneficial for the discussions. If anyone=
 in
> > > >> the above list only has a general curiosity about libcamera but do=
esn't
> > > >> expect to really contribute to the discussions, and would consider
> > > >> giving their seat if required, could you please let me know ?
> > >
> > > I would like to attend if possible since we are going to work with li=
bcamera
> > > but not sure how much I can contribute so, no problem to give my seat
> > > if necessary.
> >
> > Thank you for the offers. My goal is to secure a seat for everybody who
> > is interested in attending, and I will make sure to let all parties kno=
w
> > of the success (or lack thereof) of that initiative as we get closer to
> > the event.
>
> I won't be active on libcamera, so please feel free to assign my seat
> to someone who will be.

I'll risk saying that I have to join the meeting. ;)

Best regards,
Tomasz
