Return-Path: <linux-media+bounces-66173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3s/HSXWRGrw1goAu9opvQ
	(envelope-from <linux-media+bounces-66173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:56:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8F6EB562
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:56:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T3jq6oyI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66173-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66173-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 596223017CAA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47943E7BA8;
	Wed,  1 Jul 2026 08:55:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100E3E717C
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:55:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896145; cv=none; b=R86uFaWqblRNggaQDmQyXh/GvoTA+XUzKNOn79rAEJfE9iTleQoI/QqZrHm1n7XT5HpsH2GHBvhVfyKRS8KyAzhtoPj1H1ZzbdrtiKuRzREiry09OHpliuP0Osc0wzwdeNzCr7U7k//MYX1OnZpdaR9dQ5f7AlWTiUhQ1SaYcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896145; c=relaxed/simple;
	bh=faXX874UlTTPY89enPim4EK2NSNqA8OyRAlvkutVWHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bA0QCBR61kJHtQ77NF5wW/x1l37F7blCJDZFYdTY3Ajl7B3KjVeKr85cqG1kmHpktT8t45nTcCgZDfO0dgARC869x3LMFyyJ+cbAgYPfSPCEa/7JKM2ZkGtjp2kEPrxHUFsn6JTcQYltO7bKyhgxn7Vi7hauRjI0Anet6ynCzYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3jq6oyI; arc=none smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso145290eec.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782896142; x=1783500942; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q063S10IteKsFQ8gNDRLWZuphT5IA1a9z22SHQALedE=;
        b=T3jq6oyIw+S1u46O4vVDQayfgMSSBUZyBnXEkBAh3q/0Qhhcw5hZIgjX7gkAb7BKYS
         m6+5zZiVIbsIiChTpsjd132ICtCgtl/pEzmH+j3ZAHRMIUAlW2L7YRbOe6I8ikaLE7AD
         JpmPG5QMiaFCQe0YvWMtkd692FaVXSCIG1/Nc4Nm+gEqHZp1TY1LQ4ZOwDLbpXLHcioo
         lBjNBlLj7HFTdB+F0TQuAi47LLRVqmUDcNLAplMIlY2h1qZLuvEmlpeE9K4hvy84FTV1
         rlcqTMhF7PEvO3dRKIRMmV4o0Ex32iq3ae2mlniZygzS/o9HGJHwv3BtQuwv9B08KzM7
         OjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896142; x=1783500942;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q063S10IteKsFQ8gNDRLWZuphT5IA1a9z22SHQALedE=;
        b=YqIievMtFEehWXjZ/ixHfZxyUpZpeGyldWFqHQgmPAP7y7HDIFUiRYJSx6Qrkc4ynl
         lWPkw4aR8Vxhlxw77QZeHgcCvfylHypOreMQhn/1le5rnHv5tRrGiaH75n4jwsbDzf2n
         g8GXsa1JpA5c1PBWTPE+oLg/0z9rL/JO2262sY4s+oQT2odBND9GeWFHAp5pqJjLfLeH
         MZTdrblqgxznr6bOBYTP1TpJ5/OJu1VNFMw0Orx1Z1yPSpE2Sg3EcRexURqf+rj2DHVK
         AHUR9AGq2SQWpYh9+XF0EW63W8a5e5MjdCaqH9wXzvdMzhgzPxqfqPaDE9DMj8BYcI+H
         R9uA==
X-Forwarded-Encrypted: i=1; AHgh+RqEsBNB+eoLmNmSltn6m1phq0o/vAhNqYVVyyshUMWjzMp3WhEaf2K8mIepGG6DNlloC9itiQWX37cj8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjxEfDZkwYCq2i18I5PBqnOYmIRB5wwvTppgWtlN5YCtTQpsLM
	mA6CJ4tVLBLJ4u3DDRdIgJ7t2MkGoXv3s2CSwkSEEOj21YMD9dlHonhv
X-Gm-Gg: AfdE7clItTmB83XFS4aL7LJLlTow2sRulKsv+g6KyWJLaDKjUABDRdeNz2HRBDAkw72
	42ZtkbG0nikop6gBsnCYFF3fdPS0edOWI34lxScZSCKYRc1s+YoecWJGaH4xe39jQolqThoyM0R
	Q9aPyvDKw+i1zed/4b+5VFyine0/Rixill0ipzlXppXrcunUL8HrCJeW0BqFX2qvhOz58JhTkUT
	JffKv0LU2pfxgg+4FSnL8bQhXcZ9AXuJ1zToRINrkHDS0hQEcvvjkuydOPWA+LxcnBhED2FVmTH
	l38cNfmu00DbH1uxbQ8Dz4cTF3dRL7g4PiQxljR/dg14L3XNn6qdOpv0DNrT2GQHf+XvrR1yFng
	usWcPFPPa8Uvdts8tFk1V5i4+OeFv0FEWo3S9mF3E6nXYcEfwKb6OgUpWXUuJhliAjOI+WUuHqG
	u1xaTGq86FB7h4cyZ0rw==
X-Received: by 2002:a05:7300:cd97:b0:30e:e6d0:e330 with SMTP id 5a478bee46e88-30eff2801afmr880159eec.26.1782896142028;
        Wed, 01 Jul 2026 01:55:42 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:9e52:74ee:cc29:fbb8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm17797876eec.9.2026.07.01.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:55:41 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Wed, 01 Jul 2026 14:25:22 +0530
Message-Id: <20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVpZ9HgKmJROmUkfjJFJOLui
 uW3eO+CSMIUocouEDo48jInmDyDbnBzT4p9MqBGq60p1DAZXaLywgeJcjagc94H1AZSswoFPr9
 f3fyOeztSt70TuO8Hs5Nhk3EAAAA=
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=faXX874UlTTPY89enPim4EK2NSNqA8OyRAlvkutVWHI=;
 b=kA0DAAoBFZWKXhEcBd4ByyZiAGpE1geiffouc10V2eyMMEP/zi7lkqDeraB53BzXpZ3W7qyFl
 okCMwQAAQoAHRYhBL/RC7M0pV+9Q2U0CRWVil4RHAXeBQJqRNYHAAoJEBWVil4RHAXe/sMP/RaJ
 hsBNzPkUCDwcSNR0mGiT3m/doK6kW6L1qItSJwwxJ5pfRW5IBHsT3TIkWdelDXxy8u6xrJ+xRwZ
 h7fJgyn2nNsrzhGX/lN9QiCDMiroLuu24hMRDVpexbhIgTCnwSUaMBR30DFqpVU8S2aBtdnMPre
 GAKB5myRMrqUKWpWucHqB+5uFfeHTMWO5UHs5fTfeIe/lViY2994jdbHOUDwC+Wi0mu/NY3EGM/
 I5ZBCOxKLl4p80QYgpp0V+nWWVhEBowofTlVP5pBLhxZLipOJLRHEKzsZcOQ2yqW1MS9QctbJZm
 8Ew3M1iRYIt7/sPrWc2fiSC7LKvxInFRC4EgMzBka1+eVABR15GwIIc3tldHze6ts+BNDYYZtUZ
 PkrMu/6brphed88txymjb8LkiVK7TuPzlzszxB7cLmutTyoW2u1ImCIBDEv/lqVhQhn7zkN+F43
 yfaoIuWG0rALJ/ZOn8GQGGiA2B6aI7QhXqMrj6PwzojVax0qLPDPRdmNNH+Ut7hvLg/ffDXe4wo
 gCzmKCqJbfOcmQ+rLzeAyjfPM5/ErGSWjdRmoI1E662clnlZd9sLLoTetkNw69J0gH+F0R3Bl3C
 Yq2bhzfgDvi4YN9z74DF/qtl99qfhAgXf8eJz5LHa5kDTKbnEXdLSyh8IrJ+bwqBSktl/AZdqXB
 2w3j6
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66173-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FD8F6EB562

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW at 560x360.

The driver exposes that one native mode, a test pattern control and the
standard fwnode properties (orientation, rotation). It has been tested on
real hardware (an ASUS Zenbook A14): the sensor probes, streams, and the
on-chip test pattern comes through the full CSI-2 pipeline.

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 783 +++++++++++++++++++++
 5 files changed, 909 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>


