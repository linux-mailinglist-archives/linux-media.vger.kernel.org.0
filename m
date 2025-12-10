Return-Path: <linux-media+bounces-48542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AF2CB26E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37DAC314A5A5
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E4B302743;
	Wed, 10 Dec 2025 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x1O2oi+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D032F6927
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355514; cv=none; b=ThC3lq0qhJbeM6nP97wHrVOpu42w/8hg814e9Vrpv00NyKorMznyX2nque/QDoAC7jxdsd1f0ZGvsgBP6EqD+CciCjrkCUE83VlXiIG0BDQZkF1a5QAb/p3XLLRHHYb321koiSEQxIY4r8c/t9KMKB0GyXXgjT6MjKzXd52wxYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355514; c=relaxed/simple;
	bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A/0bxRyJm1jSf9w3lNwDjdvlgyLeFuooStUcShgc8Pjda4NNkwbTOkv1WpXMe6kiFIlugBRilCYfNaJmKOU19SqJAUYLgu+IWTfAMlsFL0mFzfHMrv9DiGiFImKbvo6aBztnzgBrGTgevsG5cjVYtpNabunZFSHeQiFcStTfrrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x1O2oi+4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b736d883ac4so1139421266b.2
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355510; x=1765960310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
        b=x1O2oi+4QgNJaHsYaaxIK+8nsdtPEq0pzaX73ojKwlwOym7skVmTH/5zomkhie3ZgC
         czlm+/3g3dsMGjAcnWSzmMeNbBNzlV93XI7y7OTz0jX7ZWoQ/nveBbJS/byf2rWTc7J9
         O4FX1sN0VrBrKEwR44ZvWRzslBXPakKapZnJxDtq9jFAx9waN50KHLmvLsTZn12j6WTi
         Euw/i+2QYdo0y+/iJBmtApXFr5MDN4vHt05CNnsa4LcwB6KNylaKx3GQRs/aWdeWNGjf
         O3FKcOzgsU4FccBCosjz92VYrOm1oyaRTztXPcexBM0ViHMrTiCAdnraWtcZLVzambeh
         fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355510; x=1765960310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeuBdOwfmxtuicx7sy8IIOAwzU7LAeekCzDxpQuEvCA=;
        b=LH5MvVLWT2jS3QtzdwXODYvqBHoVb3Vaez/JbLqqmHNgFwZgrUnN3SRNs22tw9DfP6
         2Dtvf6YJDE+vGPvcEXWi4uxleztn2hWbXT1VaUXma3AUNB2PcAkAY0RHL//RAmhUVRNL
         zVNE5hAARYCH5xLkJInfEhvNn7IBag4gDN8pTVOaE85RPEp2ZE9uGlR1BfdGjEw4oQRD
         zl62CWeSu08aU2y/hbgF0v50Q5KdWN62s0tOoBP3N+1uV3srnxF0Z836z5WL+saqXqFm
         N0CxZX79ksiK/Ilc7i48Jn2hqwpeynkXlLeq88ye1/lzmtZpqbwGHCEkfdMcBoSX1PiR
         5NJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCxuoMnwEYRs9K+AZ1BcT8DFBqqH1ypfpolpDW17rqLiJem4H8Mj0vNOtN2MmaBrPGkRNHowG0tpYXGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKukJVW2rn1whnZEnDCII5l8rlFqcJpGkpakrOCFehTrmQz+z
	cE9d/XZBrXYRHsmo18mAZ5ASZw0cDoGSqa0EU2fEhFazSo/cNHebZvJOQdeDBCoPiP4=
X-Gm-Gg: ASbGncvy6i6bTkWq6B5rHLzSQ63r4GhgiYZ643fve8vy8LlHC59K/ZQM9EuQJfhkcvm
	sf8/bCbenHVK79NoUzIurg5lPktVN7CM6WjSQaHiIUoBUUWQxEB4IXmGVYBPCGJ0NSJv76Y1XXw
	bj5pfvkms/rUi7gP3Fc8I2s+4z/X6nvcA4WTXntNpWXJ2ID9Bl4zemMIG6m20aYxocGch2fki35
	+U1wpQT5wfwejgbQtG9RxU2dwfEX+SJEAuOxYirGL2kUqS5+sPTJt0GgiCUQDlK51idynzWaj3x
	nzpQzBvZn9yUtLuDZKZ40GQ7pq3XX3xO2NqTXDBlJx3HHJJGyikziwoAgRNRVbBOCvcYEdN6Oqq
	UwT/iq3QTxB369iS5nAn/G+6YloWKi34nZa4toJRIEvhvK0ikJoeiY/56TAxnlPtLt+Wu2Cwdfr
	pHHp/s+4HkY0R5XzSk
X-Google-Smtp-Source: AGHT+IFhEWLNvMehRpc1wUqvy7EgAfKj7fWQCi0AaayfiHw5TZ8PfJNykHUWSH+Jpsiw27YnP7qNSw==
X-Received: by 2002:a17:907:940e:b0:b71:29f7:47dd with SMTP id a640c23a62f3a-b7ce8476094mr174700566b.46.1765355509951;
        Wed, 10 Dec 2025 00:31:49 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f497674asm1598816366b.38.2025.12.10.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:31:49 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] host1x: Convert to bus methods
Date: Wed, 10 Dec 2025 09:31:36 +0100
Message-ID: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WFOYx3gHrxNUtjZ9bkur+Qccb3Ac+ntLs6kixYG0l+o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/pKRGMR+zmAK1B+hWBzeQycrZi9CsF/M95z WMChvvAaY2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv6QAKCRCPgPtYfRL+ TkEhB/9UH9ZkwIxvzlifG7NyhzIUvjXvPe+zdF4tvTXVerfpLth6KJe95KUS7zl/ZtyebZz0D0I 6HC16qxNL0UPB59lEPqR9BMbMqC6DswMZrjSUU7EXrIaA1k0NQbKuO98s8Wpw3mEuNwUWcuAfd0 ZjhzB6I6y00O/o6eWe0swn89yn88PDpEwpmVGRmKt4KMFVPQs/TyHFzT77Vs/GWe1sYP0H83yHB 76QKduqnaltVkBvI2q3gugY4Rss5eOWhfULtoLbjwP6xrQuIL+zwucgvF3SIcpliagwQAP3UN4c OitUBA5tMJCTbIptvpfqe6QD7NEBWUdLLJCHf/+z81sRtnj1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

with the eventual goal to get rid of the callbacks .probe(), .remove()
and .shutdown() in struct device_driver, migrate host1x to use bus
callbacks instead.

Best regards
Uwe

Uwe Kleine-König (2):
  host1x: Make remove callback return void
  host1x: Convert to bus methods

 drivers/crypto/tegra/tegra-se-main.c      |  4 +-
 drivers/gpu/drm/tegra/drm.c               |  4 +-
 drivers/gpu/host1x/bus.c                  | 67 +++++++++++------------
 drivers/staging/media/tegra-video/video.c |  4 +-
 include/linux/host1x.h                    |  2 +-
 5 files changed, 37 insertions(+), 44 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


