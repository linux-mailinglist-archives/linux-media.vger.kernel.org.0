Return-Path: <linux-media+bounces-65220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WuSWIMELNGo/MAYAu9opvQ
	(envelope-from <linux-media+bounces-65220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:16:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C06A1291
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:16:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="PI/wtYLK";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65220-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65220-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 077C83090BB6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C43329C48;
	Thu, 18 Jun 2026 15:13:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD1B35B631
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 15:13:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795588; cv=none; b=CTF4/SOFiDHPPrJOfvNAZJDXxhx8yKPaWY4smSo7cITHvXQjhXfDteFGmrqK/10BXiufWmu9I1B0xGPz+aBhGthMGZKR9UqMBzTUTQg9seja0bpyT2UNjP+yCBYY/Zs/uHolYN07mvtETaIjRuvPilFZs4lxgW8yAVd9oLBjtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795588; c=relaxed/simple;
	bh=sKnE332uLf3MFczeQldBo4Sjh/O4gn0vLEACKVxzSRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UCqe4btLVQ6f6GHcpMGnxXaJ5jZTLk3L+3TbLCv9CzZGAEkLiknTp3aPqfdpXa8Imsp7mFfHdfVK7LnGxRYkFNa6/v7BUBTULMgH+E77kmh7KqGeJJqpjZX8osiI/Di2UWSemDbaLarNXeXefA90Rfj0lLJLJpCRkYPUc2PdEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PI/wtYLK; arc=none smtp.client-ip=209.85.167.45
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso1213643e87.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795585; x=1782400385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQke5m/aiJke3Gx0O5w5ABKb1mEqH3qw3y2inVYDXOM=;
        b=PI/wtYLKx6845RNKJCRPqhvDMOR+9OpJ5U+zzGAIUB+E2sA5P3nLgMaeluNkwZXylY
         FAn2Ub7mvV/KuSKyci8msYEOPhgNKrbP1RZdvotz10z2i1byOLmc9QYsejDYpFWRJ8vN
         w43IDpC0iJ3jEka2hHQGtNcHmZ/8yPnBCNH7P+H5NAARH5xiXrh3EEpkX/Qy8F17y6jp
         DJCzXafFLw2Le/4TnWBUhkPI2R2ZYIsLLLUEOI6/TfR7sJ5Q73pqtlO2fD17EpPjUyuw
         LPaJpH/gKAOYjOE0y+lOvDxMEvNGpjyMm2m/nF/d1UO+ula7r2m/z/3iUjvjhnl/Adeh
         X3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795585; x=1782400385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQke5m/aiJke3Gx0O5w5ABKb1mEqH3qw3y2inVYDXOM=;
        b=ipCg6XFy6nQ4ozWJ06+steIAj5Ao3G6RC5rRhew+SlvUyBga5caqJVNgiMjAn2HU+K
         cc4TbJEY0/A2Brjag7x9j1mQqWwsZPizXf2rpztWZF1b9ntbTJrMNUQtjLcHY0asHQr/
         cVsYEprjsWui0CHzmuXnH7A2S6JapT/X7d3ovdzhuft+c1TkmWg4CGYMqdrvupWtGSHT
         6SW4ZrytkwlDG1LH4N2G/cxA13r5LPjjInKC4YgPzQVDZ3Y2NJQwkKkswFFAaIZDPoHU
         XXxLv6LizKV2M1l/I5wGHhnb/vUg8R5MZ2MMqUj2P0oH4Vo8SK+S37aQtTNlrxqNtJDq
         yQjA==
X-Forwarded-Encrypted: i=1; AFNElJ+P2EFKvzlQxa2KtI1YZs2pa4FYN706sD6tDwh8MwgHRZrgGJD52dYTyXjGaX0JVoVdqVkapgrHIgoiXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5FzbATlbR8mkWytakrKLSc/pxNU821l42O6j5MKqlrc9vVqQ2
	PQFGiTn7u7FOR/a/ozrhN2J3cOHLH3REaMIP2P6mBLHFEvj/pCotDxty
X-Gm-Gg: AfdE7ck76/2k/R8027a0ihJeZ0b28E323PkimKypmN1a9zs3E8yx4GwfHZaFr1u38wP
	e9cuDP3g2zWdQJw5KVsPLfi/xBvv3zxZ3CLPrFLDrHjX5QTf4KIDNt39eSR5A8VHNTQJdehjd4d
	7SwcCMc1JS7yfntWy35tC8MOe9NPvF7iBg1O4yu5e9/0wgRLKEZV6cmfIpTMJ7s6GuZHo4UCzqv
	cMlZUJnjPzKPlFAOcVyFSvMb4QUAb/8sGUFAZz8V+fylIThDc6CiPKq6bVaMrFNwG3QokqZavE8
	lso0As3VIxo0DbQxpoOzmLZ21OgZaLmc0jrsPkf3t3fm3+qk2BC7icbioO5+fQQ7qA8z+/63vLX
	S/u7m0aew4gCinVOQkkhIB5C8pMeziRLzTvS8TR/2n7VbPJYHrsiSFhu5IqB3X3Bz0TwWRfILnJ
	8n/RBlwNX71+PLoOduQhzxUF2w3OD7REbFBniWcOtP3OVn/RzGZN6gxfMkzvGWamR7wkN+ZFIeq
	1z1h+CQBmCsElcGgKJrJQ==
X-Received: by 2002:a05:6512:6614:b0:5aa:6b0b:1f25 with SMTP id 2adb3069b0e04-5ad562ba255mr4867e87.21.1781795584443;
        Thu, 18 Jun 2026 08:13:04 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:13:03 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2 2/3] staging: media: atomisp: drop unused platform_support.h inclusions
