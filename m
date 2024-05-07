Return-Path: <linux-media+bounces-10946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1211D8BD897
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 919CD1F23B41
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F39AAD25;
	Tue,  7 May 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="L0fjY5YF"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9B8830
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041534; cv=none; b=Yhjz5e+rvqWknY2Use8WTTMENpftcKkzz8ei6TE6cfunbRmjfaB+fIL+TVmI9G/5fQs3Ipgv6Ltoisi1YsbvtxJaZ5w98m6cmvHfOOUT08ajIwmewPdZsb+NXzxT7hXyThJQc6qtOMUHJlkYyCnqeSvPwPrTdvkjmxIzdz8BAvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041534; c=relaxed/simple;
	bh=jxRZWzoRHzhZKxQ7TkMaZtl4uNBwCyNlMvu8bZ7ydUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HE0P5PrEGwZux/4J7XCy6n1nGFpfzdryi1Ns9Bt8KTy2teOqJqMzyE9xtqBxVyKAJ4Qg6bOEd7vLVzss2CrXETxwbNBirxs/X6sr3aFs9NvskWHH73sCKs11evh3cl3+XCGCUHua4RHFusbBHdU/XZaZro5ckeTE3fvxssprBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=L0fjY5YF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041527; x=1715646327; i=herdler@nurfuerspam.de;
	bh=mE/rSrWRng8CAXkTgHJJT8nyxFf3VT4MNRDLPXr4la4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=L0fjY5YFWlUuAjNhyIfos8bXAfKsmNRBGDM3cdbgU5YyVi3y5YGcZmL7W2elJm60
	 rYm45RvUj2akjEjXqjj6jHNAkdabwS9O+RA4BAvLMB9FMtAvDdQsl1FhhXjPPhY+c
	 fw2fRKWnEuydPmzrcECp+Rk4E5haZtzBzpgGgNwAueDxbyi1t6PK6MFIr+fnBYt9u
	 7qoQFe/p19EhV+BOpsduWewbgkOlwszsc2D6QojVtqqLQYP6Iei5xPzWkPghFw/AJ
	 Gux5f6XphdrFeuPrKFYMQC8nIayK3ljLwiQXkPVal5LaSKHNomvCby0/ddvcjKwfx
	 pigxYxs9TX73Btredg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b2T-1ryLsp3eIv-007yji; Tue, 07
 May 2024 02:25:26 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 07/21] media: av7110: coding style fixes: pointer_location
Date: Tue,  7 May 2024 02:24:46 +0200
Message-Id: <20240507002500.81867-8-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CvP/ll2xmEDJMmTUBypgZpRPH2b+BwVQ7iMGOk2x+oLI8GTSpBQ
 mCm2H+8lENuwxs4ltoI6/DO62jmcYaV9bdHf76EG7ODRyEqdkF5pCq1OG7SjLGU57aMYq5i
 DDZOaAkbxXV0i5lxyR+AycBs3aI06FYz+lJ+j7ULxbva9YDcaOczlb3bi1Aq4vsJis0S18K
 XN7Z65v7mFvGT+HO7hDLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:82E7FQFv/zU=;LRw6tanlbnqlCbVDUTb0RDww/L5
 vQqOhX928yu/KnwjEYqq2uVnF9rtsiH1c7FzzT9SoAxfTpbACexiNdc29bYvZOdi8dRHuAaDE
 5RQZw5sZLnkj7/HLWJ7/kpyikDSl7lZRSF9qLO6NM8BAgCOIIaQVq06DuUqJND0dlQNfEWMIf
 8vG7fMhRhWd+0FbS8yguPpwiRfQzZhEmTcvPtj5HpnCoVD4gBjT2bczeNxpUnnbPkx6F1KpSl
 AfNcKm6vOeMMv7WhA5TE6hZqCCSbIUxM3y97BhO5swkSIWAOOugA+V85erLuhJBTbm5bcs+dW
 duEgl8avm95bP5IBpKgbjGHQX/LKoqeD4OGvaJMNx4JXCew/Ie1hmQFNmUlHAxfYysAgnH5lF
 jq6odnQhBHvZJFPNmPcSizI6SZx/Hb7aMMjgVVpTzPAkK3EJCg+Yrn8j1wAdpOwVcnsmciPiM
 jzj5sLSiKZ1vt8huQKdTcOidMrbrJnzgVGKESqL6ibMUvJxcV13PzRVS6W8FAbUp5/57/WRzb
 MNmKuY6RiMUidvbTgN86Sx69/qtGxYrRB2inSu3urrKdsJTt9PXdd2KKYHQoaw7Fx4+IhcIPo
 WNn81xkDNtUfKcKNOIPuggqWLWawQKn3FRmniWtSxzcAUmGQPpYt4ephY7VyHeC31zlzIEUUD
 slVTLaaDcn2jgvtjxGiRphbCw3UiKUvsJlPs1K3x63RMoXwEaV1o5sNtozz7JTwD8kViZOUfL
 2U0bFMhEiyYxvtUHaSWDNQkracI2QQNWRv/lFDPvZ1L/ELk/nJYfWSmDMfffyVf3qEX4d8e7F
 fsewE3hQopXoHKUS+gAZdlVyzEQuada2zHVDFJqnzyYzA=

