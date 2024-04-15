Return-Path: <linux-media+bounces-9297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E788A46EA
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C161F223B3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BD41DA2F;
	Mon, 15 Apr 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="AoIec3sm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D26171C4
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147881; cv=none; b=UCfehLb7t0SqTV9a/50iIgXI69435ftNxDZtu4RL2Yflr2KjbEKjcj9wuzH0LpbfZS/5x7WpG45QDOzEXGCYY3CTR87q+yx/51PLfH3qBhh7dOPmsQYOt35Q3Aodaeoo7yOnci+Y2fii7nLbPmsjih+SXL370PnO7ZynNPM5DPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147881; c=relaxed/simple;
	bh=FrGR41KjPXPSi/OGFAbs5q9s10UZptk9DsOF1hda5Hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWKRaxxWPMoOTOtUsPYvyjdECjzYr1A+hJCaT8T5e1//ELCsucLiAiw7DIfcoV/iLoha53hy7BOapjgIbRNJF3Ruzu2q2sp3lxfhSAjSyo5AYiq9ojg+Yl10FpT9QaWwAGmmLmuxzQGFNsqpTN39YpCrHUBkftJSkoV1DxUYhg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=AoIec3sm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147873; x=1713752673; i=herdler@nurfuerspam.de;
	bh=nYA4hDtQ0TIVI1N2KCTao57ubrdy7LJ8HIzWpARQ3j0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=AoIec3smddPusPvgXCsAHENJXTg5chqXqbmMQYqlO9VpMb+hLRSBTrCAZZnHvO4M
	 vfI/OguDDcknJVQvrjC11uKa1/KHT88F79pb4D4xM1t9jWgu5jdEPRpSjQaHK+Y+k
	 nZtsibiTSrIp2795zQfuY5oZviABMAw8/lKt12SBNW+q4EwernBKnssqdOi8qj9UN
	 Qou0zWHbHhP9OhYvRyXR2FZwO3lUhwAmW/NTUiFC7tPeRNn9Yf+u8ePVFNQ2BfdI/
	 AKSKLdWCsJL4oLNhqvkf5JH/Kvyjbx+I4YBn6xIiuHPAEjOsCFcgnK+Zf2bzvrKKu
	 ppDhrLuhReqfL3jcpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1snT3z34iY-00rZwy; Mon, 15
 Apr 2024 04:24:33 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 10/10] media: ttpci: coding style fixes: logging
Date: Mon, 15 Apr 2024 04:24:11 +0200
Message-Id: <20240415022411.234580-11-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:C4S+40gEQqJ3D1pcrb+Z1mUvCJsWEVCBdmXZMiyX8RLLzWE3oGb
 bq6R+PoEssyHu2WBym11EBFW3drmR2zL5GoUNemAwF0R/DJ8flsEhW5aeoQ+mJbKNE3kcGS
 SwFcIcWHx91qlljutDcGY1LiKGwm72VAkZs48CWyIrHn2isI0ITZ0nLo5iEMPZ0CdABfyk8
 ZSKiAbssdkWQDo65qh6qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CCDHlV0hOiE=;K9SCso6i05Ttp/Lxf3QH74ZZkmg
 pK5OM6Ptg+7gPIjiwD03pZCw3TmYGtz6lJIFNUFW0gIA38xrdLsDn0JVLUSb6EvbKbh0uHlal
 suqdqVuv6xZecLoVRwADHFqzspDDKwoQxK1DpX1niTpR5ZsBkotcP2Ob8fBnu1lKWH6mhPmna
 NuzUIE91uwR3fJtyY5a+iAflgYvJImT95mnMtHeGq/46zKYkzslp7axcFyomiNMwW75VYVU/j
 e9vY+/yqfiJDi4x/jGkM8A9zjoqybpk1BbmsdU0LFTi94arsFx17Yl8KfW4KL8MFZ8IZnVyvC
 /8h2FFnXma6wpCU1YwKkR+v5GgczZA6Iu19hraqXhUEfTt1NCyv0oe6tFRcCtGW5wDAWCVM9N
 Yf7XgYHfrcCm429YobU6qKsGc8iwMGFFbPT+7VWIB7oxjXOMUG9SXCySjyG69llLtJrT4Vjvg
 8V+dU0pjqYwu9vxpYAVRQDXc/DihiMi24z2a/PMFMt98tJ9hFpMKO6l+RKFyKF+hTHOwSLBi3
 OBmuHorabP0To5Aq26/gPF7VI4yIX5tFpHx29k29rCuLzQGgl0iI6ymllyG2KB7dAOYX2RyEH
 lf90gyuJrJPaib/gq5UeODsDc9ANpPnWLXfsDr/vRhxglSPKQ333pPDudVt424cHG2nmrdXnn
 b+czlzCz1hBLnKarnuAh8/1H34WZ/3HxvjjltIoaRnMoZn7Tk3yIqZVuSknELQpz8EMrCTEBh
 6am8wzKJeDhWCzWh+5WKPWUY8xA+oQ58srI/Dn5iKWrXeebCjpqRlOgveyt1LPQrVDO9lh7nu
 EOTRuBDDGH42e88W5o9B0GquOYyr0Iwzx9LwgYin34FYw=

