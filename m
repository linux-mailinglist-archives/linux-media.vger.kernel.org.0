Return-Path: <linux-media+bounces-58479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMRHCBuX2GkgfggAu9opvQ
	(envelope-from <linux-media+bounces-58479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:22:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 754153D2B52
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1CC3303FAA2
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F070735B63B;
	Fri, 10 Apr 2026 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyAcqO+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463C359A8E
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802002; cv=none; b=ZrqSrDhc8HadBZQcfDxpwKDThT75edvv/R22GVRHnkQuoNAQQPzQUBpz2kyvV0pYSfstmZ1PyFSSxWGAOW2lwvAcdHJRGrL79ZtIFrDxbTT8QmFKEEDusNyMIu1+0y5GmfcIlp73MRwjTtBzmUgHM5X/VY+RHfsWdlHRFMqhMmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802002; c=relaxed/simple;
	bh=IxG8q+fEG310DMyrUA0zEZOwBNgs5yMurjEpQQmplEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCoZ2w2721Mqf4X08nGIPiBbckAQZNHYfPsgS+NYxhuCjIp8QlfiiXOZ4NqEccW9vhNyhY3X+SoOZCOEobMYDEbCR2+M5H59BssZrmoTj31ckcwWmq543bi5bypzetIvSaQM1RDA8Fao6P64jLxaSTrqrAJaAC/dMdJv09HXnrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyAcqO+I; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a1307438ddso1700362e87.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801999; x=1776406799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTphKlfN5ycBooStOmhFSW/ceH824s/mErB9PeNLzFg=;
        b=lyAcqO+IJUoj3FCQlMcAzlAb2D8YT6tldCXttQSVSBprXfhB8B0COWTSSnFzPm+I6C
         jRstYc1aGjfMEF7Nb/0Ynmhr/2+rdJBkJ/47gkjbXsDM89DSAi7aTjOY4UM5R2zzha8v
         LIqkBSbuFYw9rp0PfW+6cz48BlyC/8HrPliG50We7FPdtta97tMPqbD/ygE126Jyx39+
         y0PGrtSDvBlMiUYvOorFNkFUF5T7sQ+6NqtR/XOWRBWhKo7cMGBkW3lr10wuB3D+8d7v
         mV8znHOBu+VzJQXfS/k2fBjyOFDjk5M2cNs4SKo96ONKYFo3p7d6epgw+0A09Bh9vSxX
         wREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801999; x=1776406799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTphKlfN5ycBooStOmhFSW/ceH824s/mErB9PeNLzFg=;
        b=UZrZg2tJ9ITYBxYZA9+m0AiUwl3FE0IB51cU/mqtrqKv8K59SCx3Kac1wtgtJ2iz9U
         Olk4Zto7swEiIgc79PO4MdT2D84p/MvQfP3IpyXCqnQzKVLavaUnfCcCV8PfxXo9tBLs
         YzNPoRLkmMMtSbm7YtpPiqcEOgWUnTU/11I2IxKJTAimlQui4kAJ//pLcGl1LrjWvyuf
         6ZEeIjujDRcwzrrHHCQ1SEwH7d6ECu9MbxgbJyt9gVSs/ECHspc0g9iCPXXsY3Y/t705
         OexhynFHaqn0lnfypeLukovg/PMMUng3Zo++DLF/Nwk+vLffDLxgqBpMqrkxWAu8P4Gv
         k54w==
X-Gm-Message-State: AOJu0YwtQH6OQCkDRw+AJOuM5uB2w3N6V0i2B2OZu7Wa7F2QyH+JQUZa
	etGuYd0MeQSh4+A64HB2b3kmJfYCOrOgYh61g4tIoDs+goGk9Z5FKuhv6DhzAzveRSLagw==
X-Gm-Gg: AeBDieuw2GZ0uqLE6y4b/iNcMs2zacztIG9aiS88+n4IHBDLtExHDpRWO0IrFOAnr3A
	htPiAHRTt15Z/9Gjy1kbKdCn38zTBBnfIOOHAhkngQbKEu94oVuY0wLk6UI6KVNCs7zDfrz6VeI
	ghhE4R/V/GCaZBILhbO96wXyMvpK3gkrHAZ+VZgDRqRI1V1X6Hc5Om32/LC7wJ5N2BiBvKdu5G7
	5zmreQ4hF00XHCcgdDUG+R3Qog/T0ZtCYOSDMteivQm/3pPvrRMAVmMUwr4+oPV/TySCbx8FUfJ
	EbEfZ6dt4ArOzAAxAGwIDr2IOb5R5HnDi5WXZiDJJerMyeHDUkzCugvvfZGvLNijV8BJ2hwnwRQ
	IJCkZA9mDuKcdm2pS0b1dl/T/55i+o8/Zovy3Laov5Lwhhti9v7OarPUB31UExyuDPWmXVzhnsl
	O4rkxfGh0wXYsN9DUrjDawwMTBXxwV2d/B8RwTS2qCj42cbRXJJw==
X-Received: by 2002:a05:6512:74:b0:5a3:f309:272b with SMTP id 2adb3069b0e04-5a3f3092730mr113862e87.0.1775801998674;
        Thu, 09 Apr 2026 23:19:58 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8673dsm490506e87.15.2026.04.09.23.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:19:58 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 4/5] media: i2c: imx415: Fix control handler initial count
Date: Fri, 10 Apr 2026 09:19:43 +0300
Message-ID: <20260410061944.241480-5-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410061944.241480-1-eagle.alexander923@gmail.com>
References: <20260410061944.241480-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58479-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,wolfvision.net,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 754153D2B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the initial control count of 10 with 9 + 2 to correctly
account for the two controls added by v4l2_ctrl_new_fwnode_properties()
(orientation and rotation).
The driver currently adds nine explicit controls plus up to two
fwnode-based controls, totalling 11. Using a value of 10 in
v4l2_ctrl_handler_init() may cause the control handler to run out
of preallocated storage, leading to memory corruption when the 11th
control is added.

Fixes: 14cd15e7a1e2 ("media: i2c: add imx415 cmos image sensor driver")
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index b305adec30ce..ec0239ccf5fc 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -897,7 +897,7 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 10);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 9 + 2);
 
 	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); ++i) {
 		if (lane_rate == link_freq_menu_items[i] * 2)
-- 
2.52.0


