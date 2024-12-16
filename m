Return-Path: <linux-media+bounces-23481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE159F34F7
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 16:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 178E31884B08
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7430C53E23;
	Mon, 16 Dec 2024 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JRXNxHiD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8CB148FF0
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364292; cv=none; b=DS52tKdDAVn5o34lOU6/t/wgg2e7+yKVqnnRagjIDKuZzs2J887oOS6Q57yqYeBzuyUonT0biVuUaTfHkQygTOeW1UzRdmLy7/tlc5uRvPDsbCw8LY4qsJdonBe2CPmpmfGWneJqWAOFlyY75QKsb3/NfRCxDQWvwZLF8acJrw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364292; c=relaxed/simple;
	bh=3g8DC1mNg7XB6KkhfdDAW5YL9wzGPK7RETSbnA7JMhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oH+cNMXfu+/JPH7mX9TcGQyBJz3DtlUMDOc9Z+3xfZoTdUTCj1LO8LXtz3UEFy5WazOT60WotjLpTa/Yo/B0jExumWnHSnufA7FSZ2PNvSJUQd20c9ZGgIx6Szz59oaRNnLs+vdK3g1lDiWxc9SgVBgYPy2Avjz27cJqppVLpWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JRXNxHiD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dcdd9a3e54so15758936d6.3
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 07:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734364289; x=1734969089; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANGVT/6vrWuj/lKkD9RrqomD0lbQDWrUQKUnTL+w+JM=;
        b=JRXNxHiDuLJqMYFS7vt9aF28bsg+TyjrvHmSe5I0XCmbIzdkyxJhroCk4vs3L2LqZI
         doHp+znXX5HPEM6A2x3CGbOZhTULm+KUWDNhQTPNKoueGNJPKSfRkFWQAGqT63R5d3Ui
         gJVjECNPE64wFsIgdx4W9kjdnu3aZkTwtujio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734364289; x=1734969089;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANGVT/6vrWuj/lKkD9RrqomD0lbQDWrUQKUnTL+w+JM=;
        b=F9N0FUhUxNCmCBrcxp7d93cQ00r0TZPAzE/lxChe87BM5DtPzgP7+pOHPBMUdWccmL
         fBDsWLDHMmUR6jP26wVilVSuHK2abOmdrNueDFqNMgHxIuLkLnND+jbsxCkT5l/DyrT4
         7Jj0fszy+DbCLC4YuytGKRxmpTtqBaCVlQQP1s4lXJDBaHjoT29mBUmuaUFlekPRzF07
         O5sPmPqQZ2x2Vqqf2eGfIxi0UJ+X3Vq7Nrqnx9SyGIOWARPWrlhvwqTXd/otZmpjjla0
         pHSD5UtJ/l5XbDfYZNeaC4xmxLiwhvDacUAWgB00AN1X6uUnDXc/9g4spVrc1KIzhb7a
         5DkQ==
X-Gm-Message-State: AOJu0YyVz/qnqbkLOWE03QwHUw1uvJ251cvVk8YqOej7wdD8Cri4Z/0M
	LLwDmU2L6AEayWUDwqSKp2pjYKuzfijkb9pObRrFmh1Iyq0AFpkY9iYNgXsyNl6Zf00sQKyENyU
	=
X-Gm-Gg: ASbGncvXZgdPcT6NZ2cXK1NTWTiKsv8BZb1Qpzp6z22cCqsw2nln9RnTU82JhgW3THT
	5BvLxQIWj1V/hdkxgarBB1xpnZQGNPGtV1Dj/sqD3lR+BcSY+gHffQfXOLSjh5iTUM/QDEYkTEe
	qaSEnfNj9KvducBDENWAIDu8FlUkQZa0c6gfohQAaKt1pQWtV4igW2Upi1RlsWaZGnRDNpA4+Fv
	qciadqvB171Q6ZoASKqdI+LPCEW7dSsCCadGqO+Cc8G8XqBJBxfliz25yjzuCUajDnXbVhu4QEc
	+HR2qBG3Wxj5JAq8kog9LW3Q3e6w74s=
X-Google-Smtp-Source: AGHT+IEryXgjRGebrTAf3XDOlliT3FU618LhayFyfvmpOnzp9l+uOYDGOFR/H+wX94jhcNDHFdBzoQ==
X-Received: by 2002:ad4:5d67:0:b0:6d8:d79c:1cbd with SMTP id 6a1803df08f44-6dc8ca55737mr247992346d6.15.1734364289688;
        Mon, 16 Dec 2024 07:51:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd38abd0sm28416446d6.123.2024.12.16.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:51:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 15:51:28 +0000
Subject: [PATCH] media: Documentation: ipu3: Remove unused footnotes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-ipu-doc-v1-1-e07f0b4f9065@chromium.org>
X-B4-Tracking: v=1; b=H4sIAH9MYGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Mz3cyCUt2U/GRdizRTS8tUg5RkS0MjJaDqgqLUtMwKsEnRsbW1AOv
 wD8FZAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

These footnotes are not used, or they are used in a codeblock:
Documentation/media/admin-guide/ipu3.rst:592: WARNING: Footnote [#] is not referenced. [ref.footnote]
Documentation/media/admin-guide/ipu3.rst:598: WARNING: Footnote [#] is not referenced. [ref.footnote]

Remove them for now.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/admin-guide/media/ipu3.rst | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 83b3cd03b35c..9c190942932e 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -98,7 +98,7 @@ frames in packed raw Bayer format to IPU3 CSI2 receiver.
     # and that ov5670 sensor is connected to i2c bus 10 with address 0x36
     export SDEV=$(media-ctl -d $MDEV -e "ov5670 10-0036")
 
-    # Establish the link for the media devices using media-ctl [#f3]_
+    # Establish the link for the media devices using media-ctl
     media-ctl -d $MDEV -l "ov5670:0 -> ipu3-csi2 0:0[1]"
 
     # Set the format for the media devices
@@ -589,12 +589,8 @@ preserved.
 References
 ==========
 
-.. [#f5] drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
-
 .. [#f1] https://github.com/intel/nvt
 
 .. [#f2] http://git.ideasonboard.org/yavta.git
 
-.. [#f3] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
-
 .. [#f4] ImgU limitation requires an additional 16x16 for all input resolutions

---
base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
change-id: 20241216-ipu-doc-8f599e0dc912

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


