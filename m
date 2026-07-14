Return-Path: <linux-media+bounces-67566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uimRKUY5Vmrx1gAAu9opvQ
	(envelope-from <linux-media+bounces-67566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:27:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C275516E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FvRCxAVC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67566-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67566-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A267330B2870
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7536230BB8D;
	Tue, 14 Jul 2026 13:21:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529A112CDA5
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 13:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035294; cv=none; b=iOz+BJwqatq7nyKqTr7SQFvQDyivx1KqwqF5/TvRyHqnA+j8geSRSHMEpqinI6XXGFPdPQ6Ak0RA0JWNmvzzAQ69UwPLl+JYD4IUt9citDxwlPqBcq7ih23SS9oBYVsLYQHZqPNYGkBczQUtUodJTJhs41+sDtx30SqsrARvxoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035294; c=relaxed/simple;
	bh=Srv5fLjlcBt+I4Y2YUvAixlGYoBjMd5dwR1EsTURdrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hyNG1nq5lkelzo6a6DNzX5C6GM7PywHYBW9mWapfsA5Q3m1KDIjrAJx/oAbRY/3eOj6udsqVZcczRQ1mPnM265qcJjM9BbHb+0BZL75FKVsHITXw7157XldkWDNJJm/4TwLMFaoDAhqynlJhJw+I52xIz+sd5OBUt6WGn9bviqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvRCxAVC; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845c92bc464so956834b3a.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035293; x=1784640093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWA2pdRQ6l8w4+g2rx0Pkw+ZVozyVuWGGSCZMNK3koU=;
        b=FvRCxAVCpASYzRUVuj1QMBj3PjRY6yd3PH4WG1yj/+O9lkFGvTWuuPhRNE4Trmqkrc
         HrS18QTAmcP1h4OraD0xuIunWquf6oTRbfiX1BqyRC5TUcIGhXIGFnKT1oagreWost/q
         sA2t2dLFlwAwVPI2iG2X+MyIlwZUB6SwDthntEVTsGVKQxtQO0a2M/4wwjJDA8EjXZzX
         zSACmLoZLXObgNCoL/XliZZYpmTTX1B+3e50Gq/6I83C0w5wTSYh9OcR8GDEXLYAjq1y
         g0Y04EZ4BTI5Ew81Mn3nIySTppJbfhFFvKb9/Q1CRd0EyCr9Hjrm5Hd8ftuS/kYs6lGY
         X0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035293; x=1784640093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWA2pdRQ6l8w4+g2rx0Pkw+ZVozyVuWGGSCZMNK3koU=;
        b=TL8tD/LR8ujDI3nAC+tmVNvmpac4/+RNYQ3zx/Xbi+WnSRhEAr4U7o9YyVwqhv8WYz
         cXBGEEPmXdAqg+oQkSFhdLh+2QNCBtsHckcAESta2ttmsRNWNVjsxMwF8dnEyr0zLfOI
         8eD49F4fDEhDBlRegwlvz7KZJloNrWb8SpcB7MzClOG5nbBoKTvsxDTg/5sQkrROwSfn
         88cnBKcdhOJZFidmhS5KveyYBy2PM+i8xEn9+m5GaFoc1EfRWGGOZu5DtR9AyQA/DWGd
         YJE0ofMgxE06Pat4dpEYvVFAgGRG9isHP24SPDNm9L3lrJpLT1CKlWyB7ff0lRodPmaO
         ZNPw==
X-Gm-Message-State: AOJu0YzYOW2OygFaFftfVHvpuPzOt9Wi3KyD9goca27b1d/0z+reIQRF
	hNBQEZYOVfHOzq7pwMxSgShh5dVoP28XQ5gtfIB/zbyMfDJaN3HBvbAcIJ7HoUsJ
X-Gm-Gg: AfdE7cmq28tTySex5F3ibxvxtAlRYVx4YVscwIRHbBZq9N5IS0LX8LaTQDUOpmfz8/D
	PL+GYEvDXnpBVfdZctyWfzfN2dPdsOe/cNkcrPx5pa6GGx3+dth02wl4/0l+wBrP85hDktlEANd
	1Taij2aAr4XI2KVr6ZBxjq71YlSWvOnuwJ2cJQK0w9V6TNft2XzpGIkQJSQNZo7jJLK/rbqF8J7
	nzkm3r3W4k/sYhxzM6Z+lGCeMg+mrScJz0OAcwTAz3FSFyh9aXeIh7vgcST66+xIimztqrwUwK7
	xB7GDRsHbThQ9NI2DNc655DKV65JLUlzyhVw6HfQme+X9pV0rkulQA6dVwtB4amdNaHzL1Qp0LA
	XiQaPDxSuZB0/3fVa0W7aOt7txlPa0qhawV0u60h2FmntOgVmS9Jw3KVb9fO4wWv3syNVeXz7H/
	T047zfOk+U/Sr5FF3zejfw8cmip/K1TsJzBdb+HuM=
X-Received: by 2002:a05:6a00:9295:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84889618fdfmr12660747b3a.31.1784035292328;
        Tue, 14 Jul 2026 06:21:32 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661f:3046::4cf:36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6be668sm1515482b3a.35.2026.07.14.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:21:31 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: linux-media@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: dvb-usb-v2: nerc: add support for NERC DtmbUSB DTMB receiver
Date: Tue, 14 Jul 2026 21:21:19 +0800
Message-ID: <20260714132121.109385-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67566-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mmyangfl@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mmyangfl@gmail.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmyangfl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 157C275516E

NERC DtmbUSB (04b4:1004) is a highly integrated DTMB USB receiver.

  * USB Bridge: Cypress CY7C68013A
  * Receiver: HDIC HD2312A
  * Tuner: MaxLinear MxL608
  * ROM: 24-series flash

Three hardware variants is found: Letv, Aiwa, and CVB.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v3: https://lore.kernel.org/linux-media/20260713100211.29548-1-mmyangfl@gmail.com
  - fix timeout issue
v2: https://lore.kernel.org/linux-media/20260711140811.1689525-1-mmyangfl@gmail.com
  - fix wrong memcpy arguement in nerc_control_msg
  - fix warning from swzigzag
v1: https://lore.kernel.org/linux-media/20260710063237.1430919-1-mmyangfl@gmail.com
  - add a comment for checkpatch warning
  - fix an uninitialized variable
 MAINTAINERS                           |   8 +
 drivers/media/usb/dvb-usb-v2/Kconfig  |   8 +
 drivers/media/usb/dvb-usb-v2/Makefile |   3 +
 drivers/media/usb/dvb-usb-v2/nerc.c   | 381 ++++++++++++++++++++++++++
 drivers/media/usb/dvb-usb-v2/nerc.h   |  40 +++
 include/media/dvb-usb-ids.h           |   1 +
 6 files changed, 441 insertions(+)
 create mode 100644 drivers/media/usb/dvb-usb-v2/nerc.c
 create mode 100644 drivers/media/usb/dvb-usb-v2/nerc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..a86e218e79e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9158,6 +9158,14 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mkrufky/mxl111sf.git
 F:	drivers/media/usb/dvb-usb-v2/mxl111sf*
 
+DVB_USB_NERC MEDIA DRIVER
+M:	David Yang <mmyangfl@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+W:	https://linuxtv.org
+Q:	http://patchwork.linuxtv.org/project/linux-media/list/
+F:	drivers/media/usb/dvb-usb-v2/nerc*
+
 DVB_USB_RTL28XXU MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
diff --git a/drivers/media/usb/dvb-usb-v2/Kconfig b/drivers/media/usb/dvb-usb-v2/Kconfig
index 4eadc9539b4c..8f0918728de1 100644
--- a/drivers/media/usb/dvb-usb-v2/Kconfig
+++ b/drivers/media/usb/dvb-usb-v2/Kconfig
@@ -144,6 +144,14 @@ config DVB_USB_MXL111SF
 	help
 	  Say Y here to support the MxL111SF USB2.0 DTV receiver.
 
+config DVB_USB_NERC
+	tristate "NERC DTMB USB2.0 support"
+	depends on DVB_USB_V2
+	select DVB_EC100
+	help
+	  Say Y here to support the NERC DTMB (Cypress CY7C68013A + HDIC
+	  HD2312A) USB2.0 receiver.
+
 config DVB_USB_RTL28XXU
 	tristate "Realtek RTL28xxU DVB USB support"
 	depends on DVB_USB_V2 && I2C_MUX
diff --git a/drivers/media/usb/dvb-usb-v2/Makefile b/drivers/media/usb/dvb-usb-v2/Makefile
index 58c0140e19de..0c33dd50f2f7 100644
--- a/drivers/media/usb/dvb-usb-v2/Makefile
+++ b/drivers/media/usb/dvb-usb-v2/Makefile
@@ -35,6 +35,9 @@ obj-$(CONFIG_DVB_USB_MXL111SF) += dvb-usb-mxl111sf.o
 obj-$(CONFIG_DVB_USB_MXL111SF) += mxl111sf-demod.o
 obj-$(CONFIG_DVB_USB_MXL111SF) += mxl111sf-tuner.o
 
+dvb-usb-nerc-objs := nerc.o
+obj-$(CONFIG_DVB_USB_NERC) += dvb-usb-nerc.o
+
 dvb-usb-rtl28xxu-objs := rtl28xxu.o
 obj-$(CONFIG_DVB_USB_RTL28XXU) += dvb-usb-rtl28xxu.o
 
diff --git a/drivers/media/usb/dvb-usb-v2/nerc.c b/drivers/media/usb/dvb-usb-v2/nerc.c
new file mode 100644
index 000000000000..fe25614067cf
--- /dev/null
+++ b/drivers/media/usb/dvb-usb-v2/nerc.c
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * China NERC (National Engineering Research Center of Digital Television)
+ * DTMB (Cypress CY7C68013A + HDIC HD2312A) USB2.0 receiver.
+ *
+ * Copyright (c) 2026 David Yang
+ */
+
+#include "dvb_usb.h"
+
+#include "nerc.h"
+
+DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
+
+static const char *nerc_variant_name(enum nerc_variant variant)
+{
+	switch (variant) {
+	case NERC_VARIANT_LETV:
+		return "Letv";
+	case NERC_VARIANT_AIWA:
+		return "Aiwa";
+	case NERC_VARIANT_CVB:
+		return "CVB";
+	default:
+		return "unknown";
+	}
+}
+
+static int
+nerc_control_msg(struct dvb_usb_device *d, u8 request, bool read,
+		 void *data, u16 size)
+{
+	struct nerc_priv *priv = d_to_priv(d);
+	unsigned int pipe;
+	u8 requesttype;
+	int res;
+
+	if (WARN_ON(size > sizeof(priv->buf)))
+		return -EINVAL;
+
+	lockdep_assert_held_once(&d->usb_mutex);
+
+	if (read) {
+		requesttype = USB_TYPE_VENDOR | USB_DIR_IN;
+		pipe = usb_rcvctrlpipe(d->udev, 0);
+	} else {
+		requesttype = USB_TYPE_VENDOR | USB_DIR_OUT;
+		pipe = usb_sndctrlpipe(d->udev, 0);
+		if (size)
+			memcpy(priv->buf, data, size);
+	}
+
+	/* value seems to be ignored, but just play safe */
+	res = usb_control_msg(d->udev, pipe, request, requesttype, 0xfe,
+			      0, priv->buf, size, NERC_USB_TIMEOUT);
+	dvb_usb_dbg_usb_control_msg(d->udev, request, requesttype, 0xfe,
+				    0, priv->buf, size);
+
+	if (res < 0)
+		return res;
+	if (res != size)
+		return -EIO;
+	if (size && read)
+		memcpy(data, priv->buf, res);
+	return 0;
+}
+
+static int
+nerc_get_tune_settings(struct dvb_frontend *fe,
+		       struct dvb_frontend_tune_settings *s)
+{
+	s->min_delay_ms = 800;
+	s->step_size = 0;
+	s->max_drift = 0;
+
+	return 0;
+}
+
+static int nerc_read_status(struct dvb_frontend *fe, enum fe_status *status)
+{
+	struct dvb_usb_device *d = fe_to_d(fe);
+	bool has_signal;
+	bool has_lock;
+	int res;
+
+	mutex_lock(&d->usb_mutex);
+	res = nerc_control_msg(d, NERC_HAS_SIGNAL, true,
+			       &has_signal, sizeof(has_signal));
+	if (!res && has_signal) {
+		res = nerc_control_msg(d, NERC_HAS_LOCK, true,
+				       &has_lock, sizeof(has_lock));
+	}
+	mutex_unlock(&d->usb_mutex);
+	if (res)
+		return res;
+
+	if (!has_signal)
+		*status = 0;
+	else if (!has_lock)
+		*status = FE_HAS_SIGNAL | FE_HAS_CARRIER;
+	else
+		*status = FE_HAS_SIGNAL | FE_HAS_CARRIER | FE_HAS_VITERBI |
+			  FE_HAS_SYNC | FE_HAS_LOCK;
+	return 0;
+}
+
+static int
+nerc_get_frontend(struct dvb_frontend *fe, struct dtv_frontend_properties *c)
+{
+	struct dvb_usb_device *d = fe_to_d(fe);
+	struct nerc_priv *priv = d_to_priv(d);
+	unsigned char frontend[6];
+	unsigned char snr[2];
+	unsigned char strength[4];
+	int res;
+
+	mutex_lock(&d->usb_mutex);
+
+	res = nerc_control_msg(d, NERC_FRONTEND, true,
+			       frontend, sizeof(frontend));
+	if (res)
+		goto end;
+
+	res = nerc_control_msg(d, NERC_SNR, true, snr, sizeof(snr));
+	if (res)
+		goto end;
+
+	res = nerc_control_msg(d, NERC_STRENGTH, true,
+			       strength, sizeof(strength));
+	if (res)
+		goto end;
+
+end:
+	mutex_unlock(&d->usb_mutex);
+	if (res)
+		return res;
+
+	switch (frontend[0]) {
+	case 0:
+		c->transmission_mode = TRANSMISSION_MODE_C1;
+		break;
+	case 1:
+		c->transmission_mode = TRANSMISSION_MODE_C3780;
+		break;
+	default:
+		c->transmission_mode = TRANSMISSION_MODE_AUTO;
+	}
+
+	switch (frontend[1]) {
+	case 0:
+		c->guard_interval = GUARD_INTERVAL_PN945;
+		break;
+	case 1:
+		c->guard_interval = GUARD_INTERVAL_PN595;
+		break;
+	case 2:
+		c->guard_interval = GUARD_INTERVAL_PN420;
+		break;
+	default:
+		c->guard_interval = GUARD_INTERVAL_AUTO;
+	}
+
+	switch (frontend[2]) {
+	case 0:
+		c->fec_inner = FEC_2_5;
+		break;
+	case 1:
+		c->fec_inner = FEC_3_5;
+		break;
+	case 2:
+		c->fec_inner = FEC_4_5;
+		break;
+	default:
+		c->fec_inner = FEC_AUTO;
+	}
+
+	switch (frontend[3]) {
+	case 0:
+		c->interleaving = INTERLEAVING_720;
+		break;
+	case 1:
+		c->interleaving = INTERLEAVING_240;
+		break;
+	default:
+		c->interleaving = INTERLEAVING_AUTO;
+	}
+
+	switch (frontend[4]) {
+	case 0:
+		c->modulation = QAM_4_NR;
+		break;
+	case 1:
+		c->modulation = QPSK;
+		break;
+	case 2:
+		c->modulation = QAM_16;
+		break;
+	case 3:
+		c->modulation = QAM_32;
+		break;
+	case 4:
+		c->modulation = QAM_64;
+		break;
+	default:
+		c->modulation = QAM_AUTO;
+	}
+
+	switch (frontend[5]) {
+	case 0:
+		c->inversion = INVERSION_ON;
+		break;
+	case 1:
+		c->inversion = INVERSION_OFF;
+		break;
+	default:
+		c->inversion = INVERSION_AUTO;
+	}
+
+	if (priv->variant == NERC_VARIANT_CVB)
+		c->strength.stat[0].svalue = -1000 * strength[3];
+	else
+		c->strength.stat[0].uvalue = strength[3] * 0xffff / 100;
+	c->cnr.stat[0].svalue = 10 * (100 * snr[0] + snr[1]);
+
+	return 0;
+}
+
+static int nerc_set_frontend(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	__be32 freq = cpu_to_be32(c->frequency);
+	struct dvb_usb_device *d = fe_to_d(fe);
+	int res;
+
+	mutex_lock(&d->usb_mutex);
+	res = nerc_control_msg(d, NERC_FREQ_SET, false, &freq, sizeof(freq));
+	mutex_unlock(&d->usb_mutex);
+
+	return res;
+}
+
+static const struct dvb_frontend_ops nerc_ops = {
+	.delsys = { SYS_DTMB },
+	.info = {
+		.name = "HDIC HD2312A (in NERC DtmbUSB)",
+		.frequency_min_hz = 52 * MHz,
+		.frequency_max_hz = 866 * MHz,
+		.frequency_stepsize_hz = 10 * kHz,
+		.caps = FE_CAN_INVERSION_AUTO | FE_CAN_FEC_AUTO |
+			FE_CAN_QAM_AUTO | FE_CAN_TRANSMISSION_MODE_AUTO |
+			FE_CAN_BANDWIDTH_AUTO | FE_CAN_GUARD_INTERVAL_AUTO
+	},
+	.get_tune_settings = nerc_get_tune_settings,
+	.read_status = nerc_read_status,
+	.get_frontend = nerc_get_frontend,
+	.set_frontend = nerc_set_frontend,
+};
+
+static int nerc_streaming_ctrl(struct dvb_frontend *fe, int on)
+{
+	struct dvb_usb_device *d = fe_to_d(fe);
+	int res;
+
+	mutex_lock(&d->usb_mutex);
+	res = nerc_control_msg(d, on ? NERC_STREAM_START : NERC_STREAM_STOP,
+			       false, NULL, 0);
+	mutex_unlock(&d->usb_mutex);
+
+	return res;
+}
+
+static int nerc_frontend_attach(struct dvb_usb_adapter *adap)
+{
+	struct nerc_priv *priv = adap_to_priv(adap);
+	struct dvb_frontend *fe = &priv->fe;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+
+	/* init frontend callback ops */
+	memcpy(&fe->ops, &nerc_ops, sizeof(struct dvb_frontend_ops));
+
+	c->strength.len = 1;
+	if (priv->variant == NERC_VARIANT_CVB)
+		c->strength.stat[0].scale = FE_SCALE_DECIBEL;
+	else
+		c->strength.stat[0].scale = FE_SCALE_RELATIVE;
+	c->cnr.len = 1;
+	c->cnr.stat[0].scale = FE_SCALE_DECIBEL;
+
+	adap->fe[0] = fe;
+	return 0;
+}
+
+static int nerc_power_ctrl(struct dvb_usb_device *d, int on)
+{
+	int res;
+
+	mutex_lock(&d->usb_mutex);
+	res = nerc_control_msg(d, on ? NERC_POWER_ON : NERC_POWER_OFF,
+			       false, NULL, 0);
+	mutex_unlock(&d->usb_mutex);
+
+	return res;
+}
+
+static int nerc_probe(struct dvb_usb_device *d)
+{
+	struct nerc_priv *priv = d_to_priv(d);
+	unsigned char buf[4];
+	int res;
+
+	mutex_lock(&d->usb_mutex);
+	res = nerc_control_msg(d, NERC_VERSION, true, buf, sizeof(buf));
+	mutex_unlock(&d->usb_mutex);
+	if (res)
+		return res;
+
+	if (buf[1] == 8 && buf[2] == 32 && buf[3] == 68) {
+		if (buf[0] == 3)
+			priv->variant = NERC_VARIANT_LETV;
+		else if (buf[0] == 5)
+			priv->variant = NERC_VARIANT_AIWA;
+		else if (buf[0] == 6)
+			priv->variant = NERC_VARIANT_CVB;
+	}
+
+	if (priv->variant == NERC_VARIANT_UNKNOWN) {
+		dev_err(&d->udev->dev, "Unknown NERC DtmbUSB v%u.%u.%u%u",
+			buf[0], buf[1], buf[2], buf[3]);
+		return -ENODEV;
+	}
+
+	/* yes, missing the last dot */
+	dev_info(&d->udev->dev, "NERC DtmbUSB v%u.%u.%u%u (%s)",
+		 buf[0], buf[1], buf[2], buf[3],
+		 nerc_variant_name(priv->variant));
+	return 0;
+}
+
+static const struct dvb_usb_device_properties nerc_props = {
+	.driver_name = KBUILD_MODNAME,
+	.owner = THIS_MODULE,
+	.adapter_nr = adapter_nr,
+	.size_of_priv = sizeof(struct nerc_priv),
+
+	.streaming_ctrl = nerc_streaming_ctrl,
+	.frontend_attach = nerc_frontend_attach,
+	.power_ctrl = nerc_power_ctrl,
+	.probe = nerc_probe,
+
+	.num_adapters = 1,
+	.adapter = {
+		{
+			.stream = DVB_USB_STREAM_BULK(0x82, 8, 4096),
+		},
+	},
+};
+
+static const struct usb_device_id nerc_id_table[] = {
+	{ DVB_USB_DEVICE(USB_VID_CYPRESS, USB_PID_NERC_DTMBUSB,
+		&nerc_props, "NERC DtmbUSB", NULL) },
+	{ }
+};
+MODULE_DEVICE_TABLE(usb, nerc_id_table);
+
+static struct usb_driver nerc_usb_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = nerc_id_table,
+	.probe = dvb_usbv2_probe,
+	.disconnect = dvb_usbv2_disconnect,
+	.suspend = dvb_usbv2_suspend,
+	.resume = dvb_usbv2_resume,
+	.reset_resume = dvb_usbv2_reset_resume,
+	.no_dynamic_id = 1,
+	.soft_unbind = 1,
+};
+
+module_usb_driver(nerc_usb_driver);
+
+MODULE_AUTHOR("David Yang <mmyangfl@gmail.com>");
+MODULE_DESCRIPTION("Driver for NERC DtmbUSB");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/usb/dvb-usb-v2/nerc.h b/drivers/media/usb/dvb-usb-v2/nerc.h
new file mode 100644
index 000000000000..bfe3fc24e401
--- /dev/null
+++ b/drivers/media/usb/dvb-usb-v2/nerc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#ifndef _DVB_USB_NERC_H_
+#define _DVB_USB_NERC_H_
+
+#include "dvb_usb.h"
+
+#define NERC_STREAM_START	0xab
+#define NERC_STREAM_STOP	0xac
+#define NERC_POWER_ON		0xad
+#define NERC_POWER_OFF		0xae
+#define NERC_FRONTEND		0xe7
+#define NERC_SNR		0xe8
+#define NERC_QUALITY		0xe9
+#define NERC_HAS_LOCK		0xea	/* 1.7s timeout */
+#define NERC_STRENGTH		0xeb
+#define NERC_HAS_SIGNAL		0xec	/* 0.7s after set freq */
+#define NERC_VERSION		0xed
+#define NERC_FREQ_SET		0xfc
+
+#define NERC_USB_TIMEOUT	2000
+
+enum nerc_variant {
+	NERC_VARIANT_UNKNOWN,
+	NERC_VARIANT_LETV,
+	NERC_VARIANT_AIWA,
+	NERC_VARIANT_CVB,
+};
+
+struct nerc_priv {
+	struct dvb_frontend fe;
+
+	unsigned char variant;
+	u8 buf[31];
+};
+
+#endif
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 1b7d10f3d4aa..7bc4e3c395f5 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -308,6 +308,7 @@
 #define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_MYGICA_T230C2_LITE			0xc69a
 #define USB_PID_MYGICA_T230C_LITE			0xc699
+#define USB_PID_NERC_DTMBUSB			0x1004
 #define USB_PID_NOXON_DAB_STICK 			0x00b3
 #define USB_PID_NOXON_DAB_STICK_REV2			0x00e0
 #define USB_PID_NOXON_DAB_STICK_REV3			0x00b4
-- 
2.53.0


