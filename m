Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB41E86C69
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 23:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390411AbfHHVaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 17:30:10 -0400
Received: from mout.web.de ([212.227.17.11]:52475 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729780AbfHHVaK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 17:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1565299807;
        bh=adophxyBykylmrGWugn7tQEMrCbrM2OhipEMmeAfOBA=;
        h=X-UI-Sender-Class:From:Subject:To:Date;
        b=EuqJuRjCTVGbCJD3g8Z0+aRZ+S2hQPh8eJVdSX4bh/Gi/Hi40+csqqmm6pW9AgWdq
         gdhi0U7/97Sn+ZExY0YMHkFb0a5Vpj1vS415uWJ1tLhOYV5HfXMqFpbY+ISXWvwjL+
         78KL154bOT21l59fyZHioHSNr3ObHSL/2KtH1seE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.40] ([87.122.194.127]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MDPEX-1i62C23aBR-00Gqit for
 <linux-media@vger.kernel.org>; Thu, 08 Aug 2019 23:30:07 +0200
From:   Peter Schlaf <peter.schlaf@web.de>
Subject: try to edit channel in kaffeine 2.0.17 gives a crash
To:     linux-media@vger.kernel.org
Message-ID: <e46738ac-f886-b844-fe64-725c4429415b@web.de>
Date:   Thu, 8 Aug 2019 23:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:nO4sMXM74SSLOGu1VxmosUW++albGIGCYpf1gjHfC+9wKKip6PA
 wgIUpieB9QLAAqOFxDaMfL9B1f9Gk9jy1hyQG8aT/sAZBK8bQt9OCZ2eiM2EhVlPlv9iQfa
 NtXWnaCKVcyCBj72nXqpaU8HP4e1SvZrntWrqalb73zlW+rDR4v5Ox0QBYQ/Ur9YsoNAij2
 J0iyD1A7IhtWyVO2sX3sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H0P4KEY0gpk=:C3DnDpQT1IKrTMfC4ELi1c
 ysUv0wHDJu7F+WW61eV/tRBrn1k2YSJga09rSOClS5cM4peCIIetRexKU0D37rQVe7sJPTEXk
 vrhw5H+hGoiUFh7O/Ohf0UDMLXGiKJflCk3pRvowB69V68qJ3CSPo0MnaHrHr7kKkMdOoWIsN
 ChiEtcyZ8x7OpE8ixFGhTh+Xg3ZmDYFzlFEWrO4zs6J81tyVDNsbWjXFOzMjQOb7Utkdjbsi0
 BMMILPOuRqrPensNP+5CgTYMzZIhsn/+o3RyJEbHYhhB6Hq4ZMf0Jd2DV1vyUUfeV16u6luCr
 buKmwCsQGqzJa7vYLfhNTaH6zDlFaJb56Hdg3EZxQgG+WozeaI0bgvjIHrp/EJPTkahR3XrZX
 +cgwo2itK+L55vmHr0Dlml6+3FCphOm51LjmB+p6KRnQYpiEywDvEdsOE/w9ocQweohxA2iEv
 usO/9KaoWabJK/QZ6sTDMG5LAhMnQK1trK9FPlVOodZCCO5WG5O7byKeLcKoD9Pqj7bR67Bjw
 Mlz4c+YsLvxrkq2ztxmSmow47M8ZQoi8uRlPHGKrLXESHsOpbK44tkfuPA6Wdi6KwQWUjco5m
 0HwzlDmFxwfpY1huhbJQcCdSs1IH+vsnVIv8l/Dms714rHkGytpeR8nFfZOPYN0DYzbK3qH/b
 5FipC4INpNnrJN8ThlhdzV9US9lScLixX9Phh/G1FKPFeJxqpCOVoN5uTA/N2Oe8Wb1uSVs8C
 9csheXg3SUiaa5zDJ9hGDWkz8q7qRYjdxDQ253KOzIDpnz2LJ0ObceZ3V1nmBPDIhn6gee4qc
 BV5xwwZLzmg/svIlmIK6Vlnq9bEHqQlrki1SvN+TV2z+yPscKcT7rE2WS0xtbB6IXu4k0MW/T
 aYz9B7sYXWwrP+e0RnwzAPcHIjqYpkpIPnq8d512SDcgooxysHYLaa9Ki+QkCRpCs5Dz+Fu2u
 4dhhpgplqrcUtCKrpq+Z5lZvgyLMggnxIN+gPzrmd14JpVi+9ZtMQ4PyuSvPbGEnXs+I7MCf5
 8lVEHBrnIym/noVA7uy0Zqb7cDPmr9yK1OsaY8shI1US2QtfZXLiiuTDcf8TCueF+OJGWNTBC
 wsVIxvu1p82xWaSX6O/f4nUqyX0rAXarRjhInO6Cx9ZMJoj/VkdU4x4T0YmDDHgPYYnJP+pw6
 Uumis=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

right-click on certain channels in the dvb-channel list in kaffeine
2.0.17 and selecting "edit" crashes the program without opening the
channel-editor.

gdb output says:

    Thread 1 "kaffeine" received signal SIGSEGV, Segmentation fault.
    0x00005555555a78c6 in DvbChannelEditor::DvbChannelEditor
    (this=3D0x5555574fce60, model_=3D<optimized out>, channel_=3D...,
    parent=3D<optimized out>)
     =C2=A0=C2=A0=C2=A0 at
    /usr/src/debug/kaffeine-2.0.17-lp151.1.1.x86_64/src/dvb/dvbchanneldial=
og.cpp:961
    961=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QString text =3D QS=
tring::number(it.first);
    (gdb)


CU


