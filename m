Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D9A18CC73
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 12:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgCTLMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 07:12:19 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52011 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgCTLMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 07:12:18 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MwQGj-1jVx2Q3zC1-00sR4z; Fri, 20 Mar 2020 12:12:00 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id D346464D8E7;
        Fri, 20 Mar 2020 11:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hbhxwVzTYJeb; Fri, 20 Mar 2020 12:11:58 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 7E4DC64BDF2;
        Fri, 20 Mar 2020 12:11:58 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 12:11:58 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id DDC578050D; Fri, 20 Mar 2020 12:11:57 +0100 (CET)
Date:   Fri, 20 Mar 2020 12:11:57 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] media: adv748x: add support for HDMI audio
Message-ID: <20200320111157.GH4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <252bb433f47b0ccb61bb077abdbd892091abc550.1584639664.git.alexander.riesen@cetitec.com>
 <CAMuHMdXOAQtuxCAfb=sZKodyJWwSrf-GO-pdV3HYkOytQW4ENg@mail.gmail.com>
 <20200320105846.GG4344@pflmari>
 <CAMuHMdVRJZ+RLSxeFdXXPntVxCUMd-Ai+=vizFrvN-CHNW=kjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVRJZ+RLSxeFdXXPntVxCUMd-Ai+=vizFrvN-CHNW=kjA@mail.gmail.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D776A
X-Provags-ID: V03:K1:YmOpyUa1MX2lar3B2/y59QLL71WDNBwoqzE32XfFiajWx1ZGlRb
 n0Eu/6ecTjm7w+oQXq5gUy4REoDz0ZOaz3lXwPFzceyx6i7mL99o2f0ImAoZCEkYuLakZuR
 GW6GdLy7a4CbkUqoEzP8MjkSf5f9JpKK+OS77rsxVyJ4VH7QTOPXsk/OnQthu0g7y/dP482
 p0UYIgjNFGv/Sk0tSyKfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/NT0LgJThw=:vTOcMP6mPnOiUJk3sPV2D6
 PPwbPAoPvfmF8jrgslYHjumhiEy9NIQNL7LUhRo0RmsC8CXbpAxhZUXU9pAg4Uv4SM+mkL1S0
 WQAYI5jFCgHWbk+FpTgBChzx7xD2WB5kiNvcVInp9fy/IGUnavrsgAH4SXs5nY7L78WTceQoB
 m2HAeXIjGF8y6EXKGL5j/nw7ik2miuvsVvkLUH+v7Zeuuv+ncyspaXaVbqxhvvTXWhL6671qS
 bexNOEWYOFeawVs62Fax4KoLGVtHHZDK3qRFD7mCUXLPMhSJ3HoDvcWX946YFPrRQUBCiC8Ze
 BxFuYYYCTQu7bKqLufipPxeJ7wX/5Cmsr7h28wBq4m54cDsg5KRXZgZ8ZvoYny0DrMa8dbz/B
 RWBXsEQQoraQeAR6KXtht7dySHtafFRg1m134QLqoZiwGlLNVcmKa+nnLJZ0YUpjX1RUu3rcn
 gV+s0txu7tJLbk0+N0lFEuvdXp3fuQGVQfmV7fFq4Yns9iIsc3HaGvXmm96wNsy7jJmkfK0ba
 yv8oKhKcbAMK1cBnZlAupU60+IwegjFM/WWwKtzPMtu9kZqHpNj4/gq+hvwhn5FEamMWnpl1S
 EVowToSwyOu+ShGWHxAPSXIokoQf4nSCpBrp/pxeLHmSDAoXpvy4iEJpPQ52BWGjFNZgYK6gX
 F8sp8mQKhRn2rgS5loGD/7Z+QXBR05UYm9OXcrGIN1CLDI4eQ3CW+QQq4rIDyQkf842NQ1Ma8
 HeJ0hIdSWwOHyIR7uSWFpJ7o3exySMgGAJaUl5LnEfHUVc59aNZGF7lAjh7GjCypwV8LaCoiO
 h1uVdSsu6t+PgwFH6l/GH2OT3SlaqUgmEeNswRE11n7kdNNH2aWq1Tx5l2/B4i40XggL7fI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Fri, Mar 20, 2020 12:05:20 +0100:
> On Fri, Mar 20, 2020 at 11:58 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Geert Uytterhoeven, Fri, Mar 20, 2020 09:43:29 +0100:
> > > On Thu, Mar 19, 2020 at 6:42 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > This adds an implemention of SoC DAI driver which provides access to the
> > > > I2S port of the device.
> >
> > I just noticed I don't do clk_prepare_enable anywhere.
> > Shouldn't the clock master enable its clocks somewhere?
> 
> Usually the consumer is responsible for doing that.
> Does the rcar-sound driver do that?

No, it does not (verified by /sys/kernel/debug/clk/clk_summary during
transfer).

> But in this case, perhaps the clock should be enabled implicitly in response
> to a request from the audio subsystem, like you do below.

Ok...

> Note that you register a fixed-rate clock, which is assumed to be always
> enabled. Perhaps a gateable clock type is more appropriate?

The gated clock implementation requires use of an I/O register, which I don't
have in this case (an I2C connected device).

I considered implementing full clk_hw set of operations, but decided against
it: it's a lot for this simple configuration. Few other drivers do that, too.

Regards,
Alex


