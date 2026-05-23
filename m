Return-Path: <linux-media+bounces-62676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HKoI+PbEWq+rQYAu9opvQ
	(envelope-from <linux-media+bounces-62676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 18:54:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 963565BFEA1
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 18:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A799430125A3
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 16:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C65324B22;
	Sat, 23 May 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBzvroCc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9F316189
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779555244; cv=none; b=tS5wk12bHMp84YirrqaTwIBYVQFKf4Hfn5zqycKAzd6x9DN6CMpJkZEa5pfN9uYsWd2FFMV8NxcscJDiCK1McqdLJ9fCfGFwk6VwboO52zO8tnT5Q1496Ly0iXfePhBMv0kDyKBwLLNgRSTvRj6re9UrxUTVu+s4QfYHe0FpY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779555244; c=relaxed/simple;
	bh=0MwoAX/J5bzYEqSgxGhyDDvWiurQkDJFryudRPqqyec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FU38Q4PXGVjAcC30IHkPYBg3+4eGjqOLguKH144Y/Sh6cXaaybF+dqFRqJQhrk2ydh0Ry/Rflm0gqFFgM0DQgzrGNE3CtFJIea9TtYBahnMG7ADXPbTLFTpaSzpiHkJOsCWdiaUE0gdyAIylfiAHpnTnE8QsMHbLwRyhXjIHGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBzvroCc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso94947021fa.2
        for <linux-media@vger.kernel.org>; Sat, 23 May 2026 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779555241; x=1780160041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUFxLs9xayiDL27YZLOgJaat3erm/tdOdPXhQ8ySemg=;
        b=eBzvroCcbMaioE1zTmmGAAnKkWj4XziwtoppjBPSUBHNYHhg3qi9Gr7E4g8wZFVOI4
         ALMeVu73nA43EsF/pRe4mkwoV994r0VTNuts1NXsKIn954nW7koCN3vxRMpvbfxKu80w
         xycee3g/DQ1wJdk4Gvggg52Tl9GCgp8uVcKV9GpDx75STxoWMmYaDC2wZcyDaF3lWv1u
         HKsOR6yusvCSw1CCgHUg7opcGZmaKT68NehG9qh7dRmTS/4FcDL1vSHCbeM2H3zuF2Z4
         BncHO7uvwvCjdO2C56tEpR/7QGuJKE9ES6B+NsFSwfxMnyVJ+EWtvOPLHiilwP4Rjg3b
         cBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779555241; x=1780160041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dUFxLs9xayiDL27YZLOgJaat3erm/tdOdPXhQ8ySemg=;
        b=GHlFwF+ktp7Rb7A1HtzqjopMJwi8nTDdJsD5x9qX4naTjMhOfTGKo5mq9TrXoCJs9+
         JmCCrhMnYg3ISVZiOr7GZh8sgtX6tu0PaQSjXIvXg5J06NpekjdEX4kONT2gXUYOjvJz
         8sBkP7QQ138ZjtZr1OEMMjp/9eGCFyn9g9tlcMZIS+zZVdn2+Y/drfuHfPF2O8qDPgUQ
         KksMctHJFYgYy1OH0+MVAHGktUMgQ7lLuOLNA67cNaEMBii//Nci/uX0FyuIgmGDltQe
         1CFKdIiU6j2Gg0Dq8XG438o8gg3F6/3/q4CwgteH0bfPubyBqV+WAHKWQ1OVGYsWIGKx
         omZA==
X-Forwarded-Encrypted: i=1; AFNElJ86Pk2XmXVh8o/HD5O+4VLXMveUp26n0m37bxDDM8JEUtHlm4g3WGnC5VsVwtGqpnDjqBfZOf7SQnqLkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lPRJ0/4wRDe0fXnRfOKRoSP9TIoNLTpiO6IhDMQLMtfQ0Orf
	5o4tamo0UmV+yszgPFGslUO+xQnEWwpnVEBKgjg8KlWRXACRkrbivdNf
X-Gm-Gg: Acq92OEsA/RIekbjQC46txp0dTeD3P3/Jh76dUd0wmawA7ZNkCanM6dqfnMCe1yVQlQ
	hc6/tPZnI4vDWyRfW3lcqS8sGjnZ4DlLXN0zMO3ima/4MihYX1VO6T44qFt9zunfi9cXnuhi+Gy
	ZBt1fQzvozdrUszRFZTNYQsNeYH/WxpH2BAYelov1uTIH2IExtvqNyUX3xz96GUy5O67ccrlf2+
	I8fLUWO++4NWsVeOIQr0U0cXykPTFC8f4vGhPa+45MQUCW1fNxrF2UlCm8iqCBwrmhfkln46Nbp
	M5lELe4TNxp+5g26olfp2hqpE4T47bcQIcQHGfc22PdzDIbaZQmBWjmeTyo7xHbN++KGHwCHjzD
	smGU5lB1UCuYq/LP+iwti1I8H6K5CouDciGgL1UMnAU/NOWbF+qaINWQunk0H0tEvAydZ6i/IPT
	YQxFYNklRd0gx5l9TT4M7BH7v8dMe0xX4n3/WLsUH7/PzSYoamCfosc+ofg4UlfYLqzbLDlQ==
X-Received: by 2002:a05:651c:222c:b0:393:a4f5:3e0f with SMTP id 38308e7fff4ca-395d8c35f3fmr27895731fa.2.1779555241189;
        Sat, 23 May 2026 09:54:01 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2c6efsm12092981fa.29.2026.05.23.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 09:54:00 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: mchehab@kernel.org,
	crope@iki.fi
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rtl2832_sdr: release URBs and stream buffers on start_streaming() failure
Date: Sat, 23 May 2026 19:53:58 +0300
Message-ID: <20260523165358.286293-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260513055733.146905-1-vebohr@gmail.com>
References: <20260513055733.146905-1-vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62676-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 963565BFEA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rtl2832_sdr_start_streaming() calls rtl2832_sdr_alloc_stream_bufs(),
rtl2832_sdr_alloc_urbs() and rtl2832_sdr_submit_urbs() in sequence and
shares a single err: label that only unlocks the mutex and returns.
When alloc_urbs() succeeds but submit_urbs() fails, or when alloc_urbs()
itself returns -ENOMEM after alloc_stream_bufs() has already succeeded,
the URBs and/or the coherent DMA stream buffers stay allocated while
streaming reports failure to vb2. Two latent defects follow on the next
VIDIOC_STREAMON:

1) rtl2832_sdr_alloc_stream_bufs() unconditionally resets dev->buf_num
   to 0 and overwrites dev->buf_list[]/dev->dma_addr[], permanently
   leaking the coherent DMA memory allocated by the previous attempt.

