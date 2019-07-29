Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35793792A2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 19:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbfG2RxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 13:53:15 -0400
Received: from mout.gmx.net ([212.227.17.21]:41659 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728017AbfG2RxP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 13:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1564422781;
        bh=7wzmysCmKHB/MJ7yViR5g7vWMi9GW505v/lZE5dCVIM=;
        h=X-UI-Sender-Class:From:To:Subject:Date:Cc:References:In-Reply-To;
        b=iAbU8DutaEeE3VfG0gwqHQ7qG/JsABdtnNR4ue6jFALSoC+bXayD02Zbo4r83D8eI
         TTMS0iU0hT6gd5QAaACP6dK7sI2E8SK1qV8XM5EUYPdcmx5WrJ/M6qtXa4UDLKobF/
         bOOIuhvd/+JNpmzDQmYGbhcpKiBxrqkPmScyCyTA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from doku18 ([77.2.94.7]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MTwYX-1i0iWD3q2j-00Qfvd; Mon, 29
 Jul 2019 19:53:01 +0200
From:   Dominik Kuhlen <dkuhlen@gmx.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 26 (media/usb/dvb-usb/pctv452e.c)
Date:   Mon, 29 Jul 2019 19:52:53 +0200
User-Agent: KMail/1.9.10 (enterprise35 0.20100827.1168748)
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-media" <linux-media@vger.kernel.org>,
        Andre Weidemann <Andre.Weidemann@web.de>,
        "Michael H. Schimek" <mschimek@gmx.at>
References: <20190726152342.2dd8b728@canb.auug.org.au> <782d7306-497f-7bd8-daaa-abac4fca0bdc@infradead.org>
In-Reply-To: <782d7306-497f-7bd8-daaa-abac4fca0bdc@infradead.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart21433132.aLrHPWef0M";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201907291952.54035.dkuhlen@gmx.net>
X-Provags-ID: V03:K1:mB95IJ4jmxVaVllUrtLW0PlafrMBRi95QT3zMIxkaolk/h9cUhs
 qE+kkoXiesuWcSw1kXZAr9PI6qOjmgptR6d0ftkmPR5pnXhq1mcXyc6ltTxcmUMU8nH3P7c
 JKU1kXYTXVuYFyI40LVFDlAn/uxdDwiluSqxVEGJ01nRGqMG/f+8PXn2V/n7X/KnG2zA5kr
 k+KRfA33Ed0gSEQHoY1gA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8NkhlyBt2jY=:91UkcdGkNYBP7/JWBItlEj
 7a9x6fVwxjVgHjKoWQo8bRm0hI1lpuHGMXkqJS5wdY+onIakReAzilTRXagrbKABv1Uwn5CpA
 qwJjLiHjBIk2ggZEspg+ouBDWURerNAyY+/09yuu+ZniG+WGut0NuqJBjROtY0zmmt7/O8G3P
 h5W/adb9kbryDPgMFkQrUtKpk0v1WAETs0DHXfMCGk7YiSUHUqoTIRpvAW6I6mWjSOLd8tZYb
 PDP0Bo+pIlfvR/GAAEXRiYIipkPojc2xvkukODgo+AbP9vYnvhZcRQ5v8KXSFeMfIujNdFhA5
 WX3pmq4WYpntMjoF7Jhv9UdT0n9q6fyOi3ZT2H5fMdwBoj2uWr5vqH6lo/emSMGWQvqANZCCX
 9s1a2uZsLyz0arUsBf+zaK+1TwRUDV6FGXlsyxf44tgW2yOTuvdSkF/lql5VH0HLhT9mDyYVJ
 lO4tQakp+6gC1E2I3JQ3RD8YyQoefpp0ahjjz0R0WKhf6S0y3RkLUftyPv3cAybcCamClnM0W
 /0g0TMJzcF56FpTdWq0hF7P7cRo79/Se98QnoFx42N251KKeUEbFn7zq2qwrl/hDjv1Tvi1bY
 2cv9WwnYab3jy050D7bfLp+Yl/d/hJ32R6gmHgdW0Rl3hJIJZQp9iUWvtvPp8MuP3KgY3GX3J
 qskTkpXmk3r7C1IwaOgLHI5rZRTnfvNGE3J/+OmQp6xGaulqvJQpc2aLPTZKa50c7hMU746P/
 MufYe8GL9E3gGgDuGInD/kk7C10d9uqwxvVI5klF+KXn/eQicAS1c1gO2zgAavKJ1G5nTGetp
 NxtEu0NZ4oHpS/X28AbI5OlfVdWKBw38sqy9L5MKxmMkX+5d6blQj54QP6FYdM6sfRF8ng0+8
 MCV7AKxEdDeF2CS4vdUWAuXsPr2SAweTV/vfYs4oOCovwv644a6aawjK9Y8MoMBRIHArVknIp
 wH7rffBbkkweb5gRTfWiSDS2i1HUVJ2Ivu7iye2PSHQ0kRX/5iToiVJ6E7SGk7WHKrd9PistT
 mfAP4jI5xXmRfs/ZvGM0QCH1BHxsmQrgpi0N/9WGTqSU+nUdkqdLn73PUeuz8qrU0Xx434fQK
 7lX8a5J513sxE8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--nextPart21433132.aLrHPWef0M
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Randy,

On Friday 26 July 2019 16:57:50 Randy Dunlap wrote:
> On 7/25/19 10:23 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20190725:
> >=20
>=20
> on x86_64:
>=20
> In file included from ../drivers/media/usb/dvb-usb/pctv452e.c:16:0:
> ../drivers/media/usb/dvb-usb/pctv452e.c: In function =E2=80=98pctv452e_fr=
ontend_attach=E2=80=99:
> ../drivers/media/dvb-frontends/stb0899_drv.h:139:36: error: weak declarat=
ion of =E2=80=98stb0899_attach=E2=80=99 being applied to a already existing=
, static definition
>  static inline struct dvb_frontend *stb0899_attach(struct stb0899_config =
*config,
>                                     ^~~~~~~~~~~~~~

 cat config-r6623 | grep -i pctv45
CONFIG_DVB_USB_PCTV452E=3Dy

 cat config-r6623 | grep -i stb0899
# CONFIG_DVB_STB0899 is not set

=2D> mismatching configuration:
The pctv452e needs the stb0899 frontend driver to work.
And the CONFIG_DVB_STB6100 must also be set.

Best regards,
  Dominik

--nextPart21433132.aLrHPWef0M
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRFyJKmsHqIL03994Lo5et+p+0wogUCXT8ydgAKCRDo5et+p+0w
ouxYAKCStBFtM3FPc2DVzyK8twIZARLLXQCePMdigKYUO7HPoUmuy8IRu835eGw=
=76Pp
-----END PGP SIGNATURE-----

--nextPart21433132.aLrHPWef0M--
