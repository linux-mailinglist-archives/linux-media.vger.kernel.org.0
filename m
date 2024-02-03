Return-Path: <linux-media+bounces-4637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134E84864C
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 13:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C346B21401
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841F0482CF;
	Sat,  3 Feb 2024 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="mCwJyvpZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10AC17C77
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964524; cv=none; b=XHT8MgOHnAqwwPLWHYSh/1QxLJvop2ISgESuEg+3xMRHG6upmw40EGnR/mlWhhPkqCwNz00xeHWu/Ac1Z4eCu7rPDl/ME6xdSI9NqPgHwnGPtboyAY/os4d3yxoYYnZ3jAVjYNmF/iRMeP85qIh07ihBR4QNOztKlWAP3q7DtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964524; c=relaxed/simple;
	bh=U6od2DYtunY9aMSjDwtHn426/lUJpbHFnbl+LRJoGVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gDBOQI4nZ6xRBkLChljAlznTzG0i9qTIUTYunTfJtTUKErIkJj9ogTHRkpmT/j18PpfnRiOlpghfKXyihlWtE7H/oCmnAJ2APT9NjYGrfce8WeZR9SpRTXhDsXgqfMp1rk1H5LRd+Pf3lXtgWkDWxlonNHG+sOeRixhqaKuyAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=mCwJyvpZ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706964515; x=1707569315; i=nils.rothaug@gmx.de;
	bh=U6od2DYtunY9aMSjDwtHn426/lUJpbHFnbl+LRJoGVM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=mCwJyvpZ0MUEUwl0vkHtiyLuEL5GTpYu0Uc95OUYNHeua8VKArsPor+NXNJRilVV
	 n251JjcDCkF0Iiri3bBsItyIL2dd04ovRMeE2BKANYbQEUw3H7zVQ44LZeOpeHWyu
	 21iXNaD80mvwCWzlOCDUz77LcW0Yb8D1ChY+JrmxszQT9OYULBIO9RonwpCOseKDE
	 oQwuX8PmNH812hI6cjAHW0zj1pKh35xUT1zSy8h484DBIsyW+YI1OgMn+aUrUDTFo
	 z5ZdZGIvepWKsGIrwCustff9Kx1c8Vph0hyMR8lgYJrQ4IvB8PCeAu3klO05YVkk+
	 TQct+49w4ypM35SI2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1My32L-1r6rsK2VA7-00zXCq; Sat, 03
 Feb 2024 13:48:35 +0100
From: Nils Rothaug <nils.rothaug@gmx.de>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Nils Rothaug <nils.rothaug@gmx.de>
Subject: [PATCH 1/4] media: tuner-simple: Add support for Tena TNF931D-DFDR1
Date: Sat,  3 Feb 2024 13:47:42 +0100
Message-Id: <20240203124745.10257-2-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203124745.10257-1-nils.rothaug@gmx.de>
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BThAH31c96jWPIr7OVfH4HvDoP/cjavBzPV493RDQHa2lDeShfi
 UNgNx//NGYpGpxCTDawdo0+BLsEtVEH0Nw7NOzUvuht7Od6nDX1OIUSgFz7vnsRFe4KSw3r
 OpehFZjfXW3Vbwy99TjrtzSHTNQDr6CLBc2iACElD6T1eeHge1yrlKZ4ouu8lESiimoUb7Q
 NZEvCjJTMN1pnfo06qMQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p6KcgjkXByA=;Z/2A/L2zyxFYD+okVr0sZRElh5z
 NI0DxCSyPrb+PhSNqhjQJTNCbl2euN8qzvfsHT8OSuFcihzMmB6j7vBY5kSl+NHpb5uhBLqGd
 f74z7vnnh+aLSV/67kCaBA3Ek0pVHuAMT7XQAq+6jJj+Q3VoTibxlEPFZATXUz52p2Q2GtRzw
 rIKzdz+vTWsggL7KyKSAhyo2Zz+eSs53RCAH3J7OrhqDTxjhJEdYlMXNoJdGo/l9YOi4Oc2TH
 eSV+8Oe9Hduh+lTladwOL78SEpmkTAXXne+J4j0Fx0VK9/CNUw+T/sDzJKo/WNnh1ERmGZwQx
 wjAs3QD3dzhDx9C5HvEj+9Mc34g1GhqOI5kdsA4iRBVM3fRPONPEtTw9fijhR6JvklP0n6rFB
 Mdoj9K71Jfo4fO8otEj7rC630abZLpC5P9qdnJhAHMhFw5b3kioRAaZasrXyG60hxQIq2N9Gq
 W/mge6Dr60UQDqTLzENAykET/ePMwvusDuGlBJ7LsKrPepBFrVUmeZbtQBrCR94Fga2iXePRN
 NsqdcXAMYHip3FuuNNuEP+5+AKpMbCmta1h/R1kSDLM6n682IHXbfjLkGhBArXdIR6ppBmk3p
 2DxesfUZXle98/s9+JUlHYe4DAG41WtbOlBeSbyiurxtDEPRmkh8ovHJgw7patid05EAMb3Jx
 Dkp5/b3JZTeZPCqGHlo0pN2JuOoVwCx+NcFP5L7wKt1erJtcn69bMKDi2FZyb3Cs+P25usU2U
 cpm7DLFcYIn3wkZSwfPuujVrKJAIESYA2kbwD4M7NbsbVmlwrJPim0G/3vcfrNJmfkH57oJlQ
 Vm4MDYlCAGX7h7jKZ36x9Em6KmTSNn/Db7Ns+erHZTeMI=

