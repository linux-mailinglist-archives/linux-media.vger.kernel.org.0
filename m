Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CCE49673A
	for <lists+linux-media@lfdr.de>; Fri, 21 Jan 2022 22:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiAUVSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 16:18:51 -0500
Received: from mout.gmx.net ([212.227.17.21]:44979 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbiAUVSv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 16:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642799930;
        bh=GyuEgoPJpaigtO6G3guV16gCj/T62drFBhDmR6Tm/Nw=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=NUMAYFvsXKT1WZCWUNB4fhNDdzF7BnomLJjyYu0+2meUvVqx2ErSY9/IumvqUu299
         Vbdn2M89XLhhw7NN+e19SVB6eUmkLSeyczt98DP3IQP1bnZA+7zuwEEEP6gjw419/j
         Hdev+9W4YwhEpSrw6NnTafhlLAA51rFWBlAKrg8o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.109.130] ([91.65.109.130]) by web-mail.gmx.net
 (3c-app-gmx-bap04.server.lan [172.19.172.74]) (via HTTP); Fri, 21 Jan 2022
 22:18:49 +0100
MIME-Version: 1.0
Message-ID: <trinity-22c77578-26b0-4867-9ff7-2668e5d22c64-1642799929896@3c-app-gmx-bap04>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: dvb-core: Enhance shared multi-frontend support
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 21 Jan 2022 22:18:49 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:gxi7gB6nLpyXnOUkpqUJor2A1vwS9ltb92qNKJSKxFEh8ZZAdSur7bgqtHCWdf0ARGc63
 YKYASh7E8s4GR/u8neSFcxS/XWfytXlD8+8H1MQofwS90htJeEDmpF6hhvItcqTY9KYxAGcr6qAm
 yfTrc4JBjQgbh7A/gbqRzQHcmzJ77XAbywrIrqwWbdN3kCGB6d5O46dd/c4nMEwlLn5yn7FIHNjq
 mJu2DiavuzAestz16HYj5LYTMDhdVZ6s2xxOp1H25m4CNuZEok2zYmphJugT7Zp25gmvJ31TAXW2
 Ho=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XDwUcH/SoYE=:/PzKFFU8LvAEnimDYghfM3
 frBFFArzxhWqi9cUWlpdsJ21Nag+kDOFMHeMYPMBHY+119i488/XjeJ/Dp3VpOZnmEyAk13ER
 /Sb4wr+5kslfoXzPp+9AzpLgQvLNBeBbmyGCzy5IJJKU9zxvVHDKc56tgTA1R+dfAaOMFBOye
 nt2bUoifK4Iws5BVkLEUTg4Dzw99ugd/JDhKhrB1csyGya1YMkVGQnpX/WxU3T5y3mRvHso4r
 FGsinOdMGWqCUz4vhwIT65ET/px80hotReibwq18O0RWvnYJxyDzOQvrlFfvunnv16mIm9Mqf
 vZ3QydPKtl385MnObyL1aeqRvp6GOL+mfeovHjek8cl28k+UU581bVaiUhUR0Z52nAi1KYebW
 NFofnOC01XrYnW+CmIyqpfC+3cAt3kT5PBsWqhDILbAegoP8iHwrXZOmabK4+bzhYuvvcB1Yt
 Et5/L1Vqdf44+Bu7FVA3jh1+XEFl8aZFsZBdCpfFp2VJMXhULdfzzzo9hYBEahYgiXZ90Vfsc
 2pYshTh8+6u41mGOvRKCDvrPeWJCEzm9lqIGqAzAy4RpRD2v4ttNUphj23NZVP6U2TZgVWmHB
 24kAHsIy4mdVe7dVJzYwn4TjRwM/mwRewcdpGIbojM/4bRmwi0Nz8subGysIauXJ8/FsiOkZ1
 bCR3V5CbQkSOSyS+Y5m5lHHsoLqmWZCPvG8kfsPj/watUipllzTLIy7sL2oJMiAyH+Wn46iap
 WGRGp3IkfUw8ITfcyzAQphb2DVRDFjl7Lik2uy1uvimaJGpAZZwn1zHZHygro072lnbzDPsQo
 yG6Dsvu
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers for devices with multiple frontends which cannot be used
concurrently due to hardware limitations which enforce that restriction
by setting the mfe_shared field to 1 exhibit rather unfriendly behavior
towards applications: The unavailable frontend devices cannot be opened
at all, not even for read-only access to query information. Even worse,
any open call is blocked for 5 seconds by default.

