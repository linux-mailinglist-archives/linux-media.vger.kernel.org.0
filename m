Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF021BD2D5
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 05:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgD2DQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 23:16:04 -0400
Received: from sonic308-10.consmr.mail.ne1.yahoo.com ([66.163.187.33]:40214
        "EHLO sonic308-10.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726560AbgD2DQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 23:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588130162; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Yde5fEAydJcaCiiCxIBT4YY8SrRkahAC/+IR35qVZsWSXKw/FFMS/9ZzEqogGF8pughxs+K5IRDRV337tHeWjDUqxavSidgJ38OT7mViBMMO0K1H+1qKZrt7GhqY+Z0zoKrMvSNpSao6d35IUF0CWuU+GdTZoaGRXBtCt/PkEM+B56lSZ4JAHOKKChQSICPXLM/+hGWEFsmJAlMXXZkLeTt2mEkm8avLvzkFUttl4xpeUoaAjJJXe0dV4eEWR6tztm2S7X8qMLgBK3dkbLmBxtQNJD/MFZGCyie51xWCfFC+jRORsYwQY8kLZ6hYdPV5B3lh+W/Rbs8SuUdzDtxnUg==
X-YMail-OSG: mixw9AgVM1ltJRP_mXBqWmVujtwwLelAc1v0VjHyfE6TyU9VlEI0DRogJgSEZI_
 t1cWKA140MpoyXYrV7rGaPl6xfT71uNItlH.YJfa5ZWMhOm..S9CvroF5JTtX0YOyoMGmoNVSscq
 iXbjG0giebB1KAFewj5K7nZ7_OpE5AVEcOkv2muwH0ietiAcP2l6G0Yg.z8PzlZKrDIV..zd.Sfn
 7dLg1799Vu3T5qM4WTJb5iyWe4DAaagDQfQF6k0sAfNqpo0raHMefOTfqfi9mot03AmZL98ceW37
 tQPf8mxeKYkDmqM6ioxDKRjeGglsTOALxt3l6BjUMUyOcpYt7203_TONUma5srf2Dob92gvQBGKU
 sdd53JwHj33DqLeguN9OJUjpjTrPibicyZ7Xv_OYGiS.dx00O8qbP.SfqMvXB.Ics91U9Iv7KDUo
 Nx9VjhAnZstgO3zlgOWxMsbKSnY3PPdOKsB35.hLZtQaiPvaX45lg_fQb1CYaT3o2Tim5ymyAkdC
 DagDiaa1LJz45EAEusOn69LhPhPAWxEtU16088Pmca_zWplvRaHEkZZ6AACsiEy9y5wGtH1EVdrs
 tDD2ENRJ6qfqaSBnFZAy9.5.6cW_2iBBfgkQA4O7nIuz4w5dmoL.iMfE5Q2aSb1uN88_PPlBuxq7
 yWwRGEnckHhAu8jAqq7vtZ3.QSWrsZcRQQqrZirNKvxW7uKDQXd8lYLknA4ry5nnUaWEoSTbSg69
 J0QdtJpQK4Dtr9zjAo0nzdwOlY4zjI1pytVnetwVaoL__NQJJAyCdI38SXn51pJQY1ws0YyGlfI7
 gHdYlx9yI687SFlfAud5Cc236obr2TFTVQIaUfkjLBp3cUMUjtRQKgmHyK9NGjmhahU6m4B07ioq
 y5sJYYkGr_paOH467d941oNVTDsvzPkg6QSXLWGQSjVDHdaaC6YryQYpr5GqXaLQRZI2wnfWuVbC
 f12M2Ij98.zz4j3.61m7XuoaOfVhJ4sodPpTv5acWXpClNelzRTjRjmlVKs7m_viEI65iGebQAQK
 Aa26m3yvhfrsF50EFkI3M9tBt.jUppOOcosk.D6LHTuW_ekJuEjVvKVsOWrK6FCtMyWpPPQ6EpEg
 9a6uCO93CXe.RXff6zAaAQ5wjYCdjwTiPMc.pl9_hS36xKo27QHphW3LoDPu53IboXCzk58FxeQK
 zglxjJGGIlHF_buC15uHaTVbYcjYzAvQ8DHbsJuNKsRGusDuNU5QbcRNY__WWZZrQ6aKngfWv28B
 IId_AzIKHgHQZnf2H2rNHL2NmBu1sLvYGTvFRbjdPoerIw_B0RB6qnkxwKsfdQL2huH1IYyShjNK
 LyV3s
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Wed, 29 Apr 2020 03:16:02 +0000
Date:   Wed, 29 Apr 2020 03:15:58 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <mrsminaab@gmail.com>
Reply-To: mrsminaabrunel63@gmail.com
Message-ID: <611529533.1976008.1588130158855@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <611529533.1976008.1588130158855.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15756 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politicians who owns a small=
 gold company in Burkina Faso; He died of Leprosy and Radesyge, in year Feb=
ruary 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Milli=
on Euro) Eight million, Five hundred thousand Euros in a bank in Ouagadougo=
u the capital city of of Burkina in West Africa. The money was from the sal=
e of his company and death benefits payment and entitlements of my deceased=
 husband by his company.

I am sending you this message with heavy tears in my eyes and great sorrow =
in my heart, and also praying that it will reach you in good health because=
 I am not in good health, I sleep every night without knowing if I may be a=
live to see the next day. I am suffering from long time cancer and presentl=
y I am partially suffering from Leprosy, which has become difficult for me =
to move around. I was married to my late husband for more than 6 years with=
out having a child and my doctor confided that I have less chance to live, =
having to know when the cup of death will come, I decided to contact you to=
 claim the fund since I don't have any relation I grew up from an orphanage=
 home.

I have decided to donate this money for the support of helping Motherless b=
abies/Less privileged/Widows and churches also to build the house of God be=
cause I am dying and diagnosed with cancer for about 3 years ago. I have de=
cided to donate from what I have inherited from my late husband to you for =
the good work of Almighty God; I will be going in for an operation surgery =
soon.

Now I want you to stand as my next of kin to claim the funds for charity pu=
rposes. Because of this money remains unclaimed after my death, the bank ex=
ecutives or the government will take the money as unclaimed fund and maybe =
use it for selfishness and worthless ventures, I need a very honest person =
who can claim this money and use it for Charity works, for orphanages, wido=
ws and also build schools and churches for less privilege that will be name=
d after my late husband and my name.

I need your urgent answer to know if you will be able to execute this proje=
ct, and I will give you more information on how the fund will be transferre=
d to your bank account or online banking.

Thanks
Mrs. Mina A. Brunel
