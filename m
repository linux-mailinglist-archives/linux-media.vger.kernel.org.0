Return-Path: <linux-media+bounces-55202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BQiNZtDsGlLhgIAu9opvQ
	(envelope-from <linux-media+bounces-55202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:15:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B482546D5
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A39093069653
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70853309F08;
	Tue, 10 Mar 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKA6NMYu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F43033F6
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155020; cv=none; b=s5FaJYbUp73/xRiKEjaZyjIlAQYcyaY+BEZPwJFhJ/WMIdX6bhHLFdJR7ZAIxHMbM9lqXbggJ52FPFzKZqzv0VHGEFo3SdYqB9km/7SPGl74Yq2hEAS+DvNsMOo+tPxAz/Yvm5CF2DVOjy519VvMYZrlecLV8cD48it0vcDlQmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155020; c=relaxed/simple;
	bh=cSSx7yxC9P/o3KE9SpCvoPLsSjEbakpZEXS+NULRhAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grXXDY2xdbngk1u4+F+5+6wh2yDPEqZ+9iqSZsJeGtqbcaIA1kd/UbrFNX7XHLD8JyYFcjEAEN96efdWCVWQ7g5Q1CNIYRiNZqRumckYZwbOrefieVk/DtW8Mp+VINIrGCxY5m02OFAIoPIFq4qj/qSAB1GvbStK1RvNBbV9J6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKA6NMYu; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a10d130b37so5601494e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155018; x=1773759818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+vC+hK6+CJjzXWl6zvotc+qQlzZ/n3VEaRMJZOvmv4=;
        b=FKA6NMYuOuLoliksSjSTYmz6w91TCD05TXW/zwY+uGnKrrPd5bIy4y9c48UHOoqskX
         3JqtHZVrKkHf1ks+9OYRzNC5frkfqADCK1sDoVQrBvrJP3/GbCV9o9KaSW1efD3Jxi9z
         mp6mVeEsOOPe1j0ztKJLf/qgRXKgDMjQDDVuDmQv0rHaOXmJL/Os8O+oz+UNMElTKxes
         u3jEr/Cm+5mGPjHozk1l+QLk4KqTHFb7Hd4FNlozwr9xPhi8bTm4R+mz27PkRpoOks8P
         Of9/j7P4I3OXeYyTvdSFUXY7uHZjoKGmTyPfuMimNqqVMJ7/41MYsTAj2mjqOyYGiKjF
         fg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155018; x=1773759818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+vC+hK6+CJjzXWl6zvotc+qQlzZ/n3VEaRMJZOvmv4=;
        b=Pe7sCPhip/3mkP9ZUZICsDeXGCkrEBT0SiOs0j+QPKJXAgV12P4B3NJ5njFCsUim71
         GQZMw9ZMGm+jUroal6OseMOWAFAkbZkAgrNC3FCLYOrHPs6XWGiOd9dEKVdhnqUcuMXZ
         ujS86THYuKlVsjdqgQFvQYu+JZZkjfD2LYO6+ttt/WxhZQFhlri1gHcceUckJpVSywNB
         ouVXMO/1g14hdZQVCRPtvs8Rb9MNqMRedsYOWYP6YGOIl2ao3on2u0ckKFUYdFconnjA
         T732Nmxcy4Krj8sqg1+lhMc7Qv2mKv6PECAJQqysF8AZLCjSQwJMF6n03L9YSkbTj/mr
         0bLw==
X-Forwarded-Encrypted: i=1; AJvYcCWYRoVqbkzonIfQFMn27687HxsFLMCvb0UK/BtDRbW4Q68+xQdMML8JT5BTiWWRIHlZcDv7ZasZD85HSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXmdowzVbcZiQf9z3eP/FuNTFfwl5a9qCaiwWqVIrTtO444Rq
	nA3qRMz0GJWkYGXbTlezz5nkoToXXJqWcD7Li75QLodu38eyuK7HsNXJ1ka/qw==
X-Gm-Gg: ATEYQzzuO2MnOtv7LnjxGCKCmIi898lObTOsFDEkqnpcvQlOYGlUrZgZQoPnWTpm65p
	dWoUvSOrQiBuAdFEBgmrUZy3J7pV20SSYzAkXA8MCTOrbX9rV7OLWror3jFI3EjBqV2cmFA52Rn
	Fpr4iLFj6ykFNUBqq+738U+HYiUKa1I6s6lhAmnLj8h4okEdLUBAR2uLkNVlLOfId3uy+nDANbV
	o9DTPewSem06sHni6DiLADBEoyRjpFVU5D554FGwkAGMCI94Qw2LDEBs4cS6s6xf5mgQeSBqvvX
	LVwXk8CjCqWJW8rO7pIu/ifpcLq6PF93kIH1w+BxTd0TFPUZZtt10HrQJdu33+wURJQqrnkFM7i
	ytIHJ95ajN4E4jdPdzZzE43JTg6qFowB4mbd/jr+zEpqqmO/6A8jLnITJigEvBF2DUzE+AeZxx4
	+s9XGZDFVhIznsFrgcRkja9yR5iIJoiUfEILgyjP5kkQV0W7+IEpKdbxpkkQzSoZjPLb6CpN1yX
	Q0=
X-Received: by 2002:a05:6512:154c:20b0:5a0:ecb2:c0c2 with SMTP id 2adb3069b0e04-5a14e4691cdmr1068579e87.4.1773155016814;
        Tue, 10 Mar 2026 08:03:36 -0700 (PDT)
Received: from T6NXCV08J99224A.admin.jenseneducation.se ([185.154.228.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0a3sm2819033e87.49.2026.03.10.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:03:35 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: replace msleep() with fsleep() in atomisp-gc2235.c
Date: Tue, 10 Mar 2026 16:03:14 +0100
Message-ID: <20260310150314.565-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309231445.7000-1-rayfraytech@gmail.com>
References: <20260309231445.7000-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E1B482546D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55202-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Replace msleep(5) with fsleep(5000) to avoid sleeping longer than
necessary. msleep() with values less than 20ms may sleep for up to
20ms due to timer granularity. fsleep() selects the appropriate sleep
function automatically.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..7999c8595a68 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	fsleep(5000);
 	return 0;
 
 fail_clk:
-- 
2.43.0


