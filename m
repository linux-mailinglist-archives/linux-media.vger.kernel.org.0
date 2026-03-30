Return-Path: <linux-media+bounces-57681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ2kCNbVymk1AgYAu9opvQ
	(envelope-from <linux-media+bounces-57681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:58:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E818E360B25
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08F91301A2E4
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BFF3C9ED5;
	Mon, 30 Mar 2026 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCvipJPJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A6539A7EA
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900631; cv=none; b=fWZ+Z/Yl0Ubrr7FCP50EIKb1mDpsmVIa5Sy5ONwL49BILJFwHk7/9lRilTHcsjV3R1fGOxI3FDsQTDG9cTg7qFdzmsHHkTx4GtukcsVDW5vcH+js+jIQVTtWHAfs4sGk7MXICC/16bT1hJnNnYYQhccwJbAEoi2T3pr6D2SkZG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900631; c=relaxed/simple;
	bh=icc2S4qBl93MkrMWtoFi3Zh8GymsUrYh8DHV704A/+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwywnlxOBhqSUMffFROyoaNGWWKnQeuY9smhKGgbOqHH6tn8Bir7IE9X0sC0Rev0xZIFwfUONJEDi6LVOc5MPyu1FWpgf6zJuQ58xUzEYRIzU1B+45fZ1oKyBJYBhinBsy2L4jOkds8juufVo3QIFleD9/dN6FK2GjJgOGzohGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCvipJPJ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7e565c877so2454396a34.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900629; x=1775505429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcJ77FRVM66lo4idVDfqyyX6U0H/VRrvFAiNekQFM/A=;
        b=TCvipJPJI47uFZtCjZByGqEmEWhZmGtj0IDv+S5HCf8EDA91R3Ce4y0iIFvwMsEBye
         NxZSEsGCe5MlnI3nZlNjs2OxyeazszWbpRVTKbVBk+Ajqh3lyl3Z+bKwlrdIPLE+wkPM
         QuVS+xM8OW3aKgNfWVeOsx1dzzyJ6sDTtBA/jq/5UXl+QkaEXsgV8+X3lrTJWLRwEDfk
         W2h8+kOt2UxrUp0YZTtsyScHegUEVJ0GbA8CYiWt215de/lVunUOomdXY21Leo95Nkm9
         a95OMSpd6QXftxSqTI8XXB7UU9yi+EYSRLqGAhgr0U03sH0Ei4OkdV2YdGr1Pa9F8fvi
         Jjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900629; x=1775505429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LcJ77FRVM66lo4idVDfqyyX6U0H/VRrvFAiNekQFM/A=;
        b=Qo1hRDXz72/PWpwt9j5anBPXq9wm39lusA1wPOLa5AVhuOitpNJ7ecjBbew752fi22
         gcR80UbufwSL8fxRsZ6Kb7i1n6UinbSI181xlWDNqKH5Hdee/VroZ5WlgQEqSJwz63Na
         WJ6FUHfIAeEZK0lgBIrzNagE7J1/WfaAwUMojIfWQYTTL6gZoOr9pxQtCLtU78GCe8OH
         A+wSDALOAbt/GhR17phl2lyCJZNJps+SigtswSx1SjnUmCabsqrvDcK1IqGVwx+VPMpT
         TfbG6JTnwtksrheyw8o1M3WJNbILPyeEzbyyaO0ZvEh3d1M/G4xzTCF1OEHzLlOrBNEO
         2S+g==
X-Gm-Message-State: AOJu0YxTh2lBv4fGSiBc9lQa8CMj/MEqrr45G+j26jUGuyOR5iZlf0T6
	CKsEx+9ZGItNpW5LB5agDea0yBjd2NhPN9Som6qBAB6nMVT7sDqMW4HuZutpBkRZ
X-Gm-Gg: ATEYQzyz5F72u9aDBSb6z3Q+LGQPMlL1SpH/+fAVWkgxisviGBhtlQNYp2o8ZvN39SL
	ZiMljTVcGBv31keV+5SBoXzUQEKkqxTv9nzGiK6Zgv9HcuROw1+e6wOsztrY6kzKEmf14G9iW57
	Ewtoo45Eq9AfF8ZVEw9Mc2BDBfdlUJLSrX7P04vdxT+H3x5LcMvQe9Nu3hKOK3ZCG0XMG6YJMvv
	dlxhxJAxOJStLgXXoVt9OyoWQl9gYpPE+aeTbP3YsLSVuxd1m2s5tLRZAijeD//bAu7V0I6phzQ
	zUdpi+viuGb3h5IsU+1XKJx/HrA6Sv2RhkrVtIvPpyKbEzEKlYPn8DYQAva98r5ViEmutLQOtMX
	VcxqKszWVtABLpDvSCs3UGlwMLTjQw+/u+p+Ax4O2Fq7Ha1ttYe9hCst3PdGJRGceTaHWjRbivO
	1Efly5qhHIO/8bq7VFOSHX9yVDwB6miCXl9EwA9vkwXLuEExDYxfApmdnotPEi+4XHFfR4OHLo
X-Received: by 2002:a05:6830:4428:b0:7d7:ef30:c893 with SMTP id 46e09a7af769-7d9fab69169mr8614922a34.0.1774900628574;
        Mon, 30 Mar 2026 12:57:08 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a0f2bf9sm6452102a34.0.2026.03.30.12.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:57:08 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v3 0/2] media: pci: add AVMatrix HWS capture driver
