Return-Path: <linux-media+bounces-65619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p81RMvLlPGoyuAgAu9opvQ
	(envelope-from <linux-media+bounces-65619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:25:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF36C3C13
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 10:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jeFiJGez;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65619-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65619-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 349D23009B06
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46062882C5;
	Thu, 25 Jun 2026 08:21:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CD3806DA
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 08:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375686; cv=none; b=XgG7+kKLSvIo8OR6vPnw9GKtEAkD5fXQ7NUhgSJYy+m1d4h6nQvdE0Rtl7KBaR98uSAIIdcGHfogUP4bvQEUhzVPizFityIRJ27oIPpu5dWHFI1zpSZdCx6ABhD9+4WeQq2jKbupvi0bQpuIo9cbg44ieQ2Qy7LA327l2Lh6A8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375686; c=relaxed/simple;
	bh=SVEQGXIbMqohrJs9zpmIizHMnqWKm9bWuTcRI+b9aC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alzbZ/GORtfxyY9M3S0PiXmfQSoPRqC4QU3Kx6mv2MGwCA3CzoYatIlzPfeFXrwoqL9wiEcEpaCsvuFRXWs9yroxa6SIgQrAcxPQ1h6dpjhMN4iuipjNHHZTVo3Tm6Hoho0boy0TCjllBM6xBDLfRRhR1TzHFNYDi+G3tm1NLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeFiJGez; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa7a7ad475so2265702e87.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375682; x=1782980482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZC6Jfvq7qJEustPvUJtSgk/boZ9lHK7Ab+ZItpNi80=;
        b=jeFiJGezYhWSSQm0oZ/X/kma1HD7m9e/2Cm+Nq0nP8YJEEZ6Y4ygfLYx7H8vXPurnx
         r2hGpF84yqWWmi2eF/eO1TWPUgIGJ3UgpLkZsT9+R9/NyLoH6sCEB8hSay/WWCjqRZ8Y
         kvyqewbZepJZ3Lw2jWauLZKmeLLy0a20GhBRoI/+KyOINb8L9aS5FDM4XmNDfELt3Wmj
         4xwc9diP+EEN5NmTWZdo2BQ9TWEJ+cBWEgwl3fK+aRdxude+m2lJpFVmEScPqFaQJn4e
         JgutpXVGUdSAH4Pt1u1dwsgZc6Y5ZhCaU8elxt0bC8/SRJ0UYmZ23/chuytElM8OC3Nc
         3xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375682; x=1782980482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZC6Jfvq7qJEustPvUJtSgk/boZ9lHK7Ab+ZItpNi80=;
        b=Et7iSQI/r2s7xa5GiTUl6kuhTK7+Z6qmYWNXQFophkeb4tFEerS0rboG/2CvWctx8w
         /kf2b4ad4Ev5A5xF3IaIQaEIT7pjvrWx24R02hzn14li/TSEhcfb/MsFKnPTs6yJQa+s
         Fv3AsgHOQCrVcjO0T4KDzdDsdDRhSLuszypMrRJ7CAjNmD0ieB40y6vxUeitU+7AIXZb
         VeJKw8j2WOtOGa1Em6X+MTFeIAUoRllXKk9Qjho9/nvzGvKUrjOO0qxjvGTWSemOqlBh
         RhzQoIUw8fT0+2LR8chZOaxuSCJ0KqEy/FBQPjtf8rQ0jWA0kVE79JeLcrfSvqg2EIJp
         JZ0w==
X-Gm-Message-State: AOJu0YwKZiQDeag4SS831mS+KlBys88lWx8g4aJ+/sqV0GpXwlT62nz0
	pKlsVVr/xL5UiW3xeuKFZjCTtT5EoLFm4BTzROIpnuGm9SsTn86xF2fY
X-Gm-Gg: AfdE7clsE7BGjUPyidc/mXIYfOQR4OEbPf4ARqPGsE5uH6RTRbkzdNuq/tNohj/N06W
	kBa7zfGAjbW2MWO17HRm+kEInYqjAoVwhRPZ/CZR+Ig/p6XoVe6ijeQPCm9JcU+q4KlaYyH1Lfl
	Cb0CO9h0a0aLbmaAwPC394viZh5yhnRGYqBHTs8V4KhoWuRuRy44ZmTodYFkjyOL4i8O7+ttj3L
	yVn1yo4XJUOG6RdRb8F8q39xXamsNMJeWCAmM0uHKwYgOx8yBXnxGq6l3n5Inz6PCIZK4JcFE1S
	2Jqnil1t1FsiU/vVJkR04loIQTA+smeBkRfWz335mnktzWYPTyRS5Fv28LDX57vjGpNjcHRv6fi
	PGyDMvcJk8uCWPfoxTi0kxQCZsYbCc1O72ggDn6VWC+ElNbFndrhLXt0kFgYrdqKxO5wFGcTd3q
	LsnP5+QHmmslrimQiymPvZqMbw4hxnnCJybu68waMFEU9R
X-Received: by 2002:ac2:4f16:0:b0:5aa:6c89:72d8 with SMTP id 2adb3069b0e04-5aea1f48d09mr443137e87.19.1782375681827;
        Thu, 25 Jun 2026 01:21:21 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69580f73sm2430529e87.63.2026.06.25.01.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:21:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Thu, 25 Jun 2026 11:21:10 +0300
Message-ID: <20260625082111.47898-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65619-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DFF36C3C13

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

Svyatoslav Ryhel (1):
  media: i2c: mt9m114: Add get_fwnode_pad operation for IFP

 drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 10 deletions(-)

-- 
2.51.0


