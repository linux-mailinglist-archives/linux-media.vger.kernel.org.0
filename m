Return-Path: <linux-media+bounces-62653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OSaBLfXEGrYeQYAu9opvQ
	(envelope-from <linux-media+bounces-62653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:24:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C25BB1B0
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8065F300332A
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF2438B130;
	Fri, 22 May 2026 22:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUM4tkUk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1D3164C3
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 22:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779488683; cv=none; b=If4J1yPZMkMIaZJmZLzgWLgw1MZvt4b7H++VP7Q0YigJMrXHqtZXtQPJTV24CbLQR54Ej4TgBlLGsitL1L0gpjnXE6ePVSQ3axEyoK9y0RiOBe5dJbg9DJli1e5iJLdfEg6XWYwKOfaJrZkvvQnUC2+c7QMXjMp0INEh03GAju8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779488683; c=relaxed/simple;
	bh=NuLLKDXpIoHaGiwitjIqavEz94tFwa2e73//XFcnqxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bJGUXm0i5eEg5Z8vtSvSMx+wsJOOZrHb6oh4K3ukwLY1G2oDOOQBQu9FM+gb76/OAV7horqglLFg73J0JiT6fMaSw7M9E9UBEqsjvWBnYzYLHYXCIAHo4RcxKk2G3gCiYo7AaTJUKgbpTAPxiO3gZNWriHiQpDbEQOD4CELJvtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUM4tkUk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FAD1F000E9;
	Fri, 22 May 2026 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779488682;
	bh=iH8BLHYRrKEWymfBQ0uO1xMbfPMck+60ViILxN6k/Zw=;
	h=From:Date:Subject:To:Cc;
	b=eUM4tkUkXUSDGcfE8C89D2Bqco0kn6yH1Nl7ZuhBd6t8avzaFNsuZuQfT9HBSLYY5
	 sIY6mphfM5WQqh3NVK++Jm62oT3v7VLy/PqgpBIVj9CJtva9Ezl1ngYScW0WzfLB9C
	 io50bh1jf7yuc8kpj1yQOI+eZvLjcmhKyWzPD5ZtbN9a6rwLb7k13SwI9YYlqHBNH2
	 4nnNl8vLjL1OZ5A1XLS+fzVawHk0yoU3GArh/R8YJOd60bQlrewYUNmMgukTrpY4yp
	 TexlDsb7tzFSDjMPON1+m2NLQt3jsvLa3/q0sSqKtShgmTDEIcy6FypTLB+j98jgHS
	 h3z3bwF94zotQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 00:24:39 +0200
Subject: [PATCH] media: ddbridge: Drop pointless include
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-media-ddbridge-descriptors-v1-1-3ca4f69f0717@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1lOwVat4lcGFNlEzMCqJyoB49
 6m6fHz4BygJk0KdHCC0s/I8RdhXAmFsp4EMYzS41Pm0cJn5EnJrEDthjBVJg/CyzqKm8rYorc9
 ydBbiYBHq+XfP381j3boPhfU6wnn+AWLTa/1+AAAA
X-Change-ID: 20260523-media-ddbridge-descriptors-861571634d21
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62653-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 521C25BB1B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This file includes the legacy header <linux/gpio.h> but
doesn't use any symbols from it, and neither does any of the
files in the directory.

Delete the include.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/media/pci/ddbridge/ddbridge.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/ddbridge/ddbridge.h b/drivers/media/pci/ddbridge/ddbridge.h
index f01ecdb0b627..ca6360856aa3 100644
--- a/drivers/media/pci/ddbridge/ddbridge.h
+++ b/drivers/media/pci/ddbridge/ddbridge.h
@@ -14,7 +14,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dvb/ca.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260523-media-ddbridge-descriptors-861571634d21

Best regards,
--  
Linus Walleij <linusw@kernel.org>


