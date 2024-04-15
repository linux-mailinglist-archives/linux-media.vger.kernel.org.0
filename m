Return-Path: <linux-media+bounces-9294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E48A46E7
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DE0A1C21A77
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795131CD13;
	Mon, 15 Apr 2024 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="Ijm1hXsh"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C611401F
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147880; cv=none; b=OF08ByMDZeGWRFC7yEajN0mt9D6AsFnVDMgV/kbizeHk3CE7m8CMYT2ASFtdKrXSzJ/TGfivtMDQfNIIddtWUWYTJkVWpR5/LynTI4q5Wv/66nu0++viYHWz1C8wptnpE+QGXxuxrnCYfo5ze/9Cr6uCKErFML6BtDCFHJrYdxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147880; c=relaxed/simple;
	bh=72vqYiEPxraFzozugc8BK1LdrjydwO1uozLbNXtfhg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nlIhevbVlKJ5MDr2YIs0XreIvDAVWDzPZ3pKb5q75foDy+vwd7sknkOwZcefGVZLCE7OtARSV9RlxkkR7RzHbNZ20G60su/rD2JzlCXis+V235Fykc81Kt4ZyXvP2rpXge54PawIzoXbTh5A36uAwTxBuOuRtl32v9/6/EHmGVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=Ijm1hXsh; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147872; x=1713752672; i=herdler@nurfuerspam.de;
	bh=Rj/fUlAMM0H2UIq38SoyhdmGg7CDebK5gtnlghnJZuc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Ijm1hXshPJaAIEVoSyH2Xnh+AHxS7yOwOqaljEODZMHVDM72jbgq2WWsarbgjAUK
	 eePFVZl1oCAPTVKE0gMMFbhSq5s3xPV3l509kSi4v0gpWzqPAnzo+OHivKSp/RhEf
	 GU5yhcmR7QytKsV6Y+cDFjBLl3K6KjGJsdSMVbxonx6TisU1IRXP6DaXe0SY7mvV+
	 6teSGDoo02Evs6GRQcIHWeCHbGnB8rejXu9IqILqk8oDOvyrgJHWi0vxVldSC0xyX
	 aPc0z6ZhfQtob5YdGKmfYV7VAo4piC3NeXO9KFPiMZVF5elSxIcAgQFZRS21/Mq4x
	 JO1NbgISmnxQJtePow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1rwjz80IBG-000Zp6; Mon, 15
 Apr 2024 04:24:32 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 02/10] media: ttpci: coding style fixes: whitespace
Date: Mon, 15 Apr 2024 04:24:03 +0200
Message-Id: <20240415022411.234580-3-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:IfaqP7JpAI77h4TQhdwZBhwhTYiQf8E7Nuq1c1BPoqWALWJjedu
 TfzKLQO5/cOr4+JTwOO+NGPFml+eON60WGpxdr9cfiXgjBLOC0FiOorexCKsVmpHTvxVEiZ
 XOPp1Jr4cwfbqOYIV6eN7fJ+r7rfDxUHIFk5EVTx6xDXwtUagTj9pPP6yop3am/wfHTQ+rq
 6IL62UeKXkGSmdrCrCnsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b6Cdu1ebf70=;iQRUpVyBmJSGYezBBW56EsJ5q3a
 OEsJF83NuCwVE7AbFKeF61JRSgPyz/oiOU7mDxDqJ/oevUNbXohTCPFo0rBJCk6Ws//jEqA+7
 UNY3wwW1k72vOl+CeG3lIbLVfjxt6LmtQou4PJwjNW3VgP7zdjNxz/5cw6jQdOMJfdapqt7Ag
 VmULeGy2ej11XKU5uhrrKM+AChnnLlqIKsY7vyZB0l5C4gbsMPGGfZ2YUh6ur2dOpZrGuy8no
 UQLR53z99Ue7gc+3hgm7l8Am8aO4Y7AkWr+JL+Pv0+TSFRVOtBaNkZltHUwrHG55SrE/gV3K6
 lletvyCtmOQucbicRYfQJpJCg9BhpF8YxKR+Q8S2qd2AlZuqjHM8P0TxAdbEgBmxU8vhweuj2
 W1zXUzv+J15Ah/ITPZ9OjaZSqSEJfuGf0wBVpGIT9jUX6ltEc5h9NR7iuqzJ/8aMKo2VNWQ1L
 /mGYZBG/IB+Mi3nFhlt4FHEugIbiuVMsCYudTQNAuUt+mT7zjtDeEZF4kRCwqJs6q0nX/zlWR
 nVXAwPDQeqhlKUYJpkHWVjeqaS3cmK+qbTGKJuWXwOaEugSJZlrMq71SnCXe86nn6E0wKFUW4
 4o4vcj8V04SRh61QJmaEEh8V6Tp9xqpmacTbLegAk2nIYoTQMn6N5U/Mvd80ivDtppDba9Hs3
 JZQlXLwfni2YhBrKossNQ4y4/8K8372MJFWk6cHy+dVG9fhebkoblf7JSAlrYC9B9hR6vETYB
 hnc5l+sctJWqdMDRgvkCqvDMKM5IW9+SPlnmgkDMpuOTA+1OtZppnWHHngEyDc7tqrcrSaVAm
 sueJiqIJwXeAXthcDQTbKM0hLkbfne8bxtSwO625KHGes=

It fixes the following checkpatch errors:

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
ERROR:SPACING: space required after that ',' (ctx:VxV)
ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same inde=
nt

This patch contains the large multi line blocks.

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

 drivers/media/pci/ttpci/budget-av.c | 464 ++++++++++++++--------------
 drivers/media/pci/ttpci/budget-ci.c | 426 ++++++++++++-------------
 drivers/media/pci/ttpci/budget.c    |  26 +-
 3 files changed, 458 insertions(+), 458 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci=
