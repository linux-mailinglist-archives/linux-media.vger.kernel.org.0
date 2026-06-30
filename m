Return-Path: <linux-media+bounces-66057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uz/XNgCOQ2pnbgoAu9opvQ
	(envelope-from <linux-media+bounces-66057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:36:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892A6E2416
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:36:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=nLAQ59me;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66057-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66057-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE43A3071E53
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AA73F0A96;
	Tue, 30 Jun 2026 09:25:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5A3F0743
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:25:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811532; cv=none; b=KstOy7B+uKosY+66P62dd3as4tMU9kE++4/4lwZGpSojPaZKiWSV3iqOXwtaCfRkaw0JYXetyUX1vG5XZB1O2eeTlE/arVtZzlzZ9B0hrVk3vIBw21d3PdrbwY3FSh0UHQ602n5b0qkqdujRgZv+SR7Yt4EafR6EfQSu1waTo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811532; c=relaxed/simple;
	bh=ezDm7Gc9EfG+/8LS5oomiWzQ1aOUYyJqUzpsCqhu0WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bToonuSjS2RNiyQaQ+6eagMWsLbpKrITB0ST1WmfkzSKkpjgN/8o4t06ytO4Wh3H27v2zT03qQMDp5ojV6enHhwwxFTPHOLkKNi8oKqosn0G1Fgz3L+6FUxMJmH13pjNXQdlOvDmwSciT+U/dx1qEkLIWfwk37WyPRM19+E6DDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nLAQ59me; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso330132f8f.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811527; x=1783416327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDuu+2TFU7K2S5MMJE/L9xabTb9uGhBTPtQYPk3yyZs=;
        b=nLAQ59meaFwXaR8gLnLqDJKwCSD0aBwGecZVxIVNKGREWg9W1hFkqDVFHLf+bW6nIv
         C/llkOo7rZ8hIbh9oIJoHObatUSNaPya2hWZ+GYn3QIKytTddeY0HbikdHEI4nwkM2aQ
         pZgepkLclfKY4d9lXOwJFnDqwV/DpdJS0YfrC3DiNLn8rAfRy3Ugdlcj9++BfPJkh9hI
         PHoUt4OT3p1gV0q3THBxNwl2I/84lZcxCiaUYX+FuoSl/OyrY+zeEAkXpZeTltisnRDu
         Rhn+uguqY/WUqLSaRU8Lna++kydA+KfTw1VZ7V31ahdB1m13O+bG7vFjI0hrQHcktEOv
         G8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811527; x=1783416327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDuu+2TFU7K2S5MMJE/L9xabTb9uGhBTPtQYPk3yyZs=;
        b=Pc1Vf8Om8+dHiI8bLTy19DLmMBuKW6vS10tzWjsnRN8SD1Lr85pYuTJmQwParGUttN
         YUcuCvznmub01O9qV+l6XaLKLHumGW3i1lpseNKCNY2kdPJZLdKA0MGc6vwGfvhhZ4VN
         IYuYq92E5FnhdSllCOz35ikKmb9XwrhEn7Fx8p/Ebcz3cNd8xc+kmRUhVrKSB0t69A3Q
         QEQ2Cb0Dnqpa24rQGnEtEjgRvc8E5oMRO/f/rs+9rOJOkuLDmpkPqsBhBPuOVPrzz+Ao
         bUwy2W9wHAEXb7SIfDGAjo2seElFChwYVJF/8Rmx2cARwKVKvXFYHgI48BtVHh9ysP1n
         liqg==
X-Forwarded-Encrypted: i=1; AHgh+RqlX7Nkj3nCyCdP+Ogf6s1S7+Ui8LrWxclDjo0dlZDc7QuI1t59j8v/ua5B/5yONto8yu8/2aarmaSRiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJs3HbI53Q1PXc1VhsJj52EtUj3qiCfwU8jnVXiAs329Ro/tIE
	iACUjGTDV4h1Z1+EME665leY/dj8hjwVdBN4GdvmQjE6jlywRNWLlmhpHv/QOpNdEmk=
X-Gm-Gg: AfdE7cn0SX6Iys1KcRlHH/3p1I7j6F0l9McA3lsVcKsfCVRNSv/lwW9omMWBBi3Yf5H
	rjmt+xA2/YhKfpPCltBGfZzafI8EXsa3L/mrGQZygpArUWq3bEAnzT0IvA/vYibi0LjEDTiIwBf
	LD3IPW7sxlqrug1GFK8fsvwSsM2vqpOTivYDnwhdgzjsJR2+x5euO1NSp+6Ik9X0mXv/fUaMuTx
	tLCxOUwBC7EMq7NjT6qf/baRyzIcyS5D2rpYk216NCIVzszpGfYCqwNXZQ/KADhQhtT4hwWNzPx
	3zvVyPYbibHRGrMo3cGULpHAGtg0B2Q8Xd9/3FmjbbrciSlAIjmXXV2tNJCE2ERZoxaZK91eDIR
	aSbuWTVNlFGr7VYoycjeg5Ws4Y2NZfrZ5Fb/vuXwU3enZshlVdjB2oXIJhs6bTS3Wa8uhm6S3nB
	gO9YH7F9t2KiGF+vwVvvp0pEONaZfz6UdbegKIyLztNZUOL+WiNIfosG9ob7NVZkyaTs6PtO5/a
	uUy
X-Received: by 2002:a05:6000:4382:b0:474:cd60:1157 with SMTP id ffacd0b85a97d-47551ee767fmr3317239f8f.31.1782811526948;
        Tue, 30 Jun 2026 02:25:26 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4756636d2cfsm6720611f8f.17.2026.06.30.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 02/17] media: ti: vpe: #include <linux/platform_device.h> explicitly
Date: Tue, 30 Jun 2026 11:24:21 +0200
Message-ID: <9f2e0e001eec087f00ac2c5af2de2e8f6d0978c1.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ezDm7Gc9EfG+/8LS5oomiWzQ1aOUYyJqUzpsCqhu0WI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4tKtZNbNVupV0Jn6GdrsV2mVRMi4zAwPW55N wI4HgUueqGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLSgAKCRCPgPtYfRL+ TkxUCACejeoBThsQ0PbTKTYPEXkqqVn4/bkLsWh+cdpkWgCbAkPZiUlT7FH+etoOx1YTZQAIl+j h/OG6mI6AKjyR0/lnryZ9H5EZ6GXpq5enJ23SU+LOv0CVf79pSnp/kq7UF4U+sK1tjc5IQ7abzn Rnu5Yag5MSAtdGpyRBbx0401HkIMj0cHiQg2OvX202Qg6gWyT1nbZ6ijUpPbtZ3pzK87bDzRRbF N2SSw2Ue4YXGQ4/GxWOB/P0uR+Sur5fRLHQjWLWoDf/hdm6a/j9C6u2SJpbHUtspepfpcCgTxwG zWrs4SW7xsSjlZvEM6w09rdobUkQTlWbTAD7szad69wOv7Pk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,m:o-takashi@sakamocchi.jp,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-66057-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ti.com:email,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sakamocchi.jp:email,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9892A6E2416

The driver uses several symbols and structs defined in that header. The
header is currently included transitively via

	"vip.h" ->
	<media/v4l2-ctrls.h> ->
	<media/media-request.h> ->
	<media/media-device.h> ->
	<linux/platform_device.h>

which seems to be on the lower end of the scale between random and
reliable.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/453257c9fa32acc4ab5b3e4c3b010244966a7b9d.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/media/platform/ti/vpe/vip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index cb0a5a07a3d4..e56a95f53ea9 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/mfd/syscon.h>
-- 
2.47.3


