Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156626ADCEA
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 12:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjCGLLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 06:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjCGLKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 06:10:48 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA4D3C03;
        Tue,  7 Mar 2023 03:08:22 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id s1so11952408vsk.5;
        Tue, 07 Mar 2023 03:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678187302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Eav3advogQ0nYvVmpeSRoGYuZChj7MY5XbLAOLiRmU=;
        b=EAyxR1Xujr0zty5VMrixSooIKibQuqP0StWq2IagYvWNG3lt0NZsHrwscS9sWLI+J3
         a7sEuB2gvOdxE+AbjIFf2tnQKfSpgR7qQJK0/SgbEEI3uALjDSEfNXZOh3Kq5kFGbWXA
         B9dZZHLJzSCh2GcGW+3Q8q7SVXrRiON0pjlIMswaGR5YbaIuxf/if6waI5egXrnKgMWT
         SXUEjXGtKDxaNGTGn2i8bEWuJJVIQLUoXrLpB040qFixC6RXZphDYqLjZM4c8zMlYuL6
         8PQQSYLo/ZoVyo9CWVH98ht1jrtsVCERI0I7kZWp5V2VIT4MneOExI54liJBVpaNeRBX
         2lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Eav3advogQ0nYvVmpeSRoGYuZChj7MY5XbLAOLiRmU=;
        b=g5fa5KWzkZrm12HavEeI/rkMwLC5JSN6uxZdYsxtvC8vG+Z2pRPSpdgn1mxokzZtUP
         ywG+WoSZC1Dw9TEE/F5edspDj8m+uq1DHJMzSJLCySzgfEC/GoBkKjcA41zdTLUCGGzN
         +8Ea+XCJpypJ0mdJB7eQuCPGccUyK9oQURyp/ohHfvBtyfteARA56yt39/ughwJm0SSp
         MlSU0m8WL2YyEbvzQTmBLQLbNc2JHVuBErczsEwnG2DD2bQX11yjG++zobWOo5YnEnni
         yiLTzSJRSkBk2ntByEpewO22S4ekbWcIELXoDjzGowyIuz2u23MBe9er6skS4IZf86ia
         Gr3Q==
X-Gm-Message-State: AO0yUKVczNdZnFCYvsXYDkm8ppEvJmqF65A8OP4gSkWgX557bmTG06zd
        yafhkS/Jyirt4ZaRWolN8ONYyTsRxKH+8gkETI8=
X-Google-Smtp-Source: AK7set/OumrnkvhmuFiKYFc0Wbi5u1tUSOJ4dOkchw5iWH3l7TaOt2ET2Dbd/AAAZguiCriJKKL2ImvPIdnDE+4MzxI=
X-Received: by 2002:a05:6102:2146:b0:411:c07e:f666 with SMTP id
 h6-20020a056102214600b00411c07ef666mr9358130vsg.0.1678187301903; Tue, 07 Mar
 2023 03:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20221117045925.14297-1-imv4bel@gmail.com> <87lema8ocn.wl-tiwai@suse.de>
 <Y/YXbNgBhhWhfjwS@google.com> <Y/3mT9uSsuviT+sa@google.com> <20230307103659.GA347928@google.com>
In-Reply-To: <20230307103659.GA347928@google.com>
From:   V4bel <imv4bel@gmail.com>
Date:   Tue, 7 Mar 2023 20:08:10 +0900
Message-ID: <CADUEyCwiddMq+4e9yhZS=-0t1BZktvmd1J-mZFBM5uzg-0kgHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
To:     Lee Jones <lee@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>, mchehab@kernel.org,
        kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev,
        "v4bel@theori.io" <v4bel@theori.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear,

Sorry for the late reply.
This patch hasn't been reviewed in a long time, and I had completely
forgotten about it.

I no longer have the emulating environment I was debugging this in at
the time, but from looking at the code it appears that the
vulnerability still exists.
This means that this patch should be reviewed by the DVB maintainers,
but my guess is that, as it has been, it's unlikely to get reviewed.

Regards,
Hyunwoo Kim

2023=EB=85=84 3=EC=9B=94 7=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 7:37, Le=
e Jones <lee@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, 28 Feb 2023, Lee Jones wrote:
>
> > On Wed, 22 Feb 2023, Lee Jones wrote:
> >
> > > On Tue, 10 Jan 2023, Takashi Iwai wrote:
> > >
> > > > On Thu, 17 Nov 2022 05:59:21 +0100,
> > > > Hyunwoo Kim wrote:
> > > > >
> > > > > Dear,
> > > > >
> > > > > This patch set is a security patch for various race condition vul=
nerabilities that occur
> > > > > in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> > > > >
> > > > >
> > > > > # 1. media: dvb-core: Fix use-after-free due to race condition oc=
curring in dvb_frontend
> > > > > This is a security patch for a race condition that occurs in the =
dvb_frontend system of dvb-core.
> > > > >
> > > > > The race condition that occurs here will occur with _any_ device =
driver using dvb_frontend.
> > > > >
> > > > > The race conditions that occur in dvb_frontend are as follows
> > >
> > > [...]
> > >
> > > > > # 4. media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
> > > > > This is a patch for a memory leak that occurs in the ttusb_dec_ex=
it_dvb() function.
> > > > >
> > > > > Because ttusb_dec_exit_dvb() does not call dvb_frontend_detach(),
> > > > > several fe related structures are not kfree()d.
> > > > >
> > > > > Users can trigger a memory leak just by repeating connecting and =
disconnecting
> > > > > the ttusb_dec device.
> > > > >
> > > > >
> > > > > Finally, most of these patches are similar to this one, the secur=
ity patch for
> > > > > CVE-2022-41218 that I reported:
> > > > > https://lore.kernel.org/linux-media/20221031100245.23702-1-tiwai@=
suse.de/
> > > > >
> > > > >
> > > > > Regards,
> > > > > Hyunwoo Kim
> > > >
> > > > Are those issues still seen with the latest 6.2-rc kernel?
> > > > I'm asking because there have been a few fixes in dvb-core to deal
> > > > with some UAFs.
> > > >
> > > > BTW, Mauro, the issues are tagged with several CVE's:
> > > > CVE-2022-45884, CVE-2022-45886, CVE-2022-45885, CVE-2022-45887.
> > >
> > > Was there an answer to this question?
> > >
> > > Rightly or wrongly this patch is still being touted as the fix for so=
me
> > > reported CVEs [0].
> > >
> > > Is this patch still required or has it been superseded?  If the later=
,
> > > which patch superseded it?
> > >
> > > Thanks.
> > >
> > > [0] https://nvd.nist.gov/vuln/detail/CVE-2022-45886
> >
> > Have these issues been fixed already?
> >
> > If not, is this patch set due to be merged or reviewed?
>
> Still nothing heard from the author or any maintainer.
>
> I'd take this as a hint if I had any social skills!
>
> Please could someone provide me with a status report on these patches?
>
> They appear to have CVEs associated with them.  Have they been fixed?
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
