Return-Path: <linux-media+bounces-4288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E906783F74B
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 17:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93D401F211C5
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 16:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0D645944;
	Sun, 28 Jan 2024 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O64EN5E0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD8664CD
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706458445; cv=none; b=mWmCuxCjTLMBUZwpdhwFbhJeSR9mvbpL+6Smo3S8s9FNExsMsQR26+fpjbAn1yuCwje0KUYqfAZ4mRG7n3fW+BBGcZJV9ts2wnUyKqBisNFojc26mKdxKx3x5exgrbAD/2SyKOBHZOXsOx2eXHKfWU3TVMgn7KZcPz1Ei06Y09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706458445; c=relaxed/simple;
	bh=SvazET5cvoizwnCav2UmC+F26NoJafLS2DPv3VLtt5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGAcvwj/Agdmbpgtv+7e9rp24HdbCeKMn7Qnwq5XCIGCoNnGYayFWmgFCNo8v5uXOjmCqrY2w2ESz8kXcAQxl7U2hOiqRaXA8y7Q8GIMJc+5KiHfqII6gZrxhJ19qUeK0gxcb6ZDQSfZW30I5tpH0g0h5/GtluZHQnLwpXGVIZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O64EN5E0; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-682bfd39ac5so16135086d6.2
        for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 08:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706458443; x=1707063243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bSToxy5CAGcJZTlMmZs/1RykWirU/TWtFNPtD7p0tY=;
        b=O64EN5E0rBu5u4XKgHNHHAbLjI0PydCqWCdlY+Ny7MjoSSNRA9M4mwWWTNgtUABPe0
         eUNOmuXrxg/Lkk2WCkI9KnV8kPS8YlaY4seik0pRlu2ejGEj++T8DKKWP7rl5bGBE6e7
         QulReKcKmtGSBgMG7fCMGvrIxfLo2VVXxsrDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706458443; x=1707063243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bSToxy5CAGcJZTlMmZs/1RykWirU/TWtFNPtD7p0tY=;
        b=QD55v2ojokix9Z0DJ82tORFP1giHVpwjPVyzuFNjcWWo06LsX/x7pHHvUEKHdtur7Z
         LZ5iWmrmeQDIhKWpV4JX2fYKiTOOl0DGD7Y+m+4Ub0ztBeOonFpPJjCI1l0xiylsqGIM
         iCi5h6frtrEPu7UPCjJM2Yajn6mHXvmAfAHZR8rz1/IqrN0sterN22FZr+S0T8SLO/7H
         b062GzYD3blCei84bdrfCuBZhPPwIXzz3BqYec/Tfj0PAQm8G8Sr7Qd3fi+zBWiF7niM
         QLvVwvNE8qGOPZwydUzj/a90TD99mJKVfp+na2TiHl18VJwuiX3F5+1RAIYvAskc9PAH
         C4iQ==
X-Gm-Message-State: AOJu0YzDD3kGWxUwddamyVvKRTiGNF+dLdoBT/SIWKmK/CUemOkbgaU6
	qouS9BItX/Axw1geMLpTR/s/ur9eZvIL3K8NpDPslSWf8y16iebOqnUCanINbQ==
X-Google-Smtp-Source: AGHT+IGPj/bWw10peow8+ThqZ4AksGoB8+fhu6FGjZno0b2aG69izlBUsWRzjFmhWV39AxgNwh/u1Q==
X-Received: by 2002:a05:6214:301e:b0:685:f795:dfc2 with SMTP id ke30-20020a056214301e00b00685f795dfc2mr4607832qvb.86.1706458442616;
        Sun, 28 Jan 2024 08:14:02 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id dz11-20020ad4588b000000b0068c493426edsm566640qvb.104.2024.01.28.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 08:14:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: Fix build warnings with gcc-11
Date: Sun, 28 Jan 2024 16:13:55 +0000
Message-Id: <20240128-gcc-11-warnings-v1-0-52bbdf492049@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEN9tmUC/x3MQQqAIBBA0avErBtwJMG6SrQQHW02FgoVhHdPW
 r7F/y9ULsIVluGFwpdUOXIHjQP43eXEKKEbtNKTIm0xeY9EeLuSJaeKZIIzUc/Wmgi9OgtHef7
 jurX2AWVPfVxhAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

gcc-11 throws some warnings, most of them are false positive... but with
a simple refactor the code looks nicer and the warnings are gone.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: nxp: imx8-isi: Factor out a variable
      media: usb: s2255: Refactor s2255_get_fx2fw

 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 8 +++-----
 drivers/media/usb/s2255/s2255drv.c                | 7 ++++---
 2 files changed, 7 insertions(+), 8 deletions(-)
---
base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
change-id: 20240128-gcc-11-warnings-15da5f29885f

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


