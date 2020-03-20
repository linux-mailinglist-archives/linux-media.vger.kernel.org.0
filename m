Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB79E18CA0C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 10:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgCTJS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 05:18:59 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:58961 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgCTJS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 05:18:59 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8oKc-1jJ3Yc3k5W-015r6q; Fri, 20 Mar 2020 10:18:40 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id EBBAB650318;
        Fri, 20 Mar 2020 09:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id voGX_lM8VBY2; Fri, 20 Mar 2020 10:18:39 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 844C76502D9;
        Fri, 20 Mar 2020 10:18:39 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 10:18:39 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id DDDCC8051E; Fri, 20 Mar 2020 10:18:38 +0100 (CET)
Date:   Fri, 20 Mar 2020 10:18:38 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
Message-ID: <20200320091838.GF4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com>
 <20200320084406.GB4344@pflmari>
 <CAMuHMdUdVb0LwZDx-MH2FLYYPvgq=uj_3Nrzo9obWAi-Q-2ZnA@mail.gmail.com>
 <20200320090339.GD4344@pflmari>
 <CAMuHMdVtsdNg0s5fio8GAhHGV9H+1J=xvuCXj5VdZ6gwqxGrZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtsdNg0s5fio8GAhHGV9H+1J=xvuCXj5VdZ6gwqxGrZw@mail.gmail.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7764
X-Provags-ID: V03:K1:UD3H9nm06ueJnhtVW/e4IKecjYz2lfcqKCtaVs10dQfYkXHJSLr
 5UwckNcdYRuRsnKEuzMB8p2oZ+VGmR5pd2RwlGVmFpoPKFKQWT9jpYhxJFQH8aD8xcuZKXN
 hA0V47rVH07yGnxO8ROIV12I6kGmwA9xCdzBNvPbpGJFs6dJKLZCSwtmuusZ/B7U4HkeBBP
 obBxzY0cVduplHZGRD0Eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cknyt3KqoPU=:iP7ZfHpr90I7ffEQ3Mu/uA
 jMG/+K0gBry/+zAn5gUV94JWhIa7dIV7JWBVOQYTxcO+b1A/SiJG9xZsgZR+yM9wnqhGMJ3RU
 52rnFoxOmvJS8EBAIUEY+MnIenA7N2QHE5VeNLsQbOxZke/KHagSU9Rdki6AGr8WK8kfM1tOV
 qNuLOdfaqsX/RXvNRngKMq75qmMRfyVu79M2qDg+EkHEdOPU6DI7NQCRwXQSwaY7AzQysdasO
 Uyhehd7+vzmngiSpDAriar0cwQzPSfbSaYL82jIwWTcDelN4XQMB8jzrnYVfEkr6DmYZO7RsX
 uWU2QbVlNiRM10AIu9VD6Budqs/C9fi6jN7rf72aSN0pBS1mFoZUmjHiXFTsWGqC/nMe3RVRt
 i9SIbnA970iP4AboFmzIEvzM6dMq8h7U3TVp/U2Z+vjXs07WyPGhAbSM36bKcuOTYVwonChk/
 H4mIxjrj85kDD8qDShP7ty6FaFdzzqUzaHKrotg+1Sc4ozu9LQ0JFHGb82r93KOI5IIN2Xl2R
 Dv2rqI/SjQ13ZMIQVZCS1b9S0+SUNgSDNZe4eSbei0MMnH3HOFMiVk23jBqF7++Tcuxp8tYb9
 Zbtr8mfbT4y3W3BjLAPzSTXWlQMfkfXsqHboG2epGRQpFFTKD/sBUytUI5eqcc3+RRJZol9dl
 9iHbpt7q+nGuDlYYKWuBtsXkUTmUYddgGBZU1/wjabelBwFIWZ4NYWGJ10zL/UvgsXHVf2xbg
 FKUDVeYcpPcAVVUJcA7LswA/udS3CqPPLpBV7S8TOuVUWUx6xg+O4g6z42PJ8jNT6VHE+hKg2
 /GLgOsIU4PHvYwLaWKQqfImedjY3JTPENwNA3l/GYUsd9Du+GsUoiKC7BtmCbkOIYgNzpjy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Geert Uytterhoeven, Fri, Mar 20, 2020 10:15:17 +0100:
> On Fri, Mar 20, 2020 at 10:03 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Geert Uytterhoeven, Fri, Mar 20, 2020 09:48:14 +0100:
> > > On Fri, Mar 20, 2020 at 9:44 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > Laurent Pinchart, Thu, Mar 19, 2020 19:01:25 +0100:
> > > > > On Thu, Mar 19, 2020 at 06:42:36PM +0100, Alex Riesen wrote:
> > > > > > As the driver has some support for the audio interface of the device,
> > > > > > the bindings file should mention it.
> > >
> > > > > > @@ -16,6 +18,8 @@ Required Properties:
> > > > > >      slave device on the I2C bus. The main address is mandatory, others are
> > > > > >      optional and remain at default values if not specified.
> > > > > >
> > > > > > +  - #clock-cells: must be <0> if the I2S port is used
> > > > >
> > > > > Wouldn't it be simpler to set it to 0 unconditionally ?
> > > >
> > > > Would it? If the port itself is optional, shouldn't the clock be an option
> > > > too?
> > >
> > > You'd be surprised how many board designers would consider this a cheap
> > > 12.288 MHz clock source, without using the I2S port ;-)
> >
> > Well, I am :-)
> >
> > Especially considering that the driver will not switch the MCLK pin aktive
> > (all I2S-related pins are tristate by default).
> 
> OK, didn't consider that.  But that still won't stop the hardware designer.
> E.g. on Lager, the clock input of the PMIC is tied to the clock line of an SPI
> bus, so to use that feature, the SPI clock must be kept running all the time,
> not just when doing a transfer.

Well... Maybe there is a convention to spell out the default state of the
clock lines?

> > And how do I require it to be set unconditionally? By just removing the
> > "if ..." part of the statement?
> 
> Indeed.  This is still the plain text binding, not yaml.

Conversion to YAML is on the list :)

Regards,
Alex

