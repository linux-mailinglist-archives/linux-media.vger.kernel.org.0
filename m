Return-Path: <linux-media+bounces-62707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDspMlscFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:54:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 255085C8D3A
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC84E301C5B0
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F4D3E63B3;
	Mon, 25 May 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7uqsc/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260237269F
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702754; cv=none; b=QUUmiharu2bBCNwMCBaWrvtk06tzNx758802NLJKE8eN7Sd9tft2Pdv6rgS6PFWGpQY/BhIAB2b8r/kgA0tsz+NA2ejFEmvnJ38BnLb69EhdrSuhXo0WdudUVKd3+0jTOmqqjPoP5cJND8O6hR7QUIjJopQE+5IJCf8ezF07CUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702754; c=relaxed/simple;
	bh=gfO1Y5Cvx+draxMRz7VV+taVU8+4zXC20+dPuEQlJG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swTotljp96vmqtYO4ddhInbBmj+RlaNRkV6iuZMhvKXUUqgWbly+B2MyzomaJx/ptY5VJU18IJh2fpmdtBnmPcoJ74/dOPfxwB41mT4dJuBYFVu4svTa8fJGYKzYSv9ayToeIb2iFv01s1ebfI1A/tfVR4HU6WIub35dTcGSWko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7uqsc/V; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba6485d219so72090855ad.3
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702751; x=1780307551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=p7uqsc/VrGZVSPDRdZ7Qz8bpSpkoeSP/fcSSIvjq3Lbp2jPpZzOTeDqd4OdSEP0j7p
         9OAB5o0sNqy+/flDAjwmM1fe3PgDOq44L45ekAG//MS6k0I75y1abR3mj3TRIXaxl7dp
         qQe9m3RnWHUWYPFTF5oI2qrpRCyNBTx52L7TV2KxH9OQ2v1Uu0XliPvfKnAdRyUUEy0f
         CJhci46MqRM9iev6XrFNCvwbXBTrDK3urzIHCqer+QJK5ukkcOMfr4GX7KJsFDZ4D1A5
         YOtua3AIPANEPb7Xxfw8eUjxeV+YNtAipuEIkc5ng/2Opt++idGF68iS6AwyHypiRtew
         9/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702751; x=1780307551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=T1EGInvfopSDJ6C22ouoNPrrtk41RsQV4pmDzgaQRcDE6e97MO4iJD74LywrOVrVGN
         2ZTibzw8JNo01OLml1SS88KPFixDnLbxEhjJucuAXWAVd9hg8+rV8YVXe54o/EguJAJ8
         Kwt0m2aJd1IcGUJ0lVGC9C29bZzEo0mQyl3ZI+WK1Qa0XGt4DaRpujNicDy0MX3fwx9W
         Az6feJp0NRUPaDW7gnPsePuU/axhm/EzlLPA75y82kgLkdwvAbgCkGaleFRpWAzLZi4Y
         WtXDHve77WfQWzFDgTy+a9OW51dnIt579evboSlRmqjmvpPBj9CMTDsCtqdrRsIJo/it
         TEBw==
X-Forwarded-Encrypted: i=1; AFNElJ9UPgqnSPwPP7ZKsNzT/eCQYKkGQTDQVDHDyGO2h1Bt+aKTcNmgDn099zw3wV8Cce/fQ5LmZTJzydj3ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIh131agbUtMavI8COmOkilFW6bcA+lnLSpF5WhATY3kNA70Q1
	Qn/tN4OfQTbgWa/FjfrJhphpFAa9GwJGNlrPnnCtb5ZbshdXCtEabD+7
X-Gm-Gg: Acq92OE/+CcnqU2hx+2zGYW/iXHGjmyfDxqA/X6iiW/6RXDaPx0Wb0cCAVrA5dQqK5T
	RUm0epObRCkkWyYst7BJhqMFQoanwBFWUYrFEGvxGF+Dl8dOpI/IOmjKmpmszxWeK4QpjWF9CzP
	RYtdDxiVStvw8rjWV/w1UN6mM+GJU4tQicc0kqRxQsdA/viVLU9Lsj82XnMxE8KmppPGVReBByD
	2ztlaACiJFGTJjGO2jger3iRmZ0a0h28JTIqQpIz4/IvGQVQX95XMS1KeTeVkupZQ0KGfstwCZw
	dbZ6yUhrF9jYsUP3lWbZJO+vKcFdbqKgOlWmXM+5VobuAkvs2hAoxHE8/CbW9oo/eZgYzwA6MEu
	9xivkacJlhCtA/iWhcJM2yKAKAdw/uGlMKCOoA+S/vsEeRrucMo4K/gWci3vDi7SBsYVXfc+EqH
	jjEjnvmspJ8/EHLAg9wpgY
X-Received: by 2002:a17:902:ffcf:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2beb0385f3amr153090915ad.13.1779702751312;
        Mon, 25 May 2026 02:52:31 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:30 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 0/6] media: meson: Fix memory leak in error path in vdec
Date: Mon, 25 May 2026 15:21:48 +0530
Message-ID: <20260525095216.12078-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62707-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 255085C8D3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

V5: Changes 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks 
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check, 
  leading to simultaneous hardware programming.
--

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/

V4: Changes:

Following chamges try to fix the memory leak reported by Sashiko

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (6):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Protect session exclusivity check with lock
  media: meson: vdec: Set cur_sess before hardware vdec_poweron()
  media: meson: vdec: Handle kthread error and free codec private data
  media: meson: vdec: Isolate error path buffer flush to the active
    queue
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 54 ++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 10 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.50.1