This patch fixes the following checkpatch warnings:

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"

Whitespace changes only.
"git diff -w" shows no changes.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/av7110.c     | 78 +++++++++++------------
 drivers/staging/media/av7110/av7110.h     |  6 +-
 drivers/staging/media/av7110/av7110_ca.c  |  6 +-
 drivers/staging/media/av7110/av7110_hw.c  | 12 ++--
 drivers/staging/media/av7110/av7110_v4l.c | 14 ++--
 5 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index a5a431c14..eb1dc64bc 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -429,7 +429,7 @@ static void debiirq(struct tasklet_struct *t)
 		break;

 	case DATA_DEBUG_MESSAGE:
-		((s8*)av7110->debi_virt)[Reserved_SIZE - 1] =3D 0;
+		((s8 *)av7110->debi_virt)[Reserved_SIZE - 1] =3D 0;
 		printk("%s\n", (s8 *) av7110->debi_virt);
 		xfer =3D RX_BUFF;
 		break;
@@ -1143,7 +1143,7 @@ static int dvb_get_stc(struct dmx_demux *demux, unsi=
gned int num,

 static int av7110_set_tone(struct dvb_frontend *fe, enum fe_sec_tone_mode=
 tone)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	switch (tone) {
 	case SEC_TONE_ON:
@@ -1157,18 +1157,18 @@ static int av7110_set_tone(struct dvb_frontend *fe=
, enum fe_sec_tone_mode tone)
 	}
 }

-static int av7110_diseqc_send_master_cmd(struct dvb_frontend* fe,
-					 struct dvb_diseqc_master_cmd* cmd)
+static int av7110_diseqc_send_master_cmd(struct dvb_frontend *fe,
+					 struct dvb_diseqc_master_cmd *cmd)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	return av7110_diseqc_send(av7110, cmd->msg_len, cmd->msg, -1);
 }

-static int av7110_diseqc_send_burst(struct dvb_frontend* fe,
+static int av7110_diseqc_send_burst(struct dvb_frontend *fe,
 				    enum fe_sec_mini_cmd minicmd)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	return av7110_diseqc_send(av7110, 0, NULL, minicmd);
 }
@@ -1440,7 +1440,7 @@ u8 i2c_readreg(struct av7110 *av7110, u8 id, u8 reg)
  ************************************************************************=
****/


-static int check_firmware(struct av7110* av7110)
+static int check_firmware(struct av7110 *av7110)
 {
 	u32 crc =3D 0, len =3D 0;
 	unsigned char *ptr;
@@ -1491,12 +1491,12 @@ static int check_firmware(struct av7110* av7110)
 	return 0;
 }

