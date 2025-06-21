Return-Path: <linux-media+bounces-35531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B0FAE29FC
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 17:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08C4416913E
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 15:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E3321C9F5;
	Sat, 21 Jun 2025 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMMEK3l9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FC170805;
	Sat, 21 Jun 2025 15:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750520874; cv=none; b=ndhk9VnNMMq1OZZbg0T6uOMzSOs5dmQNo57E0KGr7gK0U9XedB/RNSxOuG+0RhYm7h1ZlU3poabFZ+kvuD55Gl67dE55NonVllN017seau4/F3lWLIeLH1oK0oDYMghQNfIKFMd4sOLAVNZtqYdkGJwPlnpFAQ7dNEWlBL5zRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750520874; c=relaxed/simple;
	bh=OhJGen9BmoUDhaSg0p06AzqUODWIabM5BgNANGCgIRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OuPgkJ+Crtw7GlOgnWLhcXLRIBodGY57bhK7C0a2Cdcb0Th1SfU0jmIN1LYjfW9HDiOnIZkDOCF5XDh/0NuvHo2nPecGu8d7oLYNb3sgClTNYSDn56IUAjhWt+cmDfcDL4b6f/L0kjEeQ4mP6zXBbKY+mFPYEHXMtiA34NPL6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMMEK3l9; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e75f30452so20615747b3.2;
        Sat, 21 Jun 2025 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750520871; x=1751125671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpGki5Co3f638TWpjKASGjh1tadBeAb2a3w6y9GgK10=;
        b=IMMEK3l9dfUZ7p7eoaZWp9Vg0DzAR3lh3KW0R+ciBc4uy9At6EBLgSV82KK/KXtd+P
         HeF2DCvA/Viynjl+ADAlg1XZlbVFCGUrlpus6m+yHeQ+KhJNBi2epLhuljCgf3JiETGL
         ZX+fIRDKmHdhaJkT1K3vAOB0HpvsVLAjiYAUEk+afKMffhLpzvmBP1wfUqw2sipn+lz2
         yI2FQHM85tz+Cqr82LnGDTYDWW8qw1Z+P64I1CRhuNbWNoAsRF42jnE5HWpthMpKC4EB
         rRVlPAmolLPe8/vS8JmsztfHPhC2hv4+jiEHFgEDPR834f1PaqtTrfXlQhqm2I04w+jC
         xMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750520871; x=1751125671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpGki5Co3f638TWpjKASGjh1tadBeAb2a3w6y9GgK10=;
        b=DLNANx3BAZeJN6xUfclawumIrCIPrpwtJxE+/OyufHXaGjssZkNyxsOxMzKOLqJnLt
         +IuwmL+XmhSQc/DP51pkUgulcHuPdVQgKTQyu45N1Diu/W+SHyj3EgrVtQ295spFrFrD
         l2Qc192IC5xVYLfoecqVK7mF9nFtF5IApQzX2rytRNWfKLGzvWmO9EV6HKnfqlzMtwwy
         SvE+oiRnozx6K5RsRfXJoIPPx1tNn97p/K7la1b8wB+2fYuvMzY3HxTJhj8Rd9TqCgUM
         qyvlrkaSst8AfsGdsRSvDKKBsf0YJreYfnnDqVfT/yvY3gB0MnnSVRz07dNFON01IMWt
         rEYg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2S0ihm03PdmSIWvQrb0jZgeuIlNLQ8gAAIw7JllBw0uNj9JUkilnm3bF4dZX2d5YDIqj1RIe23ipNrc=@vger.kernel.org, AJvYcCXXa6ERvNWy4Ywo50FoXhzZ1uu8VrMzqipSt4JBzLtiEf3VdGNkJi3qr1z8TWnOg16g6tWhWAFaQfbSk+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7mmfDn8kjqRlZX0sLwTGDaarKb/5H35ZV6tBoc4Fs58iSzpL
	creoDeoDgrKWq9iAkP1XTudP196OVSVtoNyFN35kuQ9hD+Xuj+6MH3Mt
X-Gm-Gg: ASbGncsPlC1YGROfnOn36G1wBe9CVT6KfF0bbVgJ9sD8ru9qtI5PN3OuRU0clmgCBDy
	XiHk/H8khHjoEHCw1beu1NDrkBeV8sJQd10Ym6jBvKx/5F74chyByQGxwpa0KzFgJlnpT9Y1vrT
	Wo2g+McyPAbe6fMysyN7nsevY7H5CuW2tXKYUaIwFsr+X2m4AEmmwxTotJphH0opWxtOVd/27Er
	ebX9KgFzBeyaG8ZkRQFC9luZPl293EbJ1TPC6UGLMcKXSXTsG8fV3Ue40Np7oYOf/xJ9DyWs99N
	mMS+EzrdJsIvoecpLfVmh8+zQiDSg/94eLnIEdXAIJfh4Dj/u/A3YhEeTfcNRHiy5VkwPUu9xUu
	m
X-Google-Smtp-Source: AGHT+IFEDy0WG+IfEf4L6ErwkURMaZ5O/oualofAgFC/Dm7kNLF6iEpxzpmPTZGD/+q2JyrWzFrdbQ==
X-Received: by 2002:a05:690c:a9a:b0:70b:6651:b3e2 with SMTP id 00721157ae682-712c63b17f4mr101479707b3.6.1750520871533;
        Sat, 21 Jun 2025 08:47:51 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a162d2sm8617647b3.32.2025.06.21.08.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 08:47:51 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: mchehab@kernel.org
Cc: alexguo1023@gmail.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer
Date: Sat, 21 Jun 2025 11:47:49 -0400
Message-Id: <20250621154749.515315-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msg is controlled by user. If accessing msg.buf without sanity
check, null pointer deref would happen. Although there are some
existing checks on msg.len, they do not cover all buffer access
points. Therefore, we add an additional check on msg.len to
prevent potential crashes.

Similar commit: commit 0ed554fd769a ("media: dvb-usb: az6027:
fix null-ptr-deref in az6027_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/media/usb/dvb-usb/az6027.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 056935d3cbd6..0c53c8508fc1 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -988,7 +988,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 			/* write/read request */
 			if (i + 1 < num && (msg[i + 1].flags & I2C_M_RD)) {
 				req = 0xB9;
-				if (msg[i].len < 1) {
+				if (msg[i].len < 2) {
 					i = -EOPNOTSUPP;
 					break;
 				}
@@ -1005,7 +1005,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 
 				/* demod 16bit addr */
 				req = 0xBD;
-				if (msg[i].len < 1) {
+				if (msg[i].len < 2) {
 					i = -EOPNOTSUPP;
 					break;
 				}
-- 
2.34.1


