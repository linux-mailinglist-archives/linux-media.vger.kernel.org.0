Return-Path: <linux-media+bounces-57145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGVXMJEsxWnb7gQAu9opvQ
	(envelope-from <linux-media+bounces-57145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:54:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3793358BF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7474A30D37AD
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 12:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4D92264B0;
	Thu, 26 Mar 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="ZJN6pI1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C120C00A
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529358; cv=none; b=KPpMaWjpunPkbvgEBkHAbwo23XwjjIRUc7n57/0BNEm4WWnWrj0KP7DoXutxSIcZ8ApZiiiTxI98PEIjTNtTySZyLExk5blJ7j19/bYtTdN5+n02mjpeQ0Kzbu1eK5YE+Lo2Eus4Qz/ofWQypCIz8+yWZEj7Qgscn2N6utLHRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529358; c=relaxed/simple;
	bh=aVfuc87s+3tTh39ekcM1L1w9/FXcabcGAARleuArD/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN6em6DzoI+H8KrFiEplV55GA2GQRMrAzWInQxlO+gF0SdK05kFJHjMKiZ/2bZFBmPpc+HrjVsABAuLpPApW+edoRhR/EQSeO22xxy5jQABrQ6VmKCAOhtCu2Mus7rc8/1X/CucRXKD+vgJ6W+0wAb4mkBO7gCJA4mTLrMyFkX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=ZJN6pI1I; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab077e3f32so4189015ad.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1774529356; x=1775134156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34esKa+/ZAh+VB3rUa61ACVsxyshrpKBk7ePNh+3M/Y=;
        b=ZJN6pI1I8p0DnpBOR3QVHfisKtce4YTrbYv37XAxPn5OsF/HKgrC6D64KuzZ5hpk1Q
         23Cxmkkg1TN1Li5XC1bqUBuoJVndO3yLhb1BwdWAqi3pDF2BKHhWwpbaKy3t6ipzpbGs
         FaPsc7RMr/u0Vf7yRWtdOHyLl+NLa3j/3zaC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529356; x=1775134156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34esKa+/ZAh+VB3rUa61ACVsxyshrpKBk7ePNh+3M/Y=;
        b=dUYyteIFM2gRwNG4cUNcr9a/YKFQpGvYQpdQv6SvZEpviijtO9JOfIr/mgtu0Q5pQs
         uAFiYVgC6MlJM+xMTPNFELB2Dc3JlrTauS9/wL9rkHc+o5STUkjGrcRaJFDlLPIwRdqU
         vGMmSVTuJ5luwCqK1e9ZkO4HSRE/fDRc/mdSq7UrXTmA40kiOk5GlJb09EGE2388dYgv
         rGi8Orwyn//R7zp3DrnYtdI1djg6GB1eCzySYBLShMChFYwyKeRg22flq4QBx2a3qoBd
         5HEM/yrokn0yBcAsY7YCBxfB/3Egd7LIPWk2asSWUNMdn956rULKjunbqHRlySS/m6et
         ZLnA==
X-Forwarded-Encrypted: i=1; AJvYcCX3eEMIjT8M+bbbhLtwTXbfA1SYr3FWjpx5HsUNssz8o4YdJWVi0Vfi5wApnNKN9lTt4KzXYVLgddRF1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJ8vmznjXVAZZs/Vga0ItSd9K7cM+JRqrSxcGV8yIX/Al4VtI
	Q0aJScdpYGSTcQAIWKBtMfw+xdf3PRBpm7jNxmgPmktoJfuWYca53dvORDCJdGYnwBA=
X-Gm-Gg: ATEYQzyn5N/YxRBkRPpInTYnJChNAVbi+7n0lCEUUSYNtoTiEWlKMOUEupuaS17s55B
	yLTzHAto7Odui8uoMqIwhWFNuBQ5/HGyFsHIlPmNIgJc/18YNInDB2ISrmZDFYz3dvMWMIYShov
	trbcqxvXGUq2AjFdUO402AOEmFsGs+cgV5q7+Tw1MtzotsPujnAUCjW/OfebpmxZmbEubH/8ryC
	CmNqIKhQUkjlTotfJjUh05lvOfrs7BLAv+bq4EtmS7PNUD20G/je1EFompxdHtz2oTbJ+lWenC/
	//aazZ9jSbWZCTImVM81bXvqL0rXMqmDPtfISgIE2p2fVWixrFDyVump/ZbnLDsiHYReGDWpa3B
	hCWNxjFdOtOGQg95hZX/1xwci0+QitHAm5LTjl7ncmnTtC3paNxCCj8a51B40E9i0zL/IhUz0gn
	x5a0Gmk9cz37czHvwWvlYwSXUTdepiXjqD/LkA7xvtcCVTPSio6aTQ8tPXKIkwkT1MryWc8Ppjz
	3X5hBFghmg=
X-Received: by 2002:a17:902:d4d2:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2b0b09d10femr87103265ad.12.1774529355762;
        Thu, 26 Mar 2026 05:49:15 -0700 (PDT)
Received: from kinako.work.home.arpa (p1860061-ipxg00f01sizuokaden.shizuoka.ocn.ne.jp. [180.1.24.61])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm36110155ad.26.2026.03.26.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:49:15 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] media: i2c: tc358746: Add dependency on COMMON_CLK
Date: Thu, 26 Mar 2026 21:49:07 +0900
Message-ID: <20260326124907.2659948-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[thingy.jp:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[thingy.jp];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57145-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@thingy.jp,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[thingy.jp:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 3B3793358BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver is internally using bits common clk bits to model a
clock it manages but doesn't depend on COMMON_CLK so can
still be built when it isn't available and then cause linking
to fail.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603260904.0mYHPZwr-lkp@intel.com/
Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87a..27c307be6f9b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1343,6 +1343,7 @@ config VIDEO_TC358743_CEC
 config VIDEO_TC358746
 	tristate "Toshiba TC358746 parallel-CSI2 bridge"
 	depends on VIDEO_DEV && PM && I2C
+	depends on COMMON_CLK
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
-- 
2.51.0


