Return-Path: <linux-media+bounces-57455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEglFX/zx2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:27:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3E34EE20
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F82830074AE
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3A330DD10;
	Sat, 28 Mar 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdCdRjvT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F930EF86
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711674; cv=none; b=pWVs2cG0dA7b/8R/PS9DNh2wwY4mi6VZtipwlaKOKsHY80ITrNNpIY/roDdg5eqdP0lT3fmvcm+bAUlqVwPE0r/KZJSXpH2YS37jg5NTww8FdMU3Z99WyCgIALXwdlMvSXpYwI5rYck9zMc0+y6DgU73x2tIDv75M//vzNE93E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711674; c=relaxed/simple;
	bh=aPmpfFpggnZ7yh+fNy8bK/Rco8BtGKmejVmvEZpM/zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SkWfoyhV3DGsMW3F0rIXqlN3czbtDUBMcyteYIYvSqlX8HgMFjs9o90I2umYglHh+djD6FXnz5J1RxsnFCRsObvIn2z9kGf/lPFMMINItZKL6fAEn02lfnmGh8ETfjiEBRUp+CKi3sJw2SwCGwMVDzK71heiGO8GF5fsL6PL7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdCdRjvT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66a82351490so5464587a12.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711671; x=1775316471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKTzUyCJVefkIQog5iRQn1oimRCi8Kk7F9aJbK64clc=;
        b=JdCdRjvTRHdM1aJKOgg5T+z6XtFR4Q1EguvHSZ/0KrXOtOylbAwtPzkTWYLJV/gtok
         8eoQXO1WaCw3AAA3/gcLGRfKaGKS7TLB0sk+nQtK1na6RX4dAokWiA2rY9TB7AeqZ5Nn
         /YPS++5mDZOh11WilJmKjJnjZJ0jizv8uPO64bdtt8bl5rWqBhsH/ALS15TpMAp6HCd1
         UU4tqYEbx69YQk5byC34dqVP+y8Oz6RnHDJyPoRTZ38Nf3edcKBtdc4nvngoDWZxS64Y
         fRcVehGwzi7BOR3H9F2wnoAftrWNN/xxQxYLbrqkil8FL85hKLXWG7BzUlQ6jh4RK4Dc
         2i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711671; x=1775316471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKTzUyCJVefkIQog5iRQn1oimRCi8Kk7F9aJbK64clc=;
        b=EbqxQCzcKmjOAzMxeEQ9I3XnRcm4/W8rhPCPGIHfTnI9tRh1cFohtIQuzLrfEBRR7L
         Zgm0sJo6h4jOjlTokAv1epndEv6sYx6d52IUKXg8kL4rxm9OeYPhe4LMPUVyU1UMFlif
         Y3Ni1i47QAgyR1KdlrzBP9BXj9XY1GbiFz6YFSMJUQN/2rim+yU6mOaSn7jkg9bLCrYD
         udER6Do/GJyT7QrwDu73vC71GhLl3AaoNSD7QJNoFLpWmLFUYXkX3v5zNM8W/fJ1UWuQ
         SwQJFiHIyByV/M9b8ddMcGKV92SUVm/9neOGR7svuDIHB7Mg5botEHYn8DpYuQRo1cTW
         qMHw==
X-Gm-Message-State: AOJu0Yz2pQNjE7Ig37A3rGQKDDdRMkS1waox6+sAsiBnAKtJTbI+gTRF
	BAIWTyZul+iVhDb2UJsosAh8LCxUXJKxckEfhdqvSGgEbbPsGPw8REbLWjTawF3yAXA=
X-Gm-Gg: ATEYQzwshSFWxer9K7ZOa1455wDIEJLTwdj6INZILd2LRb5j3do4SzTfH79/adb6NtH
	QC6l3vCp8yMPWcr2BAJKQaT4nYjpR6dy2ULmrYRATLb7xDbAzIXksLSUJF6VLGJCxuGEJOAjPeM
	+XWrifU+Vb4wLwzHh+4mqLmnHCLaYl7JuxWv34HTF/fSb5kZrgrdo+VNKSIlkIHXhucGbHxIKg4
	H8tuM/50JG0DUcPLRvhHFkAsuBPRhyjYAhR/2gdt86g1Him2xuCHg73MDrzZwaF9L91ptG1DwXj
	G4r9SyD5ZcKXXAucJCQuokhQ78AH9UeDzRhJmJ7U3jGptU1hZ/zoo/eFcuJ90t4TUaLORNPVOea
	AMNPZOl55xukqbhP54J8GyVovgazatQZ69zv7NBkdOFhQxtntCXSHXQtXk2CXQ5yvroO0/Es5hY
	ZCCOg+jfVhdrGgvMeANxKLF7cJjytTacaBUmFC0Cps+YYbeC9kASn5hPkP9ApG2/tmeD5E1wj9Q
	ZfKywwxbtL0vX0RG5tJjEwxSvMVC3kyIcMrjFfX7Mx076Y=
X-Received: by 2002:a05:6000:3109:b0:43c:a352:c34f with SMTP id ffacd0b85a97d-43ca352c69cmr6097729f8f.7.1774704567550;
        Sat, 28 Mar 2026 06:29:27 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e1de:7c03:e16f:8136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm5369110f8f.1.2026.03.28.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 06:29:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] media: ov5645: Implement frame descriptor reporting and convert to CCI register access helpers
Date: Sat, 28 Mar 2026 13:29:00 +0000
Message-ID: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57455-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E8E3E34EE20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series implements the .get_frame_desc() subdev operation for the
OV5645 camera sensor driver to report information about streams to the
connected CSI-2 receiver. This is required to let the CSI-2 receiver
driver know about virtual channels and data types for each stream.

The series also converts the OV5645 driver to use CCI register access
helpers, which simplifies the code and improves error handling.

v1->v2
- Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
- Fixed checkpatch warnings limiting to 80 characters per line.

Note
- patch 1/2 was origally part of series [0], patches 1-7 from series
  [0] have been already merged.
- patches apply on top of media/next commit-id 2c8fe1f14240

[0] https://lore.kernel.org/all/20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: i2c: ov5645: Report streams using frame descriptors
  media: i2c: ov5645: Convert to CCI register access helpers

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5645.c | 934 ++++++++++++++++++-------------------
 2 files changed, 462 insertions(+), 473 deletions(-)

-- 
2.53.0


