Return-Path: <linux-media+bounces-61028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDv1OlGxAGrALgEAu9opvQ
	(envelope-from <linux-media+bounces-61028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:24:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188F505186
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7222D3003634
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 16:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B833ACF0A;
	Sun, 10 May 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEEAF52M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E426CE32
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778430286; cv=none; b=m38NHNOCjVi1RfNIL0AjWlwjp90aYt8bpltK9noA8yK9DJr8JZ8xb6TLAbZy0tpqDmDW1A2p9bk9V9tVeohf2kUGBQfiUqkmLwwm2lMRoMO0l0OfEN5FhH6i3Io5FkoHvE2dnoh9bV/3HYMwfMrukqjVoOiugvmACMiPB+RGRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778430286; c=relaxed/simple;
	bh=fsGUXV+mAB3jSft96bKdWpIJb403tlXfcf3EcQmZy8I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rgbIvmF/AY/VE/9IPOVdE/SWvAVsI5C3FYM2CVcqONTuWE7MHmJ6pzknKm/sm0r6KqiVar7QQCbaCoMqxZrrlWQIb+CkdKNkR4L3t+tDK+9SOgpWAvawxrcxLGg5t7JfWvWDu7kAsJk2iP7mByg5RjxIKHimm0XEbwt2NSH/+Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEEAF52M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba17c8cfacso36056435ad.2
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778430284; x=1779035084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umI6ciE7tdldCwC4Ndad+TxpHoumuz8CiXREaah/m3Y=;
        b=sEEAF52MUbX91JaQVgnwTqegFLm0XyDVgcIbveFqFAOCC77MAuJuHSoL93x73Gz++U
         VXYXqu7Q4OYAVnnCcJYr1HqXqcnE425iI77cu84Lg8GrfHmaFQAFSUqccSW5nvksuhij
         LmnoQcf0jY9d1tHJdO4V2FnLoVGfN/2y6zWhsxNvRK/uGdOM5b3Xh3glpYBTbjEZZ7Hh
         lNz2QbocfMFwS2CPe96LRXIAh5C+3JN8XD2/lbHySxzPbkGZGEHXpDzILN6Ms/FiMxwJ
         XviOShqSUCEmHWYRONThktBOkq5Rpm7W9QrcVRvZtUacDey/jAbUM/gEKX2hPKMua4iH
         CRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778430284; x=1779035084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umI6ciE7tdldCwC4Ndad+TxpHoumuz8CiXREaah/m3Y=;
        b=hIGG/UDwhBNefspgPGg05bTOlkqurRv/iDTFFaIaNtFuOqOmgn15qBV+Q94efLGBcH
         QO1+AUsGkd/HFuNU3n5Fo2+kQKqM0MhBS2FNebLPcXCNAZX0NLhV/vP9r7QXuXXfrPLL
         UIVS/Uy/gSCJQa6pjbLJAT9oSbGYtUOLYYqPYhQKfZe6VL32SZihdGdPYikVEJdgCRyF
         yuR6EgWMjQwfSaIKI6sJJefhrj9z+92eEc+ySgyuqBTmx4XHvUz94LCE4igwX74FIz6p
         tHn0YpQ1R3PzKiowF5CrmO7HR06biB36r8zTHChhXr8cZ0z0Ie44e39Hz0Vv4XX/05f6
         HXgQ==
X-Gm-Message-State: AOJu0YxU/d3jZ8IhJJgzZW3H8cSWyOpDgeA7l68I4Uj98rSyMTHA30Ei
	ezEM5/eL7c2pmgwN/cccrnEdMaVrj0MThbecXYUoJFLc7IhForxijg9vcJ2WP99DafA=
X-Gm-Gg: Acq92OHdcZMeGIywvEvMVfYFiMWY0tYoG0ecCNd788CYX3uzJ8KTvDadG7mbuv9GA02
	V/LqyaERlCt4DUVvWVLjizhCQFGSNzF8mDoTfcLYJJgopMnvgj9OkvAWD+eNzH7DiZuT7e1/wqZ
	NCef1l1jr/cSNCw1dN9p53pHQQVyZ5ipITKyHDKZt0sVYYrr2R6G39v/Zuk47ALkewVguFHFTkh
	912MdD95dQDq2ZHTrS9y4MCQtdrc5nnI3x9GprzZTVj1fFCMYMrbL9Ki/evj0FGyooNIsgUvuy6
	bpSJlJqs+CZcf+JpJiOCAjrDTbSqrxCfpCn3fl8dbZ3kxT5esmFZvPjBa/gBD43NJE72cbAA+IF
	nnp2s4500kgtSvJ+2bV2pdxgUrE+HTRfIDRZ8fzZqfrZgi5h8HQ4QMuVBFwsUJ8XlMXoVQzITEY
	jRVnnPhAd4Rg8JgcRI4iOD4RRkH4OTCand11lXYl1UX2hNgDALC/HMk5ltKXeRBcsCrgJmfJvsj
	ak=
X-Received: by 2002:a17:902:cf43:b0:2b9:a5be:d2f6 with SMTP id d9443c01a7336-2ba78a6691fmr214177865ad.0.1778430284213;
        Sun, 10 May 2026 09:24:44 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([203.194.96.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27062sm78645385ad.3.2026.05.10.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 09:24:43 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
Date: Sun, 10 May 2026 16:24:35 +0000
Message-Id: <20260510162435.67048-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8188F505186
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61028-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mokshpanicker7@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..9908675c355e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
 	int wo = (rbuf == NULL || rlen == 0); /* write-only */
 	int ret;
 
+	if (!d)
+		return -ENODEV;
+
 	if (1 + wlen > MXL_MAX_XFER_SIZE) {
 		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
 		return -EOPNOTSUPP;
-- 
2.34.1


