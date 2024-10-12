Return-Path: <linux-media+bounces-19495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C999B55F
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 16:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AEC11F22986
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 14:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437E1198E6D;
	Sat, 12 Oct 2024 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUI9uz9A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A544194A6F;
	Sat, 12 Oct 2024 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728742449; cv=none; b=mewTq1Tz7WRzpZIsYkvEfB8On8A8yRQUfDmTArrVj/tKqZ/6SCkitaUr3bkAUJtW7lxCUpEPe9C8LjEc8ySlGNQv5LiHVnf+bw+ztTo3P+j3qLM1w8nj1Tjcbi/R7ntxZTHU2v6/ZwrMFiVOvvCucQ+P7YtNDpaD4ezU9K5LFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728742449; c=relaxed/simple;
	bh=QpvuA0tXrIusrPG8LAQQ4pQs4s+4SgLc+0UwE7FI/E4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XjNJ8oG9OWH2XNNtiU38P64aaAtsxYGqVRaZjUvaQsvbUZWBY9UjJiMl+L3p72C6xkX3RYkIMTzJ9fgu7Ry0wGR8fhau+QdoB+h1apOs41D0k3R1TpTQoftnfI/rA8OMDiNz+1lHiOdM7dQ+uiwsY+SnRk03ke5VZjNS4vlI5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUI9uz9A; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so57141466b.0;
        Sat, 12 Oct 2024 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728742446; x=1729347246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tuv25M7qfPhkVq2rdwgDLlN4egguVJCUL8w07O0WP/s=;
        b=EUI9uz9ADpFJFSXU/7S7jtFxWrW6Qr6A/ZEpAPBFhBu1lHYO7uU7/pgHYtsMB1Kuqm
         xtCt60gHoRkAWTlljsRlarw8M4DclZNnvD3GHJn/kalSaq7PeGlmxhSLrm3+bnDMDvfL
         t3iePG41SPsKoDCgGx+UhNX9U0uK7yMtLl7W5zZTIuR1+Coh/n3A92Mq6xIoSMylzT+4
         bZUuOyiW9NEACvpbyI7B1isF6TF69Tt+ao4FZ/3+Bm5CwkU6hu9qUg0IoEKgSAuUPCf+
         NGRkBaGyRAvon9K1ziy7ya8j3EmlR3wH84fBBGceOFIEvpmmcLsElD5ahtFpef55iP9j
         nthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728742446; x=1729347246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tuv25M7qfPhkVq2rdwgDLlN4egguVJCUL8w07O0WP/s=;
        b=dEfN5EcJ84TyX83lr7idJEwsmpHpfStpnG3Fr60Vv17DOIMWE6Hpyys1IkF+CHrJBI
         kA98esudSXHL0DyRijNgGQHC6rRAARkoGcMrSf9Ab2PiAy+agx1IJK/MAyRCirqi15aV
         qQqWIpVhJTJBAAKgteUQyuF1Kxl4FNFrO0pHtbneZ8QRgR5W0DNHHHxDU76atmzfhz9v
         FLscVXuFiA2Zj5/VnPmMH/0ORfa0XCEVOkqVzRaJVLzI7EV7LCP3kcJeBePBI6EhgFPy
         q7zruv3HWssR+h9Deu/+diEwoGIt8mKuy4XblPqy3GoO35srIxtGy+5EZ0DITfg/N9lM
         u+0A==
X-Forwarded-Encrypted: i=1; AJvYcCUekEjmcikQH+TjBs8dY9HCrDeTeswdEZzooW6jx4XYEzykX9etYYvBqtDOs0VbQFcfGDaDnO4JDYWXfVM=@vger.kernel.org, AJvYcCUfdmNMsm+fKO8BCdrydUAjwAjLioVJL56O/K7uqBTpCO5m6CD/S3VuxfWx7ZuyRPfpc50ju2brvaOm/Q0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxwaw4cINNmpE4Kx7bklVO8f7MMnWcp3ZuolURuZ2OeNZ5QtZk
	hJmjq85fQ8LzIjYTk0KvDiU4yLjAB2Qg0aqKMX5Oqj5H35vB9nqP
X-Google-Smtp-Source: AGHT+IG0B8W6nRGV5gDheoL2qJhnCrgP/hIARfPGbcFt0uINpwOjZ3efVzmhEbB+wWW7eVXLEVLSMg==
X-Received: by 2002:a17:907:7ea1:b0:a8d:250a:52a8 with SMTP id a640c23a62f3a-a99b93a8506mr426443966b.3.1728742446066;
        Sat, 12 Oct 2024 07:14:06 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99fa0cc7d4sm12707566b.104.2024.10.12.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 07:14:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: remove redundant re-checking of err
Date: Sat, 12 Oct 2024 15:14:03 +0100
Message-Id: <20241012141403.1558513-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The check to see if err is non-zero is always false because err has
been previously checked on whenever err has been assigned in previous
code paths. The check is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ca97ea082cf4..7cee4dc35427 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -6308,9 +6308,6 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 		}
 	}
 
-	if (err)
-		goto ERR;
-
 ERR:
 	if (need_scaler)
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
-- 
2.39.5


