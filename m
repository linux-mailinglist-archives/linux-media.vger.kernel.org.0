Return-Path: <linux-media+bounces-13981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13719139A1
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19C91C20B6A
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2991D12DDBA;
	Sun, 23 Jun 2024 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b="X6Ab9zNn"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178779CC;
	Sun, 23 Jun 2024 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719139633; cv=none; b=PZUO3DFVwTkVf6nCF+NCos/MksQX2K+bDfCtyQyPPy9C6WgS0re0x/xfiFRuFohq6HXKfYEaXZqXzrf6pdsaIxmdkik2E5vx0VfRf/L1YT5hbxJPAcP5xb2xfM/sjMHPqroLdKed89NYNPuEFr/iUddbLgd3QrJ8IUX1/RnwshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719139633; c=relaxed/simple;
	bh=I8SOFeUye/6FEwdpaA0q9VBk85kBDF2IvQvq3XgG0b8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eiGQu5EHnpfKkbCTTZD+tu0SVe2elu/FtFL6gFTpagSLUayRVzaXpLPmhGg8gw6BQz88CEwGvlxfdLjVKdYlqoCLaMibu5LMJkt7Ao+faY0sWmNAduLSgCB6umxrb6pot4TWGqUCVLHE7Y7bXe72lCH3e3+4itJDx3dTbKSZDhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=nils.rothaug@gmx.de header.b=X6Ab9zNn; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719139624; x=1719744424; i=nils.rothaug@gmx.de;
	bh=6sQjqM3punhnh9bJgwAVcpfrnZJ+xPumDwa1LIvJ7Vw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X6Ab9zNno3oUefpvyLNYZRTbXaJa6vVX1zY5kRCkl+1cvB5xndLXXylX5nXNFWF7
	 8vp3eZr3miYVBnX1t41+1kElyfHXZBs+XpyTCof/rqn0lcTRBtIiRWNIHCqDyd9YT
	 GxfOARaLuIKsqV3lJa/7PfiYNpHmUVjk5plTQV6WvQReRDtPOt79Aw/KtmgmioBJQ
	 ltza+KFhVwcLJgZgKbl4IkEDmtguBEOONchlMPU3Ic7BteDAZwitCUnnNwzYLG52K
	 33eT9Df+ndIwAT5cOF9v9P1RjlJKPg+VGkTUvcJYFlInbN0pADUUnKHBZRqS4nKEP
	 YiMvMfWMXOzdBMvKrA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from nilsr-VirtualBox ([83.78.44.59]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M3UZ6-1sKmmg1ahG-00FR0r; Sun, 23
 Jun 2024 12:47:04 +0200
From: Nils Rothaug <nils.rothaug@gmx.de>
To: hverkuil@xs4all.nl
Cc: sean@mess.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	mchehab@kernel.org,
	nils.rothaug@gmx.de
Subject: [PATCH v2 1/5] media: tuner-simple: Add support for Tena TNF931D-DFDR1
Date: Sun, 23 Jun 2024 12:46:43 +0200
Message-Id: <20240623104647.7697-2-nils.rothaug@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240623104647.7697-1-nils.rothaug@gmx.de>
References: <20240623104647.7697-1-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xhnBAwT3X4BITHf1eNIrdUfJzk0qZxJSIjfDaQ1x5VQcpanclEB
 /XyzHg2YYOrSrz+Uf3zzfTXY50h0tusnPOLnt+chJjqmF/RKJpCM0sYDZ+73hM3KSdAsUBF
 D2xoq5XEZI1jdq0ughKCB1b7hlMoNvVDsD3gY0/iwW/DUWaEfMgR/WTBxz6iRLWEOVxobH1
 nuBBzNFHRnuqm+VC5LjdA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8glhFzjSx5E=;WPOOGGnhXzoEKBkIQEag5fmdxjx
 txPHFiBiDJSf/nPMXrhvfojuj0ZgmuaUBu8GnS0BtJrrS/2ZQ2PBWclO7pm9A1HB5A5Y0RC4k
 seLhNc5zN19SmD82fVN/bYHpRrWn3xQjQxfj43Sqjq9xBlvry111K7i87KV6c+4aqEURCpL5O
 ROAOW/gWdFlxMoER8kyEQLEfk04TFD1m+sgVNclTerauWm7SPJzTcFHVDrUKuPRD9E84yxnov
 194USMG4KIn48gBwsmGXcPzdaOTcI8tJKRYgcIVz8aGRcmqWLJMPQnWIvDYU7Gu5nOfvlcnuu
 4rw8ifc0nMQ+/XwLSD3lVbTYussT0Ov525rGJ3+IKE+YikW0KL2+Ll+jA5fFTIznspuKbnskt
 gO/ezNJtpa4a+rVghH907d0BFo4TqTNeQWZF3Kx2FvZuvqAdQyF8VF5JB+p9E23q8XrDpWvoQ
 U7Z7F+8okvX9+mIKRmhfKKmUPVJsm3F3/UIZiJkZup5XwXGpl4/4tfn7c0di6/RuQarBPG4Kl
 y736LUKdTIutTo/aN6V6lua7zbU8lyH/55tj2p3eijmwFabJdHiQm60diRzIQOW+eFECaDJAF
 PI2Dyzlr4bESlp8T6cQGZmAM+tofeKhjkoOVGqvtv+G4Ezx/sgqXFR668qTtkzfS4MD6mKNCV
 NbxAObsOzM/fiHpJUPop+TQRUoN8Q3pavtZtFHxRsupmHa0qclYJF39jPPW949tXOznGqc6kN
 FjXnDwZCsZ0GczmZGzdMY7d2xTTbjdemCsut3gl6CP5r3NVpyflGAq+8aj68yW5G1NfqfTw/T
 xDg59Mbvhdui/omf4jA6goFBpu5w7ooS30QUWjIsB/V40=

Tuner ranges were determined by USB capturing the vendor driver of a
MyGica UTV3 video capture card.

Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
=2D--
 .../admin-guide/media/tuner-cardlist.rst      |  2 ++
 drivers/media/tuners/tuner-types.c            | 21 +++++++++++++++++++
 include/media/tuner.h                         |  1 +
 3 files changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/media/tuner-cardlist.rst b/Document=
ation/admin-guide/media/tuner-cardlist.rst
index 362617c59c5d..65ecf48ddf24 100644
=2D-- a/Documentation/admin-guide/media/tuner-cardlist.rst
+++ b/Documentation/admin-guide/media/tuner-cardlist.rst
@@ -97,4 +97,6 @@ Tuner number Card name
 89           Sony BTF-PG472Z PAL/SECAM
 90           Sony BTF-PK467Z NTSC-M-JP
 91           Sony BTF-PB463Z NTSC-M
+92           Silicon Labs Si2157 tuner
+93           Tena TNF931D-DFDR1
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/media/tuners/tuner-types.c b/drivers/media/tuners/tun=
er-types.c
index ff5a6c0acdd4..c26f1296e18f 100644
=2D-- a/drivers/media/tuners/tuner-types.c
+++ b/drivers/media/tuners/tuner-types.c
@@ -1434,6 +1434,22 @@ static struct tuner_params tuner_sony_btf_pg463z_pa=
rams[] =3D {
 	},
 };

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
@@ -1946,6 +1962,11 @@ struct tunertype tuners[] =3D {
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
index a7796e0a3659..c5fd6faabfd6 100644
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


