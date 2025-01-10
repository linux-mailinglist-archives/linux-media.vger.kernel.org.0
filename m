Return-Path: <linux-media+bounces-24611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DBBA09086
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 13:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1B33AC821
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 12:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCFCDF78;
	Fri, 10 Jan 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="insjnlDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692520A5EB
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512322; cv=none; b=KYMD8ouAqNiytOhIYTTQxUKDFYj/36OOh+0J0qzMEGy6pKOJoMUDqIooxVdyYZP2BzJahebytuz4c0M4E4DkuewbWYWhiijZQaQKdb5M2BS8j/65RIoK/mMTROY/E8ZO6S6zzmx8umS/p0Z9doVy3VUkVhZ/qWKw2fmWKKDOmf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512322; c=relaxed/simple;
	bh=2Wi2hJcT1zNHSKX8/A2Lk6eiJ+5rudw9X/YYXOotMzo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tL5kXm3MHfjfamAi4DN2+SoLm/E3muqxV3sneYessYFNhUUfzdrcDt5BAJrPihOhZw1TWRhlApNW4zv8agqJR28BiWRS4OUlZ7h0q5z0sBgXdK9PdF8FtDyF3KrzV6UydDKGV8Lt05RO+jLdjRZ+JLaKINrJzvEAJUNQzObOpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=insjnlDx; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30167f4c1deso16077441fa.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736512317; x=1737117117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BP9LWU3E3FRLicswW2oBinqYyF3rhC14ijpoNXWp3o=;
        b=insjnlDxwuqXCOiZZFD4lzDe2EtjP2hfXjEoArnXhagFXy6u+JkNFWlMvCFMVgjrNM
         r1JaYPKWoQHfcFyKdHUoNIn6BQrfHl6nUxzIXzwhU8vpBVFmRaCAdBF89nEWJNAPdXoB
         Esqa7tWdfBrC7r95GbxitNHkGgX80mcK1uLd+wV4mmrUcRPdVX7Rtd6537KDUUN0S5kh
         YY9VwzHYPuHdNMRVis8x4W/0pbmYxZU1ipUWg5d8X8n6AEPv8+4M0+SPJQ4SvYTFM7jr
         khn5QOVp2Cfp36pLQcjuB5lxT9KKL9MDzKh6fFG9oeuAsOwmUhStxga6nGgm4MvMiQFd
         nKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512317; x=1737117117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BP9LWU3E3FRLicswW2oBinqYyF3rhC14ijpoNXWp3o=;
        b=saFcnFSgB8Do5m52PqL7HuoTtwaKJjZyCI1q8/oNe6akUELOTJ7ls2AGW5vOQ/6Um+
         Cprgsc5MoH0naF/09T9UY+M8WsqemjspLgVYkOTlud6/Wv6ixrpeqrFfxGKFLGxqk+G1
         CXV0Ar3OYKhvjD3/rj4gqOBh0t8dcOyspbXoDhRecWzhXY2nQvSA25HAWqbmbs9xv9Ds
         zACvt0wgUQCjrfPkMCxMm5v4fBq69j3y/PhTsfTHt/uVbnwcpo0GhDc+anlp0vYR0rMu
         t+fsi+v3fh9H12zYhf1fVaKWM4AYxRlZXUr+2crW+zha5nUaC1FRCbmso0TFOHjwBs3y
         uHeg==
X-Forwarded-Encrypted: i=1; AJvYcCVH3PAR486yR1TXed3XKeEKSATxZd6dpps6wp7Mg7AHxaPxyuuVfjrtrCtwA7vuU8vUADrsZtu59MJOLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIPrwIq7U7sKa0+4H6mqr+yGqswv5j64AYQKIIF9fE21F4bB+1
	cjytmpapno1sQVuwWCuA/VWU8qD4Ap7DQRj20PysEyKUuu7UVY8J1SWAqzdunxM=
X-Gm-Gg: ASbGncv8BAx3ujagh8IltkVmdV4L+1iu28gLfmSIs5sAloIwLzANoGJdNgaUN/ieUUW
	3cD1mVEnJmyUPFBvzBIoYBaFVQCHa8Ouya/YtAUX1UiDC2E3mdRjsNcWzzWDx/bHWvUd9ujm97t
	O+7emXVRNiolHmwk3+4BtIyuoNCtfzZyk41ve78zbGayUnGclYMMS8FcND40oaz7drc/fXAOozp
	aVITr5J7YDSRsECeJnKcsyz5memgf5RvecrhWGiezIypqfnodwuCawUVq5nrmjR
