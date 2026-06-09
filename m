Return-Path: <linux-media+bounces-64326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nCYNK2xKKGrABgMAu9opvQ
	(envelope-from <linux-media+bounces-64326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:16:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F3662D54
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:16:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a4kH32iF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64326-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64326-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6A4C302F421
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 17:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514614BCABB;
	Tue,  9 Jun 2026 17:11:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838764BC002;
	Tue,  9 Jun 2026 17:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025087; cv=none; b=dXHYPZAtAS+6PbctC4179js72w7a0Z/M3XfSoNNMrAyzj1YfKTYm90beEaEf0jcAt65QNYOm1Rve8yQhnw7cg0FphZ4RXEOjw8/AZLV23G6p/OTMp5kQgvFIFhzYP2L6dVGF2x1jDo3cKys8+2QbKnLVdmp5Urer5lY6pTWkAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025087; c=relaxed/simple;
	bh=BzLLIM23M2A1UoG7u/RhKM9xyYs5pfGf/s4pqyRUtvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lGa9WEw799AqWR1i7bGPxGJrF6beoaOtsq51ubHyNQF0IH89D6rxtlAV4zdin6ENxBwzNd7wlrhUNh/Xuf/G/cKnrWMUrMu+Kv89yiwiF6kc/wDFjiNlgqfh7eDYc2NelnpBjGZnHhAhpX8Fo6yn0lkiMl/nLxUCVJA8tgVbCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4kH32iF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E20E1F00893;
	Tue,  9 Jun 2026 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781025084;
	bh=8eDv60t59fij6+u3viH7XuZxXWmRapj5ScjYDalAZhI=;
	h=From:Date:Subject:To:Cc;
	b=a4kH32iFFZYBJ014WIRfA//0+3vbUCOXveTw2D8JHePmOxP9aTw8l0YT3ysWmv1Fe
	 wbFEakxFIMKwZHJGw7nT0SLFU9PhtcDRaILcY6/rZgwXhjU0VrisDWrYElSo5SqPF/
	 h7DgAr7Y2yzDPWatt5DABP0GBE5EoBbf/ncE0yGkIgP3vnXUCVYYMvbMHL14/sTIWn
	 3YBfy96ew7blLPaMLMgFGMpvWipNdtUwxlYq6Xr0yY/1B6auzWuNF097zmMAvBxX2V
	 FzTdEmGXvw54rsCCiXCdjv1OCc7d8k4keYi72hG13FfKD84rClgCkZpuOjxA+lwlHd
	 lJJxOeMv3igPA==
From: Eugen Hristev <ehristev@kernel.org>
Date: Tue, 09 Jun 2026 20:05:23 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix asc leaked in error/remove path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
X-B4-Tracking: v=1; b=H4sIANJHKGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNL3aTk3ILM5JzUxDxdM8tEi9RUY0NLoyQDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAIgU7h9uAAAA
X-Change-ID: 20260609-bcmpiclean-69a8ee3192b0
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Naushir Patuck <naush@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=BzLLIM23M2A1UoG7u/RhKM9xyYs5pfGf/s4pqyRUtvk=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLI0PE3bqvuLAtnk7P21OB33B7Q5V9uKuMxbZV/9PpX33
 G3X+3wdpSwMYlwMsmKKLNUm/2qF+3e4n3S1VIGZw8oEMoSBi1MAJiJ4nOGfoUpuLJf12fZds/6F
 CL0oz0vdGHe1yyc7sMZGdr3Bsrxchn9W7//5vN0zMbJwHrPGyf9yx0/91Ek5yPVaMrTDcOemV62
 8AA==
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:hverkuil@kernel.org,m:naush@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:jeanmichel.hautbois@yoseli.org,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ehristev@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-64326-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 425F3662D54

v4l2_async_nf_add_fwnode_remote() allocates the asc, which is freed when
v4l2_async_nf_cleanup() is called.

Call v4l2_async_nf_cleanup() properly in the driver paths.

Discovered with kmemleak after rmmod:

unreferenced object 0xffff000084526b80 (size 64):
  comm "modprobe", pid 185, jiffies 4295013512
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 e8 0d ff bf 00 00 ff ff  ................
    40 83 bc 84 00 00 ff ff 60 83 bc 84 00 00 ff ff  @.......`.......
  backtrace (crc ac584083):
    [<00000000ffb081a7>] kmemleak_alloc+0x38/0x44
    [<00000000d2fd9301>] __kmalloc+0x1b0/0x250
    [<000000004dd5354d>] __v4l2_async_nf_add_fwnode+0x28/0x9c
    [<0000000067587657>] __v4l2_async_nf_add_fwnode_remote+0x3c/0x64

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..1508843ae58c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2613,6 +2613,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 	return 0;
 
 error:
+	v4l2_async_nf_cleanup(&unicam->notifier);
 	fwnode_handle_put(ep_handle);
 	return ret;
 }
@@ -2745,6 +2746,7 @@ static void unicam_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&unicam->v4l2_dev);
 	media_device_unregister(&unicam->mdev);
 	v4l2_async_nf_unregister(&unicam->notifier);
+	v4l2_async_nf_cleanup(&unicam->notifier);
 
 	unicam_subdev_cleanup(unicam);
 

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-bcmpiclean-69a8ee3192b0

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


