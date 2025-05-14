Return-Path: <linux-media+bounces-32501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F466AB7045
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F074A3AFC14
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8241E3762;
	Wed, 14 May 2025 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9bqqet4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0EAD51;
	Wed, 14 May 2025 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237660; cv=none; b=Vt9Aks5NSfDnKrma1iUMM/EGRaFiyqRLTcgrrR2CtCCkPWdqrcdQMXKrFcbP971mzmAnF+aVw3NkjeXJJKFS7DoLGPJv2Wz/Vkve+OYqAGlrfTCdzbsyH9td/NtWxLqeW+aOlu4ITZzD6fS6cTzsX4gaxILh3s764cuhy40lZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237660; c=relaxed/simple;
	bh=eNVkz8APIO1nh+4HkQFWToJCfZTmS6mmwUOuAH2QvyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Md7SF+0/CNQJfuKcIfJBwuQSX1ZYjasvdx7qCEhP1cGA6eWTOSBzlW/sEU8To/CMFBawoessnMYY4ru6eTejjttVBKz+xmPp263FDO+XT911Cc/ebQQgxfiruiJbwdTm3nXr3o9E4QUz2puoQ/dO7fTvpwDymHqdadT2KROmGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9bqqet4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fd1f7f8b25so7853907a12.0;
        Wed, 14 May 2025 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747237657; x=1747842457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DloVxymu3VJuIMRRzLqrAZrCgKY3Ks2zfcUlO6d+9o=;
        b=I9bqqet44eKdOZg5LfZWpY6zWgcp+D5JrGm25t0bGsYkOhZe6dVby8KqIOh7vs70VH
         ikY/UN4qRBllHfygt0gnyI+ha6/JzjSvigi/Ph7/RTCguJGhl2pqB3n/STj9fzqu1pNK
         lPKMqq0cTVNS+xQIxp3ohdmMoB6xeh63zhlvS8tdI8l9RPXf5wjsjLHuT05cmNiGZ5wn
         DUXU2lpXw1myZEsUPAqubRp7GCu2hg2bTHrMiXdtjyMhgEgshehmeFn7e7n25MEzrKPI
         KU4OqGFr9X2C+DEP65hb3ihWUaPyd9FtqT8VI3e5doN7zqFxpTMOyjNcAPNVP9Bx7JRf
         vWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747237657; x=1747842457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DloVxymu3VJuIMRRzLqrAZrCgKY3Ks2zfcUlO6d+9o=;
        b=Sx4OyT1eaYFySHNeLJhSCVgRlo6x8oMKCZy9z3kPXj+A0G2iG6G4CmSV9/pD9eZiqG
         BAkcRsLJ3jkIQiFtQaEpawdlsmxtqJ5eQEWxfD4lTZbE95TKDARGu5GTdXPzIDCm0gaW
         0sTtAJ2RKu0mW9B+GUqxLnmdL3Z416mu8ohZbkziItNKSd192uwF91iNq7Y82fBHKbwc
         1p7NAaUUJJ9AfrYulnsMEw/3LzFjUpY6yw3YEjtIu/90w4dTMKzprdgoGZH2GURszBoL
         Di+1etYad3gbLJNCDKiGzHXNinc74T+s5qkQ89NtNRA+DgolJ38wn4u/WrBBJemN17Aa
         mPFw==
X-Forwarded-Encrypted: i=1; AJvYcCWyvBujW/weBfC/YUBbRCtSs0Hr4SM/RGv6eJxuONocWLnMBX8C4S57CMOkwRnFC/1C0xTApMG6A+f3b9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDrVcFqdp3kD4awbB+ojVs/rMwbFRZCyQSz5N86OcWI9l5BGcC
	DfoBTDumwtWQvB2PqwhiiIYiyQVRplOiv8TlJOmm0iHuhWB4im47H6ZCpGoIN80=
X-Gm-Gg: ASbGncvZNr/imZa3o00HeuBld8R6sYlEsbxgnX7DH/IBNQ9ABKbr3gqGyJ7CT9OzDvP
	SpO3rpDHvcSAQJEvEpnhAyhFKdwpivJwQbo0NJHCKpsAUUuUuXFzk/UGLMlqgZ8ukb1WaE8mkmf
	+KH3zjCP9y9UMCQDDSm3AE/8KTEiYcmlLL+2ka0y3/X2tJMuTCsGhtKGqmILLiDpTZa3Cjqxk/4
	FYrT0AQy3T10wBsIrB1v4BCwGw2uvXnUmZaz8K3YR3sgB8DnlAYAv9J0iZGhU5dEbvVpZr+Y6lm
	Q1tadvruVtZnfA1cCn5AnxsjlelYtfShIxxH60Dr61YdlxT3NJlijQ/YYLKs
X-Google-Smtp-Source: AGHT+IFZORjJU2b6gjMmNHnrnF/Qvkyqut33GjK2d2u0j6lekJgU8sNw/0k/vl8H6yrc9/I1kYCeEw==
X-Received: by 2002:a05:6402:280d:b0:5f4:c5eb:50c9 with SMTP id 4fb4d7f45d1cf-5ff988d09c3mr2784983a12.21.1747237656296;
        Wed, 14 May 2025 08:47:36 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:456b:224:c095:bd73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ff8c016a16sm1952389a12.2.2025.05.14.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:47:36 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>
Subject: [PATCH v2] MAINTAINERS: update my email address to gmail.com
Date: Wed, 14 May 2025 17:45:25 +0200
Message-ID: <20250514154523.239435-3-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace my corporate email address by @gmail.com

Changes to be committed:
	modified:   MAINTAINERS

Changes since v1:
	whithespace in front of Signed-off-by removed

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dee8459a614..e4a4f247d826 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -811,7 +811,7 @@ F:	drivers/media/platform/allegro-dvt/
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
-M:	Martin Hecht <martin.hecht@avnet.eu>
+M:	Martin Hecht <mhecht73@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
-- 
2.43.0


