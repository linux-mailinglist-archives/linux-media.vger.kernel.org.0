Return-Path: <linux-media+bounces-57521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN2TED50yWmxyAUAu9opvQ
	(envelope-from <linux-media+bounces-57521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:49:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE6353A69
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9256A300E5C9
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A62638756E;
	Sun, 29 Mar 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnDDf0ob"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35441386C28
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810164; cv=none; b=AlDeEwX0+3msHkbNX9QRtCpYaxGTsvuqrS+a1Jeh8qTGkCj9abXhxVuscyQZbPNWqmtBW2hvzX9s+uDfwmpkUiFyeaAkYvSYMRurIBaYiHGC7l8Gvkn+0nG+XES/wYvKl9+DPJTOdXpFlo+UHCimBoM5zpau+NDDcvH6kDRRZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810164; c=relaxed/simple;
	bh=PTmpHgfaMM35AZI86bZDv/99vbhobrELHOSJAkuhxT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McmLYlXAjuCWgAATRET3hP7fdIUGQS8zjlCZRD/RSmkOkWVLcP0eN0T76rZc/qDNWGmUZfC4eMITWr/reWKLYFobMfxRDYcK64zcUHSjYv1C6GszaFxVpXQPIfIkJ2z+3nhkAwUZ0/Yc6BDWFc0BcXjKsLlDUUkV5JYoQtO3buM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnDDf0ob; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfd96354aso212816f8f.1
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810160; x=1775414960; darn=vger.kernel.org;
        h=content-transfer-encoding:staging:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hzi7h/Q5ebO8HqMydwyfYXKSa0XEheo26fHTfI9VIY=;
        b=GnDDf0obEnJPD8F7AdyN4U+uAQML6+DqJnJZd7touF/GVxwM5zdHwRWc5VTQbePV1D
         YV+bKOdkw5O61qmyIAvkFx7GXhIvas5gpT430+rk2nfUBDwJw9RZLPqqSAmWaatZXA3L
         jNa6wITsR9F9PM7W/No+sh5TzRGWbDSn+6tEvrQK+KskDTW/4PWjhTKnqAX7hJdarex8
         aCHoAdjGUqJDgmlRLQYZQP4Xr4wXZ5EpUKtg7ZKMwEplsD6oA2uXGGZuYAGCn7EyqwnI
         A5vFapq2DYXnu4mU8aDdTseFzA5v6efip/J9ZqXFkFVwmVU7N+GkL4/VJ9b9ePRGo2yt
         4TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810160; x=1775414960;
        h=content-transfer-encoding:staging:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Hzi7h/Q5ebO8HqMydwyfYXKSa0XEheo26fHTfI9VIY=;
        b=b/6KCQKzLbHCxtq3QDPqYrfo8mnlO1RFkFielrto0uh2K2ZD3ZWebGYvqwJ68gcHqZ
         Cq6Yxm9HIfsw/7MOHxb94M5dNOlIhpPEdOlRCaSiHuiJ2ykEbvLOd/dcod6Jh/FbdeNM
         t/dsvq4qFMTCYHuSG5t/A4NQr8p9R8bFzH4B9u41m2k4MrdjJK7ueB6UsNc82O8fao2j
         wlXw/Ue/nWF/FvPJkUP1lDNl0VH5yDRb9Q/tJCLMCKhcTw3YA0yn8ggJBpI3yeVeBSMP
         H2eILDic5gR34EfY7ByQRI1vqo936pGtIeHxGiaGY7h6mQJ8I9l4Z/pEqxLfnxQgDuA1
         iNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg7zHUUrmJNwWOaT+jE+jKzOjoidr64khVPsp0tdsYXmw29HN6vZJZfcFDPnsjrFMRAonxkNRFMPruDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYd8rBLpz0wP9Dr1K48Z5SXjGdsKS/8L1Ox0/ShHcVAezl++Iv
	i/vXqAssd2qSIH7kxvao4Fh3cPclalZq/oMUkKoJmAJ08fsz4bgX2kky
X-Gm-Gg: ATEYQzy3UgfOlMPa2Mx5u5IZX4OY1nYs7eRf+tOenPWL+d/rSLx09AwESt9kAdBSU3e
	hHj0kXq5yYedF5A9nxJc8wm/S097Km2GEFi4W4B2delkgDw6hqKuZEuS7lf5hqo2TrV8V1iDpbT
	fMIOfqjf3k2b5P8/9ANZi9BgqBqn8C5gtLIsvAD0pqqmx/n41jOu84zgwEGMj+W/iG8Ynpebloc
	e41WQTBA/DESIsjTHWtlBAd2TXl6O61gxbz4ne7aLzDXh4FhkOvW+oBnSytFpFtQuVFpCJ6I+Op
	5Ujxs3+QoNtXmx9jPnq5JuxUUbFIETjx56D8cIRNXXpymuOyPPOO2XwbmxvpiytHSfwCEHv7uSS
	vIms9mmud5owS9XEGh58UMjvKG3hn2KjohA1FvatowLfrXc+/s5gW/xDCjuomhpgYy0YD1lnu7M
	rwLUL7lRKXDGB6sCOUCUwxlpVxIVeFWwubIaLjwJgaixtHIkwf/JE=
X-Received: by 2002:a05:6000:2903:b0:43c:ff58:35c7 with SMTP id ffacd0b85a97d-43cff583754mr1794804f8f.14.1774810160347;
        Sun, 29 Mar 2026 11:49:20 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:19 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 0/4] 
Date: Sun, 29 Mar 2026 21:48:06 +0300
Message-ID: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
staging: media: atomisp: coding style and typo cleanups
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57521-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,nxp.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBFE6353A69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses several minor coding style issues 
in system_global.h as requested during review. The previous consolidated
patch has been  split into four separate logical changes: 
SPDX header style, blank  lines removal, block comment reformatting,
and a typo correction.

Serban-Pascu Robert (4):
  staging: media: atomisp: fix SPDX license identifier style
  staging: media: atomisp: fix typo 'uninterruptible' in comment
  staging: media: atomisp: reformat block comments
  staging: media: atomisp: remove redundant blank lines

 drivers/staging/media/atomisp/pci/system_global.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.43.0


