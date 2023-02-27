Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891316A3FEF
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 12:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjB0LFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 06:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjB0LFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 06:05:13 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838211A8
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 03:05:11 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id s26so23964224edw.11
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 03:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=egpFwym+SRoMvkaIE8z5IyX+mAOxyoxmHm250qighW8=;
        b=oBLc0gIs+vQPirAjXGINraz+KF6z/JQan/XqnN1vibgvbjNdaA1YKe1OCcYrt95acR
         YuN+vDuTXegW31522QVskQ073qYzGjRUftbjTm83XTuvCXL984+JPrnO2liZl05vEL1R
         nbnbs9X6Uc/W6Lg6lyzevatljaHA/ZVuKQphkhgkTKF9GdqVrF9OtFpGT+7s1ypZsvhI
         944vv0/3Y0IX6UQYGpHjhNeZGfx4KagJx8Pnbr0w25az9ccZ8MrsTFGtiZgkFHPLTuSi
         cK2br/UJM5hYe6EMlPnR/by07X/l1/iObJhpkbx231oif4XpMWZ3XFsOwaq1mNfoWAvt
         8TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egpFwym+SRoMvkaIE8z5IyX+mAOxyoxmHm250qighW8=;
        b=EY70M6veWa1Dpw2rDznm+YpExcV0ed5R/SdeVLJjF5xjGHFpdu9q1f8sXtyvFbyQoi
         hCRaOKUE1Esk/QtY2cRyQJfjWlqOXLCiVgnEzqOxlhSxEZ+HA63rzB8STVEkQ+cwv7/y
         wU8/w5c6uteeqMaatlRjzLYHGlUCNkmhpjWNtozOS4NH+ryWdt0gfJT/uWxZ2h3B6IxH
         IYD1n3vmlxm+oicPYCKpanGKnhHNn9sj4C0WG8CN3g/N2Nnto3T1x6hANC7WI0q1+lph
         9zlKvtMVU8A9K968HQNkvbLK1bmM9V7Ti78IlkV0t0goSGdYf3fXT40p2Ra2aQ24knTx
         Kx2w==
X-Gm-Message-State: AO0yUKWWMAdSLL36T+eD8Q0C9onGUPh9q6Vs2uz3NioDCEEqsQUCQg9r
        dhoFJTvKGGcWREbn46Lxn5Y9cxq73FwqRGO5tt5aXyV6Nro=
X-Google-Smtp-Source: AK7set/gGRDWHL2gDGkkHAULA1sqcDZn7mgjU8mmQEIW97NCSdid7nTAWA7riBePpgiPfhptmbX7YnxLNgZR1bUTGpo=
X-Received: by 2002:a17:906:7b88:b0:8b1:81fa:b07a with SMTP id
 s8-20020a1709067b8800b008b181fab07amr15186183ejo.12.1677495909575; Mon, 27
 Feb 2023 03:05:09 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Tomasz_K=C5=82oczko?= <kloczko.tomasz@gmail.com>
Date:   Mon, 27 Feb 2023 11:04:43 +0000
Message-ID: <CABB28CwCn-FKPaydEBDfSqmnAz=m=cSqecj9eM-=0t60GXco8w@mail.gmail.com>
Subject: v4l-utils 1.24.1 not ready for gcc 13.x
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Tomasz_K=C5=82oczko?= <kloczko.tomasz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Looks like v4l-utils 1.24.1 is not ready for gcc 13.x

