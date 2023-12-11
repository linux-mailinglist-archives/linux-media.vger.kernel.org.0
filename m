Return-Path: <linux-media+bounces-2171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700E80DF11
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 00:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 991721C21569
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 23:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03F456456;
	Mon, 11 Dec 2023 23:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UflgYqaT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34640A9
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 15:00:20 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c41df5577so19971565e9.0
        for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702335618; x=1702940418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JrNhKSqb42tMOx1MThru7oK9ChKPAdONc9BqrF8L5VU=;
        b=UflgYqaTjAJaYvCtP1y93Kl/k6IgjpsIMFBSo9tI8gBbFfnhvAMCgN5Mfr9mNmK4De
         bM2z+qHeGNZeqKilYHTewTOLelNiydzZ1s21FrFJlZvGkiDUke2AJebnLEbZcMwpv1Sv
         rZ/18yzoOuIlgsZ7XtcVjD4O14zhvvOqmOLlGlzbdxzaCVNtRSgwNXi0weGP9m17VJ5w
         fYTHkFpkfll37QUXqwk4qfeYzI5ELiC02UBzJN4eYN88H+oK93v3S7m0oSxVWcwi1B2b
         YM/LBuMRgPlNoIExjrA1RiHKct0qAqQqAjDk1beKRam7mWeyd912qiMKz591s7dLtwUo
         /EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702335618; x=1702940418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrNhKSqb42tMOx1MThru7oK9ChKPAdONc9BqrF8L5VU=;
        b=bzbZlkGKo7kAuDwyzTKnfKhnQ/sRC0bwdCSlHJRyVbpOhtueFQoYWQT9/oWQqIPAWc
         f4sLD/EuHP7fdTwzMMPpErFuLF+X/PydwkSy9GRgZWbuNs12uG5MztwiXJp+M3Y/ynr7
         pSR/NUheKmDx4xA3bWdlmGCiNv/7bvPYkCXl9JPXZ9U1w8hEE48xNrSCCtzxqBNMaVdA
         eulDNe+/qFpYHi5lQwSLwQeMu8VZzDUacEgQtXcPQfgRj8gWK44qAN7KyUTNYyWyb70R
         LiHXqClVXwuKwLTM0wKQjpy5d9+qPPqsQ0vUqkXhBCLpd0sCR/fMK9DsMH/EybcActRK
         WHEA==
X-Gm-Message-State: AOJu0Yw836e8/2PUMe3VmUstL9TuxerbMIjdfP0r1SWVIpDksq97m0mn
	9+qbaglN/sv1/s7pcTQlCZGk2WNnG9Y=
X-Google-Smtp-Source: AGHT+IGPtTztZ2AwUQ/kzifPEvRCSn57rmHqDk3e/5wpGJGLZGNPe5CzgzghwGA6KPDf8QkRb2wA6Q==
X-Received: by 2002:a1c:7212:0:b0:40c:246d:1ec0 with SMTP id n18-20020a1c7212000000b0040c246d1ec0mr1167956wmc.208.1702335618440;
        Mon, 11 Dec 2023 15:00:18 -0800 (PST)
Received: from aero-laptop.. (78-154-11-58.ip.btc-net.bg. [78.154.11.58])
        by smtp.gmail.com with ESMTPSA id ps1-20020a170906bf4100b00a1de8f69dabsm5385527ejb.5.2023.12.11.15.00.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 15:00:18 -0800 (PST)
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.8] Venus updates
Date: Tue, 12 Dec 2023 01:00:13 +0200
Message-Id: <20231211230013.269230-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pull request includes:
 - Setup secure memory regions for SC7280.

Please, pull.

regards,
Stan

The following changes since commit a00b3f296eac3d43328615c3113e1a74143fc67a:

  media: mediatek: vcodec: Set the supported vp9 profile for each platform (2023-11-23 19:26:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.8

for you to fetch changes up to 1dbc33acdd757329d92072ef29c8359bcad125c0:

  media: venus: core: Set up secure memory ranges for SC7280 (2023-12-11 17:28:30 +0200)

----------------------------------------------------------------
Venus updates for v6.8

----------------------------------------------------------------
Luca Weiss (1):
      media: venus: core: Set up secure memory ranges for SC7280

 drivers/media/platform/qcom/venus/core.c | 4 ++++
 1 file changed, 4 insertions(+)

