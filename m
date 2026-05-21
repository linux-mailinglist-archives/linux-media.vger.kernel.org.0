Return-Path: <linux-media+bounces-62408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN6oE7G2DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:39:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A447C5A03D6
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB230307357C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AE839B489;
	Thu, 21 May 2026 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOLWwb+0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A4929B228
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348903; cv=none; b=cYGd0v7icoAXzmYXVcKbF1RVgG4cCEP2aGGFCUBxTQq7R2dHZaLbcES01J5dFbLCCCFhlu4igKkv/NA8p4a75exkUq0QYuHtcarUctTjt5LiI0UZa/kEdl+5Kb06LO27ki+/ku/8htO0bvWK6ig7aAw3Yroy/6za29BNyNrNOMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348903; c=relaxed/simple;
	bh=H3A1ZqsEWXy+Y9IWbVTa6nORcA4uBPnBGNaZzs/OZWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPi6efNwAMi6HqxwxhoOXCc3jJmymhYauJ+CZ1Mgaqobw0XsV592TboHlCIHpIhniBleMQRE4doRUaCivpgrOdl02dYaJtzXq4YxW8Vs5cdS1NMpD+upWM4mRodlU3eNq90bn38LkVhNPj0GxdhmWsOywWZMjfDWlqva1CriANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOLWwb+0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso2721941a91.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348901; x=1779953701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=MOLWwb+0n4Zzi80WiBuMz3qg2CuNnRx4a3Dgj2Rk9JktEcM98BVMwU4pT9kVE/MO7B
         SFVD/E5I2khqqFgp+n1BF3SA07UQuz0vTHSmoIPbDUCYOkDLfdyN0BtD5dRrP+MdCttC
         E4CC9bbaaVv930uxkxwNyblpgQr8RLtUf00SVCEjDNgthKIR194NeFp0BRdL7QsGlVnr
         KVBdFa2uwJrYcWQPAZltmIynrh34WRZRZV/tmk5yCQsrPE+SFMX082uoIMjjEqFJ8xE9
         12cW2DKTGnuHz19GjnmMQJb3VAiG9zKdANQ2L+dq8uezbQVT/YCr7acdGOsnEvH9Ai8o
         DUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348901; x=1779953701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=jeKhZYklYUSHrvtCy7H+XRM4u1bpigjYFGwyiukMev4VmV/kxtXxrJ4gx1fbSPPJiX
         r5+rTCEl8590Iws40qsJelqZQdNvXzhqErVADdJkFqCtl45qQKw5B1yft9J8GYL21pVn
         5TjcK8LKDbMHHGxWCSr9MMKuxFKOnvBU5sxUTOfI9gPM1pLBZkXjeGCmINx2EkP7VEc3
         iRcCgQMYUr4AldjNUFF10zrcldlRZB+OoNhNHzsxsK7ny7Q7fNmeJciY9qs20vAr4Owp
         wGB7sWh3M1QwQXVH1XmC2TfaDCEzpnHNqzXb3qXtsRQxZKZbkvcP8yMPz7cIRpSGO04Y
         NQxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jR8/PXdWAme4hXVbWjEKJTwY8xnWmCQtUnQjZ5IEnhGJQyWaTmdrzyZlx6YKGUhQwVzB0bF/XhS9q2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1M6TX2WoYxgiEi/CE1dHfog0sbAhVb7PhKmbJvy31t41fsk7U
	h69yuWGhcndaNX2MhRG/m2/VAtU9WIPiai0ji1522BWG8gXGv8VhTmde
X-Gm-Gg: Acq92OGxVsY+Fz6ai0Rc0lls+oQu8GFOku+mnBFT3JOjA4e1cwGWEidVWDCYhPFu+mr
	zL4himIoBmQFoD19tU3oVUIh86SnxGbowgcpLATuU36joZ8L/2c5NZOWZpTvYbS+1M3iBkplhKq
	b0aC2BHyGuL6sK6pZ2IieNUKoZ6tbFcK5HWoGpKafP9ZFAf8HrJXWItro6zD7uMiUa9xWsD+pby
	inHzql7PeIBZ1fOqQfCFVNp8PCQlV+QDU4KcC3T0EVObqS2n9egIJvsY9ep3oW4v3JYu1P2bIZp
	5t8c3+bVgGax1FO1WEG37IUJ4PzoTh1Kt3qcUcZTzqvQYkCmYElw3nkoBwZk6G3J969mEMBv71W
	2m0nTJnopiwYIv2Rt3KZ/+ToCtOyUliRGsFXo1GxxnS+k9yi66X0+ye+lVjdWdx0E3GEnxmAyA9
	s8bl/Rw2dNO0IdfBRGvZ76
X-Received: by 2002:a17:90b:57ce:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a44f18393mr1788402a91.3.1779348901391;
        Thu, 21 May 2026 00:35:01 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 0/3] media: meson: Fix memory leak in error path in
Date: Thu, 21 May 2026 13:04:10 +0530
Message-ID: <20260521073449.10057-1-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-62408-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A447C5A03D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (3):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Add error handling for recycle thread creation
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)


base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
-- 
2.50.1