2) rtl2832_sdr_alloc_urbs() never resets dev->urbs_initialized and only
   increments it. After a second successful pass urbs_initialized can
   exceed MAX_BULK_BUFS, so the subsequent rtl2832_sdr_free_urbs() walks
   from urbs_initialized - 1 down to 0 and reads past the end of
   dev->urb_list[], passing garbage pointers to usb_free_urb().

Mirror the teardown that stop_streaming() already performs: on the error
path call rtl2832_sdr_free_urbs() and rtl2832_sdr_free_stream_bufs()
before unlocking. Both helpers are idempotent (free_urbs kills and zeros
urbs_initialized; free_stream_bufs is gated on URB_BUF and clears the
buf_num counter), so partial-failure paths and the no-allocation paths
remain safe.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
Changes since v1
(https://lore.kernel.org/linux-media/20260513055733.146905-1-vebohr@gmail.com/):
- Rebased on media-committers/next. The err: label in
  rtl2832_sdr_start_streaming() now also calls
  rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED) from
  commit 33ca0aab6f4b ("media: rtl2832_sdr: Return queued buffers on
  start_streaming() failure"); free_urbs()/free_stream_bufs() are placed
  before that cleanup, matching the order in stop_streaming(). No
  semantic change to v1.

 drivers/media/dvb-frontends/rtl2832_sdr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index c564485e3bbb..036b67a17b7a 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -906,9 +906,12 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 
 	mutex_unlock(&dev->v4l2_lock);
+
 	return 0;
 
 err:
+	rtl2832_sdr_free_urbs(dev);
+	rtl2832_sdr_free_stream_bufs(dev);
 	rtl2832_sdr_cleanup_queued_bufs(dev, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&dev->v4l2_lock);
 
-- 
2.51.0


