Return-Path: <linux-media+bounces-9290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E8F8A46E3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 04:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17E18B20DD3
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 02:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F181864C;
	Mon, 15 Apr 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="nZ3ByFhh"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C7134C4
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713147879; cv=none; b=RE4Vaps56JCEoApHylZjb4pzc+L4mTwrjIjPoiA6x7BvL8dr29TLEwYQtSzAy2mBE0TEPt5seqzABF2fs3x3Z9j5DojrHPTk+MpONjwf1UxymaOdVlgFvibz2ftIp4mgLRUy09HsREGuXnbCdQeKcm8pH0uCo7RvmgMfaJYJZx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713147879; c=relaxed/simple;
	bh=eWOLzsMR2pMy0JI2FWWaaD6uRUOD8tcuCsc+TJUghok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HSYNjY0J3M1Uh/VHnK3QHM7dZ8gNjj4M0Ll01u7IHTQ6p9wtTcA3oCfAUjv0tw4uScqQPNU5Fu1fPAD96RgdwaYqxJv0SkRQNfHcBXokFmokxkZyNzcvBXpkyq1hn3sHu6SlSf7siS7/eQ9pqXHB4KnA7r08cgPkYY9FrSuRwx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=nZ3ByFhh; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1713147872; x=1713752672; i=herdler@nurfuerspam.de;
	bh=KERqsaDe8mBnJAH1hJupvsL01dEJ4nhSUBGKMlmZd8I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nZ3ByFhhaQFVbLCXTxsGQvftjkVwmlZHgnsZglUeUCb1w8Ow1zJvY0RMZOBq/Rqt
	 gJRhEB6VflyvupK0gScRSCYSM/V1N6hFrd4ct1EB6aAGIVUR6qAMUsDjwwOViOJF4
	 ZE6nNKj726GACsF9YAYp4qciB03mtnI+FIVK2qyhc4M+QejSnO7+Pvt7nE1BGWg0Y
	 NhPdl8zpkIZ4VxlucdhW2C/00QzDHMOQXl7MAH5BNMiwue8ljrrCB36j92MmzV253
	 WYQyWdYEQr+1FLQKT8OOcm0jCaYawiJ/5Fxzp2yqHc6vHrxWW7XC7jPrzFlxnwD0a
	 UEwDhNnKndO7g35VZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([91.132.223.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1sJNhU2wlo-00TpEw; Mon, 15
 Apr 2024 04:24:32 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v2 05/10] media: ttpci: coding style fixes: export_symbol
Date: Mon, 15 Apr 2024 04:24:06 +0200
Message-Id: <20240415022411.234580-6-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:pzHJthLxH1t7GaYWErumx6x3o1G2hIV2D9jNprVbPsI1mSKkxRq
 atDKZqeYEcQO3WiYUp2hvfQzgzrMEjAfKHMwxySOXvFmr3/rzUSfynvVd8d4qTHaQOV38VV
 MAn6HClSoovrndPHtFQpV0SBfpygW0Ms1lNGIl+Ls4aSRGSGiVGsgkVFHSX9VUTCPdxOIWJ
 QXHMt9Cg+2QMEwPxeCdsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HE+zI3o+xiw=;2KG0Vu2ay5DtGNkiS2fdKYBBKqm
 3v5wcOyf47BXa9tZivhy1Gz3PvhEJ73X7Q+wbMpVeKRFhFtDqnwJ8fyeo42Uy1A5nZ+CPXN4u
 l9Pne3aMoMHStIVFvHG5ppXeV/KQdEyURMczVnl0D6HaMoD+hiDkfMk9wkoWO7rbFKhJiufgK
 1Gk07a0gAatLDcXh+9D+XNpdgDmjekqIlFsgwZdjiRFJfL2qK/1Q1ZC+vvxjQ2oAHKiAbSI7V
 cpCHFAy3Kui9mIbrLNg0No3iRrzy1e9HB8pKPu5nZsy0shHU846qPGQi7RECJcC0YfqRgB31m
 H8YHEv7JS9AzZMiUbHAfecaxNtigGvfM1SozB5QR5onPZeO5Jk1+NJ53tcotmPstEof+h+Mf/
 //GWdHgMtVbE8P8st0sWQ8JI6KyBbg1zlqL7NRgkHilylPE/o5Y4+lzQaRSQprhztVqJzDAJA
 tahW0+TCh25SGYX7JkA+xZ93tRwxB4W908twswS0Hc9jr+Lf++yAJkD/tqg3KgWbyK50NW7T6
 9Jf9hDLg2EUL3KYkhBZNdJi/S/sMfsy3YnmKuU8unIFlYrICPMFIoSr7c5qCFHKEPsab6aLpw
 Ls0RnvGk1d/YJT7vfz5wIXJLlMJjsYWimYkkUFU5b2kyyXOqXVWEfvL0k/L6UIrAJ4CBRpcEg
 WfFBlhno5HDYw1OfgjIRFTx8aBUMKLn8MzVQvWe1itlhrOOk2W9z490wVfE2Q4WKiY81Pma2i
 3vE/ZDEY6usoSsJ1c/wEjWv3RexXIdzh4RnrNcYXMuq205CB9LgiEEi1N9xJyG78TmaM78Ei9
 2rSyQTtMplwsYUyLGL5cybil26Mx0fxIE6XCdZopN0pok=

This patch fixes the following checkpatch warnings:

WARNING:EXPORT_SYMBOL: EXPORT_SYMBOL(foo); should immediately follow its f=
unction/variable

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

 drivers/media/pci/ttpci/budget-core.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttp=
ci/budget-core.c
index f41f4eea7..20bcdd26f 100644
=2D-- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -34,6 +34,7 @@
 #define BUFFER_WARNING_WAIT	(30*HZ)

 int budget_debug;
+EXPORT_SYMBOL_GPL(budget_debug);
 static int dma_buffer_size =3D TS_MIN_BUFSIZE_K;
 module_param_named(debug, budget_debug, int, 0644);
 module_param_named(bufsize, dma_buffer_size, int, 0444);
@@ -259,6 +260,7 @@ int ttpci_budget_debiread(struct budget *budget, u32 c=
onfig, int addr, int count
 	return ttpci_budget_debiread_nolock(budget, config, addr,
 					    count, nobusyloop);
 }
+EXPORT_SYMBOL_GPL(ttpci_budget_debiread);

 static int ttpci_budget_debiwrite_nolock(struct budget *budget, u32 confi=
g,
 		int addr, int count, u32 value, int nobusyloop)
@@ -299,6 +301,7 @@ int ttpci_budget_debiwrite(struct budget *budget, u32 =
config, int addr,
 	return ttpci_budget_debiwrite_nolock(budget, config, addr,
 					     count, value, nobusyloop);
 }
+EXPORT_SYMBOL_GPL(ttpci_budget_debiwrite);


 /************************************************************************=
****
@@ -542,6 +545,7 @@ int ttpci_budget_init(struct budget *budget, struct sa=
a7146_dev *dev,

 	return ret;
 }
+EXPORT_SYMBOL_GPL(ttpci_budget_init);

 void ttpci_budget_init_hooks(struct budget *budget)
 {
@@ -550,6 +554,7 @@ void ttpci_budget_init_hooks(struct budget *budget)
 		budget->dvb_frontend->ops.read_status =3D budget_read_fe_status;
 	}
 }
+EXPORT_SYMBOL_GPL(ttpci_budget_init_hooks);

 int ttpci_budget_deinit(struct budget *budget)
 {
@@ -569,6 +574,7 @@ int ttpci_budget_deinit(struct budget *budget)

 	return 0;
 }
+EXPORT_SYMBOL_GPL(ttpci_budget_deinit);

 void ttpci_budget_irq10_handler(struct saa7146_dev *dev, u32 *isr)
 {
@@ -579,6 +585,7 @@ void ttpci_budget_irq10_handler(struct saa7146_dev *de=
v, u32 *isr)
 	if (*isr & MASK_10)
 		tasklet_schedule(&budget->vpe_tasklet);
 }
+EXPORT_SYMBOL_GPL(ttpci_budget_irq10_handler);

 void ttpci_budget_set_video_port(struct saa7146_dev *dev, int video_port)
 {
@@ -592,14 +599,6 @@ void ttpci_budget_set_video_port(struct saa7146_dev *=
dev, int video_port)
 	}
 	spin_unlock(&budget->feedlock);
 }
-
-EXPORT_SYMBOL_GPL(ttpci_budget_debiread);
-EXPORT_SYMBOL_GPL(ttpci_budget_debiwrite);
-EXPORT_SYMBOL_GPL(ttpci_budget_init);
-EXPORT_SYMBOL_GPL(ttpci_budget_init_hooks);
-EXPORT_SYMBOL_GPL(ttpci_budget_deinit);
-EXPORT_SYMBOL_GPL(ttpci_budget_irq10_handler);
 EXPORT_SYMBOL_GPL(ttpci_budget_set_video_port);
-EXPORT_SYMBOL_GPL(budget_debug);

 MODULE_LICENSE("GPL");
=2D-
2.34.0


