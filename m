Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9914E57D5
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 18:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343800AbiCWRvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 13:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343785AbiCWRvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 13:51:45 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BBF84EF9
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648057812;
        bh=1RQBo04LciemdVXcvmw7hTtkhViCBD+s7mWTKnbp0Dk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dMLeMbtnJhDrR+KeHnYEDUXGznSa+SwERmS35iK5F7OYKoZWu+TxQM8kzA3813VPi
         1BtW6za18dQXvhAGY9poxu95vma1zEmHvkq6OzU1adJyRszYC4nprzx7TH8eI3ZpmI
         /M0oY/FYoOgOv8ObXhD1y0gsJtz21hYbm49H8i5Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.110.57] ([91.65.110.57]) by web-mail.gmx.net
 (3c-app-gmx-bs71.server.lan [172.19.170.216]) (via HTTP); Wed, 23 Mar 2022
 18:50:12 +0100
MIME-Version: 1.0
Message-ID: <trinity-6009a608-b0ff-4e1a-9b91-ba4a97f10324-1648057812747@3c-app-gmx-bs71>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Piotr Chmura <chmooreck@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] si2157: unknown chip version Si2147-A30 ROM 0x50
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 23 Mar 2022 18:50:12 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com>
References: <6f84b7f4-3ede-ae55-e99b-a9d4108c80e2@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:QrUxHWvzZuXuUSYAzjKsN7/u4zNjtPbqgguvVCrAK/irvujrEeDYNpLC2wrk7IryRfSwQ
 R5O35gfDY1GZ7onE/80+I4Z6bjtEbxS/hKb79uQz8C8GZCjCTifDU/aDi9dmU7XP2UN5HGAaIR7O
 qQ2jFvW4fji8yx8xlnRTvkCtnlatsfMwwcUXDJYDp91Uyd3QDMYowEC1jv7Xd9roXcBud/FN5OUh
 /vupxeOFfYJdDyfStkgy+eL6zzKWQGOcMRuhmvvqZMa4XrzZK76P4qttZzTCM7AeA6HD+E7lbM60
 sI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:77n48AdINdk=:WqGgfYSh5hHEzPcHdIUXzO
 NY+7o1gMSZv7kKV6qVklLNJHHx/Edim002cpjJgx/4rJi8+I+ssGMdRRGGp2/dwBzHSaLW4ya
 +uXKq5/LHl82NM5XwE4qFWnNn6s7WnUVqUU41umfoWrlvYAlf+leJBHFdM/2EzgDu6TswzjsH
 DqoMbAF9Djfyp8r/Easa4UDBSHEj4kGMkfzAYigfUJZ3xxGEeyaJvop82/48eh/h3p+4C18Bo
 CjcSDJINOmM5JYzvLsPZrCSvKKcJNHzpDngrfNa8BI1fu4WBJ1RwkfFHeC0vgs0pQzNuYwe8c
 8ljUgC+AEwov1DrgBBFXSneV7N9+S+QEVcLcXwdSUydXp9QJIIsiBFhVSZbjggZ99QdQCefwJ
 F10+Smr3IDeap8R4ttXOOwHGI9HBbBzW1PxKVc3wZZPxJQUqigt3FEo6qQQb5kxkduFV4m2MX
 kF9o69tSbqzyv+ALjVDkJBwvUVo3COlM76wGi5delEwHs9JF4B8WsAWUeEarVSvayLv6DNXII
 CnSy/TzebVmQiR1onvC093maC6wQNy4mBFQt24aedKluEzs+B74hEqZ9aEjNt3c4kTlvj2I1R
 ku3P27RtWA4jdy6m5dqkCT/MHY4zNj2cMe7nAzW+wjn7HI93FUB4ENOiO/LcUl0W8GZI0JLdw
 PT8wkLu+WADlLr/9ryAsf8vyLKkp3LOVuhy82K241e12krSbWstJYxuHzBczHcoiF9zq+L1nI
 wsuT56LDiS4ew8LzS3MojOq99QommcDEXuv5z2jaQ9D1Dgze4XbqQazNC/VlpK3/1fUq0hETJ
 ePJiea6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I have now tested the patch and confirmed that it corrects the firmware
load behavior=2E

Before this patch it was:

[Mi M=C3=A4r 23 16:24:32 2022] si2157 12-0060: found a 'Silicon Labs Si215=
7-A30 ROM 0x50'
[Mi M=C3=A4r 23 16:24:32 2022] si2157 12-0060: firmware: direct-loading fi=
rmware dvb-tuner-si2157-a30-01=2Efw
[Mi M=C3=A4r 23 16:24:32 2022] si2157 12-0060: downloading firmware from f=
ile 'dvb-tuner-si2157-a30-01=2Efw'
[Mi M=C3=A4r 23 16:24:32 2022] si2157 12-0060: firmware version: 3=2E1=2E3

I=2Ee=2E it directly loaded the "alt" firmware file=2E

After applying this patch the behavior changed to:

[Mi M=C3=A4r 23 16:45:01 2022] si2157 12-0060: found a 'Silicon Labs Si215=
7-A30 ROM 0x50'
[Mi M=C3=A4r 23 16:45:01 2022] si2157 12-0060: firmware: failed to load dv=
b_driver_si2157_rom50=2Efw (-2)
[Mi M=C3=A4r 23 16:45:01 2022] firmware_class: See https://wiki=2Edebian=
=2Eorg/Firmware for information about missing firmware
[Mi M=C3=A4r 23 16:45:01 2022] si2157 12-0060: firmware: direct-loading fi=
rmware dvb-tuner-si2157-a30-01=2Efw
[Mi M=C3=A4r 23 16:45:01 2022] si2157 12-0060: downloading firmware from f=
ile 'dvb-tuner-si2157-a30-01=2Efw'
[Mi M=C3=A4r 23 16:45:01 2022] si2157 12-0060: firmware version: 3=2E1=2E3

So it first tried to load the new firmware file and then fell back to the
"alt" one=2E

And after renaming the firmware file to the new filename, I get:

[Mi M=C3=A4r 23 16:47:19 2022] si2157 12-0062: found a 'Silicon Labs Si215=
7-A30 ROM 0x50'
[Mi M=C3=A4r 23 16:47:19 2022] si2157 12-0062: firmware: direct-loading fi=
rmware dvb_driver_si2157_rom50=2Efw
[Mi M=C3=A4r 23 16:47:19 2022] si2157 12-0062: downloading firmware from f=
ile 'dvb_driver_si2157_rom50=2Efw'
[Mi M=C3=A4r 23 16:47:20 2022] si2157 12-0062: firmware version: 3=2E1=2E3

Tested-by: Robert Schlabbach <robert_s@gmx=2Enet>



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
