Return-Path: <linux-media+bounces-65773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BLDKN5K/PmqTLAkAu9opvQ
	(envelope-from <linux-media+bounces-65773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 20:06:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5F86CF9BB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 20:06:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=S7MhebHs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65773-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65773-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 424FB3015487
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5073B0AE1;
	Fri, 26 Jun 2026 18:01:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772533AEF3A
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 18:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496892; cv=none; b=WaVPEZU6Am3ibpzaa2cQP1X/BQqTn/v2ZVMxKaH5RbghwBIaGaoJDr5rFfTZUCFNE/kAGHljvStbIn3OCckaiG6NtUbnjfLfCtU/osH9DgdKFjtqL48HYzu9WN0cELwzkrbISir+1ube1ndoGmk9i86vFQ7K1GLcFZMhuRrqNaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496892; c=relaxed/simple;
	bh=PuxnLKKfsaKV0aEXX5P6lXsv/PY6Q8gj7mRbj+ySwEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxZvnYgroaJDVTE35XI9fMUNqM/SAJS+vANHiFTKYw4jR46xbx7qbY1niGv1mKe3ebOOj0vsgoJR3QDEbYM9whJXJGMGiKIWjNn4Kng0/c03TH2/+mbhJaSUU3wO6lZBcODYSaWmq/dDE88gj2goWpEJpg31nWhRKB+loQfqvhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S7MhebHs; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49241a577d8so9867915e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 11:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496887; x=1783101687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fogEVhCWbcJV7MEcGbgkoIwpq1MRZoFhZylaf8IsCCw=;
        b=S7MhebHsaBdGHnicQjiDYGnCN6qRzAPLIoD/1kWOxR6sby6maIy/A5IVawzY65Z6et
         nYe3A7aHRz87miuDSjBRTIiZCg5L3eCESMuz/yDeyuFimVRNazW+MyCTpHGiyml8MEKm
         RMxr25ACR4JsLO7rJrO/zMyHuneA4aNM5pB0lhecT241NPcN/3qO/XMiz3cS5MZjlFAb
         vxjlpxEtrnvI0FACGlu6w665NwxaPIuquyl5562/P9KaEGqqlkhrH/BbTCL/eQsJqqN1
         zuaFeXrLJ4JuDcu6hWZ+apHsj8tiexA8B5cCrIbH9CZsLZMgLUbJ/RjnVct5BrHr75Df
         4tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496887; x=1783101687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fogEVhCWbcJV7MEcGbgkoIwpq1MRZoFhZylaf8IsCCw=;
        b=fBrV32RSeElohEdNYOCmpnmNJ/jgVOcMGaLvQVl3+MLItqzv42ljs4aTq9Ic60m0Vy
         vbeZrdzg8GDRe49Ve+gMOGsIwRhbTorduwoEPUr7HSiQqiBhQLolNmcJHlzkK3qQ5h3V
         FaUn5m06w81oJDp0enbsTKBKb74t5zemUjP29YBsWDmtaNpT5da7tElmI3Ma1L5oIFY6
         Q+Ttks/ihq6XXAebH9+8m5+mIKAjEaGeE4e65vhOKsZ1pIEeaJqGoYnIlzz2mvN01yYP
         QBRQ/UYRSdZs8h26rGnk80voiON4Y/bIT9tn2W1d/N+OMAOZSDvnXr5eiJ0TXFf78Nfj
         QORw==
X-Forwarded-Encrypted: i=1; AFNElJ8+0tDtRu8Bbg2yVdrickIWo8FV8AW2JIxodBpEkNr9i7q2JlmUEMgtaz/je+4V1ZYZCd8tL4YETAg4rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyECQqvMGHe0MtgHCmH7k6LWrF/WZB1yxMtfFi2JR3dzyRJ7Us4
	Wp1aSz6j6T2cWMubuaOfkTCuwSchtmmiiBsQTIDvXz/bQ9FoXIPsSAmxWyNJAm359cVeb1d//lD
	1Z5OW
X-Gm-Gg: AfdE7cn+iH+aRW5uTSXrzTh4USuRTwHLozw8kVP+OPQzKjAIGFVBCxHoQ50auMK6NMn
	RTcb9G2DJlY85Bk/fN8aWtd9pJAmV2lWBrx8BtVJyRHB9fm4E1MQ6YTcRPCicZVeZnd/AZz+mp2
	IHEBNO9rRt/5jkNRCbXZBIJeY77f4JJKkTzu6nmPLOu+cmCBv9qe0OF7wD6jNWgbp6CRXvhqWnp
	WGhnnsEXiP/YeXDpS/KaNutSytsqRGQ2xBLBgIxxn3QNJWIj6lOO4wWryle7cszNEPwlG4EOXGv
	DRF8WfY/J9eLEEByzdLwxPLVIgrAirGVbnDwxLD1IizDDH6SUez6jyLT1VyTeIk3IlPEF3T7YXi
	c7rEh+VptVt9g//EP3gYa4WAWjJM4fBeD2Djfo68nMnGtW51+WQ2xyV9p9qcYCWGWu5mkYplt3A
	OvPZ5OE6epS17buQ68GDS1XlNga7C6fBDrfQgy2vNeP5RARfWsGA1eP4m9HE9+OGNUnKOgijsus
	ChN
X-Received: by 2002:a05:600c:c170:b0:492:6fea:96b4 with SMTP id 5b1f17b1804b1-4926fea98b5mr26098505e9.8.1782496886794;
        Fri, 26 Jun 2026 11:01:26 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fc0d36sm156243005e9.2.2026.06.26.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/17] media: ti: vpe: #include <linux/platform_device.h> explicitly
Date: Fri, 26 Jun 2026 20:00:21 +0200
Message-ID:  <77d9dd05f350ff7f62af8085d4b54225c4ef5700.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PuxnLKKfsaKV0aEXX5P6lXsv/PY6Q8gj7mRbj+ySwEo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr45+28gt3P6h3WIKOIaBBrsGNFEsAwR0fSZz 5/mGaKAbRCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+OQAKCRCPgPtYfRL+ TqtoB/9Lw7HagayNMHZwyceXVMsA+BlwoxDpAMXsqzl/JyJdxKQAn5t+5tclyGXQiiroqdDNgxZ KL4MeQ/gPOfVPex5N/gv19EprBHAyR5sZjXSCehy4vh1Pi2aakLTrePpb5AjWBcddAwlHrgT945 VOGDylp1VctheRdJ6Teb5T+cdSEm2TfkxyPoHOLODJjxo9HGQF14kOZAbxSguFsuN1LxR1KRDNu Q/i1fPOLkC2SLhk4tiOdDl3pzCTEBYSLWnrVhrAowgUXotNZEofau1bBu0EL+QsXcsIpVLbfADm ppN0233j3z6yJhgesOUhvazFUt43fqhXoj3IR/Kpqsnfd1IP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65773-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B5F86CF9BB

The driver uses several symbols and structs defined in that header. The
header is currently included transitively via

	"vip.h" ->
	<media/v4l2-ctrls.h> ->
	<media/media-request.h> ->
	<media/media-device.h> ->
	<linux/platform_device.h>

which seems to be on the lower end of the scale between random and
reliable.

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


