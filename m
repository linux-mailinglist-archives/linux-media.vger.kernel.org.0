Return-Path: <linux-media+bounces-8050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196C88F519
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82F4B1C29ACB
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE91D22EED;
	Thu, 28 Mar 2024 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="jvAVXfcr"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A8C24B2F
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591575; cv=none; b=dn5qcKyIRN2/V5FB7FUkx0p67vyc0cU4+fVNMhcE6lvzkISmMOz+QN+vH+6GEorYLxuqFme9C2RECXa67Fc4tifbez3zBnxieqXvjeW89yq+lgbrk69eJgWq7CIUOuIbtT3p+fslsNxoYNX3ymh4CDFnw6K1ysCXGo8QMYFmBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591575; c=relaxed/simple;
	bh=QvcK/qwUF5AfaCQucluZUc8iFC1OuDj5DjegX5I+mGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zhqc/s/9nkkT4OxzMnZIW+1jgLvbuLeVeHHIrvw6+qxuxwarhYsn7YBFqrIBwnKCiTw9IEfURf8oLz+s7D8o3JoXwd2EBiJtHXoSrlq9nUqlOa1Z1gOQwEsdMAhwZBR42U2FOV5mf0Udx9PfC+Up0xyyh3LY3LEFPBBY1VK/pV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=jvAVXfcr; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591568; x=1712196368; i=herdler@nurfuerspam.de;
	bh=+Mm9ZPJ4Spw3gc9gv+/zGkAPm2VPMS9wa56wLA9KLSw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=jvAVXfcr7XNS6C9E/8NqwgT/g9D1H36qWpYe7u+cbjRIwxeDckvZVV71jblo1AZt
	 NSqdOP5MqNLolbHES5K0Ojm3Jqe+rlKe4GHVsizKzYdn5Ff1Y5M0NMhtXf/9GW34F
	 2Yxxx1lkUrzf8lXgtPZYydLVrQ63cw1fUtfbY5s6FHTGeMI9wk77Ei87tWqFG9HPk
	 KIAsLwFFQh5RJ0++uwGzv9s8LGn6A54Tlhpi0n20jKJQCjVoRT1aF1jzAbSxc5NMs
	 J1IH9HToEFJ0V/2luPMN2r+fIinrN+2kQ9Mno9JJQxpqOVJqPRPMHElmqAKokVdwC
	 BgrRfX/3ruRz2IByag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1sRl870eGB-00cSi9; Thu, 28
 Mar 2024 03:06:08 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 06/11] media: ttpci: checkpatch fixes: assign_in_if
Date: Thu, 28 Mar 2024 03:05:17 +0100
Message-Id: <20240328020522.50995-7-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:jAMXE6VuqhF3xrhYfHuli0uT04cQ9dx6aKYzP6+tOF5aPHIkZTa
 g11E8FO1z6qhZajD+olnnpKZtFOY7L5Uo0PFf+L5jg/pKTrlAvFf1++nmbLPuLPxvkKJFuf
 NfQBEi/YCGa/nBB5N57f5n4u0LsqwBAwMnA5SY5H3EUM73q7xN+ztZ0aVgUr2hp6MEZ48H5
 nH4SegfcqysBXl2iAUxUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ojcfd7eumfE=;VnPb/3Oh6jw56ftVVYar/8GSGn2
 RxA77iPa8e2+55sbR1IyXk7Df0OqIkqknye/GvVWFWs+DxnY7jVIFSR1p0qcZg8moPndyRR7l
 1mHXi8jYVpZq4BKgsr/SW8oK1Br6/pL5u2LjgidhsNTPZeRR/sD2HhoHyeiSWPGF89RHCGJ8l
 aptvXh4mhDbdkhgBlEZpdGVNkQpjGjppivnLuxoTgg7ZnSYFomupE208uQHk9YXClB3zvMHgU
 UdUGFOCt8qJzmjzqTidh3KnBdjB74CE2tJS/zIFvePfn1m+PJak+BIJRvTkSgCAJKqplvYilP
 wyrJTH6sMLFsBfPrJWNGaoXE8WPrjxy4PRBsHDHm9ifPFfQ6jYyMMImZw0oafcRO4vSoXdyRM
 v9+FKOT6BY9upe/u3jLdtS3HlTLW/rrx01Qj1sZ57WX1ncRaIxYrwlCVGPImB4tj9Sr6f9CxZ
 hQQ+/jRQjhUpqqePXwS3T2zRVLMbqq6DB40rekjCL/n0RaSLiBmSVR5APkVJIGffUwZvXdnMT
 cNFLqfRg5jg2rfXvfMYATQqRSzH/hERYk3aAjACbF9WNWdtP5mJFnYxlamc3xBA0m8olJwgMc
 LycTfPJpDpGKAH/wSXzDFSbxcVp1a+2XjGE74gLSti+rFExi3S4VI6cP5N1EIcJTESmB/oRCZ
 q+T487eWiIJ5pnWXOavvI7d2nsly4++LM5ewCa0m1OjU6s394xNOX0PBU8HZngRypmX9hKvNp
 6pjvZIR5RAakUVfFjQ6aGNF2rJWwALEHeSv5IRwVrFbly1nK7e75NTUbEECrEDlxeRg03MrMa
 Cs0B5nvqyyv/Q8TP9sZNw3ZyHBIvmgt/VviSq1duK+oLM=

