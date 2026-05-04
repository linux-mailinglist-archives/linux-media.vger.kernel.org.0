Return-Path: <linux-media+bounces-60273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MAzBph/+GmXwAIAu9opvQ
	(envelope-from <linux-media+bounces-60273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 13:14:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E14BC43D
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 13:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C088B301C3EF
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 11:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755733A9D86;
	Mon,  4 May 2026 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeJAanZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5D3A75BA
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777893266; cv=none; b=osjJGyBScX+s5tQHwHhTwV2+9CiBdIAi8nNmxsQ1N3V8NLCtgOhHg4a3n59+3k2R9CCKgyjHgiXjtsndQqddgLYAAm/6Ykm5+Y+Tf86v+CBISghkB6LOitDfxOn0UGZY1EMgP5fP7SRT5K9jg62pc1pa9hIyoneQv/41ot3u284=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777893266; c=relaxed/simple;
	bh=5gqcOaHGDYCc2EdNv2Pfg+YmYLebbGoz42XP/KxddRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r2pOCMHvLhY4mZmqZxFAJHky0xThAfHkTUo7+5fDe3LDbPj1OWMN0ITrKRvltrovIdeyWkgFsWhfAj3z9ak6v8OC3/7hmiyDT4WDRYo3QyArY+rPWru8TSSYnXdtORWiwWXxG2SOmqlnNcl9Z8MvieSxhfB62L3eH14LHfDtsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeJAanZ5; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8eb5ad01402so434737785a.2
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777893264; x=1778498064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=OeJAanZ5oYIPfDDNKWsLzRqBwPE0R0SXsW4vIxJf55A2EGqwE7WpKWFNcqPaqgf8QR
         wkl9Nlbny8Ip74wIxmcn7y0YESFhz5SGZc3sErw9gH4Is/IhA93JXxnOCbEOB1ePDJZh
         uE9BDhBQ7VGDaYDDbX9lI9lz/Wh/OL0ML/9BCenGke0szN5vxVU1yyVNaxWqkRUktUSZ
         1Tn+hNbZCl4fCSzoV1K7q+P480djX9twE2ko18wJhAw9nwnHvIx5aiXntU5xbTVMrYKG
         EpE0oTkF5rVkUkWqL1bHNtBODfuHqgwDGCg43HO4Hwyg9Smw3gSgk8B9gRjNX/A3UalA
         E5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893264; x=1778498064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=MrvNYlBwNWAvyILWwG1KUO0aGPMiNKwCdJMIJSM576YMl4+SbPZ8V4iNSKm/oNCBMu
         SMqYoA5K7jYb0w+xKtfME0DB72jRvfUDOFgZ1gCekY23Vf6hYOUzljTmqzAIqo0f1BgR
         5PLVyJK/5nkqjszmDAzKx7s03Ig/KLOKwW7yvVnFtUCyrHItDArTkGg2+4N5JqOhj2fO
         wla31rXfiV4/2Qrw9IOHvxB7X/YMqFRKjFpQb5sbFNK9sMYaYG0siWp9GbAzmxCvbe0O
         vzXNKJn3CscRJknsJBcV3/A8gCOYwzG6fW/BJ8DsgW7TcyDW4xLxSTgLf/kjX0rolD/e
         IBqw==
X-Forwarded-Encrypted: i=1; AFNElJ9BmCZAkvM9L72cXBYK2iEuaDPbuMsMhRfsfkkbL6hzfER5JhoO+R+S+EyWh1KE4mePQvwEenLkttyopA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwcFADheumZT97yf3onkanee2F+QvuKhS6nBC/rOhyObwQinyO
	HNOoabHxI/SfZs1bdryL5Y6wt1k0RgJyhooLLNXbB0nMklStV9BDCzf3
X-Gm-Gg: AeBDievmJOfTPyOcurpVxDafUkE3zqaVMvdSYdFPxHlhITWd3q2fFKBRznX+TbTjOeI
	MB6T4cqQmvmXuERzOcyucbGJDp8Dt5A9rYs5bbmE2vkIrxvSJHaaJrdtG1tb6UWWVrhS9/3AbgA
	Ezig3HxZ7BxFzvjb489mI5M6EIHZOdSKkqsKMHuyjPBMZidjUwcuNVwdwpXEkH8QBDwBEW11+AK
	LSCKnlKLGhjPMaZ0x4CIKc7B9/oN64RDTYyz65P7YjuRoG80wpmuodOiwPnHKPFvDO6jnixBFvT
	F4cLbCJd3Fc8afugwAhjFEpn61jtVURSNwdi2KxNV7ttGZhNZxyRBRmjrNprtAR7iW11jxufX5K
	hCAOXNSOQthlAlqFzSpnsjhB+1O7S/gqsmaOO/K2oyWqdU9O2iritdoON8iPqcvpxRDYtYJZ2rP
	R5dqdgqp2fRy8HknSO7bJjE7mlK62FihTHf9wlR5nSXkOSopOzM27BYOxdgXQaAIy9HvCJTx1as
	Sn76w==
X-Received: by 2002:a05:620a:230b:10b0:902:df55:8ee1 with SMTP id af79cd13be357-902df558f8bmr29755685a.8.1777893264457;
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:b95a:c81a:e3b:6e2c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9027c2baea8sm214559385a.45.2026.05.04.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Mon,  4 May 2026 07:12:19 -0400
Message-Id: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6F2E14BC43D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-60273-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1


