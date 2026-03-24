Return-Path: <linux-media+bounces-56925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG6JOT8Nw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:16:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9131D384
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D82B93089DF8
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88C73C7DFD;
	Tue, 24 Mar 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKwMqnVV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A63A7584;
	Tue, 24 Mar 2026 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390502; cv=none; b=HmVhcs3mrnsB+lw7m2KO9EQU2QhOWOAjcOhHZsnjEhhaIaGKB6EoKWVw6SuZaczuoWFprxbEoslyKoDR3OCvBQRf7Ya/gIkuC0+DaCWVvL1cPobp5Gv9EV1iWEB92z9DSuPVtcKJWAA/U+Br/qi+qMMPYvXcmTv2yiLI0sWu8DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390502; c=relaxed/simple;
	bh=6M+XUCcxZWilfRRqN6XK5hJIeS+gRK3D84YRPNc1+qA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KMWhWm+yNr0Mh2YVzPsGAGdp/AB3whFIOObgMSoiD4auTpz1Z0ATisMfYv4q7uLobzPlX2E8AUhkBJgLENorYCE6dZCdiUv0YNNybrsgxo9NtqYzyTvzcFkCTy3dZnuaba1/KxuvLyayZSVlxDPgdmSb1G5aQvmvXR4EPAXX2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKwMqnVV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDA6DC19424;
	Tue, 24 Mar 2026 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774390501;
	bh=6M+XUCcxZWilfRRqN6XK5hJIeS+gRK3D84YRPNc1+qA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VKwMqnVVHjuFUF2BWRuRx2Pah0UdzUUx5O2DslvPo+YeDZdYvefCv7v2uosRFeK1e
	 nDocPUpZ251pao9edzT6tK0DZruvcods4HjSln2EFpqzGLCKTzc+Mh9qNiwV6tiFGV
	 jLlki4djqg6vBnGIS+Z18kyStEaitqn1oFKvBQsbeSXsAigXGQLC9C+OD3pK6BOijw
	 mUxwPMesokP2vuwz63vhkf2jxr+YneIMPYoetCbI4LDaRfQr6h9xFkplTYUfMbIdBV
	 j/hwnzxdaI9VY65m0Y+D0bisNCL1G3PCWZr49UArlEhNqFIxQOknVN+3AxEtadU/Jp
	 qF+IYN9Quq5QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B464DFEC104;
	Tue, 24 Mar 2026 22:15:01 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Subject: [PATCH v4 0/3] media: i2c: lc898217xc: initial driver
Date: Wed, 25 Mar 2026 01:14:58 +0300
Message-Id: <20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOMMw2kC/53NTQrCMBCG4atI1o4kk6Y/rryHuIjJpA7UVFIJi
 vTuRgU3uhCX3zA8701MlJgmsV7cRKLME4+xjGq5EO5gY0/AvmyBEo1EbOBIni0wOhhc27Womos
 DjnxmO4BPnCmBb/ZGWqWNIyOKdEoU+PKsbHdlH3g6j+n6jGb1uL58Lauf/KxAAmEIHvcYvKHN0
 XIcylfsV2PqxSOS8Q8YC1zbqtaOgibbfoX1G1Yo1W+wLnBVE+q2a6hD9QHP83wHhm6pk40BAAA
 =
X-Change-ID: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=6M+XUCcxZWilfRRqN6XK5hJIeS+gRK3D84YRPNc1+qA=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJmHeZ5YmeZH6l5mzH5gwl+5x+1wp/VpDoWnmxkPpQdz6
 EzemunTUcrCIMbFICumyNL9/vC9B/N4WUvVP/HCzGFlAhnCwMUpABNpMmRkaN+25FKKdOZZaYYG
 oZsBtgu5vzH4JmbYJavfFLWKCbz8neGvRHdOf1LRNMY2bvvHre9nLj16RP9a5vHkorfCE/1nn6x
 nAQA=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=8BEFC3DEE09E0D057527F20D33767582D18AEA97
X-Endpoint-Received: by B4 Relay for nekocwd@mainlining.org/default with
 auth_id=692
X-Original-From: Vasiliy Doylov <nekocwd@mainlining.org>
Reply-To: nekocwd@mainlining.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56925-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mainlining.org,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[nekocwd@mainlining.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:replyto,mainlining.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: 65A9131D384
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

LX898217XC is a 11 bit DAC, designed for linear control
of voice coil motor. This driver creates a V4L2 subdevice
and provides control to set the desired focus.

Tested on Oneplus 6 (oneplus-enchilada)

Co-developed-by: Vitalii Skorkin <nikroks@mainlining.org>
Signed-off-by: Vitalii Skorkin <nikroks@mainlining.org>
Co-developed-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
Changes in v4:
- Removed unused focus ctrl (Dave)
- Added ctrl state restore on runtime_resume (Dave)
- Removed subscribe/unsubscribe event handlers (Dave)
- Removed V4L2_SUBDEV_FL_HAS_EVENTS flag (Dave)
- Changed supplies from vcc to vdd + vana
- Fixed free and PM issues on probe fail
- Fixed typo in devicetree documentation
- Link to v3: https://lore.kernel.org/r/20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org

Changes in v3:
- Fixed MAINTAINERS (Krzysztof)
- Reordered commits (Krzysztof)
- Removed blank line from device-tree documentation (Krzysztof)
- Refactored to use CCI regmap
- Refactored to use dev_err_probe in probe
- Link to v2: https://lore.kernel.org/all/20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org/

Changes in v2:
- PM functions annotated as __maybe_unused.
- Fixed dt bindings documentation commit message
- Added v4l2 events (now v4l2-compliance shows no failed tests)
- Link to v1: https://lore.kernel.org/r/20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org

---
Vasiliy Doylov (3):
      media: dt-bindings: Add LC898217XC documentation
      media: i2c: Add driver for LC898217XC VCM
      MAINTAINERS: Add entry for Onsemi LC898217XC lens voice coil driver

 .../bindings/media/i2c/onnn,lc898217xc.yaml        |  59 +++++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |   9 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/lc898217xc.c                     | 289 +++++++++++++++++++++
 5 files changed, 365 insertions(+)
---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5

Best regards,
--  
Vasiliy Doylov <nekocwd@mainlining.org>



