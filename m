Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9FB74CC21
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 07:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjGJFWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 01:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjGJFWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 01:22:10 -0400
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C521D2
        for <linux-media@vger.kernel.org>; Sun,  9 Jul 2023 22:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1688966426;
        bh=JEWoUYTEZzpsQoXmhw33QwAng/A/xG2ymPiflCgyT6s=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=gF1xS0eOLjdKBqwWI6OgWnT1KzLfSyhYBIj9my/9fOzy/J1eGO+Ft7Z4EzUh4IPSr
         V2u6v1h2NEY+BHX2Dxq4oDZjGwJ0bH0CjGNX4W9cq3QnZKfW/bUx8Fxf00GHO4HjvA
         vy+eHIMa5X5s0E0Y/PzDDIMEBjIQaNBnHPNgiUfI=
Received: from smtpclient.apple ([240e:6b1:c0:120::1:2])
        by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
        id 37B2FABB; Mon, 10 Jul 2023 13:13:59 +0800
X-QQ-mid: xmsmtpt1688966039tvy15icwg
Message-ID: <tencent_412DF9D61A18A947B3C2232A9944F48D7006@qq.com>
X-QQ-XMAILINFO: Mwr+zmslTAZDVU18M7S8hoSEcJuKchTy3JAISh6k6Q2ZgdFe8vZScnh7fySDft
         HcSThmTltGUmhhXRL9WM8p4Xn5WtYw93jZRf7E6rFczLypxerEI+my6gOhTUOfk/eyMZrfDpgNs3
         QE2pwPOpSZJvgtIVC2l3L32vSLrWYJyCmmiWbNycVBenDiDbBFuzDU7PgCE7hkKHt/Litocbb3mg
         qazx0T1CVqPLJX4kZES0qvPICS0hKO1mAgnAjLjOELmkAsY2StrwrhVHaMNB8uw1v043nH+ngJuC
         WVSJ3oBYkvkpEHzE0PQS8mVCQlSP6DabHD91LZjEPmh6EvAN35Joe+//xVFmkmlFigotIXrQ1tXV
         IQoFkKRBliXIuQ/tIzKU4q3WLTh3oD52Xb3R9MZz6qLJvN22A66r8RUdmgzusPv2Y+/SFo/wZkOY
         5H0cThLjtaTxRfHtLgzMHsSpDQSsBLsnRH0tIQ9ram/9jtdSyv2Uvy1OgJkvs5mYeEB1KmT81Zbb
         cW8MHdqoHFWppqNIZVeFrb2grqb6pqG0yVjOyz1SLTmFYtmp/qd8Zf1qB0VGG8x12XwcXMA3J26r
         GGZC+eSgTdmvDnuIPvedrDpl+OXbuY31rHMLP64gaDih7xscPntaWNBuOoQ5Vr4Af76q6S7ThrlB
         JM1uGMLQXuaM11l09xaFXF10W/u2zjGqp2LCV8Mk2dAvIf4519rVWpHD2jxDzhsw9PumtLWlom2u
         ZLyPTACWtOnMe45idOyEllL2uJ47Kytqgd9zEtNPTPyoRIFKpkI32+91wmVJ0Gg159kTDn8eopfi
         1R3jveaX6IsMy5/8mevEekkGTgFwZT3lUmTAMvYkIa9xBC2VQxf3T++tWX12eZijM692txt1tEDc
         AwJoTmdU1wsZ5+jgbYw1KyGYMeIFPFCjmzw9zRFUR8l8H7IatGyai3GX6yZwvPry+zSgtLZjHUpq
         G0f8TOM2yp9GspLBzw2gfOUhkDw7+hBHpttssWnkI=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] media: dvb-usb-v2: gl861: Fix null-ptr-deref in
 gl861_i2c_master_xfer
From:   Zhang Shurong <zhang_shurong@foxmail.com>
In-Reply-To: <53c0943dc46a8d17ca66d2c028f40e9a80ca7cee.camel@gmail.com>
Date:   Mon, 10 Jul 2023 13:13:49 +0800
Cc:     crope@iki.fi, mchehab@kernel.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
X-OQ-MSGID: <3F6B2576-C5CA-4D83-83D5-66DC30BC5D5E@foxmail.com>
References: <tencent_0CAE84EB4D452DD8560158AD0792021B6A06@qq.com>
 <53c0943dc46a8d17ca66d2c028f40e9a80ca7cee.camel@gmail.com>
To:     Akihiro TSUKADA <tskd08@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

You are right. I am very sorry for my mistake and I will send another =
patch fix this.

> Is the first chunk of your patch really necessary?
> `msg[0].len < 2` includes the `msg[0].len =3D=3D 0` case,
> so the `msg.buf =3D=3D NULL && msg.len =3D=3D 0` case is (seemed to =
me)
> safely ejected as it is.
>=20
>> --- a/drivers/media/usb/dvb-usb-v2/gl861.c
>> +++ b/drivers/media/usb/dvb-usb-v2/gl861.c
>> @@ -97,7 +97,7 @@ static int gl861_i2c_master_xfer(struct i2c_adapt
>>=20
>> er *adap, struct i2c_msg msg[],
>> /* XXX: I2C adapter maximum data lengths are not tested */
>> if (num =3D=3D 1 && !(msg[0].flags & I2C_M_RD)) {
>> /* I2C write */
>> - if (msg[0].len < 2 || msg[0].len > sizeof(ctx->buf)) {
>> + if (msg[0].len =3D=3D 0 || msg[0].len > sizeof(ctx->buf)) {
>> ret =3D -EOPNOTSUPP;
>> goto err;
>> }
>=20
> regards,
> akihiro
>=20

