Return-Path: <linux-media+bounces-64056-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i76aLYhtJWqCIAIAu9opvQ
	(envelope-from <linux-media+bounces-64056-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:09:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C1650988
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 15:09:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="on/hwlCr";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64056-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64056-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 814553004631
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0CC3A8757;
	Sun,  7 Jun 2026 13:09:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4AF2580CF
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 13:09:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780837758; cv=none; b=qMmTImZJ0QnC1hkltRJcaBmS/w6mK4qzkvOIhCAK+1oUtmuhAh3rntbgo75IlBZS0l2KM1n7OcNNqQmDnHMYy4DvFLKwWBvSac/1K2Vu+u4KCfPBBzCyRrbVWafVjG97mBnrLAGhb0SwFNskCUWyz4KdLcgwbA/CxPaiAc4906M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780837758; c=relaxed/simple;
	bh=kIa4WR+4ZvZ1XYgDRLLVax8UYaGRS/FMxfw8b8U+Sqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O/k1IsAf4n7Oof4mTNqbUNRzMmqxRyVz76nJMZhhNY9gn3sNRBhS+JucW8sjkVj0+fmdlNYbqOuKOHBrh9W21oe0TDChZKkz/gQtnfLobeRSKdvsJSaSG8WIMj/w6tK0rnnAjZPKv/o37LJUYoFJpOUNaO+gFZtrFVcL8SUN/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=on/hwlCr; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-13810b63a1aso4273224c88.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780837756; x=1781442556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8JVk8dsTXfC1jRRBrTd+5n/RI+f91E6z98BLxf6eDc=;
        b=on/hwlCrHVue4kxm9HQ1AMhJlKzeK0ovmqD6O5LHoRiOGLN2T/rIC6W3NzTFgHniXW
         0PdRy5g6qXOmvHdyxjKLinUs4oM+q2wtU4VW5vCJVJ1AUmHHQ2i7uV/d79BcxxRjbd3o
         UAkyHuA+iyDtTH5NQuD0xPilrFHzYZGLIauflfOhTht/UKtb7lbUz//j4Q8z9SYswQgl
         pXjIyVcxPF1aGkUqZHaK9f2Ws7PigZfv3qtfj1eOBNVod5091UDrl4YTnvWYxxbcgR60
         EjEckI1h5YoM8a/Q9KlDgN03fuS7q6eX+ZKyMrJyNA6i2WnfB1xYdBkYAZKvQTtAzN5q
         kWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780837756; x=1781442556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8JVk8dsTXfC1jRRBrTd+5n/RI+f91E6z98BLxf6eDc=;
        b=cloXjb05ctfHw8SF/fqt/UQRt91DzIjn6PcZoKjzE8Qn5H06kh2mp7f+tppMox178E
         z6AoWOXLh+4GOUQcevR+sR3mZLPewzdUU5psYMicImPG23bzUAoQPbfB0l3iP5ZAmuIR
         fxt/PjoLnT647YAkjEzzxM1vQn0VaBTlgtrqUdrxQiIhFB7/uOsphEgEpVmNGyw8WI7t
         aKmohOJ9OibCrlUY1XHJB5gM3GjENMHtT/ARFPzsOI4bAk2ykszKdlOnSHBC2yYgM7oF
         2dJ24H3xvg/pgCZGZ4O6+Z01/QCdLX85iy+6RP858jZeZPStTR5lFxYd8u+fNcstEGWW
         EHjw==
X-Forwarded-Encrypted: i=1; AFNElJ/538sG5o8Rtn8phq0CZV8cCLHCnEKOUqX4BOsn/wUtP3Yc0uLwHy3V7K6Syd2YyBdCmBM9oyLYbbac3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwEb2FIFlnPp+wB4/Z3Cw4AC9WYfAL5AkCIKtNiknJq+cWrSJH
	YPzun8L6wt64BDI2//izCy6Bjujd0G4BHjJlXT551c79v+F1no1cUY08
X-Gm-Gg: Acq92OEWJ2rqH4E3RrXcJguA73RkYtWco9ccgRGaoizoIVsZ0oIU1kch+OgBrD8YimU
	98qm92g2SGoDCqJZ0xHrn9sVaWgH1Q1CJJgpMGShXTd+PCjKJWauHI1eC7XmIBPdtOT2Sp9b1nw
	vjUsGeFV6Yw7QTJi2N6guMF7NDPakrmPcP7IwEsJ/ZG/BS6pCTOgxoylwppql9rM3GIbAXaV0Nt
	CPGspa/ndtm2OB7+qMHuKVMR4WUybYZmtmgGKn0v6WQERYUmXgW/Sv1FajJjk8EgDqG4t01QvfI
	9fZB9j/0KTrOWO5NzLljm2cBqC/i7iwMgiVWc4Jiac9o8KoQZ7UlcFfYTq2tbEJePpBp00I3y9P
	gPdhDMV9lANBo6CXEYoLP7CStHOq1+AhujRDHc3Tf8Zt0gA+ULGhGvsS70To4ZufcDTXQb/6ba4
	leXQtkSZ5QJFkayyrj25MNFosx5+FGlr37FpAsTIBVHqMmiz5VNAa3K/46vDJ3rx/j6w==
X-Received: by 2002:a05:7022:fb04:b0:12d:c730:c7f with SMTP id a92af1059eb24-13806730be5mr6327036c88.33.1780837756064;
        Sun, 07 Jun 2026 06:09:16 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm11820906c88.9.2026.06.07.06.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:09:15 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com
Cc: hao.yao@intel.com,
	jimmy.su@intel.com,
	jason.z.chen@intel.com,
	ribalda@chromium.org,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/2] media: intel: ipu-bridge: cleanup checkpatch warnings
Date: Sun,  7 Jun 2026 13:08:51 +0000
Message-Id: <20260607130853.55980-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64056-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,chromium.org,kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hao.yao@intel.com,m:jimmy.su@intel.com,m:jason.z.chen@intel.com,m:ribalda@chromium.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B48C1650988

This series addresses two checkpatch.pl findings in
drivers/media/pci/intel/ipu-bridge.c.

Patch 1 adds a terminating entry to ivsc_acpi_ids[].
Patch 2 adds a blank line after local variable declarations.

No functional changes intended.

Hungyu Lin (2):
  media: intel: ipu-bridge: add sentinel to ivsc_acpi_ids
  media: intel: ipu-bridge: add blank line after declarations

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1


