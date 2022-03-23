Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A09D4E4E1F
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 09:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbiCWI1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 04:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbiCWI06 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 04:26:58 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DDC36E7BA
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648023925;
        bh=CzZeq+8RiRJZb3e0n5egh7mt5oDVJ56pb0xY43hlhoM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WPAsAxLd+FPwWNCX4lZuaGdugd+c5/62ZTaGCL0pD6s2HqokfbLJ8Ln5+ROvwfeAv
         KhAYyk1mAtnIChGTXfp1oTUh2CmOkwQZv+46rUcMbg06rZTUYOsGi0mzfF49OCTcku
         CnU3uwRqljytbNkNeAY0RuEsl7iJpKWxoGd99elQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.110.57] ([91.65.110.57]) by web-mail.gmx.net
 (3c-app-gmx-bs25.server.lan [172.19.170.77]) (via HTTP); Wed, 23 Mar 2022
 09:25:25 +0100
MIME-Version: 1.0
Message-ID: <trinity-cde2127b-c65f-4185-af2c-605f2b6b1028-1648023925588@3c-app-gmx-bs25>
From:   Robert Schlabbach <Robert.Schlabbach@gmx.net>
To:     Piotr Chmura <chmooreck@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] si2157: unknown chip version Si2147-A30 ROM 0x50
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 23 Mar 2022 09:25:25 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com>
References: <6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:RtSUPHnTfbf90u9Q4Ui8M7XkER+Z0ovf5KuUs4jidZspa6ygVKgr5UBlwImoDj3kCgMPH
 jTKGbf8n2pm54e2QJHRjrqd+ZACPxEMbRty7rvmpVp8gZglnriZH0n5lrDUl5CLpOXgZkkAs0W2N
 ofue8PWkpkZ86no1qbP9OhYWsaWo5br3A2dg11dvI3fDWTSyLa1d2wzdp5okXI2GvZgu0yWqsyjP
 dfHUgvt/xGIfH79wPLgoADQdxH0VY6tJP23rG32pCBWrNjozJhwCP4Cx2sD5w9kZCIApLzLMVbrp
 Ko=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ADw2bZng79k=:PzgZyC/Lp/riQFSi2IwQ6f
 KenmqnfMOWEPLtx/TTe9xe3nDMkCQGKXuVBmbsPqR5WUAJi7zc5MGmHatJueKuajo9VwFZ504
 LsX6qkfO9KBSYAoZvvxp9k6kAsgCvS5tCxOGsYZhgfCyGLfa2Ve/fNLQ7JtiPB8wit1pG7z9E
 p0CsNRqnB1gRg0eg5lXjxo4d8Cg9kSYyK7dB0F8r0I7I1z3wdfzfKtYXoo5pSQTo/kJMrFoSR
 vsbPtp8m/PN1rVneujR6vogO7R4Z9K+CHPJk8Rx2+VyJsPF+Y5VCOsMFPgMTpjS8cWBLdfHrE
 KPF2ocbc/xXMczP78b/GWs+oj25e+Sh5Ir14GqSK2kVP5qvn149mXP9rvNPT7dTU36a7PiBDy
 fU/kUpFMTS54VsJQqmSZ7QVlKx/KPBWE990aWIz6kt05i4Wm4cWjnRqH8qUabBu7lEERmuvij
 Jx7mQJtEuHtjYNiuJ4CnEC4FNQd6f8WazdhKpwHga0JyGrh2WS3Hsimz/FEC3SoccZH1hmBra
 JlNNJQlNV0C12Z80OWDJW72R0VIZuqRNF9ma9xs5Olu6ZAAewcsB3pzNNxe5SRk2c2k48tjJM
 vTzptqtQ4SIsam359bB3QaU0+O+yBwNi7RLHboXXt6RraEIiM9vzwGzybe4rnNX8HSBnBYuzl
 cn8WyDdjW89aTq8yCNlg3+lb6CU7qRR6+0Ac9hzW5C2mM2NXeg57ZefZJFQ8ZtLEpWFEj3Gue
 kfPWFzN49p8SWJUviYRqDplV3mHKZ22Ej9e6r9dgpS0DZzG1Ae+us5k0GjZLPs8ilLVzIn+Zw
 F9wjHYP
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Piotr,

wow, well spotted! I did not notice this bug with my Si2157, because the R=
OM file
still has the old "alt" name on my machine, so it was loaded despite this =
bug=2E

Best Regards,
-Robert Schlabbach


