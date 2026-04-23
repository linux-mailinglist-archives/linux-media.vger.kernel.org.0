Return-Path: <linux-media+bounces-59436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DybFF5p6mkHzAIAu9opvQ
	(envelope-from <linux-media+bounces-59436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:47:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C234A45634E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DF9C3066587
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 18:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819023314AE;
	Thu, 23 Apr 2026 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2wkh8iD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D8F3033EA
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969991; cv=none; b=lDVDiryClxZ4Tggz/fsyqlSeSp9trPBMJ1TDuwSxyBN+P0nhoc1EA7mlNv+zUsOkqU9onKOnDGmfpA8ZVjHPlxz5VgJCC6+v1k7GvdpWuw3vgAj8z+9ML1B+hE67rOFtXoga0npsfCC10R4QHHkf86miPy/eyd9LqNOnB4+GXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969991; c=relaxed/simple;
	bh=9IR4+4EDnDetYQMuyX9RSNoUjCQYzsHRBqQ8suJAq6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTJRG2sW59jiIc7JdFzDN8pNZpMzqZpcFkC6pPv/BTPGdyjvUlOAUp/t3bUzyWZjgt8lY3nsYWnVSakMz00RSDF5DR3aGRcv3KjbeHiYEnDFQm9XXsGoLSURwiF0F7UYBj7Ck90qlGh8ybGrdNDzvQ50Bw+wFab0IX3BZLp3OiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2wkh8iD; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7438040eec.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776969987; x=1777574787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gPwpAzGh6rmB6p9OxlKkTq6YhtQvVULhJFEbExzc0g=;
        b=J2wkh8iDPtgmKDcnQzh2XuzSUWRigZzLFGFEW4CZRj1A3l17NAJGalY2bFSzQSRc9H
         R61CUNyc8xrxXlfeI+LCKXvuubASpECs2/TeFksk0HSktCxHsLgmHGu+HrShc+KupQem
         Fd3xixaFs41RZ6fnlZ+0+18eq4opU9s+nL4tgm7qbrNBbrk6fOnK/A2L1uxFwxIT+YZG
         qYpT6DDGdnHZRAdYdR30jYCD1IMdLl1eO6vQKG/rlIg/n1Hia+ieuPSj9ztuUhgIduyF
         iy6TKjMCCfSzjz5j1fMDePNckzdvz+qV6pYb/atqbgqlTXpR3n9JtMJzUM5AY6iCeaF7
         iQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969987; x=1777574787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gPwpAzGh6rmB6p9OxlKkTq6YhtQvVULhJFEbExzc0g=;
        b=gbu4ErDriRPSs0gNP6BcWB2gewvI2uWRdRq6otgZLeC5KSPxzn3/58Yhn345IeymFh
         Gqp4Ma4xb6bcMCQJLJWVV81mMaK1g1Kt6ZcWVPoCOcLuJLvhbWicNHn8DlJi/ksYtMad
         cvcWX8v4Ne+Kq+9lFACgQoKm+0lhV9KjIzvn0MuQhmr/LeYP4ckuQSIDvEJJWt37Fz12
         7v7EPotODKkdKoam7VplISgymIECRQEDPoBbxpLAijAXxx0h2zf0+RA0UFQ+Z4hKBDNX
         MwZi8YmmzgORkSbFyCGqlxTIHSS5SMjSIp5buLlISdb9kJnUksvdkNHcVHUnQTINOhgH
         qLcA==
X-Forwarded-Encrypted: i=1; AFNElJ/Gze246C20n1qRYFB5dnNRpb3kp3L52BxRb2ky8IoR4iOoMWl9HTrOHwLdsCA0IuUqwosT66/tXQTWkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9UpWtLgKX0OdBl/zhBNpXCi6AXsG/M31V3Xnjn9rR4ZnXjgh0
	uCx7BRJqdrs9/zYIToZj6d9CLo9a5CqxSYWwYGLRvPnJA56uiUdfVAQr
X-Gm-Gg: AeBDiesl6rLWUuALGQoeoJmDurKJ6ZDAICCWt7gAAT+lDltu8auctOSSMGCYrvtPjPx
	BgT6bDBuJ4HrZY4lUO502OrnbJq6HN7f4oxKEzEvE2o1diI0YP3D93Yiwl9y/ee1fBojk+Hws1u
	oDFXEzLcA83cM7iF3SuSDoLU/bHeFHO8JFWyPHozBvuBGWAqa1RrriziMnifG7KlsG7i7BtPQ1S
	MTIPOWm/NjzO9eB8olUt5X5JyO2VNTcMbsVGPd2d0NpMjNBTyXD/I9U3yjL/rniKRQfjIJfcyOw
	IAOZlx5DEsdXRpKlMlWUt/ry39DkOMbabuCwJMQJXmPCrxi4JFzHY/n/qZYuoJNTzTpeN0nMFeU
	sIrNyl2vRoumX/5d+JAt85tPSv/2luxTcqrUeNmFJpOTVG6r0PAbYibrjbSUtZIBlIdcdOxeyGv
	mEKPz478csa7jMgnKcLwrkbnW2bX3sQ3nfPsRAikKt0gwI4V3l
X-Received: by 2002:a05:7022:4388:b0:12d:b7de:3e12 with SMTP id a92af1059eb24-12db7de4106mr6077122c88.18.1776969986766;
        Thu, 23 Apr 2026 11:46:26 -0700 (PDT)
Received: from PCJohatan.unicamp.br ([143.106.58.255])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c831d5b29sm30369097c88.8.2026.04.23.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:46:26 -0700 (PDT)
From: Johts <johatanrlima@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	regkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Johts <johatanrlima@gmail.com>
Subject: [PATCH] staging: media: atomisp: pci: runtime: debug: src: remove curly braces for single line if
Date: Thu, 23 Apr 2026 15:45:40 -0300
Message-ID: <20260423184543.109954-1-johatanrlima@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.sr.ht,igalia.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-59436-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johatanrlima@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C234A45634E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix checkpath error "WARNING: braces {} are not necessary for single statement blocks" in sh_css_params.c:1931

Signed-off-by: Johts <johatanrlima@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..31426001864e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1928,10 +1928,8 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	params = stream->per_frame_isp_params_configs;
 
 	/* update new ISP params object with the new config */
-	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
-		err1 = -EINVAL;
-	}
-
+	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))	err1 = -EINVAL;
+	
 	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
 
 	if (per_frame_config_created) {
-- 
2.43.0


