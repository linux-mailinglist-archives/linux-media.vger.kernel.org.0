Return-Path: <linux-media+bounces-60664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHDEGGZ++2mEbwMAu9opvQ
	(envelope-from <linux-media+bounces-60664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 19:46:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B34DEF9D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 19:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB06B301C8A6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 17:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD0C3F0ABA;
	Wed,  6 May 2026 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="gF5fCtrR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AB64ADD83
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 17:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089476; cv=none; b=C9iLHAwyooRWV7QGihoM4NtLdP5wriroN11NmsmfpG2YCV7Tz0m6WnABhU/LgNXTn6rpGEFfuMGhBRcOBzX4066D/f8MHGaN5qpYU81AES9ZAX0CT+32crw44azjqcvIh0cPDiFzuMTiPvXtNNccieXTpJKpDdtzSdzO1SWVPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089476; c=relaxed/simple;
	bh=5dD3a/dTCld6eTjiBgTu5sy3WE6lLPS16mGt5N9U7CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2GX9ILY58Fu5SRuK2rbMcWp5/55qQUe2NKstSumZ6yXXfGTnA5jQBMjPb4HEh/Xr58/N/D1I1lAiBTff1KKgaC30WY57SAtBIPhL965jKHcMSbE/eCCuLTi8wm6EAcD/Q31Q4rDmCrEOW76g9tuQpg6ORcQhTlZLhY4JdW0CVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=gF5fCtrR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b150559bso46787635e9.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778089463; x=1778694263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LK+/ONeFxZbV3f+72cwl9gZb5Es7I62plaW7IWjeEEM=;
        b=gF5fCtrRujNCpccqtN5TMCwHyWAlQ8g4kkRmww05oxH+g/Tgy/BQg4Q3HH5Z5CqpbY
         3qTv1ZmWUUar63vGSN2dPl9/+QDOoRGUOKAl70hiwIw1IxmTtRphPh4ASQ+yB6hQBHsf
         dMoRmOfis8ZBVSGqi4zc4vgmBQNDUkzGhA2Hs5NJMwdXxnOBzSGUiag6zU0QWgOhqjCN
         RJnvT4WTWUrRyGznOB1LhAix5l2xFxLG7kshT3yrWqJnzf21lKOApvs7MTLR7doXV6Lc
         ByNDYlGmqTRMUhj0kXPLTaDvFKF1sHWv7k6Sc09v3d9S6EJ1BkymN6ginq2/vrNn28Du
         tCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778089463; x=1778694263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK+/ONeFxZbV3f+72cwl9gZb5Es7I62plaW7IWjeEEM=;
        b=X6t7h4AGfgCpuQl4fyy2kGKtFYClE7X8vHNnZ84Rlb18Qts/ms0WGxziVhxnLUdOyo
         zatceNWb6jwrTUUjk+8/lJSYDyo8SQSjVgid2hi3m9majAvcGG5VhFi3RIYpH7kv2J1t
         ETgyeK6Pv5cml7fIOqk4FxMpYtCTKImUchJ32eg/9QCg//e8hdh8D2xTMt6jr+yi2TMJ
         GJluQ9Z0uIDMKEUTvvspfiRIDRCOGbr/yW2Cgeb+ucz9Vyk/lvavVCfq9YcIgGyglPri
         tH//kD5Ys11nwBJoMVtqBlSpb6pb90uplt86qdgkSNe1PVsTpM2gE6bm/jXc8i/4bNzC
         0oUA==
X-Forwarded-Encrypted: i=1; AFNElJ93++EuQRwDpYTuh2oBq+COqm8D+zkguPAtiudYN8Ynw9P8LYWf6EQ6cf5/nRB3VEdx5dnS0pvEfosDLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG1ymlssYOW/GM6+jT+ayRQ/y6z6WMvnrgHXMfrTEkHpX3Zmng
	BNy/WEalZlpDCwkbGMaox9fIFPzowIjF3zE76I9rS7tM7PDaOclmOq6Tl9A8vrEIXO8=
X-Gm-Gg: AeBDievlLdHs+hjwoVbc8t7jplCW7F9HH5pQ5mQOzSOk+vof/MaISr8O0GGML83YyOV
	i3Jtm3GBZH75C7DkqZScVSnrsVeoZKjzFk4utVeiGEc5QDZVhqVDYXZhKCsZLjyORrooADezEUY
	PDM1kuIaPWqRhmXP2JoSojxgN1+BeyUFOouT2EO24xRe5EC09Rewt8P7PPnlM2eFIbnDkMRtib9
	ZR0T8mzaFqlrKBek/jclOk5jkB3fwin8FdZJkRExgt6iSThkTeTIdsN20pa3LRXpIYpskaUCfsk
	EdUdbTx/c10c0nJCXGSPZ8nJkEEyD8by95La0WKQo4ByngDOPcVXysXe/fWT0BcXbiRQV2vkCRK
	bPFb4wx75lhs95AuxAa/pEBsCB6N9AskjiHVHg+Dd1MIUB+xBfJ22TvcUfhRWF1tCOOesW6rGYX
	FeKHx9Ia536M0DLOS+Ig85/rQFCVfyKmWtMqeAHQ+VXTQr2N7TZxh1tyeCih5WucA4ES2LAVPkE
	RsKFrrTltyCrVqSU6gNXPan6CnAxd1XafM=
X-Received: by 2002:a5d:5f48:0:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-4515b056ca6mr7469957f8f.6.1778089462488;
        Wed, 06 May 2026 10:44:22 -0700 (PDT)
Received: from localhost (p200300f65f114e08e4d20e057e51ec46.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:e4d2:e05:7e51:ec46])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45052a48911sm14117611f8f.11.2026.05.06.10.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:44:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Abylay Ospan <aospan@amazon.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Corentin Labbe <clabbe@baylibre.com>,
	Ingo Molnar <mingo@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Atharv Dubey <atharvd440@gmail.com>,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Sean Young <sean@mess.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjpeg-users@lists.sourceforge.net
Subject: [PATCH] media: pci: Use PCI_DEVICE macros and drop zeros from pci_device_id arrays
Date: Wed,  6 May 2026 19:44:12 +0200
Message-ID: <20260506174412.2606010-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=106830; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=5dD3a/dTCld6eTjiBgTu5sy3WE6lLPS16mGt5N9U7CQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp+33sRHcaN4HfgpNSYgxc413kt48SuIa6b1Os4 0/JAUdheNKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaft97AAKCRCPgPtYfRL+ TibiB/0UfBPdXIoaUj/OTwKXFNRCb8hBy4OVQYldmg+5SLgZrXaiL76dw801PCXhFH2Yl8RCqzf 3Z4J3ZLJ3bLSZSBt+1zbGH+zb3fTyxp/3Avu4nTgwAEQpRBCshHRSneSH/6vIvdMNQDwRmPLhLP FPH/4MmBWDdTi7BCiypgBTPUlLXs/ijAkpUT5OpWZTne/VXq4E/XJ/Q8KhoZMnMmTybZ2bis7FN B8xijB8gIOXhfsEsT2SF8h6KsKnian3xSC7brG1bP0S+rznfzBMIo/Y7GTXW5Qkl4UdqXYgv9Ch cs+0XNMSAOfZxCX3PdK+H4cIeOTHziOnuQ0mE7676CrPa6iC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 511B34DEF9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60664-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,md.metrocast.net,baylibre.com,intel.com,linux.intel.com,ideasonboard.com,digiteqautomotive.com,amazon.com,bluecherrydvr.com,iodev.co.uk,vanguardiasur.com.ar,linux.dev,nextdimension.cc,gmail.com,isrc.iscas.ac.cn,mess.org,foss.st.com,qq.com,vger.kernel.org,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim,art.no:url]

Some pci_device_id arrays already used the PCI_DEVICE macros, others
used named initializers or list initializers. Unify all to use the
PCI_DEVICE macros and (if applicable) a named initializer for
.driver_data. Also drop all zeros that the compiler can care for and
unify indention and spacing.

There are no changes introduced by this commit to the compiled arrays for
ARCH=x86 and ARCH=arm64 builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this is a preparing change for making struct pci_device_id::driver_data
an anonymous union (similar to
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/).
This requires named initializers for .driver_data. Not all changes here
are required for that, but I expanded the quest to unify a bit more than
necessary.

I put all changes in a single patch, if you prefer it being split I can do that.

