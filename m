Return-Path: <linux-media+bounces-60271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JwHOCJ7+Gn+vwIAu9opvQ
	(envelope-from <linux-media+bounces-60271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:55:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308A4BC068
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 12:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 981043022A9F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 10:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ABA3A6B97;
	Mon,  4 May 2026 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aHCG4sEt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC5282F10
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892109; cv=none; b=fVLNm71s8iYfGfjBm8qaZGe05iIdoCcFfhhHcW/xXU5JkL9zLCjDtfVW+/PtOPI1O8xumXSleAP2efW6RO5nd3tPtc90hZzHGSfvDDArQoIaOjvsrvhPoGetQqNY9FhS4LRn8G1ilTyeEGRNJQIyIZsrppU5AT4WdqhFya8RzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892109; c=relaxed/simple;
	bh=+dgffLgBiEP6ZBRGedun1KaOTrk/q8XcHD/7lgiAyQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jCjsubEXPxqsrROIkxIOumkFwvSOpV3GKtYWsckuUC+v4fPlsNJS7+qDdL8rBZl2n/dE5f7L7l5sL9FkkXhxn5A8zBGoZsYWtWEL0e+g2FE6Wt3n4igxN1fxcv45JFqQ5Q6sm3GtWI6W4SFEJACOTM0D0UUxZXGMy+OtUAVzomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aHCG4sEt; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39389398838so12998531fa.3
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777892105; x=1778496905; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcDLjx4hLgTrt8Ve4u4lIZsmkmGxyF9I6wHEUsyYi7c=;
        b=aHCG4sEtExwCG0zgv0l48pTohS4tt2KR1AyCDBSxrEuVHN68AnRzO9OYWsotnCZ6fY
         7jIQDGyHAMcp3bzt5j125jPvikl0GmkCLEaCw5NquWK7xAnE/UYrU8PDTCZB0V6hlEES
         DHGi1HB6dvI960WOJKTOQIqRliCMeoKMx5elk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892105; x=1778496905;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcDLjx4hLgTrt8Ve4u4lIZsmkmGxyF9I6wHEUsyYi7c=;
        b=ACNwjksLOxJGd8FJ8eweM67tAat/YhqhMd9gTVvydoUjoM0mXqEUGFBQhfN+k0JaTo
         q18+orYFUTEURYTI5tJq6INI8q2mmCNvuy9ZFk7FT3/6C93ijNEhzZ875MHjByNluSGH
         lHdtyB9V1YuE6G7Q0/Ue0EI+3Ki3BZ+3Uac1SxD6xevsM++zcbtl6LmHncQzO7fKmcbA
         s4ekGPkJFKOgmJviin74weIPz4TQZcr6bdZsoPR72jGzryWVUKNLRP529S9Sra0u056H
         UKm2lulCnDMPi04NkMneEJV4Sly8R7zb2Tn6oVNImmtQaKcHdV5ZlQ3fnke7E7oDKSMc
         8dIA==
X-Forwarded-Encrypted: i=1; AFNElJ9afA004IjwqVne1yaFUIS/3hprpl16f94EtQnTHaLXQLyK5u2uGKO9sIDrR8zI7dhECZyTssDvqLWYAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+N/TbgU+QUDr9X2qRQZ/+no7qxPkCwD9levmDC0/yf8aEDAoS
	u3+aQH5lw0GXhiBEwtDo4G0dYAMT9bX26P1DoqELEt4POq2BsNIWDGFjnCE1FGbI9Qtew0UV0O1
	Jni35+h+w
X-Gm-Gg: AeBDiesQx1npKa9qjOz+LINqvdzh7leMaLqRnaBbnz4/5n98SyvabWyPDJ+nbJFWPEB
	ykPYm7tGMDFYFK9O7Sz+o5535DZGuTKY9q2l+NoVcjXGlY9rd5ewasxgh++rtotsj/HTjlyxSrh
	Epl5kJK03/2dyO/ITbD3gWwgy7OWRc180V86tEKt9/3i3km3jqhRPHZIBJXYg4p9AxIZHbzjL9F
	2wkCs7NbINQmYwtih31ZWYMge5Lyyd1dXW5jk2oWk6AXrQ53SFEiMpzXVVfgemPLydBJnJNwX2T
	vj/9I0iJH90rIZ4WD8TxAw6vTUbk9WDzMAag8tOUX0pEgEMC5cN7PyaRjuig91+rzWoDPvZne/T
	me9luZ8WcIs113OUJ3avtMjQLuj3l01x/CkcQT+yiaOy/WqIEnG8Tnv4/IzphH3cQ7Do8slu7jh
	Jw6WVjPgJ0AUrNvl5u/3tNngU9EFiyITsA4iCCepVa0+QFssSafHhM4XU/iMfAgDSHwT3v1TMMQ
	LAlT4h1C5eWiFEP8w==
X-Received: by 2002:a05:651c:2116:b0:38a:45d6:c246 with SMTP id 38308e7fff4ca-393783ef512mr33168221fa.8.1777892105339;
        Mon, 04 May 2026 03:55:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361323c56sm28904411fa.29.2026.05.04.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:55:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 10:55:03 +0000
Subject: [PATCH] Input: atmel_mxt_ts - Set byte_offset as signed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-fix-sparse-v1-1-1071137cd280@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAZ7+GkC/x2MQQqAIBAAvyJ7TjBLD30lOqy11l5MXIhA/HvSc
 RhmKggVJoFFVSj0sPCdOoyDgv3CdJLmozNYY71xZtaRXy0Zi5CeQkQf0FtyAXqQC3X7z9attQ9
 RBWiQXAAAAA==
X-Change-ID: 20260504-fix-sparse-3bfa6ba62e5b
To: Nick Dyer <nick@shmanahar.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 4308A4BC068
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60271-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[shmanahar.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The calculations done to obtain byte_offset can result into a negative
number, fix its type.

This patch fixes the following sparse error:

drivers/input/touchscreen/atmel_mxt_ts.c:1481:44: warning: unsigned value that used to be signed checked against zero?
drivers/input/touchscreen/atmel_mxt_ts.c:1479:49: signed value source

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 87c6a10381f2..26ba82fb60b6 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1397,7 +1397,8 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 {
 	struct device *dev = &data->client->dev;
 	struct mxt_object *object;
-	unsigned int type, instance, size, byte_offset;
+	unsigned int type, instance, size;
+	int byte_offset;
 	int offset;
 	int ret;
 	int i;

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260504-fix-sparse-3bfa6ba62e5b

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


