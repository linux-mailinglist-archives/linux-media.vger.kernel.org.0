Return-Path: <linux-media+bounces-56092-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eACvBdVbuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56092-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:49:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7532AB38F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9709B30B2DE5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCC030CD80;
	Tue, 17 Mar 2026 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1IsiyXX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5FE30DEA0
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755231; cv=none; b=J7WvLHgz20zUTV/F9BfAnF6jqaYI6omgZpjM9TnYNm6sQX/EJIzerXCBXIgTtA1fo/1U/zKwai1kGu/zbsWCMe3TNzkbHYpYGhtwXR6ysejZmclOGgwoltkXkLjJlDj1reKtfwdYlTQoJHAmSZ8I4A8LKDr2ZTQ0RW6gpYA6Qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755231; c=relaxed/simple;
	bh=/x9bu8KevwXQZUlu2VPi3Pigx2Icge0JmO4mg9haX+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sO/w5JrfH2lIvVFhx9W5L90E6h8ZsyqJH2+cg0VCdh3fz5NMfx3u5xi2ry/M18BSS5KpdPIsFW4XENVpg1Fyu+Z+3/VrhxJFSwEJDKrRu0oFknlNahFU5+kRLZPsIaNYSd9/eJCA4Kt7OjD/1u7ptarUyHQENtaD9M444Ze2i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1IsiyXX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c73fbdd9b53so919644a12.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773755229; x=1774360029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=e1IsiyXX2Gb2kpeZIswcndeoSUGjV7M25p9NOQCbYSgNbvFKBhrCswsLPMjELVgNi8
         +7Q0nAE1XBwMV/9A4vXwq/rLyZ03dn+9gLlfYIwje3lIxR6NZenQp/lxXmfLyD+vj0MB
         5CjPXgKZKbXJXXroIWKtN2YgVyp0OscchBfed9jZiAHTSwcOtH7+wSAefOI1S1GnfWlf
         8yMra79x5zfwR8SiSn737X6xTB9uyuStTmmj+x2Mwy8DslkM33zjuLpHiDu4EU7XVKae
         jX0C2t2JjbmzC+cYHcRALm4otbO0kWygcbw1parDSCblQBiShJBNUwLXZuMFTvihwGPv
         1yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755229; x=1774360029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=oabcxt5Bxuz3u8xCkGW/OhAbHoP/KsssXnYSHUHXZByIsjHXSv1D+EGMbtA863exO3
         aBtmjYR6ZPzc4vjmQFGwZz8WmNIFSUAgmFx00kyQ9KerLmp2PDc/ntdWbl1qDg/oLS2b
         9MkZ2NFG8KOSjobcHl6jzZ1DXSWFpqJ67pgTiC5VkpSE+wDXOCZJ43adZGKjxIdPlJlh
         2jjyWk0cvUTjDkl/PXw6N1IS4Jv6lsJUEgYR4dqx0Wenh5HUB3Yzfsa9BpL4hA9nDJ+p
         +sUkeQ7Eq7TDtG5B+tscS2Ql+ct4rjaka0XPMPWRWMSCbUiyn//MQbNn3ZcrxGj0W1A5
         KiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmwrMx+yyZyqS7mWmbjkayYRhsjun7kNcuqjcpXnYfCAZMTa87Y4RHR6BTlatMlsLAXT5Z2i5IQ6DP0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvwuXUCmyqGrVmwqUiOcy98jva93DwOvI1BDCTpgopmcviZPQ
	VipB2H/SAtxeJxUQNa9CtCFmKqgxN1NygcfxyXi1tVi3tYGHkkcY3loo
X-Gm-Gg: ATEYQzxrWvn1iPh7wXfFlMMPSbdjTDdIBkv4FIFsgh7L7m43x1OYcdCLrUcPMIX+seU
	adsRyAXNRUPUwBV8JHkd07toO3mTdqzFC6ruIMaUvBi6UwSiS6r4zC/z5xU9ZaKzELQ8C7YuMkA
	7IsRxApQwiEBGS1Pzp4hu/NKgtcslc2anEabet+IuCsbq31tOFIHX1Ojhdw7rZWwqUtXB0JY0T2
	qg9XIh4/lIUNtDuR0zIa5x4fcSMLxIenLzdQRNqig3rc8i6+9YORQwrqsImoJV4e0nsBzi60uGT
	N0W2fOoIQZiJJ4O0pxJdhuYuiCLvhI+JlvLs09+pwymqunS9UAh4NaY1vL2VunWooIeczCsQo0k
	vIAGkO9fYdVYddtYZ1WXiwG8xcplyKWfjJMamGZH9O6G6StQAX2f2+Jbkt99SZZEkiSindyhppa
	ZduxJW53VgW8G25rHEWq0B/qW6GOqNVvvbyNbICw==
X-Received: by 2002:a05:6a21:50a:b0:398:9f1d:8a03 with SMTP id adf61e73a8af0-398ecd9d561mr16769427637.61.1773755229144;
        Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
Received: from padmashree.. ([2401:4900:91ee:4baa:27e8:65bd:dbc5:b65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eba9e183sm11898643a12.14.2026.03.17.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:47:08 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de
Cc: padmashreess2006@gmail.com,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: media: imx: fixed a brace coding style issue
Date: Tue, 17 Mar 2026 19:14:47 +0530
Message-ID: <20260317134448.389123-1-padmashreess2006@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56092-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,nxp.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[padmashreess2006@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE7532AB38F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixed a coding style issue.

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