Allow drivers for such devices to behave like regular busy frontend
devices instead, i.e. still allowing concurrent read access to the
unavailable frontend and denying concurrent write access with -EBUSY
without delay.

This patch does not alter the behavior of any existing driver to avoid
regressions. Driver developers who wish to take advantage of this must
ensure their driver can handle all read-only accesses to the unavailable
frontend, and indicate the capability by setting the mfe_shared field to
2 instead of 1.

Add a check to dvb-usb-init.c when automatically setting the mfe_shared
field that when a driver has already set the field to 2, it is not
overwritten.

Document the additional capability in the code comment about mfe_shared.

Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
Tested-by: Robert Schlabbach <robert_s@gmx.net>
=2D--
 drivers/media/dvb-core/dvb_frontend.c    | 12 +++++++++++-
 drivers/media/usb/dvb-usb/dvb-usb-init.c |  2 +-
 include/media/dvbdev.h                   |  6 +++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-cor=
e/dvb_frontend.c
index 48e735cdbe6b..24c268b20661 100644
=2D-- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2754,7 +2754,17 @@ static int dvb_frontend_open(struct inode *inode, s=
truct file *file)
 	if (fe->exit =3D=3D DVB_FE_DEVICE_REMOVED)
 		return -ENODEV;

-	if (adapter->mfe_shared) {
+	if (adapter->mfe_shared =3D=3D 2) {
+		mutex_lock(&adapter->mfe_lock);
+		if ((file->f_flags & O_ACCMODE) !=3D O_RDONLY) {
+			if (adapter->mfe_dvbdev &&
+			    !adapter->mfe_dvbdev->writers) {
+				mutex_unlock(&adapter->mfe_lock);
+				return -EBUSY;
+			}
+			adapter->mfe_dvbdev =3D dvbdev;
+		}
+	} else if (adapter->mfe_shared) {
 		mutex_lock(&adapter->mfe_lock);

 		if (!adapter->mfe_dvbdev)
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/=
dvb-usb/dvb-usb-init.c
index 61439c8f33ca..341d6c7a6bba 100644
=2D-- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -92,7 +92,7 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d=
, short *adapter_nrs)
 			goto frontend_init_err;

 		/* use exclusive FE lock if there is multiple shared FEs */
-		if (adap->fe_adap[1].fe)
+		if (adap->fe_adap[1].fe && adap->dvb_adap.mfe_shared < 1)
 			adap->dvb_adap.mfe_shared =3D 1;

 		d->num_adapters_initialized++;
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 2f6b0861322a..6ccff7c6fa6b 100644
=2D-- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -87,7 +87,11 @@ struct dvb_frontend;
  * @device:		pointer to struct device
  * @module:		pointer to struct module
  * @mfe_shared:		indicates mutually exclusive frontends.
- *			Use of this flag is currently deprecated.
+ *			1 =3D legacy exclusion behavior: blocking any open() call
+ *			2 =3D enhanced exclusion behavior, emulating the standard
+ *			behavior of busy frontends: allowing read-only sharing
+ *			and otherwise returning immediately with -EBUSY when any
+ *			of the frontends is already opened with write access.
  * @mfe_dvbdev:		Frontend device in use, in the case of MFE
  * @mfe_lock:		Lock to prevent using the other frontends when MFE is
  *			used.
=2D-
2.17.1
