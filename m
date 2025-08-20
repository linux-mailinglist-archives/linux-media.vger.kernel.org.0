Return-Path: <linux-media+bounces-40326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAEAB2D093
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 02:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879AF2A84E7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1E7208A7;
	Wed, 20 Aug 2025 00:14:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ring0.de (ring0.de [152.53.19.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A44A1E;
	Wed, 20 Aug 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.19.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755648843; cv=none; b=kBeW3tgHJAInRzmgNC+pq5xRuRy8ZBa/JVu6zceSaWJnb6O4Vceytc1/md1sXUmliopkN1KH5g83VJxM1aSNbH/UsUq5lqAtacpbHCaNyHNV1+eT7NXmI7TvjFCsF+0TyEB7V2v4hMBY5fiNuUnpCznRBjsYUCL8Pp3sy7LcxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755648843; c=relaxed/simple;
	bh=gJaHiADsO/QRPphzLO0hDvFSeItdJMuHJblV73GwIg0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bpuZN2Qcn/VjuWejn6e//7mAzmpXkrCofCMqjz8kr0zTZlBFnbpL+cHzo5RgkWrup5ra6E3/zFeU91DqYzHGoNacBjEA9HNV685j6CCKDq1dglxrTN6Xi18B1zFbCF+XzcNz64EGrSvpLh/+r6ByLSWJvzR7x3rP+21vOq4rHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=ring0.de; arc=none smtp.client-ip=152.53.19.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ring0.de
From: Sebastian Reichel <sre@kernel.org>
Authentication-Results: ring0.de;
	auth=pass smtp.mailfrom=sre@ring0.de
Subject: [PATCH 0/2] media: ov02c10: fix orientation on Thinkpad T14s Gen6
 (Snapdragon)
Date: Wed, 20 Aug 2025 02:13:18 +0200
Message-Id: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4TpWgC/32MSw6DIBQAr2Leuhh4gp+uvEfjQuFVSRsw0JA2x
 rsXXTddziQzG0QKliJciw0CJRutdxnEpQC9jG4mZk1mQI6Kt6JhPnHUgrO7fTNdt8grMUolR8j
 FGijr83YbMi82vnz4nPMkDvv7kwTjTBthJqxV10jqg3UzLw3BsUn4J8WcdoZkW+GktZL9g4KjZ
 +nDDMO+71//QCg44gAAAA==
X-Change-ID: 20250817-ov02c10-fix-c682031a454a
To: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Frederic Stuyk <fstuyk@runbox.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=sre@kernel.org;
 h=from:subject:message-id; bh=gJaHiADsO/QRPphzLO0hDvFSeItdJMuHJblV73GwIg0=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBopRM3LmpoItMXAKgpQjaLtKxZ6vSmumqUw0u5C
 qycylY+e1eJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaKUTNwAKCRDY7tfzyDv6
 mpFqD/9WcDKMRuJx4wghlFgpQTnGr2/xMRQD5lR62a774+7aOkeDgeB1S4wW6OtD54fvTmFW3Tb
 Dbhw3lhWz5Itgp1o1s0/qPMw7S77oSVmnIGtaFiOUMjlw35l9IqQx3czoyMp51TfnHl90a63//z
 Au8QxDYPEDUVxdt2SDjw+lQjl8367yIikgx4o8NcnKrMzaLciZTauevaYimmpE0a9xH4tPx23Wf
 J60f7J14YjAqW4qpqddBy0ofgPw35w31YYT8/3O3E5jp+Dqd/ZqE5zRga7n8bGf++cHC9i6Gh5o
 4+BfKFDDOUq1hNw/xwwCoaTlAxr3RkqQA6QpE0qA5Ok4fdaIxBNy9kccAjnpu9R51bcNghf0ICN
 nDg/EKsDLNfr1Bt9X7EQ8brL79j0kskdtEuZ2lCSKvP6CGpNDK5rUXDuiJe6kfKo69hh/Z/kS1A
 mRq2O7io12syU5cXqcTuho+hzrF2rKvFE5MxCftfdjiJnQVG/4u2Qg98Mj7wsI1MapdtkBkZlLR
 ga7bhXM/DzzChxH4exHYx9Cv3hd+No4FbFcbYb34WheEgkksVF/yFbn/qx00aydBuE+InMASbTV
 PFbTxLoJXLV/94rXuv5dfFzlfaFDjqhK8kcrkQ6Lliz6jaxa5P8kO3ynwTnCulDBih7JKPHTCYT
 qpRNXadwDA7PI/Q==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: antispam
X-Rspamd-Queue-Id: 9ADDAE31F7
X-Spamd-Result: default: False [-1.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[sre@kernel.org,sre@ring0.de];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:39351, ipnet:193.32.248.0/24, country:SE];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[runbox.com,vger.kernel.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	IS_LOCAL_DOMAIN_E(0.00)[ring0.de];
	FROM_NEQ_ENVFROM(0.00)[sre@kernel.org,sre@ring0.de];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,runbox.com]
X-Rspamd-Action: no action
X-Spamd-Bar: -

When testing the camera patches for Snapdragon X1E I noticed the
image is upside-down on my T14s Gen6. After some investigation
it looks like issues with the sensor driver have recently been
reported, but not yet been fixed. It seems sensible to do this
ASAP (while the driver is not yet used much) to avoid potential
regressions when changing the VFLIP default.

P.S.: I accidentally sent this from my private mail address first
and apparently the server address was listed by spamhaus.org (whole
subnet). It does not look like anything came through due to this,
so I'm resending as v1 from my kernel.org account. Sorry if anyone
received multiple copies now :)

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Sebastian Reichel (2):
      media: ov02c10: Fix default vertical flip
      media: ov02c10: Support hflip and vflip

 drivers/media/i2c/ov02c10.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250817-ov02c10-fix-c682031a454a

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