make[3]: Leaving directory
'/home/tkloczko/rpmbuild/BUILD/v4l-utils-1.24.1/utils/dvb'
Making all in v4l2-compliance
make[3]: Entering directory
'/home/tkloczko/rpmbuild/BUILD/v4l-utils-1.24.1/utils/v4l2-compliance'
/usr/bin/g++ -DNO_LIBV4L2 -I. -I../..  -I../../utils/common -DGIT_SHA=3D
-DGIT_COMMIT_CNT=3D -DGIT_COMMIT_DATE=3D -I../../lib/include -Wall
-Wpointer-arith -D_GNU_SOURCE -I../../include   -O2 -g
-grecord-gcc-switches -pipe -Wall -Werror=3Dformat-security
-Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3D3 -Wp,-D_GLIBCXX_ASSERTIONS
-specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1
-fstack-protector-strong -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1
-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -m64
-mtune=3Dgeneric -fasynchronous-unwind-tables -fstack-clash-protection
-fcf-protection -fdata-sections -ffunction-sections -flto=3Dauto
-flto-partition=3Dnone -fno-exceptions -fno-rtti -std=3Dc++14 -c -o
v4l2_compliance-v4l2-compliance.o `test -f 'v4l2-compliance.cpp' ||
echo './'`v4l2-compliance.cpp
v4l2-compliance.cpp: In function =E2=80=98std::string make_devname(const
char*, const char*, const std::string&, bool)=E2=80=99:
v4l2-compliance.cpp:912:34: error: =E2=80=98uintptr_t=E2=80=99 was not decl=
ared in this scope
  912 |         topology.ptr_entities =3D (uintptr_t)ents;
      |                                  ^~~~~~~~~
v4l2-compliance.cpp:36:1: note: =E2=80=98uintptr_t=E2=80=99 is defined in h=
eader
=E2=80=98<cstdint>=E2=80=99; did you forget to =E2=80=98#include <cstdint>=
=E2=80=99?
   35 | #include <v4l-getsubopt.h>
  +++ |+#include <cstdint>
   36 |
make[3]: *** [Makefile:685: v4l2_compliance-v4l2-compliance.o] Error 1
/usr/bin/g++ -DNO_LIBV4L2 -I. -I../..  -I../../utils/common -DGIT_SHA=3D
-DGIT_COMMIT_CNT=3D -DGIT_COMMIT_DATE=3D -I../../lib/include -Wall
-Wpointer-arith -D_GNU_SOURCE -I../../include   -O2 -g
-grecord-gcc-switches -pipe -Wall -Werror=3Dformat-security
-Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3D3 -Wp,-D_GLIBCXX_ASSERTIONS
-specs=3D/usr/lib/rpm/redhat/redhat-hardened-cc1
-fstack-protector-strong -specs=3D/usr/lib/rpm/redhat/redhat-annobin-cc1
-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -m64
-mtune=3Dgeneric -fasynchronous-unwind-tables -fstack-clash-protection
-fcf-protection -fdata-sections -ffunction-sections -flto=3Dauto
-flto-partition=3Dnone -fno-exceptions -fno-rtti -std=3Dc++14 -c -o
v4l2_compliance-v4l2-test-media.o `test -f 'v4l2-test-media.cpp' ||
echo './'`v4l2-test-media.cpp
v4l2-test-media.cpp: In function =E2=80=98int testMediaTopology(node*)=E2=
=80=99:
v4l2-test-media.cpp:150:34: error: =E2=80=98uintptr_t=E2=80=99 was not decl=
ared in this scope
  150 |         topology.ptr_entities =3D (uintptr_t)v2_ents;
      |                                  ^~~~~~~~~
v4l2-test-media.cpp:29:1: note: =E2=80=98uintptr_t=E2=80=99 is defined in h=
eader
=E2=80=98<cstdint>=E2=80=99; did you forget to =E2=80=98#include <cstdint>=
=E2=80=99?
   28 | #include "v4l2-compliance.h"
  +++ |+#include <cstdint>
   29 |
v4l2-test-media.cpp: In function =E2=80=98void walkTopology(node&, node&,
unsigned int, unsigned int)=E2=80=99:
v4l2-test-media.cpp:549:36: error: =E2=80=98uintptr_t=E2=80=99 was not decl=
ared in this scope
  549 |         topology.ptr_interfaces =3D (uintptr_t)v2_ifaces;
      |                                    ^~~~~~~~~
v4l2-test-media.cpp:549:36: note: =E2=80=98uintptr_t=E2=80=99 is defined in=
 header
=E2=80=98<cstdint>=E2=80=99; did you forget to =E2=80=98#include <cstdint>=
=E2=80=99?

kloczek
--=20
Tomasz K=C5=82oczko | LinkedIn: http://lnkd.in/FXPWxH
