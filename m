Return-Path: <linux-media+bounces-67481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kKeMMXXXVGrAfgAAu9opvQ
	(envelope-from <linux-media+bounces-67481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:17:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A174AD8F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pzmcGsfS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67481-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67481-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16D493084854
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D2C404BFD;
	Mon, 13 Jul 2026 12:11:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239963F4DC7
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:11:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944663; cv=none; b=DZ+bCqh58vbe//jOVWMBbjLYWXBZagEG8uZiseH8Uvpjog5fhHXmrBWGqPvKj3ifc1YvXI0bXklm+xbIiZ0VD1DGGRMrNtSXkYtj0TlzLalc7BtLY3xQaAdG7ryTifxFq9n79CJVMYcZt/16kLr3uz9Lwp+w7v2JzNKQBYVF+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944663; c=relaxed/simple;
	bh=jmhAhBUOyXzBgu367txMVdCDQtWx981CcyJsmZjgz3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4LtVLc6dpsa85Dn46FGkivAwSVdtXC5IchYrD1qNQeVW5ScaU8Cgq5ylVv2en7Cj/+qsHglZQtmK8Mzsl2wxG8nECVumIbNN6KKH/ScLjvP7Wu/yDtxVdxV/0JOc5IefuJzjtjT0wSXPOtzELM721Nh7dYmAMcqeJEAC0vfE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzmcGsfS; arc=none smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2143482a12.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944660; x=1784549460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or8zdD24QFos1ceTDAq+AN9AMfFHPT46CUnsHlWUgzA=;
        b=pzmcGsfS+Ix2DEKnYhhx7slb8QFyqysIvz8R8Ww+bHYfo60wM497DbW33r1pn9213V
         RE8paDZVoA1zQHLTCpNY2az0j2p3otW1E8sQLrjdLgQGOeEl5F/FOxFj9H0xDvamlQm/
         MGzftxXCXiD2Vxu3QYRpYvON3+tw49w5xGEjCX5eCm9N9zt5802Il6X69iSpAuKVye+Z
         Buox8BF5vlUuuXhuLgbrzrw2L2sPNE7cC3PWikXKwr9owRQvx9mSsQNk8rHPwgY3IwUu
         lGq3qBYX9MHpm08QJyvHA+b7vzJScbj3DaeADmuJiQJm5mextmkXjTlRIdZPk7iZL92d
         BGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944660; x=1784549460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=or8zdD24QFos1ceTDAq+AN9AMfFHPT46CUnsHlWUgzA=;
        b=gx5EXAtv0lSajiIy7XyEVUHRCDBvg/5ih0YhKPB7HOBgip4OIxipExaYnXket4rVEl
         Z+g2WMLd6gEV40YAEoPjp4OdmbzVXQq4vHSFs1WGG9yoAAnStzBloqtu3wBJLxj+afLS
         aV6uOEEDZ5O/WoSxWhEcwQvsOp7F2FNUPBiPNeaTrrLJva2Y4reIfh7uYzaKgYALAe6i
         XfZOQo+uMx1CW6Io5tT0d72H6rpWFKwrSX+e5+pVCvEh7dqCJWpnuk3fE+Gadvtp+ure
         SE5WGHFmfjN8pf7/V7Hz9feyhMMLzXvM4N8BDVSdIym0+ldxVuupF9WCk/LK4DqoJ6cp
         h6Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rq+5XlrgyGV6ZyolofSRbYg4GPsnQsTkWGtzK2KWPKbH6Cnd4EUjSKuTzx8AmlhZT/x1U5076xoqo76OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgexmEd9g1A2NfOX2wnYdxvFaxwmNfLtv9PcJl5oYZpt1fl6p
	Sg2FQG/CezLA9AtSazMSMZl2azZ+jWsWgYpiBxGzCH7nUNd3Va4N0FlL
X-Gm-Gg: AfdE7clOCBLkUtsb3xLM//8CA7Y3RWOPuvYeqfVSda2Z9aplk2TkMt3GxhS5UzTq9gQ
	T+2xp5XbyxVnydj1Zx2i/2XbXtRmlQ44u7GGB5TOuM5B9xlaaNYeEJ8IMbObIrQJL/TCsStOBuv
	7F3ji4+Go+2sTQy2s/dIFIEc6Q68/K3a61dcGYNqhxP7O5ops1PpJISlPelMtkST2BEyGCXlmKx
	iD6CaOj2o/LkInf2T5MBPrsKkm/eBq0aVUlKr36Gyyg1sjQYpg8KAKhIiJnYeFsHVKRGb4RIS2S
	XUtl9sngv8mW97WhlQy7nDvob0UsFzZ2YOXQo54BdI/sqBCJUW2RPqLyawyANn5YIn2M5qsydRN
	tBfVDkMh67O+lwTsAb9oXJ9ZCQQo9skVCShbY7bVkNLv12NO5HHw7qc39XwMN0ySuqx1QYP5qS/
	0C4vJwjau5F0pj/oyyEtGr
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8266584a91.32.1783944660581;
        Mon, 13 Jul 2026 05:11:00 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:59 -0700 (PDT)
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
Subject: [PATCH v7 12/19] media: meson: vdec: Coordinate m2m task execution inside async loop
Date: Mon, 13 Jul 2026 17:37:07 +0530
Message-ID: <20260713120840.17427-13-linux.amoon@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67481-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B51A174AD8F

Introduce proper V4L2 Memory-to-Memory (m2m) scheduler pipeline tracking
by handling job finalisation inside the asynchronous esparser workqueue.

Because the meson video decoder offloads raw hardware register processing
and bitstream feeding to an internal workqueue engine, calling the helper
v4l2_m2m_job_finish() prematurely within the primary device execution
trigger context (vdec_m2m_device_run) drops the active task transaction
state too early. This timing gap creates a state mismatch in user-space
multimedia layers like GStreamer, resulting in a fatal "poll error 1"
event abort that breaks streaming setup sequences during pipeline preroll.

Resolve this architectural loop collision by deferring the scheduling call
to v4l2_m2m_job_finish() to execute exclusively within the worker routine
esparser_queue_all_src() at the precise microsecond after an input buffer
payload is fully validated, cleared, and returned via v4l2_m2m_buf_done().
Additionally, protect hardware session context mappings with core mutex
locks and implement volatile early exit gates within vdec_m2m_device_run()
to ensure stable teardowns.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c |  4 ++++
 drivers/staging/media/meson/vdec/vdec.c     | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index b9f36fef4be12..939b239c2af47 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -399,6 +399,7 @@ void esparser_queue_all_src(struct work_struct *work)
 	struct amvdec_session *sess =
 		container_of(work, struct amvdec_session, esparser_queue_work);
 	struct device *dev = sess->core->dev_dec;
+	struct amvdec_core *core = sess->core;
 	int ret;
 
 	while (1) {
@@ -437,6 +438,9 @@ void esparser_queue_all_src(struct work_struct *work)
 			else
 				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
+			/* Safely notify the V4L2 core sub-framework */
+			v4l2_m2m_job_finish(core->m2m_dev, sess->m2m_ctx);
+
 			/* Set tracking flag indicating transaction completion */
 			processed_frame = true;
 		}
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 0eb39aa6014ee..b3e1d99e8889f 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -149,6 +149,17 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
 static void vdec_m2m_device_run(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	if (READ_ONCE(sess->should_stop)) {
+		v4l2_m2m_job_finish(core->m2m_dev, sess->m2m_ctx);
+		return;
+	}
+
+	mutex_lock(&core->lock);
+	if (!core->cur_sess)
+		core->cur_sess = sess;
+	mutex_unlock(&core->lock);
 
 	schedule_work(&sess->esparser_queue_work);
 }
-- 
2.50.1


