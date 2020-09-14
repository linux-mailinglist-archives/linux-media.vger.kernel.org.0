Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA08268989
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 12:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgINKp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 06:45:56 -0400
Received: from sonic302-21.consmr.mail.ne1.yahoo.com ([66.163.186.147]:37947
        "EHLO sonic302-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726497AbgINKpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 06:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1600080353; bh=dGwizWYnZGK91DDxdP+Qz2TpW7F6J5jDYhhs+LKiHMg=; h=Date:From:Reply-To:Subject:References:From:Subject; b=kz/LcmKRGM9/qB0Axk4AVQ8KdLEyHIJ9UTwsl4PXJ3YfPx45P7RXBPCA6O3q/4RUWi/13RwCBN8q/iWEg6/nYJC7o7AvURr3EvbkN5/zRia4oTQ8HsbL7TUoc7y9BqffP9A8O0Adli6skEXQV+PLPrcyXSDLX7Am5cWQOffOFZiAHTaeHIk/tHHUMol4Upd5rCj0Nv1D1jElqwXvCuuVCmIRwKTtBxuU0d4JfLN/sbw/0gCGmqsxxp3CcTfwG2hUjhRBFZ3W5ddZepUsPMHhQ4Xf8NyfHYOAJ3+MUcoqv3bPs7wV4jBn+R40tbXU42s+0Kji+iW9mcpyJgL6QnppBQ==
X-YMail-OSG: feZQYvQVM1mgYYP6Wu0KiLB7z11yyVU.MBy7eaH0xcIpPpIml0HEGRr_LDq1LAM
 raY9j6CzKLCw2SeuzYjUGXTUUFlpsEd6htYYo7lqcQi5y.rKYqv57cdDSHaqVB1LSm5CTJ_aXUIq
 PqfMkVMouDKZv2m1NVRrdi1L67Nh8Udtm9YH8lJqmhqUeTbCDQymWr_.DjPjIh1CHNNrLD8xEUXf
 IivNNuBPrIZrNZt9X2XbiQ3mN7MxoclTtTnMiR_6NVNn.Q5DL1Xfgh2pavsIDpxYm2vPIQ1Y8lIp
 sKHRgKAKObMEsOMRPd1jEeHGQoXoYsvW.21E.Y4tNK2kfhG3WBumjbSCy_Uvlg0w2HR0qPklPhIt
 8ReQQ8kC.j_k2yjkELyapvKqlEvy0grjxdnvgij9p0JU5bcbOnrVs65YAJL9s01IJJO5mI0U72EV
 ynDvrGzI2acrOd7mEGhiOXevnNDguC4tik0HN4UYEkM_mBDuqEWgD1HWHmFmtKxVeJypK2WGSSoJ
 jxQ8fg.l0CJJ9QulXggtuLEba___WlCTjeXSqHCQBoB_fD42lrSINDqffIX5nscDmly9ZPxFSQ3r
 jWaWDPOWgY9ijHWM7oBjf3rD.Wf9rUXgh6UlsXdLdb0Ms3NeW3tvcw_kZf3OqFtyLW97Xt0Pw7hs
 QobwJxBSwVhCqwijgIJSxmdWb5YGl9IR96fjom5DxzQ39MRjP.bUAchoeBLaCjnd5GWSSf.p9_Hd
 rAbYfenreDrERcZLQbassNsazqp2PTk83jYcRiTp7UAXkcXnoLPcCzJx.rGdUDzlQCPOHAYiphaM
 K0IUTrXpnsLc2E6N.D0BP7oHjSN199t8LZyVauO34yqHfqC9.yMtrbNEXrLuNKQnmYBXJtydWCe5
 v9J1LiseKo6EjP3iIpMiOyMC2YYUQHfG.l4hdcMuKXdT6AzxBV27oyNCa4H33wAFBzdClnbZAgPc
 nmJv_yhMlMZvqQw7RohEmadQ9uf4WrVa1KDj3Ccy5BFUIuidNT2iT4iZ9sfLExTsjGQVBSbhe6JF
 6elwXsrVX7hgzN9tsDv4zIWCLawE7BO7Sz4_NPb22lBui6VGcSdDb9cW3m6n.AjJkPGPkYKXof3a
 PDHgC548Ed1KaIEvioBs0KL4WkbKTKZXJjLDLiI3Cz0tpOZMPX.3x.Eb7XzxtRAbp1Eqpjr2SVa0
 JgxbPYmR6u777ysREm3fQsK2fxgs8aUGTSt0RWrkHneRjNH_t62uTXaD8PqU.okyxCE8Iyi0TTKD
 Ut6lYZL8UXWAL2428TX2L3mRYZ5xAV92j4Cwh9CwFpWYugJFucu_hz5kRVSOR9kSbFC2Hcto1Vik
 HRfAjuh.EJXxti0ovMFKnk_sIbO7g4Q4WemGvyem5k2bdGZr4AX7evdLBs1fAbNwX01ZalXfTlr3
 Gu6TZZ1t4ycMsGdiSQDmFBUXBstbjfHxwPVS6x_pHo67BWhuelA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Mon, 14 Sep 2020 10:45:53 +0000
Date:   Mon, 14 Sep 2020 10:45:52 +0000 (UTC)
From:   "Mr.Ahmed Muzashah" <ahmedmuzashah11@gmail.com>
Reply-To: mrahmedmuzashah@gmail.com
Message-ID: <1303475663.1957632.1600080352405@mail.yahoo.com>
Subject: =?UTF-8?Q?Sch=C3=B6nen_Tag,?=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1303475663.1957632.1600080352405.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sch=C3=B6nen Tag,

Bitte entschuldigen Sie, dass Sie einen =C3=9Cberraschungsbrief geschrieben=
 haben. Ich bin Herr Ahmed Muzashah, Account Manager bei einer Investmentba=
nk hier in Burkina Faso. Ich habe ein sehr wichtiges Gesch=C3=A4ft, das ich=
 mit Ihnen besprechen m=C3=B6chte. In meinem Konto ist ein Kontoentwurf er=
=C3=B6ffnet Ich habe die M=C3=B6glichkeit, den verbleibenden Fonds (15,8 Mi=
llionen US-Dollar) von f=C3=BCnfzehn Millionen achthunderttausend US-Dollar=
 eines meiner Bankkunden zu =C3=BCbertragen, der beim Zusammenbruch der Wel=
t gestorben ist Handelszentrum in den Vereinigten Staaten am 11. September =
2001.

Ich m=C3=B6chte diese Mittel investieren und Sie unserer Bank f=C3=BCr dies=
en Deal vorstellen. Alles, was ich ben=C3=B6tige, ist Ihre ehrliche Zusamme=
narbeit und ich garantiere Ihnen, dass dies unter einer legitimen Vereinbar=
ung durchgef=C3=BChrt wird, die uns vor Gesetzesverst=C3=B6=C3=9Fen sch=C3=
=BCtzt Ich bin damit einverstanden, dass 40% dieses Geldes f=C3=BCr Sie als=
 meinen ausl=C3=A4ndischen Partner, 50% f=C3=BCr mich und 10% f=C3=BCr die =
Schaffung der Grundlage f=C3=BCr die weniger Privilegien in Ihrem Land best=
immt sind. Wenn Sie wirklich an meinem Vorschlag interessiert sind, werden =
weitere Einzelheiten der =C3=9Cbertragung ber=C3=BCcksichtigt Sie werden an=
 Sie weitergeleitet, sobald ich Ihre Bereitschaftsmail f=C3=BCr eine erfolg=
reiche =C3=9Cberweisung erhalte.

Dein,
Mr.Ahmed Muzashah,