This patch fixes the following checkpatch errors:

ERROR:ASSIGN_IN_IF: do not use assignment in if condition


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

 drivers/media/pci/ttpci/budget-av.c   | 14 +++++++++-----
 drivers/media/pci/ttpci/budget-ci.c   |  7 ++++---
 drivers/media/pci/ttpci/budget-core.c |  3 ++-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index 2faea2861..06d08cf98 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -351,8 +351,9 @@ static int ciintf_init(struct budget_av *budget_av)
 	budget_av->budget.ci_present =3D 1;
 	budget_av->slot_status =3D SLOTSTATUS_NONE;

-	if ((result =3D dvb_ca_en50221_init(&budget_av->budget.dvb_adapter,
-					  &budget_av->ca, 0, 1)) !=3D 0) {
+	result =3D dvb_ca_en50221_init(&budget_av->budget.dvb_adapter,
+				     &budget_av->ca, 0, 1);
+	if (result !=3D 0) {
 		pr_err("ci initialisation failed\n");
 		goto error;
 	}
@@ -1269,7 +1270,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 	case SUBID_DVBS2_KNC1_OEM:
 	case SUBID_DVBS2_EASYWATCH:
 		budget_av->reinitialise_demod =3D 1;
-		if ((fe =3D dvb_attach(stb0899_attach, &knc1_dvbs2_config, &budget_av->=
budget.i2c_adap)))
+		fe =3D dvb_attach(stb0899_attach, &knc1_dvbs2_config, &budget_av->budge=
t.i2c_adap);
+		if (fe)
 			dvb_attach(tda8261_attach, fe, &sd1878c_config, &budget_av->budget.i2c=
_adap);

 		break;
@@ -1434,7 +1436,8 @@ static int budget_av_attach(struct saa7146_dev *dev,=
 struct saa7146_pci_extensio

 	dprintk(2, "dev: %p\n", dev);

-	if (!(budget_av =3D kzalloc(sizeof(struct budget_av), GFP_KERNEL)))
+	budget_av =3D kzalloc(sizeof(struct budget_av), GFP_KERNEL);
+	if (!budget_av)
 		return -ENOMEM;

 	budget_av->has_saa7113 =3D 0;
@@ -1467,7 +1470,8 @@ static int budget_av_attach(struct saa7146_dev *dev,=
 struct saa7146_pci_extensio
 		vv_data.vid_ops.vidioc_g_input =3D vidioc_g_input;
 		vv_data.vid_ops.vidioc_s_input =3D vidioc_s_input;

-		if ((err =3D saa7146_register_device(&budget_av->vd, dev, "knc1", VFL_T=
YPE_VIDEO))) {
+		err =3D saa7146_register_device(&budget_av->vd, dev, "knc1", VFL_TYPE_V=
IDEO);
+		if (err) {
 			saa7146_vv_release(dev);
 			ttpci_budget_deinit(&budget_av->budget);
 			kfree(budget_av);
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index 047b1f07e..a7e008f0c 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -480,9 +480,10 @@ static int ciintf_init(struct budget_ci *budget_ci)
 	budget_ci->ca.slot_ts_enable =3D ciintf_slot_ts_enable;
 	budget_ci->ca.poll_slot_status =3D ciintf_poll_slot_status;
 	budget_ci->ca.data =3D budget_ci;
-	if ((result =3D dvb_ca_en50221_init(&budget_ci->budget.dvb_adapter,
-					  &budget_ci->ca,
-					  ca_flags, 1)) !=3D 0) {
+
+	result =3D dvb_ca_en50221_init(&budget_ci->budget.dvb_adapter,
+				     &budget_ci->ca, ca_flags, 1);
+	if (result !=3D 0) {
 		printk("budget_ci: CI interface detected, but initialisation failed.\n"=
);
 		goto error;
 	}
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttp=
ci/budget-core.c
index 20bcdd26f..dc8b2de30 100644
=2D-- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -531,7 +531,8 @@ int ttpci_budget_init(struct budget *budget, struct sa=
a7146_dev *dev,
 	if (bi->type !=3D BUDGET_FS_ACTIVY)
 		saa7146_setgpio(dev, 2, SAA7146_GPIO_OUTHI);

-	if ((ret =3D budget_register(budget)) =3D=3D 0)
+	ret =3D budget_register(budget);
+	if (ret =3D=3D 0)
 		return 0; /* Everything OK */

 	/* An error occurred, cleanup resources */
=2D-
2.34.0


