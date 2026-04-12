Return-Path: <linux-media+bounces-58608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON3MDmSn22kSEwkAu9opvQ
	(envelope-from <linux-media+bounces-58608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 16:08:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43F3E4265
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 16:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A0203026751
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 14:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88659315793;
	Sun, 12 Apr 2026 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqHMnWZD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD82F5468
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002804; cv=none; b=pCcLa1dMrv4AmnUjTZx04FRxTUA0or6PPjVZ2RdotQ3VohvEY4ra79/RFMeIEyJ4wvxpZ5LS86XhLLEiMPdAJ0brtbw+NiFAMELwzBDjbmFkEI3RGGbH8DaZbqyKcvmAkxhNzRkyz6z0ZHyLHgKazBvCFZYqg1TyxOiC6/p1cDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002804; c=relaxed/simple;
	bh=qM6YJ53xNVzXG/PrBOuOXVikaLggFljOKKHluRxC+88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0YnCprKtp8fQoAFvK0GfCmlF0FC4gnMXljmBi3LPEYi5tDg0gCsnNjLbXVeoLoHKoNYI1n7telnNjhTiix2MB+kijQylW1pdk742Wkn3dCjT5ZMJSoyFRXtNW7uWQeffTbYcMPwVNjaRjvw6uScfMF45QZBxXvM0k7t858ZBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqHMnWZD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so2096932a91.2
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002801; x=1776607601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aYYlewohB0JAi3ANrfi9m34ZEoRc/crJvBD2FBn8Ras=;
        b=PqHMnWZDRdzI9Gdd7ztDALR5yw+axD15qnLxwpqwbG8phZp+Qq+8yT82LcZW0kFISO
         haA8NuLquu2L25xk5hIR0ooZbmw0DU47mfcCkINohWXIjReBTb2HhN/vB6kMWLxI9zQv
         K1DNW/hHgGbrJbB8EPUqJma5byXZltjAaGz3ckRGXo9ruci1xWX2i2+jck9QI9zsXMp+
         IHCRwKTnHWhLXyxG10N3oczDT9l9XmrUCCMMreDgRlYZ+aVq3AhdYiU3QPaXkouL4tTR
         M9RLawYRjX0pgwwFKz4ll9QKxtLOELdtGEcZWYKSMq/789k37fPNP0Cd1hf6ZM3uofP7
         PXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002801; x=1776607601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYYlewohB0JAi3ANrfi9m34ZEoRc/crJvBD2FBn8Ras=;
        b=XMg/OAWQca37/3NU5uhyhq5/N5Dy95Br9Et+vp96rwfkcrYjG3fSDW3t57tCmLMoC3
         ZvF2TXCTczcXMQqqCA//v47zgJHblGhpSltxh842OYKkdpQoKgNUUn+c0PinByHGGYsT
         UEHBokokqgQmiD+cWpvkGQ9gdbZmsjj/D3LAd61DVCTgyy6oDiEdo8zRjW410u1ObIaO
         ctsQXAnLr8xM1JjGdy7QAK2CfPIuUvLIVz0yx2sMx+QtlXCnmXHmjEcAAgOdYLIUNHva
         beOel5eQYlj7B8Fid2gOkk1D9gxgES0oJbWZNVblDesW5BIHDn35hHnhupTvSL133jGY
         oArA==
X-Forwarded-Encrypted: i=1; AFNElJ83Z1ciA6Kyccwxmps/u5HTee0dNYl/plAkUp5iMI6kzQUqcx5SmYYwHoVnzwBCshdNALWwxgQm46GTPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD9XIUt0Iyvkkqiq5piiNgEqKd8OJAEksBgbefpHE59yVTL69P
	J8bgQZswpORt1nCzvWVMUwcYpETNCKUw0NKYVE85gfQ17am5TgMD1W34lDvklA==
X-Gm-Gg: AeBDievnLxgyZ2XCz59JJju9ujgFsEqZ14Z/2031LKcHSkmaCYRwB73kQhiQWEWcWbH
	326+HUsjHzD5SLZE3b3Kdjd1uHl5TNCBRlzBT3kwTKP3ictoxPKfS43zX7nlU9n3VSmCMsW4zaO
	FrBqqPe+RTHiCfhYrSuSQllp3rqldocBCHcdnEQd5APCkHgGQGXzSqEf1//SKpWluhhgYW3r/DQ
	temVsUrnSDp5jw2w75lLwdb1i7G5qP+9OI9WcOPIvFaA80Ow7GRT/Hz1Tyzx7X1Ei1mfouYV8wH
	FYul7WEoUNKTeYECiBq1hcBIiNm5gVyggCU37bV/gkja3uz8Wc+6LBxgQrp7JERafSYy238qDpa
	7foAjVJUWbim59+RsSFAjU9sa/KhKFzj/v6vpp2wc7oDKwxtACaFhyhaBLhbhMyFXWccBMtEfx8
	zkQGSm4C6jWT5SXSiBPdyrUvbTvMw2LdtJib0iPCCxoOgEiLmS1Iyd73KNpBPeV7ICA9KcksWXk
	WRv9VE3gkLId5QdYxJmsqg=
X-Received: by 2002:a17:90b:4b90:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-35e4254fb08mr10777957a91.4.1776002801225;
        Sun, 12 Apr 2026 07:06:41 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45cbf0f87sm9362365ad.6.2026.04.12.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:06:39 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	shyamsunderreddypadira@gmail.com
Subject: [PATCH] staging: media: atomisp: remove outdated TODO comment
Date: Sun, 12 Apr 2026 19:35:41 +0530
Message-ID: <20260412140542.41911-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58608-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8F43F3E4265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove a TODO comment suggesting a filename change for
sw_event_global.h. The header is already consistently
used across the driver, making the comment obsolete.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 .../media/atomisp/pci/runtime/event/interface/ia_css_event.h    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h b/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
index d0c3278b0fd9..874331d8a435 100644
--- a/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
+++ b/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
@@ -8,7 +8,7 @@
 #define _IA_CSS_EVENT_H
 
 #include <type_support.h>
-#include "sw_event_global.h"    /*event macros.TODO : Change File Name..???*/
+#include "sw_event_global.h"    /*event macros.*/
 
 bool ia_css_event_encode(
     u8	*in,
-- 
2.43.0


