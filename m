Return-Path: <linux-media+bounces-43785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626AFBBDF43
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 14:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CECF3BD441
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 12:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF9279327;
	Mon,  6 Oct 2025 12:04:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E2223DED
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759752283; cv=none; b=JKEMDdaD81XdzfYQoi1qmVLXuN7X+7VTbmZ6913INjFrrVvsLbj81wr4qTHA9ctoVLUjFWRzZBz5KrqinqctjZfEondg4FZhq08GECLJf2C84YnelVJoWiKUIoan54Q/6jNoyCbPP73ZYjAu6JPFMO/rCsYhFaBNidNN1CZTSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759752283; c=relaxed/simple;
	bh=09prn4YDz0tI7nPzbl1d9yvyu27bDW08Th6McNpbjYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QTQ8sBnsPxOrouTj3mQLRMfwncp0H65jUSi9qp7k4JAEjtND8ohdrMnbU8j4t3Uzll29Oc/MecLDqn8Xlo8B8Xhspk6a4DPXMWjTy69iw6p8op+ZDriQ4YlaLFMKu4JhkdSsnrKl+vpRXcf1Ukk4kwfzCog13NB3Rd7x5uCeMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cgH6m2VHHzPNl;
	Mon,  6 Oct 2025 13:27:12 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cgH6l3KlpzYkd;
	Mon,  6 Oct 2025 13:27:11 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 06 Oct 2025 13:27:00 +0200
Subject: [PATCH v4l-utils v2] README.md: couple of typo fixes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-readme-typo-v2-1-490d8fa7a4d3@cherry.de>
X-B4-Tracking: v=1; b=H4sIAIOn42gC/22NwQqDMBBEf0X23C1JMIo99T+Kh5Bs64JV2dhQk
 fx7Q849PmbmzQmRhCnCrTlBKHHkdSlgLg34yS0vQg6FwShj1aAsCrnwJtyPbUU9BN8722vnLJT
 FJvTkb7U9ILUzfnaeI4wlmjjuqxz1J+la+KtMGhW2pjOhdT501t/9RCLHNRCMOecf6kO4KrEAA
 AA=
X-Change-ID: 20250905-readme-typo-19dc7a571aa5
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

- Should be "mailing list" instead.
- Derivated isn't appropriate here and we should be saying derivative
  instead, c.f. https://www.debian.org/derivatives/.
- requiried has one too many i.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- squashed all patches into one,
- Link to v1: https://lore.kernel.org/r/20250905-readme-typo-v1-0-4262d4acd65c@cherry.de
---
 README.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 358960a78bcde62599fa572c33891d4a50a1dbcd..ccf286c2f0d75472990ca7a8fac17a0a828e1a55 100644
--- a/README.md
+++ b/README.md
@@ -9,9 +9,9 @@ You can always find the latest development v4l-utils in the git repo:
 Those utilities follow the latest Linux Kernel media API, as documented at:
 [http://linuxtv.org/downloads/v4l-dvb-apis/](http://linuxtv.org/downloads/v4l-dvb-apis/).
 
-Any questions/remarks/patches can be sent to the linux-media mailinglist. See
+Any questions/remarks/patches can be sent to the linux-media mailing list. See
 [https://linuxtv.org/lists.php](https://linuxtv.org/lists.php) for more
-information about the mailinglist.
+information about the mailing list.
 
 There is also a wiki page for the v4l-utils:
 [https://linuxtv.org/wiki/index.php/V4l-utils](https://linuxtv.org/wiki/index.php/V4l-utils).
@@ -23,7 +23,7 @@ v4l-utils uses the meson build system.
 A number of packages is required to fully build v4l-utils. The first step is to
 install those packages. The package names are different on each distro.
 
-On Debian and derivated distributions, you need to install the following
+On Debian and derivative distributions, you need to install the following
 packages with `apt-get` or `aptitude`:
 
 ```
@@ -38,7 +38,7 @@ On Fedora, the package list for a minimal install with `dnf` or `yum` is:
 gcc gcc-c++ gettext-devel git meson perl which
 ```
 
-(git is only requiried if you're cloning from the main git repository at
+(git is only required if you're cloning from the main git repository at
 linuxtv.org).
 
 And, to be able to compile it with all usual functionality with qt5, you'll need

---
base-commit: c12c89c5bd709c5340361ee76f7c3e37754dfe15
change-id: 20250905-readme-typo-19dc7a571aa5

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


