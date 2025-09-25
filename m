Return-Path: <linux-media+bounces-43198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C23BA0568
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1192A111E
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8900A2E5B13;
	Thu, 25 Sep 2025 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB032AgS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EE2E3B0D
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814101; cv=none; b=MAXmeZRjcy4kIlJczj1oaeNOsqFaMGdtSFsm2J0tPWbQhEt12SdU+hT+lTEj8KKJcJGPj3pnEmH/WDu82je+Id9ZFfr6cFeJ+REMvhxar7c1cedYHNsPy7EaHXGYWuYKb2NW/jAzQxwB1E73lXURnlxt3pK3JivNLDdEjmAWgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814101; c=relaxed/simple;
	bh=R+wFbRH8+5hnaBVtC0tbh4Cq5Xw/tKS5WxUE9yvqlX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3y/S0T3SSub715/HtwPWx4mZZL9JlkdAzZKX+6abjJauAoYPqP+veHYDKWUYrI8b6Zfwc9UtelU9csEDpWeIMFJ0XC9j/102K7A5qrN5KE4LI2//cAWW0L/wTgRr+F2WyzWjXcNVL7ZY6iymh7HEjpJRgaC01sjUiVbiOximoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB032AgS; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3635bd94dadso10235261fa.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814097; x=1759418897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/ajMaAZHsmNftCRY3dTAxu5sXZqeX7gjwGITMB/lcA=;
        b=dB032AgSlJ8ThaULwwEgjoiOYmrqXpCAxvKftPWOAzdtgdrRF1fbZi1OxBZRs00BVu
         lLj3NWBl3HtXrZTn3idh0EYnGcIRQ0hJhcVwEjJcaYhom3iEaZFO6lqxT4Qb/CQQNVBF
         JokNd5wW8jSSZNnLqau8pIMoMVze22RlCA9+DqOJ4O37i67q+6F8XdZUfl8xL7RWzQrr
         ZrTox9tfuDbEQKpNNolCzXss++RvWQpFqSzQfoFa2GRY747K9+6ICUhVfRe2SiSw8j28
         Xlcd/yjHEd2fU5+sYumU1Q9u107i9KaiZ+9rwFgNPfROZNs2uxqnDxBu3bcs69MGzaIt
         +IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814097; x=1759418897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/ajMaAZHsmNftCRY3dTAxu5sXZqeX7gjwGITMB/lcA=;
        b=TZUTo0Xvq6zoQckyXBNCU6dIMu8ao9hWA2eUplRFuutmOnbmo/uu0ytbp0dRQMW1ea
         UIVsWw8GlWBT2hOU44ldu00zBVE0yAU/rRwGgWNdIXh5hX018VG5DvmSazq4OOnP8GwS
         8GaAeCxF6BPbL+AYBo8sRtLJWmw0Qx+e239LUQzxj555IOUL+rqKqohu6f+EI5qcqAiz
         YwZaIuzWD6HH/MpRQltG4H2eeZkqtB3KPFdqsbDueFNQxgUjLkIKszn4ZfxLy8A6J5DE
         GqGdVArzSANac+9+eo50S9iqpEztWZOr+g/hkFr7My5DJbNnwjnsppjbwwUu2oj/AER1
         hbeA==
X-Gm-Message-State: AOJu0YzwGp1FwxC8RLTdw/0vm66vArgFaVA3+TLgmvj9tcgzbJP0yEJk
	R/j9TcrwzsTVq0g+WhCMmSFednUgp58AHFQeEWl3L+QbCfZYkWsT7BiM
X-Gm-Gg: ASbGncsIsAfMRluFx7nH1ertS1SyYkg5AjyMM0af4vAUBYo7ClykD+ofJAIyAAIRino
	DKmlCNMj1KBEGUPf7UTxvja9lKUugsABZTlSdacz6tBlZ6Dj9UItlonCPnn5FMIKrLDOeYydgQS
	MFpAJDUg08MnNtguBmrJgkhUavAbtlYH5nK1W9pO6Hu3lk8GCps3IDr5xdbqtiGZpYv4KstidhA
	DWUX2hQOsAsl/Ve+GP5+z3TA7QM6+3CAgvVmJUvl10YlomAh4cZ9/WcVrxqp+YmKWgK/lyJDJj0
	2ZKx+0uRB3qkje3zhs6iqb4hjs3hWH3Z9BrAqq5R3VufvtV7t6yJlhaXJ+tO0cgo4nqxLk2cG8X
	/2NcT3X7TLodXCUTbLh0yowky
X-Google-Smtp-Source: AGHT+IEjLl7C6LVh+5ZGIR/Naf8q0lU9twFamYJR/oaj9RedlrpgokXUd1VkW4REFITzmwWy5TLJdg==
X-Received: by 2002:a2e:a10e:0:b0:361:774b:8b45 with SMTP id 38308e7fff4ca-36f8020b691mr13255001fa.37.1758814096768;
        Thu, 25 Sep 2025 08:28:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4772c8asm6347801fa.4.2025.09.25.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:28:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
Date: Thu, 25 Sep 2025 18:28:04 +0300
Message-ID: <20250925152806.80386-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
smartphones.

---
Changes in v2:
- added nvmem-consumer and dropped eeprom
- switched to unevaluatedProperties
- dropped flash-leds, lens-focus, orientation and rotation since they are
  inherited from video-interface-devices by unevaluatedProperties
- dropped assigned-clock* props
- improved code style
- adjusted colorspace definitions
---

Svyatoslav Ryhel (2):
  dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
  media: i2c: add Sony IMX111 CMOS camera sensor driver

 .../bindings/media/i2c/sony,imx111.yaml       |  112 ++
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx111.c                    | 1614 +++++++++++++++++
 4 files changed, 1737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
 create mode 100644 drivers/media/i2c/imx111.c

-- 
2.48.1


