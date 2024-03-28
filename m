Return-Path: <linux-media+bounces-8046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4443E88F514
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6ACC1F2CB70
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5632562E;
	Thu, 28 Mar 2024 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="aqJulXsp"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C424A06
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591574; cv=none; b=naTs8f2IP/YQ295Xkdy2h8kCnF2M7S95gNU7aUAugxuL0qM7DZjUY1Yk1moz7awOXlPpOtJpoOVSRXXf1zaXLtRWc8h9N4hMFInxOpWhKuwsrfwOp1syjHumbNkMbLuLnYT1KcMWAeljtHtBbhH/I9GWzC0q39QVMZidDdo6amA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591574; c=relaxed/simple;
	bh=sGnjaevZdb4hLEVv4+rMr73k7x3QQt6knXywjwWmR1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bY93zAcXXdnL/0vTy8YA1Dc8BYwahyncSfpTMx4mHT18QW9lmNBkmgbtfZDvwO32FNvWpPb5pQU4w4SMc7hX3Lky5HZmdCaTfWcxFUzpXOf5uf+WSgkkLpjEpILIbpqHAeMbZj3UhMwcb6fogKLZoenmrlJeFT8s25eXwdoFamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=aqJulXsp; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591568; x=1712196368; i=herdler@nurfuerspam.de;
	bh=chfAMaYq2KfHfy8g9m703HvhPGP5OW41N7d29PJOVdE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=aqJulXspnvtmqdOQjZwRLA0MzBL+dTIRDYYtMCsBb/Mz5M8smx6+110I+J/RChVe
	 IVlnU6rAJgunXDPQfNYyoGoLWb9doS7cSWp0Y+HDMTf/orR80u4xBjiJ1b4XaXDJy
	 9S03b9HQqTeKTWgxzdndXNGwpC0YJmBpq3ETFG3jEsfLTwKZ8QjQ82uptRs3ayP4z
	 ZJO6JFIyRdaRPoqhtrr2ljBS0RWD+DxjlQ9GpwHRehdbXcZEbQW7kTy+Z1VipJ8uX
	 ulot5dsCM9Jou/DjS1jU1wmblCVrCk/gF80vBsrhIgIcZlgq+lQAPz0qwwICcJa8T
	 xyC7Bv0AcL2KQXloiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt79F-1sijmI3rT7-00tRKd; Thu, 28
 Mar 2024 03:06:08 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 05/11] media: ttpci: checkpatch fixes: export_symbol
Date: Thu, 28 Mar 2024 03:05:16 +0100
Message-Id: <20240328020522.50995-6-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:grTSqfEilXuLw1v/HjX/+5PzuHzF/6fjpnQIR/4tGzXa32gRsXL
 GTbgHvuby7Q0TGWfRGVrYT6m3zkk9HIkjw+ZnZ1cu9GM3mKkHw6v3C+yrsQ8qoZM0VIad7k
 /0V48/y4Mqe/Yyls6f9BOOIycpvPGoO+FvPZHig/SzBFq47U+QFCRFX9yqZC/gvYH0B5vGQ
 6/x4rQ2/t3awOCGeI57Kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lVSPIhSiMdM=;Hf2ryqHZW4lQQxyKYavBH/ssGoq
 tJ1G59KvpkT/5KOQTnR9Xwg3mcfQ4EmIYOZEmQJ0+IRILOICncwdNWqrKry/SyuRN2KrZZn05
 xpowIbCGrIJAJCPApwta1IIsVzJtRelWSUr/zIjgAfRadFppndJMCc5ydrz4dYlZ0M25nd0Sz
 bfpLqPjmg5130D5VAbxJ871aKwaxuUfkQ58AWtd/TGKFmhX0Ysp9CNhcocaFGq5MliQ8/iAGB
 0k2PCTW0E/jfYcgHTUQfpR7BVfRbBECf87X/e4T9FkuWJSsleBN6zHX5FfOVskJT5psCnoMb9
 wS2TSdoLnPRABNjtyHEe9aGQKHg0Sevi15SrShB2RW0WFVB/sCI4UWqzXnvYITNA6CtvdmQ8F
 2kcQtp8IsqcEXvmQt3QYxTqIG08UID55zBOIrCHlszNbMpu1lv5ginmBaG/50Gdc7Fns7DpWi
 /jhf9/599JiRMjPVix8V9nLj6voGzqSinPGqfHv0756dehMH2S3g+uAQvzsZ5wkuUEgmzedwj
 3CA1pzaFk17Zun7+n6EflCHfIUZWej2W3rNlI/v3AZXgbxgBKbrCCfX/PRLhnthReQ7Jk256r
 w3VmqAnKbppFa0FyTjlLqt3I9XL0/oYzY6E/fWGjn53mWkOa07oVcPoPO91c1MoxkeGwovEva
 fwedLQJZiAplsgcPW+lFQTW8q6mGkwsyVuGpB4wPZl17NwQvtItLNwFOAemT3re1Rg+GWMmX7
 B5RgXiXShlKZlrM+QpF0p8JZFIV8K2zixaWIdJ0MqBvLG3J6mOh/dwawi3Y3DytjWEMn7MkYk
 vjctmrPPY9UmBZDFuPWHzhCK+RAWtDZAn0zvvIyTLv8eA=

This patch fixes the following checkpatch warnings:

WARNING:EXPORT_SYMBOL: EXPORT_SYMBOL(foo); should immediately follow its f=
unction/variable


Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

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


