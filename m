Return-Path: <linux-media+bounces-8053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB688F51C
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523D529CEB6
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845E2250E0;
	Thu, 28 Mar 2024 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="D9q8hLVH"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F825569
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591576; cv=none; b=CpX85CgNBWsoy6cHw5h9AcbqBse0S5Emm/WrMEnrQkBSOcoOSyLiYvNcDb+fjdY7QXzOH2Ao7ofFj2ii6030jaEbaHKxcqyJNpPDLrIlEG8IalfRZXszRyz6RPIMmsSkA9GJ+8lB7cqlY8cXFCeCHNcteoVsGRP54e4GXk5j0l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591576; c=relaxed/simple;
	bh=BVOTQDTM/PV38V42JVPhO6mLbZJtPoMgDhWNvdLF7Jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tj3VuHbV9SnaU7L5RpuSHliXSuVGyGerRB/4+ZCsmoNUcKlZYznowgZS3N8acI9lryefmJWPuN8fHvmzd+ulJtA1mmAShBkn8wsHYOaVDj/CHN8vIVLAGyCRoJkmMJ0stVAGxCn67v60snIx++S32/YYl40HO76i9mXeeVTOCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=D9q8hLVH; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591569; x=1712196369; i=herdler@nurfuerspam.de;
	bh=dhm9R1rOGmZtkmfztDfXeLg2mzwNlUuprx3FWHJbvoI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=D9q8hLVHJrFqkoOji0Mniv9Y4s6xUpiOE2sfY68QM3KN3bYa24Yb9AKajyMtl8aX
	 5sQSZPxr8GAxpEHY/df3h2eErPNMXD65tHvGaePU1LRBRTKJvwj8SbDlUiq50LuX7
	 MFVfh2k1iicg6YoLbDft71zuirLWbrwumoPQnbjD+p0V5xmqSeDO+7YxBh+yJNLZs
	 mZ2g9Gp8NzAzIN+A/nl0RRyinKeYfQJAviwXDEsH2cxwf/KRY66RDZWTSAbbkbMJD
	 q7yaKeAc/q9KPTkoLyqu5sn0DXMS/MI0uS5myQeFj9EIAtS7Zb/3TPIKKuwQWrG8b
	 U6A7nKIx4lbcwjQ4/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXXyJ-1sMLni0c7r-00Yy4j; Thu, 28
 Mar 2024 03:06:09 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 10/11] media: ttpci: checkpatch fixes: logging
Date: Thu, 28 Mar 2024 03:05:21 +0100
Message-Id: <20240328020522.50995-11-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:GKQHU6xxzS0POm5SVK8gm/Urvy24sS+D6msV9yraZnAX1/WumNi
 6svJL/VDdfbCGRmfrPzUsexxpi94guTn7yg/w/+D3/txuncWoS4Pfa6r+TrL651pkwedaFi
 BfWUfCPa0dFw8hgst7L9+vDocSw9O7S1XnXAj1hfhSkVyGIPLYbmlsqiICdsL5wyr+lgCrm
 eiUtr6Xo8UWUSeI9PZgkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xeLJl8mMPNM=;D3v4d+bjh6Abk7FRgtC4CsFvrcQ
 vqsKQ3Yz+xh9a9xKtUEr9fPBEwGxwLwbZfD0gsGyVO1uhux8qG48RC38xITejcFv635M8+RkD
 Zf+bR5qF9t3MuQak6E9jYynQ34FnmfDb1HFSux+dT2BXg+mDnOzRA8iCoDLobhoEtt4zzUD7/
 5xO2ZThRlUq5A9hfqPUeczXMYFhdgZvNFTqOFrWlmIJP30ZXeFVXU/hVKwjQVvlIS0NwEMDvr
 D7S++c/q0wbkZYaUKh9RuPDFoRXQf7OKBvdSaIKNr0hGsTyzsu7JlE364hxTsp6L4+sg4PMog
 Kskn8Dm7vGb0I0MyNG7FJB1AfzcTHB/Y9coSp9Z6pp6bhSsUK9X4BgALje2xIS1XnEduyr9OO
 DvxGJPlgClYYUDT3qasylGajKt5kcsDBID/kWm/4iAMusVjrSO10ZyY91bHOFjR8PGG3CBqdZ
 76UmycZql/fUVhg9AQRbzN+hSzILUAOapEiBcisgIqVR9K0AjWDeiscHXFyMUSJ5NSXNCYzYB
 4/jPZngy9xtNOoYrt/oNvs5KlYI+M1GkPZIyhhTnZN6gpHf+7tUxWY8Rt0J+li/cNDFFGSUQE
 x8ZAi0JDL+4oXfBIWNITWRITTAEbnlchJz10hj3GWMwR0WT7xw3WM5ZNIRlekg5iwXpRZFhA6
 xD5oIw6QXQQDOFemqINTvZW/EraTqgED+P/jcvVCWKvvDWridelql2JIHbyziacNm7ORMH+pz
 0m16c6KYeoE1Z424KVNODj9M+cWeSCqme8nQ1IxoVCPeR1A1NjHshYLWR5tV5kS/R1t51wk5t
 zzE7zPznP36ap8FHrNMq9Ro5PYFsSVQxPgo2ETMEYpejg=