X-Google-Smtp-Source: AGHT+IHZ9afttyn/cqAE1E7GmLuAXpsvCaaaWi8kC7R5oAwtkI7oOIPDRS/Hl/Zy4nFPu6RJGUwzIQ==
X-Received: by 2002:a05:651c:220a:b0:302:175e:5abb with SMTP id 38308e7fff4ca-305f4533291mr27884991fa.3.1736512317337;
        Fri, 10 Jan 2025 04:31:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cedafsm4720691fa.29.2025.01.10.04.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 04:31:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Fri, 10 Jan 2025 14:31:52 +0200
Message-Id: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgTgWcC/2WNwQqDMBBEf0X23C3umqL21P8oHrSJulBN2Uiwi
 P/eVOipxzfDvNkgOBUX4JptoC5KED8n4FMGj7GdB4diEwPnbIjJoNUJJx8dLrat62rFqu9MkZr
 CWIY0e6nrZT2U9ybxKGHx+j4eIn3Tn+zyL4uEOZYVlcTckS2L21PmVv3Z6wDNvu8fzC92O7EAA
 AA=
X-Change-ID: 20241214-drm-move-tda998x-8fb4321434d2
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2Wi2hJcT1zNHSKX8/A2Lk6eiJ+5rudw9X/YYXOotMzo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngRM8o+V3INgu9YQUcio8HytbKGG5QUzMU25hi
 vtQ06/uvG+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4ETPAAKCRCLPIo+Aiko
 1ZDCB/sGzYUNqF0GsWbGgXNdDxGTmZGdZyMaz3ASFYIr6I2qPYzg/qSDvNKlo54XHAfwL+EjlDO
 xq/o+LS8FA8Y/7TdszSwaiPIztO8eEmjJnclgtYWsoe6/V0MDXKjXkfGKl96lNWltpuHDb/7gBM
 tUYZORmsL0nUAk5fgys+WtrWbNaD3OUyroMgw5JGPVeqKXb2ydGGOkwruuGJihzDxqKtYz5yFpc
 zK2LYVIliK2gzZCH0NB8QLrzCrlBdteHwNEHWH3EkRQQs2UlHUuxHsJiz0Jcvg8PJXdNm6SOIGj
 UVm2Il4Vz3xXiLPDuwo6M6IcuPoOzhKBkfZxS9aa0vxNoreo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
on-die on the TDA9989 and TDA19989 chips.

Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
drivers/gpu/drm/bridge/.

Note to Hans and Mauro: I'd ask for all patches to be merged through
drm-misc tree rather than splitting them between drm-misc and media
trees. The patchset depends on the patches that are a part of
drm-misc-next, but are not going to hit 6.14. Please specify if you are
fine with that proposal and  if you'd need an immutable branch for
linux-media.

Note to RMK: I didn't change that, but I'd like to propose to use
drm-misc tree for this bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
- Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
  (Laurent)
- Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org

---
Dmitry Baryshkov (3):
      drm/i2c: tda998x: drop support for platform_data
      media: cec: move driver for TDA9950 from drm/i2c
      drm/i2c: move TDA drivers under drivers/gpu/drm/bridge

 MAINTAINERS                                   |  3 +-
 drivers/gpu/drm/arm/Kconfig                   |  1 +
 drivers/gpu/drm/bridge/Kconfig                |  8 +++++
 drivers/gpu/drm/bridge/Makefile               |  4 +++
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c | 49 +++------------------------
 drivers/gpu/drm/i2c/Kconfig                   | 18 ----------
 drivers/gpu/drm/i2c/Makefile                  |  4 ---
 drivers/media/cec/i2c/Kconfig                 |  9 +++++
 drivers/media/cec/i2c/Makefile                |  1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c  |  0
 include/drm/i2c/tda998x.h                     | 40 ----------------------
 11 files changed, 28 insertions(+), 109 deletions(-)
---
base-commit: e91570cf7c1b3e406878e7b1efbe823d039d1659
change-id: 20241214-drm-move-tda998x-8fb4321434d2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


