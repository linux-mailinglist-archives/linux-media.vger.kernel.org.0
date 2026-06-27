Return-Path: <linux-media+bounces-65782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3vKIyhwP2qMTQkAu9opvQ
	(envelope-from <linux-media+bounces-65782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4416D154E
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:39:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=VvOGiaC0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65782-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65782-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7400E300F764
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8B439098E;
	Sat, 27 Jun 2026 06:39:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC8374192
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:39:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542370; cv=none; b=F3F5vuv9GMSHnSHwXQ4V3YI1HDvq12tXGKIJFHqb++l68Hn+HRi/6Lnx0TGhQ6wYXtEITbCZRvOhCt205tN7e74bF6UdoXUD4ppyl2IrivFTLdhCB+C+DEgrHuOzEjPnrM92wBKrer0bv2Q2RKo/HN/6mg4f0uWzNbhbPVlhhV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542370; c=relaxed/simple;
	bh=wYwuBd5wYmpSA6u09SatfE2n94U60Z1lSj4q1JefrJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9t76uw4FkeYhB3IhXC8RvUFUTeQfjB/61oRD78kpncavA1if7Xf4SJSlbgvFeohiF7eBxMBkCtp/jLE5qb0JBWZhth3kJL8GJIPvE2OIHrJQYcSTH9MW2X+1kvMi1lKUq+a1NIYTJkko6dxYz9yoJaUCfRa76+AwemeKIhbUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=VvOGiaC0; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so15170915e9.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542367; x=1783147167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svPkawO2Tk+lD5or+qNr6aHfEaVTgfNd8BRZ65xFdDU=;
        b=VvOGiaC0qTGrlKKSWpMakFmJxvjyUDM2qOs1EKKPbjLjjaoVHVojKugU85j1d7r4U5
         l2oWv7AscAKePNSMi5Ydy9dJfUm9Ng/CuVXxhwmUw3yOUiROG2+t/B/A6wwLyCfhe5rL
         4fJTioLvVZOr8HEYNByK6BHPXS5Hgyd4c68get2go1L2kp+j5aLxoC6uaD6wxvWLypdB
         KXpVkbfvSlnZ7yYJ/5mT0nR/PB7lYqZ6ubRPvXqbz1nSIe96cp+ZzC1kMqi4gCI9HhsX
         5VGKCI6wctdb7Xrm4+cFyjQcISHVSSJhY+mjDJwHL3wrcnLDrvQSRA9hP5ok+XPDcjIs
         QrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542367; x=1783147167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svPkawO2Tk+lD5or+qNr6aHfEaVTgfNd8BRZ65xFdDU=;
        b=Xrd6ygpZAx3dF7o0fmHyTXgjINYYESyRESWQNc3kqLKEZVZISlI8TBJ1S2Lpo4G216
         rb6akVga7xmJq+yuwW9FSvcDjVwS0Lr+uD+h2lm8czfn81vzddS5fXhmr8xcPytFrSSi
         t5B2Y69FC5zvSqSD4AkFLvzoixH3SEZAOVqWpbRykuBpLKGUsGIgiZ8ahiM+e6eNDXXQ
         IH8I0PmE1k0sjsMaQoo6VNHjmbocuYLSTUSw+DZJ8oxreGaPPHyqUKMSpmhHMUA+OGvy
         P795YnkW/8HcD8uLs7t6CK37hMCsJYhQyDZ+3nPWgv/sMriJenmsZU1vAxbPLWoBsZqP
         xN4g==
X-Forwarded-Encrypted: i=1; AFNElJ+kM8W3x511IJBBJ0DY8DvkTuMVP0WNF1P7vQNOWpB/8ezXlzwuIz5/PpxRCPyLViqC9l4vHkOlLKYA9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYrUsi+inx9bp+Fdimu8W6yLfkxjoT1skzrFb2G/EzyZV8KMx
	jIgU4WZ4WrZNKiKgWrspXCIatATg/jU1/x3UcMPXcLUATaU02o4dK1twM3S8KG4rLVmg71EHGJK
	6FJP5II3T
X-Gm-Gg: AfdE7cnb6+oc1LhG+GdUHT8V4ZWj8xsCVFCL8SOi5nyCbtUc3ehP8jycdBJC3UtBKVH
	X083wt4pnhl8JkbSc/yyQM7Lub+QiprJit0DRQdoU9nliRF59527yRH7MjRBwoUnqZriE1xU0qk
	QEmroXsJZNZ3gzGcqQd3c7zdUtYm/KQqBHRgQs+s3T6/vBRzEnBEnG0rUKPBJMOXCXH/TCCn5oi
	lmY8eXILZIByQOJ8s/3Jx9vMdkBJrPMmMQ1URwMadkpB0oTXMTA0RGfaFL0plsTrkgwQ1HwHPcQ
	Asw1w05+NpOBIwrq30UNrAR/D3Acv2tAIafdAYXFLpA6n4nUlwihDUcmJeXeo7+zWjItkfUiiIT
	utEvNzc9SdrrWfJklMP2NC/keBt5Mb2ce/Y8VY63cFCUEEAfr8toRoSsUi9dHcqWX/va9xAKBZG
	hGvgq73GuCLU6QWzLRpd2ZANuvDqFO+3bhbW0BPeLY/sN5vJnTqt2Ffpr6iicaupMzi1Z1bNmvF
	PYR0NKNKKhF/R/vxzrLTRH7SHCiZNs6JH5A2aavy4sgyg==
X-Received: by 2002:a05:600c:a403:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4926689fab5mr114611195e9.25.1782542367247;
        Fri, 26 Jun 2026 23:39:27 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm79198785e9.1.2026.06.26.23.39.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:25 -0700 (PDT)
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
Subject: [PATCH v2 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Sat, 27 Jun 2026 08:39:21 +0200
Message-ID: <20260627063924.79491-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	TAGGED_FROM(0.00)[bounces-65782-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 2B4416D154E

Two ioctl paths in the Intel AtomISP staging driver share the same
defect class: one user-controlled field sizes the destination buffer
while a separate user-controlled field sizes the copy/store, with no
cross-validation between them. A local caller on an atomisp V4L2 device
can drive a kernel heap out-of-bounds write with attacker-controlled
length (and, for both, attacker-controlled contents).

Patch 1 (framebuffer-to-CSS, FPN / S_FBUF path) bounds arg->fmt.sizeimage
to the frame allocated from width/height/format before the copy/store.

Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
width/height dimensions to the stream-grid-sized destination config in
both the ISP2401 and ISP2400 branches before the first copy.

Both were found by 0sec's autonomous vulnerability analysis
(https://0sec.ai) via static analysis; neither is yet runtime-reproduced
(Intel Baytrail/Cherrytrail ISP hardware required).

v2: add Fixes: tags (Dan Carpenter).

Doruk Tan Ozturk (2):
  media: atomisp: validate sizeimage against the allocated frame in
    framebuffer-to-CSS
  media: atomisp: bound DVS 6-axis table dimensions to the allocated
    config

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
2.53.0


