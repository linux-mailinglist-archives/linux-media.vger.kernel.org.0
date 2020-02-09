Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B511156C08
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 19:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbgBIS0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 13:26:20 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:47019 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgBIS0U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 13:26:20 -0500
Date:   Sun, 09 Feb 2020 18:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1581272777;
        bh=MzjLn6J/wE/n8CGcKBz+chhgLW9dAzTv6jT3ub5OgLA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=wvHeUsjjEUksZA1m1G6v8UXWf6uVjQO8v+UIYIZQDNS0E8TCd8z9t/5zOi/Wkx0dZ
         ssnq2h3j9ayehc7Xi6mJWVY9SmojAdLNvGze+secgokXOur88FUFrvsyMGY1GHgsv6
         AY7bhyvItVBqjlNQijPvwILTA5RXn9JH81fDk8N4=
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        lkcamp@lists.libreplanetbr.org
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH 0/3] media: vimc: Add support for GBR and BGR formats on source pad of debayer
Message-ID: <20200209182556.dkey2zlqg3u2a4um@ArchWay.local>
In-Reply-To: <CAAEAJfDGicyS9RGkLfPEBP9FCVHiu4tYsnq+BKPsez7pWSxXXQ@mail.gmail.com>
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
 <CAAEAJfDGicyS9RGkLfPEBP9FCVHiu4tYsnq+BKPsez7pWSxXXQ@mail.gmail.com>
Feedback-ID: cwTKJQq-dqva77NrgNeIaWzOvcDQqfI9VSy7DoyJdvgY6-nEE7fD-E-3GiKFHexW4OBWbzutmMZN6q4SflMDRw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Ezequiel.

On Sun, Feb 09, 2020 at 02:09:17PM -0300, Ezequiel Garcia wrote:
>=20
> On Sun, 2 Feb 2020 at 12:50, N=C3=ADcolas F. R. A. Prado
> <nfraprado@protonmail.com> wrote:
> >
> > The objective of this series is to add support for GBR and BGR media bu=
s formats
> > for the source pad of debayer subdevices of the vimc driver.
> >
>=20
> Can you elaborate why is this needed, e.g. what use-case is this enabling=
,
> or what is this fixing?

Sure.

At the moment, the only supported media bus format on the source pad of
the debayer subdevice is the RGB888_1X24.

The mbus format of the source pad of the debayer ultimately determines the
pixelformat that is streamed on /dev/video3, since:
    * The mbus formats of the links on the topology have to match for the
        streaming to be possible, and [1] shows that the source pad of the
        debayer links to the sink of the scaler.
    * The scaler uses the same mbus format on sink and source.
    * The source pad of the scaler is linked to the /dev/video3 Capture.

That said, there isn't a GBR pixelformat, so it uses the RGB pixelformat.

So what this patch series enables:
    * Setting debayer and scaler subdevices to use GBR and BGR mbus formats=
.
    * Stream video using the BGR pixelformat from /dev/video3.

By enabling these, it makes it possible to use vimc to emulate hardware tha=
t
uses GBR or BGR mbus formats internally or that streams using the BGR
pixelformat.

Regards,
N=C3=ADcolas

[1] https://linuxtv.org/downloads/v4l-dvb-apis-new/v4l-drivers/vimc.html#to=
pology

>=20
> Thanks,
> Ezequiel

