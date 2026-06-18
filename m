Return-Path: <linux-media+bounces-65218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a0LJA2kLNGr6LwYAu9opvQ
	(envelope-from <linux-media+bounces-65218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:14:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E406A1277
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hZZA3jSc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65218-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65218-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7924230166E7
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFF424BD03;
	Thu, 18 Jun 2026 15:13:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9321DDC1D
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 15:12:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795580; cv=none; b=r+OXZMpXT1od4KteSaIheHhxaBIfOPKsi63+E9ACxwmCBOTHY8XtWWcy1gHQQVGUpTb1e30QsKwGFOeV3SZ7xHzebqyKlefMNhcKAGSjQl2Kb86MYzDqP8blToDY7BK2E2HZVqxRlsfaIMtfPC0/7dkAiZFOLOdrCZOf2OeC1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795580; c=relaxed/simple;
	bh=suUEAixyLNwQwY6P48zJjlni8QPhaptQqPYYM7cY2A0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iepog/W1VnsocQvOU9yrDxhaIdEsemX/XFifLlmJyo/TzOL1fszkXWF92x2GBOU+qPJLatypHevsDgkspEl77cbRxIMBEamfefLfSs0ajLfD8Py8AS7kjOKi2VfWYztD2uybteIF+d7H4a2PAJXHZwRYqiheueEiBFAOYJvnFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZZA3jSc; arc=none smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa5edf347eso832703e87.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795577; x=1782400377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9KE4eh1MHmMevkzNiAWtAEr9ThKarVb6fAYqAoyKlY=;
        b=hZZA3jScgbuItN5LSMgrQg/7iAVJn8rK3f097u+Ph3UGJMUqIG4jCl+RQ5KeqGRuez
         H+yyp9GB4zNYgCCjdRVcPkFCSKFovXr7RQPnRHVtMtmrMkMwErkHkxr2leONUTFjY75c
         illlHJlsCbF7eyIfwc7xZEdiopwwMCKDcWbfEolLT5P1M3L6nN2jYcmo70ERggC4ngGE
         uIy7SnVOXgGWbHC95/T4w4pM+6sFe9/JSLRP8qwKqDYlvTaMDoHiFq48/Mal6pj5sUuh
         bePK9ib4NjoAoK3lagZom283tY/NOcGI+P00tzHEngkVT5PVPC2Zdltu6hR+FEtb1bW8
         KCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795577; x=1782400377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9KE4eh1MHmMevkzNiAWtAEr9ThKarVb6fAYqAoyKlY=;
        b=OkhBDIhapezEc1Z9aZE9XkILR1NiQRDBa1mksre35nPpKBwpvKhxR7uFty5sGg8G5R
         q9UfkT51gqn46HUQJ9BMjjJFMnk/Y3J1UHuKpXtXC+Vx7IQUDi0YJIjqvqKmY/JjhSDF
         EUql5+XJcIaMHHc9KUlxxmO/XS4GVLR6RwanqDExFLuGDcaJOlP7f0zuR+W8l8nHrcNV
         JAh5ahl+04wVzLIC+G1fGzCZH+O1PhNFlN0CkxA1YeI9RYKDQ3tjNIh7k8pRj5DDZjko
         vXmAUOy2nQD0XoRXaIVFJJCfNji41HDgWI0xSSZSffWmFBKWcjI4xSV1ra2fOG4gkGVo
         ZmFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xfAgc1jNMEBg4lCjiE6iANtdgkfsQTHjOBH+sP2al8qKp5FmYRJd8uVPUHr52qoV9cdqajdrEshPrnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0B8fNjjvo4BsdbVPvyEjuhOGtIjNNJgvm8UJTgw+9yIqcqxv
	TBJ+PCE/6wiLohqpVNyjhDFY2FuBJa1Mjt6YfO2Kql+hofZIenN+IFkC
X-Gm-Gg: AfdE7cm5ml6Vu3Dk9FvktCzOcJY8oW5uDG+U0NPMga4vYgtiwUhxG1KtaknD1jtvfC5
	VgO+bOMmjMc7u7YpFdef2YU0t7YhlwX4/MmAaturDJLPLsfUrxYcMxKGGpe1WW1IFR6PNFOwbOH
	5pVfkmOBYIms4VmJRrVYbkrVbAAMT+8Tzlz6knBXNG2jk7HlJi8rQKsjY3fzK6IcllccjIa9r5l
	7a4EUssWJZhT3UoBXK2sBoCaareyCYhFXXEmqaDGsgj0xxiB5c9T/ud26Wr8fw5F9X+8n2lSb2B
	hClOWVXnr60ucVSO+nk4qriJDTBXlxDWoI7zdu/gTZCG5h8wLP7kvKBTtbPgXNCKN73O6Bm6aUJ
	uA4xQLBWrLmYOItSMrkQfGfyxPDJ557wVAsh0yXr0MWWCcv3eFAe33ZvMvJxOH4ngb4MLWNO7Do
	Kj4QNZ8wlW2g3wbtRabVyBvvBnu8gMuJhcEapZGT2wHLvJQhSvruA5uXLy7m4Ru1ThCNhlNNTp6
	tKxTxrSrNE=
X-Received: by 2002:a05:6512:108a:b0:5aa:7064:e053 with SMTP id 2adb3069b0e04-5ad562c79c8mr2444e87.36.1781795576832;
        Thu, 18 Jun 2026 08:12:56 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:12:56 -0700 (PDT)
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
Subject: [PATCH v2 0/3] staging: media: atomisp: remove dead platform_support.h header
Date: Thu, 18 Jun 2026 18:12:43 +0300
Message-Id: <20260618151246.6678-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618120951.42956-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65218-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66E406A1277

Hi Andy,

Following your feedback, this series replaces the custom CSS_ALIGN() macro
with the standard __aligned attribute and completely removes the dead
platform_support.h header file from the driver.

Igor Putko (3):
  staging: media: atomisp: replace CSS_ALIGN() with standard __aligned
  staging: media: atomisp: drop unused platform_support.h inclusions
  staging: media: atomisp: remove dead platform_support.h header file

 .../base/circbuf/interface/ia_css_circbuf.h   |  1 -
 .../circbuf/interface/ia_css_circbuf_desc.h   |  1 -
 .../atomisp/pci/base/refcount/src/refcount.c  |  1 -
 .../hive_isp_css_include/platform_support.h   | 25 ----------------
 .../pci/hive_isp_css_include/type_support.h   |  1 -
 .../pci/hive_isp_css_shared/host/tag.c        |  1 -
 .../media/atomisp/pci/ia_css_acc_types.h      | 30 +++++++++----------
 .../frame/interface/ia_css_frame_comm.h       |  1 -
 .../pci/runtime/inputfifo/src/inputfifo.c     |  1 -
 .../interface/ia_css_isp_param_types.h        | 11 +++----
 .../runtime/isys/interface/ia_css_isys_comm.h |  1 -
 .../pci/runtime/isys/src/csi_rx_rmgr.c        |  1 -
 .../pci/runtime/isys/src/ibuf_ctrl_rmgr.c     |  1 -
 .../pci/runtime/isys/src/isys_dma_rmgr.c      |  1 -
 .../atomisp/pci/runtime/isys/src/isys_init.c  |  1 -
 .../runtime/isys/src/isys_stream2mmio_rmgr.c  |  1 -
 .../runtime/queue/interface/ia_css_queue.h    |  1 -
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  1 -
 .../media/atomisp/pci/sh_css_firmware.c       |  1 -
 .../staging/media/atomisp/pci/sh_css_hrt.c    |  1 -
 .../media/atomisp/pci/sh_css_internal.h       |  4 +--
 .../media/atomisp/pci/sh_css_param_shading.c  |  1 -
 .../staging/media/atomisp/pci/sh_css_params.c |  1 -
 23 files changed, 22 insertions(+), 67 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h

Changes in v2:
  - Remove platform_support.h instead of fixing the macro.
  - Replace CSS_ALIGN with __aligned in all users.
  - Drop unused includes from all affected files.

-- 
2.34.1


