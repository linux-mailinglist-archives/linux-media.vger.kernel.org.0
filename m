Return-Path: <linux-media+bounces-49842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDBCEE6A9
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 12:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8598301C971
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 11:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333D230E0C3;
	Fri,  2 Jan 2026 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHs3pU+X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE130DEDE
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354332; cv=none; b=J2hsKTp+Jp08XBEmWKBp4TSYAJxSE5ZRpgMrazimnoY0W/7GOKw9JxihbVq/3+qBGQXn27X2inW18vJqxdtDX+Jle3tURYDgV1bwAkCAHV0v7wsbaZQvXHOXss6AxknX6JxA4yt8f/ibu3wE5u5kGcqCTByzq8+udJrzSgWS0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354332; c=relaxed/simple;
	bh=TDJbXfFyAbZcEQrNkjWXCeHspNOTitXO3owb4PmXNMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eR++nY8lyuyAz9Ahb0QwrcxxpzRU5ZGOK/YARfutETfKS3/RTtME5GGLc/WqhRPTeMfMPie5Oz0d5HcgGHsVzEXSV5TP5pam5bu5CDLDX6EkZbeOe/ChaL7gSN3S4j1CfkGlYYc3bLpahYifY+WtCGPQ5/36d1Je222jS4ZWRp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHs3pU+X; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6446fcddf2fso10385402d50.0
        for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354328; x=1767959128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1dnW+Zt54C69hvmZUhWgW5bAae7MU/KIyFI4r0RGm8=;
        b=KHs3pU+XeF9uD8XqG1BqosfjYPc3ZBLG2O6V5uwhm/+JI1l+1ZqWAputZ+zQenhWOo
         fvWOIZ3blghkocgBQyYJn6WyYEepjPRt5caaXoPdmBdd9inSDSShBpu2hei+XiAliP0U
         RAcSVWIlWz/wcxDlnsoXti3O7MzwNow6960htXpPgsfTEAxVJc1WMItyWMIY0SjrxxQt
         x2QhW6P7KMleK8Y8EpqbWlWy6KU8b+TLX5fy70Dt/JUIQMgrkkqA8BIKoDCSUGJ6OPIX
         Al3Uf3wXOLWH8ttYiFXS0nZC3OC89Oz4JbktJrLi14NKW8RMRlseKosqKyRUBaNC6Kx0
         SU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354328; x=1767959128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k1dnW+Zt54C69hvmZUhWgW5bAae7MU/KIyFI4r0RGm8=;
        b=sVvUvlaeF6Bh9grsMpcO3xcdjn2GX/QRO5/SD426BY47dEqQPYPk6y6DFy1UJy8jnx
         uvCriGNKR/L3nvJxUb0rJx6iI32gVUJvy/PL5HABrnaBf7Mug/PjtBk3ch6lJoq5GlBp
         gVJMCv92aYs6nlOU0oNerOeg81QJq/1gEMc9VOQh5pWXtZEHNwIVEe0VVzwbFXCAtQuH
         HbRsBMVfJ1lpfv5qzDhvJrUH3T50Eb1rfVvXjwrd8zRQkih5FSmOQRgeXLRb3FB3pRSt
         86GsZ5NRd0hzCBqvQEcpcLoTQ0PllLt1IsrDycQYIMyd/XMtVnuZ+/1IGJoqpWwpPO+M
         fIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSHozlyjZBhX/ndUTTihhCQzf7vaw2Q5oegxNB4Ok/ex4TRxHHG8QkdN9aZ8ATvbJD/Cj9/w9qlqpAGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHKzXu1p3wJ8c0eSKU3hIVXNlYTJZOLSMQCsZrODnunFeVOpz
	gL9BiB3Jd7z3ZVTwiPPT1baQmPlwVfhNHztvsK8HLqj3yXEkYj1qS8E4
X-Gm-Gg: AY/fxX4jfFovPvdl3vqK3mXNAwROxxvwA3PjgHL6orFWFayOfGU1ldARgr75NQab59n
	w7Bs6x5SXryYSpz8YyDDxfLmtFIvuLarUct2zUBZ2ZmG5tTVWdCNhIROFaNZR/wQHYOe9vdUh7d
	HUDEOLijMC1Z/LIZEmA0ZXCo5SQLMHBHrh6P9ODOcNo/43Qx0qgxz2l+t2WijZVe53LCFwRerM5
	MgP3wp4JlSWjBlt2wIL+nBGBllD5+zs3ac1v4/5d5rb2cbN2f7UKrOJQ4rAdoKGUppYqsRo+oa3
	R6zM9fy6z99oXxlrfpuz2J3EDfTsRg5khrLar85SSiKTPnV3AWfQjZYsOPfmveJkLna+PGs3iU1
	ylpiHpPWUuHEcBkHEBSVfEJocf+aZzPZ4SZ2YkzbQO5tiDi19MQ9SxhpExrabDDW+HhtJAshQqk
	+0wqpE0oPIikhjvGlsEYdTnos8/tvvOmvXTPbYFCoXr1ptWPiAFToJYnNxMRdSZVMKsuHMkyIgt
	3sQ3yI=
X-Google-Smtp-Source: AGHT+IE6ACYtbfDtIgHRuD99sx3uuiu8dKeGyrijkk8cNwMwXUe595t6B/utOB2BInhViBh0R6kqVg==
X-Received: by 2002:a05:690e:1486:b0:63e:b41:cebc with SMTP id 956f58d0204a3-6466a8395admr33899090d50.17.1767354328416;
        Fri, 02 Jan 2026 03:45:28 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:27 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC declarations to headers
Date: Fri,  2 Jan 2026 19:44:59 +0800
Message-ID: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up tegra-video SoC data declarations shared across
translation units by moving them to the corresponding headers, avoiding
local extern declarations in .c files.

No functional change intended.

---
Changes in v3:
  - Wrap the SPARSE warning in patch 1 commit message to <= 75 columns.

Changes in v2:
  - Add the exact sparse warning line to patch 1 commit message.
  - Add patch 2 moving tegra20_vip_soc declaration to vip.h for consistency.

Changes in v1:
  - Initial version.

Sun Jian (2):
  staging: media: tegra-video: move tegra210_csi_soc declaration to
    csi.h
  staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0