Date: Thu, 18 Jun 2026 18:12:45 +0300
Message-Id: <20260618151246.6678-3-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65220-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD0C06A1291

Drop the unused inclusions of the platform_support.h header file across
the driver. The header has become obsolete after replacing the custom
CSS_ALIGN() macro with standard kernel attributes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h    | 1 -
 .../atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h     | 1 -
 drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c   | 1 -
 .../media/atomisp/pci/hive_isp_css_include/type_support.h        | 1 -
 drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c | 1 -
 .../atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h      | 1 -
 .../staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 1 -
 .../media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h  | 1 -
 drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c | 1 -
 .../staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c  | 1 -
 .../staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   | 1 -
 drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c   | 1 -
 .../media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c   | 1 -
 .../media/atomisp/pci/runtime/queue/interface/ia_css_queue.h     | 1 -
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c   | 1 -
 drivers/staging/media/atomisp/pci/sh_css_firmware.c              | 1 -
 drivers/staging/media/atomisp/pci/sh_css_hrt.c                   | 1 -
 drivers/staging/media/atomisp/pci/sh_css_param_shading.c         | 1 -
 drivers/staging/media/atomisp/pci/sh_css_params.c                | 1 -
 19 files changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 86300991d30e..43581100b70f 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -11,7 +11,6 @@
 #include <type_support.h>
 #include <math_support.h>
 #include <assert_support.h>
-#include <platform_support.h>
 #include "ia_css_circbuf_comm.h"
 #include "ia_css_circbuf_desc.h"
 
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
index 5645a7bf493c..7c9ce87e5fef 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
@@ -9,7 +9,6 @@
 
 #include <type_support.h>
 #include <math_support.h>
-#include <platform_support.h>
 #include <sp.h>
 #include "ia_css_circbuf_comm.h"
 /****************************************************************
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 58e4e3173b40..123389ff310f 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -9,7 +9,6 @@
 #include "ia_css_refcount.h"
 #include "sh_css_defs.h"
 
-#include "platform_support.h"
 
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
index 097be6bd3cb5..566fa6c1ea94 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
@@ -12,7 +12,6 @@
 * Platform specific types.
 *
 * Per the DLI spec, types are in "type_support.h" and
-* "platform_support.h" is for unclassified/to be refactored
 * platform specific definitions.
 */
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
index c68b096444de..3a9a21a589b2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_shared/host/tag.c
@@ -5,7 +5,6 @@
  */
 
 #include "tag.h"
