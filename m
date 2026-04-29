Return-Path: <linux-media+bounces-60004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE4FOcBI8mnDpQEAu9opvQ
	(envelope-from <linux-media+bounces-60004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:06:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092949893F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21F930238CE
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1188341B367;
	Wed, 29 Apr 2026 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR3MnLio"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E668441B352
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 18:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486001; cv=none; b=LUaIUWcxUixZXp/uoDRxIzfbVH0+a/zaNp4CRsaMpHBOrW8XW65DRYgN4nqRJHoNfc8V6d47RQOmnH2trfZsKjFjFMeKBZv3RaFyrE8o6zwLv2qFkTxctYMF6gX6yuL64gB1+HZ8MvnjEvyt7vF9bzs6Efi6khE02m2ZCE9XCM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486001; c=relaxed/simple;
	bh=yN3oOXGsU9m+O8FHXmbXOe06hln6+CoQ3Bfdi3kkpEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOOTo+Ukxke5j/QFr0cX+lbJZZqX2SXrjgV1DEMzNlkxYVyOmWcse4De4hSiJWrTgM1o7exiaIDoZjd5+b6rgQ4EjeifB1o55kxo2b1+TJVTAkMtAhZYG4CAKYrLAoG41ASv/+RRWvN/fNWzf+s8B6QIn2awLUdW1f/pAnxUHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR3MnLio; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89f1e767f92so947236d6.2
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777485996; x=1778090796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xJocfIjpbzSjf6qOkZQhVpHOzyCK3XFmlbltimvCtc=;
        b=kR3MnLio5ERP3KkaXZYqNaBqUGa42PyynXQRaeL8XaQSm9S68B8iZdEnf7qJdRD4nM
         D6h/2Izc7LlQqrvD9YjsITOdyCh5krldbvTZWJL86rGgS8yJkOY/0ZOxT+PyYlSL0hbI
         klMnbLUXQlsGneJBzRkDT1qACUd7PaJ9FOJ9ERoFV/Q6Wlkbfc8KiK8GT5tGdMm1RtFK
         U7s8QJY9qSw8scmSELH3ZDGxZIzabklCNVzlzG0XbbUdqagkH0D+/yiRrGGOcrc8mMWf
         Il0LQ9bq56GQULkxi5tuR4uqdwydXStu59W1jZPvcZNfHtRbjsjSWUFj/GCctz/yCdCZ
         NHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485996; x=1778090796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xJocfIjpbzSjf6qOkZQhVpHOzyCK3XFmlbltimvCtc=;
        b=GZcq+DoJMpJFROJlfYOTuw0wCwogq17sXZKqXgrBkh6L6K8OIwZkcflSJUFt+N3SI8
         cSjKCoqeuLz9VuAWQwdY++I0ug3XABMUZMvSHDzaiWTg93e9uhAj8JOBVCrCuBmpjPBn
         9FLn3P/7OD3HPuooV4ElyYHtDYzv7mpXFkkGtP07MU5sPoWgFpO98yjHAruUSQsqV/Zi
         XBzUIuBRKIYTzYXvHpSUGbhHrIf8SwwTuzW9Ps+1ZN3F1gCFQH5PX5n15I2z6lWHeLuj
         tnyihE5V0GiLe+5ZoO5bfKYGJkUx+G9+3eA/5qQKlvL+Pfw91ptbCgtDB945D+WIJJ7y
         NUAw==
X-Forwarded-Encrypted: i=1; AFNElJ+y1JhjKCjQnOUWG6WFU30XinSR2PUiGPwZyPCt1wujEA3CR9aWQqTwe7XqVJzBUAg35Bp6Is2Sq3p/Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMFEOEdeNuWabP79JGda5SBm3CqyTkwpjvjHus+ImITzjeItq
	xjQWHS0w3Pp6oesUeVVXyxuS9KTBqeNpW0VLlc+5Mopz9cqpQyO5McV8
X-Gm-Gg: AeBDieseMjAt5AEec1vdz9wBTSPxzr2IhAIpVZRpwVW76R5beJa69kogUSySgLXduZL
	c9Fky9Wvp8a9qMidvFF3R5aOsN7KyCVK9OyWthXDiFUGfr3EKqLHSCH3Pu5ridYarV+Nu75dD2x
	zMcbkU10QSAnodEE71NDkyM0KKR1YA/TxFRXNOPRih1vPR0p8lB81FwK94+xo0rE+X0d5y4VnJe
	dh84+axIHd4GjXYhSv9ZqLvrTl1Rap3EPI28QdGcuqeS9Xw56V7Cbp44t2CEdmL/tNcM6BEugKH
	raVtojHnGm7fXN23nUBDHHhDp+i47pQH6fNS2ETj/f1X4/8XgNMRWT5FkQaqOBxFX8qcPZjGaXv
	Q3KCAIJuEDYQX07n2WnJh57A/VPoEOAMlFkADZ9noppvaqwvbVrfZhkn1r691EY0mnxOWNrOyGY
	yes1EpDIZQITX51oFO7ZkvKDw7N9z2LIUwU/eA0KSWEHws+yjtX+GGbETli4D1L9Y0DRf5
X-Received: by 2002:a05:6214:6005:b0:899:fd8c:55c3 with SMTP id 6a1803df08f44-8b3edd0b7c8mr76575106d6.22.1777485996525;
        Wed, 29 Apr 2026 11:06:36 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef81731dsm24380276d6.38.2026.04.29.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:06:36 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: ia_css_event_public: fix typo in ia_css_event_public.h
Date: Wed, 29 Apr 2026 14:05:30 -0400
Message-Id: <20260429180530.6944-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6092949893F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60004-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Fix spelling mistake: Therefor ==> Therefore

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_event_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
index f7215dd96739..8eec3b0af65e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
@@ -110,7 +110,7 @@ struct ia_css_event {
 	     until IA_CSS_MAX_EXPOSURE_ID is reached, after that they wrap
 	     around to IA_CSS_MIN_EXPOSURE_ID again.
 	     Note that in case frames are dropped, this will not be reflected
-	     in the exposure IDs. Therefor applications should not use this
+	     in the exposure IDs. Therefore applications should not use this
 	     to detect frame drops. */
 	u32               fw_handle;
 	/** Firmware Handle for ACC_STAGE_COMPLETE event (not valid for other
-- 
2.34.1


