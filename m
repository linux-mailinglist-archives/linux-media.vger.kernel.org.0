Return-Path: <linux-media+bounces-52651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFuPN7bGjWnT6gAAu9opvQ
	(envelope-from <linux-media+bounces-52651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:25:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C612D70B
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D939306D863
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D1B3587B0;
	Thu, 12 Feb 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STqzTlS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9835772C
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770899012; cv=none; b=UObwqztooBb9qu7U4gVOu69uYEEBms8mLyDhCOIPGOcv5aPLwoIN6FysK9dLxUkYa22YVWoZ3XnirQ/qoYc1As8DzAQiUF0Bvr8wD6VfUYQNQ6hi3wIaOlbfnxpOgg/1rEkfwOKfnk6zpblEQAyDvXz1w/jleC5eXM4pq/tRqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770899012; c=relaxed/simple;
	bh=SGeG5Oc9Hi7+w3bjYA4BEFQUuMIm1BM7dNLIk/et/8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCjMYByio2GLHvurg/abUiNv9NOsdj7KOzQOt+FvuFyD08I15N9JiYHEPB2o8C8f+TYmWdm6pGvGuL/7pw1youfZFk7UcUBQr4tLrq26FSPZIYso5upJwauhpQao5dLnuROqUeHvokDq22EsKh2igaMPQDHEnYnkqB436Wb6wjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STqzTlS2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b885e8c6700so1269825666b.0
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770899009; x=1771503809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8YQzUIAiUS8rxddPlLKSmdZdg8Lpt3TKKcM7aSYoAQ=;
        b=STqzTlS2wtziEer8Sj/OXZ9KDwwtxfOWfIor7W9EO37he5g9E/drIbwWfxyvJmmlJV
         +/4KT0A0G/HjfpyBb7nzATgHOb05X8JFQ/oPNNYaU+ywUz/w1RP8eMgUh/RiALwyL1CC
         05pD2NiaLt8BNsWByqcQZ1CLqHDcLSoPd+sQ43WfiTIT1SryMKw+iZK/Ox1JCj9ez6qT
         d3qxFYkBActmFOJxPT09pNMqlMomibVhVxCrxXBVKusw9E9pz8o37We4JxHh5QZzWCD3
         uM/KeMqaMrq4/EI+xaiEkDgS9txQQnH8Oh0mBGKIbJpsy9a7w1vrrp4T7SzmNQSGPc0y
         etMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770899009; x=1771503809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8YQzUIAiUS8rxddPlLKSmdZdg8Lpt3TKKcM7aSYoAQ=;
        b=kSFpduxNh6FLgQnBYM8sam1e9EBjqpgQ2mZ7KRJJpCIzw28ujJ3MaZz1H69HISjhj+
         bG0BYbdhOmItku/P0RIz2i+3uJ0cNslNlXiJzoERfWm5IxoDbnCBySDlqkrWO0R6sPqf
         j+vmKj5vIJXnkSrx/VP0AL5i180g1PtgPatmLXJbNF5ncw6e2XjPAl8AVW9KrHW3aCth
         4sfXJF1IS/3wRO06UI7XUOQhTgzSR60FE02A23Oz4x3hUwdm2LQo2I+LF1pnU1m6y+u5
         XXqwI8VJSDi+igsDUf10SRDERaNbX7CgezJDDc6Ddovaist1IM8eVBXHGtbUF1y0SV1g
         PE4A==
X-Gm-Message-State: AOJu0YyAZpbSZLLY7F57agRgFXs3KbWDBAZEpNsUYgwgc2oyvpXuLvkq
	nv228xx+yddAlhX/yaEDy3P11Qu3jy9B1ord887I04waco4CNAd3LkkW
X-Gm-Gg: AZuq6aLGUfLcqSKE/9+41wiPYo+1hVPO8t13XyfDBipUXhFHCudtO8Qe7XaoD9TWDgZ
	JnenMLdGfLg/8Ch0rd9YCG5v6nychzwfieGnO1dq0bSYQO/KS8r7NZvmzgxBUa/VDV/Ltwlh6y9
	Eu3k3u//8pnxUAosnAQI2ZP80KFQZufbeAQAWznWDKT6tVvm5+KwYuoS+fDl/fwYqH425wcZ+mU
	C1MZH9XpsZWM/ZMF4NQNNDgVcGGrWXfLwpom618/muFIXybSmVMYK3x0c8O+bPZLhq/xxb4Lgy9
	NtRVZeTjjKj8lnVYo5OYfDzxihwEZp/5eUgg5ZMOZNS4Nlbq77jhcII1/0N4dCpz7tNm0RBP+uJ
	URqGa0suMFBvXKMl3U5+1WncrQTh/4QN7ED+g11kKavbFQavHjgDdD/nFXyKdQZXHpwaBL9gaE5
	Tz4iLRZXffGows
X-Received: by 2002:a17:907:3f96:b0:b84:1fc7:944f with SMTP id a640c23a62f3a-b8f8f646220mr135961366b.45.1770899006887;
        Thu, 12 Feb 2026 04:23:26 -0800 (PST)
Received: from xeon ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1c753sm155603466b.45.2026.02.12.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:23:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Thu, 12 Feb 2026 14:23:00 +0200
Message-ID: <20260212122302.29211-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-52651-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 440C612D70B
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. Add support for MI1040 into MT9M114 driver and
document it in schema.

---
Changes in v2:
- dropped conditional polling of command register 
- switched to device_get_match_data
- cosmetic changes and typo fixes
---

Svyatoslav Ryhel (2):
  dt-bindings: media: mt9m114: document MI1040 sensor
  media: i2c: mt9m114: add support for Aptina MI1040

 .../bindings/media/i2c/onnn,mt9m114.yaml      |  4 ++-
 drivers/media/i2c/mt9m114.c                   | 29 +++++++++++++++----
 2 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.51.0