Gesendet:=C2=A0Mittwoch, 23=2E M=C3=A4rz 2022 um 00:08 Uhr
Von:=C2=A0"Piotr Chmura" <chmooreck@gmail=2Ecom>
An:=C2=A0linux-media@vger=2Ekernel=2Eorg
Betreff:=C2=A0[PATCH] si2157: unknown chip version Si2147-A30 ROM 0x50
This patch fixes firmware file names assignment in si2157 tuner=2E

kernel version: 5=2E17=2E0
device: 07ca:1871 AVerMedia Technologies, Inc=2E TD310 DVB-T/T2/C dongle

modprobe gives error: unknown chip version Si2147-A30 ROM 0x50

device worked fine on 2=2E16 series

caused by:
1=2E table si2157_tuners has swapped fields rom_id and required vs struct
si2157_tuner_info=2E
2=2E both firmware file names can be null for devices with required =3D=3D
false - device uses build-in firmware in this case


Tested on my device=2E


Signed-of-by: Piotr Chmura <chmooreck@poczta=2Eonet=2Epl>
---

diff -u a/drivers/media/tuners/si2157=2Ec b/drivers/media/tuners/si2157=2E=
c
--- a/drivers/media/tuners/si2157=2Ec=C2=A0=C2=A0=C2=A0 2022-03-20 21:14:1=
7=2E000000000 +0100
+++ b/drivers/media/tuners/si2157=2Ec=C2=A0=C2=A0=C2=A0 2022-03-22 23:48:0=
5=2E604408331 +0100
@@ -77,16 +77,16 @@
=C2=A0}

=C2=A0static const struct si2157_tuner_info si2157_tuners[] =3D {
-=C2=A0=C2=A0=C2=A0 { SI2141, false, 0x60, SI2141_60_FIRMWARE, SI2141_A10_=
FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2141, false, 0x61, SI2141_61_FIRMWARE, SI2141_A10_=
FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2146, false, 0x11, SI2146_11_FIRMWARE, NULL },
-=C2=A0=C2=A0=C2=A0 { SI2147, false, 0x50, SI2147_50_FIRMWARE, NULL },
-=C2=A0=C2=A0=C2=A0 { SI2148, true,=C2=A0 0x32, SI2148_32_FIRMWARE, SI2158=
_A20_FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2148, true,=C2=A0 0x33, SI2148_33_FIRMWARE, SI2158=
_A20_FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2157, false, 0x50, SI2157_50_FIRMWARE, SI2157_A30_=
FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2158, false, 0x50, SI2158_50_FIRMWARE, SI2158_A20_=
FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2158, false, 0x51, SI2158_51_FIRMWARE, SI2158_A20_=
FIRMWARE },
-=C2=A0=C2=A0=C2=A0 { SI2177, false, 0x50, SI2177_50_FIRMWARE, SI2157_A30_=
FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2141, 0x60, false, SI2141_60_FIRMWARE, SI2141_A10_=
FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2141, 0x61, false, SI2141_61_FIRMWARE, SI2141_A10_=
FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2146, 0x11, false, SI2146_11_FIRMWARE, NULL },
+=C2=A0=C2=A0=C2=A0 { SI2147, 0x50, false, SI2147_50_FIRMWARE, NULL },
+=C2=A0=C2=A0=C2=A0 { SI2148, 0x32, true,=C2=A0 SI2148_32_FIRMWARE, SI2158=
_A20_FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2148, 0x33, true,=C2=A0 SI2148_33_FIRMWARE, SI2158=
_A20_FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2157, 0x50, false, SI2157_50_FIRMWARE, SI2157_A30_=
FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2158, 0x50, false, SI2158_50_FIRMWARE, SI2158_A20_=
FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2158, 0x51, false, SI2158_51_FIRMWARE, SI2158_A20_=
FIRMWARE },
+=C2=A0=C2=A0=C2=A0 { SI2177, 0x50, false, SI2177_50_FIRMWARE, SI2157_A30_=
FIRMWARE },
=C2=A0};

=C2=A0static int si2157_load_firmware(struct dvb_frontend *fe,
@@ -178,7 +178,7 @@
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0 }

-=C2=A0=C2=A0=C2=A0 if (!fw_name && !fw_alt_name) {
+=C2=A0=C2=A0=C2=A0 if (required && !fw_name && !fw_alt_name) {
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dev_err(&client->dev,
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "unknown ch=
ip version Si21%d-%c%c%c ROM 0x%02x\n",
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 part_id, cm=
d=2Eargs[1], cmd=2Eargs[3], cmd=2Eargs[4], rom_id);
=C2=A0