/budget-av.c
index 72ba9d3c3..b9efcd3cc 100644
=2D-- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -878,222 +878,222 @@ static const struct stv0299_config philips_sd1878_=
config =3D {
 /* KNC1 DVB-S (STB0899) Inittab	*/
 static const struct stb0899_s1_reg knc1_stb0899_s1_init_1[] =3D {

-	{ STB0899_DEV_ID		, 0x81 },
-	{ STB0899_DISCNTRL1		, 0x32 },
-	{ STB0899_DISCNTRL2		, 0x80 },
-	{ STB0899_DISRX_ST0		, 0x04 },
-	{ STB0899_DISRX_ST1		, 0x00 },
-	{ STB0899_DISPARITY		, 0x00 },
-	{ STB0899_DISSTATUS		, 0x20 },
-	{ STB0899_DISF22		, 0x8c },
-	{ STB0899_DISF22RX		, 0x9a },
-	{ STB0899_SYSREG		, 0x0b },
-	{ STB0899_ACRPRESC		, 0x11 },
-	{ STB0899_ACRDIV1		, 0x0a },
-	{ STB0899_ACRDIV2		, 0x05 },
-	{ STB0899_DACR1			, 0x00 },
-	{ STB0899_DACR2			, 0x00 },
-	{ STB0899_OUTCFG		, 0x00 },
-	{ STB0899_MODECFG		, 0x00 },
-	{ STB0899_IRQSTATUS_3		, 0x30 },
-	{ STB0899_IRQSTATUS_2		, 0x00 },
-	{ STB0899_IRQSTATUS_1		, 0x00 },
-	{ STB0899_IRQSTATUS_0		, 0x00 },
-	{ STB0899_IRQMSK_3		, 0xf3 },
-	{ STB0899_IRQMSK_2		, 0xfc },
-	{ STB0899_IRQMSK_1		, 0xff },
-	{ STB0899_IRQMSK_0		, 0xff },
-	{ STB0899_IRQCFG		, 0x00 },
-	{ STB0899_I2CCFG		, 0x88 },
-	{ STB0899_I2CRPT		, 0x58 }, /* Repeater=3D8, Stop=3Ddisabled */
-	{ STB0899_IOPVALUE5		, 0x00 },
-	{ STB0899_IOPVALUE4		, 0x20 },
-	{ STB0899_IOPVALUE3		, 0xc9 },
-	{ STB0899_IOPVALUE2		, 0x90 },
-	{ STB0899_IOPVALUE1		, 0x40 },
-	{ STB0899_IOPVALUE0		, 0x00 },
-	{ STB0899_GPIO00CFG		, 0x82 },
-	{ STB0899_GPIO01CFG		, 0x82 },
-	{ STB0899_GPIO02CFG		, 0x82 },
-	{ STB0899_GPIO03CFG		, 0x82 },
-	{ STB0899_GPIO04CFG		, 0x82 },
-	{ STB0899_GPIO05CFG		, 0x82 },
-	{ STB0899_GPIO06CFG		, 0x82 },
-	{ STB0899_GPIO07CFG		, 0x82 },
-	{ STB0899_GPIO08CFG		, 0x82 },
-	{ STB0899_GPIO09CFG		, 0x82 },
-	{ STB0899_GPIO10CFG		, 0x82 },
-	{ STB0899_GPIO11CFG		, 0x82 },
-	{ STB0899_GPIO12CFG		, 0x82 },
-	{ STB0899_GPIO13CFG		, 0x82 },
-	{ STB0899_GPIO14CFG		, 0x82 },
-	{ STB0899_GPIO15CFG		, 0x82 },
-	{ STB0899_GPIO16CFG		, 0x82 },
-	{ STB0899_GPIO17CFG		, 0x82 },
-	{ STB0899_GPIO18CFG		, 0x82 },
-	{ STB0899_GPIO19CFG		, 0x82 },
-	{ STB0899_GPIO20CFG		, 0x82 },
-	{ STB0899_SDATCFG		, 0xb8 },
-	{ STB0899_SCLTCFG		, 0xba },
-	{ STB0899_AGCRFCFG		, 0x08 }, /* 0x1c */
-	{ STB0899_GPIO22		, 0x82 }, /* AGCBB2CFG */
-	{ STB0899_GPIO21		, 0x91 }, /* AGCBB1CFG */
-	{ STB0899_DIRCLKCFG		, 0x82 },
-	{ STB0899_CLKOUT27CFG		, 0x7e },
-	{ STB0899_STDBYCFG		, 0x82 },
-	{ STB0899_CS0CFG		, 0x82 },
-	{ STB0899_CS1CFG		, 0x82 },
-	{ STB0899_DISEQCOCFG		, 0x20 },
-	{ STB0899_GPIO32CFG		, 0x82 },
-	{ STB0899_GPIO33CFG		, 0x82 },
-	{ STB0899_GPIO34CFG		, 0x82 },
-	{ STB0899_GPIO35CFG		, 0x82 },
-	{ STB0899_GPIO36CFG		, 0x82 },
-	{ STB0899_GPIO37CFG		, 0x82 },
-	{ STB0899_GPIO38CFG		, 0x82 },
-	{ STB0899_GPIO39CFG		, 0x82 },
-	{ STB0899_NCOARSE		, 0x15 }, /* 0x15 =3D 27 Mhz Clock, F/3 =3D 198MHz, F=
/6 =3D 99MHz */
-	{ STB0899_SYNTCTRL		, 0x02 }, /* 0x00 =3D CLK from CLKI, 0x02 =3D CLK fr=
om XTALI */
-	{ STB0899_FILTCTRL		, 0x00 },
-	{ STB0899_SYSCTRL		, 0x00 },
-	{ STB0899_STOPCLK1		, 0x20 },
-	{ STB0899_STOPCLK2		, 0x00 },
-	{ STB0899_INTBUFSTATUS		, 0x00 },
-	{ STB0899_INTBUFCTRL		, 0x0a },
-	{ 0xffff			, 0xff },
+	{ STB0899_DEV_ID,		0x81 },
+	{ STB0899_DISCNTRL1,		0x32 },
+	{ STB0899_DISCNTRL2,		0x80 },
+	{ STB0899_DISRX_ST0,		0x04 },
+	{ STB0899_DISRX_ST1,		0x00 },
+	{ STB0899_DISPARITY,		0x00 },
+	{ STB0899_DISSTATUS,		0x20 },
+	{ STB0899_DISF22,		0x8c },
+	{ STB0899_DISF22RX,		0x9a },
+	{ STB0899_SYSREG,		0x0b },
+	{ STB0899_ACRPRESC,		0x11 },
+	{ STB0899_ACRDIV1,		0x0a },
+	{ STB0899_ACRDIV2,		0x05 },
+	{ STB0899_DACR1,		0x00 },
+	{ STB0899_DACR2,		0x00 },
+	{ STB0899_OUTCFG,		0x00 },
+	{ STB0899_MODECFG,		0x00 },
+	{ STB0899_IRQSTATUS_3,		0x30 },
+	{ STB0899_IRQSTATUS_2,		0x00 },
+	{ STB0899_IRQSTATUS_1,		0x00 },
+	{ STB0899_IRQSTATUS_0,		0x00 },
+	{ STB0899_IRQMSK_3,		0xf3 },
+	{ STB0899_IRQMSK_2,		0xfc },
+	{ STB0899_IRQMSK_1,		0xff },
+	{ STB0899_IRQMSK_0,		0xff },
+	{ STB0899_IRQCFG,		0x00 },
+	{ STB0899_I2CCFG,		0x88 },
+	{ STB0899_I2CRPT,		0x58 }, /* Repeater=3D8, Stop=3Ddisabled */
+	{ STB0899_IOPVALUE5,		0x00 },
+	{ STB0899_IOPVALUE4,		0x20 },
+	{ STB0899_IOPVALUE3,		0xc9 },
+	{ STB0899_IOPVALUE2,		0x90 },
+	{ STB0899_IOPVALUE1,		0x40 },
+	{ STB0899_IOPVALUE0,		0x00 },
+	{ STB0899_GPIO00CFG,		0x82 },
+	{ STB0899_GPIO01CFG,		0x82 },
+	{ STB0899_GPIO02CFG,		0x82 },
+	{ STB0899_GPIO03CFG,		0x82 },
+	{ STB0899_GPIO04CFG,		0x82 },
+	{ STB0899_GPIO05CFG,		0x82 },
+	{ STB0899_GPIO06CFG,		0x82 },
+	{ STB0899_GPIO07CFG,		0x82 },
+	{ STB0899_GPIO08CFG,		0x82 },
+	{ STB0899_GPIO09CFG,		0x82 },
+	{ STB0899_GPIO10CFG,		0x82 },
+	{ STB0899_GPIO11CFG,		0x82 },
+	{ STB0899_GPIO12CFG,		0x82 },
+	{ STB0899_GPIO13CFG,		0x82 },
+	{ STB0899_GPIO14CFG,		0x82 },
+	{ STB0899_GPIO15CFG,		0x82 },
+	{ STB0899_GPIO16CFG,		0x82 },
+	{ STB0899_GPIO17CFG,		0x82 },
+	{ STB0899_GPIO18CFG,		0x82 },
+	{ STB0899_GPIO19CFG,		0x82 },
+	{ STB0899_GPIO20CFG,		0x82 },
+	{ STB0899_SDATCFG,		0xb8 },
+	{ STB0899_SCLTCFG,		0xba },
+	{ STB0899_AGCRFCFG,		0x08 }, /* 0x1c */
+	{ STB0899_GPIO22,		0x82 }, /* AGCBB2CFG */
+	{ STB0899_GPIO21,		0x91 }, /* AGCBB1CFG */
+	{ STB0899_DIRCLKCFG,		0x82 },
+	{ STB0899_CLKOUT27CFG,		0x7e },
+	{ STB0899_STDBYCFG,		0x82 },
+	{ STB0899_CS0CFG,		0x82 },
+	{ STB0899_CS1CFG,		0x82 },
+	{ STB0899_DISEQCOCFG,		0x20 },
+	{ STB0899_GPIO32CFG,		0x82 },
+	{ STB0899_GPIO33CFG,		0x82 },
+	{ STB0899_GPIO34CFG,		0x82 },
+	{ STB0899_GPIO35CFG,		0x82 },
+	{ STB0899_GPIO36CFG,		0x82 },
+	{ STB0899_GPIO37CFG,		0x82 },
+	{ STB0899_GPIO38CFG,		0x82 },
+	{ STB0899_GPIO39CFG,		0x82 },
+	{ STB0899_NCOARSE,		0x15 }, /* 0x15 =3D 27 Mhz Clock, F/3 =3D 198MHz, F/=
6 =3D 99MHz */
+	{ STB0899_SYNTCTRL,		0x02 }, /* 0x00 =3D CLK from CLKI, 0x02 =3D CLK fro=
m XTALI */
+	{ STB0899_FILTCTRL,		0x00 },
+	{ STB0899_SYSCTRL,		0x00 },
+	{ STB0899_STOPCLK1,		0x20 },
+	{ STB0899_STOPCLK2,		0x00 },
+	{ STB0899_INTBUFSTATUS,		0x00 },
+	{ STB0899_INTBUFCTRL,		0x0a },
+	{ 0xffff,			0xff },
 };

 static const struct stb0899_s1_reg knc1_stb0899_s1_init_3[] =3D {
-	{ STB0899_DEMOD			, 0x00 },
-	{ STB0899_RCOMPC		, 0xc9 },
-	{ STB0899_AGC1CN		, 0x41 },
-	{ STB0899_AGC1REF		, 0x08 },
-	{ STB0899_RTC			, 0x7a },
-	{ STB0899_TMGCFG		, 0x4e },
-	{ STB0899_AGC2REF		, 0x33 },
-	{ STB0899_TLSR			, 0x84 },
-	{ STB0899_CFD			, 0xee },
-	{ STB0899_ACLC			, 0x87 },
-	{ STB0899_BCLC			, 0x94 },
-	{ STB0899_EQON			, 0x41 },
-	{ STB0899_LDT			, 0xdd },
-	{ STB0899_LDT2			, 0xc9 },
-	{ STB0899_EQUALREF		, 0xb4 },
-	{ STB0899_TMGRAMP		, 0x10 },
-	{ STB0899_TMGTHD		, 0x30 },
-	{ STB0899_IDCCOMP		, 0xfb },
-	{ STB0899_QDCCOMP		, 0x03 },
-	{ STB0899_POWERI		, 0x3b },
-	{ STB0899_POWERQ		, 0x3d },
-	{ STB0899_RCOMP			, 0x81 },
-	{ STB0899_AGCIQIN		, 0x80 },
-	{ STB0899_AGC2I1		, 0x04 },
-	{ STB0899_AGC2I2		, 0xf5 },
-	{ STB0899_TLIR			, 0x25 },
-	{ STB0899_RTF			, 0x80 },
-	{ STB0899_DSTATUS		, 0x00 },
-	{ STB0899_LDI			, 0xca },
-	{ STB0899_CFRM			, 0xf1 },
-	{ STB0899_CFRL			, 0xf3 },
-	{ STB0899_NIRM			, 0x2a },
-	{ STB0899_NIRL			, 0x05 },
-	{ STB0899_ISYMB			, 0x17 },
-	{ STB0899_QSYMB			, 0xfa },
-	{ STB0899_SFRH			, 0x2f },
-	{ STB0899_SFRM			, 0x68 },
-	{ STB0899_SFRL			, 0x40 },
-	{ STB0899_SFRUPH		, 0x2f },
-	{ STB0899_SFRUPM		, 0x68 },
-	{ STB0899_SFRUPL		, 0x40 },
-	{ STB0899_EQUAI1		, 0xfd },
-	{ STB0899_EQUAQ1		, 0x04 },
-	{ STB0899_EQUAI2		, 0x0f },
-	{ STB0899_EQUAQ2		, 0xff },
-	{ STB0899_EQUAI3		, 0xdf },
-	{ STB0899_EQUAQ3		, 0xfa },
-	{ STB0899_EQUAI4		, 0x37 },
-	{ STB0899_EQUAQ4		, 0x0d },
-	{ STB0899_EQUAI5		, 0xbd },
-	{ STB0899_EQUAQ5		, 0xf7 },
-	{ STB0899_DSTATUS2		, 0x00 },
-	{ STB0899_VSTATUS		, 0x00 },
-	{ STB0899_VERROR		, 0xff },
-	{ STB0899_IQSWAP		, 0x2a },
-	{ STB0899_ECNT1M		, 0x00 },
-	{ STB0899_ECNT1L		, 0x00 },
-	{ STB0899_ECNT2M		, 0x00 },
-	{ STB0899_ECNT2L		, 0x00 },
-	{ STB0899_ECNT3M		, 0x00 },
-	{ STB0899_ECNT3L		, 0x00 },
-	{ STB0899_FECAUTO1		, 0x06 },
-	{ STB0899_FECM			, 0x01 },
-	{ STB0899_VTH12			, 0xf0 },
-	{ STB0899_VTH23			, 0xa0 },
-	{ STB0899_VTH34			, 0x78 },
-	{ STB0899_VTH56			, 0x4e },
-	{ STB0899_VTH67			, 0x48 },
-	{ STB0899_VTH78			, 0x38 },
-	{ STB0899_PRVIT			, 0xff },
-	{ STB0899_VITSYNC		, 0x19 },
-	{ STB0899_RSULC			, 0xb1 }, /* DVB =3D 0xb1, DSS =3D 0xa1 */
-	{ STB0899_TSULC			, 0x42 },
-	{ STB0899_RSLLC			, 0x40 },
-	{ STB0899_TSLPL			, 0x12 },
-	{ STB0899_TSCFGH		, 0x0c },
-	{ STB0899_TSCFGM		, 0x00 },
-	{ STB0899_TSCFGL		, 0x0c },
-	{ STB0899_TSOUT			, 0x4d }, /* 0x0d for CAM */
-	{ STB0899_RSSYNCDEL		, 0x00 },
-	{ STB0899_TSINHDELH		, 0x02 },
-	{ STB0899_TSINHDELM		, 0x00 },
-	{ STB0899_TSINHDELL		, 0x00 },
-	{ STB0899_TSLLSTKM		, 0x00 },
-	{ STB0899_TSLLSTKL		, 0x00 },
-	{ STB0899_TSULSTKM		, 0x00 },
-	{ STB0899_TSULSTKL		, 0xab },
-	{ STB0899_PCKLENUL		, 0x00 },
-	{ STB0899_PCKLENLL		, 0xcc },
-	{ STB0899_RSPCKLEN		, 0xcc },
-	{ STB0899_TSSTATUS		, 0x80 },
-	{ STB0899_ERRCTRL1		, 0xb6 },
-	{ STB0899_ERRCTRL2		, 0x96 },
-	{ STB0899_ERRCTRL3		, 0x89 },
-	{ STB0899_DMONMSK1		, 0x27 },
-	{ STB0899_DMONMSK0		, 0x03 },
-	{ STB0899_DEMAPVIT		, 0x5c },
-	{ STB0899_PLPARM		, 0x1f },
-	{ STB0899_PDELCTRL		, 0x48 },
-	{ STB0899_PDELCTRL2		, 0x00 },
-	{ STB0899_BBHCTRL1		, 0x00 },
-	{ STB0899_BBHCTRL2		, 0x00 },
-	{ STB0899_HYSTTHRESH		, 0x77 },
-	{ STB0899_MATCSTM		, 0x00 },
-	{ STB0899_MATCSTL		, 0x00 },
-	{ STB0899_UPLCSTM		, 0x00 },
-	{ STB0899_UPLCSTL		, 0x00 },
-	{ STB0899_DFLCSTM		, 0x00 },
-	{ STB0899_DFLCSTL		, 0x00 },
-	{ STB0899_SYNCCST		, 0x00 },
-	{ STB0899_SYNCDCSTM		, 0x00 },
-	{ STB0899_SYNCDCSTL		, 0x00 },
-	{ STB0899_ISI_ENTRY		, 0x00 },
-	{ STB0899_ISI_BIT_EN		, 0x00 },
-	{ STB0899_MATSTRM		, 0x00 },
-	{ STB0899_MATSTRL		, 0x00 },
-	{ STB0899_UPLSTRM		, 0x00 },
-	{ STB0899_UPLSTRL		, 0x00 },
-	{ STB0899_DFLSTRM		, 0x00 },
-	{ STB0899_DFLSTRL		, 0x00 },
-	{ STB0899_SYNCSTR		, 0x00 },
-	{ STB0899_SYNCDSTRM		, 0x00 },
-	{ STB0899_SYNCDSTRL		, 0x00 },
-	{ STB0899_CFGPDELSTATUS1	, 0x10 },
-	{ STB0899_CFGPDELSTATUS2	, 0x00 },
-	{ STB0899_BBFERRORM		, 0x00 },
-	{ STB0899_BBFERRORL		, 0x00 },
-	{ STB0899_UPKTERRORM		, 0x00 },
-	{ STB0899_UPKTERRORL		, 0x00 },
-	{ 0xffff			, 0xff },
+	{ STB0899_DEMOD,		0x00 },
+	{ STB0899_RCOMPC,		0xc9 },
+	{ STB0899_AGC1CN,		0x41 },
+	{ STB0899_AGC1REF,		0x08 },
+	{ STB0899_RTC,			0x7a },
+	{ STB0899_TMGCFG,		0x4e },
+	{ STB0899_AGC2REF,		0x33 },
+	{ STB0899_TLSR,			0x84 },
+	{ STB0899_CFD,			0xee },
+	{ STB0899_ACLC,			0x87 },
+	{ STB0899_BCLC,			0x94 },
+	{ STB0899_EQON,			0x41 },
+	{ STB0899_LDT,			0xdd },
+	{ STB0899_LDT2,			0xc9 },
+	{ STB0899_EQUALREF,		0xb4 },
+	{ STB0899_TMGRAMP,		0x10 },
+	{ STB0899_TMGTHD,		0x30 },
+	{ STB0899_IDCCOMP,		0xfb },
+	{ STB0899_QDCCOMP,		0x03 },
+	{ STB0899_POWERI,		0x3b },
+	{ STB0899_POWERQ,		0x3d },
+	{ STB0899_RCOMP,		0x81 },
+	{ STB0899_AGCIQIN,		0x80 },
+	{ STB0899_AGC2I1,		0x04 },
+	{ STB0899_AGC2I2,		0xf5 },
+	{ STB0899_TLIR,			0x25 },
+	{ STB0899_RTF,			0x80 },
+	{ STB0899_DSTATUS,		0x00 },
+	{ STB0899_LDI,			0xca },
+	{ STB0899_CFRM,			0xf1 },
+	{ STB0899_CFRL,			0xf3 },
+	{ STB0899_NIRM,			0x2a },
+	{ STB0899_NIRL,			0x05 },
+	{ STB0899_ISYMB,		0x17 },
+	{ STB0899_QSYMB,		0xfa },
+	{ STB0899_SFRH,			0x2f },
+	{ STB0899_SFRM,			0x68 },
+	{ STB0899_SFRL,			0x40 },
+	{ STB0899_SFRUPH,		0x2f },
+	{ STB0899_SFRUPM,		0x68 },
+	{ STB0899_SFRUPL,		0x40 },
+	{ STB0899_EQUAI1,		0xfd },
+	{ STB0899_EQUAQ1,		0x04 },
+	{ STB0899_EQUAI2,		0x0f },
+	{ STB0899_EQUAQ2,		0xff },
+	{ STB0899_EQUAI3,		0xdf },
+	{ STB0899_EQUAQ3,		0xfa },
+	{ STB0899_EQUAI4,		0x37 },
+	{ STB0899_EQUAQ4,		0x0d },
+	{ STB0899_EQUAI5,		0xbd },
+	{ STB0899_EQUAQ5,		0xf7 },
+	{ STB0899_DSTATUS2,		0x00 },
+	{ STB0899_VSTATUS,		0x00 },
+	{ STB0899_VERROR,		0xff },
+	{ STB0899_IQSWAP,		0x2a },
+	{ STB0899_ECNT1M,		0x00 },
+	{ STB0899_ECNT1L,		0x00 },
+	{ STB0899_ECNT2M,		0x00 },
+	{ STB0899_ECNT2L,		0x00 },
+	{ STB0899_ECNT3M,		0x00 },
+	{ STB0899_ECNT3L,		0x00 },
+	{ STB0899_FECAUTO1,		0x06 },
+	{ STB0899_FECM,			0x01 },
+	{ STB0899_VTH12,		0xf0 },
+	{ STB0899_VTH23,		0xa0 },
+	{ STB0899_VTH34,		0x78 },
+	{ STB0899_VTH56,		0x4e },
+	{ STB0899_VTH67,		0x48 },
+	{ STB0899_VTH78,		0x38 },
+	{ STB0899_PRVIT,		0xff },
+	{ STB0899_VITSYNC,		0x19 },
+	{ STB0899_RSULC,		0xb1 }, /* DVB =3D 0xb1, DSS =3D 0xa1 */
+	{ STB0899_TSULC,		0x42 },
+	{ STB0899_RSLLC,		0x40 },
+	{ STB0899_TSLPL,		0x12 },
+	{ STB0899_TSCFGH,		0x0c },
+	{ STB0899_TSCFGM,		0x00 },
+	{ STB0899_TSCFGL,		0x0c },
+	{ STB0899_TSOUT,		0x4d }, /* 0x0d for CAM */
+	{ STB0899_RSSYNCDEL,		0x00 },
+	{ STB0899_TSINHDELH,		0x02 },
+	{ STB0899_TSINHDELM,		0x00 },
+	{ STB0899_TSINHDELL,		0x00 },
+	{ STB0899_TSLLSTKM,		0x00 },
+	{ STB0899_TSLLSTKL,		0x00 },
+	{ STB0899_TSULSTKM,		0x00 },
+	{ STB0899_TSULSTKL,		0xab },
+	{ STB0899_PCKLENUL,		0x00 },
+	{ STB0899_PCKLENLL,		0xcc },
+	{ STB0899_RSPCKLEN,		0xcc },
+	{ STB0899_TSSTATUS,		0x80 },
+	{ STB0899_ERRCTRL1,		0xb6 },
+	{ STB0899_ERRCTRL2,		0x96 },
+	{ STB0899_ERRCTRL3,		0x89 },
+	{ STB0899_DMONMSK1,		0x27 },
+	{ STB0899_DMONMSK0,		0x03 },
+	{ STB0899_DEMAPVIT,		0x5c },
+	{ STB0899_PLPARM,		0x1f },
+	{ STB0899_PDELCTRL,		0x48 },
+	{ STB0899_PDELCTRL2,		0x00 },
+	{ STB0899_BBHCTRL1,		0x00 },
+	{ STB0899_BBHCTRL2,		0x00 },
+	{ STB0899_HYSTTHRESH,		0x77 },
+	{ STB0899_MATCSTM,		0x00 },
+	{ STB0899_MATCSTL,		0x00 },
+	{ STB0899_UPLCSTM,		0x00 },
+	{ STB0899_UPLCSTL,		0x00 },
+	{ STB0899_DFLCSTM,		0x00 },
+	{ STB0899_DFLCSTL,		0x00 },
+	{ STB0899_SYNCCST,		0x00 },
+	{ STB0899_SYNCDCSTM,		0x00 },
+	{ STB0899_SYNCDCSTL,		0x00 },
+	{ STB0899_ISI_ENTRY,		0x00 },
+	{ STB0899_ISI_BIT_EN,		0x00 },
+	{ STB0899_MATSTRM,		0x00 },
+	{ STB0899_MATSTRL,		0x00 },
+	{ STB0899_UPLSTRM,		0x00 },
+	{ STB0899_UPLSTRL,		0x00 },
+	{ STB0899_DFLSTRM,		0x00 },
+	{ STB0899_DFLSTRL,		0x00 },
+	{ STB0899_SYNCSTR,		0x00 },
+	{ STB0899_SYNCDSTRM,		0x00 },
+	{ STB0899_SYNCDSTRL,		0x00 },
+	{ STB0899_CFGPDELSTATUS1,	0x10 },
+	{ STB0899_CFGPDELSTATUS2,	0x00 },
+	{ STB0899_BBFERRORM,		0x00 },
+	{ STB0899_BBFERRORL,		0x00 },
+	{ STB0899_UPKTERRORM,		0x00 },
+	{ STB0899_UPKTERRORL,		0x00 },
+	{ 0xffff,			0xff },
 };

 /* STB0899 demodulator config for the KNC1 and clones */
@@ -1207,16 +1207,16 @@ static void frontend_init(struct budget_av *budget=
_av)

 	/* additional setup necessary for the PLUS cards */
 	switch (saa->pci->subsystem_device) {
-		case SUBID_DVBS_KNC1_PLUS:
-		case SUBID_DVBC_KNC1_PLUS:
-		case SUBID_DVBT_KNC1_PLUS:
-		case SUBID_DVBC_EASYWATCH:
-		case SUBID_DVBC_KNC1_PLUS_MK3:
-		case SUBID_DVBS2_KNC1:
-		case SUBID_DVBS2_KNC1_OEM:
-		case SUBID_DVBS2_EASYWATCH:
-			saa7146_setgpio(saa, 3, SAA7146_GPIO_OUTHI);
-			break;
+	case SUBID_DVBS_KNC1_PLUS:
+	case SUBID_DVBC_KNC1_PLUS:
+	case SUBID_DVBT_KNC1_PLUS:
+	case SUBID_DVBC_EASYWATCH:
+	case SUBID_DVBC_KNC1_PLUS_MK3:
+	case SUBID_DVBS2_KNC1:
+	case SUBID_DVBS2_KNC1_OEM:
+	case SUBID_DVBS2_EASYWATCH:
+		saa7146_setgpio(saa, 3, SAA7146_GPIO_OUTHI);
+		break;
 	}

 	switch (saa->pci->subsystem_device) {
@@ -1510,15 +1510,15 @@ static int budget_av_attach(struct saa7146_dev *de=
v, struct saa7146_pci_extensio
 }

 static struct saa7146_standard standard[] =3D {
-	{.name =3D "PAL",.id =3D V4L2_STD_PAL,
-	 .v_offset =3D 0x17,.v_field =3D 288,
-	 .h_offset =3D 0x14,.h_pixels =3D 680,
-	 .v_max_out =3D 576,.h_max_out =3D 768 },
-
-	{.name =3D "NTSC",.id =3D V4L2_STD_NTSC,
-	 .v_offset =3D 0x16,.v_field =3D 240,
-	 .h_offset =3D 0x06,.h_pixels =3D 708,
-	 .v_max_out =3D 480,.h_max_out =3D 640, },
+	{.name =3D "PAL", .id =3D V4L2_STD_PAL,
+	 .v_offset =3D 0x17, .v_field =3D 288,
+	 .h_offset =3D 0x14, .h_pixels =3D 680,
+	 .v_max_out =3D 576, .h_max_out =3D 768 },
+
+	{.name =3D "NTSC", .id =3D V4L2_STD_NTSC,
+	 .v_offset =3D 0x16, .v_field =3D 240,
+	 .h_offset =3D 0x06, .h_pixels =3D 708,
+	 .v_max_out =3D 480, .h_max_out =3D 640, },
 };

 static struct saa7146_ext_vv vv_data =3D {
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci=
/budget-ci.c
index 569e8915a..2859b8ab8 100644
=2D-- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -1035,222 +1035,222 @@ static struct tda827x_config tda827x_config =3D =
{
 /* TT S2-3200 DVB-S (STB0899) Inittab */
 static const struct stb0899_s1_reg tt3200_stb0899_s1_init_1[] =3D {

-	{ STB0899_DEV_ID		, 0x81 },
-	{ STB0899_DISCNTRL1		, 0x32 },
-	{ STB0899_DISCNTRL2		, 0x80 },
-	{ STB0899_DISRX_ST0		, 0x04 },
-	{ STB0899_DISRX_ST1		, 0x00 },
-	{ STB0899_DISPARITY		, 0x00 },
-	{ STB0899_DISSTATUS		, 0x20 },
-	{ STB0899_DISF22		, 0x8c },
-	{ STB0899_DISF22RX		, 0x9a },
-	{ STB0899_SYSREG		, 0x0b },
-	{ STB0899_ACRPRESC		, 0x11 },
-	{ STB0899_ACRDIV1		, 0x0a },
-	{ STB0899_ACRDIV2		, 0x05 },
-	{ STB0899_DACR1			, 0x00 },
-	{ STB0899_DACR2			, 0x00 },
-	{ STB0899_OUTCFG		, 0x00 },
-	{ STB0899_MODECFG		, 0x00 },
-	{ STB0899_IRQSTATUS_3		, 0x30 },
-	{ STB0899_IRQSTATUS_2		, 0x00 },
-	{ STB0899_IRQSTATUS_1		, 0x00 },
-	{ STB0899_IRQSTATUS_0		, 0x00 },
-	{ STB0899_IRQMSK_3		, 0xf3 },
-	{ STB0899_IRQMSK_2		, 0xfc },
-	{ STB0899_IRQMSK_1		, 0xff },
-	{ STB0899_IRQMSK_0		, 0xff },
-	{ STB0899_IRQCFG		, 0x00 },
-	{ STB0899_I2CCFG		, 0x88 },
-	{ STB0899_I2CRPT		, 0x48 }, /* 12k Pullup, Repeater=3D16, Stop=3Ddisable=
d */
-	{ STB0899_IOPVALUE5		, 0x00 },
-	{ STB0899_IOPVALUE4		, 0x20 },
-	{ STB0899_IOPVALUE3		, 0xc9 },
-	{ STB0899_IOPVALUE2		, 0x90 },
-	{ STB0899_IOPVALUE1		, 0x40 },
-	{ STB0899_IOPVALUE0		, 0x00 },
-	{ STB0899_GPIO00CFG		, 0x82 },
-	{ STB0899_GPIO01CFG		, 0x82 },
-	{ STB0899_GPIO02CFG		, 0x82 },
-	{ STB0899_GPIO03CFG		, 0x82 },
-	{ STB0899_GPIO04CFG		, 0x82 },
-	{ STB0899_GPIO05CFG		, 0x82 },
-	{ STB0899_GPIO06CFG		, 0x82 },
-	{ STB0899_GPIO07CFG		, 0x82 },
-	{ STB0899_GPIO08CFG		, 0x82 },
-	{ STB0899_GPIO09CFG		, 0x82 },
-	{ STB0899_GPIO10CFG		, 0x82 },
-	{ STB0899_GPIO11CFG		, 0x82 },
-	{ STB0899_GPIO12CFG		, 0x82 },
-	{ STB0899_GPIO13CFG		, 0x82 },
-	{ STB0899_GPIO14CFG		, 0x82 },
-	{ STB0899_GPIO15CFG		, 0x82 },
-	{ STB0899_GPIO16CFG		, 0x82 },
-	{ STB0899_GPIO17CFG		, 0x82 },
-	{ STB0899_GPIO18CFG		, 0x82 },
-	{ STB0899_GPIO19CFG		, 0x82 },
-	{ STB0899_GPIO20CFG		, 0x82 },
-	{ STB0899_SDATCFG		, 0xb8 },
-	{ STB0899_SCLTCFG		, 0xba },
-	{ STB0899_AGCRFCFG		, 0x1c }, /* 0x11 */
-	{ STB0899_GPIO22		, 0x82 }, /* AGCBB2CFG */
-	{ STB0899_GPIO21		, 0x91 }, /* AGCBB1CFG */
-	{ STB0899_DIRCLKCFG		, 0x82 },
-	{ STB0899_CLKOUT27CFG		, 0x7e },
-	{ STB0899_STDBYCFG		, 0x82 },
-	{ STB0899_CS0CFG		, 0x82 },
-	{ STB0899_CS1CFG		, 0x82 },
-	{ STB0899_DISEQCOCFG		, 0x20 },
-	{ STB0899_GPIO32CFG		, 0x82 },
-	{ STB0899_GPIO33CFG		, 0x82 },
-	{ STB0899_GPIO34CFG		, 0x82 },
-	{ STB0899_GPIO35CFG		, 0x82 },
-	{ STB0899_GPIO36CFG		, 0x82 },
-	{ STB0899_GPIO37CFG		, 0x82 },
-	{ STB0899_GPIO38CFG		, 0x82 },
-	{ STB0899_GPIO39CFG		, 0x82 },
-	{ STB0899_NCOARSE		, 0x15 }, /* 0x15 =3D 27 Mhz Clock, F/3 =3D 198MHz, F=
/6 =3D 99MHz */
-	{ STB0899_SYNTCTRL		, 0x02 }, /* 0x00 =3D CLK from CLKI, 0x02 =3D CLK fr=
om XTALI */
-	{ STB0899_FILTCTRL		, 0x00 },
-	{ STB0899_SYSCTRL		, 0x00 },
-	{ STB0899_STOPCLK1		, 0x20 },
-	{ STB0899_STOPCLK2		, 0x00 },
-	{ STB0899_INTBUFSTATUS		, 0x00 },
-	{ STB0899_INTBUFCTRL		, 0x0a },
-	{ 0xffff			, 0xff },
+	{ STB0899_DEV_ID,		0x81 },
+	{ STB0899_DISCNTRL1,		0x32 },
+	{ STB0899_DISCNTRL2,		0x80 },
+	{ STB0899_DISRX_ST0,		0x04 },
+	{ STB0899_DISRX_ST1,		0x00 },
+	{ STB0899_DISPARITY,		0x00 },
+	{ STB0899_DISSTATUS,		0x20 },
+	{ STB0899_DISF22,		0x8c },
+	{ STB0899_DISF22RX,		0x9a },
+	{ STB0899_SYSREG,		0x0b },
+	{ STB0899_ACRPRESC,		0x11 },
+	{ STB0899_ACRDIV1,		0x0a },
+	{ STB0899_ACRDIV2,		0x05 },
+	{ STB0899_DACR1,		0x00 },
+	{ STB0899_DACR2,		0x00 },
+	{ STB0899_OUTCFG,		0x00 },
+	{ STB0899_MODECFG,		0x00 },
+	{ STB0899_IRQSTATUS_3,		0x30 },
+	{ STB0899_IRQSTATUS_2,		0x00 },
+	{ STB0899_IRQSTATUS_1,		0x00 },
+	{ STB0899_IRQSTATUS_0,		0x00 },
+	{ STB0899_IRQMSK_3,		0xf3 },
+	{ STB0899_IRQMSK_2,		0xfc },
+	{ STB0899_IRQMSK_1,		0xff },
+	{ STB0899_IRQMSK_0,		0xff },
+	{ STB0899_IRQCFG,		0x00 },
+	{ STB0899_I2CCFG,		0x88 },
+	{ STB0899_I2CRPT,		0x48 }, /* 12k Pullup, Repeater=3D16, Stop=3Ddisabled=
 */
+	{ STB0899_IOPVALUE5,		0x00 },
+	{ STB0899_IOPVALUE4,		0x20 },
+	{ STB0899_IOPVALUE3,		0xc9 },
+	{ STB0899_IOPVALUE2,		0x90 },
+	{ STB0899_IOPVALUE1,		0x40 },
+	{ STB0899_IOPVALUE0,		0x00 },
+	{ STB0899_GPIO00CFG,		0x82 },
+	{ STB0899_GPIO01CFG,		0x82 },
+	{ STB0899_GPIO02CFG,		0x82 },
+	{ STB0899_GPIO03CFG,		0x82 },
+	{ STB0899_GPIO04CFG,		0x82 },
+	{ STB0899_GPIO05CFG,		0x82 },
+	{ STB0899_GPIO06CFG,		0x82 },
+	{ STB0899_GPIO07CFG,		0x82 },
+	{ STB0899_GPIO08CFG,		0x82 },
+	{ STB0899_GPIO09CFG,		0x82 },
+	{ STB0899_GPIO10CFG,		0x82 },
+	{ STB0899_GPIO11CFG,		0x82 },
+	{ STB0899_GPIO12CFG,		0x82 },
+	{ STB0899_GPIO13CFG,		0x82 },
+	{ STB0899_GPIO14CFG,		0x82 },
+	{ STB0899_GPIO15CFG,		0x82 },
+	{ STB0899_GPIO16CFG,		0x82 },
+	{ STB0899_GPIO17CFG,		0x82 },
+	{ STB0899_GPIO18CFG,		0x82 },
+	{ STB0899_GPIO19CFG,		0x82 },
+	{ STB0899_GPIO20CFG,		0x82 },
+	{ STB0899_SDATCFG,		0xb8 },
+	{ STB0899_SCLTCFG,		0xba },
+	{ STB0899_AGCRFCFG,		0x1c }, /* 0x11 */
+	{ STB0899_GPIO22,		0x82 }, /* AGCBB2CFG */
+	{ STB0899_GPIO21,		0x91 }, /* AGCBB1CFG */
+	{ STB0899_DIRCLKCFG,		0x82 },
+	{ STB0899_CLKOUT27CFG,		0x7e },
+	{ STB0899_STDBYCFG,		0x82 },
+	{ STB0899_CS0CFG,		0x82 },
+	{ STB0899_CS1CFG,		0x82 },
+	{ STB0899_DISEQCOCFG,		0x20 },
+	{ STB0899_GPIO32CFG,		0x82 },
+	{ STB0899_GPIO33CFG,		0x82 },
+	{ STB0899_GPIO34CFG,		0x82 },
+	{ STB0899_GPIO35CFG,		0x82 },
+	{ STB0899_GPIO36CFG,		0x82 },
+	{ STB0899_GPIO37CFG,		0x82 },
+	{ STB0899_GPIO38CFG,		0x82 },
+	{ STB0899_GPIO39CFG,		0x82 },
+	{ STB0899_NCOARSE,		0x15 }, /* 0x15 =3D 27 Mhz Clock, F/3 =3D 198MHz, F/=
6 =3D 99MHz */
+	{ STB0899_SYNTCTRL,		0x02 }, /* 0x00 =3D CLK from CLKI, 0x02 =3D CLK fro=
m XTALI */
+	{ STB0899_FILTCTRL,		0x00 },
+	{ STB0899_SYSCTRL,		0x00 },
+	{ STB0899_STOPCLK1,		0x20 },
+	{ STB0899_STOPCLK2,		0x00 },
+	{ STB0899_INTBUFSTATUS,		0x00 },
+	{ STB0899_INTBUFCTRL,		0x0a },
+	{ 0xffff,			0xff },
 };

 static const struct stb0899_s1_reg tt3200_stb0899_s1_init_3[] =3D {
-	{ STB0899_DEMOD			, 0x00 },
-	{ STB0899_RCOMPC		, 0xc9 },
-	{ STB0899_AGC1CN		, 0x41 },
-	{ STB0899_AGC1REF		, 0x10 },
-	{ STB0899_RTC			, 0x7a },
-	{ STB0899_TMGCFG		, 0x4e },
-	{ STB0899_AGC2REF		, 0x34 },
-	{ STB0899_TLSR			, 0x84 },
-	{ STB0899_CFD			, 0xc7 },
-	{ STB0899_ACLC			, 0x87 },
-	{ STB0899_BCLC			, 0x94 },
-	{ STB0899_EQON			, 0x41 },
-	{ STB0899_LDT			, 0xdd },
-	{ STB0899_LDT2			, 0xc9 },
-	{ STB0899_EQUALREF		, 0xb4 },
-	{ STB0899_TMGRAMP		, 0x10 },
-	{ STB0899_TMGTHD		, 0x30 },
-	{ STB0899_IDCCOMP		, 0xfb },
-	{ STB0899_QDCCOMP		, 0x03 },
-	{ STB0899_POWERI		, 0x3b },
-	{ STB0899_POWERQ		, 0x3d },
-	{ STB0899_RCOMP			, 0x81 },
-	{ STB0899_AGCIQIN		, 0x80 },
-	{ STB0899_AGC2I1		, 0x04 },
-	{ STB0899_AGC2I2		, 0xf5 },
-	{ STB0899_TLIR			, 0x25 },
-	{ STB0899_RTF			, 0x80 },
-	{ STB0899_DSTATUS		, 0x00 },
-	{ STB0899_LDI			, 0xca },
-	{ STB0899_CFRM			, 0xf1 },
-	{ STB0899_CFRL			, 0xf3 },
-	{ STB0899_NIRM			, 0x2a },
-	{ STB0899_NIRL			, 0x05 },
-	{ STB0899_ISYMB			, 0x17 },
-	{ STB0899_QSYMB			, 0xfa },
-	{ STB0899_SFRH			, 0x2f },
-	{ STB0899_SFRM			, 0x68 },
-	{ STB0899_SFRL			, 0x40 },
-	{ STB0899_SFRUPH		, 0x2f },
-	{ STB0899_SFRUPM		, 0x68 },
-	{ STB0899_SFRUPL		, 0x40 },
-	{ STB0899_EQUAI1		, 0xfd },
-	{ STB0899_EQUAQ1		, 0x04 },
-	{ STB0899_EQUAI2		, 0x0f },
-	{ STB0899_EQUAQ2		, 0xff },
-	{ STB0899_EQUAI3		, 0xdf },
-	{ STB0899_EQUAQ3		, 0xfa },
-	{ STB0899_EQUAI4		, 0x37 },
-	{ STB0899_EQUAQ4		, 0x0d },
-	{ STB0899_EQUAI5		, 0xbd },
-	{ STB0899_EQUAQ5		, 0xf7 },
-	{ STB0899_DSTATUS2		, 0x00 },
-	{ STB0899_VSTATUS		, 0x00 },
-	{ STB0899_VERROR		, 0xff },
-	{ STB0899_IQSWAP		, 0x2a },
-	{ STB0899_ECNT1M		, 0x00 },
-	{ STB0899_ECNT1L		, 0x00 },
-	{ STB0899_ECNT2M		, 0x00 },
-	{ STB0899_ECNT2L		, 0x00 },
-	{ STB0899_ECNT3M		, 0x00 },
-	{ STB0899_ECNT3L		, 0x00 },
-	{ STB0899_FECAUTO1		, 0x06 },
-	{ STB0899_FECM			, 0x01 },
-	{ STB0899_VTH12			, 0xf0 },
-	{ STB0899_VTH23			, 0xa0 },
-	{ STB0899_VTH34			, 0x78 },
-	{ STB0899_VTH56			, 0x4e },
-	{ STB0899_VTH67			, 0x48 },
-	{ STB0899_VTH78			, 0x38 },
-	{ STB0899_PRVIT			, 0xff },
-	{ STB0899_VITSYNC		, 0x19 },
-	{ STB0899_RSULC			, 0xb1 }, /* DVB =3D 0xb1, DSS =3D 0xa1 */
-	{ STB0899_TSULC			, 0x42 },
-	{ STB0899_RSLLC			, 0x40 },
-	{ STB0899_TSLPL			, 0x12 },
-	{ STB0899_TSCFGH		, 0x0c },
-	{ STB0899_TSCFGM		, 0x00 },
-	{ STB0899_TSCFGL		, 0x0c },
-	{ STB0899_TSOUT			, 0x4d }, /* 0x0d for CAM */
-	{ STB0899_RSSYNCDEL		, 0x00 },
-	{ STB0899_TSINHDELH		, 0x02 },
-	{ STB0899_TSINHDELM		, 0x00 },
-	{ STB0899_TSINHDELL		, 0x00 },
-	{ STB0899_TSLLSTKM		, 0x00 },
-	{ STB0899_TSLLSTKL		, 0x00 },
-	{ STB0899_TSULSTKM		, 0x00 },
-	{ STB0899_TSULSTKL		, 0xab },
-	{ STB0899_PCKLENUL		, 0x00 },
-	{ STB0899_PCKLENLL		, 0xcc },
-	{ STB0899_RSPCKLEN		, 0xcc },
-	{ STB0899_TSSTATUS		, 0x80 },
-	{ STB0899_ERRCTRL1		, 0xb6 },
-	{ STB0899_ERRCTRL2		, 0x96 },
-	{ STB0899_ERRCTRL3		, 0x89 },
-	{ STB0899_DMONMSK1		, 0x27 },
-	{ STB0899_DMONMSK0		, 0x03 },
-	{ STB0899_DEMAPVIT		, 0x5c },
-	{ STB0899_PLPARM		, 0x1f },
-	{ STB0899_PDELCTRL		, 0x48 },
-	{ STB0899_PDELCTRL2		, 0x00 },
-	{ STB0899_BBHCTRL1		, 0x00 },
-	{ STB0899_BBHCTRL2		, 0x00 },
-	{ STB0899_HYSTTHRESH		, 0x77 },
-	{ STB0899_MATCSTM		, 0x00 },
-	{ STB0899_MATCSTL		, 0x00 },
-	{ STB0899_UPLCSTM		, 0x00 },
-	{ STB0899_UPLCSTL		, 0x00 },
-	{ STB0899_DFLCSTM		, 0x00 },
-	{ STB0899_DFLCSTL		, 0x00 },
-	{ STB0899_SYNCCST		, 0x00 },
-	{ STB0899_SYNCDCSTM		, 0x00 },
-	{ STB0899_SYNCDCSTL		, 0x00 },
-	{ STB0899_ISI_ENTRY		, 0x00 },
-	{ STB0899_ISI_BIT_EN		, 0x00 },
-	{ STB0899_MATSTRM		, 0x00 },
-	{ STB0899_MATSTRL		, 0x00 },
-	{ STB0899_UPLSTRM		, 0x00 },
-	{ STB0899_UPLSTRL		, 0x00 },
-	{ STB0899_DFLSTRM		, 0x00 },
-	{ STB0899_DFLSTRL		, 0x00 },
-	{ STB0899_SYNCSTR		, 0x00 },
-	{ STB0899_SYNCDSTRM		, 0x00 },
-	{ STB0899_SYNCDSTRL		, 0x00 },
-	{ STB0899_CFGPDELSTATUS1	, 0x10 },
-	{ STB0899_CFGPDELSTATUS2	, 0x00 },
-	{ STB0899_BBFERRORM		, 0x00 },
-	{ STB0899_BBFERRORL		, 0x00 },
-	{ STB0899_UPKTERRORM		, 0x00 },
-	{ STB0899_UPKTERRORL		, 0x00 },
-	{ 0xffff			, 0xff },
+	{ STB0899_DEMOD,		0x00 },
+	{ STB0899_RCOMPC,		0xc9 },
+	{ STB0899_AGC1CN,		0x41 },
+	{ STB0899_AGC1REF,		0x10 },
+	{ STB0899_RTC,			0x7a },
+	{ STB0899_TMGCFG,		0x4e },
+	{ STB0899_AGC2REF,		0x34 },
+	{ STB0899_TLSR,			0x84 },
+	{ STB0899_CFD,			0xc7 },
+	{ STB0899_ACLC,			0x87 },
+	{ STB0899_BCLC,			0x94 },
+	{ STB0899_EQON,			0x41 },
+	{ STB0899_LDT,			0xdd },
+	{ STB0899_LDT2,			0xc9 },
+	{ STB0899_EQUALREF,		0xb4 },
+	{ STB0899_TMGRAMP,		0x10 },
+	{ STB0899_TMGTHD,		0x30 },
+	{ STB0899_IDCCOMP,		0xfb },
+	{ STB0899_QDCCOMP,		0x03 },
+	{ STB0899_POWERI,		0x3b },
+	{ STB0899_POWERQ,		0x3d },
+	{ STB0899_RCOMP,		0x81 },
+	{ STB0899_AGCIQIN,		0x80 },
+	{ STB0899_AGC2I1,		0x04 },
+	{ STB0899_AGC2I2,		0xf5 },
+	{ STB0899_TLIR,			0x25 },
+	{ STB0899_RTF,			0x80 },
+	{ STB0899_DSTATUS,		0x00 },
+	{ STB0899_LDI,			0xca },
+	{ STB0899_CFRM,			0xf1 },
+	{ STB0899_CFRL,			0xf3 },
+	{ STB0899_NIRM,			0x2a },
+	{ STB0899_NIRL,			0x05 },
+	{ STB0899_ISYMB,		0x17 },
+	{ STB0899_QSYMB,		0xfa },
+	{ STB0899_SFRH,			0x2f },
+	{ STB0899_SFRM,			0x68 },
+	{ STB0899_SFRL,			0x40 },
+	{ STB0899_SFRUPH,		0x2f },
+	{ STB0899_SFRUPM,		0x68 },
+	{ STB0899_SFRUPL,		0x40 },
+	{ STB0899_EQUAI1,		0xfd },
+	{ STB0899_EQUAQ1,		0x04 },
+	{ STB0899_EQUAI2,		0x0f },
+	{ STB0899_EQUAQ2,		0xff },
+	{ STB0899_EQUAI3,		0xdf },
+	{ STB0899_EQUAQ3,		0xfa },
+	{ STB0899_EQUAI4,		0x37 },
+	{ STB0899_EQUAQ4,		0x0d },
+	{ STB0899_EQUAI5,		0xbd },
+	{ STB0899_EQUAQ5,		0xf7 },
+	{ STB0899_DSTATUS2,		0x00 },
+	{ STB0899_VSTATUS,		0x00 },
+	{ STB0899_VERROR,		0xff },
+	{ STB0899_IQSWAP,		0x2a },
+	{ STB0899_ECNT1M,		0x00 },
+	{ STB0899_ECNT1L,		0x00 },
+	{ STB0899_ECNT2M,		0x00 },
+	{ STB0899_ECNT2L,		0x00 },
+	{ STB0899_ECNT3M,		0x00 },
+	{ STB0899_ECNT3L,		0x00 },
+	{ STB0899_FECAUTO1,		0x06 },
+	{ STB0899_FECM,			0x01 },
+	{ STB0899_VTH12,		0xf0 },
+	{ STB0899_VTH23,		0xa0 },
+	{ STB0899_VTH34,		0x78 },
+	{ STB0899_VTH56,		0x4e },
+	{ STB0899_VTH67,		0x48 },
+	{ STB0899_VTH78,		0x38 },
+	{ STB0899_PRVIT,		0xff },
+	{ STB0899_VITSYNC,		0x19 },
+	{ STB0899_RSULC,		0xb1 }, /* DVB =3D 0xb1, DSS =3D 0xa1 */
+	{ STB0899_TSULC,		0x42 },
+	{ STB0899_RSLLC,		0x40 },
+	{ STB0899_TSLPL,		0x12 },
+	{ STB0899_TSCFGH,		0x0c },
+	{ STB0899_TSCFGM,		0x00 },
+	{ STB0899_TSCFGL,		0x0c },
+	{ STB0899_TSOUT,		0x4d }, /* 0x0d for CAM */
+	{ STB0899_RSSYNCDEL,		0x00 },
+	{ STB0899_TSINHDELH,		0x02 },
+	{ STB0899_TSINHDELM,		0x00 },
+	{ STB0899_TSINHDELL,		0x00 },
+	{ STB0899_TSLLSTKM,		0x00 },
+	{ STB0899_TSLLSTKL,		0x00 },
+	{ STB0899_TSULSTKM,		0x00 },
+	{ STB0899_TSULSTKL,		0xab },
+	{ STB0899_PCKLENUL,		0x00 },
+	{ STB0899_PCKLENLL,		0xcc },
+	{ STB0899_RSPCKLEN,		0xcc },
+	{ STB0899_TSSTATUS,		0x80 },
+	{ STB0899_ERRCTRL1,		0xb6 },
+	{ STB0899_ERRCTRL2,		0x96 },
+	{ STB0899_ERRCTRL3,		0x89 },
+	{ STB0899_DMONMSK1,		0x27 },
+	{ STB0899_DMONMSK0,		0x03 },
+	{ STB0899_DEMAPVIT,		0x5c },
+	{ STB0899_PLPARM,		0x1f },
+	{ STB0899_PDELCTRL,		0x48 },
+	{ STB0899_PDELCTRL2,		0x00 },
+	{ STB0899_BBHCTRL1,		0x00 },
+	{ STB0899_BBHCTRL2,		0x00 },
+	{ STB0899_HYSTTHRESH,		0x77 },
+	{ STB0899_MATCSTM,		0x00 },
+	{ STB0899_MATCSTL,		0x00 },
+	{ STB0899_UPLCSTM,		0x00 },
+	{ STB0899_UPLCSTL,		0x00 },
+	{ STB0899_DFLCSTM,		0x00 },
+	{ STB0899_DFLCSTL,		0x00 },
+	{ STB0899_SYNCCST,		0x00 },
+	{ STB0899_SYNCDCSTM,		0x00 },
+	{ STB0899_SYNCDCSTL,		0x00 },
+	{ STB0899_ISI_ENTRY,		0x00 },
+	{ STB0899_ISI_BIT_EN,		0x00 },
+	{ STB0899_MATSTRM,		0x00 },
+	{ STB0899_MATSTRL,		0x00 },
+	{ STB0899_UPLSTRM,		0x00 },
+	{ STB0899_UPLSTRL,		0x00 },
+	{ STB0899_DFLSTRM,		0x00 },
+	{ STB0899_DFLSTRL,		0x00 },
+	{ STB0899_SYNCSTR,		0x00 },
+	{ STB0899_SYNCDSTRM,		0x00 },
+	{ STB0899_SYNCDSTRL,		0x00 },
+	{ STB0899_CFGPDELSTATUS1,	0x10 },
+	{ STB0899_CFGPDELSTATUS2,	0x00 },
+	{ STB0899_BBFERRORM,		0x00 },
+	{ STB0899_BBFERRORL,		0x00 },
+	{ STB0899_UPKTERRORM,		0x00 },
+	{ STB0899_UPKTERRORL,		0x00 },
+	{ 0xffff,			0xff },
 };

 static struct stb0899_config tt3200_config =3D {
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/bu=
dget.c
index aab94c4d7..faa2a3561 100644
=2D-- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -125,19 +125,19 @@ static int SetVoltage_Activy(struct budget *budget,
 	dprintk(2, "budget: %p\n", budget);

 	switch (voltage) {
-		case SEC_VOLTAGE_13:
-			saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI);
-			saa7146_setgpio(dev, 2, SAA7146_GPIO_OUTLO);
-			break;
-		case SEC_VOLTAGE_18:
-			saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI);
-			saa7146_setgpio(dev, 2, SAA7146_GPIO_OUTHI);
-			break;
-		case SEC_VOLTAGE_OFF:
-			saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTLO);
-			break;
-		default:
-			return -EINVAL;
+	case SEC_VOLTAGE_13:
+		saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI);
+		saa7146_setgpio(dev, 2, SAA7146_GPIO_OUTLO);
+		break;
+	case SEC_VOLTAGE_18:
+		saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTHI);
+		saa7146_setgpio(dev, 2, SAA7146_GPIO_OUTHI);
+		break;
+	case SEC_VOLTAGE_OFF:
+		saa7146_setgpio(dev, 1, SAA7146_GPIO_OUTLO);
+		break;
+	default:
+		return -EINVAL;
 	}

 	return 0;
=2D-
2.34.0


