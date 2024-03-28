Return-Path: <linux-media+bounces-8045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C388F513
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D8A129C780
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA4B28383;
	Thu, 28 Mar 2024 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="h4Lx34VN"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D824219
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591574; cv=none; b=UlFVqqHdmosKOy2lUxHwAoIR0pQTm5fyBOBsCytt0041YWLELzwMrXfiVIuPZSmQv0ohnl2BkNXt0mvCL3iJSFVCpAVNAKn3v2IxN6Mp7xY3RYbRK7cI3W/RyFPc94daTuiwDd2OjO/mYbep8vSIrUwI3/7BCl2O1v6Lgb84BIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591574; c=relaxed/simple;
	bh=iFMg6GZAbuFfOtNctqRSW+PL0+g5IfaJEwZX2XXrCiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MFNUPDJNqwBRzCBvzlZ1jHUczn2XrdsO898Gw5Jp4j6H/3pkGRzYosKNo1c76ht6dig35Mm/DfNIs1ffeZht4SSGbuB4hyC7KFCfEMsjuvgDjE2yCIBylHSX6OjAdIjhbH8w7KKr0KI7IoPFvq+xNH3pImKV/sud6DQ9Nr/Xtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=h4Lx34VN; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591567; x=1712196367; i=herdler@nurfuerspam.de;
	bh=yZAKZrr/Tr5rvJkqCoAqDmzd/PA6EHb7nOw0gxCL/aE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=h4Lx34VNpLWLFCvrH0PivN4sKRQLbt5UFVYbJ+k1RcO2/Mmor0G7YOhZmOWJa0EY
	 LoXu/pCptkD2XY/ZrMEymtS+or1vCo54fXZSaWtPUSklNlX+GrlvCwl3T0oZ+Xbot
	 W01hFGvwrfoXHrJKNXV/3ZGEagAnEeTLR3Zf9JPm0O0ZY4rgs62i1fxutg43Nou3+
	 w8gbO3ctZLm6yPW69PU+9YWkhpG2DKOGZ0ol5qvoYz8v/LY7n0DKQcngv+8FGZMR6
	 eAOjtC/soePhLzdnmo+ATlmRB8GF6Ad1Quo8fpb2Qt4NU8ADVp2DDuXVomU0bIzxh
	 ftpVybYM1SO/+8danQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mKJ-1swVQy2pgJ-017Cxl; Thu, 28
 Mar 2024 03:06:07 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 04/11] media: ttpci: checkpatch fixes: braces
Date: Thu, 28 Mar 2024 03:05:15 +0100
Message-Id: <20240328020522.50995-5-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:b2q9kGgEUdlH9RZB44G6WkWHE3/tf0n6S+hshQLqOdpkS5l6BhL
 Axkco8Y7vzd2SwkerTsXHJPiBrzZtqPdfB72mwNWTs1BkNkA/aJys3fhSH+n20Aald18Ake
 Dy//FbRXzUhUci52OGnJH7GLWT0of7Fbcs1eTpQCko20wyajDYm0tJn9yoD9accex6QO3fO
 n56wDvuDjRJqm6ksUqq+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K/f3BbFkVME=;0+uvZe3gj1wpenmec/474IfhoVu
 uf5edoV9Yxznmkl0m6lxLPZtFy2Ae3taYxj9zQgfXJeEy/lgwf31nS6T6BaPiD7iYzMteVBKy
 w4AwsRY87ewM9/C0KIXtVFcRre5r7Mh9xo0WNWx/FyWIZ+cLdI+5glsEYnSCvBWccrXLg7N0T
 Y+W3WVw10GL2pvws0vpGPu6W3j7jKouiQtbdTKqsM+jhI2U1Hp03OqyCeT4ua+nkOb1FdIQzh
 f6MjBg7IMCK9MFZjAB5JIhMdCb6f1mpSfVrW0g+JdLc1pVyX5x6bqX+tUqPJUqS3iidIKx6ap
 vsDle7txdXQmZuziXqQLlZxUucHo3gyyuspiU2O6oU9KsCVA/l7tbYUQNCo4xFFTPxK7oNRuD
 d2352BHmRTjKRkNKqR9eNvUyEvtGK4p2oxANgjOPYEKD+PDHiq0CtsAH9Qj4/E2IE+kZgV/7M
 y8F62utq6WktUaQrRZhnF/YGGbIotINCgX3EtaHFuLfIELF0/dSjhYvvtGbNw+VoTqDqKm2ao
 7mEGbWCHZSpWCFQ0zqTc1GG0Ltwcq/kehgE/fuYGD2zOXBax8UfYhzAH8pdZcPlhxeEBHpWl4
 MHfWlCEczzXRpImNSTzkC3Q2Dk9K/58TfVK8Nzu8fizULgznn2HTvu0qTl8bEpJBOKGpwpeDl
 Z22io1ESF79wlZDlpTTEfx1eHqceD2/21uDB1faLUEoRS1GhvmcSBGQVEyr0zeCfwRpfw3Jq7
 +SfXenQw1yydGtILJs4FWKo550hC0tmVTfgikLLxjZbOluqgBoGjryOBx2ygB8xl7kpjeoAmb
 L65YykJ8s0DqxggyPBh+Ggb574zdDjRLTOhZm5xepCDBc=