Date: Mon, 30 Mar 2026 15:56:53 -0400
Message-ID: <20260330195703.304466-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
References: <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57681-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org]
X-Rspamd-Queue-Id: E818E360B25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ben Hoff <hoff.benjamin.k@gmail.com>

Hi,

This series adds an in-tree AVMatrix HWS PCIe capture driver and a
matching MAINTAINERS entry.

Compared to v2, this revision makes mode-change handling explicit and
removes the previously unvalidated power-present reporting path.

Changes since v2:
- keep scratch DMA allocation on a single probe-owned path
- avoid double-freeing V4L2 control handlers on register unwind
- drop the extra per-node resolution sysfs ABI
- turn live geometry changes into explicit SOURCE_CHANGE renegotiation
- report live DV timings and reject attempts to retime a live source
- stop advertising RESOLUTION source changes for fps-only updates
- keep live fps state across harmless S_FMT restarts
- stop exposing an unvalidated DV RX power-present signal
- clean the imported sources for checkpatch and W=1 builds

Validation:
- make -C /lib/modules/$(uname -r)/build M=drivers/media/pci/hws W=1 CONFIG_VIDEO_HWS=m modules
- scripts/checkpatch.pl --strict --file drivers/media/pci/hws/*
- v4l2-compliance 1.32.0: 51 tests succeeded, 0 failed, 1 warning

The remaining v4l2-compliance warning is:
- V4L2_CID_DV_RX_POWER_PRESENT not found for input 0

DV_RX_POWER_PRESENT is intentionally left unsupported in this revision
because current hardware evidence does not expose a validated
receiver-side power-detect signal distinct from active video presence.

Ben Hoff (2):
  media: pci: add AVMatrix HWS capture driver
  MAINTAINERS: add entry for AVMatrix HWS driver

 MAINTAINERS                            |    6 +
 drivers/media/pci/Kconfig              |    1 +
 drivers/media/pci/Makefile             |    1 +
 drivers/media/pci/hws/Kconfig          |   12 +
 drivers/media/pci/hws/Makefile         |    4 +
 drivers/media/pci/hws/hws.h            |  174 +++
 drivers/media/pci/hws/hws_irq.c        |  271 +++++
 drivers/media/pci/hws/hws_irq.h        |   10 +
 drivers/media/pci/hws/hws_pci.c        |  864 ++++++++++++++
 drivers/media/pci/hws/hws_reg.h        |  136 +++
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  924 +++++++++++++++
 drivers/media/pci/hws/hws_v4l2_ioctl.h |   36 +
 drivers/media/pci/hws/hws_video.c      | 1504 ++++++++++++++++++++++++
 drivers/media/pci/hws/hws_video.h      |   29 +
 14 files changed, 3972 insertions(+)
 create mode 100644 drivers/media/pci/hws/Kconfig
 create mode 100644 drivers/media/pci/hws/Makefile
 create mode 100644 drivers/media/pci/hws/hws.h
 create mode 100644 drivers/media/pci/hws/hws_irq.c
 create mode 100644 drivers/media/pci/hws/hws_irq.h
 create mode 100644 drivers/media/pci/hws/hws_pci.c
 create mode 100644 drivers/media/pci/hws/hws_reg.h
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
 create mode 100644 drivers/media/pci/hws/hws_video.c
 create mode 100644 drivers/media/pci/hws/hws_video.h

-- 
2.53.0

