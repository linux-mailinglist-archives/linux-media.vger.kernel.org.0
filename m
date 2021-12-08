Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B80346D736
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 16:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbhLHPpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 10:45:46 -0500
Received: from mout.gmx.net ([212.227.17.20]:42317 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhLHPpo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Dec 2021 10:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638978127;
        bh=Kaxqad3XDKemxEL9LdnosA9ZLaH+8+mQraK68gc7fLY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hdBUKD2oY8xnqrIXsyTXbEIB0/vXX9CRIQ9H9qDllaHhRmJxirS3v057KtEL7mHBc
         Cbyv3/LiTmHEkrygZF0Uc7LrLQJIoFSnPkxKy8eYl3dTihOnJgFcuyOnIgI6p/EBw/
         M/lJJTLTFRpVufjIjnqn4ZNroe3j86mMdk1QWj7Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 8 Dec 2021
 16:42:07 +0100
MIME-Version: 1.0
Message-ID: <trinity-11b96cd7-6ac4-433c-804d-45e6a015e2a8-1638978127611@3c-app-gmx-bap13>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Aw: Re: [PATCH 2/2] media: si2157: Add optional firmware download
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 8 Dec 2021 16:42:07 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211208095200.6dfe2610@coco.lan>
References: <trinity-0a2519c2-0c5d-4006-9aed-48fcd48cff8b-1638393058526@3c-app-gmx-bap03>
 <20211206150055.43043b53@coco.lan>
 <trinity-42d6e25d-b5bb-425c-a25a-ef6e758e216c-1638918425561@3c-app-gmx-bap19>
 <20211208095200.6dfe2610@coco.lan>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:MGIgURawjS4kdpCE5j8zlgmPzxCThIQ+5/4OxELcupoG/qJ+8i2SCT6/+mC6zplXy6HaS
 aYrh+OL+3yL/SW1J6b318LuFt/PaiX/4+QZHcPj1Fq2QTFb998LZxBwu4JPTL/1KpeFYLNQP11nI
 qzdEW+btVvgZnINyo4VrRAP5xLsb25yXNySecxrVdzY05KWXheAJ8pl14Ksz6R2UvuFXq8q6iAXD
 rkfSRi7ZHqwtEcGOIX1J1ecfJeEV4WZDc6fBciS7f5hmIt/+W3tVy4Y/ly1wFIY0avVZLZEv85MJ
 rM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xcfq0BZ5GII=:MSZ+fACM2nPBD52L39kY7t
 +zAObdy5B7TPCtt1EDO+d+SnolU+UhHUWg2H9yGDE1GAH0B2OCDOUFRC1WxbJ+wfphxUwiHP8
 AA7j0FucNXRFf0vM1kBp7HQHmXSMbEfBL/xwgo0GZJsVVEFzKLRLPAqnZ+DAmbskontXjamYc
 jFVpyDLiqhjZ4f4+Keux6duhQgiR/LA8Gldu0socGaw7/JKFYM+z3yfKp7JnKwekFkCSm9dxS
 psY2jvWRuUGU2FGw6LUetPS6+3z1iKH07WK29+IDO3p9i9pKAhCgb0a1S8NiC7vcdk8l1N5c4
 Sm3SG7/BIpsDLK3nihXYOT81xcVHrcitsB0pJfGue2s2AzKp0QghvDxatfviuBi7U3HWg+rv0
 5iuresc7Qwu3jmA31SUGiZHM6u7Tbeumcgm+2InpMgRml9/ZSy/VXYiKshQPb7M3KrOsAcOh3
 bDsRD1A5IgZfzVfXfknf3j2wg4wwp3nYai7emQoJqY08Spag1z6/NH6d2rc92PdHsIV2EeAXU
 WANziHm/z/Bzu8OrG5DiBgoRapNm2/81MpZ7O0ElN1rXLLl9pANEZ1cVwMBzjTX1mg2rwRwJE
 ch9fhT4+uP31wWsUEX6ZT7DbPLe0FNcQj/o4Pje6JrNbkNCN42hS2UOWXvMxujt/ah2uZNkGI
 6gvgmd+n25dC+3y3y2LBzQ8QemJ+eJ3OlJRzZNfLuNj5Rz2Np6BHvxQUrs7hKUi22Hv6+m3UW
 aLbeZ+YfTv0DH4Et9UeDrNfil1uUp5y4rQgcQ/RaE9zFRXYvAlsGeeVBVnEURiJBpyFtWo5Gc
 1edZV2k
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Von:=C2=A0"Mauro Carvalho Chehab" <mchehab+huawei@kernel=2Eorg>

> See, while the technical docs for this device are not publicity
> available, the block diagram for this device on its "advertising"
> datasheet:
> https://media=2Edigikey=2Ecom/pdf/Data%20Sheets/Silicon%20Laboratories%2=
0PDFs/Si2157=2Epdf
>=20
> Doesn't show any internal ROM/eeprom=2E So, it sounds to me that
> either some external rom chip is needed or its firmware should
> load via I2C=2E

I am very certain that the Silabs Si21xx tuners and demodulators
all have an embedded firmware ROM=2E Unfortunately, I cannot find a
public datasheet that explicitly mentions this, so I can only
provide "circumstantial evidence":

- There are very simple USB TV sticks out there e=2Eg=2E with only a
  Cypress FX2LP on them and SiLabs tuner/demod=2E Those work in
  Linux without the Linux driver downloading a firmware onto the
  tuner=2E Where else would the tuner firmware then come from? The
  FX2LP firmware does not have such function, the demod does not
  do that either, and the datasheet you found also does not show
  that the tuner would be capable of downloading it from an
  attached EEPROM either=2E

- The last two digits of the part number are actually the ROM
  ROM firmware version (e=2Eg=2E Si2157-A30 has firmware 3=2E0[=2E5],
  or Si2183-B60 has firmware 6=2E0[=2E2])=2E

- And one little hint "officialy" from SiLabs, in their driver
  code at:

  https://github=2Ecom/SiliconLabs/video_si21xx_superset/blob/master/SILAB=
S_SUPERSET/TER/Si2157/Si2157_Commands=2Eh

  Note that Si2157_PART_INFO_CMD_REPLY_struct has a field
  "rom_id" in it=2E So it must have some sort of ROM=2E

> So, my main concern here is with regards to other devices that
> are using si2157 driver=2E Among those:
>=20
> - Some may have no eeproms;
> - Some may have an eeprom with compatible firmware;
> - Some may have an eeprom with a too old firmware=2E

I think it's very unlikely that ANY device out there actually has
an EEPROM with Si2157 firmware on it=2E

> On other words, the only way to ensure that the device will
> be in sane state and be fully supported by the driver is to
> load a known-to work firmware=2E

Ah, that's actually a different point, which I agree is valid:
The driver code must match the firmware API version running on
the tuner=2E So if a very different firmware was running on the
tuner, the Linux driver might not be compatible with it=2E

There are two ways to go about this:

1=2E Support only one specific firmware version in the driver
   and error out in init if a potentially required firmware
   file is not available=2E

2=2E Being more tolerant about this and only outputting a
   warning that the firmware running on the tuner does not
   match the version the driver was developed/tested against
   and might not work right, and that providing a firmware
   patch file might fix that=2E

I would prefer option 2 as it is more user-friendly=2E

> Do you have access to all the technical datasheet and
> application notes for all chips supported by this driver?

I wish=2E AFAIK, Antti developed the Linux drivers using
reverse engineering of the Windows drivers=2E

The situation is a bit better now, as SiLabs has now
published their own driver source code:

https://github=2Ecom/SiliconLabs/video_si21xx_superset

Ideally, someone would have a lot of spare time to
shuffle through that source code and e=2Eg=2E correct some
incorrect command or parameter descriptions in the
Linux driver code=2E=2E=2E

> If you have, could you please describe why only SI2157_A30
> is safe with regards to firmware?
>=20
> If not, then checking for chip_id =3D=3D SI2157_A30 makes no
> sense=2E

The _existing_ logic is that if chip_id =3D=3D SI2157_A30, no
firmware will ever be downloaded into the chip=2E My change
made it possible to _optionally_ download firmware into the
chip, but also proceeding without firmware, behaving
exactly as before=2E So it is "safe" with regards of ensuring
there are no regressions introduced in the Linux driver=2E

It is not "safe" with regards to _improving_ the existing
firmware handling, but that was not my goal=2E If you want to
expand the scope, you're welcome=2E

But I think what you are proposing is much more risky than
my patch, if only because you're touching far more code
lines=2E

> #define FIRMWARE_MIN_VERSION 0x123456 // FIXME: add something here

No, this will have to be far more complex:

1=2E The driver supports several Si21xx tuners (note that the
   SiLabs code has one driver per model), mostly having
   different firmware versions, so you will have to provide
   firmware versions for every tuner model supported by the
   driver=2E

2=2E You might also want to provide at least a "range" of
   supported/tested firmware versions, if not even a full
   list of firmware versions=2E

However, I consider that an almost impossible undertaking=2E
Where are you going to get that list of firmware versions
from? Do you plan to have many, many contributors filling
that list patch by patch?

I'm not sure the benefit would be worth the effort=2E

Best Regards,
-Robert Schlabbach
