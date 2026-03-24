Return-Path: <linux-media+bounces-56907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPQpNfLawmm0mwQAu9opvQ
	(envelope-from <linux-media+bounces-56907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:41:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B331AFB9
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C96D8301C3F8
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1DD3A3E8B;
	Tue, 24 Mar 2026 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lJQ3oAM/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78869313E01
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 18:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377461; cv=none; b=hP0d9if/x5Vg0tcel8KB7D7xlkXCLDDVWFTSYVL/NEHiV1NPM5cgqMoETZQIiuzEB+a0rZ05Gg+Og6RPwUP14emgChjw5+6codJ9l9kRB9avhumboa0mOpq23P0V0lThk6F5adzwYV480ujMkUuJsBf8j9ekVSoQ2vhsVdLQR1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377461; c=relaxed/simple;
	bh=tOenBi5iZxS8u3X9NW+AM5s63JiSjH8izbSEO7nTmig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n4nOqcj15gumdPqVEvKFm6nA3vTGWy1huwPRYuBNIwdmBtVwi8LgZu+1MDwxaK0c0rpShuloFgq/9AJG/PS1zQFSubCxu+o8CF6kNb864eHySll/LiepDzfZwaxgARVgg9B4SXPb8zFTUOoJ4Uv0BQF27PRd50lWwSmLIp2kgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lJQ3oAM/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a9296b3926so13176345ad.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774377460; x=1774982260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpKwEFLQ8xnnLCC/3EUNObgw3xg06fo1zYVtkHfvda0=;
        b=lJQ3oAM/iegRUJHSl2h5YR17AvGzglGtEsn5zUUxnsEmW6eHo83E1r6MYrkWrYxPvC
         bAEF3KixCflxPysyy89umfEyd9UCOAwBJSdoATzYGos3QkbVQ02IZbobw84bjcgMhVPK
         Ml+jVc61NSx4NConxz3OS2sCQlETAdHJ3loXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377460; x=1774982260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpKwEFLQ8xnnLCC/3EUNObgw3xg06fo1zYVtkHfvda0=;
        b=K92H+ZKlg1CXw/Dz+fjtQEnd3iDgkRN0YJD9p+O+8qRIi+argJQ8kkoKMeCu7GdvGD
         QWVwnxlTY/1+ouiY3BYEJVjuZjqO2AI6bP7xVCuLX6UjVDgACSqYMXxPBfHC7cjRsTAD
         Q/dbp5nKrjmiJFfH9ECnF6asjZNwj0yt/+OSLJB3jScTAzTYzHAuJ6a+akfX3AwLuONh
         F7tmU/n6JU3fYCi2FaLt6gOH6hGxmCpvfcThmGh10CTlBXjXIrtgRQOgwi0rrpvVXJ/T
         lAMlLgn8u/W2wZ96bCPsneagAURlbfum2BZaLQHsh9V4LIR4xIHZV8beqm8KRgMCPvf4
         bg+g==
X-Gm-Message-State: AOJu0YzC032vEVDqGAb5Pdl/29U6VUJ9t1LH/pHkF5e/orXB4PiQzWsP
	Csuc0fXjv9m745qj4nxL94xO6FoTrC5X9G7+p2wntt8p1y0VPsqqePPt2qW+rc1DXxLtFPs0qtb
	5Cu65Gg==
X-Gm-Gg: ATEYQzyd6g0CbK6OmZp0sTmMrBzpGlmAzcYEdGEI3VF+PcVxdJay1/hABMQXEroTvHg
	LWxiWUNeqseqp8Wtxo2gZU3nijojwbcdbF9bp2JiCJgsoYy/7TNLOMVQocRLzcj0TEpiyOneEtE
	bbBNd2oIsMkK9U1DvTScm4+DGXSmnIn+zxgMQJCxsTcaKD4PGtL9cO96VhvDBCB+BNPffNjQz5I
	obexcvTWFO+ki8vNof11XW1genCOGHuhOfFgf7Dwy5WjFRdW4GCk2ERlCzbflpsip0G11v4AN+s
	e1eK4gZRzWmgwb0qr10ZdUl2HJLn9tFkZBH+Px1tt0YF08/6nZ7SVmqRBdOLspywZVWcof7eEMP
	TePMkeXLJJktIZL59ap9gkRDDwLi5CXmyH19xEXfdLFdwRlHMTyeKNtKcrvYekPiq6hY7WAXRSj
	ItWyXHuyXtQJhYZ1fHHS+OyTGBwAWfg+Ea8T0PYm3FIF9AHLY4x37UQSEGsqkPAGwEqsIXgWw2D
	FpCqA==
X-Received: by 2002:a17:903:234d:b0:2b0:6d2d:f1d7 with SMTP id d9443c01a7336-2b0b0b46136mr6427895ad.48.1774377459706;
        Tue, 24 Mar 2026 11:37:39 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:48d8:ec43:a5e2:eb56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b9aesm199252045ad.58.2026.03.24.11.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:37:39 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
X-Google-Original-From: Fritz Koenig <frkoenig@google.com>
Date: Tue, 24 Mar 2026 11:37:33 -0700
Subject: [PATCH] Documentation: media: Fix v4l2_vp9_segmentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-v4l2-doc-fix-v1-1-1b4773c391df@google.com>
X-B4-Tracking: v=1; b=H4sIAOzZwmkC/x2MQQqAIBAAvxJ7bsFW2UNfiQ6hay2EhUIE4t+Tj
 jMwU6FIVikwDxWyPFr0Sh2mcQB/bGkX1NAZyBAbSw4fdxKGy2PUF5kDTzZa2ihAT+4sXf+7ZW3
 tA8pGKOJeAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@google.com>
X-Mailer: b4 0.15-dev-37811
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56907-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frkoenig@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: 3F9B331AFB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

feature_data is defined as __s16 in the header.

Signed-off-by: Fritz Koenig <frkoenig@google.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 3b1e05c6eb13..d7a3b8ef03a7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1877,7 +1877,7 @@ params syntax' of the :ref:`vp9` specification for more details.
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - __u8
+    * - __s16
       - ``feature_data[8][4]``
       - Data attached to each feature. Data entry is only valid if the feature
         is enabled. The array shall be indexed with segment number as the first dimension

---
base-commit: e3c33bc767b5512dbfec643a02abf58ce608f3b2
change-id: 20260324-v4l2-doc-fix-66d613f32a2d

Best regards,
-- 
Fritz Koenig <frkoenig@google.com>