Best regards
Uwe

 drivers/media/pci/bt8xx/bttv-driver.c         |   12 +-
 drivers/media/pci/cobalt/cobalt-driver.c      |    5 +-
 drivers/media/pci/cx18/cx18-driver.c          |    5 +-
 drivers/media/pci/cx23885/cx23885-core.c      |   10 +-
 drivers/media/pci/cx25821/cx25821-alsa.c      |    4 +-
 drivers/media/pci/cx25821/cx25821-core.c      |   10 +-
 drivers/media/pci/cx88/cx88-alsa.c            |    6 +-
 drivers/media/pci/cx88/cx88-mpeg.c            |    5 +-
 drivers/media/pci/cx88/cx88-video.c           |    5 +-
 drivers/media/pci/ddbridge/ddbridge-main.c    |    2 +-
 drivers/media/pci/dm1105/dm1105.c             |   10 +-
 drivers/media/pci/dt3155/dt3155.c             |    4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |    2 +-
 drivers/media/pci/ivtv/ivtv-driver.c          |    8 +-
 drivers/media/pci/mantis/mantis_common.h      |    8 +-
 drivers/media/pci/mgb4/mgb4_core.c            |    6 +-
 .../pci/netup_unidvb/netup_unidvb_core.c      |    2 +-
 drivers/media/pci/ngene/ngene-cards.c         |    5 +-
 drivers/media/pci/pluto2/pluto2.c             |    5 +-
 drivers/media/pci/saa7134/saa7134-cards.c     | 1949 ++++++-----------
 drivers/media/pci/saa7146/hexium_gemini.c     |   22 +-
 drivers/media/pci/saa7146/hexium_orion.c      |   33 +-
 drivers/media/pci/saa7146/mxb.c               |   10 +-
 drivers/media/pci/saa7164/saa7164-core.c      |    5 +-
 drivers/media/pci/smipcie/smipcie-main.c      |    5 +-
 drivers/media/pci/solo6x10/solo6x10-core.c    |    2 +-
 drivers/media/pci/ttpci/budget-ci.c           |    4 +-
 drivers/media/pci/ttpci/budget.c              |    4 +-
 drivers/media/pci/tw5864/tw5864-core.c        |    4 +-
 drivers/media/pci/tw68/tw68-core.c            |   16 +-
 drivers/media/pci/tw686x/tw686x-core.c        |   23 +-
 drivers/media/pci/zoran/zoran_card.c          |    7 +-
 32 files changed, 786 insertions(+), 1412 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 663469208271..c631b8bbd386 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -3563,12 +3563,12 @@ static int __maybe_unused bttv_resume(struct device *dev)
 }
 
 static const struct pci_device_id bttv_pci_tbl[] = {
-	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT848), 0},
-	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT849), 0},
-	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT878), 0},
-	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT879), 0},
-	{PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_FUSION879), 0},
-	{0,}
+	{ PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT848) },
+	{ PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT849) },
+	{ PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT878) },
+	{ PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_BT879) },
+	{ PCI_VDEVICE(BROOKTREE, PCI_DEVICE_ID_FUSION879) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, bttv_pci_tbl);
diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 9b9f69ff4016..7b1ca1238c8d 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -26,9 +26,8 @@
 
 /* add your revision and whatnot here */
 static const struct pci_device_id cobalt_pci_tbl[] = {
-	{PCI_VENDOR_ID_CISCO, PCI_DEVICE_ID_COBALT,
-	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0,}
+	{ PCI_VDEVICE(CISCO, PCI_DEVICE_ID_COBALT) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, cobalt_pci_tbl);
diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index f778f79b921d..214fac7af61e 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -40,9 +40,8 @@ EXPORT_SYMBOL(cx18_ext_init);
 
 /* add your revision and whatnot here */
 static const struct pci_device_id cx18_pci_tbl[] = {
-	{PCI_VENDOR_ID_CX, PCI_DEVICE_ID_CX23418,
-	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0,}
+	{ PCI_VDEVICE(CX, PCI_DEVICE_ID_CX23418) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, cx18_pci_tbl);
diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 4a8af8b88d84..5871999bf278 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2269,16 +2269,10 @@ static int __maybe_unused cx23885_resume(struct device *dev_d)
 static const struct pci_device_id cx23885_pci_tbl[] = {
 	{
 		/* CX23885 */
-		.vendor       = 0x14f1,
-		.device       = 0x8852,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
+		PCI_DEVICE(0x14f1, 0x8852),
 	}, {
 		/* CX23887 Rev 2 */
-		.vendor       = 0x14f1,
-		.device       = 0x8880,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
+		PCI_DEVICE(0x14f1, 0x8880),
 	}, {
 		/* --- end of list --- */
 	}
diff --git a/drivers/media/pci/cx25821/cx25821-alsa.c b/drivers/media/pci/cx25821/cx25821-alsa.c
index 4fdc59aaed8e..f963ae79f685 100644
--- a/drivers/media/pci/cx25821/cx25821-alsa.c
+++ b/drivers/media/pci/cx25821/cx25821-alsa.c
@@ -681,8 +681,8 @@ static int snd_cx25821_pcm(struct cx25821_audio_dev *chip, int device,
  */
 
 static const struct pci_device_id __maybe_unused cx25821_audio_pci_tbl[] = {
-	{0x14f1, 0x0920, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0,}
+	{ PCI_DEVICE(0x14f1, 0x0920) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, cx25821_audio_pci_tbl);
diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 5acb1dc00ae8..f883a779b570 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1347,16 +1347,10 @@ static void cx25821_finidev(struct pci_dev *pci_dev)
 static const struct pci_device_id cx25821_pci_tbl[] = {
 	{
 		/* CX25821 Athena */
-		.vendor = 0x14f1,
-		.device = 0x8210,
-		.subvendor = 0x14f1,
-		.subdevice = 0x0920,
+		PCI_DEVICE_SUB(0x14f1, 0x8210, 0x14f1, 0x0920),
 	}, {
 		/* CX25821 No Brand */
-		.vendor = 0x14f1,
-		.device = 0x8210,
-		.subvendor = 0x0000,
-		.subdevice = 0x0000,
+		PCI_DEVICE_SUB(0x14f1, 0x8210, 0x0000, 0x0000),
 	}, {
 		/* --- end of list --- */
 	}
diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index dce041a5e47a..d2534f90cfba 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -809,9 +809,9 @@ static const struct snd_kcontrol_new snd_cx88_alc_switch = {
  */
 
 static const struct pci_device_id cx88_audio_pci_tbl[] = {
-	{0x14f1, 0x8801, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0x14f1, 0x8811, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0, }
+	{ PCI_DEVICE(0x14f1, 0x8801) },
+	{ PCI_DEVICE(0x14f1, 0x8811) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cx88_audio_pci_tbl);
 
diff --git a/drivers/media/pci/cx88/cx88-mpeg.c b/drivers/media/pci/cx88/cx88-mpeg.c
index 676160e9554d..a399a9bf3b92 100644
--- a/drivers/media/pci/cx88/cx88-mpeg.c
+++ b/drivers/media/pci/cx88/cx88-mpeg.c
@@ -787,10 +787,7 @@ static void cx8802_remove(struct pci_dev *pci_dev)
 
 static const struct pci_device_id cx8802_pci_tbl[] = {
 	{
-		.vendor       = 0x14f1,
-		.device       = 0x8802,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
+		PCI_DEVICE(0x14f1, 0x8802),
 	}, {
 		/* --- end of list --- */
 	}
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index c78b156c5cda..eaa46a2f92e7 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1610,10 +1610,7 @@ static int __maybe_unused cx8800_resume(struct device *dev_d)
 
 static const struct pci_device_id cx8800_pci_tbl[] = {
 	{
-		.vendor       = 0x14f1,
-		.device       = 0x8800,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
+		PCI_DEVICE(0x14f1, 0x8800),
 	}, {
 		/* --- end of list --- */
 	}
diff --git a/drivers/media/pci/ddbridge/ddbridge-main.c b/drivers/media/pci/ddbridge/ddbridge-main.c
index 363badab7cf0..248ace29e5c8 100644
--- a/drivers/media/pci/ddbridge/ddbridge-main.c
+++ b/drivers/media/pci/ddbridge/ddbridge-main.c
@@ -269,7 +269,7 @@ static const struct pci_device_id ddb_id_table[] = {
 	DDB_DEVICE_ANY(0x0323),
 	DDB_DEVICE_ANY(0x0328),
 	DDB_DEVICE_ANY(0x0329),
-	{0}
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, ddb_id_table);
diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index bbd24769ae56..aad7d3cb3064 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -1203,15 +1203,9 @@ static void dm1105_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id dm1105_id_table[] = {
 	{
-		.vendor = PCI_VENDOR_ID_TRIGEM,
-		.device = PCI_DEVICE_ID_DM1105,
-		.subvendor = PCI_ANY_ID,
-		.subdevice = PCI_ANY_ID,
+		PCI_VDEVICE(TRIGEM, PCI_DEVICE_ID_DM1105),
 	}, {
-		.vendor = PCI_VENDOR_ID_AXESS,
-		.device = PCI_DEVICE_ID_DM05,
-		.subvendor = PCI_ANY_ID,
-		.subdevice = PCI_ANY_ID,
+		PCI_VDEVICE(AXESS, PCI_DEVICE_ID_DM05),
 	}, {
 		/* empty */
 	},
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 7bddcbba4cf1..660aab6b62e0 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -577,8 +577,8 @@ static void dt3155_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id pci_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, DT3155_DEVICE_ID) },
-	{ 0, /* zero marks the end */ },
+	{ PCI_VDEVICE(INTEL, DT3155_DEVICE_ID) },
+	{ /* zero marks the end */ },
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 986b9afd7cb5..eb1824ee86fd 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1961,7 +1961,7 @@ static const struct dev_pm_ops cio2_pm_ops = {
 };
 
 static const struct pci_device_id cio2_pci_id_table[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, CIO2_PCI_ID) },
+	{ PCI_VDEVICE(INTEL, CIO2_PCI_ID) },
 	{ }
 };
 
diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index e0091a8e5c88..b9ea56ec9593 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -60,11 +60,9 @@ EXPORT_SYMBOL(ivtv_ext_init);
 
 /* add your revision and whatnot here */
 static const struct pci_device_id ivtv_pci_tbl[] = {
-	{PCI_VENDOR_ID_ICOMP, PCI_DEVICE_ID_IVTV15,
-	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{PCI_VENDOR_ID_ICOMP, PCI_DEVICE_ID_IVTV16,
-	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
-	{0,}
+	{ PCI_VDEVICE(ICOMP, PCI_DEVICE_ID_IVTV15) },
+	{ PCI_VDEVICE(ICOMP, PCI_DEVICE_ID_IVTV16) },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci,ivtv_pci_tbl);
diff --git a/drivers/media/pci/mantis/mantis_common.h b/drivers/media/pci/mantis/mantis_common.h
index 6e563ecd94e8..f357ca268dd1 100644
--- a/drivers/media/pci/mantis/mantis_common.h
+++ b/drivers/media/pci/mantis/mantis_common.h
@@ -58,11 +58,9 @@
 #define TERRATEC		0x153b
 
 #define MAKE_ENTRY(__subven, __subdev, __configptr, __rc) {		\
-		.vendor		= TWINHAN_TECHNOLOGIES,			\
-		.device		= MANTIS,				\
-		.subvendor	= (__subven),				\
-		.subdevice	= (__subdev),				\
-		.driver_data	= (unsigned long)			\
+		PCI_DEVICE_SUB(TWINHAN_TECHNOLOGIES, MANTIS,		\
+			       (__subven), (__subdev)),			\
+		.driver_data = (unsigned long)				\
 			&(struct mantis_pci_drvdata){__configptr, __rc}	\
 }
 
diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index d23d854581c5..cbd193e06536 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -694,9 +694,9 @@ static void mgb4_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id mgb4_pci_ids[] = {
-	{ PCI_DEVICE(DIGITEQ_VID, T100_DID), },
-	{ PCI_DEVICE(DIGITEQ_VID, T200_DID), },
-	{ 0, }
+	{ PCI_DEVICE(DIGITEQ_VID, T100_DID) },
+	{ PCI_DEVICE(DIGITEQ_VID, T200_DID) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, mgb4_pci_ids);
 
diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index ec08023b5d5e..00f81e4c8e8d 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -1014,7 +1014,7 @@ static void netup_unidvb_finidev(struct pci_dev *pci_dev)
 static const struct pci_device_id netup_unidvb_pci_tbl[] = {
 	{ PCI_DEVICE(0x1b55, 0x18f6) }, /* hw rev. 1.3 */
 	{ PCI_DEVICE(0x1b55, 0x18f7) }, /* hw rev. 1.4 */
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, netup_unidvb_pci_tbl);
 
diff --git a/drivers/media/pci/ngene/ngene-cards.c b/drivers/media/pci/ngene/ngene-cards.c
index 7dbc21e1a2ca..a1a83f3bb6b4 100644
--- a/drivers/media/pci/ngene/ngene-cards.c
+++ b/drivers/media/pci/ngene/ngene-cards.c
@@ -1155,8 +1155,7 @@ static const struct ngene_info ngene_info_terratec = {
 /****************************************************************************/
 
 #define NGENE_ID(_subvend, _subdev, _driverdata) { \
-	.vendor = NGENE_VID, .device = NGENE_PID, \
-	.subvendor = _subvend, .subdevice = _subdev, \
+	PCI_DEVICE_SUB(NGENE_VID, NGENE_PID, (_subvend), (_subdev)), \
 	.driver_data = (unsigned long) &_driverdata }
 
 /****************************************************************************/
@@ -1173,7 +1172,7 @@ static const struct pci_device_id ngene_id_tbl[] = {
 	NGENE_ID(0x18c3, 0xdd20, ngene_info_duoFlex),
 	NGENE_ID(0x1461, 0x062e, ngene_info_m780),
 	NGENE_ID(0x153b, 0x1167, ngene_info_terratec),
-	{0}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ngene_id_tbl);
 
diff --git a/drivers/media/pci/pluto2/pluto2.c b/drivers/media/pci/pluto2/pluto2.c
index 22c2222d5c4d..77b3e4eec54d 100644
--- a/drivers/media/pci/pluto2/pluto2.c
+++ b/drivers/media/pci/pluto2/pluto2.c
@@ -762,10 +762,7 @@ static void pluto2_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id pluto2_id_table[] = {
 	{
-		.vendor = PCI_VENDOR_ID_SCM,
-		.device = PCI_DEVICE_ID_PLUTO2,
-		.subvendor = PCI_ANY_ID,
-		.subdevice = PCI_ANY_ID,
+		PCI_VDEVICE(SCM, PCI_DEVICE_ID_PLUTO2),
 	}, {
 		/* empty */
 	},
diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index e80fb4ebfda6..a7d665407460 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -5800,1317 +5800,758 @@ const unsigned int saa7134_bcount = ARRAY_SIZE(saa7134_boards);
 
 struct pci_device_id saa7134_pci_tbl[] = {
 	{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2001,
-		.driver_data  = SAA7134_BOARD_PROTEUS_PRO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2001,
-		.driver_data  = SAA7134_BOARD_PROTEUS_PRO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x6752,
-		.driver_data  = SAA7134_BOARD_EMPRESS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1131,
-		.subdevice    = 0x4e85,
-		.driver_data  = SAA7134_BOARD_MONSTERTV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1142,
-		.driver_data  = SAA7134_BOARD_CINERGY400,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1143,
-		.driver_data  = SAA7134_BOARD_CINERGY600,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1158,
-		.driver_data  = SAA7134_BOARD_CINERGY600_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1162,
-		.driver_data  = SAA7134_BOARD_CINERGY400_CARDBUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5169,
-		.subdevice    = 0x0138,
-		.driver_data  = SAA7134_BOARD_FLYVIDEO3000_NTSC,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0138,
-		.driver_data  = SAA7134_BOARD_FLYVIDEO3000,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x4e42,				/* "Typhoon PCI Capture TV Card" Art.No. 50673 */
-		.subdevice    = 0x0138,
-		.driver_data  = SAA7134_BOARD_FLYVIDEO3000,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0138,
-		.driver_data  = SAA7134_BOARD_FLYVIDEO2000,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x4e42,		/* Typhoon */
-		.subdevice    = 0x0138,		/* LifeView FlyTV Prime30 OEM */
-		.driver_data  = SAA7134_BOARD_FLYVIDEO2000,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0212, /* minipci, LR212 */
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_MINI,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x14c0,
-		.subdevice    = 0x1212, /* minipci, LR1212 */
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_MINI2,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x4e42,
-		.subdevice    = 0x0212, /* OEM minipci, LR212 */
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_MINI,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,	/* Animation Technologies (LifeView) */
-		.subdevice    = 0x0214, /* Standard PCI, LR214 Rev E and earlier (SAA7135) */
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,	/* Animation Technologies (LifeView) */
-		.subdevice    = 0x5214, /* Standard PCI, LR214 Rev F onwards (SAA7131) */
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1489, /* KYE */
-		.subdevice    = 0x0214, /* Genius VideoWonder ProTV */
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_FM, /* is an LR214WF actually */
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x16be,
-		.subdevice    = 0x0003,
-		.driver_data  = SAA7134_BOARD_MD7134,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x16be, /* CTX946 analog TV, HW mpeg, DVB-T */
-		.subdevice    = 0x5000, /* only analog TV and DVB-T for now */
-		.driver_data  = SAA7134_BOARD_MD7134,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_PHILIPS, 0x2001),
+		.driver_data = SAA7134_BOARD_PROTEUS_PRO,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1048,
-		.subdevice    = 0x226b,
-		.driver_data  = SAA7134_BOARD_ELSA,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1048,
-		.subdevice    = 0x226a,
-		.driver_data  = SAA7134_BOARD_ELSA_500TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1048,
-		.subdevice    = 0x226c,
-		.driver_data  = SAA7134_BOARD_ELSA_700TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_ASUSTEK,
-		.subdevice    = 0x4842,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_TVFM7134,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = PCI_VENDOR_ID_ASUSTEK,
-		.subdevice    = 0x4845,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_TVFM7135,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_ASUSTEK,
-		.subdevice    = 0x4830,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_TVFM7134,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = PCI_VENDOR_ID_ASUSTEK,
-		.subdevice    = 0x4843,
-		.driver_data  = SAA7134_BOARD_ASUSTEK_TVFM7133,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_ASUSTEK,
-		.subdevice    = 0x4840,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_TVFM7134,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0xfe01,
-		.driver_data  = SAA7134_BOARD_TVSTATION_RDS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1894,
-		.subdevice    = 0xfe01,
-		.driver_data  = SAA7134_BOARD_TVSTATION_RDS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1894,
-		.subdevice    = 0xa006,
-		.driver_data  = SAA7134_BOARD_TVSTATION_DVR,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1131,
-		.subdevice    = 0x7133,
-		.driver_data  = SAA7134_BOARD_VA1000POWER,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2001,
-		.driver_data  = SAA7134_BOARD_10MOONSTVMASTER,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc100,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc100,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_TV_GOLD_PLUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_VENDOR_ID_MATROX,
-		.subdevice    = 0x48d0,
-		.driver_data  = SAA7134_BOARD_CRONOS_PLUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa70b,
-		.driver_data  = SAA7134_BOARD_MD2819,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa7a1,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A700_PRO,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133,
+				PCI_VENDOR_ID_PHILIPS, 0x2001),
+		.driver_data = SAA7134_BOARD_PROTEUS_PRO,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa7a2,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A700_HYBRID,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_PHILIPS, 0x6752),
+		.driver_data = SAA7134_BOARD_EMPRESS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x2115,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_STUDIO_305,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa115,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_STUDIO_505,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1131, 0x4e85),
+		.driver_data = SAA7134_BOARD_MONSTERTV,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x2108,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_305,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x10ff,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_DVD_EZMAKER,
-	},{
-		/* AVerMedia CardBus */
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xd6ee,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_CARDBUS,
-	},{
-		/* AVerMedia CardBus */
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xb7e9,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_CARDBUS_501,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x153b, 0x1142),
+		.driver_data = SAA7134_BOARD_CINERGY400,
 	}, {
-		/* TransGear 3000TV */
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x050c,
-		.driver_data  = SAA7134_BOARD_TG3000TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x11bd,
-		.subdevice    = 0x002b,
-		.driver_data  = SAA7134_BOARD_PINNACLE_PCTV_STEREO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x11bd,
-		.subdevice    = 0x002d,
-		.driver_data  = SAA7134_BOARD_PINNACLE_300I_DVBT_PAL,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1019,
-		.subdevice    = 0x4cb4,
-		.driver_data  = SAA7134_BOARD_ECS_TVP3XP,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1019,
-		.subdevice    = 0x4cb5,
-		.driver_data  = SAA7134_BOARD_ECS_TVP3XP_4CB5,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1019,
-		.subdevice    = 0x4cb6,
-		.driver_data  = SAA7134_BOARD_ECS_TVP3XP_4CB6,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x12ab,
-		.subdevice    = 0x0800,
-		.driver_data  = SAA7134_BOARD_UPMOST_PURPLE_TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1152,
-		.driver_data  = SAA7134_BOARD_CINERGY200,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc100,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_TV_PVR,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x9715,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_STUDIO_307,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa70a,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_307,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc200,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_GOLD_PLUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1540,
-		.subdevice    = 0x9524,
-		.driver_data  = SAA7134_BOARD_PROVIDEO_PV952,
-
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0502,                /* Cardbus version */
-		.driver_data  = SAA7134_BOARD_FLYDVBT_DUO_CARDBUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0306,                /* PCI version */
-		.driver_data  = SAA7134_BOARD_FLYDVBTDUO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf31f,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_GO_007_FM,
-
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf11d,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M135A,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x153b, 0x1143),
+		.driver_data = SAA7134_BOARD_CINERGY600,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x4155,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M733A,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x153b, 0x1158),
+		.driver_data = SAA7134_BOARD_CINERGY600_MK3,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x4255,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M733A,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x153b, 0x1162),
+		.driver_data = SAA7134_BOARD_CINERGY400_CARDBUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2004,
-		.driver_data  = SAA7134_BOARD_PHILIPS_TOUGH,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1421,
-		.subdevice    = 0x0350,		/* PCI version */
-		.driver_data  = SAA7134_BOARD_ADS_INSTANT_TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1421,
-		.subdevice    = 0x0351,		/* PCI version, new revision */
-		.driver_data  = SAA7134_BOARD_ADS_INSTANT_TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1421,
-		.subdevice    = 0x0370,		/* cardbus version */
-		.driver_data  = SAA7134_BOARD_ADS_INSTANT_TV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1421,
-		.subdevice    = 0x1370,        /* cardbus version */
-		.driver_data  = SAA7134_BOARD_ADS_INSTANT_TV,
-
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x4e42,		/* Typhoon */
-		.subdevice    = 0x0502,		/* LifeView LR502 OEM */
-		.driver_data  = SAA7134_BOARD_FLYDVBT_DUO_CARDBUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x0210,		/* mini pci NTSC version */
-		.driver_data  = SAA7134_BOARD_FLYTV_DIGIMATRIX,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x0210,		/* mini pci PAL/SECAM version */
-		.driver_data  = SAA7134_BOARD_ASUSTEK_DIGIMATRIX_TV,
-
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0000, /* It shouldn't break anything, since subdevice id seems unique */
-		.subdevice    = 0x4091,
-		.driver_data  = SAA7134_BOARD_BEHOLD_409FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5456, /* GoTView */
-		.subdevice    = 0x7135,
-		.driver_data  = SAA7134_BOARD_GOTVIEW_7135,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2004,
-		.driver_data  = SAA7134_BOARD_PHILIPS_EUROPA,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc900,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_DVBT_300,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc901,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_DVBT_200,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1435,
-		.subdevice    = 0x7350,
-		.driver_data  = SAA7134_BOARD_RTD_VFG7350,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1435,
-		.subdevice    = 0x7330,
-		.driver_data  = SAA7134_BOARD_RTD_VFG7330,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461,
-		.subdevice    = 0x1044,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_AVERTVHD_A180,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1131,
-		.subdevice    = 0x4ee9,
-		.driver_data  = SAA7134_BOARD_MONSTERTV_MOBILE,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x11bd,
-		.subdevice    = 0x002e,
-		.driver_data  = SAA7134_BOARD_PINNACLE_PCTV_110i,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4862,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_P7131_DUAL,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2018,
-		.driver_data  = SAA7134_BOARD_PHILIPS_TIGER,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1462,
-		.subdevice    = 0x6231, /* tda8275a, ks003 IR */
-		.driver_data  = SAA7134_BOARD_MSI_TVATANYWHERE_PLUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1462,
-		.subdevice    = 0x8624, /* tda8275, ks003 IR */
-		.driver_data  = SAA7134_BOARD_MSI_TVATANYWHERE_PLUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1160,
-		.driver_data  = SAA7134_BOARD_CINERGY250PCI,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,	/* SAA 7131E */
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0319,
-		.driver_data  = SAA7134_BOARD_FLYDVB_TRIO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461,
-		.subdevice    = 0x2c05,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_777,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0301,
-		.driver_data  = SAA7134_BOARD_FLYDVBT_LR301,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0331,
-		.subdevice    = 0x1421,
-		.driver_data  = SAA7134_BOARD_ADS_DUO_CARDBUS_PTV331,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x17de,
-		.subdevice    = 0x7201,
-		.driver_data  = SAA7134_BOARD_TEVION_DVBT_220RF,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x17de,
-		.subdevice    = 0x7250,
-		.driver_data  = SAA7134_BOARD_KWORLD_DVBT_210,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133, /* SAA7135HL */
-		.subvendor    = 0x17de,
-		.subdevice    = 0x7350,
-		.driver_data  = SAA7134_BOARD_KWORLD_ATSC110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133, /* SAA7135HL */
-		.subvendor    = 0x17de,
-		.subdevice    = 0x7352,
-		.driver_data  = SAA7134_BOARD_KWORLD_ATSC110, /* ATSC 115 */
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133, /* SAA7135HL */
-		.subvendor    = 0x17de,
-		.subdevice    = 0xa134,
-		.driver_data  = SAA7134_BOARD_KWORLD_PC150U,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5169, 0x0138),
+		.driver_data = SAA7134_BOARD_FLYVIDEO3000_NTSC,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461,
-		.subdevice    = 0x7360,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A169_B,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461,
-		.subdevice    = 0x6360,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A169_B1,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x16be,
-		.subdevice    = 0x0005,
-		.driver_data  = SAA7134_BOARD_MD7134_BRIDGE_2,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x0300,
-		.driver_data  = SAA7134_BOARD_FLYDVBS_LR300,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x4e42,
-		.subdevice    = 0x0300,/* LR300 */
-		.driver_data  = SAA7134_BOARD_FLYDVBS_LR300,
-	},{
-		.vendor = PCI_VENDOR_ID_PHILIPS,
-		.device = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor = 0x1489,
-		.subdevice = 0x0301,
-		.driver_data = SAA7134_BOARD_FLYDVBT_LR301,
-	},{
-		.vendor = PCI_VENDOR_ID_PHILIPS,
-		.device = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor = 0x5168, /* Animation Technologies (LifeView) */
-		.subdevice = 0x0304,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5168, 0x0138),
+		.driver_data = SAA7134_BOARD_FLYVIDEO3000,
+	}, {
+		/* "Typhoon PCI Capture TV Card" Art.No. 50673 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x4e42, 0x0138),
+		.driver_data = SAA7134_BOARD_FLYVIDEO3000,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x5168, 0x0138),
+		.driver_data = SAA7134_BOARD_FLYVIDEO2000,
+	}, {
+		/* Typhoon LifeView FlyTV Prime30 OEM */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x4e42, 0x0138),
+		.driver_data = SAA7134_BOARD_FLYVIDEO2000,
+	}, {
+		/* minipci, LR212 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x0212),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_MINI,
+	}, {
+		/* minipci, LR1212 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x14c0, 0x1212),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_MINI2,
+	}, {
+		/* OEM minipci, LR212 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x4e42, 0x0212),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_MINI,
+	}, {
+		/*
+		 * Animation Technologies (LifeView)
+		 * Standard PCI, LR214 Rev E and earlier (SAA7135)
+		 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x0214),
 		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x3306,
-		.driver_data  = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x3502,  /* what's the difference to 0x3306 ?*/
-		.driver_data  = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5168,
-		.subdevice    = 0x3307, /* FlyDVB-T Hybrid Mini PCI */
-		.driver_data  = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x16be,
-		.subdevice    = 0x0007,
-		.driver_data  = SAA7134_BOARD_MEDION_MD8800_QUADRO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x16be,
-		.subdevice    = 0x0008,
-		.driver_data  = SAA7134_BOARD_MEDION_MD8800_QUADRO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x16be,
-		.subdevice    = 0x000d, /* triple CTX948_V1.1.1 */
-		.driver_data  = SAA7134_BOARD_MEDION_MD8800_QUADRO,
+		/*
+		 * Animation Technologies (LifeView)
+		 * Standard PCI, LR214 Rev F onwards (SAA7131)
+		 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x5214),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_FM,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461,
-		.subdevice    = 0x2c05,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_777,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1489,
-		.subdevice    = 0x0502,                /* Cardbus version */
-		.driver_data  = SAA7134_BOARD_FLYDVBT_DUO_CARDBUS,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x0919, /* Philips Proteus PRO 2309 */
-		.subdevice    = 0x2003,
-		.driver_data  = SAA7134_BOARD_PROTEUS_2309,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461,
-		.subdevice    = 0x2c00,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A16AR,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4860,
-		.driver_data  = SAA7134_BOARD_ASUS_EUROPA2_HYBRID,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x11bd,
-		.subdevice    = 0x002f,
-		.driver_data  = SAA7134_BOARD_PINNACLE_PCTV_310i,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x9715,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_STUDIO_507,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa11b,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_STUDIO_507UA,
+		/* KYE Genius VideoWonder ProTV */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1489, 0x0214),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_FM, /* is an LR214WF actually */
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4876,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_P7131_HYBRID_LNA,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6700,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6701,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6702,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6703,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6704,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6705,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1110,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6706,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1150,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6707,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1120,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6708,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1150,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x6709,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1120,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0070,
-		.subdevice    = 0x670a,
-		.driver_data  = SAA7134_BOARD_HAUPPAUGE_HVR1120,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1172,
-		.driver_data  = SAA7134_BOARD_CINERGY_HT_PCMCIA,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2342,
-		.driver_data  = SAA7134_BOARD_ENCORE_ENLTV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1131,
-		.subdevice    = 0x2341,
-		.driver_data  = SAA7134_BOARD_ENCORE_ENLTV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x3016,
-		.subdevice    = 0x2344,
-		.driver_data  = SAA7134_BOARD_ENCORE_ENLTV,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1131,
-		.subdevice    = 0x230f,
-		.driver_data  = SAA7134_BOARD_ENCORE_ENLTV_FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1a7f,
-		.subdevice    = 0x2008,
-		.driver_data  = SAA7134_BOARD_ENCORE_ENLTV_FM53,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x16be, 0x0003),
+		.driver_data = SAA7134_BOARD_MD7134,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1a7f,
-		.subdevice    = 0x2108,
-		.driver_data  = SAA7134_BOARD_ENCORE_ENLTV_FM3,
+		/* CTX946 analog TV, HW mpeg, DVB-T; only analog TV and DVB-T for now */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x16be, 0x5000),
+		.driver_data = SAA7134_BOARD_MD7134,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x153b,
-		.subdevice    = 0x1175,
-		.driver_data  = SAA7134_BOARD_CINERGY_HT_PCI,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf31e,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M102,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x4E42,         /* MSI */
-		.subdevice    = 0x0306,         /* TV@nywhere DUO */
-		.driver_data  = SAA7134_BOARD_FLYDVBTDUO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4871,
-		.driver_data  = SAA7134_BOARD_ASUS_P7131_4871,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4857,		/* REV:1.00 */
-		.driver_data  = SAA7134_BOARD_ASUSTeK_TIGER,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x0919, /* SinoVideo PCI 2309 Proteus (7134) */
-		.subdevice    = 0x2003, /* OEM cardbus */
-		.driver_data  = SAA7134_BOARD_SABRENT_TV_PCB05,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2304,
-		.driver_data  = SAA7134_BOARD_10MOONSTVMASTER3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf01d, /* AVerTV DVB-T Super 007 */
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_SUPER_007,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4016,
-		.driver_data  = SAA7134_BOARD_BEHOLD_401,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4036,
-		.driver_data  = SAA7134_BOARD_BEHOLD_403,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4037,
-		.driver_data  = SAA7134_BOARD_BEHOLD_403FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4050,
-		.driver_data  = SAA7134_BOARD_BEHOLD_405,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4051,
-		.driver_data  = SAA7134_BOARD_BEHOLD_405FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4070,
-		.driver_data  = SAA7134_BOARD_BEHOLD_407,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4071,
-		.driver_data  = SAA7134_BOARD_BEHOLD_407FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x4090,
-		.driver_data  = SAA7134_BOARD_BEHOLD_409,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x505B,
-		.driver_data  = SAA7134_BOARD_BEHOLD_505RDS_MK5,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1048, 0x226b),
+		.driver_data = SAA7134_BOARD_ELSA,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x5051,
-		.driver_data  = SAA7134_BOARD_BEHOLD_505RDS_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x5050,
-		.driver_data  = SAA7134_BOARD_BEHOLD_505FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x5071,
-		.driver_data  = SAA7134_BOARD_BEHOLD_507RDS_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x507B,
-		.driver_data  = SAA7134_BOARD_BEHOLD_507RDS_MK5,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x5070,
-		.driver_data  = SAA7134_BOARD_BEHOLD_507_9FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x5090,
-		.driver_data  = SAA7134_BOARD_BEHOLD_507_9FM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x0000,
-		.subdevice    = 0x5201,
-		.driver_data  = SAA7134_BOARD_BEHOLD_COLUMBUS_TVFM,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6070,
-		.driver_data  = SAA7134_BOARD_BEHOLD_607FM_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6071,
-		.driver_data  = SAA7134_BOARD_BEHOLD_607FM_MK5,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6072,
-		.driver_data  = SAA7134_BOARD_BEHOLD_607RDS_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6073,
-		.driver_data  = SAA7134_BOARD_BEHOLD_607RDS_MK5,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6090,
-		.driver_data  = SAA7134_BOARD_BEHOLD_609FM_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6091,
-		.driver_data  = SAA7134_BOARD_BEHOLD_609FM_MK5,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6092,
-		.driver_data  = SAA7134_BOARD_BEHOLD_609RDS_MK3,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6093,
-		.driver_data  = SAA7134_BOARD_BEHOLD_609RDS_MK5,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6190,
-		.driver_data  = SAA7134_BOARD_BEHOLD_M6,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6193,
-		.driver_data  = SAA7134_BOARD_BEHOLD_M6_EXTRA,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1048, 0x226a),
+		.driver_data = SAA7134_BOARD_ELSA_500TV,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6191,
-		.driver_data  = SAA7134_BOARD_BEHOLD_M63,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x4e42,
-		.subdevice    = 0x3502,
-		.driver_data  = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1048, 0x226c),
+		.driver_data = SAA7134_BOARD_ELSA_700TV,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1822, /*Twinhan Technology Co. Ltd*/
-		.subdevice    = 0x0022,
-		.driver_data  = SAA7134_BOARD_TWINHAN_DTV_DVB_3056,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_ASUSTEK, 0x4842),
+		.driver_data = SAA7134_BOARD_ASUSTeK_TVFM7134,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x16be,
-		.subdevice    = 0x0010, /* Medion version CTX953_V.1.4.3 */
-		.driver_data  = SAA7134_BOARD_CREATIX_CTX953,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133,
+				PCI_VENDOR_ID_ASUSTEK, 0x4845),
+		.driver_data = SAA7134_BOARD_ASUSTeK_TVFM7135,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1462, /* MSI */
-		.subdevice    = 0x8625, /* TV@nywhere A/D v1.1 */
-		.driver_data  = SAA7134_BOARD_MSI_TVANYWHERE_AD11,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf436,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_CARDBUS_506,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_ASUSTEK, 0x4830),
+		.driver_data = SAA7134_BOARD_ASUSTeK_TVFM7134,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf936,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A16D,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133,
+				PCI_VENDOR_ID_ASUSTEK, 0x4843),
+		.driver_data = SAA7134_BOARD_ASUSTEK_TVFM7133,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa836,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M115,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_ASUSTEK, 0x4840),
+		.driver_data = SAA7134_BOARD_ASUSTeK_TVFM7134,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc900,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_T750,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_PHILIPS, 0xfe01),
+		.driver_data = SAA7134_BOARD_TVSTATION_RDS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133, /* SAA7135HL */
-		.subvendor    = 0x1421,
-		.subdevice    = 0x0380,
-		.driver_data  = SAA7134_BOARD_ADS_INSTANT_HDTV_PCI,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1894, 0xfe01),
+		.driver_data = SAA7134_BOARD_TVSTATION_RDS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5169,
-		.subdevice    = 0x1502,
-		.driver_data  = SAA7134_BOARD_FLYTVPLATINUM_MINI,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1894, 0xa006),
+		.driver_data = SAA7134_BOARD_TVSTATION_DVR,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x6290,
-		.driver_data  = SAA7134_BOARD_BEHOLD_H6,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1131, 0x7133),
+		.driver_data = SAA7134_BOARD_VA1000POWER,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf636,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M103,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130,
+				PCI_VENDOR_ID_PHILIPS, 0x2001),
+		.driver_data = SAA7134_BOARD_10MOONSTVMASTER,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf736,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_M103,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x185b, 0xc100),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_TV,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4878, /* REV:1.02G */
-		.driver_data  = SAA7134_BOARD_ASUSTeK_TIGER_3IN1,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x185b, 0xc100),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_TV_GOLD_PLUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x48cd,
-		.driver_data  = SAA7134_BOARD_ASUSTeK_PS3_100,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130,
+				PCI_VENDOR_ID_MATROX, 0x48d0),
+		.driver_data = SAA7134_BOARD_CRONOS_PLUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x17de,
-		.subdevice    = 0x7128,
-		.driver_data  = SAA7134_BOARD_KWORLD_PLUS_TV_ANALOG,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0xa70b),
+		.driver_data = SAA7134_BOARD_MD2819,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x17de,
-		.subdevice    = 0xb136,
-		.driver_data  = SAA7134_BOARD_KWORLD_PCI_SBTVD_FULLSEG,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xa7a1),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A700_PRO,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xf31d,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_GO_007_FM_PLUS,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xa7a2),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A700_HYBRID,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc900,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_S350,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1461, 0x2115),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_STUDIO_305,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace, /* Beholder Intl. Ltd. */
-		.subdevice    = 0x7595,
-		.driver_data  = SAA7134_BOARD_BEHOLD_X7,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1461, 0xa115),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_STUDIO_505,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x19d1, /* RoverMedia */
-		.subdevice    = 0x0138, /* LifeView FlyTV Prime30 OEM */
-		.driver_data  = SAA7134_BOARD_ROVERMEDIA_LINK_PRO_FM,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1461, 0x2108),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_305,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0x2004,
-		.driver_data  = SAA7134_BOARD_ZOLID_HYBRID_PCI,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1461, 0x10ff),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_DVD_EZMAKER,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x1043,
-		.subdevice    = 0x4847,
-		.driver_data  = SAA7134_BOARD_ASUS_EUROPA_HYBRID,
+		/* AVerMedia CardBus */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0xd6ee),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_CARDBUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x107d,
-		.subdevice    = 0x6655,
-		.driver_data  = SAA7134_BOARD_LEADTEK_WINFAST_DTV1000S,
+		/* AVerMedia CardBus */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0xb7e9),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_CARDBUS_501,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x13c2,
-		.subdevice    = 0x2804,
-		.driver_data  = SAA7134_BOARD_TECHNOTREND_BUDGET_T3000,
+		/* AVerMedia TransGear 3000TV */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1461, 0x050c),
+		.driver_data = SAA7134_BOARD_TG3000TV,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace, /* Beholder Intl. Ltd. */
-		.subdevice    = 0x7190,
-		.driver_data  = SAA7134_BOARD_BEHOLD_H7,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x11bd, 0x002b),
+		.driver_data = SAA7134_BOARD_PINNACLE_PCTV_STEREO,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace, /* Beholder Intl. Ltd. */
-		.subdevice    = 0x7090,
-		.driver_data  = SAA7134_BOARD_BEHOLD_A7,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x11bd, 0x002d),
+		.driver_data = SAA7134_BOARD_PINNACLE_300I_DVBT_PAL,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7135,
-		.subvendor    = 0x185b,
-		.subdevice    = 0xc900,
-		.driver_data  = SAA7134_BOARD_VIDEOMATE_M1F,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1019, 0x4cb4),
+		.driver_data = SAA7134_BOARD_ECS_TVP3XP,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x5030,
-		.driver_data  = SAA7134_BOARD_BEHOLD_503FM,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1019, 0x4cb5),
+		.driver_data = SAA7134_BOARD_ECS_TVP3XP_4CB5,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x5ace,
-		.subdevice    = 0x5010,
-		.driver_data  = SAA7134_BOARD_BEHOLD_501,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1019, 0x4cb6),
+		.driver_data = SAA7134_BOARD_ECS_TVP3XP_4CB6,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = 0x17de,
-		.subdevice    = 0xd136,
-		.driver_data  = SAA7134_BOARD_MAGICPRO_PROHDTV_PRO2,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x12ab, 0x0800),
+		.driver_data = SAA7134_BOARD_UPMOST_PURPLE_TV,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x6000,
-		.subdevice    = 0x0811,
-		.driver_data  = SAA7134_BOARD_SENSORAY811_911,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x153b, 0x1152),
+		.driver_data = SAA7134_BOARD_CINERGY200,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x6000,
-		.subdevice    = 0x0911,
-		.driver_data  = SAA7134_BOARD_SENSORAY811_911,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x185b, 0xc100),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_TV_PVR,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0x2055, /* AverTV Satellite Hybrid+FM A706 */
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_A706,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0x9715),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_STUDIO_307,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1905, /* WIS */
-		.subdevice    = 0x7007,
-		.driver_data  = SAA7134_BOARD_WIS_VOYAGER,
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0xa70a),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_307,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x1461, /* Avermedia Technologies Inc */
-		.subdevice    = 0xa10a,
-		.driver_data  = SAA7134_BOARD_AVERMEDIA_505,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x185b, 0xc200),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_GOLD_PLUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = 0x107d,
-		.subdevice    = 0x6f3a,
-		.driver_data  = SAA7134_BOARD_LEADTEK_WINFAST_TV2100_FM,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1540, 0x9524),
+		.driver_data = SAA7134_BOARD_PROVIDEO_PV952,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x1779, /* V One Multimedia PTE Ltd */
-		.subdevice    = 0x13cf,
-		.driver_data  = SAA7134_BOARD_SNAZIO_TVPVR_PRO,
+		/* Cardbus version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x0502),
+		.driver_data = SAA7134_BOARD_FLYDVBT_DUO_CARDBUS,
 	}, {
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = 0x107d,
-		.subdevice    = 0x6f2e,
-		.driver_data  = SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H,
+		/* PCI version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x0306),
+		.driver_data = SAA7134_BOARD_FLYDVBTDUO,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf31f),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_GO_007_FM,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf11d),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M135A,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0x4155),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M733A,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0x4255),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M733A,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130,
+				PCI_VENDOR_ID_PHILIPS, 0x2004),
+		.driver_data = SAA7134_BOARD_PHILIPS_TOUGH,
+	}, {
+		/* PCI version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1421, 0x0350),
+		.driver_data = SAA7134_BOARD_ADS_INSTANT_TV,
+	}, {
+		/* PCI version, new revision */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1421, 0x0351),
+		.driver_data = SAA7134_BOARD_ADS_INSTANT_TV,
+	}, {
+		/* cardbus version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1421, 0x0370),
+		.driver_data = SAA7134_BOARD_ADS_INSTANT_TV,
+	}, {
+		/* cardbus version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1421, 0x1370),
+		.driver_data = SAA7134_BOARD_ADS_INSTANT_TV,
+	}, {
+		/* Typhoon LifeView LR502 OEM */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x4e42, 0x0502),
+		.driver_data = SAA7134_BOARD_FLYDVBT_DUO_CARDBUS,
+	}, {
+		/* mini pci NTSC version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x0210),
+		.driver_data = SAA7134_BOARD_FLYTV_DIGIMATRIX,
+	}, {
+		/* mini pci PAL/SECAM version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1043, 0x0210),
+		.driver_data = SAA7134_BOARD_ASUSTEK_DIGIMATRIX_TV,
+	}, {
+		/* subvendor == 0 shouldn't break anything, since subdevice id seems unique */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0000, 0x4091),
+		.driver_data = SAA7134_BOARD_BEHOLD_409FM,
+	}, {
+		/* GoTView */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5456, 0x7135),
+		.driver_data = SAA7134_BOARD_GOTVIEW_7135,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_PHILIPS, 0x2004),
+		.driver_data = SAA7134_BOARD_PHILIPS_EUROPA,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x185b, 0xc900),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_DVBT_300,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x185b, 0xc901),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_DVBT_200,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1435, 0x7350),
+		.driver_data = SAA7134_BOARD_RTD_VFG7350,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1435, 0x7330),
+		.driver_data = SAA7134_BOARD_RTD_VFG7330,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0x1044),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_AVERTVHD_A180,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1131, 0x4ee9),
+		.driver_data = SAA7134_BOARD_MONSTERTV_MOBILE,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x11bd, 0x002e),
+		.driver_data = SAA7134_BOARD_PINNACLE_PCTV_110i,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x4862),
+		.driver_data = SAA7134_BOARD_ASUSTeK_P7131_DUAL,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133,
+				PCI_VENDOR_ID_PHILIPS, 0x2018),
+		.driver_data = SAA7134_BOARD_PHILIPS_TIGER,
+	}, {
+		/* tda8275a, ks003 IR */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1462, 0x6231),
+		.driver_data = SAA7134_BOARD_MSI_TVATANYWHERE_PLUS,
+	}, {
+		/* tda8275, ks003 IR */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1462, 0x8624),
+		.driver_data = SAA7134_BOARD_MSI_TVATANYWHERE_PLUS,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x153b, 0x1160),
+		.driver_data = SAA7134_BOARD_CINERGY250PCI,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x0319),
+		.driver_data = SAA7134_BOARD_FLYDVB_TRIO,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0x2c05),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_777,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5168, 0x0301),
+		.driver_data = SAA7134_BOARD_FLYDVBT_LR301,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0331, 0x1421),
+		.driver_data = SAA7134_BOARD_ADS_DUO_CARDBUS_PTV331,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x17de, 0x7201),
+		.driver_data = SAA7134_BOARD_TEVION_DVBT_220RF,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x17de, 0x7250),
+		.driver_data = SAA7134_BOARD_KWORLD_DVBT_210,
+	}, {
+		/* SAA7135HL */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x17de, 0x7350),
+		.driver_data = SAA7134_BOARD_KWORLD_ATSC110,
+	}, {
+		/* SAA7135HL */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x17de, 0x7352),
+		.driver_data = SAA7134_BOARD_KWORLD_ATSC110, /* ATSC 115 */
+	}, {
+		/* SAA7135HL */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x17de, 0xa134),
+		.driver_data = SAA7134_BOARD_KWORLD_PC150U,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0x7360),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A169_B,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0x6360),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A169_B1,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x16be, 0x0005),
+		.driver_data = SAA7134_BOARD_MD7134_BRIDGE_2,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5168, 0x0300),
+		.driver_data = SAA7134_BOARD_FLYDVBS_LR300,
+	}, {
+		/* LR300 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x4e42, 0x0300),
+		.driver_data = SAA7134_BOARD_FLYDVBS_LR300,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1489, 0x0301),
+		.driver_data = SAA7134_BOARD_FLYDVBT_LR301,
+	}, {
+		/* Animation Technologies (LifeView) */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x0304),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x3306),
+		.driver_data = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
+	}, {
+		/* what's the difference to .subdevice = 0x3306 above? */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x3502),
+		.driver_data = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
+	}, {
+		/* FlyDVB-T Hybrid Mini PCI */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5168, 0x3307),
+		.driver_data = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x16be, 0x0007),
+		.driver_data = SAA7134_BOARD_MEDION_MD8800_QUADRO,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x16be, 0x0008),
+		.driver_data = SAA7134_BOARD_MEDION_MD8800_QUADRO,
+	}, {
+		/* triple CTX948_V1.1.1 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x16be, 0x000d),
+		.driver_data = SAA7134_BOARD_MEDION_MD8800_QUADRO,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0x2c05),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_777,
+	}, {
+		/* Cardbus version */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1489, 0x0502),
+		.driver_data = SAA7134_BOARD_FLYDVBT_DUO_CARDBUS,
+	}, {
+		/* Philips Proteus PRO 2309 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x0919, 0x2003),
+		.driver_data = SAA7134_BOARD_PROTEUS_2309,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0x2c00),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A16AR,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1043, 0x4860),
+		.driver_data = SAA7134_BOARD_ASUS_EUROPA2_HYBRID,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x11bd, 0x002f),
+		.driver_data = SAA7134_BOARD_PINNACLE_PCTV_310i,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0x9715),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_STUDIO_507,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1461, 0xa11b),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_STUDIO_507UA,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x4876),
+		.driver_data = SAA7134_BOARD_ASUSTeK_P7131_HYBRID_LNA,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6700),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1110,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6701),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1110,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6702),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1110,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6703),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1110,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6704),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1110,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6705),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1110,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6706),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1150,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6707),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1120,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6708),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1150,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x6709),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1120,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0070, 0x670a),
+		.driver_data = SAA7134_BOARD_HAUPPAUGE_HVR1120,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x153b, 0x1172),
+		.driver_data = SAA7134_BOARD_CINERGY_HT_PCMCIA,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130,
+				PCI_VENDOR_ID_PHILIPS, 0x2342),
+		.driver_data = SAA7134_BOARD_ENCORE_ENLTV,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1131, 0x2341),
+		.driver_data = SAA7134_BOARD_ENCORE_ENLTV,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x3016, 0x2344),
+		.driver_data = SAA7134_BOARD_ENCORE_ENLTV,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1131, 0x230f),
+		.driver_data = SAA7134_BOARD_ENCORE_ENLTV_FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1a7f, 0x2008),
+		.driver_data = SAA7134_BOARD_ENCORE_ENLTV_FM53,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1a7f, 0x2108),
+		.driver_data = SAA7134_BOARD_ENCORE_ENLTV_FM3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x153b, 0x1175),
+		.driver_data = SAA7134_BOARD_CINERGY_HT_PCI,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf31e),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M102,
+	}, {
+		/* MSI TV@nywhere DUO */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x4E42, 0x0306),
+		.driver_data = SAA7134_BOARD_FLYDVBTDUO,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x4871),
+		.driver_data = SAA7134_BOARD_ASUS_P7131_4871,
+	}, {
+		/* REV:1.00 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x4857),
+		.driver_data = SAA7134_BOARD_ASUSTeK_TIGER,
+	}, {
+		/* SinoVideo PCI 2309 Proteus (7134) OEM cardbus */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x0919, 0x2003),
+		.driver_data = SAA7134_BOARD_SABRENT_TV_PCB05,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130,
+				PCI_VENDOR_ID_PHILIPS, 0x2304),
+		.driver_data = SAA7134_BOARD_10MOONSTVMASTER3,
+	}, {
+		/* Avermedia Technologies Inc AVerTV DVB-T Super 007 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf01d),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_SUPER_007,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x0000, 0x4016),
+		.driver_data = SAA7134_BOARD_BEHOLD_401,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x0000, 0x4036),
+		.driver_data = SAA7134_BOARD_BEHOLD_403,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x0000, 0x4037),
+		.driver_data = SAA7134_BOARD_BEHOLD_403FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x0000, 0x4050),
+		.driver_data = SAA7134_BOARD_BEHOLD_405,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x0000, 0x4051),
+		.driver_data = SAA7134_BOARD_BEHOLD_405FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x0000, 0x4070),
+		.driver_data = SAA7134_BOARD_BEHOLD_407,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x0000, 0x4071),
+		.driver_data = SAA7134_BOARD_BEHOLD_407FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0000, 0x4090),
+		.driver_data = SAA7134_BOARD_BEHOLD_409,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x0000, 0x505B),
+		.driver_data = SAA7134_BOARD_BEHOLD_505RDS_MK5,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x0000, 0x5051),
+		.driver_data = SAA7134_BOARD_BEHOLD_505RDS_MK3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x5ace, 0x5050),
+		.driver_data = SAA7134_BOARD_BEHOLD_505FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0000, 0x5071),
+		.driver_data = SAA7134_BOARD_BEHOLD_507RDS_MK3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0000, 0x507B),
+		.driver_data = SAA7134_BOARD_BEHOLD_507RDS_MK5,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5ace, 0x5070),
+		.driver_data = SAA7134_BOARD_BEHOLD_507_9FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x5090),
+		.driver_data = SAA7134_BOARD_BEHOLD_507_9FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x0000, 0x5201),
+		.driver_data = SAA7134_BOARD_BEHOLD_COLUMBUS_TVFM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5ace, 0x6070),
+		.driver_data = SAA7134_BOARD_BEHOLD_607FM_MK3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5ace, 0x6071),
+		.driver_data = SAA7134_BOARD_BEHOLD_607FM_MK5,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5ace, 0x6072),
+		.driver_data = SAA7134_BOARD_BEHOLD_607RDS_MK3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x5ace, 0x6073),
+		.driver_data = SAA7134_BOARD_BEHOLD_607RDS_MK5,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6090),
+		.driver_data = SAA7134_BOARD_BEHOLD_609FM_MK3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6091),
+		.driver_data = SAA7134_BOARD_BEHOLD_609FM_MK5,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6092),
+		.driver_data = SAA7134_BOARD_BEHOLD_609RDS_MK3,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6093),
+		.driver_data = SAA7134_BOARD_BEHOLD_609RDS_MK5,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6190),
+		.driver_data = SAA7134_BOARD_BEHOLD_M6,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6193),
+		.driver_data = SAA7134_BOARD_BEHOLD_M6_EXTRA,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6191),
+		.driver_data = SAA7134_BOARD_BEHOLD_M63,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x4e42, 0x3502),
+		.driver_data = SAA7134_BOARD_FLYDVBT_HYBRID_CARDBUS,
+	}, {
+		/*Twinhan Technology Co. Ltd*/
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1822, 0x0022),
+		.driver_data = SAA7134_BOARD_TWINHAN_DTV_DVB_3056,
+	}, {
+		/* Medion version CTX953_V.1.4.3 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x16be, 0x0010),
+		.driver_data = SAA7134_BOARD_CREATIX_CTX953,
+	}, {
+		/* MSI TV@nywhere A/D v1.1 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1462, 0x8625),
+		.driver_data = SAA7134_BOARD_MSI_TVANYWHERE_AD11,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf436),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_CARDBUS_506,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf936),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A16D,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xa836),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M115,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x185b, 0xc900),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_T750,
+	}, {
+		/* SAA7135HL */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1421, 0x0380),
+		.driver_data = SAA7134_BOARD_ADS_INSTANT_HDTV_PCI,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5169, 0x1502),
+		.driver_data = SAA7134_BOARD_FLYTVPLATINUM_MINI,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x6290),
+		.driver_data = SAA7134_BOARD_BEHOLD_H6,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf636),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M103,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf736),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_M103,
+	}, {
+		/* REV:1.02G */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x4878),
+		.driver_data = SAA7134_BOARD_ASUSTeK_TIGER_3IN1,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1043, 0x48cd),
+		.driver_data = SAA7134_BOARD_ASUSTeK_PS3_100,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x17de, 0x7128),
+		.driver_data = SAA7134_BOARD_KWORLD_PLUS_TV_ANALOG,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x17de, 0xb136),
+		.driver_data = SAA7134_BOARD_KWORLD_PCI_SBTVD_FULLSEG,
+	}, {
+		/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0xf31d),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_GO_007_FM_PLUS,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x185b, 0xc900),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_S350,
+	}, {
+		/* Beholder Intl. Ltd. */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x7595),
+		.driver_data = SAA7134_BOARD_BEHOLD_X7,
+	}, {
+		/* RoverMedia LifeView FlyTV Prime30 OEM */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x19d1, 0x0138),
+		.driver_data = SAA7134_BOARD_ROVERMEDIA_LINK_PRO_FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133,
+				PCI_VENDOR_ID_PHILIPS, 0x2004),
+		.driver_data = SAA7134_BOARD_ZOLID_HYBRID_PCI,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x1043, 0x4847),
+		.driver_data = SAA7134_BOARD_ASUS_EUROPA_HYBRID,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x107d, 0x6655),
+		.driver_data = SAA7134_BOARD_LEADTEK_WINFAST_DTV1000S,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x13c2, 0x2804),
+		.driver_data = SAA7134_BOARD_TECHNOTREND_BUDGET_T3000,
+	}, {
+		/* Beholder Intl. Ltd. */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x7190),
+		.driver_data = SAA7134_BOARD_BEHOLD_H7,
+	}, {
+		/* Beholder Intl. Ltd. */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x7090),
+		.driver_data = SAA7134_BOARD_BEHOLD_A7,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7135, 0x185b, 0xc900),
+		.driver_data = SAA7134_BOARD_VIDEOMATE_M1F,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x5ace, 0x5030),
+		.driver_data = SAA7134_BOARD_BEHOLD_503FM,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x5ace, 0x5010),
+		.driver_data = SAA7134_BOARD_BEHOLD_501,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134, 0x17de, 0xd136),
+		.driver_data = SAA7134_BOARD_MAGICPRO_PROHDTV_PRO2,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x6000, 0x0811),
+		.driver_data = SAA7134_BOARD_SENSORAY811_911,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x6000, 0x0911),
+		.driver_data = SAA7134_BOARD_SENSORAY811_911,
+	}, {
+		/* Avermedia Technologies Inc AverTV Satellite Hybrid+FM A706 */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1461, 0x2055),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_A706,
+	}, {
+		/* WIS */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1905, 0x7007),
+		.driver_data = SAA7134_BOARD_WIS_VOYAGER,
+	}, {
+			/* Avermedia Technologies Inc */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x1461, 0xa10a),
+		.driver_data = SAA7134_BOARD_AVERMEDIA_505,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130, 0x107d, 0x6f3a),
+		.driver_data = SAA7134_BOARD_LEADTEK_WINFAST_TV2100_FM,
+	}, {
+		/* V One Multimedia PTE Ltd */
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x1779, 0x13cf),
+		.driver_data = SAA7134_BOARD_SNAZIO_TVPVR_PRO,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133, 0x107d, 0x6f2e),
+		.driver_data = SAA7134_BOARD_LEADTEK_WINFAST_HDTV200_H,
 	}, {
 		/* --- boards without eeprom + subsystem ID --- */
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0,
-		.driver_data  = SAA7134_BOARD_NOAUTO,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_VENDOR_ID_PHILIPS,
-		.subdevice    = 0,
-		.driver_data  = SAA7134_BOARD_NOAUTO,
-	},{
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134,
+				PCI_VENDOR_ID_PHILIPS, 0),
+		.driver_data = SAA7134_BOARD_NOAUTO,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130,
+				PCI_VENDOR_ID_PHILIPS, 0),
+		.driver_data = SAA7134_BOARD_NOAUTO,
+	}, {
 		/* --- default catch --- */
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7130,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
-		.driver_data  = SAA7134_BOARD_UNKNOWN,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7133,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
-		.driver_data  = SAA7134_BOARD_UNKNOWN,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7134,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
-		.driver_data  = SAA7134_BOARD_UNKNOWN,
-	},{
-		.vendor       = PCI_VENDOR_ID_PHILIPS,
-		.device       = PCI_DEVICE_ID_PHILIPS_SAA7135,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
-		.driver_data  = SAA7134_BOARD_UNKNOWN,
-	},{
+		PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7130),
+		.driver_data = SAA7134_BOARD_UNKNOWN,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7133),
+		.driver_data = SAA7134_BOARD_UNKNOWN,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7134),
+		.driver_data = SAA7134_BOARD_UNKNOWN,
+	}, {
+		PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7135),
+		.driver_data = SAA7134_BOARD_UNKNOWN,
+	}, {
 		/* --- end of list --- */
 	}
 };
diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index 1eef4e102972..7fa282088fa1 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -361,22 +361,14 @@ static struct saa7146_pci_extension_data hexium_gemini_dual_4bnc = {
 
 static const struct pci_device_id pci_tbl[] = {
 	{
-	 .vendor = PCI_VENDOR_ID_PHILIPS,
-	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
-	 .subvendor = 0x17c8,
-	 .subdevice = 0x2401,
-	 .driver_data = (unsigned long) &hexium_gemini_4bnc,
-	 },
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0x17c8, 0x2401),
+		.driver_data = (unsigned long) &hexium_gemini_4bnc,
+	},
 	{
-	 .vendor = PCI_VENDOR_ID_PHILIPS,
-	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
-	 .subvendor = 0x17c8,
-	 .subdevice = 0x2402,
-	 .driver_data = (unsigned long) &hexium_gemini_dual_4bnc,
-	 },
-	{
-	 .vendor = 0,
-	 }
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0x17c8, 0x2402),
+		.driver_data = (unsigned long) &hexium_gemini_dual_4bnc,
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, pci_tbl);
diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index 6f1b4bff7596..8037cc4d0cca 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -425,29 +425,16 @@ static struct saa7146_pci_extension_data hexium_orion_4bnc = {
 
 static const struct pci_device_id pci_tbl[] = {
 	{
-	 .vendor = PCI_VENDOR_ID_PHILIPS,
-	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
-	 .subvendor = 0x0000,
-	 .subdevice = 0x0000,
-	 .driver_data = (unsigned long) &hexium_hv_pci6,
-	 },
-	{
-	 .vendor = PCI_VENDOR_ID_PHILIPS,
-	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
-	 .subvendor = 0x17c8,
-	 .subdevice = 0x0101,
-	 .driver_data = (unsigned long) &hexium_orion_1svhs_3bnc,
-	 },
-	{
-	 .vendor = PCI_VENDOR_ID_PHILIPS,
-	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
-	 .subvendor = 0x17c8,
-	 .subdevice = 0x2101,
-	 .driver_data = (unsigned long) &hexium_orion_4bnc,
-	 },
-	{
-	 .vendor = 0,
-	 }
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0x0000, 0x0000),
+		.driver_data = (unsigned long) &hexium_hv_pci6,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0x17c8, 0x0101),
+		.driver_data = (unsigned long) &hexium_orion_1svhs_3bnc,
+	}, {
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0x17c8, 0x2101),
+		.driver_data = (unsigned long) &hexium_orion_4bnc,
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, pci_tbl);
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index d931b4e3052f..d759e8a87e24 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -821,14 +821,10 @@ static struct saa7146_pci_extension_data mxb = {
 
 static const struct pci_device_id pci_tbl[] = {
 	{
-		.vendor    = PCI_VENDOR_ID_PHILIPS,
-		.device	   = PCI_DEVICE_ID_PHILIPS_SAA7146,
-		.subvendor = 0x0000,
-		.subdevice = 0x0000,
+		PCI_VDEVICE_SUB(PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, 0x0000, 0x0000),
 		.driver_data = (unsigned long)&mxb,
-	}, {
-		.vendor	= 0,
-	}
+	},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, pci_tbl);
diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 6bcde506adf5..683bd78288b3 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1535,10 +1535,7 @@ static void saa7164_finidev(struct pci_dev *pci_dev)
 static const struct pci_device_id saa7164_pci_tbl[] = {
 	{
 		/* SAA7164 */
-		.vendor       = 0x1131,
-		.device       = 0x7164,
-		.subvendor    = PCI_ANY_ID,
-		.subdevice    = PCI_ANY_ID,
+		PCI_DEVICE(0x1131, 0x7164),
 	}, {
 		/* --- end of list --- */
 	}
diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
index 387c29958c98..5f18abb48b17 100644
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -1097,8 +1097,7 @@ static const struct smi_cfg_info technotrend_s2_4200_cfg = {
 
 /* PCI IDs */
 #define SMI_ID(_subvend, _subdev, _driverdata) {	\
-	.vendor      = SMI_VID,    .device    = SMI_PID, \
-	.subvendor   = _subvend, .subdevice = _subdev, \
+	PCI_DEVICE_SUB(SMI_VID, SMI_PID, (_subvend), (_subdev)), \
 	.driver_data = (unsigned long)&_driverdata }
 
 static const struct pci_device_id smi_id_table[] = {
@@ -1106,7 +1105,7 @@ static const struct pci_device_id smi_id_table[] = {
 	SMI_ID(0x4254, 0x0552, dvbsky_s952_cfg),
 	SMI_ID(0x4254, 0x5580, dvbsky_t9580_cfg),
 	SMI_ID(0x13c2, 0x3016, technotrend_s2_4200_cfg),
-	{0}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, smi_id_table);
 
diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index 11cddf4b4312..282c2c87151f 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -656,7 +656,7 @@ static const struct pci_device_id solo_id_table[] = {
 	  .driver_data = SOLO_DEV_6110 },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BLUECHERRY, PCI_DEVICE_ID_BC_6110_16),
 	  .driver_data = SOLO_DEV_6110 },
