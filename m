Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D58B318396
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 03:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhBKCb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 21:31:28 -0500
Received: from smtpout2.vodafonemail.de ([145.253.239.133]:55816 "EHLO
        smtpout2.vodafonemail.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhBKCbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 21:31:24 -0500
Received: from mailbackend01 (fra1prox61.fra-mediabeam.com [10.110.1.61])
        by smtpout2.vodafonemail.de (Postfix) with ESMTP id 593C460D7F
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 03:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
        s=vfde-smtpout-mb-15sep; t=1613010636;
        bh=f9B5Kgue3Ayr4HDYV7v+es2ZS81DjY/Z0RSZtUCL/jE=;
        h=From:To:Date:Subject;
        b=lSqI2s8I3kD+QdS+uCkfS9BxpVHmTour2QZ4KBnT3tnTEds6fORA4z2E1mntHLQgY
         wRKpfWgD8UYUkF0+FrfDZaAU+UDYZ8gf0fhDkAkVU6RMLKdQgSxc+lcdKtlbIGmv9L
         1fxDamgElbhdibbkvU0Fls86O5imCznpbNG9XCR0=
From:   michael-2@arcor.de
To:     linux-media@vger.kernel.org
Message-ID: <2619af9aacbd43158dc3907cb8818e71@arcor.de>
Date:   Thu, 11 Feb 2021 03:30:33 +0100
X-Priority: 3
Subject: Webcam ASUS B50A laptop fails with uvcvideo: Failed to query (GET_INFO) UVC control 2 on unit 3: -32 (exp. 1).
MIME-Version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

I tried to reactivate my webcam in a ASUS B50A laptop, which is officia=
lly supported (according to https://www=2Eideasonboard=2Eorg/uvc/) and =
was known to work=2E But with my attempts to use it with guvcview it ju=
st ended in syslog entries like=20
=09"kernel: uvcvideo: Failed to query (GET_INFO) UVC control 1 on unit =
3: -32 (exp=2E 1)=2E"=20
It looks like the uvcvideo module is loaded, but the device file is not=
 created, though it is not there=2E=20
Is there anything we can do to make this camera work again?=20
Any help is appreciated=2E


a@B50:~$ lsusb=20
Bus 002 Device 003: ID 04f2:b071 Chicony Electronics Co=2E, Ltd 2=2E0M =
UVC Webcam / CNF7129

guvcview - Output:=20
a@B50:~$ guvcview=20
GUVCVIEW: version 2=2E0=2E6=20
GUVCVIEW: couldn't open /home/a/=2Econfig/guvcview2/video0 for read: Da=
tei oder Verzeichnis nicht gefunden=20
V4L2_CORE: ERROR opening V4L interface: Datei oder Verzeichnis nicht ge=
funden=20
GUVCVIEW (1): Guvcview error
         no video device found

(guvcview:4003): Gtk-WARNING **: 14:16:29=2E935: Theme parsing error: <=
data>:1:17: not a number =2E=2E=2E

UVCvideo current module configuration:=20
a@B50:~$ cat /etc/modprobe=2Ed/uvcvideo=2Econf=20
options uvcvideo quirks=3D0x200

a@B50:~$

syslog excerpt with trace=3D0xffff:=20
[ 39=2E510590] uvcvideo: Found UVC 1=2E00 device CNF7129 (04f2:b071)=20
[ 39=2E510910] uvcvideo: Failed to query (GET_INFO) UVC control 2 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E512016] uvcvideo: Failed to query (GET_INFO) UVC control 3 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E513139] uvcvideo: Failed to query (GET_INFO) UVC control 6 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E514265] uvcvideo: Failed to query (GET_INFO) UVC control 7 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E515262] uvcvideo: Failed to query (GET_INFO) UVC control 8 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E516390] uvcvideo: Failed to query (GET_INFO) UVC control 9 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E517513] uvcvideo: Failed to query (GET_INFO) UVC control 10 on u=
nit 3: -32 (exp=2E 1)=2E=20
[ 39=2E518639] uvcvideo: Failed to query (GET_INFO) UVC control 1 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E519764] uvcvideo: Failed to query (GET_INFO) UVC control 4 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E520887] uvcvideo: Failed to query (GET_INFO) UVC control 5 on un=
it 3: -32 (exp=2E 1)=2E=20
[ 39=2E522015] uvcvideo: Failed to query (GET_INFO) UVC control 11 on u=
nit 3: -32 (exp=2E 1)=2E=20
[ 39=2E523141] uvcvideo: Failed to query (GET_INFO) UVC control 13 on u=
nit 3: -32 (exp=2E 1)=2E=20
[ 39=2E524637] uvcvideo: UVC non compliance - GET_DEF(PROBE) not suppor=
ted=2E Enabling workaround=2E=20
[ 39=2E525273] uvcvideo: Failed to query (129) UVC probe control : -32 =
(exp=2E 26)=2E=20
[ 39=2E525276] uvcvideo: Failed to initialize the device (-5)=2E=20
[ 39=2E525368] usbcore: registered new interface driver uvcvideo

Thanks, Micha