This patch fixes the following checkpatch warnings:

WARNING:PRINTK_WITHOUT_KERN_LEVEL: printk() should include KERN_<LEVEL> fa=
cility level
WARNING:PREFER_PR_LEVEL: Prefer [subsystem eg: netdev]_dbg([subsystem]dev,=
 ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using =
'ciintf_slot_ts_enable', this function's name, in a string
CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'level' may be better as '(leve=
l)' to avoid precedence issues

There was no consistent style of logging functions used so far.
Convert all logging to the appropriate pr_* macros.
Add a global pr_fmt macro for the whole driver.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Changes since v1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Title

2. Add parentheses around '(level)' in dprintk macro.
   They aren't necessary in this case, but that isn't obvious.
   The parentheses are harmless and maybe they save someone time.

3. Add parentheses after __func__ string '%s()' in pr_* messages in the
   driver it self. This parentheses had been missing all the time.
   Pure cosmetics, but now the messages are consistent with the dprintk
   messages.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

 drivers/media/pci/ttpci/budget-av.c   | 11 +++++-----
 drivers/media/pci/ttpci/budget-ci.c   | 24 +++++++++++-----------
 drivers/media/pci/ttpci/budget-core.c |  4 ++--
 drivers/media/pci/ttpci/budget.c      | 29 +++++++++++++--------------
 drivers/media/pci/ttpci/budget.h      | 11 +++++++---
 5 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index 76660d22f..2e62c938e 100644
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

@@ -1464,7 +1463,7 @@ static int budget_av_attach(struct saa7146_dev *dev,=
 struct saa7146_pci_extensio
 		if (err !=3D 0) {
 			ttpci_budget_deinit(&budget_av->budget);
 			kfree(budget_av);
-			ERR("cannot init vv subsystem\n");
+			pr_err("cannot init vv subsystem\n");
 			return err;
 		}
 		vv_data.vid_ops.vidioc_enum_input =3D vidioc_enum_input;
@@ -1476,7 +1475,7 @@ static int budget_av_attach(struct saa7146_dev *dev,=
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
index 062dc14a7..76de40e3c 100644
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
@@ -485,7 +485,7 @@ static int ciintf_init(struct budget_ci *budget_ci)
 	result =3D dvb_ca_en50221_init(&budget_ci->budget.dvb_adapter,
 				     &budget_ci->ca, ca_flags, 1);
 	if (result !=3D 0) {
-		printk("budget_ci: CI interface detected, but initialisation failed.\n"=
);
+		pr_err("CI interface detected, but initialisation failed.\n");
 		goto error;
 	}

@@ -504,7 +504,7 @@ static int ciintf_init(struct budget_ci *budget_ci)
 			       CICONTROL_RESET, 1, 0);

 	// success!
-	printk("budget_ci: CI interface initialised\n");
+	pr_info("CI interface initialised\n");
 	budget_ci->budget.ci_present =3D 1;

 	// forge a fake CI IRQ so the CAM state is setup correctly
@@ -1358,7 +1358,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)

 			budget_ci->budget.dvb_frontend->ops.dishnetwork_send_legacy_command =
=3D NULL;
 			if (dvb_attach(lnbp21_attach, budget_ci->budget.dvb_frontend, &budget_=
ci->budget.i2c_adap, LNBP21_LLC, 0) =3D=3D NULL) {
-				printk("%s: No LNBP21 found!\n", __func__);
+				pr_err("%s(): No LNBP21 found!\n", __func__);
 				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 				budget_ci->budget.dvb_frontend =3D NULL;
 			}
