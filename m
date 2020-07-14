Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8766221F269
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 15:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbgGNNX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 09:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgGNNX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 09:23:58 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64ACEC061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 06:23:58 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mn17so1575412pjb.4
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=4tyb2WDwFS2aoAxOZTJuZZO8xIzZEBnfgQRrMTFVPy8=;
        b=gEkXrr3ujKnbFKozZYmYSKWkXIwMUEl0kj87Y52XG5O756MlCo18hrRS93htxsbthP
         kp8Sbtma0TC4EZLqrBUGQeW74DMIgtH6SX40KmCDNC36fvbt+2SDxIqe5AXVoIvyi5Sb
         pqgZpWSrs/LFzkuQJA+G+serReQq8+vo/oZONYqea/XLjYvffTxu1uYKfSptktwOtHwJ
         cZs77V21LVQHT/siPYiMZr3eguJyyeC/r3iFhjK3TU95rJD40CYI3dVfF8h5fWC367h/
         Rv1+YQ2bWX8iBFF0D2YvPUVn9cnu7xKdspxMvs9ikCeA0rnlzlItrwMQogYEQvTJbhsq
         wFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=4tyb2WDwFS2aoAxOZTJuZZO8xIzZEBnfgQRrMTFVPy8=;
        b=na2cZWFqSHQkodkzlxdWmpvehgm7dFeJmfuSzxg7p79Qpcd9jcidy4k3j+nLgVPhFu
         TrnJccvknW6Gtq5U4BbD19cRNf2714Lp8hO6gU+spHZFijeMe1Gm0NQNLo1g04GOtdvQ
         Jvg+ssug92snMA2ZkERzHg4ywkGLr5f4QZj5NaDSjiBBUUeGdXhPaJZn83hKmWAR4q5n
         4Cb2iPWPWx0Id6bu/nueXzetp342uUCmyWD+kYMXFLYTrH1Ph+325ZiNZC814DQ1r3QO
         7pi3EDTeKMK6tuTgQjGPKHC7FaeDren4eV5TFgplaNJSpdYnLaauUuLY7S9ZvbVh+CtN
         eqcw==
X-Gm-Message-State: AOAM5302RDNr1ltkj/gjIb9iA4u19hxuOfyJvCvQJflU1EOoDNFl7TgN
        cf+H5gFgDk7eQ/JaTQIBrUbs8w==
X-Google-Smtp-Source: ABdhPJwzRaA4tJhjLno+GpL8qdTMO5ieciJeOHn1En2igShXXa0max+08dg16ajrcA9WvWEenrMkrQ==
X-Received: by 2002:a17:90a:454f:: with SMTP id r15mr4607372pjm.6.1594733037918;
        Tue, 14 Jul 2020 06:23:57 -0700 (PDT)
Received: from localhost ([2406:7400:73:6b0b:30fb:46c3:cbfb:2554])
        by smtp.gmail.com with ESMTPSA id n9sm2631321pjo.53.2020.07.14.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 06:23:56 -0700 (PDT)
From:   B K Karthik <bkkarthik@pesu.pes.edu>
X-Google-Original-From: B K Karthik <karthik.bk2000@live.com>
Date:   Tue, 14 Jul 2020 09:23:50 -0400
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: staging: media: atomisp: pci: css_2401_system:
 host: csi_rx.c: fixed a sparse warning by making undeclared symbols static
Message-ID: <20200714132350.naekk4zqivpuaedi@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="52gap7mw3pinsur3"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--52gap7mw3pinsur3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

changed symbols N_SHORT_PACKET_LUT_ENTRIES, N_LONG_PACKET_ENTRIES,
N_CSI_RX_FE_CTRL_DLANES, N_CSI_RX_BE_SID_WIDTH to static because they
were not declared earlier.

Signed-off-by: B K Karthik <karthik.bk2000@live.com>
---
 .../media/atomisp/pci/css_2401_system/host/csi_rx.c       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.=
c b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
index 8e661091f7d9..4d2076db1240 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
@@ -15,26 +15,26 @@
=20
 #include "system_global.h"
=20
-const u32 N_SHORT_PACKET_LUT_ENTRIES[N_CSI_RX_BACKEND_ID] =3D {
+static const u32 N_SHORT_PACKET_LUT_ENTRIES[N_CSI_RX_BACKEND_ID] =3D {
 	4,	/* 4 entries at CSI_RX_BACKEND0_ID*/
 	4,	/* 4 entries at CSI_RX_BACKEND1_ID*/
 	4	/* 4 entries at CSI_RX_BACKEND2_ID*/
 };
=20
-const u32 N_LONG_PACKET_LUT_ENTRIES[N_CSI_RX_BACKEND_ID] =3D {
+static const u32 N_LONG_PACKET_LUT_ENTRIES[N_CSI_RX_BACKEND_ID] =3D {
 	8,	/* 8 entries at CSI_RX_BACKEND0_ID*/
 	4,	/* 4 entries at CSI_RX_BACKEND1_ID*/
 	4	/* 4 entries at CSI_RX_BACKEND2_ID*/
 };
=20
-const u32 N_CSI_RX_FE_CTRL_DLANES[N_CSI_RX_FRONTEND_ID] =3D {
+static const u32 N_CSI_RX_FE_CTRL_DLANES[N_CSI_RX_FRONTEND_ID] =3D {
 	N_CSI_RX_DLANE_ID,	/* 4 dlanes for CSI_RX_FR0NTEND0_ID */
 	N_CSI_RX_DLANE_ID,	/* 4 dlanes for CSI_RX_FR0NTEND1_ID */
 	N_CSI_RX_DLANE_ID	/* 4 dlanes for CSI_RX_FR0NTEND2_ID */
 };
=20
 /* sid_width for CSI_RX_BACKEND<N>_ID */
-const u32 N_CSI_RX_BE_SID_WIDTH[N_CSI_RX_BACKEND_ID] =3D {
+static const u32 N_CSI_RX_BE_SID_WIDTH[N_CSI_RX_BACKEND_ID] =3D {
 	3,
 	2,
 	2
--=20
2.20.1


--52gap7mw3pinsur3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl8NseYACgkQ471Q5AHe
Z2q9wgv/V4UWsixwDSiDh5IhJKpSctI49K7a+54UXQNdlMduZb2oJZA9jbN/PoRd
2hdgclHErUk54YcJpaVyooLd6HWJoz0lB+Nf4/rWrlEYsPAoeAo6Aoji76VgX+9I
HLBLPH20N9CTA584xJjiluVIdYnuKo/jX/hIDHuU8pZOJbqc8exnmkJVBO7o3mCF
Cz/VeL/GAuFglQ4mzlVFFWfEjEnsrbMiL3qZPgzvS10cjn4htz07hhrcWdmYtnr7
vICyPutw7y3wLchTKwCy3hRwap6Bz2mst2ViYFGkX32iAomdL5ZHCzlPC6xneQq0
EOfN9OAECH9Kw+AjnxFN6EDyIYCGXmC88c+l3u9fJeHqPjY7tKXdVOerC36dOSJa
MJouVcyOxKR54eBVy60F+2mM22SUqQJ0r1c9FIkzj9qF+snEFCQmz6BPXjNvNKIY
u9hBEyu+RsalTLzIwvgZa6xKVfCPFDD+tLoAtxBGAZdh6UYnJgtp0QS2hmx+ZnM2
03gE5VRj
=6ueS
-----END PGP SIGNATURE-----

--52gap7mw3pinsur3--
