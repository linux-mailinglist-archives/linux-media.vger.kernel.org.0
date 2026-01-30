Return-Path: <linux-media+bounces-51865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CgsRBmsZfWkvQQIAu9opvQ
	(envelope-from <linux-media+bounces-51865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 21:49:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368FBE8B6
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 21:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2149302C5C0
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 20:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A041C350A0B;
	Fri, 30 Jan 2026 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrEvwQq5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C152E6CA0
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806129; cv=none; b=Drbj7svaqPVz20mA7zpgtJLl1/DpAPXP2GYZH+B0sWjwWa++XLzl0GdjCpIoK2oFvaVPatUlbnpNcuLlLwV5ENz91sKKPqRnQ/Ilh2MKgADIUp4IYs5DztxtOEzcIKcv3Nzi2ag2GhaLVzKk0H4Pa9Axq6sSeUS+GmZUsuLqjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806129; c=relaxed/simple;
	bh=hXQEWF/cFnpxlv6wx09Uqf/l9vlGWn8H8b6eA3afV1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlaivcQF6fQGqHU/SMCz4Bepku/xLclo5VQ6RrcDhxqDVwMOB2rvY99Jgmia/eJjXX/PpwEuQiH7IVePFQIfl5VTdKES3O7ky5aNYWDf2qSblhGUIhfQwMNkBtNJQvgkR0V6ON9m7pOuCpEuxL7Y/voPiSVWyoA7KFRAALWaDF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrEvwQq5; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ae5283dae8so129440eec.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806127; x=1770410927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNSw+Lr6oCjiEm0w8JQ15Otbu/5SwQUBiwMB+Of3T0o=;
        b=ZrEvwQq5rfGjgb+G7KlwNNP9iuQXUnKv5ZCVCfHp+NX4iEHiWW8EnEMMqqdIk1vLpr
         dDtjGd8mqGbnbbMcAjxnJIc09zhSzoiME+JiZGA2He00cdzGL5/9qygQ/EvP9sJjRGve
         qbgNS8+F0xvG6j0YWbgXQl/xh/nNioQfC/EYf541zn7myxfITVgbE+CeGCdDZs6V/ggW
         /ZN1egI7+PpOofRkCOiOwKOuZhLCZxi5fD0ylfGdPtHeA0UYt35Gy+AYudHm8xw4VA+s
         V72CbMdFBj0QUoLL6IF6vCsyUo+cnoxCBOvutmkPPSXx35OcB0M3HpCykoluvJYQi600
         Tejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806127; x=1770410927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNSw+Lr6oCjiEm0w8JQ15Otbu/5SwQUBiwMB+Of3T0o=;
        b=jybafB1Dbdv/qgFFnsC1vU6X+4yA/YPAPzWjqFvFCb+jrp62riIbINYvNegJJ2xqZB
         +lOVKFompHd1g1oo8diNJy9TeV9rCl9XuHtRZIc5Cgif+a5sVmu8aLD8G3mxftaV+4HG
         VMrjHytSuI5tKl6EBgpp/PevExToOW5h0C0/gKpls1LK/JlKo3ftxi0Jxas7b/ETaphp
         37TDECgZ7fRMAKtVLoI5TTAxZpMpDbXJNyj6lr6ywUR50RYIvnMPL4lDrPu7auaJczRB
         Cih2Mx503U+XcolueIHGYQdyOEzVAVAQPy0F7r9qDbCJ+9bN9mNshvoR7SLXHgxNvKYA
         beBg==
X-Forwarded-Encrypted: i=1; AJvYcCUS1YMHhvzI/fsnE+chNPIyTPjbEYmce8vKQIUeZsN6uFplgBOm0KZ6GCeAa3ZeZ12j4WGlxyPTMKWDEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymxS5SYerSlb1ySh8Df7jxIZehyqHOB6mSKUpRJv1ATTRpaHth
	FNPaeAExCNrDGZj7E18FvPSK6Os+xYa3BO77r/DYs+M28AcFet3ZGRRj
X-Gm-Gg: AZuq6aIFrdF0qSaoi2xV1Q5ehi06uJ6JvoNK0RVrXUFNYOkXvT0uhS/51+r9QDyM28R
	wF0GwyQAOpwwsTNMJk5ltu1s9qeXTwhKbjCKy8dbh9plwt0sx8t2nV14lYtEiI3a822KqwsPadw
	xzcqzkdsxSql6f/HZuq7IM9nMpNEpc0rw96c0e5PBGlHkEIsXazwMvhMo6+yLiuJ5MlKLHEm0vm
	JSMK5QjFi1gVog07JZqnHRPKh9R32SarWE7TTRlRhiVkS7Pgk6jfh/FbfZckOjMmN/rnZffUhP5
	Af0JgE31n7jw8eAV80uvMnciTq8GUhU96aqP7rcfjdRs2Fp85DwtwmgbWtmOtoI1Ng/gkSmoRDj
	cmQITfCFkdHIeikzansxSiCD6S+fuWwMfIDS/OOTvnUQQwP9t/qyYE6Du1YEK2X8iAttpvHZ/qe
	ANNPFw
X-Received: by 2002:a05:7022:e98d:b0:11b:1c6d:98ed with SMTP id a92af1059eb24-125c0fa8f87mr1183669c88.2.1769806126977;
        Fri, 30 Jan 2026 12:48:46 -0800 (PST)
Received: from localhost ([2802:8012:29:1100:899:eb0:bfbe:884f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm12981470c88.9.2026.01.30.12.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:48:46 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: gascoar@gmail.com
Subject: [PATCH 0/2] media: bcm2835-unicam: remove mentions to dropped driver
Date: Fri, 30 Jan 2026 17:45:39 -0300
Message-ID: <20260130204628.312246-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51865-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[gascoar@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6368FBE8B6
X-Rspamd-Action: no action

The driver bcm2835-camera was dropped in commit <90204a38a760>, but it is still
mentioned as a current driver in a comment and in Kconfig help text in
bcm2835-unicam driver.

Remove these two references to the dropped driver.

Gaston Gonzalez (2):
  media: bcm2835-unicam: remove obsolete comment
  media: bcm2835-unicam: remove reference to dropped driver in Kconfig

 drivers/media/platform/broadcom/Kconfig          | 5 -----
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ----
 2 files changed, 9 deletions(-)

-- 
2.52.0


