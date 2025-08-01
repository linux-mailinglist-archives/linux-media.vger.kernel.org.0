Return-Path: <linux-media+bounces-38727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDDFB18607
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 18:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1DB81AA773C
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 16:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0404B1DB122;
	Fri,  1 Aug 2025 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYkuOc9L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7E51C5A;
	Fri,  1 Aug 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754067005; cv=none; b=kfWTUTVyMkYeDWiLFReR2YMwnY+heP+k+sj9bPo9Q27V5ACjmYFClFCRqsHhIGg0eqTsBoyBsNEhPmJiqmbbCXrQ3zB+uxXlmgl9CfmV5SLL+HwXXbuTko1TFEpYniOsLXYfMZfj9izl7c1+UhTMaPkLVyrZTd1F5sUiJ8ganI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754067005; c=relaxed/simple;
	bh=ftAfj7DSEwxoC83fqUsE8DotY5NHgVC/SYicSt9F49I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Me8dZ7xmkZURMRSeCHqaRRa7XY4hUBR7HVCn8RlhPldppIhe3S7wLJlgww7lyE/c5bDFL4KvpILsBJfz3ydARxtnsedfeMh5jsVKjltQ8uxzGXPh6L0tHCU9C6XMJWL9sSAAXEWI9mQSHT0o4/dUUaIbUDn7IMI8kehP7CV2zO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYkuOc9L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b79bd3b1f7so1080901f8f.1;
        Fri, 01 Aug 2025 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754067002; x=1754671802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rU55jQ8aoxYKrBdxW/IuuFwqSgutwcBG4+8WuMqsBPk=;
        b=MYkuOc9LC54e3VKLHOYIZ48RHbjsXs+w3PxrSY95U8lppEFOaBpjuZcrnfET2F2lhP
         tchMrkwemz+vE4OWTi6BJfkSBOd6ziYDlTx+4rcT8eP5EWWrxQ+ikvz7RDz6S12CQRV6
         l2jrUt/r6VAec/42GlxuO+k25FgBCrfvrAu8qn/2WbYTCWkiHNvFEsmitibZGfCyLNNa
         zmy+6XSoxJa0jwhsrX8UUz9RIDCIAdyBsAFUdEnvUCicG7LyPJfW91Chp3yvHWh9ppMJ
         pAaKG47fx/bcvBuXwyHQTLjc+poYjeGL0DzxVhL26KEMYUepH7ddpkznHEDsvfGsEIst
         uyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754067002; x=1754671802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU55jQ8aoxYKrBdxW/IuuFwqSgutwcBG4+8WuMqsBPk=;
        b=F3FxDR1BuN8Mh35heDfehCwjr4vNge8UOBNrbqoWamO64huX1KXvKHSveHLIk0dN9d
         s9Y49JvJe0w+oapN6AJMn3CK6PbO/6g2UCDDbgV+WIlzQ/lxJgB+cCYC3M4Mias7Lto4
         N+kAhUh1duIQ3ej6n96U0txhRMizARKWCU42T5bb+RzvLpNnyxB9mxkWUZ2FW3K+WAYp
         iJIr3KgZvFH9Q6z6LzqhxaFUqQXcWcvUKJMRfiPQVTADt5toksbUBtNKYds0B/2NpcS0
         hG3k1t0Saws58uK2qZiJGRu40soVt0BdFZkCYx/NDNikS5gVrF2BrNL+ZqwPAjwjiiqK
         TTtA==
X-Forwarded-Encrypted: i=1; AJvYcCVmQAN5es9ZVj3BhJI3Dpsr+EgX1hGRi+U1fZNh17NqSEYyFOO1ZbXGc4OZUmA35wLapxd2Jk30q29u0pA=@vger.kernel.org, AJvYcCX27gOfA/51otThHQNAbk/FQI7gTeG/yU9zaTsm2tDJT46UI9vJ/tKZCc7z/OhKAgTJRc8Bq62rMMW2oiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLhJ/Tl3eHD1QZb3sLX+WpOVp7lm0E/eGO4BY5y3guGp3TnPk
	URcb3jVjfFxMnobg4Q8kazAZ2WIcZQWuv5jiKq71h6+RriKqxptET9eY
X-Gm-Gg: ASbGncuuZO0rbiHBwhjfHHNCE28CYPJ8IGxnHCSRr4VuS6YbdaZD1dDnMi3F3ROBT4O
	f3qPN+6vJTpD57t5WO80RB0Yd4E8tvi3W1DD3pZPY7VdDk7FlZUpqKYOzjUDRtSkgt0OZEHK8kQ
	QSORYHNq2lLtaoaqThbfMM4K8CWEey+d9m6qx3Eh5BC5/ovBPMwzu3L06IFV63cYO9avwprwGdU
	DnpFJLCjsBdh90mm2WD6gcPIiT4qAslZddjTWbV496XDo3cPcXrhjmbFMLhI1cemmadTa36YQn4
	fvmFHRMfWGrtcuPDlc4pnDFbSe3vvShYDEGSIMb1LYnaOKYoNb6keXTaOhG37XgJ0IvMvkQxdur
	wh8PTMEBTNJekTIYpDi0oETf6xpQXSBA=
X-Google-Smtp-Source: AGHT+IFp4BA3MnXrrxharAaU3Lnr61GDVf1qF63GGcw2GQOmWP6aV8yJnei0cFW2bYCjbSFHH1fTQw==
X-Received: by 2002:a05:6000:220f:b0:3b7:9c79:32be with SMTP id ffacd0b85a97d-3b8d94c1c60mr332067f8f.45.1754067002055;
        Fri, 01 Aug 2025 09:50:02 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abf0csm6315587f8f.14.2025.08.01.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 09:50:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: b2c2: Remove space before newline
Date: Fri,  1 Aug 2025 17:49:26 +0100
Message-ID: <20250801164926.2438392-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is an extraneous space before a newline in a dprintk message.
Remove the space.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/common/b2c2/flexcop-sram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/b2c2/flexcop-sram.c b/drivers/media/common/b2c2/flexcop-sram.c
index d97962eb0112..dba03769f263 100644
--- a/drivers/media/common/b2c2/flexcop-sram.c
+++ b/drivers/media/common/b2c2/flexcop-sram.c
@@ -352,7 +352,7 @@ static int flexcop_sram_detect(struct flexcop_device *fc)
 	sram_set_size(adapter, 0x10000);
 	sram_init(adapter);
 	write_reg_dw(adapter, 0x208, tmp);
-	dprintk("%s: SRAM detection failed. Set to 32K \n", __func__);
+	dprintk("%s: SRAM detection failed. Set to 32K\n", __func__);
 	return 0;
 }
 
-- 
2.50.0