-#include <platform_support.h>	/* NULL */
 #include <assert_support.h>
 #include "tag_local.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
index d1031f824896..cb51824f5ba7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/interface/ia_css_frame_comm.h
@@ -8,7 +8,6 @@
 #define __IA_CSS_FRAME_COMM_H__
 
 #include "type_support.h"
-#include "platform_support.h"
 #include "runtime/bufq/interface/ia_css_bufq_comm.h"
 #include <system_local.h>	 /* ia_css_ptr */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..57623352af4f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -4,7 +4,6 @@
  * Copyright (c) 2010 - 2015, Intel Corporation.
  */
 
-#include "platform_support.h"
 
 #include "ia_css_inputfifo.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
index 3d4c0cd2f2a6..801b2472cca5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
@@ -10,7 +10,6 @@
 #include <type_support.h>
 #include <input_system.h>
 
-#include <platform_support.h>		/* inline */
 #include <input_system_global.h>
 #include <ia_css_stream_public.h>	/* IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
index 7490d189f39d..cc03822942e8 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
@@ -8,7 +8,6 @@
 
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "bitop_support.h"
 #include "ia_css_pipeline.h"	/* ia_css_pipeline_get_pipe_io_status() */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
index b8d431dcd6c1..562fca4888d4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c
@@ -7,7 +7,6 @@
 #include "system_global.h"
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "ibuf_ctrl_rmgr.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
index 2ce2f32a1946..3884ff6ac4b5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
@@ -8,7 +8,6 @@
 
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "bitop_support.h"
 #include "isys_dma_rmgr.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
index 46bb3569e139..f19efae1bd86 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
@@ -7,7 +7,6 @@
 #include "input_system.h"
 
 #include "ia_css_isys.h"
-#include "platform_support.h"
 
 #include "isys_dma_public.h"	/* isys2401_dma_set_max_burst_size() */
 #include "isys_irq.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
index 9217d26cf632..24da447caa10 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
@@ -8,7 +8,6 @@
 
 
 #include "assert_support.h"
-#include "platform_support.h"
 #include "ia_css_isys.h"
 #include "bitop_support.h"
 #include "isys_stream2mmio_rmgr.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index c097d912d87f..88558878e6ff 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -7,7 +7,6 @@
 #ifndef __IA_CSS_QUEUE_H
 #define __IA_CSS_QUEUE_H
 
-#include <platform_support.h>
 #include <type_support.h>
 
 #include "ia_css_queue_comm.h"
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 940b28c66e99..463bbd470ef4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -9,7 +9,6 @@
 
 #include <type_support.h>
 #include <assert_support.h>
-#include <platform_support.h> /* memset */
 #include <ia_css_debug.h>
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..75b0720e98d7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -11,7 +11,6 @@
 #include "hmm.h"
 
 #include <math_support.h>
-#include "platform_support.h"
 #include "sh_css_firmware.h"
 
 #include "sh_css_defs.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.c b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
index d4633572f8f3..8c1c9478ce36 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
@@ -4,7 +4,6 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-#include "platform_support.h"
 
 #include "sh_css_hrt.h"
 #include "ia_css_debug.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 9105334c71b1..2b10e441898c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -18,7 +18,6 @@
 
 #include "sh_css_hrt.h"
 
-#include "platform_support.h"
 
 /* Bilinear interpolation on shading tables:
  * For each target point T, we calculate the 4 surrounding source points:
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..636801c46589 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -21,7 +21,6 @@
 #include "ia_css_queue.h"
 #include "sw_event_global.h"		/* Event IDs */
 
-#include "platform_support.h"
 #include "assert_support.h"
 
 #include "ia_css_stream.h"
-- 
2.34.1


