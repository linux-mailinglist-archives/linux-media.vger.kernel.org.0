Return-Path: <linux-media+bounces-61171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIfXOOAuAmq/ogEAu9opvQ
	(envelope-from <linux-media+bounces-61171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:32:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DBE515268
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57233056962
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6A747CC96;
	Mon, 11 May 2026 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="wJSWrZfC"
X-Original-To: linux-media@vger.kernel.org
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE433C187;
	Mon, 11 May 2026 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527958; cv=none; b=m4zH/XyuCuIMBBI0/fUNH41RxDJC8OlPuiOJ4aNVkCGDjZ4LNOjEfaLQeODA4xIMAuaMg/jaoYGyA+LVJshaFzS9gtcaW4A0JVKM16baoxYfxOPKGYpfSnenkDYKlIaQrRIEuTfwJcDjhCHYXJ2h0sheJLDX7+gyXe5hqNBpKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527958; c=relaxed/simple;
	bh=8fdBCbSnUqBhjbTn9UOWJoQwuXgVe/OWWz35TXe/r+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjWYyOe0mCfYqXFOdX7JAWVD/EPgoHR1re/ITaJBxNNV20utSdCVHg4SiKfhj83Qjp2SmpAU0NL+lBOeBey60rZkewmfbGwdudpdD7nIZzEWiflS1EZwoziLtidVtD0RAEsSH94Wt+4OPVl1C+9bpRN2yqbPOf17BwzZQlEMG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=wJSWrZfC; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Received: from mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:290e:0:640:f317:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 12D7F80549;
	Mon, 11 May 2026 22:32:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (smtp) with ESMTPSA id MWPPbLwRCOs0-UptC5NAt;
	Mon, 11 May 2026 22:32:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noirlang.tr; s=mail;
	t=1778527947; bh=54dvJyhuyWvLVSda8b3M+wY9FY7C0JLI3aCVMez42Ek=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=wJSWrZfCXh+BiSbSpXRK5YKUI0BcmxaYCM6Rv0HvjkPYqJP6FBkbV85+ncgF3wav0
	 2Uu7ppzSGcDjt7G6hk5OveSLmCiEyjPx9aBzHzXy5d+FalNspVO3O2LtBmzurn4TsP
	 qmm9QysF4+/P14bWwWpzt55CWazYYKQdwX+KHPB4=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net; dkim=pass header.i=@noirlang.tr
From: Melih Emik <melihemik@noirlang.tr>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Melih Emik <melihemik@noirlang.tr>
Subject: [PATCH] atomisp: remove unused module parameter dbg_func
Date: Mon, 11 May 2026 22:32:22 +0300
Message-ID: <20260511193222.49582-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 59DBE515268
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[noirlang.tr:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[noirlang.tr:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61171-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[noirlang.tr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[melihemik@noirlang.tr,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,noirlang.tr:email,noirlang.tr:mid,noirlang.tr:dkim]
X-Rspamd-Action: no action

atomisp_v4l2.c declared dbg_func as a module parameter to expose the
CSS debug print switch at module load time.

dbg_func remains as internal state for the CSS print environment, but
no code depends on the module parameter registration. After this removal,
git grep only finds the internal variable users and no module_param() or
MODULE_PARM_DESC() entry for dbg_func.

Remove the obsolete parameter while leaving the existing default debug
print state unchanged.

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..2d19582ee7c5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -50,9 +50,6 @@ MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
 
 /* log function switch */
 int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
 
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
-- 
2.54.0