This patch fixes the following checkpatch warnings and errors:

WARNING:BRACES: braces {} are not necessary for any arm of this statement
WARNING:BRACES: braces {} are not necessary for single statement blocks
ERROR:OPEN_BRACE: that open brace { should be on the previous line


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

 drivers/media/pci/ttpci/budget-av.c | 31 ++++++++++-------------------
 drivers/media/pci/ttpci/budget-ci.c | 17 ++++++----------
 drivers/media/pci/ttpci/budget.c    |  9 +++------
 3 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index dbd4ef40e..2faea2861 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -309,16 +309,14 @@ static int ciintf_poll_slot_status(struct dvb_ca_en5=
0221 *ca, int slot, int open
 	/* read from attribute memory in reset/ready state to know when the CAM =
is ready */
 	if (budget_av->slot_status =3D=3D SLOTSTATUS_RESET) {
 		result =3D ciintf_read_attribute_mem(ca, slot, 0);
-		if (result =3D=3D 0x1d) {
+		if (result =3D=3D 0x1d)
 			budget_av->slot_status =3D SLOTSTATUS_READY;
-		}
 	}

 	/* work out correct return code */
 	if (budget_av->slot_status !=3D SLOTSTATUS_NONE) {
-		if (budget_av->slot_status & SLOTSTATUS_READY) {
+		if (budget_av->slot_status & SLOTSTATUS_READY)
 			return DVB_CA_EN50221_POLL_CAM_PRESENT | DVB_CA_EN50221_POLL_CAM_READY=
;
-		}
 		return DVB_CA_EN50221_POLL_CAM_PRESENT;
 	}
 	return 0;
@@ -1237,15 +1235,13 @@ static void frontend_init(struct budget_av *budget=
_av)
 		if (saa->pci->subsystem_vendor =3D=3D 0x1894) {
 			fe =3D dvb_attach(stv0299_attach, &cinergy_1200s_1894_0010_config,
 					     &budget_av->budget.i2c_adap);
-			if (fe) {
+			if (fe)
 				dvb_attach(tua6100_attach, fe, 0x60, &budget_av->budget.i2c_adap);
-			}
 		} else {
 			fe =3D dvb_attach(stv0299_attach, &typhoon_config,
 					     &budget_av->budget.i2c_adap);
-			if (fe) {
+			if (fe)
 				fe->ops.tuner_ops.set_params =3D philips_su1278_ty_ci_tuner_set_param=
s;
-			}
 		}
 		break;

@@ -1257,19 +1253,17 @@ static void frontend_init(struct budget_av *budget=
_av)
 	case SUBID_DVBS_EASYWATCH_2:
 		fe =3D dvb_attach(stv0299_attach, &philips_sd1878_config,
 				&budget_av->budget.i2c_adap);
-		if (fe) {
+		if (fe)
 			dvb_attach(dvb_pll_attach, fe, 0x60,
 				   &budget_av->budget.i2c_adap,
 				   DVB_PLL_PHILIPS_SD1878_TDA8261);
-		}
 		break;

 	case SUBID_DVBS_TYPHOON:
 		fe =3D dvb_attach(stv0299_attach, &typhoon_config,
 				    &budget_av->budget.i2c_adap);
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_su1278_ty_ci_tuner_set_params=
;
-		}
 		break;
 	case SUBID_DVBS2_KNC1:
 	case SUBID_DVBS2_KNC1_OEM:
@@ -1282,9 +1276,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 	case SUBID_DVBS_CINERGY1200:
 		fe =3D dvb_attach(stv0299_attach, &cinergy_1200s_config,
 				    &budget_av->budget.i2c_adap);
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_su1278_ty_ci_tuner_set_params=
;
-		}
 		break;

 	case SUBID_DVBC_KNC1:
