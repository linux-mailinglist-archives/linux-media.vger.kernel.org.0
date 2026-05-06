Return-Path: <linux-media+bounces-60665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EXpQOkKH+2lpcQMAu9opvQ
	(envelope-from <linux-media+bounces-60665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 894B44DF47F
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CB10300A32D
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCB24C040B;
	Wed,  6 May 2026 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Ba48O8bS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0A4963D2
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091839; cv=none; b=VL3mxFfSHGtehYQGNVoGvVACH6nFZFMqfifJPc6T651v7Vi8Foqk3SZlLNfsFjj88Uvz7E04zoGCzMt04c0CpTEF6OV7ron9H82gcodm04Q9sp4ji+kSpDwA7MRTesWiOL/4CcNw3eAOiA5WPODv/srAVDTIHwaKLeInNq9SiH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091839; c=relaxed/simple;
	bh=WWYbrbHQhx5jeQI8Ql9kxvr0upL9kFoUXVKHlQYp0K0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZCQFZDrhVwXMTpxACOjE92BrtZT+1uvsTO2ncvrVZ6B2T+24dtQFjlNQjfXpeKGWU6f8kubAqPGhhs4Td+Ye9yGpl3PMulyR8GH0eAHvhSM2hr98723dzDQRcuwCsU7TorXvaNA55+bRkIFSNF16skyxYyZ/XxvmLgpZBp3xbVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Ba48O8bS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso38875e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091836; x=1778696636; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jUf8yjwXtf8aqbMGi+7XwS8YPMaNc77k32cZ84UNsQ=;
        b=Ba48O8bSdzxaDZ6Zz1iJV9mw1h3GENZi1zJDYV473JNCH5rc6OzY1wLkmUOLHXqRRK
         /CiviNU8lPHMFdluq3CluVzntzWDKTdxt0qIWGO7HqoEGOWdnBFBI0feCzp9WbSWrCfG
         7pXkxPMPyf6jkrj8AHchcwwYv29r9tzkVgW4OSO9KIgp52qTpDHX6oGoXerNE5DvsQfD
         gAPKDi1CTVvJUkGgWbuoA0U88iU37ogp3LcG/mOJskV+LL2UeHghptAWLzCIWllVjkV9
         N9g/BrKwrQSjPRltjjPJUs5skMIpE+nOlnIN8z3EQcaYQADnPjv8UMif+PIpJjPetqkP
         F24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091836; x=1778696636;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jUf8yjwXtf8aqbMGi+7XwS8YPMaNc77k32cZ84UNsQ=;
        b=qTFaqUf+X0YsA58JLoBcD2+3fqSW8XuHdJuDg1d8yUx0K7W0QS2rlBiDR+8zqY58uz
         NCylTNXbRKXiVKMF9Il81jp8DjTmQPMh1ZKV2jMi/h2qgQSO54T2mvjfpDabO/HsfcW2
         BNj8N/lwfhEPiZYEHWw8SMNHwArUdQTZC2p+JgkpH7fNEXwa8c45rBG9S2wcq2+4WNgF
         DtBmMq1tprqQTnVobH59EP+c2aou+3jF0ascIi37LaQ3Ppt5V2eCn6mGi35SG252xRzA
         R0yAYvfGAnzG4xChWJ9j8qrwkpIQawJG526s4dEVyL08Y66mnV2r1PGZDSQg5uEyZKIl
         kHNg==
X-Gm-Message-State: AOJu0YytH4PqJfsI/VG1TTguxVQLVKrIDTRWsA2wcsz3ex+9ZzLz+h++
	gBbyQA+0ueb1hLr3F3x8NLIq0ake2H2TvL4etHg5pL543cdzW6zMvsT03+GVeQSTUgyN3mkPuia
	SuuoT
X-Gm-Gg: AeBDievjtXKqlUWKbZwXSWnvtrH2BGAuSRClPrhbCS2hUro9ZBFxtLbQSPrtMNcAhXJ
	awjs5oNzCunxPMVO9E8XWCD0GurDnfnOMDO8uTGBk0mxm8mLnTQl1Hw7UvaLmGLfT74HmyKUeOX
	0v+c7V+qBsoxnq34obpyL9mEjGqXD0pGZna2KFc1NLslIFw9dfMYQZYQ8Iw91x8qxQEYkKCVmtv
	NNBMyZNFBeA2V+zZu6e8xh0gQQFRy7y2FO6H6zZDPLufq/Ng46PXUTcWtwRTEI8S1W0fSe4frzg
	Z1rjsa9rIMo3gJf1YqC6UoZ+rpvCUns+hoeQ3xK1qbGuVTtK+/mPF06WGHWZFtfKvDHn+/pdtKv
	KjLonoATEzE3rNLcTv4JyKqkjRtiLq5wuVo2nZFofGsiX3FOrcrYxPjNtA5C/VvKwZBH20jexMV
	gJDEq7XUyFm52HoZxYXWEhptiC
X-Received: by 2002:a05:600c:6290:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48e51f3faa4mr86536275e9.15.1778091835634;
        Wed, 06 May 2026 11:23:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:23:55 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 00/13] media/imx355: General code cleanups, and adding
 support for 2 lane operation
