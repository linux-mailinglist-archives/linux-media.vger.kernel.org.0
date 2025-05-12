Return-Path: <linux-media+bounces-32256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B1AB30B7
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15714168C44
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1622571BB;
	Mon, 12 May 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/POGKet"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C98179BF;
	Mon, 12 May 2025 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035781; cv=none; b=FzLLXbHiL0LWG0yUKEKAjv2oX2Bm84TBjrc95ZN8w34CoJXShDeIYd0UBIGlG7tLIa0yA00JTjU8I2UrayYJY2LW+q4IQsZqk1zaD1TAvzeTkWAtY29vK+oOyv7bjXwonlQgx3DSPTys+m3XSFLOfYBmxn1hqz5yEXcJ/VUmjY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035781; c=relaxed/simple;
	bh=Bvd9v2KaOdNJwLWfy1ir5zBhQ0rZibvm1b+wCf5BiF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BFYGyspvWd6A7gb2UY1hl/VoWkPH25QqvCxF5/F5fMIEvL/dktujpDxnTsqYG3f/fH9sVJ0+mSkpAq3VuRQH1zKZQ+rtBYRrwevt/2EP24K+2qJO1qU0vCuy3sh/04sAghqOBKcvdDHzUX6mJO3INQH1lIdYTPxBsS4OQVeqEbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/POGKet; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7403f3ece96so5655087b3a.0;
        Mon, 12 May 2025 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747035778; x=1747640578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ixYcQq0rSF0bg9NFU6d5lRXfvmxhdZj5BggjL8hxVE=;
        b=M/POGKeti/aLSIhswhTtGCuE9w02VruiQNnl0H6fnQENPw3oHukEuv39+BbfO9S5eK
         srhhVC8uugWoTAJPMfUbYAN2boUveeacKk08rkkeY53oiD9srBIs54Q/4/c93+XpPQH8
         8mwgYzkHNEKwlhCNrDB1mwnXFPCspPseh8jpEk9pk1B/lzfiIMOffNqTl+fJatbSRVmi
         TooHSn8LVf7kkU0pvBZMiIn+uYdk1TAKebTMkYYvWFPMJxx2oL8DzDnBPqopNm63ScK2
         P20NOJlzXsSAxzFTupNjoZ0sAn2PcupZTHjOSYFHBMnYXkTUVA6UeW/8v/7pavT3/1Se
         9QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747035778; x=1747640578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ixYcQq0rSF0bg9NFU6d5lRXfvmxhdZj5BggjL8hxVE=;
        b=G9POQC4RZjBp/Iitfw+0WPN1IOMxpTnOKZm6CxsmLKm6J066H0KR0VzhtGq9Kw1ncM
         AHvwL0cDp69VBVLtbW5HwvZ4piLcnur4loJeaZd8oYPnxCN9EL9qI/4xs84VGSEn/1Ej
         wvhnioW3s8xTqx7rhPuqEYJY9P0PwFnTQlis2Su5Udx0xHpVJRtXy2diPa/2RVOF19XA
         JpXGVKqvEhfvDqN7iRUQT8KBsufVyCxiO8zvESwG70XPA/P3WT0IlJxeA5nvQioXr0vr
         iayxtCEh5SUvK7vcuCEXN91MSEkOlkoUR/PxAV2SkYRztLf/sPpxRzEb61rZMlf23fH0
         OTTA==
X-Forwarded-Encrypted: i=1; AJvYcCUVO7i3F5wFeKEY8HCzIssI6PEfW5eEjv6yhQnlJCPXNj5R3i2HEboZkHueMpvojX9Ru21aX/haME0=@vger.kernel.org, AJvYcCXM1kxJOdKeoipOlsb1Vz3Vv6USsKgCKTT4DSp0e6WEvT/d8hqexGW0ZPNbU8Mvgmeq8xt/0iaiDwgSb+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5CHZ5C4gC9QEJg/ZCJfVvn/SUSRi2K65LEEYdY+NdgWpxLYr
	Mg4x1tlAUbhV1T2h0eEFonOgzvXh6aWH8KfyoV53eN1zaFIT3siN
X-Gm-Gg: ASbGnctbKmtXXUOZNEs9xQpziiLTaae5+CwoNr0jFV3ih2zveocNIzSkXaLwqlhw9tt
	CdVh6peldNGu+brid425Z5g37jclHSIitu0Zy8ND9WU9adgPveJXGKMHhKAhKBoIrXY4PBlmlUD
	J3+/ARS7RLMoufkumZc/ZY+DGPST3nW8m+NDN4Otp8kHvI7naSYpFBczSGPxlHdw2Aehtzywia4
	xGzheCijPAf5teh+fsl2FDRG/7IiOqlki7l+goWqskJ8FquhIHgqSVPJ8LMC7XNEhGYTK9vlE8C
	4e0XedEeV8C0N0rifXzSA+d70bW6WMYxZM/fAP4dqAlnTq+LwlQ=
X-Google-Smtp-Source: AGHT+IEM8O9x95BglttkpsX1VYoI4jLWpK+gMFTpf3ZBXg7sxj3iLdI7bWtsrH6IFjYE84LOvjVznA==
X-Received: by 2002:a05:6a00:190f:b0:740:9a42:a356 with SMTP id d2e1a72fcca58-7423bd5544cmr17176473b3a.11.1747035778066;
        Mon, 12 May 2025 00:42:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0d007sm5690848b3a.96.2025.05.12.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:42:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C0F76420AB0E; Mon, 12 May 2025 14:42:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux Media Subsystem <linux-media@vger.kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Documentation/gpu: Disambiguate SPI term
Date: Mon, 12 May 2025 14:42:16 +0700
Message-ID: <20250512074215.40928-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=bagasdotme@gmail.com; h=from:subject; bh=0Ff/DfdS8SM8W7YuaV5Dll23KaO6sYsRLEZgfh2NHJI=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmKSxutzjK83xzJWfo1+rSB1/66S/XV36er3TApzjA81 P5Q+o1ARykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACay9wPD/zCXyKlr4lNVHMKL ix8lhjNN5fR0bSuV3Kz27HEtX0IMM8P/hPX6hu+LdjKZsbzb95rhbZH7R/+Cnk8pWqH2DAtMGY8 zAwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Documentation/userspace-api/media/glossary.rst:170: WARNING: duplicate term description of SPI, other instance in gpu/amdgpu/amdgpu-glossary

That's because SPI of amdgpu (Shader Processor Input) shares the same
global glossary term as SPI of media subsystem (which is Serial
Peripheral Interface Bus). Disambiguate the former from the latter to
fix the warning.

Note that adding context qualifiers in the term is strictly necessary
in order to make Sphinx happy.

Fixes: dd3d035a7838 ("Documentation/gpu: Add new entries to amdgpu glossary")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250509185845.60bf5e7b@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Also Cc: media maintainers.

 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 2040da593b1490..30812d9d53c645 100644
--- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -182,7 +182,7 @@ we have a dedicated glossary for Display Core at
     SMU/SMC
       System Management Unit / System Management Controller
 
-    SPI
+    SPI (AMDGPU)
       Shader Processor Input
 
     SRLC

base-commit: afc6053d4c4b0a6be500b9e643aa17221e93a57b
-- 
An old man doll... just what I always wanted! - Clara


