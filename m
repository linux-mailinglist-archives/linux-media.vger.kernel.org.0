Return-Path: <linux-media+bounces-58586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K3pGoxJ2mnWzggAu9opvQ
	(envelope-from <linux-media+bounces-58586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:15:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C42663E0176
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9808B300EF78
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852C926ED3A;
	Sat, 11 Apr 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKfzH81O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E751FE451;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913193; cv=none; b=UfbbinR3gFjI4IYTxi67/C9iXCbNiGCs6yNEUkC7oMvvlrafiiUN40bd5m0DICpnWuJgMehpw+79iXGqAjIFvUZfFnDis2XRAkYKBfe6ArkWPN13I+48LwbyMM4T12R8ny+PdH/4J6Y18mAlVA4eIzy4TlJBoL45og2tWBVLABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913193; c=relaxed/simple;
	bh=0ds83WmivfB0Z0vMYXoVl6+7L+6qOV31Rk1YvAQhjqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMSWdpZ3chjJ3g61JbIycg2Oji6nd6oan5dpS+P1hSd0lVl0kHeqdhzxQv7B+Ph3+n9+/624AHAEYFyYonYvFgGnuhlOlpXJjZVS7jXNNJGbOC04RsjymwB6wICzlB8eaT9tdaz8n3FWss35XdrE9TjKgt7WopUvvaRozlJiE5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKfzH81O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 857D7C4CEF7;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913193;
	bh=0ds83WmivfB0Z0vMYXoVl6+7L+6qOV31Rk1YvAQhjqk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AKfzH81OpM99/I2fYGSMgFiKXTRoZiOvRnYbYAGyx+iLQbiqgnpbXP6fD1YBLrRXe
	 g+5wR4Qo3iqcEOTl9hfKiE1YoH5iiZLZWGdiyKmxfGM9AtFuyDFaKCN6CtFOFic5I0
	 fzbUnCKs6yhm7fmLN0RpbQTmU/Ls0XCLOn52jHiP5lKZDH8R70tTQusLZ24BSzzZ1I
	 j/+j/PA0D12GhVd6rd0sHA70xVguGpzbFPHb5PsFFGZRMJu09e1igCmNidGI+2p7wN
	 SCPpd3WcZvEO88JYPveHnFzO+HC079QSLi/wfWwYibMLQwDWr02uTbBFpAEMwX7hae
	 qZS+1d5leYQBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74112F3ED40;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Subject: [PATCH v5 0/3] media: i2c: lc898217xc: initial driver
Date: Sat, 11 Apr 2026 16:13:07 +0300
Message-Id: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONI2mkC/53QTWrDMBAF4KsErasijf7srnqPkoUijZwBRw5yE
 CnBd4/i0q68MF2+YfjeMA82YyGc2cfhwQpWmmnKLZi3AwtnnwfkFFtmIMAIAMcvGMlzgsDH0PU
 dSHcPnDLdyI88FqpYeHQnI7xUJqBhTboWTHRfW76OLZ9pvk3ley2t8jX98ZXQu/wqueAIKUU4Q
 YoGPy+e8ti28vA+lYG9Sir8A4YGW6+tCpgU+m4TVn+wBCH3warB2iKornfYg9yE9S9shQKzD9b
 rxdGm6HQvN16xLMsTgRUQM+YBAAA=
X-Change-ID: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=0ds83WmivfB0Z0vMYXoVl6+7L+6qOV31Rk1YvAQhjqk=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJm3PF54V6dOsWWbcPTD3nWRL8RmNhc/fcK8yWGGdr69Q
 ULJ22OzO0pZGMS4GGTFFFm63x++92AeL2up+idemDmsTCBDGLg4BWAiF9cw/BU8pX+4RmLvujtn
 uWoUV7/ffzY5JPPmhFahjXWhL16/ZA5mZFijPfExC1vZvs3fuqVLPq+eczt5tUOPv7ZN2KxVsfu
 XVbADAA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58586-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mainlining.org,protonmail.com,kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[nekocwd@mainlining.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:replyto,mainlining.org:mid,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C42663E0176
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
Changes in v5:
- Add Reviewed-by tag (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260325-media-i2c-lc898217xc-initial-driver-v4-0-6ad6fd74915e@mainlining.org

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
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5

Best regards,
--  
Vasiliy Doylov <nekocwd@mainlining.org>



