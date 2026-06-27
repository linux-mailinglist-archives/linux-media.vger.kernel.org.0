Return-Path: <linux-media+bounces-65783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xnxZADBwP2qRTQkAu9opvQ
	(envelope-from <linux-media+bounces-65783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA176D1559
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=VIyfCE8f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65783-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65783-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 727DA301E01A
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FA1391831;
	Sat, 27 Jun 2026 06:39:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D438F941
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:39:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542372; cv=none; b=cobasrwjusUQJhdbXJqQarbKCRTicNc/b6ni78NfmmfIPD2cCUdR2I1HubPEQQdHUHYfZNRdpO9NJ3ChL1/JV6tOksLIYTbinQNWWSarCNnKgsAKqN+eTA5wEutxAhNcTQCW0/AHSK0LDcJch9r7CmdnPB7KAdSOeq5HEWbosSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542372; c=relaxed/simple;
	bh=nSlLGYfTXHiil+e5l+ZK86hJckYlS/qWdYrNzrVBQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZfXel2yswcRDM/tZfK/WRJ6dKzvldAmtkxH5LyUei2pRNM7dr4Hazao6Hnzc/O0r/qO7LiJSGVVXdV/p3tFxxb2TqP7Al6qc2kqq/U6mSeDgHAuW2dUXEVcOp+jvAgwpeUF4siqyIhnwDAd0A662/JqgWsGbdyNtP9AaI2pqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=VIyfCE8f; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49263703c6eso15754415e9.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542369; x=1783147169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmQtpoRxRoFft31BE3DslHpMhlaHT+PPi7N5MeuH6Pw=;
        b=VIyfCE8fDyW27bMFDan50ZBWafvT5PrTcECr4VRoiP6lYwanVLABI33IyS6F5Z/N5w
         zdOwNQ3L7o4fTzRu0Uk0obnLcRRisqlnfs7eAXo59Qj5A1d3yP86TjUQuzR4Fr+Tz9/W
         PJ8h3TPY7h+DAKON1oMvGy0/ITZY2xGis8zI7y5LqfJbvAKhexV+XGkNzTkKmsunTPcX
         ewCe/WkJ2J/uHuxPazHHB5UnoVySDXt3j8vJuS7qxAiFsAjXDkHtnPpuswQla9A7aTen
         2JhECOVGnPb9Sek8Of52ETtqpQtjRzBbFZ/KyaiQ02JJ8IqoQXfoLPF3q7MnCNtqQY84
         Pchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542369; x=1783147169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmQtpoRxRoFft31BE3DslHpMhlaHT+PPi7N5MeuH6Pw=;
        b=jDa7a6wcg0IOiEXacszh77hfVImVOIHnaWhnH5F1pSoNX5gu1RX9m5ivLbv3LAIXIH
         VbnVPPRtQKczMcOl2pgb/k4zDRPrIsUcm5W7uM7VKs0E/8v/yImqLK+6/yVs/KqtJLfV
         bEGTBpq9HpZKGX9lJaJGJJVdAZgHZ95t2VPSVUURpYkiB7ea4Ytkug17HQHBqT7OTDDZ
         HtW2KcjE93fQofj+riGUivI3XbH5PSJKV9CeBHDjBakE5vF4p6rmnnZ0+yf1NTBHLSc4
         jvbQlXZpcQ36/pntQjvms58uC7dcd+PgF90dtfQneWWfhCZQYsBOk8A2Ipe2uydw/CM+
         2Gtg==
X-Forwarded-Encrypted: i=1; AFNElJ+WOyyXxDLYzkozTY694zXcbxe9unG1UUo0K9rouZo+Ax7uFjxEgzJedh9fizELUPNEgm+BQydPeQoqfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzH1NkhaQnNuMeBUm2GtH6xndwQoVVI4K2us4V8iFIvdSTXwLN
	WuBudRK6hylmu0OCIklPzBSWTLf9zxUr5cUFbk7U+7UpLmM5HC3PPIM8JAnco1nVDCiu
X-Gm-Gg: AfdE7clQdK017vG7II8D2JLQNHDpWfw9LKnnOV+NFtzoVxcCLWFYQ/dhQeg9i7eln39
	uSlyeFZ6BA8Y2qaUFMg0RBJQg+J9BgpzcPgdXE08E2sJs3SCWXYppUQzxFzCmo8blSoX1Ff4hWn
	QA8P/lSfGBIcKAzGdVk+5LOccyyb12FU4g6eH0UY8SiZSk9Ss6+tAX59k1YET1ShdRgNYCMdSmA
	w6IUvEbP99kFD6DubpbrrE3zTYHzw2Df/tQ1YPLxL3Pmi63tBJa8IrqYdaY19oEcd+jO3onb3xo
	Rk8blmDdPOpVlCmOebFxsi+9f4BJUyAad8qpyoYJM8ynWcF9hFLmDahobef54xKl22vPTISCgsy
	HbUjj27PpuW10yiTef+1F5eT5RxddBuVVabJ/dl08RKw2g9h1EiV9LwQb/R6DViJ8IqXQSXEqr0
	JehAU3t2Fkdhc/oJV1jLWAbU7yaND14km2bD/nmebeJgl1glMA3NP4AR9YdaRJvQHMOXbZvFVD6
	CIVe8rA2oeo1fum/rOZKdlPRLv0kE3IdYU=
X-Received: by 2002:a05:600c:1551:b0:492:686f:372 with SMTP id 5b1f17b1804b1-4926918e379mr103522875e9.12.1782542368624;
        Fri, 26 Jun 2026 23:39:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm79198785e9.1.2026.06.26.23.39.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:28 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2 1/2] media: atomisp: validate sizeimage against the allocated frame in framebuffer-to-CSS
Date: Sat, 27 Jun 2026 08:39:22 +0200
Message-ID: <20260627063924.79491-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627063924.79491-1-doruk@0sec.ai>
References: <20260627063924.79491-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	TAGGED_FROM(0.00)[bounces-65783-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[0sec.ai];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBA176D1559

atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame from
arg->fmt.{width,height,pixelformat}, but then copies and stores
arg->fmt.sizeimage bytes into it. sizeimage is an independent,
user-controlled v4l2_pix_format field, and nothing checks it against the
allocated frame, so a sizeimage larger than width*height*bpp overflows
res->data in hmm_store().

Reject a sizeimage that exceeds the allocated frame (res->data_bytes)
before the copy/store.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5046a0ec8bba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3323,6 +3323,17 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	/*
+	 * sizeimage is a separate user-controlled v4l2_pix_format field; the
+	 * CSS frame above is sized from width/height/format. Reject a store
+	 * length that exceeds the allocated frame to avoid a heap overflow of
+	 * res->data in hmm_store() below.
+	 */
+	if (arg->fmt.sizeimage > res->data_bytes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	tmp_buf = vmalloc(arg->fmt.sizeimage);
 	if (!tmp_buf) {
 		ret = -ENOMEM;
-- 
2.53.0


