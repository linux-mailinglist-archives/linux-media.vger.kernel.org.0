Return-Path: <linux-media+bounces-61162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMCND+UTAmrangEAu9opvQ
	(envelope-from <linux-media+bounces-61162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:37:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE905139B7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A24630ED490
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DA0466B7B;
	Mon, 11 May 2026 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8N3d+r2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2674534B9
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519545; cv=none; b=BrwL0068ZA1Cg/W4GAqubIzMoK24X55JULX4bPK78aT0vNkD3Uok4V++1y3wGNzN5/rRUefmTB4appWBhcAFyc1Zhm69EoxdoTlLRliznt4aA2wmXlxwoYQR+FunA4vylmYH3Fb2HFeonf0eJ0xxXyHguqOIhLZpIZ3tDY1Ca9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519545; c=relaxed/simple;
	bh=Uc/exHc2g0MJR9S71NefJro1J1WlH0FhS5OXlnyqzIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXI8i3w+/fjI3Pl931hX09OOfEawnZyqZh3o/kMzFGqSkXtQq6cu6DEiElol0kM7dkYIj5c6pnhm5i4WAyUnr5FxyrvlrSkHJF8qC2CsKzVgEubuTpACSKAiodeff3JT7zmMRNHtS2mrKltfFbuqb6JYWct9pWgAbBfKFcVwjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8N3d+r2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5041984e87.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519542; x=1779124342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
        b=q8N3d+r2CRulpoPwLMljHh7rjrIyIDO8P1Ty/nZj6Y3zt/njB+NZOX+Vp57ATOskza
         H4mHzk6hzmcTFehT4xwrqLEbYTFXgFgw7uhxgysFnSw8E+ynjM/R0M5Dm/xjJ5AQbaGj
         y5rVxqMBO40p3rB+BPS+/0gOCt7pXRmVGSjNxGDubJhrqCPO1Bx/emnwziUy/jDRfjVu
         BOVO2baKGEfH8aHi2yWscfBO1cNOupG5DSwU28wu2yT124619X5b90kXCs/TJLjcK8Wt
         h1k+4R1IQS3tAAXd/p1yaW774D/DJt9CJwkJ5UrHQ82yhUQ0Bq5LMyuKe6yVxjECmO8R
         qMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519542; x=1779124342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TypizH+0naDcsiSshXyXpAX6OorxUGA4/sCVC58lq0U=;
        b=lHhi5rQb7OYymqR2MSy0MlotmaHOopor95/FNPSbNXUcQD5l1HTksYq2WyLGZ03LRS
         iATKCsEtPgpD7v0GVpbb0zVKBikA+5R7HLpm5h7IDuYzJit0h5UdMSPLmPdETcG/X4cM
         VNKdszxfjCzzjCO4029Bsq5Erxkhh6ZieYbQLNN6uvltQY/kP9JFForWvKMKYiQNUcAl
         N8QbiOKVg3i8aO4wHR8kywI/P1MvEcNdKn611WDUVEMdYKkZhQpzuNJR8ydiOR5v7sT7
         iGTtwK8is34QxWapn0i8GVFjdyudBNWhUydjIwxgYDKhgcRtkpAd39WkYz7YsopDSlxG
         QjFA==
X-Gm-Message-State: AOJu0YxGkrI8Xfipv4n3NlVxYCJe2PI5bMoJ8Tyz46k3FiO0dZTJfd0y
	cmIsVulDh+H9HiywC5mSSJLUavmEwmRpsEQB3XrQiLx0zy5IA3EH0BImWN6v4vzJ/LWVXTLg1vs
	=
X-Gm-Gg: Acq92OEtGSMgav0Yzv8PyPX/WyqolKt+fRPRLDqVQq3qMZOZxx4lc/MWhBfQidAFx6l
	rklxI9yJTs/tFWL4pICvRT9tb5Lj6Uv7+3ulBV3NaJWYogmN8L1jyD/SXQWlCKHAcUMXE4EXPlz
	EBJd4EMoVepNoStSKdL/pXaYSXf2nRVbuqgInzlBOmX/1hx4k0+JSmgP74YEoU5cqTs7N3qlUc+
	rLLZBRmsmUCxMhtQrfBoyfedW+IXb/z8RMOr2ZEP3yG+gJVs/M2avUbJUER0yULPCdhhkaq5vJh
	xQxWLK20FSHGfkVoeegMjYZ1tTQB/RqQnwer1Dj9G/83QXqV7zFOvokZMkmA38YVUDbg+4aW99N
	q7mQ2vaQH5m6K/O37UcYupS6B33JWMAM0+Ni/q8r8ZDeH9218I798AgtmOZgGivreM2M6OaCYF3
	Dv/53PPKpqocKNAffo+UL0sk+BiOkzh8luBB0E5+aR7k5feDoCGZVcfrqVJphHG15Y1Zmyuy0=
X-Received: by 2002:a05:6512:b20:b0:5a3:fe60:471c with SMTP id 2adb3069b0e04-5a8a94a8fcfmr4465968e87.16.1778519541397;
        Mon, 11 May 2026 10:12:21 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:20 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/6] media: rtl2832_sdr: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:09 +0300
