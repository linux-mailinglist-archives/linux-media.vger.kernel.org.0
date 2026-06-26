Return-Path: <linux-media+bounces-65774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4vGVAjC/PmpzLAkAu9opvQ
	(envelope-from <linux-media+bounces-65774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 20:04:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9529E6CF96B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 20:04:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=bPAs0+Fm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65774-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65774-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5DBE3050796
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBC93BADA3;
	Fri, 26 Jun 2026 18:01:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997333B14A0
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 18:01:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496914; cv=none; b=TFLzv3rgogTDBTY40Vs9KXOejDCtGroorQZhcoQqGaiMIWn1QNCRkyxAY8kqziz+n83ehLwnZxqIclDlRoC2eT5X7ioF3l62Ve7rmxLjTLRow9oCqbVn2YAh1aEokgjRJx26gKQ4gDag5nWiZnyNZWanf82uaSxigU2zXS7CuH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496914; c=relaxed/simple;
	bh=pt4HJmEE8edUGAE28rzHs7TZVFt4InRcodjA1IlZ7qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwwYalrhzhcCuRoUSih2VY2BMA41G13LJVL4TZybf4k0M/PSmB6NI5iteXQW3/CXTaMuSfEnvGZn07MaXGGa0/kGqf9ymIB4AmRdJ1HZuTZM2I2o/DLvLKxNCgLE3pZ2W9TUJml3hcvBeVOP/ZVnT4fi3jtq8koCRWF6SSLqpDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bPAs0+Fm; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629051c9d1so686913f8f.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496910; x=1783101710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0LnirSsZhwI6r48Wrz6h8tHx9uetPnMuJfRiiJYTkk=;
        b=bPAs0+FmN8UEhz5iqZ4KMC7YLPxmtDE0uWHrN6NJ9sJ8jNvzfXETJeR1tpKAAEHkjs
         4ugxzUSeolsfOXal0Gz5wLbAN//vpV6F5W7XIT5J8qalbxaudZn2hVsE5ZczSQ/NYff6
         +M1ZHMEd+LUUJ+pTPynC9rsdH7H82Sn4AoaOpajm6KslHTTqQzCCmL/7A6+pq2osbRhX
         aUN26wLam9YXjuVCIEKsiYvuS86uW6iboB1cInB6/M5orHUGLkABgUT+wCNF51+xKCmS
         wf7Gu5XSax2jIv9uEDdDh0lFCaPws9B25ashTs79PIOuYvzklVJfvl+36x1Q1m07sMKC
         g5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496910; x=1783101710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0LnirSsZhwI6r48Wrz6h8tHx9uetPnMuJfRiiJYTkk=;
        b=eveYREUOFttaOTCE3UwZ7NhFOFpZgWD5zIfNUULtZTlqckzvTRIsizvy2bC5TsljXe
         BwYkmrqNZJ14jXvx2O0wW+fulnoi2mEY/ajPe/8rrhYe1vFYlh01IUcOT25Xej858EOa
         te52qea1iW/7zs0EAVa5bVNqJQX5r8tGoONBy8NJZkXgA4zTEpUcniauQqTMfD5/1lTU
         yv6MJ1aY7XwibDjaZ5cTaTKPUi2UzKVDhCoaMMJn9Amo2mAtVVlarOjvtVVVL0GTtGo7
         gzWtxWW4iVgyJu6CGBC9IAL0TfajpxE31xSofMPaVs3jqfc1sioE/yFSbrdv81e9vZ/9
         mLZA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2owkUGF1kc/o05dLF2O706N5KmXK1I+Kb27h3YcXIzw7FRGJPsl2oczUBoUOEy6F4oQB23ff6y3mMfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfmGHmcH2ocAZQrXgwbBY3qtUxAvJmCXgO8DdwbQJLX5QXHAk
	EAFJl5UtfuDDym3CJncFH5x6ykwVKsijYjyOZoiMJXnnGFDSOdeLGK8TpSrHkX/4ZcA=
X-Gm-Gg: AfdE7cnShB/l2A9WMZuLNjHrbsPz3kmdTGO2wu42SgoyYQhGJ4VBRXKXQqcPcC2BVAM
	Ogct2/nFV8s0k8iVn1MLNA0E1779L42Oq2AehNPxUrpwiBPMDXUHudW5QMq12lwMzIcNu6Tpb4C
	SiKK4rnIy8AiVXR1ye9lTvozIMUaJvh7YtxReuz2cTkFWdfS+/Ju7iLwOscn6caHb+nx1+qa5zV
	Z3jV5pmG4tM7F8A+dXILVJCJQQKgVO6jxUDa/mlpKD1NXz8MQoPhsvs2ra3NG0zN3OaTmiHjxpg
	UhyAAprcMTiXDmJIow19N37uFfTgEeMwUNGlmppkG4MCLMr68NxHFmZ+OHss7ayRuenWEphtlr7
	4fd7pCnFHrTWonzoL2QxxVMms17uWuUouxlYdUAylV10qUnM2+fG3ZsFYQo93sCuY87vMpL+Bzm
	I4qBo63Nmy0h4gWXbcQS3nWYIuRbtm3sQDfknfYDodmG9HhrI+b3vJVz1jZObp/1hhpe5LNUnkJ
	x7b
X-Received: by 2002:a05:6000:400b:b0:45e:d6b2:e6a5 with SMTP id ffacd0b85a97d-46dc15c3c69mr12988866f8f.34.1782496910004;
        Fri, 26 Jun 2026 11:01:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46efd7ee1c7sm10047706f8f.14.2026.06.26.11.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:49 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/17] media: em28xx: Add include for struct usb_device_id
