Return-Path: <linux-media+bounces-29186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A770BA786BF
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 05:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2FF61892381
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 03:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2255F221F09;
	Wed,  2 Apr 2025 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTbzasGv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99A221F00
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743563424; cv=none; b=bsObQfvr4jZVowbgR52p+LAsBAbYjzu/kp7ZOq2nnZA46iYkFG6Kh/xyiWmS4bvcIMD3UuaD7O7OXnwievoWFv+Lb8J2nVZw9vWrurFSNovbrTw0UUPfVlbMVt4OdYYULjVv8euqgcLcnjQvakqqv/sLTyppdRB74DfTmkXwyVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743563424; c=relaxed/simple;
	bh=75JSVBxHpSQVDa/XROC96mZNfDQP9/YKybNn743+vOE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=ixvB/UCKPeUJMuB3fEb4dnGH2zeMM2i73OSqgw43MZYdyyYWx8cy7tqm7nbsgjgZN0eBB/5qCX9CZvYeQcYuZvm7u8zWaqY/JoFUEoP9EbO2CyoqgPygLjTI0sB39rSA8pWsJJ7N6Z1vIcVg6rRj1iTrP/p8z9tdH7oj2NB+hgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTbzasGv; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476a720e806so56969191cf.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743563422; x=1744168222; darn=vger.kernel.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xSzTQ/0TpLC3197jpm26Y3dFldQ/EqZ/RckXCir2ipg=;
        b=RTbzasGvCDrVX4u7IIYcIdZdcYLr1SintEWH7t5VxWb/URsj2yEDA86ed5LlviRQpO
         Edat3xX29YvBOPclqsFgAOZaVbBrEAF1lcjYLgjQqZgSSNJZhvfDBfKBvC8wGRDXG+IB
         f9x0P31547IeWXyGGTVgAfmvpIpZgLtAw0jQJ6IkZOeM05y1C3xsSdrcLRBSACr6lqiB
         BDe/G5YPUkSz0t6JJKTFmHI/XgKQIYsrKiOkTQr15ka66Knf28aeF/+2ORyWC0AS1jJ1
         c3+OTFsPobyzYFqFOktT6az4Za33xlMwLL1ZJWqPQ1VDmiVBev2QIoapECLk7nD9Xlpa
         Tnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743563422; x=1744168222;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSzTQ/0TpLC3197jpm26Y3dFldQ/EqZ/RckXCir2ipg=;
        b=SHc4qbhRgJ0V3pQfzkLTKbHZ4UObrqGT/lnlTeAS0Yn+ddJWNBiMxK0141Jz5qeNC9
         FIBRzSjMvBM+Lfp4yEeTJtLAXIbxaFBZDWaJgIoQBWO376puOcJo+doauU1rRZpscLgs
         ujUcVewybeJCMeeesE3EeBjiqCkHoqBbZyjY1gnGqB51OJoUhxkvZOgQ6DrCwu1M6U3j
         /IKTGMtjG6DYyLeFqOnpwzAgp2cbEPALwPl/6ZhAk1KQ5qoYf6iT+QFWyfEEgtNocx0o
         s8F4DNnRkvb9i/3ny6IzkOA03343OBfo1UjgWFMmuPF9LDfjJz/7dfA2g+p9f4oOexpf
         4vug==
X-Gm-Message-State: AOJu0YwvZqJGC0gQXE6s7fr/RuotuRkuzmyZ3JSzPgr26wSkkZhfmY9o
	Q6iGnag5+BdybE/BrPnGomFbehg8UaXa0xYFrhYLfpN627wx6k6KDmSL6w0htBY=
X-Gm-Gg: ASbGnctfUAMbVSjLupfDPg4STxisftxnpWgWucF9rumtNySsyhzyZ2Gwavh0MN8kyOJ
	Q/QimONUz1qms6CMNmFX0DBfLj55Oe2dFsij+NYq3E+5M1Mzn70gK/h0aFJcakLG5HLUK/f/CIq
	1Mk+nrL0k97vrdCQn7swxJCPtKCPtgyIr4rGzNPkBSZI4bbMHAhQNJOW9jJcuLhCL2xZTwvogmO
	QbzKQtY8yN0JecClv2locFrPDeNLVTmZLSGKiU0sxnP6A7AQlASQemnhMTi5Zxe5m30k7HMQRkR
	/NIuumKYIC+hGqxtv5xpTzUwS5jO+YRx3sCjw/wTd2hQLw==
X-Google-Smtp-Source: AGHT+IHplFjrxjDMYagBcdC5wahRlljQSFTPb8RSmU6UlmQoJYFzdjRZxJfovtpXEnEuRvDLsVw4Pg==
X-Received: by 2002:a05:622a:148e:b0:477:1e66:7442 with SMTP id d75a77b69052e-478f6c421f5mr94200061cf.5.1743563421784;
        Tue, 01 Apr 2025 20:10:21 -0700 (PDT)
Received: from [127.0.1.1] ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7faa9sm73951971cf.33.2025.04.01.20.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:10:21 -0700 (PDT)
Message-ID: <67ecaa9d.c80a0220.978d0.8852@mx.google.com>
Date: Tue, 01 Apr 2025 20:10:21 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============9012084329957985044=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-media@vger.kernel.org
Cc: 
 linux-staging@lists.linux.dev,slongerbeam@gmail.com,p.zabel@pengutronix.de,mchehab@kernel.org,gregkh@linuxfoundation.org,skhan@linuxfoundation.org,kernelmentees@lists.linuxfoundation.org
Subject: [PATCH v2] staging: media: Remove unnecessary braces for single
 statement block

--===============9012084329957985044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From b1b00ec8defda73d871d02dd606286404e42ac00 Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 1 Apr 2025 20:22:22 -0400
Subject: [PATCH v2] staging: media: Remove unnecessary braces for single
 statement block

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---

Changes since v2:
	* Add missing author
	* Fix title of email
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


--===============9012084329957985044==--