This patch fixes the following checkpatch warnings:

WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> fa=
cility level
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_dbg([subsystem]dev,=
 ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'ciintf_slot_ts_enable', this function's name, in a string


There was no consistent style of logging functions used so far.
Convert all logging to the appropriate pr_* macros.
Add a global pr_fmt macro for the whole driver.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Note:
All messages are prefixed with "KBUILD_MODNAME" now.
The text of the majority of the messages shouldn't have changed, they had
this prefix already.
Only a few are changed slightly by adding the "KBUILD_MODNAME" prefix.


 drivers/media/pci/ttpci/budget-av.c   | 11 +++++-----
 drivers/media/pci/ttpci/budget-ci.c   | 24 +++++++++++-----------
 drivers/media/pci/ttpci/budget-core.c |  4 ++--
 drivers/media/pci/ttpci/budget.c      | 29 +++++++++++++--------------
 drivers/media/pci/ttpci/budget.h      |  9 +++++++--
 5 files changed, 40 insertions(+), 37 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index 2781548b9..fd5a88e64 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -16,7 +16,6 @@
  * the project's page is at https://linuxtv.org
  */

-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

 #include "budget.h"
 #include "stv0299.h"
@@ -206,7 +205,7 @@ static int ciintf_slot_reset(struct dvb_ca_en50221 *ca=
, int slot)
 	if (slot !=3D 0)
 		return -EINVAL;

-	dprintk(1, "ciintf_slot_reset\n");
+	dprintk(1, "ci slot reset\n");
 	budget_av->slot_status =3D SLOTSTATUS_RESET;

 	saa7146_setgpio(saa, 2, SAA7146_GPIO_OUTHI); /* disable card */
@@ -235,7 +234,7 @@ static int ciintf_slot_shutdown(struct dvb_ca_en50221 =
*ca, int slot)
 	if (slot !=3D 0)
 		return -EINVAL;

-	dprintk(1, "ciintf_slot_shutdown\n");
+	dprintk(1, "ci slot shutdown\n");

 	ttpci_budget_set_video_port(saa, BUDGET_VIDEO_PORTB);
 	budget_av->slot_status =3D SLOTSTATUS_NONE;
@@ -251,7 +250,7 @@ static int ciintf_slot_ts_enable(struct dvb_ca_en50221=
 *ca, int slot)
 	if (slot !=3D 0)
 		return -EINVAL;

-	dprintk(1, "ciintf_slot_ts_enable: %d\n", budget_av->slot_status);
+	dprintk(1, "ci slot status: %d\n", budget_av->slot_status);

 	ttpci_budget_set_video_port(saa, BUDGET_VIDEO_PORTA);

@@ -1463,7 +1462,7 @@ static int budget_av_attach(struct saa7146_dev *dev,=
 struct saa7146_pci_extensio
 		if (err !=3D 0) {
 			ttpci_budget_deinit(&budget_av->budget);
 			kfree(budget_av);
-			ERR("cannot init vv subsystem\n");
+			pr_err("cannot init vv subsystem\n");
 			return err;
 		}
 		vv_data.vid_ops.vidioc_enum_input =3D vidioc_enum_input;
@@ -1475,7 +1474,7 @@ static int budget_av_attach(struct saa7146_dev *dev,=
 struct saa7146_pci_extensio
 			saa7146_vv_release(dev);
 			ttpci_budget_deinit(&budget_av->budget);
 			kfree(budget_av);
-			ERR("cannot register capture v4l2 device\n");
+			pr_err("cannot register capture v4l2 device\n");
 			return err;
 		}

diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index a7e008f0c..d821710bb 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -124,7 +124,7 @@ static void msp430_ir_interrupt(struct tasklet_struct =
*t)
 	 */

 	if (ir_debug)
-		printk("budget_ci: received byte 0x%02x\n", command);
+		pr_info("received byte 0x%02x\n", command);

 	/* Remove repeat bit, we use every command */
 	command =3D command & 0x7f;
@@ -165,7 +165,7 @@ static int msp430_ir_init(struct budget_ci *budget_ci)

 	dev =3D rc_allocate_device(RC_DRIVER_SCANCODE);
 	if (!dev) {
-		printk(KERN_ERR "budget_ci: IR interface initialisation failed\n");
+		pr_err("IR interface initialisation failed\n");
 		return -ENOMEM;
 	}

@@ -224,7 +224,7 @@ static int msp430_ir_init(struct budget_ci *budget_ci)

 	error =3D rc_register_device(dev);
 	if (error) {
-		printk(KERN_ERR "budget_ci: could not init driver for IR device (code %=
d)\n", error);
+		pr_err("could not init driver for IR device (code %d)\n", error);
 		rc_free_device(dev);
 		return error;
 	}
@@ -484,7 +484,7 @@ static int ciintf_init(struct budget_ci *budget_ci)
 	result =3D dvb_ca_en50221_init(&budget_ci->budget.dvb_adapter,
 				     &budget_ci->ca, ca_flags, 1);
 	if (result !=3D 0) {
-		printk("budget_ci: CI interface detected, but initialisation failed.\n"=
);
+		pr_err("CI interface detected, but initialisation failed.\n");
 		goto error;
 	}

@@ -503,7 +503,7 @@ static int ciintf_init(struct budget_ci *budget_ci)
 			       CICONTROL_RESET, 1, 0);

 	// success!
-	printk("budget_ci: CI interface initialised\n");
+	pr_info("CI interface initialised\n");
 	budget_ci->budget.ci_present =3D 1;

 	// forge a fake CI IRQ so the CAM state is setup correctly
@@ -1356,7 +1356,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)

 			budget_ci->budget.dvb_frontend->ops.dishnetwork_send_legacy_command =
