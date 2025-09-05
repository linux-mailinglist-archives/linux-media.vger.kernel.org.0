Return-Path: <linux-media+bounces-41842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60687B45810
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BAA1C2244C
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8D535083F;
	Fri,  5 Sep 2025 12:45:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5341734F492
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076314; cv=none; b=R7Sf9iEXu3Lhg6iE0zXkzftmX8XWIVbs5SKuXJPN55W8pMEKj8za+NxD2RNSTxtPEi/AUPT8dL/NaZftMctWSjr8MObsajmqN7Mnu8ElvGpPgSqMKZVJLhvjLtk7Avlib+VhHhaTz15G5tvZfHhImgepWKlFky/jVVkFKYeZku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076314; c=relaxed/simple;
	bh=85wxTxyt9lLumvUYwvdFPNnT1E5XE9EMGT6PKgzqUac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X55DufgKGl+ASfxsxsvuTncKzRZmOxD8YgzDExlJEAulwl5JN59aYQc8CDbqqRSODGHQ+hiyTywjoxs/+j0rjZdp8Ge4VvA5DdUWtskarrkuPBldd59KTBwe9Mnv42uerPoV3kbmSQAd+55eKib/s0ohVmewUekBYI/eRjXqZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJG9N0hJxzm35;
	Fri,  5 Sep 2025 14:38:32 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJG9M4cRWzXl5;
	Fri,  5 Sep 2025 14:38:31 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:38:14 +0200
Subject: [PATCH 2/3] README.md: fix derivated typo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-readme-typo-v1-2-4262d4acd65c@cherry.de>
References: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
In-Reply-To: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Derivated isn't appropriate here and we should be saying derivative
instead, c.f. https://www.debian.org/derivatives/.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 58bfa0fa55d1acfeaa6cdf6eaf7adb0226ede8f8..741cea5052f34c4319b64dec04b81fc05dc2a232 100644
--- a/README.md
+++ b/README.md
@@ -23,7 +23,7 @@ v4l-utils uses the meson build system.
 A number of packages is required to fully build v4l-utils. The first step is to
 install those packages. The package names are different on each distro.
 
-On Debian and derivated distributions, you need to install the following
+On Debian and derivative distributions, you need to install the following
 packages with `apt-get` or `aptitude`:
 
 ```

-- 
2.51.0


