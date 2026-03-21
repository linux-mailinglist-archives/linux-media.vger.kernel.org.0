Return-Path: <linux-media+bounces-56596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNemG76ZvmlPUAMAu9opvQ
	(envelope-from <linux-media+bounces-56596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:14:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C80672E572D
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6618F30214E4
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F36379EDE;
	Sat, 21 Mar 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXT6LFlc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87E375F94
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098785; cv=none; b=N7FyAlQ/d6/oyHsDBpuzqK31vHPowTZOZnnnfeckxWDaDTJuXpU9Z0rZZ/QE9sOGevwIlM+FClzYWX9wflt6O75Ne0M3zeCjZXXlLoBsQIIZhjl7htKaSN8iS9cP3lYeXlOIIRTX5btjVVwXCwqg/0OKZKaGRYC0X5LdDGcRqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098785; c=relaxed/simple;
	bh=bvVr3J0rF8noNXY5bVymWnJJnbSqhvo10T2YAL6n3Os=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SjrXqEiT1yxO4G1BPryRT8zGqPjhSmnZ7rNI7cD1nn0r+GdxAOv8SlQ9/fvwj4gefcDDj7r+eJQfHzC4IjbGfISQ7jFqcwktrAqTiGgBy+qKXz0GcZut/atpJ/0JLl5SFVxAqOdRnRvRqcd0QhoYn3ORq32w6wpSFmZ1dHCuSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXT6LFlc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296d553142so1276897b3a.3
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774098783; x=1774703583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61iuSm+QYiN4Ck/ITYe3NT6Sur9AUMuyY9A5Gs0l5qY=;
        b=KXT6LFlc3mcBrlZqEZVOqbEjbsG82+iZ7qlnAuxhUk684HL5v01hb2rG5jLsDUKYAx
         kWiKw8tcsekEAGU6K++Alhbb8d7Y0Vgv+FqZFGINbDdZpRRUBYplOX7lAb1qMD9cIRSl
         +F7yW1QPGqOZvrg04ZO+JmQ0I+nK/Kb0AMUJVjCnOE10OO0fVpMJu1gxrsHyD6MaZAj4
         RAHLSmIVMzP7FuT6hJxO6XD3KyKE5xDRDECqNFNjmWRy6fq5Qw0uxyfmwLsfF89ZbURJ
         EWjuevmfLxUcer6EPb8ldIkgWNMt/7r95VjFKBu38L5sxjuK24bybJVpUk733nhruNaj
         8JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774098783; x=1774703583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61iuSm+QYiN4Ck/ITYe3NT6Sur9AUMuyY9A5Gs0l5qY=;
        b=Q48qQCJQS6selku7XweIDfQnVIP5Hx3CTqV8Us0zNmP0l3xln95W5ogKyljOwqxTfj
         7eC1aTbGKjYDuWqklDkyTHuSfPQpLq8ZVKPQ8RWLcEprRW49SHwH9jxbGNy4XrwzkEZE
         39/IhwmCWtNBQfEe1sYYynAm1Mvw1k3K5Hto8fUZ+q2W0jxjTIzJg12zlJ0FXJq3a13N
         1BXyqffvNk49c/nB4SmmjO/sSJeKUMkV6r0J5sPVZ9koQk8qcPTzLfUuNR74aXC0WHbq
         VnBVbMvLbDV+YFrIu5CDij6Snm3ejoNp9PPjhyMvv4zBkhrKkBwKTY9ChDebU//9C2qi
         CC8Q==
X-Gm-Message-State: AOJu0Yz4O1f+W/JFb4Ao+coo9UI7gwi2ZX8oStgP8o3Fl44jtx74xCqG
	mB2UJ9Xs2poGc3GPfAX8FTJanKO4k6cAfhZAwEj8WSwevY1Hd6wuhG+i
X-Gm-Gg: ATEYQzzJwvWrma4Tc+97GKyN6pjFZgqmWRUzlg6cJJr0sj0ZoBVyqMm6InOEVVMWNTV
	JY9m1m5Dq2TYme/BoJpReBH1SgBJdSNfBPD5GXsylSE1b9hyTNXtOXSffgtWznLq3J6JfHRSUpB
	zzLcdiVLYzQ4PJqYtx2+OcIOUPiJ9CkFCY7MnDZSEoVUJTpjWgaXNAHwGrUqK2dhq66oEZ3XbwO
	mInyk2XBI5GchDHD/hJrCeS6Z9SV15YdFhh6oOiFHcGkUqnNeF1TF49i1QdusTlSDRxd7EcV2+D
	zUW13cLhb9lJD+diOq4pbndOo9piB+ZIcZHzNV6/gardyMf2vDB03JGcU4BNKz+kvHTOgAvq0rF
	n57cxdgcRaYirascVj6XPybz8InxMkcZ+yhU4WzWHs/kVFc6Xk6AeIbSZHlytAGcmTrV1xPVOh3
	SI03hHzAJPqx305SARWMCx0DPlJ9B/E5snCL8U
X-Received: by 2002:a05:6a00:9a6:b0:81f:1a4b:bf50 with SMTP id d2e1a72fcca58-82a8c35caa2mr5329850b3a.36.1774098783007;
        Sat, 21 Mar 2026 06:13:03 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040db767sm5000809b3a.51.2026.03.21.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:13:02 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/3] media: ti: vpe: three small fixes
Date: Sat, 21 Mar 2026 21:12:53 +0800
Message-Id: <20260321-vip-v2-0-d502c1954817@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWZvmkC/zWMywqDMBBFf0Vm3ZRJxFS76n8UF2keOlCNJCVUJ
 P9uGujyXO45B0QbyEa4NwcEmyiSXwuISwN6VutkGZnCIFBIbPmNJdqYEk4iH1pE2UF5bsE6+tb
 Kcyw8U/z4sNdo4r/17/fVT5wh65zR5mWQ92J4TIui91X7Bcac8wk+l2BVlgAAAA==
X-Change-ID: 20260317-vip-a2f601930065
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774098779; l=755;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=bvVr3J0rF8noNXY5bVymWnJJnbSqhvo10T2YAL6n3Os=;
 b=I1Pgg9dm1VJQn7MhKLe4xKMcIVJeoKlAXD2fja3ZPf64LITWE/g4Asyd2EpH02c39vhyVmTFB
 Wv+sJQwrLtfDV0HZSEbsQKjOeqpALlhWN+0EVd+IKYxbPrtaFFQFpR2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56596-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C80672E572D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260318-vip-v1-0-5fdcdbd01829@gmail.com

---
Felix Gu (3):
      media: ti: vpe: Fix fwnode_handle leak in vip_probe_complete()
      media: ti: vpe: Fix the error code of devm_request_irq()
      media: ti: vpe: Fix the error code of devm_kzalloc() in vip_probe_slice()

 drivers/media/platform/ti/vpe/vip.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-vip-a2f601930065

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


