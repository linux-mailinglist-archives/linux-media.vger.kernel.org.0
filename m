Return-Path: <linux-media+bounces-41845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128AFB45864
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 15:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AE43B53FF
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 13:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0279818A6B0;
	Fri,  5 Sep 2025 13:05:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29308219EB
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757077517; cv=none; b=JKbpw3hF30R1skD/WqS7cJVZacVqccI8i/4qN2EGgxRzfIVZKBAxWF267y86MP5a0lxEY2ML6C/i2/QghEpyAWVTn0LUrIzkLaeNOQlciMQu8l7wb/uGp2K83Jl8ZWMNoPW9wnhSYIwxjTnP0IzsgbXI2C2rRwirWGH3z0wz4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757077517; c=relaxed/simple;
	bh=WiM8j/bfQ90GVYkiebQPiCnykLhAM4/XnoYh3xbTqDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E7jAbvWYCqVHuBChCBl1hmoBo0wRmScXEuZDuosGOY/nWUlTe8gA8cPPw98dbm5tePa1iL6AI140hKX9jppLY6b0IraiL/ge4VKQLow8BjTz8iQIJ6m0cLKdE/eqEcyCZzLeBYJfdqDOeVDrx+UUDMgs9OoRVF7J76Htvg5SM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJFzM53SQzcKC;
	Fri,  5 Sep 2025 14:29:51 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJFzM1yL7zgG7;
	Fri,  5 Sep 2025 14:29:51 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:29:42 +0200
Subject: [PATCH] add basic b4 config file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250905-b4-v1-1-2cdc261fd86d@cherry.de>
X-B4-Tracking: v=1; b=H4sIALXXumgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNT3SQTXcNUC0NjExOzxLREEyWgwoKi1LTMCrAh0bG1tQAiTO4xVAA
 AAA==
X-Change-ID: 20250905-b4-1e813446afa4
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the To recipients
to always add, in our case the mailing list.

This shouldn't be necessary if we had a script that b4 prep --auto-to-cc
could call to find the mail address(es) to send to, à-la
scripts/get_maintainer.pl from the kernel tree.

This allows us to not have to look for the mailing list to send the
patches to, just use b4 and you're all set.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Since that ML is also used for other repos than v4l-utils and I've seen
a few people using [v4l-utils] as prefixes, should we add

send-prefixes = v4l-utils

to the config file as well?
---
 .b4-config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000000000000000000000000000000000..31873a088f0b32c174363f8b56a54a976b87fb17
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,2 @@
+[b4]
+  send-series-to = linux-media@vger.kernel.org

---
base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
change-id: 20250905-b4-1e813446afa4

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


