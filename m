Return-Path: <linux-media+bounces-56846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE9ZKs9rwmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:47:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 119D3306AF3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5C853123952
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF53D3E4C6A;
	Tue, 24 Mar 2026 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="jo5SdLNA"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BA2FC881;
	Tue, 24 Mar 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348928; cv=none; b=h51SruMZumydEj6DAdpqEERS2qJjqOMw+9uTwtnmdnfJuHxJXnFTNxrYwsPX+WJBqaPCc8lO4ikLEL2Npm2ogGZ4M7Exjp4n5SJ1T8FdDCquAJTx63qBmUNkwbbVqqI1KUyPRJUZY3MBhePC5jhkDMUql3qhhmJwOv/z7cH517Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348928; c=relaxed/simple;
	bh=LkYekURlHQ/xRWAUE37U+PfeGGBR1LGZc2y2icp3qWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iW4TAFSznKkLk0UQwlJOYoc7qsiWDje8T9DRf2m87a1T875jDikdIF6bvhiaZgeMm0mQt1mXujt6gakXGFls66xbfa+8/s3KACY/cLZrF7MDIChBx68zT6DBkbLUGVgid3d3LtIaBCZuYpk8jOPTCHCfc8qNDPVhF6V3NaAJhI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=jo5SdLNA; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZoLMhud2jqBOnRRgyr+4KjPNazRdiHOcLwP3PsaFso4=; b=jo5SdLNA0JgQJhrCTx//vVmifC
	kHYJQ/Dnmsu5WSKPSlQ8WAs6JXso62ULlUcCN0KIzrs1dDwyyHK4zmhwHCo8SEhusgLXHqbu+s3m1
	cmgSUg8blyVl2oEvnIGj9Txiao9DyKH4J4nr1Z57EyvZAABP7y5A8CdAIkXsWTfXVACo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zCy-00DIvK-Sw; Tue, 24 Mar 2026 11:42:01 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH v3 0/9] drivers: media: i2c: Omnivision OV08D10
 improvements
Date: Tue, 24 Mar 2026 11:41:34 +0100
Message-Id: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5qwmkC/02MwQ7CIBAFf6XhLAaWFllP/ofxUMpiOdgaaIim6
 b9Lm2g9zsubmVmiGCixczWzSDmkMA4F1KFiXd8Od+LBFWYgQAuAho9ZGCcFP1mJxtcI1tWsvJ+
 RfHhtpeutcB/SNMb3Fs5yXb8N/WtkyQXvVItSK20kqAs9PA3u2E5sbWTYPSVw96B4RnpjG4eIp
 v73lmX5ACDe1K/WAAAA
X-Change-ID: 20260225-ov08d10-7b198f492bd4
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56846-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:email,emfend.at:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 119D3306AF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series provides basic device tree support and handling for power
supplies, an optional reset, and the option to use a 24MHz input clock.

In addition to a few minor fixes, a major problem with the configuration of
the sensor modes has also been resolved.

The changes have been tested on an i.MX8MP platform. Originally, the sensor
was apparently only used with ACPI - unfortunately, I do not have such a
hardware setup available.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Changes in v3:
- List me as maintainer in bindings (Sakari)
- Added myself as reviewer (Sakari)
- Rebased 
- Link to v2: https://lore.kernel.org/r/20260309-ov08d10-v2-0-81f8b5d99984@emfend.at

Changes in v2:
- Drop 'YAML' in bindings commit message (Krzysztof)
- Use devm_reset_control_get_optional_exclusive() (Philipp)
- Separate commit to fix PM handling in probe (Sakari)
- Added two 'Fixes' tags
- Resort series to get fixes first
- Link to v1: https://lore.kernel.org/r/20260226-ov08d10-v1-0-c3a916368123@emfend.at

---
Matthias Fend (9):
      media: i2c: ov08d10: fix runtime PM handling in probe
      media: i2c: ov08d10: fix image vertical start setting
      media: i2c: ov08d10: remove duplicate register write
      media: i2c: ov08d10: fix some typos in comments
      media: i2c: ov08d10: add missing newline to prints
      dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor
      media: i2c: ov08d10: add support for binding via device tree
      media: i2c: ov08d10: add support for reset and power management
      media: i2c: ov08d10: add support for 24 MHz input clock

 .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/media/i2c/ov08d10.c                        | 246 ++++++++++++++++-----
 3 files changed, 298 insertions(+), 51 deletions(-)
---
base-commit: 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67
change-id: 20260225-ov08d10-7b198f492bd4

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