Date: Fri, 26 Jun 2026 20:00:34 +0200
Message-ID:  <18b02a84ed739d8d0936d7530ae833ffaf1d468c.1782490566.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=pt4HJmEE8edUGAE28rzHs7TZVFt4InRcodjA1IlZ7qY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5bZ3XkBg0fAQjdk0JlC/edBNCLZW42LoJJo 8+B9LAQkV+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+WwAKCRCPgPtYfRL+ TiIjB/0RCzfV5kfR6y4auWFVFn/COPt5rfRV3n3/JvIfyc72ayrXJSaFI+5DAUP3A5gvUbT9Rol dkg/kpg7mGk6ud2V8pLqJJQlkoAYV3dvrtX35hqKI2UB5+xDr7+ZRb6fsTm1V1QCLx2/LpXDHAM qVFeoYhsMlSCGB79xdcFPFFDG7bdp0eOPD6mzKifpjgZ1uhmkdCtMmmmSU4r/12r4pbZcVlMG3G nuBB7sniduzuIfR5LvoDQAGh/1YOq1FjHEZcdI1NhLNuQxHNt19HNket16DYdvBi2N8BWSyACLX msmTeN4wRBXYrq3pfXsLRM5MjZb+f+rQcG9J5Zt59yeYwil7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65774-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9529E6CF96B

Traditionally <linux/mod_devicetable.h> was a header defining a plethora
of structs, among them struct usb_device_id. This was split now with the
objective that only the relevant bits are included.

Currently <linux/mod_devicetable.h> is transitively included in
drivers/media/usb/em28xx/em28xx.h via:

	drivers/media/usb/em28xx/em28xx.h ->
	<linux/i2c.h> ->
	<linux/acpi.h> ->
	<linux/device.h> ->
	<linux/device/driver.h> ->
	<linux/mod_devicetable.h

To keep struct usb_device_id available once <linux/device/driver.h>
stops including <linux/mod_devicetable.h>, include it the header
providing that struct explictly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/media/usb/em28xx/em28xx.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 21c912403efc..78efebbcb9cc 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/kref.h>
 #include <linux/videodev2.h>
+#include <linux/mod_device_id/usb.h>
 
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
-- 
2.47.3


