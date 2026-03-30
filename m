Return-Path: <linux-media+bounces-57685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDx0C9XuymkkBQYAu9opvQ
	(envelope-from <linux-media+bounces-57685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 23:44:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D37236190F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 23:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0C673040205
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEFD3A6B6A;
	Mon, 30 Mar 2026 21:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXHmKR8X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD2639B94C
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906975; cv=none; b=NnLJ2GuVTLI9TiyPzeGng5lXM+fyMx3spDuHmyIN8e/X6q+qkHggYtP1PrmLZ7OiPnTqGW3ZaOD+YdsH1tXggPA6bIcxdjZzkCA9f8kwQzWqvG/3ie1uVjrrVfbgOHD3g5DDxz6bIhoD5Hanx6op1C4jUWH5i7eC5yBuv4L3/Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906975; c=relaxed/simple;
	bh=GtwyJ/XXvQ3HSX2qcyXzYmLFJo56tzDpcID5UnZYk9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLQNKgp+eqrMSJ+WNEUcNMGEYcL5AKDie5hsh4KjCXjEXOhuMlPwgmsYPeN66r7zGaLm2CODeTnT+PGPB5V267HoS3oWQSvz6nwDZ20md0/4f9DatOVv68JsXLaAlDRQHr+chgYV9PevWRx5JIeCIMDEJNs1TUgkMIhjbGiS35M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXHmKR8X; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d9c98e437cso4233155a34.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774906972; x=1775511772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+FRF1EzWtLl8K2hjsx4c0WE53WbVfOyE/cTgQHdfUg=;
        b=BXHmKR8XSovdFjk9zH7+5FHAgeDDB65RYJMPA47x+vCG0xr1cR/wcLcbtCgRgj9dkk
         LbYq+lAXWkJxXzufycnkKzESg0sY0ra7us0cWzZ99DNKM21e2DsmSyEMPzXlg7KLq3cn
         wY8sqVhtEW5hglEmISlEyh55zNqH9ZF10t2HocFx6+O6YI+OY7QkudTuwKBtFKTSC0+D
         TdBxx7bqmm6jRAubuWMLjOpfZF8XhYT9yk2nrTxaaXc5Tmh4ohLSCar/TYCvkoV+V6v5
         70BWDx/AngC1QrEXbyu5kLkqfGt0tS63Y8uC7UmORLTt6UK4zONJKoKa4WZLNilkyiRt
         +omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906972; x=1775511772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+FRF1EzWtLl8K2hjsx4c0WE53WbVfOyE/cTgQHdfUg=;
        b=axL6lebmdgmSupGMZcYL2xUBt3ts6PKS05uugit2Yb7lNNPfT3WvQuuSwRodraCmnL
         sKVcNRkiH7nTfe5UrKXwY2MB9BBl3yn7NOuwXn3f7XrwTnp+P/gmUhQlbKoKkmYIn7Ok
         xeXp1DUfn8Pej71ZSX+Gy49dHwaGrto/FbCrG37u3Vy+R19V8yRRKQVKM+gKbsLcflmL
         eg3s1R/btjVMe9wONcRV+YUPksc5t5N0j8deR1pu1cWkKiUFpv379IewuKqpfJDgRjle
         YBuypWYxZgU8lJYBcxnjc/Gpcf8FA0jtFUJcjSZDDgQStjoUzX1NjjSIQ3iPkvLeQLYw
         Cr2w==
X-Forwarded-Encrypted: i=1; AJvYcCX4lkvttvhTZm9c80B5CSUftrtkW5tzMfeGJJzcvM5G4zbWEWXONekIqZbqJjcMpIoqU9dOHbfEN2RjYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxesILEWZdcBDmgM3mhd45scYs+2QJfErStni9LU8P1fJyvAFuO
	46qkHAsLImNHrWMcxEU/UTEc0h0ieYT1Qv0B3Lfgh6BAMP1XcxM5rK0w
X-Gm-Gg: ATEYQzxvL9R6fkuAvinBI28QRFZokNhaLQG+dTGaPxzapriNPZLhoWeW8FUQljye2qe
	FRjb8xOkPm98l3ae6SjBBcl/+uuPBK4JXVOuiZcmZHa5XVNpdi1vYHybaTBgmwKADqXF8vzmSsk
	Ur7k/H/lsxbbz9EWn5wtuiTY0VvuYpt1ok+zJem0DjFKwgVK/hH+eHXNWqzMC3/i40aUZvO+tav
	+tKdT+4A6Y7Q31y8x+yQPx+GD2TW3IQ2ROody9tVoJAHJM9p2oEej/PsEB5IHdacPHoRavEmiRj
	33tFFEmUYSm7QmqMweQo4rYczAuLFzP4fMBT4CCBFR9yr8GCKtcmrCm1T3VTvWqkRp1cgbgRckZ
	evtfzhekol8awLEGiONPuwlWydnMi4utRBHxFjuJ3aaBt/o0bLvCkW01FGPJEPYfnFWw9ryEog3
	6CHt+179fxJmQAty4duIUXNyGInkfLgG7p2b42Nwf/vmoiJXwpBC2EhAQ+
X-Received: by 2002:a05:6830:67cc:b0:7d7:ddb9:5061 with SMTP id 46e09a7af769-7d9fadff840mr8478554a34.13.1774906972511;
        Mon, 30 Mar 2026 14:42:52 -0700 (PDT)
Received: from angel-Standard-PC-Q35-ICH9-2009.. ([189.128.244.14])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a819880sm6712202a34.22.2026.03.30.14.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:42:52 -0700 (PDT)
From: Juan Angel Hernandez <hernandez0101@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juan Angel Hernandez <hernandez0101@gmail.com>
Subject: [PATCH] staging: media: ipu3: remove blank line before closing brace
Date: Mon, 30 Mar 2026 15:42:41 -0600
Message-ID: <20260330214241.33514-1-hernandez0101@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-57685-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hernandez0101@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 8D37236190F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unnecessary blank line before closing brace of for loop,
as reported by checkpatch.pl.

No functional change.

Signed-off-by: Juan Angel Hernandez <hernandez0101@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d342f4..1f642e643967 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -750,7 +750,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.43.0


