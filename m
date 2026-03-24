Return-Path: <linux-media+bounces-56915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLOrEMD8wmlXngQAu9opvQ
	(envelope-from <linux-media+bounces-56915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:06:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF831CAB9
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68CE13091D2D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5268834C12B;
	Tue, 24 Mar 2026 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RfXSx5oA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C03016FB
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386015; cv=none; b=hXVbLTvTu9pRFhurDNcvdB8aDivIhuzqxFYpgi0jI6SxX/5aOOjOmZFhdoljhexTOKWQTV+SNWLEYTAhN3tx/xtEElR14EftsLF6qO3iSIRI947N/+9yRyJdNg18veMrubVvYbmse7PCHW9E/gtwdD7Zie9W2n43g5NjG/NhlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386015; c=relaxed/simple;
	bh=NWSyvIzVIu3S+o85alM9mW3uXcJBy4QyxRFndWYcRP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ByYTbt0iu/LL1Y71tGVfHnMm6JumFyMSlRRpkNnMdNOV8Epy3vj6BoD9MG+r1fvU6+k6nhgo7N7JR+5XL/YFoYbnRgClvEvk6vw7z6IgYb/fOHsWlzRds9Oj1fx8vXw3fxZa2FBRmlayqkScrF4mKLW/+VbaSdQc4hH9gmt2SFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RfXSx5oA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8299f1ca894so3542926b3a.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774386013; x=1774990813; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjv6UafDxZxTibJEm9853MKNfqIO0S44o4unSUtHKeI=;
        b=RfXSx5oAfM3e7s8/Dh1Yv71qV5WHcVOybYuUGKEuHOYJO9GnynYlMbv/i/T57rKYxm
         demBYujfNaBXHLmsvD0X+h12oP12gyApDg+lMb7NaZHhmM155SAwRDIf473XDY+F3+hp
         sFoHQwU3j3UlR9cBDu50u5RVxnEqYQbFaE3vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774386013; x=1774990813;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjv6UafDxZxTibJEm9853MKNfqIO0S44o4unSUtHKeI=;
        b=NBxtK/34sPl37DbI7C+Ma7PN+/4k0w4M1EMB9vGgGXoMEqkx7lP559dmzj+8kV8ozQ
         lTRTQIhOUYS+3Cu0hbMx2jmxt47AkybQ0bHXKv5xuwFi4OeLkZ0rKeUMwnQgODFxZA+D
         OmYanSx7p5WlZMMOUuMQMLfrGujeE9NcmdL6jjS0ryPzRAWIRQGkl/OeH3c8NrKnyJ/2
         lLdQ+Gjbl16KTGvkIDNcfMuPxjzuOy6WJXXIq0z461uodpMBBxJ1YPuSXYItrGrTDiPu
         HR2GFvnuhXpbGfJkjbtHTeNflLLI/XZUi7/V9L208CwDigKQ2cw5UtZmeUe0bsJ4B3GD
         ha1g==
X-Gm-Message-State: AOJu0YwSMpMGD7SqDG2WRQRGuy6R+RD4w+4AlGSsTFVZyTseIwGfASGW
	FQEq7OMgDgwoIg6WJpXgAjQb42AxrEalnwTMLurwiAQzetBk02N/aNe2EuK9Oo3gMQkzrf+mfzE
	OzSs=
X-Gm-Gg: ATEYQzwCLMx6pEtRoTh9Em/Oz1wEPPZ3lXLVoeyQEOPHoKimCdzLpWuF3Z8ycsa6kXR
	fxTYT5qM5JSyHvnwmrMwfRt+uz80ntiNrgBbseOeHdVC5ddRFZyQq0HYnkXWwZ0WIrt7Fn/8IeR
	VS0T7ICANMAvxivWrFzD7tWxTbSQiQRl3Xm+LnRrBzMJdS3tjHUi0eOfMgRxjHcwxfcb3+JotOT
	rKzXL20bhbIlJYbbnA/yAAfeUjaVf9shWqQ6/riV3G/DGFfZouKdJMyy/ofOKMEfIxev7J5Onfs
	2D64QTBHlWE7uPkqUoxsfSs0AHso+onQqRURVlnDBJQUqBHqwOpn9GqOOCRaBReaHRUegDFwtpy
	p2XobS7bX5qCoVQjz4JL9lSCSbE99jgUzfBQCuTH4xGsXWg8e/1flIAT8BCl/lDkxJjg6tXxwfk
	KOJx//RomokS2PftJw458gRxk33qorW0bcI67CWyQHxkqOmOtHn2h4JH+SzgIKx1OGWi1rEmBdP
	Di801h9
X-Received: by 2002:a05:6300:2109:b0:39b:e1e5:a101 with SMTP id adf61e73a8af0-39c4ae06e17mr1126597637.43.1774386012644;
        Tue, 24 Mar 2026 14:00:12 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:48d8:ec43:a5e2:eb56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a80163bsm9976039a12.1.2026.03.24.14.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:00:12 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 24 Mar 2026 14:00:06 -0700
Subject: [PATCH v2] Documentation: media: Fix v4l2_vp9_segmentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-try-2-v2-1-eedbd0d3cec5@chromium.org>
X-B4-Tracking: v=1; b=H4sIAFb7wmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMT3ZKiSl0jXYM0M+OkVFNzC7PUNCWg2oKi1LTMCrA50bG1tQBiJtb
 QVwAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56915-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frkoenig@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: B1EF831CAB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

feature_data is defined as __s16 in the header.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
Changes in v2:
- Correct author/signoff (@google.com -> @chromium.org)
- Link to v1: https://lore.kernel.org/r/20260324-v4l2-doc-fix-v1-1-1b4773c391df@google.com
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
change-id: 20260324-try-2-0f63be5786ef

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