-	{0,}
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, solo_id_table);
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
index 8b496b959d7e..eb82a670c5bf 100644
--- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -1537,9 +1537,7 @@ static const struct pci_device_id pci_tbl[] = {
 	MAKE_EXTENSION_PCI(ttc1501, 0x13c2, 0x101a),
 	MAKE_EXTENSION_PCI(tt3200, 0x13c2, 0x1019),
 	MAKE_EXTENSION_PCI(ttbs1500b, 0x13c2, 0x101b),
-	{
-	 .vendor = 0,
-	}
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, pci_tbl);
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/media/pci/ttpci/budget.c
index 95370156aff5..c9f419fc07ad 100644
--- a/drivers/media/pci/ttpci/budget.c
+++ b/drivers/media/pci/ttpci/budget.c
@@ -858,9 +858,7 @@ static const struct pci_device_id pci_tbl[] = {
 	MAKE_EXTENSION_PCI(fsact, 0x1131, 0x5f61),
 	MAKE_EXTENSION_PCI(omicom, 0x14c4, 0x1020),
 	MAKE_EXTENSION_PCI(sylt, 0x1131, 0x4f52),
-	{
-		.vendor    = 0,
-	}
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, pci_tbl);
diff --git a/drivers/media/pci/tw5864/tw5864-core.c b/drivers/media/pci/tw5864/tw5864-core.c
index 832788603f88..6ec8bce4ac4f 100644
--- a/drivers/media/pci/tw5864/tw5864-core.c
+++ b/drivers/media/pci/tw5864/tw5864-core.c
@@ -72,8 +72,8 @@ MODULE_PARM_DESC(video_nr, "video devices numbers array");
  * added under vendor 0x1797 (Techwell Inc.) as subsystem IDs.
  */
 static const struct pci_device_id tw5864_pci_tbl[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_5864)},
