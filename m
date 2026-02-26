Return-Path: <linux-media+bounces-53496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA5TKb9NoGnvhwQAu9opvQ
	(envelope-from <linux-media+bounces-53496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2071A6D10
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 530A5304B5B6
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F60361662;
	Thu, 26 Feb 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaAS285C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1832D2D8DA8
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113069; cv=none; b=W+vYPX8dHeKHDPxB8asKz9oSPN1JwcZ8a48+0F1tFlFxmxdnJBnDFKHItWurJwBY5CRe5YWxcnFnwK4sQS2PIeEtpAFvzwYe0RQeR18TcxdyOXmPkxZgudKEQPRAl1FVMYCjXbaNWGp49SFVKAq7lR/VPwCZzek5r9sFw1X1w6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113069; c=relaxed/simple;
	bh=o067jjeMqw90CVAFvKHdjb7FSOkyd4V69sl7/Fo1f1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxtvKkeJdkE/UQ28mdR3R4ky6JG3oCWzo12HawY9yz9HekzLmtxMBQxkjfFIqST5y7crqWhuWgyrPhFdiVboSDhVCKTCyLZ9YKbRD11gz1BOLkMX8waNeAKjANsIUEACmWmSlW6OW0kvjhXxysVQ4lVr+/jIKB3VnsFy4DCn8X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaAS285C; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3870acaf897so1091261fa.0
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 05:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772113066; x=1772717866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F67FDfmgjVm3wpS+eNxqWaMxkVEtxj6Y3fGmAZxQ4vU=;
        b=gaAS285CD8IhdFgAYeiP0LOQRAck8xFmCM0mCG2F/iljIwnRXD+/6xUYwafFwFxJms
         OYP6Y5mJJCxn4fJLTQsAVCSkW29nfwLX29hUJe+iSbPwBh5pvFYccPK7ntQgXAcoziN+
         SGEeZiMfYmROSKLZ0xb5Q37DgHAujG1ela+4lkVllarth5hA6A+ML1PCedO8g49E4ukK
         36R+uglFVfB6r1s7jEt2vB6VvZHpbpIUwVfX6Tk11/tfDKKfkUPpBL6uZIoC20YCwftX
         28SfFWfyLcCt9OkBLcFdaEADNgvrRaBHFBzeZN16wlsd25T9/bndFs1o7C2opUhUuxU+
         1RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113066; x=1772717866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F67FDfmgjVm3wpS+eNxqWaMxkVEtxj6Y3fGmAZxQ4vU=;
        b=QD9fZ2/0W4E7KWNxC9gscIbUTyjJeE+G7CGAWYEt6RrntjkKen32do1dSwmipUO4qQ
         xzlEdnAWFTlxJQATnIkM2rsSjiKYQSDKbijE4LyOohOXkWOqsNXsjFP+DU/nUBJebxCJ
         MkFcGr3pQew3QO7g8szrBhVrbqBHd8h1uwLFvEK4yMD1iPNHtkrQxJZW3F+dE8d7F076
         SkVv/81vvV6X6bSrnEwj0uXU5tgrVHMm4Pd1lCbgohKXAzx7afe/l3GmiBDNRfPC3+E/
         3pgrdK47o1GKyClUcSVwqXh0BjpJ5Yb3sRi2QsQJrhBFoB5okOzUo/aSzvZvwCcOTApO
         x61Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0cIR8W34EvS4sdrtnkEO/+bv/imzI930ZYNOaIBQAjhxV7rmaPfJA1a2Bs3tjxMSnIjih+4vMsBUevA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBbMXaZixTWMZ89Nf2CrvejElQSfD+7nHBBFilvHoWGFc0smo
	YUJz53JhSWv98VjODvf3WJaYwpiTa63GdLX+xX7kgTJ20lRhp3mCdKIdrmO192zO1iU=
X-Gm-Gg: ATEYQzwvADveG0P+CNpeOq7VS+f6ach3XbuKoxJb71cmfJ+IycnjloAFxR7uOwG3EE5
	W4Gc4Hy3WdeZ+cAaTaS+Qk7omNkAq/bV053bRcZowq8sfmbB65mdi4FOOK3NemhFhuww3W+54ML
	hejcDi7ajaO3mz35mQgs2Tvzunc9qrFDRoC2+rhztiXQHV5SKQloWBnqeMDmJuN8zku/a+ZF5H/
	7NKLAScOcHrunDw1PjPDfx+SzN+AQFczpgO1r4SfsDlJ5It48+Pzs/S44BUduWiyNFYNkCgFP7u
	yAqn84t+da2Xfbv42z5fspD5OqMxrC26Ax2HmKgvlEVVPYJnmigh28NRn+MyFf7RM/gdqjMOhdV
	Kue8X0nqv1XgdXLDP1Ce+/gL0MuUnTgiHWrTopf4lSqaU0FkAM2YudW0rqbD0aQI4wBkDgKfUhj
	GZURRXhcyiGAk/u3BrxXsk1xumNq48dWYjEadj0V4rLhqN9l3piguWLfKyay3LEoBvGATPpWNxp
	YXj
X-Received: by 2002:a05:651c:41d9:b0:386:46ac:8356 with SMTP id 38308e7fff4ca-389a5deb577mr30706041fa.8.1772113066075;
        Thu, 26 Feb 2026 05:37:46 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302292bsm6572041fa.45.2026.02.26.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:37:45 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/6] media: i2c: og01a1b: Updates to the driver and 8-bit mode support
Date: Thu, 26 Feb 2026 15:37:33 +0200
Message-ID: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
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
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53496-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 0D2071A6D10
X-Rspamd-Action: no action

The changeset updates Omnivision OG01A1B camera sensor driver by utilizing
shared V4L2 helpers and adds Y8 media bus support.

Vladimir Zapolskiy (6):
  media: i2c: og01a1b: Fix V4L2 subdevice data initialization on probe
  media: i2c: og01a1b: Switch from .s_stream to .enable_streams/.disable_streams
  media: i2c: og01a1b: Change I2C interface controls to V4L2 CCI
  media: i2c: og01a1b: Replace .open with .init_state internal ops
  media: i2c: og01a1b: Use generic v4l2_subdev_get_fmt() to get format
  media: i2c: og01a1b: Add support of 8-bit media bus format

 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/og01a1b.c | 895 +++++++++++++++++-------------------
 2 files changed, 411 insertions(+), 485 deletions(-)

-- 
2.49.0


