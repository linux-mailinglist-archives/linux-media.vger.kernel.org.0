Return-Path: <linux-media+bounces-4525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 892588446BB
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 19:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1981F24EFE
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 18:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D62712FF8D;
	Wed, 31 Jan 2024 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qsiL3ApJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF012FF73
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706724326; cv=none; b=PGZanhfoVhzwAfK+aZGzdonPnKDpJVh6h3vYtOkzKjqInrYYX9EYFoauZNX70FnNOpKRvdS+iUnTFBhWkeIHqVxUsCu6Qfe7Vg0I7rRGH2v7qIA9z1FPmS8m1+cNmlVMvS2xXI8SLCMcweDQtnpUJn1LCdhyyjZM5sj910n2AK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706724326; c=relaxed/simple;
	bh=bKC7D9rJMglYHu/aMBYV+9UC2Ak6rO3zVSyYhTaYUH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iQmCuQdaIzrNMu3MmNEgzxiaQ1oiCCZf37zIMHiQMOXLDBwCrbA08Qc6aHKXIkE0Y89dXfxQ5dXn2aJxgB6ynqufKfOMCJevacmtGusrU6GipOAROSI19I/9sDyenGGPb1oOPc/9N6kcwW67N8omDUMsHeshvplWRt59wHXqu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qsiL3ApJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e80046264so1010555e9.0
        for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 10:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706724323; x=1707329123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBGvNSHQReTkUxvWI3aTzUroZ0WS/4BABuj1FjQWt0s=;
        b=qsiL3ApJVU8hxWmoI6JRaAcd5Q5u2Vd9zNOTlx/nNohXNZc/Ko34uoZqGEbNcP/WSm
         r8V+YvfyGhwBCcLMb554QjQskuJEGr9weU1woVIG7AT/h4TP3nQMKAcxQdeJjYSRXIiS
         YZhRysVeKpg5FKm/tAgFzLgtEFiEA1y90/2ueBHvja+Qi+9XaSNRbSuvJfCXqEs/a1CA
         l+ox2ohIkv8126e38kbjqphyWF/KX5SbyBzJxMtcPEX3yzl7/7SkROf43T0rTUlBW/1E
         WEx2qnd7II9qmXx4fOdomrs3Yb1IJeeyfsnSmXTMyol8INCTzAnuq0iwlimDisT+UKZ/
         BLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706724323; x=1707329123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBGvNSHQReTkUxvWI3aTzUroZ0WS/4BABuj1FjQWt0s=;
        b=iycX0iMOuKaXaU2GIl/es3eC2PC7Z8etyxlqS2tAX/iZmQDXi1JlMbIZiHEDIUWgno
         7DDjUR3kzJKJ2VI3Y/wdfJQp6XcSklZ+1goeQ6xkBW9H0M82C8JR7SRaMA+pRt8YZpBR
         bOQfdBgA5Vc9eSkCZ+/W8TDzrtSYwPsSFWifl5oqh6J4TlahFkMOiaxA3luJfoKNuH7X
         FCFV90sThi9O2DOiErwPW18ZYTOw1BqT+QpST92CkBllO1u2wJWOd+ZHa6P+HC9uybl5
         HWzI/FhuhYBFOqYArYH9gGpdGbJf5zff5uJXytiO8zR1hbfGSbKoeDRvr1daiZUH12L+
         LOLQ==
X-Gm-Message-State: AOJu0YwJzVN7kWVx4wilknNOBFYRV6xb0CCYmdSSvwC+DDD7+Tnj1vrK
	pC26Ot1FZ/vgKbsm58vuB64KvG5cTPJFxTygP+brZ5+vA6tIJej3ZBLjbdNdlpI=
X-Google-Smtp-Source: AGHT+IFhQZWjOIoalrxTG4X6yo35IoN86zP51MQu4ZI2btj6MU/e0QIKl4TJat8cXTnt+L/sybyxXA==
X-Received: by 2002:a05:600c:470e:b0:40e:fc20:b574 with SMTP id v14-20020a05600c470e00b0040efc20b574mr2071486wmo.10.1706724322668;
        Wed, 31 Jan 2024 10:05:22 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id p7-20020a05600c418700b0040efcf63492sm2166856wmh.18.2024.01.31.10.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 10:05:22 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-isp: Disallow unbind of devices
Date: Wed, 31 Jan 2024 19:04:52 +0100
Message-ID: <20240131180452.844863-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is not safe to unbind and then rebind a subdevice in the rcar-vin
pipeline. Depending on what subdevice and in what order a device is
rebound the rcar-vin driver can misbehave.

Until this can be solved suppress the files in sysfs which allows for
this. This is in line with what is done for other subdevices exclusively
use with the rcar-vin pipeline, e.g. rcar-csi2.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 530d65fc546b..4512ac338ca5 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -518,6 +518,7 @@ static void risp_remove(struct platform_device *pdev)
 static struct platform_driver rcar_isp_driver = {
 	.driver = {
 		.name = "rcar-isp",
+		.suppress_bind_attrs = true,
 		.of_match_table = risp_of_id_table,
 	},
 	.probe = risp_probe,
-- 
2.43.0


