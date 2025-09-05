Return-Path: <linux-media+bounces-41839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D066B457F2
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFE651C87F53
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D16E32A3F9;
	Fri,  5 Sep 2025 12:38:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACA019E7F8
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075915; cv=none; b=ks0zgDgPKk9W6GkUfKuEkcv+fnaJP+S6aHgjCKmPPTaNzXo8t/p1il9hPYEOiMOdLT3xKj282N8fZ3PUm6F4rWi968N8VgyEDpRmkR2ATbG9sDDzR0YX3olZnc4vywDu3pR7O7/3FRnYM1CL2dUxSgbC6Mt048MO5pjPW2Daj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075915; c=relaxed/simple;
	bh=C4Rce7a8cOJHrvGcslr+XIBdy0ab9aJhA3cPeVEok7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovQEzSdb+XiOsXUtlhniIa1jvDj8u19H9VjamsennbWeOorPLbR38KsaTZkPxgtHtDGpCBZS/rKfXggOtzeN6vxmxVHMSHepMEYz6qqF5J3obt1V/zHw9VSHpe6O/51/aCQLruADoErfxZkeLru0mIAoac53IlLJXmZGIxge5vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=83.166.143.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJG9M4jyyzlY6;
	Fri,  5 Sep 2025 14:38:31 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJG9M28PpzZC8;
	Fri,  5 Sep 2025 14:38:31 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:38:13 +0200
Subject: [PATCH 1/3] README.md: fix mailinglist typo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-readme-typo-v1-1-4262d4acd65c@cherry.de>
References: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
In-Reply-To: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
To: linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

Should be "mailing list" instead.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 358960a78bcde62599fa572c33891d4a50a1dbcd..58bfa0fa55d1acfeaa6cdf6eaf7adb0226ede8f8 100644
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

-- 
2.51.0