Date: Wed, 06 May 2026 19:23:38 +0100
Message-Id: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqH+2kC/zXNy27CMBCF4VeJvK4rX8a2iKqq74FY+HJSZmGgc
 UARiHevG9Tlf6T55iEaZkYT4/AQM27c+Hzqod8GkY/x9A3JpbcwynjllJcVhaPkulrnZLRqcgm
 2oETRTy4zJl43bn949Yyfa1eX1ygqWoubOg4fG0qa/jlD9XiXNy213EWEkLJHQP7ilZf3fP/8e
 5Fig8znWnkZB+Noop23BGgfg9U6UDERllJ2KhU3kUOfxeH5/AUKgGIv6wAAAA==
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 894B44DF47F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60665-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:email]

This series came about as we had a customer ask about using imx355,
so I had a look at what was going on.

There was significant duplication between the various mode register lists,
unused parameters around, and no support for advertising the crop
rectangles through get_selection. It also wasn't using V4L2_CCI so
had all the boilerplate for writing registers.
The customer also wanted to run the sensor over only 2 CSI2 data lanes
which required some rework of the clock setup so that the MIPI link
frequency could be run at 445MHz instead of the 360MHz used for 4 lane
mode.

The first 11 patches are cleanups which should be fairly uncontroversial.
Patch 12 converts to use V4L2_CCI.
Finally patch 13 adds 2 lane support.

The series is based on sailus/next, with David Heidelberg's patch for
24MHz clock support added as that also suited my module.
(Linked in the dependencies).

---
Dave Stevenson (13):
      media: imx355: Remove duplicated registers from the mode tables
      media: imx355: Remove setting FRM_LENGTH_LINES in the mode regs
      media: imx355: Programmatically set the crop parameters for each mode
      media: imx355: Remove the duplication between width/height and x/y_out_size
      media: imx355: Set register LINE_LENGTH_PCK programmatically
      media: imx355: Set binning mode registers programmatically
      media: imx355: Remove link_freq_index from each mode as ununsed
      media: imx355: pixel_rate never changes, so don't recompute
      media: imx355: Remove redundant fll_min, and implement fixed offset
      media: imx355: Add support for get_selection
      media: imx355: Use pm_runtime autosuspend_delay
      media: imx355: Convert to new CCI register access helpers
      media: imx355: Support 2 lane readout.

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/imx355.c | 1317 ++++++++++++++------------------------------
 2 files changed, 428 insertions(+), 890 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-media-imx355-a30f5be3deda
prerequisite-message-id: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz>
prerequisite-patch-id: dd4b6c74431239b3fc0f609dda439d1812a7b01e

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