@@ -1300,9 +1293,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 			fe =3D dvb_attach(tda10021_attach, &philips_cu1216_config_altaddress,
 					     &budget_av->budget.i2c_adap,
 					     read_pwm(budget_av));
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_cu1216_tuner_set_params;
-		}
 		break;

 	case SUBID_DVBC_EASYWATCH_MK3:
@@ -1316,9 +1308,8 @@ static void frontend_init(struct budget_av *budget_a=
v)
 			&philips_cu1216_tda10023_config,
 			&budget_av->budget.i2c_adap,
 			read_pwm(budget_av));
-		if (fe) {
+		if (fe)
 			fe->ops.tuner_ops.set_params =3D philips_cu1216_tuner_set_params;
-		}
 		break;

 	case SUBID_DVBT_EASYWATCH:
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index ebf340417..047b1f07e 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -412,24 +412,20 @@ static int ciintf_poll_slot_status(struct dvb_ca_en5=
0221 *ca, int slot, int open
 	flags =3D ttpci_budget_debiread(&budget_ci->budget, DEBICICTL, DEBIADDR_=
CICONTROL, 1, 1, 0);
 	if (flags & CICONTROL_CAMDETECT) {
 		// mark it as present if it wasn't before
-		if (budget_ci->slot_status & SLOTSTATUS_NONE) {
+		if (budget_ci->slot_status & SLOTSTATUS_NONE)
 			budget_ci->slot_status =3D SLOTSTATUS_PRESENT;
-		}

 		// during a RESET, we check if we can read from IO memory to see when C=
AM is ready
 		if (budget_ci->slot_status & SLOTSTATUS_RESET) {
-			if (ciintf_read_attribute_mem(ca, slot, 0) =3D=3D 0x1d) {
+			if (ciintf_read_attribute_mem(ca, slot, 0) =3D=3D 0x1d)
 				budget_ci->slot_status =3D SLOTSTATUS_READY;
-			}
 		}
-	} else {
+	} else
 		budget_ci->slot_status =3D SLOTSTATUS_NONE;
-	}

 	if (budget_ci->slot_status !=3D SLOTSTATUS_NONE) {
-		if (budget_ci->slot_status & SLOTSTATUS_READY) {
+		if (budget_ci->slot_status & SLOTSTATUS_READY)
 			return DVB_CA_EN50221_POLL_CAM_PRESENT | DVB_CA_EN50221_POLL_CAM_READY=
;
-		}
 		return DVB_CA_EN50221_POLL_CAM_PRESENT;
 	}

@@ -494,11 +490,10 @@ static int ciintf_init(struct budget_ci *budget_ci)
 	// Setup CI slot IRQ
 	if (budget_ci->ci_irq) {
 		tasklet_setup(&budget_ci->ciintf_irq_tasklet, ciintf_interrupt);
-		if (budget_ci->slot_status !=3D SLOTSTATUS_NONE) {
+		if (budget_ci->slot_status !=3D SLOTSTATUS_NONE)
 			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQLO);
-		} else {
+		else
 			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQHI);
-		}
 		SAA7146_IER_ENABLE(saa, MASK_03);
 	}

diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 9fe087add..79b34c909 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -229,8 +229,7 @@ static int alps_bsrv2_tuner_set_params(struct dvb_fron=
tend *fe)
 	return 0;
 }

-static struct ves1x93_config alps_bsrv2_config =3D
-{
+static struct ves1x93_config alps_bsrv2_config =3D {
 	.demod_address =3D 0x08,
 	.xin =3D 90100000UL,
 	.invert_pwm =3D 0,
@@ -678,8 +677,7 @@ static void frontend_init(struct budget *budget)
 					tt1600_stv090x_config.tuner_set_refclk	  =3D ctl->tuner_set_refclk;
 					tt1600_stv090x_config.tuner_get_status	  =3D ctl->tuner_get_status;

-					/*
-					 * call the init function once to initialize
+					/* call the init function once to initialize
 					 * tuner's clock output divider and demod's
 					 * master clock
 					 */
@@ -786,9 +784,8 @@ static int budget_attach(struct saa7146_dev *dev, stru=
ct saa7146_pci_extension_d
 	int err;

 	budget =3D kmalloc(sizeof(struct budget), GFP_KERNEL);
-	if (NULL =3D=3D budget) {
+	if (NULL =3D=3D budget)
 		return -ENOMEM;
-	}

 	dprintk(2, "dev:%p, info:%p, budget:%p\n", dev, info, budget);

=2D-
2.34.0