=3D NULL;
 			if (dvb_attach(lnbp21_attach, budget_ci->budget.dvb_frontend, &budget_=
ci->budget.i2c_adap, LNBP21_LLC, 0) =3D=3D NULL) {
-				printk("%s: No LNBP21 found!\n", __func__);
+				pr_err("%s: No LNBP21 found!\n", __func__);
 				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 				budget_ci->budget.dvb_frontend =3D NULL;
 			}
@@ -1367,7 +1367,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 		budget_ci->budget.dvb_frontend =3D dvb_attach(tda10023_attach, &tda1002=
3_config, &budget_ci->budget.i2c_adap, 0x48);
 		if (budget_ci->budget.dvb_frontend) {
 			if (dvb_attach(tda827x_attach, budget_ci->budget.dvb_frontend, 0x61, &=
budget_ci->budget.i2c_adap, &tda827x_config) =3D=3D NULL) {
-				printk(KERN_ERR "%s: No tda827x found!\n", __func__);
+				pr_err("%s: No tda827x found!\n", __func__);
 				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 				budget_ci->budget.dvb_frontend =3D NULL;
 			}
@@ -1379,12 +1379,12 @@ static void frontend_init(struct budget_ci *budget=
_ci)
 		if (budget_ci->budget.dvb_frontend) {
 			if (dvb_attach(stb6000_attach, budget_ci->budget.dvb_frontend, 0x63, &=
budget_ci->budget.i2c_adap)) {
 				if (!dvb_attach(lnbp21_attach, budget_ci->budget.dvb_frontend, &budge=
t_ci->budget.i2c_adap, 0, 0)) {
-					printk(KERN_ERR "%s: No LNBP21 found!\n", __func__);
+					pr_err("%s: No LNBP21 found!\n", __func__);
 					dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 					budget_ci->budget.dvb_frontend =3D NULL;
 				}
 			} else {
-				printk(KERN_ERR "%s: No STB6000 found!\n", __func__);
+				pr_err("%s: No STB6000 found!\n", __func__);
 				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 				budget_ci->budget.dvb_frontend =3D NULL;
 			}
@@ -1419,7 +1419,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 		if (budget_ci->budget.dvb_frontend) {
 			if (dvb_attach(stb6100_attach, budget_ci->budget.dvb_frontend, &tt3200=
_stb6100_config, &budget_ci->budget.i2c_adap)) {
 				if (!dvb_attach(lnbp21_attach, budget_ci->budget.dvb_frontend, &budge=
t_ci->budget.i2c_adap, 0, 0)) {
-					printk("%s: No LNBP21 found!\n", __func__);
+					pr_err("%s: No LNBP21 found!\n", __func__);
 					dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 					budget_ci->budget.dvb_frontend =3D NULL;
 				}
@@ -1433,7 +1433,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 	}

 	if (budget_ci->budget.dvb_frontend =3D=3D NULL) {
-		printk("budget-ci: A frontend driver was not found for device [%04x:%04=
x] subsystem [%04x:%04x]\n",
+		pr_err("A frontend driver was not found for device [%04x:%04x] subsyste=
m [%04x:%04x]\n",
 		       budget_ci->budget.dev->pci->vendor,
 		       budget_ci->budget.dev->pci->device,
 		       budget_ci->budget.dev->pci->subsystem_vendor,
@@ -1441,7 +1441,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 	} else {
 		if (dvb_register_frontend
 		    (&budget_ci->budget.dvb_adapter, budget_ci->budget.dvb_frontend)) {
-			printk("budget-ci: Frontend registration failed!\n");
+			pr_err("Frontend registration failed!\n");
 			dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 			budget_ci->budget.dvb_frontend =3D NULL;
 		}
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttp=
ci/budget-core.c
index 101695c71..d33adeca1 100644
=2D-- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -209,7 +209,7 @@ static void vpeirq(struct tasklet_struct *t)
 		budget->buffer_warnings++;

 	if (budget->buffer_warnings && time_after(jiffies, budget->buffer_warnin=
g_time)) {
-		printk("%s %s: used %d times >80%% of buffer (%u bytes now)\n",
+		pr_warn("%s %s: used %d times >80%% of buffer (%u bytes now)\n",
 			budget->dev->name, __func__, budget->buffer_warnings, count);
 		budget->buffer_warning_time =3D jiffies + BUFFER_WARNING_WAIT;
 		budget->buffer_warnings =3D 0;
@@ -473,7 +473,7 @@ int ttpci_budget_init(struct budget *budget, struct sa=
a7146_dev *dev,
 		budget->dev->name,
 		budget->buffer_size > budget->buffer_width * budget->buffer_height ? "o=
dd/even" : "single",
 		budget->buffer_width, budget->buffer_height);
-	printk("%s: dma buffer size %u\n", budget->dev->name, budget->buffer_siz=
e);
+	pr_info("%s: dma buffer size %u\n", budget->dev->name, budget->buffer_si=
ze);

 	ret =3D dvb_register_adapter(&budget->dvb_adapter, budget->card->name,
 				   owner, &budget->dev->pci->dev, adapter_nums);
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index 50fce65ce..3842bad8d 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -537,7 +537,7 @@ static void frontend_init(struct budget *budget)
 	case 0x4f52: /* Cards based on Philips Semi Sylt PCI ref. design */
 		budget->dvb_frontend =3D dvb_attach(stv0299_attach, &alps_bsru6_config,=
 &budget->i2c_adap);
 		if (budget->dvb_frontend) {
-			printk(KERN_INFO "budget: tuner ALPS BSRU6 in Philips Semi. Sylt detec=
ted\n");
+			pr_info("tuner ALPS BSRU6 in Philips Semi. Sylt detected\n");
 			budget->dvb_frontend->ops.tuner_ops.set_params =3D alps_bsru6_tuner_se=
t_params;
 			budget->dvb_frontend->tuner_priv =3D &budget->i2c_adap;
 			break;
@@ -555,7 +555,7 @@ static void frontend_init(struct budget *budget)
 			/* assume ALPS BSRU6 */
 			budget->dvb_frontend =3D dvb_attach(stv0299_attach, &alps_bsru6_config=
_activy, &budget->i2c_adap);
 			if (budget->dvb_frontend) {
-				printk(KERN_INFO "budget: tuner ALPS BSRU6 detected\n");
+				pr_info("tuner ALPS BSRU6 detected\n");
 				budget->dvb_frontend->ops.tuner_ops.set_params =3D alps_bsru6_tuner_s=
et_params;
 				budget->dvb_frontend->tuner_priv =3D &budget->i2c_adap;
 				budget->dvb_frontend->ops.set_voltage =3D siemens_budget_set_voltage;
@@ -571,7 +571,7 @@ static void frontend_init(struct budget *budget)
 			msleep(250);
 			budget->dvb_frontend =3D dvb_attach(stv0299_attach, &alps_bsbe1_config=
_activy, &budget->i2c_adap);
 			if (budget->dvb_frontend) {
-				printk(KERN_INFO "budget: tuner ALPS BSBE1 detected\n");
+				pr_info("tuner ALPS BSBE1 detected\n");
 				budget->dvb_frontend->ops.tuner_ops.set_params =3D alps_bsbe1_tuner_s=
et_params;
 				budget->dvb_frontend->tuner_priv =3D &budget->i2c_adap;
 				budget->dvb_frontend->ops.set_voltage =3D siemens_budget_set_voltage;
@@ -617,7 +617,7 @@ static void frontend_init(struct budget *budget)
 			budget->dvb_frontend =3D fe;
 			if (dvb_attach(lnbp21_attach, fe, &budget->i2c_adap,
 				       0, 0) =3D=3D NULL) {
-				printk("%s: No LNBP21 found!\n", __func__);
+				pr_err("%s: No LNBP21 found!\n", __func__);
 				goto error_out;
 			}
 			break;
@@ -639,10 +639,10 @@ static void frontend_init(struct budget *budget)
 			budget->dvb_frontend =3D fe;
 			if (dvb_attach(tda826x_attach, fe, 0x60,
 				       &budget->i2c_adap, 0) =3D=3D NULL)
-				printk("%s: No tda826x found!\n", __func__);
+				pr_err("%s: No tda826x found!\n", __func__);
 			if (dvb_attach(lnbp21_attach, fe,
 				       &budget->i2c_adap, 0, 0) =3D=3D NULL) {
-				printk("%s: No LNBP21 found!\n", __func__);
+				pr_err("%s: No LNBP21 found!\n", __func__);
 				goto error_out;
 			}
 			break;
@@ -694,11 +694,11 @@ static void frontend_init(struct budget *budget)
 						       budget->dvb_frontend,
 						       &budget->i2c_adap,
 						       &tt1600_isl6423_config) =3D=3D NULL) {
-						printk(KERN_ERR "%s: No Intersil ISL6423 found!\n", __func__);
+						pr_err("%s: No Intersil ISL6423 found!\n", __func__);
 						goto error_out;
 					}
 				} else {
-					printk(KERN_ERR "%s: No STV6110(A) Silicon Tuner found!\n", __func__=
);
+					pr_err("%s: No STV6110(A) Silicon Tuner found!\n", __func__);
 					goto error_out;
 				}
 			}
@@ -719,7 +719,7 @@ static void frontend_init(struct budget *budget)
 							  STV090x_DEMODULATOR_0);

 			if (budget->dvb_frontend) {
-				printk(KERN_INFO "budget: Omicom S2 detected\n");
+				pr_info("Omicom S2 detected\n");

 				ctl =3D dvb_attach(stv6110x_attach,
 						 budget->dvb_frontend,
@@ -752,12 +752,11 @@ static void frontend_init(struct budget *budget)
 							&budget->i2c_adap,
 							LNBH24_PCL | LNBH24_TTX,
 							LNBH24_TEN, 0x14>>1) =3D=3D NULL) {
-						printk(KERN_ERR
-						"No LNBH24 found!\n");
+						pr_err("No LNBH24 found!\n");
 						goto error_out;
 					}
 				} else {
-					printk(KERN_ERR "%s: No STV6110(A) Silicon Tuner found!\n", __func__=
);
+					pr_err("%s: No STV6110(A) Silicon Tuner found!\n", __func__);
 					goto error_out;
 				}
 			}
@@ -766,7 +765,7 @@ static void frontend_init(struct budget *budget)
 	}

 	if (budget->dvb_frontend =3D=3D NULL) {
-		printk("budget: A frontend driver was not found for device [%04x:%04x] =
subsystem [%04x:%04x]\n",
+		pr_err("A frontend driver was not found for device [%04x:%04x] subsyste=
m [%04x:%04x]\n",
 		       budget->dev->pci->vendor,
 		       budget->dev->pci->device,
 		       budget->dev->pci->subsystem_vendor,
@@ -778,7 +777,7 @@ static void frontend_init(struct budget *budget)
 	return;

 error_out:
-	printk("budget: Frontend registration failed!\n");
+	pr_err("Frontend registration failed!\n");
 	dvb_frontend_detach(budget->dvb_frontend);
 	budget->dvb_frontend =3D NULL;
 }
@@ -798,7 +797,7 @@ static int budget_attach(struct saa7146_dev *dev, stru=
ct saa7146_pci_extension_d

 	err =3D ttpci_budget_init(budget, dev, info, THIS_MODULE, adapter_nr);
 	if (err) {
-		printk("=3D=3D> failed\n");
+		pr_err("=3D=3D> failed\n");
 		kfree(budget);
 		return err;
 	}
diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/media/pci/ttpci/bu=
dget.h
index ae6de6a19..db5f8495c 100644
=2D-- a/drivers/media/pci/ttpci/budget.h
+++ b/drivers/media/pci/ttpci/budget.h
@@ -3,6 +3,12 @@
 #ifndef __BUDGET_DVB__
 #define __BUDGET_DVB__

+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <media/dvb_frontend.h>
 #include <media/dvbdev.h>
 #include <media/demux.h>
@@ -23,8 +29,7 @@ extern int budget_debug;

 #define dprintk(level, fmt, arg...) do {				\
 	if (level & budget_debug)					\
-		printk(KERN_DEBUG KBUILD_MODNAME ": %s(): " fmt,	\
-		       __func__, ##arg);				\
+		pr_info("%s(): " fmt, __func__, ##arg);			\
 } while (0)

 #define TS_SIZE        188
=2D-
2.34.0