Tuner ranges were determined by USB capturing the vendor driver of a
MyGica UTV3 video capture card.

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 drivers/media/tuners/tuner-types.c | 22 ++++++++++++++++++++++
 include/media/tuner.h              |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/tuners/tuner-types.c b/drivers/media/tuners/tun=
er-types.c
index ff5a6c0acdd..cec2d6fefd7 100644
=2D-- a/drivers/media/tuners/tuner-types.c
+++ b/drivers/media/tuners/tuner-types.c
@@ -1434,6 +1434,23 @@ static struct tuner_params tuner_sony_btf_pg463z_pa=
rams[] =3D {
 	},
 };

+
+/* ------------- TUNER_TENA_TNF_931D_DFDR1 - NXP TDA6509A ------------- *=
/
+
+static struct tuner_range tuner_tena_tnf_931d_dfdr1_ranges[] =3D {
+	{ 16 * 161.15 /*MHz*/, 0x8e, 0x01, },
+	{ 16 * 463.15 /*MHz*/, 0x8e, 0x02, },
+	{ 16 * 999.99        , 0x8e, 0x08, },
+};
+
+static struct tuner_params tuner_tena_tnf_931d_dfdr1_params[] =3D {
+	{
+		.type   =3D TUNER_PARAM_TYPE_PAL,
+		.ranges =3D tuner_tena_tnf_931d_dfdr1_ranges,
+		.count  =3D ARRAY_SIZE(tuner_tena_tnf_931d_dfdr1_ranges),
+	},
+};
+
 /* --------------------------------------------------------------------- =
*/

 struct tunertype tuners[] =3D {
@@ -1946,6 +1963,11 @@ struct tunertype tuners[] =3D {
 		.name   =3D "Silicon Labs Si2157 tuner",
 		/* see si2157.c for details */
 	},
+	[TUNER_TENA_TNF_931D_DFDR1] =3D {
+		.name =3D "Tena TNF931D-DFDR1",
+		.params =3D tuner_tena_tnf_931d_dfdr1_params,
+		.count =3D ARRAY_SIZE(tuner_tena_tnf_931d_dfdr1_params),
+	}
 };
 EXPORT_SYMBOL(tuners);

diff --git a/include/media/tuner.h b/include/media/tuner.h
index a7796e0a365..c5fd6faabfd 100644
=2D-- a/include/media/tuner.h
+++ b/include/media/tuner.h
@@ -133,6 +133,7 @@
 #define TUNER_SONY_BTF_PK467Z		90	/* NTSC_JP */
 #define TUNER_SONY_BTF_PB463Z		91	/* NTSC */
 #define TUNER_SI2157			92
+#define TUNER_TENA_TNF_931D_DFDR1	93

 /* tv card specific */
 #define TDA9887_PRESENT			(1<<0)
=2D-
2.34.1