@@ -1369,7 +1369,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 		budget_ci->budget.dvb_frontend =3D dvb_attach(tda10023_attach, &tda1002=
3_config, &budget_ci->budget.i2c_adap, 0x48);
 		if (budget_ci->budget.dvb_frontend) {
 			if (dvb_attach(tda827x_attach, budget_ci->budget.dvb_frontend, 0x61, &=
budget_ci->budget.i2c_adap, &tda827x_config) =3D=3D NULL) {
-				printk(KERN_ERR "%s: No tda827x found!\n", __func__);
+				pr_err("%s(): No tda827x found!\n", __func__);
 				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 				budget_ci->budget.dvb_frontend =3D NULL;
 			}
@@ -1381,12 +1381,12 @@ static void frontend_init(struct budget_ci *budget=
_ci)
 		if (budget_ci->budget.dvb_frontend) {
 			if (dvb_attach(stb6000_attach, budget_ci->budget.dvb_frontend, 0x63, &=
budget_ci->budget.i2c_adap)) {
 				if (!dvb_attach(lnbp21_attach, budget_ci->budget.dvb_frontend, &budge=
t_ci->budget.i2c_adap, 0, 0)) {
-					printk(KERN_ERR "%s: No LNBP21 found!\n", __func__);
+					pr_err("%s(): No LNBP21 found!\n", __func__);
 					dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 					budget_ci->budget.dvb_frontend =3D NULL;
 				}
 			} else {
-				printk(KERN_ERR "%s: No STB6000 found!\n", __func__);
+				pr_err("%s(): No STB6000 found!\n", __func__);
 				dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 				budget_ci->budget.dvb_frontend =3D NULL;
 			}
@@ -1421,7 +1421,7 @@ static void frontend_init(struct budget_ci *budget_c=
i)
 		if (budget_ci->budget.dvb_frontend) {
 			if (dvb_attach(stb6100_attach, budget_ci->budget.dvb_frontend, &tt3200=
_stb6100_config, &budget_ci->budget.i2c_adap)) {
 				if (!dvb_attach(lnbp21_attach, budget_ci->budget.dvb_frontend, &budge=
t_ci->budget.i2c_adap, 0, 0)) {
-					printk("%s: No LNBP21 found!\n", __func__);
+					pr_err("%s(): No LNBP21 found!\n", __func__);
 					dvb_frontend_detach(budget_ci->budget.dvb_frontend);
 					budget_ci->budget.dvb_frontend =3D NULL;
 				}
@@ -1435,7 +1435,7 @@ static void frontend_init(struct budget_ci *budget_c=
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
@@ -1443,7 +1443,7 @@ static void frontend_init(struct budget_ci *budget_c=
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
index 91b998808..f623c2509 100644
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
+				pr_err("%s(): No LNBP21 found!\n", __func__);
 				goto error_out;
 			}
 			break;
@@ -639,10 +639,10 @@ static void frontend_init(struct budget *budget)
 			budget->dvb_frontend =3D fe;
 			if (dvb_attach(tda826x_attach, fe, 0x60,
 				       &budget->i2c_adap, 0) =3D=3D NULL)
-				printk("%s: No tda826x found!\n", __func__);
+				pr_err("%s(): No tda826x found!\n", __func__);
 			if (dvb_attach(lnbp21_attach, fe,
 				       &budget->i2c_adap, 0, 0) =3D=3D NULL) {
-				printk("%s: No LNBP21 found!\n", __func__);
+				pr_err("%s(): No LNBP21 found!\n", __func__);
 				goto error_out;
 			}
 			break;
@@ -695,11 +695,11 @@ static void frontend_init(struct budget *budget)
 						       budget->dvb_frontend,
 						       &budget->i2c_adap,
 						       &tt1600_isl6423_config) =3D=3D NULL) {
-						printk(KERN_ERR "%s: No Intersil ISL6423 found!\n", __func__);
+						pr_err("%s(): No Intersil ISL6423 found!\n", __func__);
 						goto error_out;
 					}
 				} else {
-					printk(KERN_ERR "%s: No STV6110(A) Silicon Tuner found!\n", __func__=
);
+					pr_err("%s(): No STV6110(A) Silicon Tuner found!\n", __func__);
 					goto error_out;
 				}
 			}
@@ -720,7 +720,7 @@ static void frontend_init(struct budget *budget)
 							  STV090x_DEMODULATOR_0);

 			if (budget->dvb_frontend) {
-				printk(KERN_INFO "budget: Omicom S2 detected\n");
+				pr_info("Omicom S2 detected\n");

 				ctl =3D dvb_attach(stv6110x_attach,
 						 budget->dvb_frontend,
@@ -753,12 +753,11 @@ static void frontend_init(struct budget *budget)
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
+					pr_err("%s(): No STV6110(A) Silicon Tuner found!\n", __func__);
 					goto error_out;
 				}
 			}
@@ -767,7 +766,7 @@ static void frontend_init(struct budget *budget)
 	}

 	if (budget->dvb_frontend =3D=3D NULL) {
-		printk("budget: A frontend driver was not found for device [%04x:%04x] =
subsystem [%04x:%04x]\n",
+		pr_err("A frontend driver was not found for device [%04x:%04x] subsyste=
m [%04x:%04x]\n",
 		       budget->dev->pci->vendor,
 		       budget->dev->pci->device,
 		       budget->dev->pci->subsystem_vendor,
@@ -779,7 +778,7 @@ static void frontend_init(struct budget *budget)
 	return;

 error_out:
-	printk("budget: Frontend registration failed!\n");
+	pr_err("Frontend registration failed!\n");
 	dvb_frontend_detach(budget->dvb_frontend);
 	budget->dvb_frontend =3D NULL;
 }
@@ -799,7 +798,7 @@ static int budget_attach(struct saa7146_dev *dev, stru=
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
index ae6de6a19..83ead34dc 100644
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
@@ -22,9 +28,8 @@ extern int budget_debug;
 #endif

 #define dprintk(level, fmt, arg...) do {				\
-	if (level & budget_debug)					\
-		printk(KERN_DEBUG KBUILD_MODNAME ": %s(): " fmt,	\
-		       __func__, ##arg);				\
+	if ((level) & budget_debug)					\
+		pr_info("%s(): " fmt, __func__, ##arg);			\
 } while (0)

 #define TS_SIZE        188
=2D-
2.34.0


