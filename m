Return-Path: <linux-media+bounces-40254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D197EB2C2A6
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA33A17F332
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A14334716;
	Tue, 19 Aug 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/010uyn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CD3112AE;
	Tue, 19 Aug 2025 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605115; cv=none; b=lmdJILGiiCCKAw/uRjPWeTf5BxCQDYDIutyTIIV8/xBdoVZgfINEr44YOMe8dxQjeSq+TDSzoB0bRfrMfmkaOBVSQ8LLtrcr/u0cQkgwnzyZvUDnebKdfNzw5dObipetaU669VvQZMiQ8q47pRGH77lgIKl2MvEieVuXbkQiG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605115; c=relaxed/simple;
	bh=IIq1mvH6OtqAv0YaH8ERmi2vjWmybv3ZiNk5fkOAWlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gknVSBCjg23vHsLdLDZmr29tY/wxtsLQRI/SV2WxKbZMTz0RpL+GvGSUaQdoBZ5m5NykZOaBLveFHckOiA+H/Q9moa/yHR+t2824YEKWcnoHdqC2bilTryz1W4rGaIsX+4DTeizjQa0MTLire1wdBMgAwS1OynmwFjqbdTRI/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/010uyn; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61a8b640e34so345961a12.1;
        Tue, 19 Aug 2025 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605112; x=1756209912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfzT05dM2baYISOQU6tgyWeATeoow59nz2/0T9K5+y8=;
        b=L/010uyn+Ro7rrRKxWdf4ED//isi5DDpuY5YEu1aNrJzfTjYY3FCENxOM3T5gYe4fE
         Rbpu+IHbq33p7Ijy5ONEZhzWSJjBxBu2pPJqAENuE7tmxNYMjqVCmiHI9YyFSxXT78eY
         3KQC1jrMyuKV5gWTLhUbeYzMr0oDYZPZd3IcdRMiStnQHkim4VWEZqufUUX4CIAZQZNl
         AHUuI2HywmdmlAPg7YUY+68ZNW98XwiC5X1xQQ0VCAJX8Q3TLQgL9OjkQ4AkyeJHWAfG
         3GrwD/QUqCJ/tCTdv5g6wgnVQOfYCWAz4xxLikUslpNrTk2+ZNBBP9ndzvAsunuC4E6W
         xtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605112; x=1756209912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfzT05dM2baYISOQU6tgyWeATeoow59nz2/0T9K5+y8=;
        b=NNcEwfe60P9lAAuCAg/0gFJv0mO6LhotQ7zKK4YB+aH5OJb1KSkOrxQB4XH8lcUrFu
         rHDyvYWZ0DAizv42e7evytQS/F5a1JXeUi0bTBs6UiY/BcA9/mW3/ZUaMBch871PtmGw
         vsQTgfONE+aazvu5cm+/WBdTTJihCtZymSIsY+9GXdFe3dq8LSMAXWVCY+vmq/ti56Ts
         ZbJfruHAQ38m97ReM0HuWSFTdOrWtbImztyRyuYLSev0I63Wd649R+l4m2x5FCh9NFw3
         Xozy/sRhdcPvkgPH0FOkFUjfmtXUh0uPYYWwFN6ocsKKJNMQAyGTMvzSH06/No1T4YkU
         Fmmg==
X-Forwarded-Encrypted: i=1; AJvYcCWfzGwpZG9N/Ae355kg8hU5BcPpaFaVWvL9h1GfRn7t8htXEEBNyOee4Vi5evieGA+ArFeyiq8LpGny@vger.kernel.org, AJvYcCXF06l/3H6aKzbwmdw3n7w3Cs0xhz5pqCBacQclXZvZoEzRKLvggpW07aLk9ir4wmt0YmGYTO1FaHYkGYvc@vger.kernel.org
X-Gm-Message-State: AOJu0YyPK8TL9cF3+VWgW0d15FDog8NnzGTmzcHnAdKN/oqgRFb2fkFI
	pI+5by8gYBBEqveaTMZ1dKvmScAlSUep9stk//jN3IBJ3NjhXehgKoFh
X-Gm-Gg: ASbGnct1O18ak4fsB/dGBf1YzcUwV1S4NasPghzSkZ230chFAS14M3T3xc6qNSD0niS
	iM1S6I7WWnqbleCG56WtFmjxp7+hCik3Rp8qCtweWTF8EY1ZoGoanpi9zODeso6c3uzNtqt9t2b
	adC30zslML3RvM5ElWT0DknJ0A2jytqJOe1HzeOuyhXKOkQeGyok4zaJRS2COtPEuzRNcMcg8aS
	xLdrLTs8NReFvsOCyWiXCB2WwlqG0oZPbzMkYftgLQ4Ba6orDd01pYtrHoe48Swnvp6Z61kPA7y
	yrvs1CK0mxMT7w3awVDhukQqmMkCNPtPbJOCV4/eZ0lD+x+NAHim2tS+e4AnU0FgoqRngouuYHc
	aM1CSa5gl1eAMmw==
X-Google-Smtp-Source: AGHT+IFkG7xgD6HHzsfzf2LOGMtIPjRGO8JyKFfA0/NwtGyIhEoWN1bx0VCJTRYR+V8llaKfV/9zGA==
X-Received: by 2002:a05:6402:52c8:b0:60e:23d:43b1 with SMTP id 4fb4d7f45d1cf-61a7e747d21mr1741214a12.16.1755605112020;
        Tue, 19 Aug 2025 05:05:12 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755d9f3bsm1657741a12.1.2025.08.19.05.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:05:11 -0700 (PDT)
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
Subject: [PATCH v1 0/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
Date: Tue, 19 Aug 2025 15:04:25 +0300
Message-ID: <20250819120428.83437-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (2):
  dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
  media: i2c: add Sony IMX111 CMOS camera sensor driver

 .../bindings/media/i2c/sony,imx111.yaml       |  126 ++
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx111.c                    | 1616 +++++++++++++++++
 4 files changed, 1753 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
 create mode 100644 drivers/media/i2c/imx111.c

-- 
2.48.1


