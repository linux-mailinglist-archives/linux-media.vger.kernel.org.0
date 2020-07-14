Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D346321F6D0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 18:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgGNQMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 12:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgGNQMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 12:12:02 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E04C061794
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 09:12:02 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w17so7209062ply.11
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=0pMER59zTEFCPAzYOXTvQjgFvMsQNU2wxnyfGlWXCK8=;
        b=odhsBOK7Dgsk9AwMGr6lT8saTB5fWsOT0qaMckMoW6gEv0VosvdF/0M53UbuqlY+13
         b6u0P/6n1Iv6RfwD8Bc/WTYPsTkvhKzvh879nKylvzD21IiRuMbX0M7P/Qq5a9Ou86t3
         tHv3vxSVAgNd+xlKnUkQxu5hfscMjOUmFELAVErVsfbbBFnKvLq1E3NhNuQu176rE9wx
         lU9ykeW3g9HV1r+lPXz0LELG7I04T3yKx4C9b2OmAy8ljGsh1g6XHppS7V5uM9cFGFdL
         ixop94+RbLFBWtg5g+zoZYZelkVIg97i3btZZpY4tkKnODWFMYm2JbHbww+x6fZdXJJR
         4+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=0pMER59zTEFCPAzYOXTvQjgFvMsQNU2wxnyfGlWXCK8=;
        b=qxZJUH1njRkNg+Oc6kwCtVq8MG5WMuRRHB5XP/2fRMvnPPeGHJb1B6hV/R/lSpBu2Z
         hPsomwJ0i0OS6CUzZ6IBgOQ/pM3bYb68lhSy0VXYvzpl3e1CFmowZOJxzIh2qYEoRiP5
         OfwrhBSHzlvhCe00uUoPzSRpZ0y31UOlJ2SU+UUWgNodnQpKJ82/TuF35vkl+YMLVuUT
         2XGZi+AYKpRSm3yXe8drM3RkXYFC8t6Dm5KGWxiU8PpNmh3RMDwJtwX86ntvQ9p8qM0x
         Va/cA3Vmepgwf1MaCdBY0fKKdLBfPEpNJAcD11CejVRS/uTVT5Q0cls7sYMh6k4ZL+b2
         aZgA==
X-Gm-Message-State: AOAM533jUMaRx0xchVf+A9a0pjUOL3QZ0jduE2LEUqNSb7qH/fMK57uM
        1A8Nd0z3Onb3OXPqVOYFE64lXQ==
X-Google-Smtp-Source: ABdhPJwGhiWPsgEzHtTjHbl/LDABD/mDIC/JjphsdqGqk9EGUNuep6PXsbtiLe0c0diUGLTwra0wRw==
X-Received: by 2002:a17:90b:388d:: with SMTP id mu13mr5168726pjb.187.1594743121720;
        Tue, 14 Jul 2020 09:12:01 -0700 (PDT)
Received: from localhost ([2406:7400:73:6b0b:fdf7:8080:deab:8a49])
        by smtp.gmail.com with ESMTPSA id y63sm16208541pgb.49.2020.07.14.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 09:12:00 -0700 (PDT)
From:   B K Karthik <bkkarthik@pesu.pes.edu>
X-Google-Original-From: B K Karthik <karthik.bk2000@live.com>
Date:   Tue, 14 Jul 2020 12:11:55 -0400
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: atomisp: mark some csi_rx.c symbols static
Message-ID: <20200714161155.bnxojp5ajyaeli5k@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mw6ahgc7ryjyq7cq"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mw6ahgc7ryjyq7cq
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


--mw6ahgc7ryjyq7cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl8N2UoACgkQ471Q5AHe
Z2o8nwv/bHYM3mkUPZQMYVj6GOap6AfTeZIjZsYk9EqSvK93TxVV/IxHnKHBvXER
6GXyP5tJfgF5SiSC9Fz5wcA6fm7jJ4O7Q4P59Joac/Jcuo04RQ/IbpnMQDVvL2mO
0AXd/ZKj5Y/FBVHTW2qVyiywLh1eurO4D+q8A85y8DX8utVDk0obA8P3V17DsmIa
tllk98eCGAnpENnJTAR5JaCvCMtECWrR9qCN2KP1dcaZEJqMo9HUjmNAe/jhalLh
ofzor8oiyYPMCtOr0OaucpwxHgSAYctFMr5GES3DJcsqd4f5/tVNRzowU39YSfJo
aJpQGXMQKkyULjr6pSCfgOfsDs1H8+lsP/+6hndV0YMojYntnF5bweLkRdMro7Kb
6N1btTG1f1pXyDm53KuGAXNPeQrn7LO+mHc7vtOTPLzF8gfQ01TeZEGxfd3Yfblk
aX/XjWnqwRFC6lN0/ZvDe96/YxJ0QmrudM23iTMG2Fugm6f9bMThtLY5X33j/4vq
TL2p7CKP
=4I4M
-----END PGP SIGNATURE-----

--mw6ahgc7ryjyq7cq--
