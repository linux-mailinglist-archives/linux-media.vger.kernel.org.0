Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0283169D7
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 16:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhBJPOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 10:14:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhBJPOl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 10:14:41 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E913AC061574
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 07:13:59 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u14so3022608wri.3
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 07:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=ZfKf7rqxS1wFyMhkp51J0fpBy68dVyueXN7oY+qFjm8=;
        b=YdWeqWgt5Ho/4eNR/UKp4rxVGEH+dFp94WAoOGrPMRs+IHsPBPkQNiCFcwGSgCsbmT
         x/pvmVCq+Bpda4FtlKsr33xcbW1VhqLVZEMPfWXm/Elf5FBzoJd+gki+cTwHMOUs5eZm
         tmBdzbCYpemYflNfpYRlVtH3PvBJmUAvjsl3aNO3STSMbuyHS8gL/lCXL8IXOEf0X0HP
         6W0i3JaRzNsXzpPVvn0CPTQVhpmI/ioAnaQZn1cgIDNgMkVhPLtTAw1DnONSuvxuYs24
         aojrEvVb2muVo5Y1YUCWfknX7PPoWeGYr6vj8Q35N3+fXUZrW12TqXU1aZhfY8L+oghP
         dFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=ZfKf7rqxS1wFyMhkp51J0fpBy68dVyueXN7oY+qFjm8=;
        b=f5dMK3Mpn7bgVwHJDFvbZMUB2ZO3w7VwcMLkx4K9UYTYPdkWM6i47RGNSc303EfP1K
         HhFdg9a6rRA5UrU2+EEJBCP+fO/2qtJ2V2iFSgNd0TKDNvOnaRhAqjPkBqgA/SgQMwCf
         SJoz670Low++BqFywLj+90tVAd+e/CeN7WuSNxYwOs+eqFRhlrsSCir7hHFNkDuoVGFc
         jnp9InDE3CYOKnzi0h+Lzjk4MUM3+Vt0SUi9i89eao5+Jkasd10VUq66fASTreo+fMgg
         fVpfmR7RHFt/OOWszqsXfIU1QFwkDA8CC0yaVPEUnVsWmF/NS7mu6sv1BxaOP8SmvUja
         DlIQ==
X-Gm-Message-State: AOAM531d2NsL1WUhZquDfPkp92KNcMpkqRQsq20Q3WhirYK+hjRbVBmN
        aV9MitK5gnG4B+pBF4RvY4l75WHCKRo=
X-Google-Smtp-Source: ABdhPJzomBDuOEldJUFpE2W22S9G0moj7fYJ61uUcFV/S8sv/W8DY+2tnYiAKGxuKDZZSc/F6Tz+ZA==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr4192305wrm.234.1612970038687;
        Wed, 10 Feb 2021 07:13:58 -0800 (PST)
Received: from [192.168.200.12] (p3ee2b971.dip0.t-ipconnect.de. [62.226.185.113])
        by smtp.gmail.com with ESMTPSA id j17sm2633987wmc.28.2021.02.10.07.13.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 07:13:57 -0800 (PST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Stefan Seyfried <stefan.seyfried@googlemail.com>
Subject: [PATCH] v4l-utils: fix DVB-S scan
Message-ID: <cc3f28bd-ab2c-2ca7-c35f-9944e0e2853a@message-id.googlemail.com>
Date:   Wed, 10 Feb 2021 16:13:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------E11746828A0454CCA0D23937"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------E11746828A0454CCA0D23937
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

dvbv5-scan did report all channels as DVB-S2, due to broken logic.
Debug output showed "modulation_system DVB-S" correctly, but the code 
that stores the delivery system for output used a different (IMO 
invalid) logic.
This in turn made drivers that actually care for the delivery system 
(e.g. b2c2-flexcop-pci / cx24120) unhappy, resulting in incomplete scan 
results. For drivers that just don't care (e.g. dvb-usb-technisat-usb2 / 
stv6110x) it "just" resulted in wrong "DELIVERY_SYSTEM = DVBS2" for all 
channels in scan output.

The patch is attached, because I'm pretty sure that Thunderbird would 
mess it up. You can also fetch it from

https://github.com/seife/v4l-utils.git fix-dvbs-scan

Best regards,

	Stefan

--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -1118,9 +1118,12 @@ static void add_update_nit_dvbs
                              dvbs_dvbc_dvbs_freq_inner[d->fec]);
         dvb_store_entry_prop(new, DTV_ROLLOFF,
                              dvbs_rolloff[d->roll_off]);
-       if (d->roll_off != 0)
+       if (d->modulation_system != 0)
                 dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
                                      SYS_DVBS2);
+       else
+               dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
+                                    SYS_DVBS);
  }

  static void add_update_nit_isdbs(struct dvb_table_nit *nit,
-- 
Stefan Seyfried

"For a successful technology, reality must take precedence over
  public relations, for nature cannot be fooled." -- Richard Feynman

--------------E11746828A0454CCA0D23937
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-dvb-scan-fix-DVB-S-S2-type-reporting.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-dvb-scan-fix-DVB-S-S2-type-reporting.patch"

=46rom 40fff15906b59457adb5d7a1a3ededf6c51af6af Mon Sep 17 00:00:00 2001
From: Stefan Seyfried <seife+dev@b1-systems.com>
Date: Wed, 10 Feb 2021 15:13:38 +0100
Subject: [PATCH] dvb-scan: fix DVB-S/S2 type reporting

All transponders were reported as DVB-S2, and later tuning with the
resulting channels file failed with drivers that use the delsys field.
(Apparently most modern drivers do not really care, probably this is the
reason this could go unnoticed).

Signed-off-by: Stefan Seyfried <seife+dev@b1-systems.com>
---
 lib/libdvbv5/dvb-scan.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index 5c8aca96..0749d262 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -1118,9 +1118,12 @@ static void add_update_nit_dvbs(struct dvb_table_n=
it *nit,
 			     dvbs_dvbc_dvbs_freq_inner[d->fec]);
 	dvb_store_entry_prop(new, DTV_ROLLOFF,
 			     dvbs_rolloff[d->roll_off]);
-	if (d->roll_off !=3D 0)
+	if (d->modulation_system !=3D 0)
 		dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
 				     SYS_DVBS2);
+	else
+		dvb_store_entry_prop(new, DTV_DELIVERY_SYSTEM,
+				     SYS_DVBS);
 }
=20
 static void add_update_nit_isdbs(struct dvb_table_nit *nit,
--=20
2.26.2


--------------E11746828A0454CCA0D23937--