Message-ID: <d10ab7f1bb6b4ee1760967f1957191a341b08354.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3FE905139B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,gmail.com,linux.intel.com,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-61162-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

rtl2832_sdr_start_streaming() had multiple error paths that hit this
trap: two direct early returns (-ENODEV, -ERESTARTSYS), plus six
`goto err` paths covering subdev s_power, tuner setup, ADC setup,
stream-buffer allocation, urb allocation, and urb submission failures.
None of them returned the queued buffers.

The original function had no distinct success exit and fell straight
through into the err label, which previously only did mutex_unlock and
"return ret".  Adding queued-buffer cleanup at err must therefore be
paired with an explicit success return; otherwise every successful
start would also drain the buffer queue and kill streaming.  Add that
success return, then add rtl2832_sdr_cleanup_queued_bufs() at the err
label and before each early return.

The cleanup helper takes a vb2_buffer_state argument so that the
start_streaming error paths can pass VB2_BUF_STATE_QUEUED (as
expected by userspace on start_streaming failure) while stop_streaming
keeps its existing VB2_BUF_STATE_ERROR semantics.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

The err label still does not roll back power_ctrl(), frontend_ctrl(),
the POWER_ON flag, or stream/URB allocations that may have happened
before the failing step.  Those are pre-existing leaks of a different
class and are not addressed here.

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 422d1a7b5456..c564485e3bbb 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -399,7 +399,8 @@ static int rtl2832_sdr_alloc_urbs(struct rtl2832_sdr_dev *dev)
 }
 
 /* Must be called with vb_queue_lock hold */
-static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
+static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev,
+					    enum vb2_buffer_state state)
 {
 	struct platform_device *pdev = dev->pdev;
 	unsigned long flags;
@@ -413,7 +414,7 @@ static void rtl2832_sdr_cleanup_queued_bufs(struct rtl2832_sdr_dev *dev)
 		buf = list_entry(dev->queued_bufs.next,
 				struct rtl2832_sdr_frame_buf, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
 	spin_unlock_irqrestore(&dev->queued_bufs_lock, flags);
 }
@@ -855,11 +856,15 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(&pdev->dev, "\n");
 
-	if (!dev->udev)
+	if (!dev->udev) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ENODEV;
+	}
 
-	if (mutex_lock_interruptible(&dev->v4l2_lock))
+	if (mutex_lock_interruptible(&dev->v4l2_lock)) {
+		rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 		return -ERESTARTSYS;
+	}
 
 	if (d->props->power_ctrl)
 		d->props->power_ctrl(d, 1);
@@ -900,7 +905,11 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	mutex_unlock(&dev->v4l2_lock);
+	return 0;
+
 err:
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&dev->v4l2_lock);
 
 	return ret;
@@ -920,7 +929,7 @@ static void rtl2832_sdr_stop_streaming(struct vb2_queue *vq)
 	rtl2832_sdr_kill_urbs(dev);
 	rtl2832_sdr_free_urbs(dev);
 	rtl2832_sdr_free_stream_bufs(dev);
-	rtl2832_sdr_cleanup_queued_bufs(dev);
+	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_ERROR);
 	rtl2832_sdr_unset_adc(dev);
 
 	/* sleep tuner */
-- 
2.51.0


