Return-Path: <linux-media+bounces-67482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U3hOM/rXVGrkfgAAu9opvQ
	(envelope-from <linux-media+bounces-67482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2C74ADDC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:20:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mPwzuza2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67482-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67482-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3454F309756D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9237409624;
	Mon, 13 Jul 2026 12:11:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52840B6E2
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:11:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944674; cv=none; b=JuAkW6Cy/krZ04hVbDLQA8QXscvbOncZnXJoOm6WJ/VfvBPGfjwCkP6J6wPPiz5aocm3h8aQINqrRF7dHXb776czd/sPK2/PFT1DcmPIGTnrMkjWIpb4ld8zN0awSyttFAmPANtQZW8IQYPergXFVD3DmuN9eG10l1QRiOWpJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944674; c=relaxed/simple;
	bh=zCGdfwgN+TNG39gAmZu2s6yLUo3JyS1qCB3nKCP6UcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8dRaZsC5CxR5caKauOGmV9iel7xwJL7PJoJ/TiQeLV5jQUWtf5vBuN5hKM+VytfMErTnCPfF9NHtBzt+TzK2f3oplF4EyWrORXhXzTNWShUGnrZ4p9NoUpM9NcrQcOEDuJ2M097zCAAtVoADRyzLbEaLVamM+mDQVMrC56Z+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPwzuza2; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2903190a91.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944671; x=1784549471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=mPwzuza2XbnFq8pu0Nd38dTNkNHN/vfxSxTeEAupHDoPIM4vclbtDWpNYP5fjRn7jv
         +BEALwYHoHP7t1TAcIlQpikyNYY92RgPd3GSfB9qNXQ0JM8kK/A3gpSM6+8otmBfT5Hf
         YrBMsSQ8Ksmglp8oE+jgBI8gmQc+KW+sEo2F7JI2yK5shv0CO0dkw64ZLNMT3AXhy0rs
         Javxd4z2gwNq7t/Y0lWVtATQwCp4Nub4dZjEsSjfDKKJLuEKGN5BtHpOQOlLcSBwKoHh
         MUL5eugQktOI6OWR0TQED8nUUitl8adB3ewVTdtriGJ7TwynPO108nFv5zOVjf5iaN7P
         EAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944671; x=1784549471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=BVOtnzg5TTZNaRtStouhs+HV6MyahBEvTsu3w1FrHzX6BkG6GIqGdHDTF0vMzg53Pd
         gscp8j9rr8cdDpZ1bs7oHwlPsExN5lqDAVFcrWtOkkf8dZxxLOgolUpAoffLfqWSXmIc
         SPJRniqjy6jFFYEADDrTffAtcjbuDraVLveq9b3ncQEQez3vEk8HtJP3a4Fhwn2fwFCG
         lnbSqBdXok9BhJrAvF0U9YdN5ivf9+ln+jmxsh7Hon8NbC2iyEL4GeWR94LQVqRHgvle
         hAMsVuEvJTlGz//hZL8NWWDBbv+YnB4zzqM+3ctPlBPjLpvGnPXb2wk3y7Vjz8qpB+TS
         00Qw==
X-Forwarded-Encrypted: i=1; AHgh+RphUfspD9vCN4MYIzVmGqeldDJzl11TYxGiLUWYZ1jJGChw6dEy7CRcfEcrXM6OJp+uLhCic92HxkeUEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHEQlSuPKp+MXAQH73yN/B9EDblYUzLRqzyY4AnG9Kthm5lkp
	OPUuY2Uc5MaZUh9olDnQ8rvIVXnH8r9aF0WUzsfz2ilDJdq9ezhDSODW
X-Gm-Gg: AfdE7clvZ3orM4s1j9u1s7NJ/U/xt485V0wDKAuynBtr3gpBBXs6SAKi82KLzSdouFX
	hHqnhrrFejt50UMsktbyROTGvADu72S22w7CT9n24TP2jm9awaCLYoUcS7FbDxTrUcNWt3aV768
	YIZrxSJbMO6C+L0BzyxCSTQdtKdQ/YuplZ8XzKmgNxFetGTr9Wn8u6JQgah2KVPpGz0tUdpiQKp
	4IcVX7iOb0Wwesg8r86unDKL26ZBnb+YnWxKFikc+9O6sQ+qJF74ySET0r12qe9t88JP1GEhoPc
	0gygd0EeaKbm6upRH0mNqXMcetVyVHG3vnNTgwWE8ad4jmMLheHAfD8nftdlwsbKh8RjQ3RJdBD
	H7Xfxo8n0J4BO8HR9YfVaUlsVLiwdjIxvMmY8wMV7YLxrfbcdM4CEnC9jRw+YgS3bjMhqzlvtPl
	oFuAPG9v4t6mNLUd5j58ny
X-Received: by 2002:a17:90b:4990:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-38dc74c4c2cmr9218450a91.7.1783944671501;
        Mon, 13 Jul 2026 05:11:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:10 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 13/19] media: meson: vdec: Fix race conditions in job abort sequence
Date: Mon, 13 Jul 2026 17:37:08 +0530
Message-ID: <20260713120840.17427-14-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67482-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24C2C74ADDC

Implement proper cleanup inside vdec_m2m_job_abort to safely stop
the hardware job sequence during a streaming abort or teardown.

Without this, if a job is aborted right after being triggered, the
deferred work item (esparser_queue_work) scheduled by device_run
could continue running concurrently. This leads to unexpected behavior
and potential use-after-free bugs if session structures are cleared.

Fix this by flagging the session to stop via WRITE_ONCE, synchronously
canceling any pending parser work, and safely clearing the active core
session pointer under the core lock protection.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b3e1d99e8889f..ac86a9c4febff 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -167,6 +167,17 @@ static void vdec_m2m_device_run(void *priv)
 static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	WRITE_ONCE(sess->should_stop, 1);
+
+	cancel_work_sync(&sess->esparser_queue_work);
+
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
-- 
2.50.1


