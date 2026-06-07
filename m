Return-Path: <linux-media+bounces-64100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id smtyEM/+JWooQQIAu9opvQ
	(envelope-from <linux-media+bounces-64100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 01:29:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D55C651E4D
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 01:29:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Rk9GHdUU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64100-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64100-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64B9F301412F
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 23:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F02B330D25;
	Sun,  7 Jun 2026 23:29:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF8533064D
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 23:29:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780874945; cv=none; b=XNbwz65rSkwZ/MIo/xJ/WsiSehkaGA9MN1c+x770wpNE8FrCjAwgt6iOHFeU+TFTUiyWIfpvPYtVzSQP+A9LchXrmjeIp4hrZRKsPoy/VTYN1kSSSGdL4knzXMPEMzF7ee2e581SS28+DyckjDNFjOW2djxqPFKIVI385NN3yVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780874945; c=relaxed/simple;
	bh=bcLbpvh35Ug9cLoP9FNoisK3956FK0lPUQR16fEM3dg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CX7f7MnsD/lOFuqSzDrY/sN6xjhxscxDkX0EgE0lFn6LWiHkD7CidOMQkmJ+qC9F/Rkau93Kw5gUDDMQ0yc1zwaC8qVROjkR2ptnXo48trX8HU6091zSsGfkRDUbxVZuKY0qOg8thl8URLVhW26u1+sQ/TpM3a3+0jeXL3DNZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rk9GHdUU; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-13827115452so484448c88.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 16:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780874943; x=1781479743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGu68kDoYED8aVSZ8nZzLLS+mDycRoLfcSk1lpl/0Kw=;
        b=Rk9GHdUUOSUW5dpe5KZe/6gXTB7dKUEQsj46D9K77Tds+PF1ZeG7YVk17B3XSyK73a
         KbkKvTySh3/Q/t7GNTCZA/POSbHudvGONobn8ot6TP7qgJqxgiylcuXvzNaeUrN0yKrH
         VfNffsYzrsyo/v6xDxXVmv61FWfJtia32wTgK+7TmhDFRXn/kKaRl968voDpSdXvKnVK
         F+tbO6/CGdj/cFtjF1WBLtk1kQnEI6TA/67OMvQvPySd3P5F5Qit7sv2PlrZmHA1H2vu
         PrasWGTRw3aklXg6ovsCbBgAH08yoVjEYCIlM072UpYrxlicyGLak5sUrFJGck66y2PM
         GG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780874943; x=1781479743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGu68kDoYED8aVSZ8nZzLLS+mDycRoLfcSk1lpl/0Kw=;
        b=hTfQDtv9ykJHNLBQu80MYiftglHV1R63N8MU0O0Ukfptl7CbRWSKcRshMi/uL6l7U1
         mmwCJHVGpyD4w9q7NcMOqmuyeKv0jAOftbCrC4pnMfOnHsyXMRvGFzjT7UFUBEjfcA8Q
         Jbjc9Ichft36B1ewMtPSsQNqr3z+n+7M0QnWYDoNRtX+cR/AGv+6jFZDkkIbhiKWq7sU
         7IByXiTXDmf8/3ZOvlVhVCR8XDeXHu1C+HvAw/PGIviOM66RR5tea3dIjjoGRhy/YxGc
         DWPIv7xlSbmJkZjNygwkp+e8mEEF2N5LmwtnBUTinj5PCJudj0c8U4mhUFw83Zupgel9
         1GHg==
X-Gm-Message-State: AOJu0YxJLnY61bQqPTwLOPHURKme92SElp2JhZo8t0kNtKprZ0kr+mN0
	/ikEP6IceFCgqQxAXJjTmhXIx0oHpdB6s3a8ice5tbzsaM3e090hR8PSwUPT5i9y
X-Gm-Gg: Acq92OEPJHZpVV0Wik4lQ8xDBWr3VApCwQnKSKZcxzQ5MguDQGxLTg63lskVEVUasii
	Siut87eI9xJiK+mxnhBdXjhzbuQ1UcQ3eMUzlZJ/mDNxC+aayoXpjU2JkJohJP25FByLBmMxZIg
	YRXaTaG1L1HRm+U+j6t/hfCRAC6gaHOQMbM+tl3TlFERxNY6WdT3YOEcHWMuw2hm9extFPyAoio
	K5nT5TpCFtJQH8K4VTOrSQnJ7BtXzinMoWt6r/Bsfn+4ZZgQ7ZgIWBm/y7Id1JEIoT1+dHZNrN9
	YOs9XN+TwoxGycsTIwn/w5aCONCtfBSi9696s5BfoF2fP+hPcBoum1Cw9/9/HBmKHQucH//Fwda
	wvjSOiJASgcXIPoazzOk0vvA1Bn9llI1Qnvql4i3jQkz5VNBVtoFTeOd6hHI+jNuKhltMKXrUXn
	HZRczhEBTmvXVm+kg4hV3WMjrrqS/FLv+Ns8ZLDopAYFeMLAMyJrJAupHlPkN+BAs8lQ==
X-Received: by 2002:a05:7022:671e:b0:12d:de3f:d843 with SMTP id a92af1059eb24-1380674bb87mr6197575c88.38.1780874942978;
        Sun, 07 Jun 2026 16:29:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm11324554c88.11.2026.06.07.16.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:29:02 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vikash.garodia@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 0/2] media: qcom: iris: fix runtime PM reference handling
Date: Sun,  7 Jun 2026 23:28:39 +0000
Message-Id: <20260607232841.79275-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64100-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D55C651E4D

This series fixes runtime PM reference handling issues in the Qualcomm
Iris driver.

Changes since v3:
- Patch 1:
  - Added Dmitry Baryshkov's Reviewed-by tag.
- Patch 2:
  - Reworked the OPP vote rollback path to use a standard goto-based
    error handling flow as suggested during review.

Patch 1 replaces pm_runtime_get_sync() with
pm_runtime_resume_and_get() and ensures runtime PM references remain
balanced during power domain enable and disable sequences.

Patch 2 rolls back the maximum OPP vote when
pm_runtime_resume_and_get() fails, preventing stale performance state
votes from remaining active on error paths.

Hungyu Lin (2):
  media: qcom: iris: fix runtime PM reference leaks
  media: qcom: iris: rollback OPP vote on PM resume failure

 drivers/media/platform/qcom/iris/iris_resources.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.34.1


