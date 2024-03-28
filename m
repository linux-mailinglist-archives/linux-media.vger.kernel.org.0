Return-Path: <linux-media+bounces-8054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649F88F51D
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE6FA1F2D86D
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB5A2C857;
	Thu, 28 Mar 2024 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="Imz26q5c"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726F22554B
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591576; cv=none; b=pbpx0t4RX3veILn+IyzgqoaDM2GPjOgxyCBHsT9C8RVIh/fw5jOa8Lx16zVr6uYJXbMGZD/+08UPI1R4ILG22pez8tTefWcRT86Qq3E0rDTUSZmt4Yue/vkjzzlLiFKPneLDdd3Qhnl+AvDx07mRaIODXY8jG3mN0kHKyQL/94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591576; c=relaxed/simple;
	bh=+LJsd2vAN3Q3GPFjMyN8oUlc/nWFr7o/9c9axE4LMRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UdXUuu3uBExKulbju/t8uzOUr7+9uJ96aUBwb+SwvJXyvSneZJjsC1jwKhMeZEstqn8tZ30Kz25VRJeCXPry0v2/5RlRRyYcQ9oeSCVw0y8KB/uyV2wkrDv8Zbd/GzOeC7wUt5Fn6n4CXsN1bB91gpNQ/Zd31wy0x4SM+fd9adI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=Imz26q5c; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591568; x=1712196368; i=herdler@nurfuerspam.de;
	bh=ImtasognJepxBszQFfjmmVWZ+QidvsjQNLWsjvgAH4U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Imz26q5cDEzftwR1fTTvbzvd1L4doRZCxgkNd5TEgeMMGrXroy2A9eY0pp/tyc+m
	 ZINUIAQhUrltb+x/4flsLyM5lmm7esIJ16FOhcd5dhODOJoknMpCFt4sykVtIZQPW
	 zHTNWMA0+KEvEWS3OrBxuzK/ncB+wRtiJvnHtRLtl2sAlqkkSvZyvE7IezyGClIdO
	 pJxXP4UYBzceiNoAbVwrSCFt0w+gGp0VovJpc5FXqcl708o4CGogdjqD/UtPdPu4C
	 b96z3JshCzo6yAjsJlB7Mg1Po+KAVtV3y8MvslUBrPepBsib31PBaxb3hijQWJ+Ep
	 heP8URJvd2ta0xV68Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1shuyE1hD4-00uoNQ; Thu, 28
 Mar 2024 03:06:08 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 07/11] media: ttpci: checkpatch fixes: trailing_statements
Date: Thu, 28 Mar 2024 03:05:18 +0100
Message-Id: <20240328020522.50995-8-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240328020522.50995-1-herdler@nurfuerspam.de>
References: <20240328020522.50995-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kv66mT7wTg/evZOnHVDgxu1CnovUVTfGJG4omxgKPQAa2j3wb1H
 aT0+N205I980H9MR/oUixHmMXAcGOormBTgar7k4UOXv6Y51Dy6S32Js/+bWyA1oJCEJ+yK
 AtEnj46RCBTg6EdbQo3bEHt9LVMLxI43XAq9TKEiuXoEajawDxzXENuMg0FGiYhPrPEh8Yn
 8gTSHhC8+f8DW1v8vGnlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kDWfq/1UBAc=;kvQiEvBju9UeiKi5ilrM16kFTZ0
 uENVCvQYiCM5l9l+Lhl1sFTADxvAMNO5SbDe4EFZfwh1MRwGGF6zveGRo/ac7H1/s06Uk0xtg
 Fs492Zk0tBsprb/iVovFx4LsD4mhRff7c1jLPgREJBGHSqVsr2A6jkVzAyXoLM0VsiVWHNrN2
 WsCRQ6r+EmOXHetV5vTqGJz1RkqjuPTouL5204PU4aM5XXNaRx2CvBAIl626SYtrl/rpxkwuU
 XSIvz/P9iDAbVYgBZOG9uZlh8FWGpNPE9lP/a/wbxzk6QTeCO9rRzPMrJJ0MZ9SDoGsun1GKu
 JuPSlOmYX+PNHsm1UdTdLoPa5WS4A9kQVuJBBWpxSanvPhrbjnm9ov8w7mqUSfTG0F/HBniDN
 vc1ABxgpGa24/R45TKEYUQKu2UzK6pGzH9lawsOhMroXILXYTYdBmSI7Mq2cHNq6WPkXX+bSH
 vyFtOcp8Fq4VYJ/PVCDUe70yjpVxO/6zIVJ3MT5xmzG3iV0V7C1AKiuIybrBgR7zaz8yslcR1
 XFrClFSnBwtLDE2OrKVOboA7KPlNhv5y/ELZU7xjrNJuTDxvYm64iXWpD0/EvTpa5/DvTw7yg
 K8Wze7i9RSBpv5XxtlNe+8uCkFA5fYzM9e1wjRJPgk5DW0M9RLQYw4LIR0EfjlLKQsEpxk6WX
 wPlYQPbt858L3UFKZCmJtB8HahmMW+mFJWotnuKlpKpOO9Yi1LRHTU6GM0Nst2DGFNB/C0deW
 RkKRFknLn4COI/L0xH0K+BGjcjoQr/tdcjX76y1KYvuCidqmYkpicyaVJSaeCTh3m4MZgkzKr
 IAjJMiSOQJm2AyTCIB1Zom7+03tKmutopc49aC/3m06lk=

This patch fixes the following checkpatch errors:

ERROR:TRAILING_STATEMENTS: trailing statements should be on next line


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

 drivers/media/pci/ttpci/budget.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 79b34c909..76cc554d5 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -213,7 +213,8 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)
 		pwr =3D 0;
 	else if (c->frequency >=3D 1100000)
 		pwr =3D 1;
-	else pwr =3D 2;
+	else
+		pwr =3D 2;

 	buf[0] =3D (div >> 8) & 0x7f;
 	buf[1] =3D div & 0xff;
@@ -225,7 +226,8 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -252,7 +254,8 @@ static int alps_tdbe2_tuner_set_params(struct dvb_fron=
tend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -307,7 +310,8 @@ static int grundig_29504_401_tuner_set_params(struct d=
vb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -337,7 +341,8 @@ static int grundig_29504_451_tuner_set_params(struct d=
vb_frontend *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;
 	return 0;
 }

@@ -369,7 +374,8 @@ static int s5h1420_tuner_set_params(struct dvb_fronten=
d *fe)

 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 1);
-	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1) return -EIO;
+	if (i2c_transfer(&budget->i2c_adap, &msg, 1) !=3D 1)
+		return -EIO;

 	return 0;
 }
=2D-
2.34.0