-	{0,}
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_5864) },
+	{ }
 };
 
 void tw5864_irqmask_apply(struct tw5864_dev *dev)
diff --git a/drivers/media/pci/tw68/tw68-core.c b/drivers/media/pci/tw68/tw68-core.c
index 08b7ce1043aa..509d7ddec150 100644
--- a/drivers/media/pci/tw68/tw68-core.c
+++ b/drivers/media/pci/tw68/tw68-core.c
@@ -62,14 +62,14 @@ static atomic_t tw68_instance = ATOMIC_INIT(0);
  * added under vendor 0x1797 (Techwell Inc.) as subsystem IDs.
  */
 static const struct pci_device_id tw68_pci_tbl[] = {
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6800)},
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6801)},
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6804)},
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_1)},
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_2)},
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_3)},
-	{PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_4)},
-	{0,}
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6800) },
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6801) },
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6804) },
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_1) },
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_2) },
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_3) },
+	{ PCI_VDEVICE(TECHWELL, PCI_DEVICE_ID_TECHWELL_6816_4) },
+	{ }
 };
 
 /* ------------------------------------------------------------------ */
diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
index a10e38221817..5a4ab329c06e 100644
--- a/drivers/media/pci/tw686x/tw686x-core.c
+++ b/drivers/media/pci/tw686x/tw686x-core.c
@@ -416,25 +416,24 @@ static void tw686x_remove(struct pci_dev *pci_dev)
 /* driver_data is number of A/V channels */
 static const struct pci_device_id tw686x_pci_tbl[] = {
 	{
-		PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, 0x6864),
-		.driver_data = 4
-	},
-	{
-		PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, 0x6865), /* not tested */
-		.driver_data = 4 | TYPE_SECOND_GEN
+		PCI_VDEVICE(TECHWELL, 0x6864),
+		.driver_data = 4,
+	}, {
+		PCI_VDEVICE(TECHWELL, 0x6865), /* not tested */
+		.driver_data = 4 | TYPE_SECOND_GEN,
 	},
 	/*
 	 * TW6868 supports 8 A/V channels with an external TW2865 chip;
 	 * not supported by the driver.
 	 */
 	{
-		PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, 0x6868), /* not tested */
-		.driver_data = 4
+		PCI_VDEVICE(TECHWELL, 0x6868), /* not tested */
+		.driver_data = 4,
+	}, {
+		PCI_VDEVICE(TECHWELL, 0x6869),
+		.driver_data = 8 | TYPE_SECOND_GEN
 	},
