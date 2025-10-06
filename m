Return-Path: <linux-media+bounces-43784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFCBBDEDA
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DCE71896AF8
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 11:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E023271467;
	Mon,  6 Oct 2025 11:54:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0A34BA3A
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751683; cv=none; b=ic9lOgpiDFn5Q6+YBvsPf6sJYk9v7PUrvD0IH9S+Tr6qSRtpks3H4nS/fbJ6c27MHNhotOe25hA0N4CjhOm4wCXUm6yHQ1QQwroQHIyMPLoGuKu5qUTODKrzFOmegUKvirjhjgnl8bUlNL4ax7XyU7QhJ/J6TsQ+aohW9U1hXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751683; c=relaxed/simple;
	bh=7JwuJHmooGkGQ2af+dVcBZq4/J7I7lAME38iKxbbnyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OFZ/DJt/CQojGmTpOAcZB4F/ffHOGxYQF8pbYD7JtqcS8VCLOQXlEYuqSwGEAIPc96Yn1/Qo9t6W077ppmyd0hPtXqm0FF8ZS8GMjQkuX3BklaGUhhlk5N+T+fn7xNifSXV3IWdMORUymYixGUszJ9EwloYuyD7UbRTtCoCQhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cgHZ21hmxzX4y;
	Mon,  6 Oct 2025 13:47:22 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cgHZ15ztyzcVG;
	Mon,  6 Oct 2025 13:47:21 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 06 Oct 2025 13:47:10 +0200
Subject: [PATCH v4l-utils v2] add basic b4 config file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-b4-v2-1-4c348971ff3f@cherry.de>
X-B4-Tracking: v=1; b=H4sIAD2s42gC/02MQQrDIBAAvxL2XItaI2lP/UfJweraLISkrKk0B
 P9e8dTjMMMckJAJE9y6AxgzJVqXCvrUgZ/c8kJBoTJoqXt5lb14GqFwUBdjrIvOQA3fjJG+bfK
 AbGbx2WhOMFY1UdpW3ts+qxb8n7ISSmgfvLYqhsGGu5+QeT8HhLGU8gMAScm/nwAAAA==
X-Change-ID: 20250905-b4-1e813446afa4
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the Cc recipients
to always add, in our case the mailing list.

This shouldn't be necessary if we had a script that b4 prep --auto-to-cc
could call to find the mail address(es) to send to (cc), à-la
scripts/get_maintainer.pl from the kernel tree.

This allows us to not have to look for the mailing list to send the
patches to, just use b4 and you're all set.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- added send-prefixes = v4l-utils,
- switched mailing from To recipient to Cc recipient,
- Link to v1: https://lore.kernel.org/r/20250905-b4-v1-1-2cdc261fd86d@cherry.de
---
 .b4-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000000000000000000000000000000000000..c0bd244cf59b1eb2f46db683380be9f6a6c1ca34
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-cc = linux-media@vger.kernel.org
+  send-prefixes = v4l-utils

---
base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
change-id: 20250905-b4-1e813446afa4

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


