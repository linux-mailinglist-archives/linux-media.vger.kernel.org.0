Return-Path: <linux-media+bounces-25325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD8A2069D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9791D188A0CB
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08881B0420;
	Tue, 28 Jan 2025 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sjb9grWG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108425A64A;
	Tue, 28 Jan 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738054909; cv=none; b=b9kbcfTeG9ZvsYbxAmqna5OJ+7uBkn0gZ0YLQRg6Iuhz9WtBavC0Flrf9lQyQ0K9/aDt6DGb+hOuA7rEGOsA0XLqtBMsC7hg8VTrdJ1gxf5oz7aCJ9eQyAaHUfGE8roSIdomH5Wz9i38zVsWd8guP7qhkHPF866RKN0QTF/Eg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738054909; c=relaxed/simple;
	bh=vC+CaopTNvqG7nL/bdNOXAIe9+c/xAkEGBQnm/oEY6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p30VsrD7MwLsPE+sgI357QPXwQxxuvCrXWwWTz+esVrjdB29PaodNqM+w2xLA5xB+XzT24mjSUgoIhw8+FsoCNCiwFCoMIvIZ+YmwdKUNIKpyDYLU1hapWXXvGRHaJ5g5k8sJWl2otOHg/jAlxy44QwKsnwKAmOxiLyZ3ZmSFaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sjb9grWG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2156e078563so74834755ad.2;
        Tue, 28 Jan 2025 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738054907; x=1738659707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eYoQgyNutv+WCcDCPJ0j8gGQtLnaUSvrQJtYSPde4c=;
        b=Sjb9grWGP0RgMRw127DNDhH6NeFYl1E1meRuMv/GpGjLOKQ+mlc5ujj3JiPOdFOT+s
         D+hC3sm9Al2IGbx3SWtmuGmAsmKtdjrSwb2wIdI/rM4U35/MqQEeAUW30Afx84xG7UWE
         bYtiPmxusA2pW53rkavg0WjbahD1wY4OjHLX/bZG+tWZGnkB+taCXo+Ng7gca9UgEuHg
         gjWxdYVCsM3gD2pqa5PWxclCX6xoKhoj+qsisswZJaAhDgrjFMhgIpkHshgwUvFuByCi
         WtAihO00Qj128TQXtt7Clr4rMLnTOk2sTn+efpmDHxQ1EeUPlQ/i1WzIGgrPbHfLXKZz
         E73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738054907; x=1738659707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eYoQgyNutv+WCcDCPJ0j8gGQtLnaUSvrQJtYSPde4c=;
        b=Du1Ukl09RXEpA119HxAb8egZK/YZnjQuEMjNEOzjA37kFb6p66ryrDdhLkgOlZLrGK
         jz51liEvIqbZ7B2YzrrsiFil3j6HHd3Ih/nb6Ys9UHi/ByL0CfuElE4gkequ42hA21V2
         hdFp/RWVfBx5kyvBf3G0Fcs24j/5sm9X3ZOdlr2WVt/JGKRbtAiRofXVBgkla09oiSMT
         NIHfkLZqbdinJM4hVi/oCrTYss6GyZi8GGVqMJwiyx9dNlCSBgAjCwi0PFNH9U8qJOiS
         ydv6H5nbTuxNJdqnm/w/zAO62a9ENjvXlMOfcTHLzd4aRkWYP653G0J4ACPp5px/75tk
         37Hg==
X-Forwarded-Encrypted: i=1; AJvYcCV/SY1gSFBGJc/N8Ilb1sMtxLB+yji6SJ+Wktw9M/cw2AoPjZViY1vy9YSQ9WFUHt+wgBqtQ156W75MvG0=@vger.kernel.org, AJvYcCViOMGZXbRYpyBqZdmqayNt2BJxna9qcMnuXvPBWZ8fSk10hT1LU6TdR4fec3hONz70Md7kfvQfCwEql3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrrfiVdrhPEnDGO8JkrQD8AU5EbxUZKxmpuhnorz+rQcZslqX
	ZR3QMLp792GfcevPKJqYvYIvfp/rU6Y9Re6Qwl0p30WonVtkW43S7J0/Xg==
X-Gm-Gg: ASbGncv/YIdggymoYKr65uw7ahl7IxD/hdbMB3p+Xtjss+rkotjJFtXeOrLXXcPgeEs
	zSaHP0+CWHItxFeuJGeXSyJparLzRrob3abVeMze/xmZSGNY6ZTIJfFMJYSHsxwD7WK+PoYaMwe
	9k2WUa91/lZ2+3UZ3UrnMqEYHmcu72l27pYN30TU/daL4lpf0ClZEnTEBTbV/fqkRIQDTosA9iN
	TBvH3ehVq5s25bQ/AVPOo2DcMDe0wtFdrCsu0F210l9W8QFF8eIyeEzPyN62fCygE5ezhqv7v2i
	MO3RarxXSi0usmHVpXkz6pykS7t/sj4IAQ==
X-Google-Smtp-Source: AGHT+IHH09VZ+enfdKrMR4UvAzl87iQPYN7R66YQq3CeyLKFU7UwgxppA6To4TAW+IHWkad/CYyo1A==
X-Received: by 2002:a05:6a20:734e:b0:1e0:d848:9e83 with SMTP id adf61e73a8af0-1eb214e526cmr69572383637.25.1738054906773;
        Tue, 28 Jan 2025 01:01:46 -0800 (PST)
Received: from Ubuntu.. ([27.59.87.238])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ac48e84c905sm7884472a12.6.2025.01.28.01.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:01:46 -0800 (PST)
From: Chandra Pratap <chandrapratap3519@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	Chandra Pratap <chandrapratap3519@gmail.com>
Subject: [PATCH v2] Documentation: fix spelling error in the HDMI CEC documentation
Date: Tue, 28 Jan 2025 14:20:12 +0530
Message-ID: <20250128090107.5478-1-chandrapratap3519@gmail.com>
X-Mailer: git-send-email 2.48.0-rc1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the erroneous spelling of 'responsible' in
Documentation/admin-guide/media/cec.rst. This fixes all errors
pointed out by codespell in the file.

Signed-off-by: Chandra Pratap <chandrapratap3519@gmail.com>
---
Changes since v1:
- Add a commit message for the patch.

Documentation/admin-guide/media/cec.rst | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

Range-diff against v1:
1:  846593ab51b5 ! 1: cbd43786b8e3 Documentation: fix spelling error in the HDMI CEC documentation
    @@ Metadata
      ## Commit message ##
         Documentation: fix spelling error in the HDMI CEC documentation

    +    Correct the erroneous spelling of 'responsible' in
    +    Documentation/admin-guide/media/cec.rst. This fixes all errors
    +    pointed out by codespell in the file.
    +

      ## Documentation/admin-guide/media/cec.rst ##

diff --git a/Documentation/admin-guide/media/cec.rst b/Documentation/admin-guide/media/cec.rst
index 92690e1f2183..b2e7a300494a 100644
--- a/Documentation/admin-guide/media/cec.rst
+++ b/Documentation/admin-guide/media/cec.rst
@@ -451,7 +451,7 @@ configure the CEC devices for HDMI Input and the HDMI Outputs manually.
 ---------------------
 
 A three character manufacturer name that is used in the EDID for the HDMI
-Input. If not set, then userspace is reponsible for configuring an EDID.
+Input. If not set, then userspace is responsible for configuring an EDID.
 If set, then the driver will update the EDID automatically based on the
 resolutions supported by the connected displays, and it will not be possible
 anymore to manually set the EDID for the HDMI Input.
-- 
2.48.0-rc1


