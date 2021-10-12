Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675C6429F01
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 09:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhJLHyI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 12 Oct 2021 03:54:08 -0400
Received: from ni.piap.pl ([195.187.100.5]:52060 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234410AbhJLHyG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 03:54:06 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu> <m3zgrlkxn6.fsf@t19.piap.pl>
        <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
        <m3v924krpr.fsf@t19.piap.pl>
        <YWPaOjbBZ0wmJHHM@pendragon.ideasonboard.com>
Date:   Tue, 12 Oct 2021 09:52:00 +0200
In-Reply-To: <YWPaOjbBZ0wmJHHM@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Mon, 11 Oct 2021 09:31:22 +0300")
Message-ID: <m3ily2lly7.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I understand it me who wants the code merged, and therefore I'm in the
lost position, but this is the matter of principia and thus I need to
voice my opposition :-)

>> I could. The question is "why?" IMHO the C++ style is (in places I use
>> it) better than the /* */. Why should I use the worse thing?
>
> It's also a matter of consistency, to try and unify the coding style
> across similar drivers in a subsytem. In this case, the media system
> frowns upon C++-style comments.

Ok. So it's better-worse vs consistent-different. IMHO, consistency is
a good thing, when you don't have to sacrifice quality. Things should be
consistently good (rather than consistent for the sake of it), no?

Perhaps you don't consider (these) old-C comments worse, though. I do,
for the simple reason, they use more space. I give up because it's
a small thing, but I shouldn't have to.

> Code is written once and read often, so you should consider the coding
> style in use in the subsystem.

I do. But... don't you think the "rules" go WAY too far?
We have the coding-style for consistency. IMHO it also goes too far from
time to time (and, as shown, I'm not exactly alone in this). But coding
style is based on some consensus, discussions etc. It follows the ever
changing needs (like evolution of display devices).
We have the checkpatch (imperfect, of course) which is meant to check
for potentially harmful deviations.

Now there is the "subsystem coding style". What is it based on? Who can
challenge it and how? Who defines it? Where is it defined so it can be
improved?

>> But it can't do that, can it?
>> This could be adequate for a sensor with fixed pixel clock. Here we can
>> control pixel clocks at will, how is the driver going to know what pixel
>> clock should it use? Also, the "extra delay" can't be set with
>> V4L2_CID_[VH]BLANK, it needs interval-based timings or the "total pixel"
>> or something alike.
>
> Additional controls may be needed, I haven't studied this particular
> sensor in details, but in general frame rate is controlled explicitly
> through low-level parameters for raw sensors, which means controlling
> h/v blank and possibly the pixel clock from userspace. The
> .g_frame_interval() and .s_frame_interval() operations are deprecated
> (and should never have been used) for raw sensors.

The problem is *interval() are currently the only way to accurately
control the timings. There is simply no other way - short of creating
private controls or changing the upper levels.
Now I don't say we shouldn't change the upper levels - but all I want
ATM is having the driver for a simple MIPI sensor merged, not fixing the
entire Universe. Trying to have the driver merged already takes a lot of
effort.

Sure, I can remove the *interval(), crippling the driver another bit.
Should I do it?
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
