Return-Path: <linux-media+bounces-9295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9018A46E8
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA209B226D2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE9C1CD23;
	Mon, 15 Apr 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="KEFcGakg"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B20E14F6C
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147880; cv=none; b=oksT6eY7xNdHN2eB6iwI0G/0bEHjiR3sT4Fj51Hq0wy0RIU8PlEPSJIZNTPYBt7AHyJKT/uquxfrNVv4MVlD3XK/ajpt0jgd0yAmwJYSk8THw97Q9kb53ingZ2xt4Ucp+Hp4w8yGTi4W7Q+jEL08o87UMpyBFSG/+nHxZourVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147880; c=relaxed/simple;
	bh=FsJn7rwGGXc/4VooFV2NmRktxXoxlWrzNZiH9FAAEzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2N2LAoGzbQGuQkokofgxgiS5fAU0Q+YAayoPHnzy4jX5UJoUeXvRPzQGZJikHV+WhDYqmk2kcqNPoBRu9xIuMS10ge5diF9VKEqm+HqmGy8++LtnuHe2OrR7IHIGsL+Ye/AQpqSoAgQ0Uc5aGFbwAcevh+7UqHSJlGigGgkkbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=KEFcGakg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147873; x=1713752673; i=herdler@nurfuerspam.de;
	bh=4kQ+DCcP5itV7P51mxkLyc5BwVPu366vCeoFX4v2HT8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=KEFcGakgDlIVEOk8glULaPTXddUIAkSFanXaDG2IAZ0QTQLBEpkdJXpCcwQT15bs
	 kc9Y26PSmtjwgu1MjvARjCvzXoeykhw4re02/m+CWRMMRXxVbc8Z7vqGcIpaSOS+q
	 2EszqZ9tM3bOu9z2AL99hIgVWAfbApqeZwf4yAmQ5X2wWJ3AV6+M2wuSSe2NHTVSJ
	 x7ZFwTo3+VV+20+KyQIQDwAflW9TFk+e+IOBO/slLAs/I07aY1DzgVWbHVYvQgk9F
	 MAgdRvtKeIAnsPrNNm7XRnzoHp0US8lRhqWVPdKe9GFwobIHNmhyIyHk8efqqNUup
	 nyUtUk4ZoSMxdao6Cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1sOw4P3nWj-00gDAd; Mon, 15
 Apr 2024 04:24:32 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 06/10] media: ttpci: coding style fixes: assign_in_if
Date: Mon, 15 Apr 2024 04:24:07 +0200
Message-Id: <20240415022411.234580-7-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240415022411.234580-1-herdler@nurfuerspam.de>
References: <20240415022411.234580-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aaaTXqxGXLNf4k0rQWDhqNA8ccFFam40qfE74q8dXWFiZZ3TFxZ
 GtlPBORH4FMDt5CSX1rqlrs5BCZVQ1XSjWGjN5kQxTxMMuDTx5JZhb+2TEesKX0jebwVJ6h
 Tz8jkPl1MkvZcHzhubGBgj04oZeELMNm3Y/SRzLLx2YGtivpuYqHpIuShzDk6KkwoU1AXQh
 26Sk/AsKtS7Qoh3FCe4/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GxrChvLwbK4=;iQigpMuQoTYb6fdVxAdT6be+FKk
 p/wxmeJHoU0e7Kc9P/ehJv5EC+KppbAU9MPQRVQy861fTd70Gz3yvAsS+THVFTrgOTRZ5qs2U
 aVuMQbui7vCrSmw9uu8qptUUtlLL7/QAydmEZ2gb+vjD+FlQYQkywAvpKBRzem4gtcS/ssAty
 1bbosunzAK3+vkrWzk/SthB+Wuq2ZttxWt/3+q02/N2wEbe2wrrAgbN84HI7UGxeRMf0SBPHs
 XAwIPjhB87sedbY4+hT7c4AP+WFUnwTtQZ92VA7pWY+XWa/sRm6WqaQ6rATa1PT6eA5/u48RI
 vTVKWKb7wL2TJv/pqit1pT0gigMiTi6eTlon+uuLX5n9g7lUCC1jar/y2BmE5gVsRoCZZVE2w
 DdGw40U3MFfOlOYKJH6ZdlPK9EppMKJ1fS5Hpv6thcasr+LbwsSI5GzBFeoeEqj3HqFjKA4pU
 9+6ptcIZnfZPgFiOr5pfSe2UzSMwy/Vv1qhuQq2ejyYDisz7V5Nrrf+0i18TZd0gv+CUcEoYc
 3I7aOvpyEC86dyxaNGClz6pLWqs8mzv0jTFUwbUPFJ02YZ5zB9VF5UvCRNAV6k6G+BOqGxNAn
 /97E0VMCaLZy1NON4iozqOLCBXPUuuedyZxbfG/7aws6meD+rObAd94S61tOJfsAbh4hjv2KD
 w0P3gElZfokgz8CR5My/ZFyK5cS5BUOQ/zhw3Bl1eab9Q1vJoVRzHV47+tthrm3wbnjn+nO6L
 gEs7MzCuVNCaIeMCVFMsFTIvYWQZyxDro2jUbeQd5CKmTDX/NqdK3BYC1Mbe4jNpdjE36FgoG
 YTbRs/E6ymt+tipCo1jCdB+L7f3anWf7J7rnIV0dhlYGA=

This patch fixes the following checkpatch errors:

ERROR:ASSIGN_IN_IF: do not use assignment in if condition

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Changes since v1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Title

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/media/pci/ttpci/budget-av.c   | 14 +++++++++-----
 drivers/media/pci/ttpci/budget-ci.c   |  7 ++++---
 drivers/media/pci/ttpci/budget-core.c |  3 ++-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index acac9bae4..9549e385a 100644
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
@@ -1270,7 +1271,8 @@ static void frontend_init(struct budget_av *budget_a=
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
@@ -1435,7 +1437,8 @@ static int budget_av_attach(struct saa7146_dev *dev,=
 struct saa7146_pci_extensio

 	dprintk(2, "dev: %p\n", dev);

-	if (!(budget_av =3D kzalloc(sizeof(struct budget_av), GFP_KERNEL)))
+	budget_av =3D kzalloc(sizeof(struct budget_av), GFP_KERNEL);
+	if (!budget_av)
 		return -ENOMEM;

 	budget_av->has_saa7113 =3D 0;
@@ -1468,7 +1471,8 @@ static int budget_av_attach(struct saa7146_dev *dev,=
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
index 2a51febdb..062dc14a7 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -481,9 +481,10 @@ static int ciintf_init(struct budget_ci *budget_ci)
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


