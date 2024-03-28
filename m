Return-Path: <linux-media+bounces-8049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8326088F517
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B427C1C2A925
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D872BAE9;
	Thu, 28 Mar 2024 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="RBoyfeUl"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4105249FF
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591575; cv=none; b=OfS1YOeqLl2wjG+VBbXeLv7IdK8evImoEAW1VxjdaVpo2nI+ockpWHkZjDqjP9D2hGQJqmVAe0AlhZEsBw4NPnohN84ADSu84zQHVpf1dE5jqaO0xZHpD58C+a44Px3LbxiXEVKhOrXQ2+xsMKc73IcsybtlSGx/rwthZB8bG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591575; c=relaxed/simple;
	bh=l/kWlsTWwSWOfTcbS2I2L+5Xzgb7TkQvmSq2DNO0tF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q/yutNwbsdxlX+TMiaHVz9MtqbG6vMmpHm0KZUDhSV45hPn5hY4NMsXcYedrATzfuZ/Zqbs58LYg3tbvprqQjcyf0pYhN8o18ps3A7amfu6KxSkY8nW5SSCo19McogKdj5QV/NUX3iNlTp5Cy6v4MXhIzCnLD4afagnfkqIvHls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=RBoyfeUl; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591569; x=1712196369; i=herdler@nurfuerspam.de;
	bh=5W5Mw+F07JoOJ9px0zMMWMDH/evGnHup6SW2JAN/Xh8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=RBoyfeUlDs1f0GXrXBWZ/bEeC84+USgZfTFEx7ldvIQTQRoo/Qvtg19OrW/DP6WZ
	 aaatyaTDcte4kFLCiQH+rwtN3AQtWNZtOsfMI2Ix93u3L1TuOzAPMWB7Z9DzcCYIs
	 N3XCKIShWhUiOGjh+saebNdMCnbvvJnnPVO+TNyc8ESEdibOeT8nIbX+PfpTdR2EA
	 hDakUT3XN1ocYau0kRhWjwkOMuSBNVVtdfypAcejTWBrFPfxB8MgpC91Jzy+p8Y7g
	 VfqUoyCGMEkYoLrd6h4sZR0WK7k4ibnzFvf8NKGqTGo69VUgqI/XRCfsIce89UKiE
	 gWpsKHvdoX1ZWTkzdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1smZnb3oLP-00zTCn; Thu, 28
 Mar 2024 03:06:09 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 09/11] media: ttpci: checkpatch fixes: miscellaneous
Date: Thu, 28 Mar 2024 03:05:20 +0100
Message-Id: <20240328020522.50995-10-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:WBMDNK3192SMTznhodEasqpH1/9dxeEv8tuWDa0+Q3TZqMA8+MW
 zpGLh+v8/s97ECJ1gbyy7d+eFqkmYnUlBjlXtUy7zHsGU9R+fDNHqQD2McDsIXv0bbiYV9j
 rKeti7Ji1KDOr/2xtH06Bpl1u1vfDEfrBF5PAok0BeW0nOqgVwB1l+MqPp3GpohfexXNCaS
 1tvqqyGCBw5s8t5k6HP5Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e1BQ3fbBzMU=;gKiJjNVclz98JnekxosFG89fi5C
 N3nqTwdH/nXKx6LtJhjkWAATvs/yy+p3ecYBEDwa58Q7RcEDcZ7GVNMgArC8VM/v6iQkN/vwn
 YdYilXv26F2yfVm3QoIHO0pJWRyRDKenMdrjwM14A2unOUOy24mclnwiHyJzoWblYdP7Adyr1
 I4ndzUmW3KBjsggTukZ+z95Vm/J4p/UaksZC6f6Sss4qdaLxbu/TGpr1cowGDcP3lNTpvENdQ
 qZxsgNBCs5j12CpzXfk9lutmY1LOjIpEQzvZBGfsuZ+C/mFxi1OtEstxe3FEhNYiKpkbiXuE/
 ek2HI/CVDVCEx8kJ9UjuHjdqPxo1cSwtPojA1dFXC8l00jB0ELD4ItEriKcxRCKM/uriDBU9M
 hUtA5UG2PX3GbHcBaZgyS311Kv3Ehph/F0HNMahdho1A9D9Eh1wY9dzPd/C9qledmFFk0sV77
 Na85wK02ukW4kqYfc30ZO5ypM24CVHtBDTVdDIBsdsj4EMLya9Byp6YaKGEK9NNdahGmI+ZDF
 0qujEMWkXqt0E1qHCG66YiDt5iMPp5XqRGAN2lriNwNA6s5bMF+WF4RJHJfhxWxvS7ljluubw
 ul0lDhDihMLZf3oLjl52rp2SDt6s3xOtriYu8oQnhjhjcm8ZwEJlfonsWMNA6N1KyLk4qYeS+
 hxhyrQ7iNnCR3iRxot9+e55RM/l9gBGLg17b6AwqChwnkJWAEJz0ig7PnN3ABthEToBVhnL+X
 QNQ7UlVINACSo40cffqbwr2OiK2jSrDUhhVlQkzKbprTbRpUjZFRjpntlZtJC74TO3yJQZeLm
 UlS5FjduZgDguzJ2bTZRXJofcol1B4R1FFh/PpsNlhHic=

This patch fixes the following checkpatch warnings:

WARNING:RETURN_VOID: void function return statements are not generally use=
ful
WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

 drivers/media/pci/ttpci/budget.c | 1 -
 drivers/media/pci/ttpci/budget.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index f14b90de6..50fce65ce 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -781,7 +781,6 @@ static void frontend_init(struct budget *budget)
 	printk("budget: Frontend registration failed!\n");
 	dvb_frontend_detach(budget->dvb_frontend);
 	budget->dvb_frontend =3D NULL;
-	return;
 }

 static int budget_attach(struct saa7146_dev *dev, struct saa7146_pci_exte=
nsion_data *info)
diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/media/pci/ttpci/bu=
dget.h
index 4579243c2..ae6de6a19 100644
=2D-- a/drivers/media/pci/ttpci/budget.h
+++ b/drivers/media/pci/ttpci/budget.h
@@ -89,7 +89,7 @@ static struct budget_info x_var ## _info =3D { \
 	.type =3D x_type };	\
 static struct saa7146_pci_extension_data x_var =3D { \
 	.ext_priv =3D &x_var ## _info, \
-	.ext =3D &budget_extension };
+	.ext =3D &budget_extension }

 #define BUDGET_TT		   0
 #define BUDGET_TT_HW_DISEQC	   1
=2D-
2.34.0


