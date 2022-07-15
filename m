Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416555766D1
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 20:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbiGOSfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 14:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiGOSf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 14:35:29 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEBC7538A
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 11:35:28 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id r17so4385960qtx.6
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 11:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=80WLi0stPR2i6nOc1Mwcvb1CVOC1M+M5OPd7XIovUVc=;
        b=rYyeY3gxCgC33k1x9z48ioadmS0AHhKc7dOxPq9MnnQg7TVC4YL5nqXlOyZ50tHcxx
         qNjvlPNvS1sgCA9j/EU8rsBZEy86dR2HOqwGsZiWCZ+mUrF5g7pGF7TIktq52j76aAlX
         IHdqv94ba6aZLwMtji5XYmJq0nXVbHap8IfEqz7rUKaK/NQPvqkFdF1CT/zuQzzQT+bd
         rNN+o4wd+CDVoJcni6uNKOV2zuPWMyGFtdPWZNFSaSSTmmZWvq/hcGQK3OYkjvOpKowU
         iKdNsnuNRhVknivnaExM/4KlHCXh0VjZrqhH55dgkSo1ZuVSecOk6/Ck8L6LhdfYbX4S
         Z87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=80WLi0stPR2i6nOc1Mwcvb1CVOC1M+M5OPd7XIovUVc=;
        b=x8SgzRjHQyjETes2MUGwN43egVGGKbwsXybRaYpIn81Kdqt74lRTiokZXjiHpXMxlZ
         wgwlBK1HlsiAQNYPZuQ0gj2Egsr4iAqoZsmYJG8EHLmrSVkKlGivJHtmE6OcHtNow6sv
         pPAei7Ew4LoT2/tg5EtQKRTcJ6YukP5gk/mYw9co36umb8HEwmygilsq3K0oGRi6NTTx
         f0mttdoP+T21+cWYO3zOLamqNU3Z/bH2l/70dLL8qHRvQGqbhp3UgPgXLWT+IWxDN/i8
         QM9Za87Ic9IJjjgsxy16RBebLXtutT0eca6vLmzKPCHyJTkHj44UeMQKsacs+byjXtx7
         LfMg==
X-Gm-Message-State: AJIora94o3afDLjStoVbpDHDTcS2ZgSnNQAdO4BNkp0qivt4H0jT/T7P
        S2NU1xyw3tgPchgkaw/tfTWZdA==
X-Google-Smtp-Source: AGRyM1vncthWeCqExW1MsskaMOEBsKxPUgifS0y7LBmFh23H7S4zwaWbPYA1pOdSHC3N4gFKztiDgg==
X-Received: by 2002:ac8:7c4a:0:b0:31e:b5c2:9284 with SMTP id o10-20020ac87c4a000000b0031eb5c29284mr13302463qtv.105.1657910126771;
        Fri, 15 Jul 2022 11:35:26 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r9-20020a05620a298900b006b5cb5d2fa0sm3665179qkp.1.2022.07.15.11.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 11:35:26 -0700 (PDT)
Message-ID: <b9dd5f10a56e80c0bc4fd0595cb6c050350a9799.camel@ndufresne.ca>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Fri, 15 Jul 2022 14:35:24 -0400
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Le vendredi 15 juillet 2022 =C3=A0 10:15 +0200, Hans Verkuil a =C3=A9crit=
=C2=A0:
> Hi all,
>=20
> The Linux Foundation organized a meeting room for us to use on Monday Sep=
tember 12
> at the Convention Centre Dublin. It is co-located with the Open Source Su=
mmit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for mor=
e info.
>=20
> To attend this Media Summit no registration is required for the OSSE, but=
 you do need
> to register with me by sending me an email. There is a maximum of 20 part=
icipants.

It will be pleasure to join.

regards,
Nicolas

>=20
> I send out a request for topics in May and got quite a few replies:
>=20
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.came=
l@ndufresne.ca/T/
>=20
> If you have more ideas for topics, then reply either to that message (pre=
ferred) or this
> one.
>=20
> See here for more details about the conference:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/
>=20
> It is primarily meant for media developers to meet face-to-face. Whether =
there will
> be a possibility to participate remotely is not certain at this time. Pas=
t experience
> shows that meetings like this are a poor fit for remote attendance, unles=
s you have
> a meeting room that is designed for such purposes, which we don't have.
>=20
> The actual agenda will depend on who will attend, I hope to be able to pu=
t that
> together around mid August. But the link above with the 'Request for Topi=
cs' thread
> will give a good indication of what to expect.
>=20
> So, if you want to attend, then let me know by email. Please reply as soo=
n as possible,
> even if you are not entirely certain yet if you can attend.
>=20
> The health and safety regulations will be those of the OSSE LF:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/attend/healt=
h-and-safety/
>=20
> Code of conduct:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-=
of-conduct/
>=20
> A final note: the total cost is at most $650 (depends on the number of pe=
ople):
> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda,=
 water).
>=20
> It would be nice if this can be sponsored by one or more companies. I'll =
ask
> my manager if Cisco can contribute to this (once he's back from vacation)=
, but
> if other companies want to contribute as well, then let me know and we ca=
n
> split the bill. And start off the meeting with a nice slide saying: "Spon=
sored by:".
>=20
> Regards,
>=20
> 	Hans

