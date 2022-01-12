Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C70848BDB1
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 04:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350325AbiALDdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 22:33:43 -0500
Received: from mout.gmx.net ([212.227.17.20]:37661 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbiALDdm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 22:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641958421;
        bh=DDM57Gc4p9eLUXpc+kX6z5x7b+X/a+ASHYfFFcKMfbs=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=iL82EOzAJ/TB3R/h5hK1XSns0K3agWVLzgwZmsVw1T8CieN7wQXtZI9+bcTaYsN8W
         j0aksdBwmQGzlZJfDMJFC58K28watz1wDMm0W4HDAD5A1+2yJeTdxnnIkmIzDO+x84
         6kUp1KtnZaSgi+1laYjjvry5QB2+QKBDq+S65AhE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Wed, 12 Jan 2022
 04:33:41 +0100
MIME-Version: 1.0
Message-ID: <trinity-5f5afda9-657a-4a91-bf15-842f4f249535-1641958421391@3c-app-gmx-bap21>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: dvb_frontend: add missing DSS switch cases
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 12 Jan 2022 04:33:41 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:mgwv/qXL1Foc3m6mUSvY1ZdgsFYbL45meQSyMrVAX9fsq+D/6+zE0p5xb3lMYUAKfM+PI
 oEeWzqFACmdZE+BC1Ep/V/BDxU0KDvtp9k3lRbehkHXgDqtEjk1mllmBeMm+bkZKDGkv5oEkKULY
 IHBIILPKsVzPMub6ylxgr+/UGLgkF6j1p0EL7BziT724302xo2eChb60ayQ/Ldn2LKUmqSSenv3V
 duoDC652IQuk7gNypnvRywhZJC94WTvuHiApmp3vxn4lbz/GsIG3pSB0nKcixNjMm/JU+KorQne2
 Bk=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aGHPlq0PnAw=:Tu8AToDnx90x4MZQaDxKIJ
 nI/GhF5l9cm5xHFlaOMBZBbk6DH91a/qAwJzCWLk3K+9TekoEgWD17lIgY7bSHWRsgUao02mT
 6gxbZPU7wvYdep2nSpSrQIvTVhId4tRpPsBWM3la4WvkOpYL/DBRZsZZnUXY41n+7yAbPEyPv
 6QRn6FI16hY0OxYAy5htCsppY/HtNbMLCTJa3go33ej6ueTzd+1lNnt65XxIs5YJ+f2b0AJLs
 UOGk6ibBaI8fI7qd6eKDSzL3oLHWg/6dABLorpo8J3vHaKv7fvbYfwbwfC9MFULEMLums2qnP
 QnZ7IyBv8METXKtDh2BiQ6UPik4W2HVsBeTxScKkSIK9o/uocDN87WqSYf9aag2wI+uVmPz3I
 Sk9Vxto9QZiOVfoQD9lyO+cn72GnPa2n5vyluAb9u0AMcQlLyMzdaswxIjEANZ++yUg4+i94O
 fYYMesdcSx6+Ejw/D3hE5atilBzspJSkZgGxarsSVxRY1/taage7DNXwtUCmCTbNEfp/mq8mV
 ILCuFOIxRXoTxrVZ2uHCQeu3wB+pIpn9g2yZPBfQhJsgit0XPoISnVtzuYKkjYJhtA6T9yVJ0
 Dl3gKwTrrT0LJziK4AC6I1i8GAvwdz1ndDvXMZcGV6mEeJOSehIQ/03L1EUXMR67LIQ29+P5k
 pqFm0qfimD+JHeS5Al1oe669Je3rJZqFHv47Nl4xM+6FBEuLS8Oam7iiaPDcmWk525UN/iJ64
 +ngLRiQ+fU2m1LwcrFzfX0OMnn7R9mFWc6/zgV7OvVQGQREhXMFO8AM61Q09dSnrAiekS0+8x
 vhkMbW9
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the documentation mentions the delivery system DSS as a satellite
system, it was missing from all but one switch statement in the DVB
frontend code, leading to tuning failures, because the frequency was not
correctly handled as being in kHz rather than Hz.

Add the missing switch cases so that DSS is handled like the other
satellite systems. For the rolloff, assume 0.20 as per one publication
found via Internet search.

Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
=2D--
 drivers/media/dvb-core/dvb_frontend.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-cor=
e/dvb_frontend.c
index 48e735cdbe6b..d0955e0c86f7 100644
=2D-- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -918,6 +918,7 @@ static void dvb_frontend_get_frequency_limits(struct d=
vb_frontend *fe,

 	/* If the standard is for satellite, convert frequencies to kHz */
 	switch (c->delivery_system) {
+	case SYS_DSS:
 	case SYS_DVBS:
 	case SYS_DVBS2:
 	case SYS_TURBO:
@@ -943,6 +944,7 @@ static u32 dvb_frontend_get_stepsize(struct dvb_fronte=
nd *fe)
 	u32 step =3D max(fe_step, tuner_step);

 	switch (c->delivery_system) {
+	case SYS_DSS:
 	case SYS_DVBS:
 	case SYS_DVBS2:
 	case SYS_TURBO:
@@ -974,6 +976,7 @@ static int dvb_frontend_check_parameters(struct dvb_fr=
ontend *fe)

 	/* range check: symbol rate */
 	switch (c->delivery_system) {
+	case SYS_DSS:
 	case SYS_DVBS:
 	case SYS_DVBS2:
 	case SYS_TURBO:
@@ -1040,6 +1043,10 @@ static int dvb_frontend_clear_cache(struct dvb_fron=
tend *fe)
 	c->scrambling_sequence_index =3D 0;/* default sequence */

 	switch (c->delivery_system) {
+	case SYS_DSS:
+		c->modulation =3D QPSK;
+		c->rolloff =3D ROLLOFF_20;
+		break;
 	case SYS_DVBS:
 	case SYS_DVBS2:
 	case SYS_TURBO:
@@ -1821,6 +1828,7 @@ static void prepare_tuning_algo_parameters(struct dv=
b_frontend *fe)
 	} else {
 		/* default values */
 		switch (c->delivery_system) {
+		case SYS_DSS:
 		case SYS_DVBS:
 		case SYS_DVBS2:
 		case SYS_ISDBS:
@@ -2288,6 +2296,9 @@ static int dtv_set_frontend(struct dvb_frontend *fe)
 	case SYS_DVBC_ANNEX_C:
 		rolloff =3D 113;
 		break;
+	case SYS_DSS:
+		rolloff =3D 120;
+		break;
 	case SYS_DVBS:
 	case SYS_TURBO:
 	case SYS_ISDBS:
=2D-
2.17.1