-static void put_firmware(struct av7110* av7110)
+static void put_firmware(struct av7110 *av7110)
 {
 	vfree(av7110->bin_fw);
 }

-static int get_firmware(struct av7110* av7110)
+static int get_firmware(struct av7110 *av7110)
 {
 	int ret;
 	const struct firmware *fw;
@@ -1540,7 +1540,7 @@ static int get_firmware(struct av7110* av7110)
 static int alps_bsrv2_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u8 pwr =3D 0;
 	u8 buf[4];
 	struct i2c_msg msg =3D { .addr =3D 0x61, .flags =3D 0, .buf =3D buf, .le=
n =3D sizeof(buf) };
@@ -1583,7 +1583,7 @@ static struct ves1x93_config alps_bsrv2_config =3D {
 static int alps_tdbe2_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u32 div;
 	u8 data[4];
 	struct i2c_msg msg =3D { .addr =3D 0x62, .flags =3D 0, .buf =3D data, .l=
en =3D sizeof(data) };
@@ -1615,7 +1615,7 @@ static struct ves1820_config alps_tdbe2_config =3D {
 static int grundig_29504_451_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u32 div;
 	u8 data[4];
 	struct i2c_msg msg =3D { .addr =3D 0x61, .flags =3D 0, .buf =3D data, .l=
en =3D sizeof(data) };
@@ -1642,7 +1642,7 @@ static struct tda8083_config grundig_29504_451_confi=
g =3D {
 static int philips_cd1516_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u32 div;
 	u32 f =3D p->frequency;
 	u8 data[4];
@@ -1674,7 +1674,7 @@ static struct ves1820_config philips_cd1516_config =
=3D {
 static int alps_tdlb7_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u32 div, pwr;
 	u8 data[4];
 	struct i2c_msg msg =3D { .addr =3D 0x60, .flags =3D 0, .buf =3D data, .l=
en =3D sizeof(data) };
@@ -1698,10 +1698,10 @@ static int alps_tdlb7_tuner_set_params(struct dvb_=
frontend *fe)
 	return 0;
 }

-static int alps_tdlb7_request_firmware(struct dvb_frontend* fe, const str=
uct firmware **fw, char* name)
+static int alps_tdlb7_request_firmware(struct dvb_frontend *fe, const str=
uct firmware **fw, char *name)
 {
 #if IS_ENABLED(CONFIG_DVB_SP8870)
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	return request_firmware(fw, name, &av7110->dev->pci->dev);
 #else
@@ -1812,7 +1812,7 @@ static u8 nexusca_stv0297_inittab[] =3D {
 static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u32 div;
 	u8 data[4];
 	struct i2c_msg msg =3D { .addr =3D 0x63, .flags =3D 0, .buf =3D data, .l=
en =3D sizeof(data) };
@@ -1868,7 +1868,7 @@ static struct stv0297_config nexusca_stv0297_config =
=3D {
 static int grundig_29504_401_tuner_set_params(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;
 	u32 div;
 	u8 cfg, cpump, band_select;
 	u8 data[4];
@@ -1956,7 +1956,7 @@ static int av7110_fe_lock_fix(struct av7110 *av7110,=
 enum fe_status status)

 static int av7110_fe_set_frontend(struct dvb_frontend *fe)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -1965,9 +1965,9 @@ static int av7110_fe_set_frontend(struct dvb_fronten=
d *fe)
 	return ret;
 }

-static int av7110_fe_init(struct dvb_frontend* fe)
+static int av7110_fe_init(struct dvb_frontend *fe)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -1978,7 +1978,7 @@ static int av7110_fe_init(struct dvb_frontend* fe)
 static int av7110_fe_read_status(struct dvb_frontend *fe,
 				 enum fe_status *status)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	/* call the real implementation */
 	int ret =3D av7110->fe_read_status(fe, status);
@@ -1988,9 +1988,9 @@ static int av7110_fe_read_status(struct dvb_frontend=
 *fe,
 	return ret;
 }

-static int av7110_fe_diseqc_reset_overload(struct dvb_frontend* fe)
+static int av7110_fe_diseqc_reset_overload(struct dvb_frontend *fe)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -1998,10 +1998,10 @@ static int av7110_fe_diseqc_reset_overload(struct =
dvb_frontend* fe)
 	return ret;
 }

-static int av7110_fe_diseqc_send_master_cmd(struct dvb_frontend* fe,
-					    struct dvb_diseqc_master_cmd* cmd)
+static int av7110_fe_diseqc_send_master_cmd(struct dvb_frontend *fe,
+					    struct dvb_diseqc_master_cmd *cmd)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2014,7 +2014,7 @@ static int av7110_fe_diseqc_send_master_cmd(struct d=
vb_frontend* fe,
 static int av7110_fe_diseqc_send_burst(struct dvb_frontend *fe,
 				       enum fe_sec_mini_cmd minicmd)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2027,7 +2027,7 @@ static int av7110_fe_diseqc_send_burst(struct dvb_fr=
ontend *fe,
 static int av7110_fe_set_tone(struct dvb_frontend *fe,
 			      enum fe_sec_tone_mode tone)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2040,7 +2040,7 @@ static int av7110_fe_set_tone(struct dvb_frontend *f=
e,
 static int av7110_fe_set_voltage(struct dvb_frontend *fe,
 				 enum fe_sec_voltage voltage)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret) {
@@ -2050,9 +2050,9 @@ static int av7110_fe_set_voltage(struct dvb_frontend=
 *fe,
 	return ret;
 }

-static int av7110_fe_dishnetwork_send_legacy_command(struct dvb_frontend*=
 fe, unsigned long cmd)
+static int av7110_fe_dishnetwork_send_legacy_command(struct dvb_frontend =
*fe, unsigned long cmd)
 {
-	struct av7110* av7110 =3D fe->dvb->priv;
+	struct av7110 *av7110 =3D fe->dvb->priv;

 	int ret =3D av7110_fe_lock_fix(av7110, 0);
 	if (!ret)
@@ -2060,7 +2060,7 @@ static int av7110_fe_dishnetwork_send_legacy_command=
(struct dvb_frontend* fe, un
 	return ret;
 }

-static void dvb_s_recover(struct av7110* av7110)
+static void dvb_s_recover(struct av7110 *av7110)
 {
 	av7110_fe_init(av7110->fe);

@@ -2077,7 +2077,7 @@ static void dvb_s_recover(struct av7110* av7110)
 	av7110_fe_set_frontend(av7110->fe);
 }

-static u8 read_pwm(struct av7110* av7110)
+static u8 read_pwm(struct av7110 *av7110)
 {
 	u8 b =3D 0xff;
 	u8 pwm;
@@ -2346,7 +2346,7 @@ static int frontend_init(struct av7110 *av7110)
  * The same behaviour of missing VSYNC can be duplicated on budget
  * cards, by setting DD1_INIT trigger mode 7 in 3rd nibble.
  */
-static int av7110_attach(struct saa7146_dev* dev,
+static int av7110_attach(struct saa7146_dev *dev,
 			 struct saa7146_pci_extension_data *pci_ext)
 {
 	const int length =3D TS_WIDTH * TS_HEIGHT;
@@ -2453,7 +2453,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 		return -ENOMEM;
 	}

-	av7110->card_name =3D (char*) pci_ext->ext_priv;
+	av7110->card_name =3D (char *)pci_ext->ext_priv;
 	av7110->dev =3D dev;
 	dev->ext_priv =3D av7110;

@@ -2746,7 +2746,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 	goto out;
 }

-static int av7110_detach(struct saa7146_dev* saa)
+static int av7110_detach(struct saa7146_dev *saa)
 {
 	struct av7110 *av7110 =3D saa->ext_priv;
 	dprintk(4, "%p\n", av7110);
@@ -2803,7 +2803,7 @@ static int av7110_detach(struct saa7146_dev* saa)
 }


-static void av7110_irq(struct saa7146_dev* dev, u32 *isr)
+static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
 {
 	struct av7110 *av7110 =3D dev->ext_priv;

diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media=
/av7110/av7110.h
index 809d938ae..e251f989e 100644
=2D-- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -260,19 +260,19 @@ struct av7110 {
 	unsigned char *bin_root;
 	unsigned long size_root;

-	struct dvb_frontend* fe;
+	struct dvb_frontend *fe;
 	enum fe_status fe_status;

 	struct mutex ioctl_mutex;

 	/* crash recovery */
-	void				(*recover)(struct av7110* av7110);
+	void				(*recover)(struct av7110 *av7110);
 	enum fe_sec_voltage		saved_voltage;
 	enum fe_sec_tone_mode		saved_tone;
 	struct dvb_diseqc_master_cmd	saved_master_cmd;
 	enum fe_sec_mini_cmd		saved_minicmd;

-	int (*fe_init)(struct dvb_frontend* fe);
+	int (*fe_init)(struct dvb_frontend *fe);
 	int (*fe_read_status)(struct dvb_frontend *fe, enum fe_status *status);
 	int (*fe_diseqc_reset_overload)(struct dvb_frontend *fe);
 	int (*fe_diseqc_send_master_cmd)(struct dvb_frontend *fe,
diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/me=
dia/av7110/av7110_ca.c
index c1338e074..9ff5bd6f5 100644
=2D-- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -294,7 +294,7 @@ static int dvb_ca_ioctl(struct file *file, unsigned in=
t cmd, void *parg)

 	case CA_SET_DESCR:
 	{
-		struct ca_descr *descr =3D (struct ca_descr*) parg;
+		struct ca_descr *descr =3D (struct ca_descr *)parg;

 		if (descr->index >=3D 16 || descr->parity > 1) {
 			mutex_unlock(&av7110->ioctl_mutex);
@@ -369,12 +369,12 @@ void av7110_ca_unregister(struct av7110 *av7110)
 	dvb_unregister_device(av7110->ca_dev);
 }

-int av7110_ca_init(struct av7110* av7110)
+int av7110_ca_init(struct av7110 *av7110)
 {
 	return ci_ll_init(&av7110->ci_rbuffer, &av7110->ci_wbuffer, 8192);
 }

-void av7110_ca_exit(struct av7110* av7110)
+void av7110_ca_exit(struct av7110 *av7110)
 {
 	ci_ll_release(&av7110->ci_rbuffer, &av7110->ci_wbuffer);
 }
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/me=
dia/av7110/av7110_hw.c
index a0be37717..714a4438b 100644
=2D-- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -318,7 +318,7 @@ int av7110_wait_msgstate(struct av7110 *av7110, u16 fl=
ags)
 	return 0;
 }

-static int __av7110_send_fw_cmd(struct av7110 *av7110, u16* buf, int leng=
th)
+static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int leng=
th)
 {
 	int i;
 	unsigned long start;
@@ -453,7 +453,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110,=
 u16* buf, int length)
 	return 0;
 }

-static int av7110_send_fw_cmd(struct av7110 *av7110, u16* buf, int length=
)
+static int av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length=
)
 {
 	int ret;

@@ -606,7 +606,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *requ=
est_buf,
 	return 0;
 }

-static int av7110_fw_query(struct av7110 *av7110, u16 tag, u16* buf, s16 =
length)
+static int av7110_fw_query(struct av7110 *av7110, u16 tag, u16 *buf, s16 =
length)
 {
 	int ret;
 	ret =3D av7110_fw_request(av7110, &tag, 0, buf, length);
@@ -851,7 +851,7 @@ static inline int WaitUntilBmpLoaded(struct av7110 *av=
7110)
 }

 static inline int LoadBitmap(struct av7110 *av7110,
-			     u16 dx, u16 dy, int inc, u8 __user * data)
+			     u16 dx, u16 dy, int inc, u8 __user *data)
 {
 	u16 format;
 	int bpp;
@@ -960,7 +960,7 @@ static int OSDSetColor(struct av7110 *av7110, u8 color=
, u8 r, u8 g, u8 b, u8 ble
 	return ret;
 }

-static int OSDSetPalette(struct av7110 *av7110, u32 __user * colors, u8 f=
irst, u8 last)
+static int OSDSetPalette(struct av7110 *av7110, u32 __user *colors, u8 fi=
rst, u8 last)
 {
 	int i;
 	int length =3D last - first + 1;
@@ -986,7 +986,7 @@ static int OSDSetPalette(struct av7110 *av7110, u32 __=
user * colors, u8 first, u
 }

 static int OSDSetBlock(struct av7110 *av7110, int x0, int y0,
-		       int x1, int y1, int inc, u8 __user * data)
+		       int x1, int y1, int inc, u8 __user *data)
 {
 	uint w, h, bpp, bpl, size, lpb, bnum, brest;
 	int i;
diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/m=
edia/av7110/av7110_v4l.c
index ed2c60580..2c4707a60 100644
=2D-- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -175,7 +175,7 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev=
, u32 freq)

 static int stv0297_set_tv_freq(struct saa7146_dev *dev, u32 freq)
 {
-	struct av7110 *av7110 =3D (struct av7110*)dev->ext_priv;
+	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
 	u32 div;
 	u8 data[4];

@@ -215,7 +215,7 @@ static const struct v4l2_audio msp3400_v4l2_audio =3D =
{

 static int av7110_dvb_c_switch(struct saa7146_dev *dev)
 {
-	struct av7110 *av7110 =3D (struct av7110*)dev->ext_priv;
+	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
 	u16 adswitch;
 	int source, sync;

@@ -610,7 +610,7 @@ static int vidioc_s_fmt_sliced_vbi_out(struct file *fi=
le, void *fh,
 static ssize_t av7110_vbi_write(struct file *file, const char __user *dat=
a, size_t count, loff_t *ppos)
 {
 	struct saa7146_dev *dev =3D video_drvdata(file);
-	struct av7110 *av7110 =3D (struct av7110*) dev->ext_priv;
+	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;
 	struct v4l2_sliced_vbi_data d;
 	int rc;

@@ -795,7 +795,7 @@ int av7110_init_analog_module(struct av7110 *av7110)

 int av7110_init_v4l(struct av7110 *av7110)
 {
-	struct saa7146_dev* dev =3D av7110->dev;
+	struct saa7146_dev *dev =3D av7110->dev;
 	struct saa7146_ext_vv *vv_data;
 	int ret;

@@ -853,7 +853,7 @@ int av7110_init_v4l(struct av7110 *av7110)

 int av7110_exit_v4l(struct av7110 *av7110)
 {
-	struct saa7146_dev* dev =3D av7110->dev;
+	struct saa7146_dev *dev =3D av7110->dev;

 	saa7146_unregister_device(&av7110->v4l_dev, av7110->dev);
 	saa7146_unregister_device(&av7110->vbi_dev, av7110->dev);
@@ -909,9 +909,9 @@ static struct saa7146_standard dvb_standard[] =3D {
 	}
 };

-static int std_callback(struct saa7146_dev* dev, struct saa7146_standard =
*std)
+static int std_callback(struct saa7146_dev *dev, struct saa7146_standard =
*std)
 {
-	struct av7110 *av7110 =3D (struct av7110*) dev->ext_priv;
+	struct av7110 *av7110 =3D (struct av7110 *)dev->ext_priv;

 	if (std->id & V4L2_STD_PAL) {
 		av7110->vidmode =3D AV7110_VIDEO_MODE_PAL;
=2D-
2.34.0