-	{
-		PCI_DEVICE(PCI_VENDOR_ID_TECHWELL, 0x6869),
-		.driver_data = 8 | TYPE_SECOND_GEN},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, tw686x_pci_tbl);
 
diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index f707bdc1fb0f..8bcf355a5418 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -75,8 +75,9 @@ MODULE_LICENSE("GPL");
 MODULE_VERSION(ZORAN_VERSION);
 
 #define ZR_DEVICE(subven, subdev, data)	{ \
-	.vendor = PCI_VENDOR_ID_ZORAN, .device = PCI_DEVICE_ID_ZORAN_36057, \
-	.subvendor = (subven), .subdevice = (subdev), .driver_data = (data) }
+	PCI_DEVICE_SUB(PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36057, \
+		       (subven), (subdev)), \
+	.driver_data = (data) }
 
 static const struct pci_device_id zr36067_pci_tbl[] = {
 	ZR_DEVICE(PCI_VENDOR_ID_MIRO, PCI_DEVICE_ID_MIRO_DC10PLUS, DC10_PLUS),
@@ -84,7 +85,7 @@ static const struct pci_device_id zr36067_pci_tbl[] = {
 	ZR_DEVICE(PCI_VENDOR_ID_ELECTRONICDESIGNGMBH, PCI_DEVICE_ID_LML_33R10, LML33R10),
 	ZR_DEVICE(PCI_VENDOR_ID_IOMEGA, PCI_DEVICE_ID_IOMEGA_BUZ, BUZ),
 	ZR_DEVICE(PCI_ANY_ID, PCI_ANY_ID, NUM_CARDS),
-	{0}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, zr36067_pci_tbl);
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


