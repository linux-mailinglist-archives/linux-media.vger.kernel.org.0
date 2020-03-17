Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A15C187AC0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 09:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgCQIBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 04:01:49 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:25670 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgCQIBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 04:01:49 -0400
Date:   Tue, 17 Mar 2020 08:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1584432106;
        bh=6ld586Rsq5NNi1uSX5EgCJ10UYLT+01mR7Pm8hOHRGQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=dCHcQBHLwCFI+3QwF1XUzMns8F3FXqV5Yzh3g3JEu8dqmLYrpKx+mDj4IBDeVhxlc
         aTahPLht7Hkd/xaaEoLc7yI7/pL8DN86/8ilp0yD01m2pUCu/ZCMUZHQQgwBVEsb17
         tt9cGnLCnv4lm4g+U+op+6nPDqAX7TW5bMoQIvsg=
To:     Jason Ekstrand <jason@jlekstrand.net>
From:   Simon Ser <contact@emersion.fr>
Cc:     Tomek Bury <tomek.bury@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Daniel Stone <daniel@fooishbar.org>,
        Dave Airlie <airlied@gmail.com>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
Message-ID: <Y9H86RTKcPvmzxnEtxZ13-XX87Y6YIAbA8qSYhDsYVgAKBp8zVlC342pyTaC7JFJr-s9B4jMtfDPz_I2v9D9fYpKaZtpNOl--Brk8aobnSE=@emersion.fr>
In-Reply-To: <CAOFGe94crnBBvjfP=0W3awUrxu+ZZG1_Q3bO03ti6jBckgTf_g@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
 <CAOFGe94crnBBvjfP=0W3awUrxu+ZZG1_Q3bO03ti6jBckgTf_g@mail.gmail.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, March 16, 2020 5:04 PM, Jason Ekstrand <jason@jlekstrand.net> wr=
ote:

> Hopefully, that will provide some motivation for other compositors
> (kwin, gnome-shell, etc.) because they now have a real user of it in
> an upstream driver for a major desktop platform and not just a few
> weston examples. However, someone is going to have to drive the
> actual development in those compositors. I'd be very happy if more
> people got involved, :-)

FWIW, a wlroots pull request is in progress [0]. The plan is first to
accept fence FDs from clients, then send them our fences as a second
step.

[0]: https://github.com/swaywm/wlroots/pull/2070
