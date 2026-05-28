Return-Path: <linux-media+bounces-62939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH1bBTXnF2rBUwgAu9opvQ
	(envelope-from <linux-media+bounces-62939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:56:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A605ED703
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 689473132237
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 06:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB90344DBB;
	Thu, 28 May 2026 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oWQi2eja"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67967343D8A
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951347; cv=none; b=JpWOMqhCc6TGndSuUehjbdXae/6fJTyEBfB7WqwBtr8XCcGPyoCUKADcftkmHx1+3aLLV0WbW2SXEmKh7jwd4BSo1PeYPC61Ky1iCJl3wW4KaCvCY3YbijrrD+dZG1CUdQ4r99890E8WlN1qRfA+OxlqP6OIykz9XYDFnQ5IvF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951347; c=relaxed/simple;
	bh=RqZu+1BFuFMWuaExrCGfPQ0raemrJeX4QwS+Rwtn5rM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ghmIsWnWwocl2e4z7mj7c4zX0f5evI5Feywy70ustOmzMsVtsAbUG9qSdPJizf+Np330ZkuWcbRTNwd3y6vKScp1rZIVLNeju4G2UDvsiNj3yXgEXbs+rBAk9bfI11wU9EyTPK/6eBopdZJPk/PABQRF0p9XbDN5K9FtqoTI2ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oWQi2eja; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8e33556c0so15406282e87.0
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779951343; x=1780556143; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cftDlqlOyWsj1bFI0kJbyKkSFktLYQLvL2R4O7tSFPc=;
        b=oWQi2ejacCk2gSs8jJxKJLSOKLcQ6T+HewFgFw6FHUqspHengv3HIemaSk2M9Z/DOz
         L7XNBw5DNAAdEp2zgm/Xf8bnx390DJYMdEXxeXTzRptlvzhrnFHEZ+ToXmoznoUQydfo
         cK9gdpjm+ITCnK0DttEMjms7V/HbDLq7NKp8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951343; x=1780556143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cftDlqlOyWsj1bFI0kJbyKkSFktLYQLvL2R4O7tSFPc=;
        b=S26A9OCn6txi6g82kVbIMu0yLANj34UuMeUFJ/VF5Qiy1CG8x7OkXui40X8JXNECKZ
         GQF1pi32RWqwKz/myQk3eM/k2DbU24exL+C5jKGNilgxw2/uRScOgtNu/61OY9mLvLC6
         lgcLqsSfU5Ls1tRyxtf0V+L4ltKwzNmKnpOIEYajdthJpun9kOow5Tkw8EAzpCveL3p/
         X/GmcjsQdzFMoWcH94RI2WDjM2naRVsHI48hvPsRD1jcf4c3KaJ8ZfxPNJgKOcRaZW90
         EeLvbnUWfmblBcZIBPoKR99eMJ9M6mID+MeMbzIdimNI5TxNSN1j86pgDq4E2J8wqrrY
         JHwQ==
X-Gm-Message-State: AOJu0YxSpb2sBH4yjg0Kett/pwXkCysJ7fqCFGM93uEwDegLGtq3k7W+
	2LpbxD+dPkb8ErO2uI6EhkSA/r7Syo3ihrYanfmjKgIpIKgIBLn5jCZA6RJ9fOQvGA/wONiAgaa
	Um+cpnA==
X-Gm-Gg: Acq92OFW6gxfcgqXGyrGVhZ4as0j94eJEWmB9PielCcD1V53kSC0NTYYRV/awtHy2XS
	XRiYtLJ/E//BkzDQdaqraEhMHuTTVmotw4xWDM6TCQRr9IbQrSyTJdBVMAfcCo9jkncPhDKpOhg
	idPqsplvNj67blbxFvXvKD+F/HVYvGcyHYiLnjUFGAgWRfs65s8saeRn3OxPrLiYQxTxMTRlSNH
	21ZxJvh20sOnskXVaG3Gc+FiPsIajq0PCwABl40Fl/uunYTKkYbmNECeVjWrPP+/tSJI2sBf1ae
	J0liSrkCarpHPD13eR6H7ukkyWSOnYZwBFnDVC2bn0MfrhkSTfjwWDkhaJYlEnji2iuV/7TsKg3
	v23H2Fm/BJOS0vITHzw82bmWludwSE1SsntNrmxB/z8bdsLDz4ecbhOWHe/DFDu+eWYp7vvuMzv
	XhQHsivvW5WtPP70aWjDJTXED2hYeCzNMEewDFS/69bpgN9oWMbrFNmIrogwmWJRbc2biHNhm2a
	k1QGZwix5UT
X-Received: by 2002:a05:6512:ac7:b0:5a4:a85:ba3b with SMTP id 2adb3069b0e04-5aa52de8d7amr120684e87.19.1779951342592;
        Wed, 27 May 2026 23:55:42 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462d995dsm1695812e87.25.2026.05.27.23.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:55:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 May 2026 06:55:39 +0000
Subject: [PATCH] media: Documentation: Add myself as maintainer for
 media-ci
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-media-ci-v1-1-d88775819d2a@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOrmF2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyML3dzUlMxE3eRMXVNLAwsLUxMLY8u0JCWg8oKi1LTMCrBR0bG1tQC
 3lKI8WgAAAA==
X-Change-ID: 20260528-media-ci-5908854839fb
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62939-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,chromium.org:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: 69A605ED703
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add myself as maintainer of media-ci.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/driver-api/media/maintainer-entry-profile.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index c5c00c66d85c..99655ce4e4a3 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -432,6 +432,10 @@ The Media Driver Maintainers responsible for specific areas are:
 
     - Qualcomm drivers
 
+  - Ricardo Ribalda <ricardo.ribalda@chromium.org>
+
+    - Media-CI
+
 Submit Checklist Addendum
 -------------------------
 

---
base-commit: a96fcde9fa9a6696991d1f172a8bc2bade82a6d9
change-id: 20260528-media-ci-5908854839fb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


