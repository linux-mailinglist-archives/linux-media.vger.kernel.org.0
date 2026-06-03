Return-Path: <linux-media+bounces-63680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JfFkCuqfIGq/5wAAu9opvQ
	(envelope-from <linux-media+bounces-63680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:43:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649763B6FF
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:43:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=odot.cl header.s=purelymail2 header.b=M6rC2hMw;
	dkim=pass header.d=purelymail.com header.s=purelymail2 header.b="fB/D35mo";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63680-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63680-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=odot.cl;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AF483047BF3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019174A2E2B;
	Wed,  3 Jun 2026 21:42:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1A492523
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 21:42:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522975; cv=none; b=oBx4xoRORnsZYgZY2ZdtA8IK1rlr7ONtcyLc/aU87RZroI/Osndlw88Fmn4kSz1oWYiidWirUJ3vpoaqymVr4nvIlkb+0XathCqoufsSPdgYec2pGOTc0vcY1E7wJ+pRG8UghJE1btDC0gfO+iTQFQoadA1/Ob7gaiXDYu1WrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522975; c=relaxed/simple;
	bh=k1zKYIIuHSJRlABKU97gdyWdljJU+2eWEIb9Vd8zT9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qKB17t69mKBkWybKs3RTeNYwuQZwVVolcAm4quilqg1FUDmY3nZ3sjVZI8YKjMJzBsnUy6a5EjrUR8T74Fqhl1vMwTY0zVUjvhp1pf1CaSqWwEazPJhN3ZHbuwI6GAtE4SF6EN5L/0Kl13Pdv/4xycsJ+rNZkXvSuDIwmjwRKho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=odot.cl; spf=pass smtp.mailfrom=odot.cl; dkim=pass (2048-bit key) header.d=odot.cl header.i=@odot.cl header.b=M6rC2hMw; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=fB/D35mo; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=M6rC2hMwx/vFpqKeABGjP+IWRByll8gAOeMUvTRsGSBAxId1i8k/V5v4x6OP73urtFpHoR4Yud75M/I3CJd9NFT1SXnpXiOlZxkNSC0M/Gs+wSnWsLgsgDM/zh7HlJ5abxjDdug8cxNDBLFqhpS0gO0J/etrLRopYyqh2A1dXhtfndy/uvVkBSX4x9fTYOVo7sH8tz4aicaX3iTnoXJ8iNVmEbXlZixRJexQuJjn9l9SwlsTSsaO8wLHLlHm0yrCNqAxRjEK42p96SGFkoD+yYz4Od64X+vuCSG4FvGmNJMmFAIxPzQETdHrcEKty4m+WsUnBjF1wHydPuhuLzZpRg==; s=purelymail2; d=odot.cl; v=1; bh=k1zKYIIuHSJRlABKU97gdyWdljJU+2eWEIb9Vd8zT9o=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=fB/D35moNtu5C/WxMyxAK/NrDKHQrXkfnZdknN0fgjtbQPUG0SCnoonLqFuAolJfgXoWCzF05MRF10OEtgoZqcoh2onknRSxdVRskw32PIKH0pIZjq2yMBG0FGW3GMbaoAntZupsxC3B9UjGpN1kFtZPNTJo/bvegDKPC+VqA2GZ4DLyAsjNnqCF4g17uba0q/umguDHEV2AWjH0xn0XXIIkmbM3rNIvZXEG/FEol6SdhuPNOBbxq6vHVwoC3z2jY/oQl/E8TQ6BwSBLk/61uCBN2UCd8NezyqTizdYM00vEaj0rndQ0FjAuZbgLiziv5s+MZh2YI9kaOyCjszsH0w==; s=purelymail2; d=purelymail.com; v=1; bh=k1zKYIIuHSJRlABKU97gdyWdljJU+2eWEIb9Vd8zT9o=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 809996:39420:null:purelymail
X-Pm-Original-To: linux-media@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1163224703;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 03 Jun 2026 21:42:46 +0000 (UTC)
From: "Reynaldo H. Verdejo Pinochet" <reynaldo@odot.cl>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	"Reynaldo H. Verdejo Pinochet" <rverdejo@arrl.net>
Subject: [dtv-scan-tables][PATCH 1/2] atsc: updated (US) Bay Area frequencies
Date: Wed,  3 Jun 2026 14:42:16 -0700
Message-ID: <20260603214217.303951-1-reynaldo@odot.cl>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[odot.cl,reject];
	R_DKIM_ALLOW(-0.20)[odot.cl:s=purelymail2,purelymail.com:s=purelymail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63680-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[reynaldo@odot.cl,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:rverdejo@arrl.net,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[reynaldo@odot.cl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[odot.cl:+,purelymail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,odot.cl:mid,odot.cl:from_mime,odot.cl:dkim,purelymail.com:dkim,samsung.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8649763B6FF

From: "Reynaldo H. Verdejo Pinochet" <rverdejo@arrl.net>

Use latest station data from the FCC and remove spectrum decommissioned in =
2020
---
 atsc/us-CA-Mountain-View | 87 +++++++------------------------------
 atsc/us-CA-SF-Bay-Area   | 93 ++++++++++++++++++++++++++++++++++------
 atsc/us-CA-San-Jose      | 79 ++++++++++------------------------
 3 files changed, 118 insertions(+), 141 deletions(-)

diff --git a/atsc/us-CA-Mountain-View b/atsc/us-CA-Mountain-View
index 892a5319..e23fb69d 100644
--- a/atsc/us-CA-Mountain-View
+++ b/atsc/us-CA-Mountain-View
@@ -1,27 +1,27 @@
 # Initial ATSC scan table for Mountain View, California.
 #
-# This file was prepared from official (as of August 1 2017) FCC data[1]
-# for CA 94043.
+# This file was prepared from official (as of May 28th, 2026) FCC data[1]
+# for CA 94041.
 #
 # [1] https://www.fcc.gov/media/engineering/dtvmaps
 #
-# Prepared by: Reynaldo H. Verdejo Pinochet <reynaldo@osg.samsung.com>
+# Prepared by: Reynaldo H. Verdejo Pinochet <rverdejo@arrl.net>
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 177000000
+=09FREQUENCY =3D 79000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 183000000
+=09FREQUENCY =3D 177000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 189000000
+=09FREQUENCY =3D 183000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
@@ -39,25 +39,25 @@
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 473000000
+=09FREQUENCY =3D 503000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 503000000
+=09FREQUENCY =3D 509000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 527000000
+=09FREQUENCY =3D 515000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 539000000
+=09FREQUENCY =3D 521000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
@@ -67,6 +67,12 @@
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 557000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
 =09FREQUENCY =3D 563000000
@@ -108,64 +114,3 @@
 =09FREQUENCY =3D 605000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 617000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 623000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 635000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 647000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 653000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 659000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 671000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 683000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 689000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 695000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
diff --git a/atsc/us-CA-SF-Bay-Area b/atsc/us-CA-SF-Bay-Area
index e48e6e22..e5d97ce0 100644
--- a/atsc/us-CA-SF-Bay-Area
+++ b/atsc/us-CA-SF-Bay-Area
@@ -1,5 +1,59 @@
-# initial tuning data for some frequencies of for the San Francisco Bay Ar=
ea
-# includes San Francisco, San Jose, Oakland...
+# Initial tuning data for the San Francisco Bay Area. Includes active stat=
ions
+# serving the populated areas around San Francisco, Oakland, San Jose and =
Gilroy
+#
+# This file was prepared from official (as of May 28th, 2026) FCC data[1]
+# for multiple ZIP codes, including 94107, 94040, 95112, 95020
+#
+# [1] https://www.fcc.gov/media/engineering/dtvmaps
+
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 79000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 177000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 183000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 189000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 195000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 201000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 207000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 213000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
@@ -9,73 +63,84 @@
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 551000000
+=09FREQUENCY =3D 509000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 563000000
+=09FREQUENCY =3D 515000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 593000000
+=09FREQUENCY =3D 521000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
+
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 539000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 623000000
+=09FREQUENCY =3D 545000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 635000000
+=09FREQUENCY =3D 551000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 647000000
+=09FREQUENCY =3D 557000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 659000000
+=09FREQUENCY =3D 563000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 683000000
+=09FREQUENCY =3D 569000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 689000000
+=09FREQUENCY =3D 575000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 701000000
+=09FREQUENCY =3D 581000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 725000000
+=09FREQUENCY =3D 587000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 731000000
+=09FREQUENCY =3D 593000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
+[CHANNEL]
+=09DELIVERY_SYSTEM =3D ATSC
+=09FREQUENCY =3D 605000000
+=09MODULATION =3D VSB/8
+=09INVERSION =3D AUTO
diff --git a/atsc/us-CA-San-Jose b/atsc/us-CA-San-Jose
index ff514b9c..89774994 100644
--- a/atsc/us-CA-San-Jose
+++ b/atsc/us-CA-San-Jose
@@ -1,161 +1,128 @@
 # Initial ATSC scan table for San Jose, California.
 #
-# This file was prepared from official (as of August 1 2017) FCC data[1]
-# for CA 950123, with an added entry for KAXT-CD which is broadcasting
-# in the area on UHF channel 42 but doesn't show up in the FCC database
-# search results for the ZIP code.
+# This file was prepared from official (as of May 28th, 2026) FCC data[1]
+# for CA 95112.
 #
 # [1] https://www.fcc.gov/media/engineering/dtvmaps
 #
-# Prepared by: Reynaldo H. Verdejo Pinochet <reynaldo@osg.samsung.com>
+# Prepared by: Reynaldo H. Verdejo Pinochet <rverdejo@arrl.net>
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 177000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 183000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 207000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 213000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 473000000
-=09MODULATION =3D VSB/8
-=09INVERSION =3D AUTO
-
-[CHANNEL]
-=09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 503000000
+=09FREQUENCY =3D 79000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 527000000
+=09FREQUENCY =3D 177000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 551000000
+=09FREQUENCY =3D 183000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 563000000
+=09FREQUENCY =3D 201000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 569000000
+=09FREQUENCY =3D 207000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 575000000
+=09FREQUENCY =3D 213000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 587000000
+=09FREQUENCY =3D 503000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 593000000
+=09FREQUENCY =3D 509000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 605000000
+=09FREQUENCY =3D 515000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 617000000
+=09FREQUENCY =3D 521000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 623000000
+=09FREQUENCY =3D 539000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 635000000
+=09FREQUENCY =3D 551000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 641000000
+=09FREQUENCY =3D 557000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 647000000
+=09FREQUENCY =3D 563000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 653000000
+=09FREQUENCY =3D 569000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 659000000
+=09FREQUENCY =3D 575000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 671000000
+=09FREQUENCY =3D 581000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 683000000
+=09FREQUENCY =3D 587000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 689000000
+=09FREQUENCY =3D 593000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
=20
 [CHANNEL]
 =09DELIVERY_SYSTEM =3D ATSC
-=09FREQUENCY =3D 695000000
+=09FREQUENCY =3D 605000000
 =09MODULATION =3D VSB/8
 =09INVERSION =3D AUTO
-
--=20
2.47.3


