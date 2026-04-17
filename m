Return-Path: <linux-media+bounces-59002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF6BO5od4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:46:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A141AE8A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A95A3019F18
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D9244694;
	Fri, 17 Apr 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyGwe4Sw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED77390207
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426168; cv=none; b=kkljK0CvrkpAcJMxd74o7zu65xbu9Nx5pulO4BIQmSTLgdXHxDjViidPjLoINsJkUmSa5eUP73lsZ6WBg9KTIph2JAgy+/+J1tr6Mi+rnO8zQQ5vzq9rpC9MY4n4zojcGHGLt9jT+wAwT14Tj4xhYQeZ9hOKe/JyMCD8rYS86VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426168; c=relaxed/simple;
	bh=m6BsFNYPJXLrBc7M3UqW63oYvoO7GXOCslzkSLEcFco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3heMQllerw8d+avPt5ssMYbWwvw3v4Ig345fwALDK7C8xmPvhTjXo54JSH0TA81btt4xAUGp6X01YK1exMllMyjgwfhId+yXRp4V8QvDagkZ1c2wXuhu8kEgt7kzyP25kdq7zN1SmO1XBhsKbx03ex3C4VJYZNUDZ9kjcDRlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyGwe4Sw; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so655791e87.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426165; x=1777030965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLdo2H6NxgwWwn5lBU5hwxF/LxLv45z/NMU53uF3AMw=;
        b=EyGwe4Sw4bBq+wMZYeu/VWXhlarSvOzzDwAYF5IPsCAyZ7rB+YR1Z8p6KRoeVDEQec
         8Z5ak0MKUgqVtHuLx5Ke8Kj75e72qgTl4mJwvsvIvC0BfQTzkvkQVGtwCTyC4j+OdNkB
         kT7bxH0fji7uSjvXE7xfDnpnBjIorYpHwQ+UzdPsUfClHFrQDySt5tOhtnd0YHQ8/FoR
         9NMjBK3hDz/DbqEx1fBkEqJqGpy+i02L+W3NQZN/2QG1K7J69POjQ5M4mr+11C7AXoEg
         0BgyV6C9XVm9bt3Qxw+kOkyrjemx+5lJSdulLhJ9X3SSX3jDXSOWMeDtlzt3hDpw+WGv
         XBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426165; x=1777030965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLdo2H6NxgwWwn5lBU5hwxF/LxLv45z/NMU53uF3AMw=;
        b=rwJmIHYJzwlT9AUs1WL3A8wjKn7D8OlBOkWNAsLW7iPhDs90stIz290Ee3+icBmckw
         bqOE/7JsO2oUKpgxACxaNZtrZvodN1AEYx917Xc/23z3VhcKETu7XvW1uaBRSaO8mf+/
         SvHCKA8sG3+7ttRAjpimPFFKxVQ2o+xWdm+lMCpM3ZyQ8hDLAy0KIW8x8JSkdBBtQUag
         DikYQFAGLr3RfgPD8v4oXlKkQ2aUCd2mZ75Wxoy/pa1TU7L7T7YWpHpsOlaPvVJ4P3YZ
         zuQp5EOoAdlGU+HPkAQMxYByI93wwdpvfFiqnPLG22apDOJm7HWXwv/lLuAwKDQGeLzw
         sKRw==
X-Forwarded-Encrypted: i=1; AFNElJ9Im3THA/zdGTrQz0EX+PknWFS4NgmHKl/Gx9l1Z+nFjP6nS6CaXmhLyqUdkA49FCyzek+eg18J3N9Yag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfjQClPojfUz5H2wLpmoSPw/cFdcg7+yNJ7y6wuh6f3avp0tN
	MZ9gZhBMz5NZBUjoEMEcZtYDjIRPF9aZe26dy7s4fVUslC/reHDdM7loc72aL6gw
X-Gm-Gg: AeBDiet8H2Utluople60dXU6UoAnCxi1QOGydVAs2dQPXPOId1haGYTE8OwLWvv7uKU
	bbpRJMtcSxVeKM+H1SrXrXrH+m+yJeCo8Xnhf3xd8JcwJlZMQ4wsNYqNDfeiWJdH749Cn80nus4
	HKtb3fh1GT5BQfugdpKIU2XBnVuSn1xRVCHNa9DYnpB1ksUiqE8Qjjadge7KkT4FcI7O6MrJTl9
	Bl3j3Dr98zBlZ4lX17PzS0c4PHtnRi8Lg/V5vlZNCPjT88yaLW+8lmol74geWgBJDpibvxozVTW
	HeEXKjJjwHqXMjmvg0W/nF+Dcnzp3c/g+ABWfHKFrj8QSP3gTVZiqXLdZdj1wj0p95ezdaJAkWs
	G5dkxTU6CJ7nk4yAYGcFfwZan+4F2btJ1d+Biu7/gTOAYbCALYMSMbNNBLT+4tw9sS5aAem1KiJ
	D/OIGoV4fCvD2yr+v9g4aMacg=
X-Received: by 2002:a05:6512:31d6:b0:5a3:f309:47e4 with SMTP id 2adb3069b0e04-5a4172eeb12mr744644e87.32.1776426164792;
        Fri, 17 Apr 2026 04:42:44 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/5] media: lm3560: convert to use OF bindings
Date: Fri, 17 Apr 2026 14:42:21 +0300
Message-ID: <20260417114226.100033-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59002-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 702A141AE8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

Svyatoslav Ryhel (5):
  media: lm3560: Add HWEN pin support
  media: lm3560: Add IN supply support
  media: lm3560: Fix v4l2 subdev registration
  media: lm3560: convert to use OF bindings
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 +++++++++++++++++
 drivers/media/i2c/lm3560.c                    | 139 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 --
 3 files changed, 243 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0


