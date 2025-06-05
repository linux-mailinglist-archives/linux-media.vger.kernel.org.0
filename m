Return-Path: <linux-media+bounces-34161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E97ACF607
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 19:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E868A17AE47
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 17:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B5A27A131;
	Thu,  5 Jun 2025 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lktwfyOt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250101DFF8
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146097; cv=none; b=HI/8OPi2BdYnw5hlMvq6GSZv6c/B3c1dEG/t9H+hJIyNJpomsIJpcb9epfSbMp7PM7O/FpxgWoEJsyt/WzhepSWgezjxngifa+3oDDOvKrT14JVgv2o4BoOo3VD4CEGLmp/BtiOL9A2Vv6uFqNZnqCNPVFsdm4UxSVYFgQBHOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146097; c=relaxed/simple;
	bh=Vug2YFHG8N39DVFLQctCY/JuX9SOnThQuH28O4Gi6KY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DffwU0AFhJJg0z7dQYu0hkjA9o2IvtB9AfVrtfIv92NWPgrr6E+sAdwPqeO6elUc6nxxQ58parAj6lpklJxR70ahwFDBmjtMFlhJRJzSx/+5Uw+gx0JZaKezmopzZ6d7PpLwWAaLzt90X8GBidIDZS3MckU4wOkeKRea+4AuLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lktwfyOt; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1346727e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749146094; x=1749750894; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4PjgwbP1usPnzVBdzushNivQBbigT4+KdSWdqtpjNk=;
        b=lktwfyOt/7fS2/V1030uZYv/EV4kYgvEX5t9W1eZFcAew9LbjH4MA+rG+k8MRdv8uh
         H9s/5ujFZAETMzSv8mP6MLiiY4PfWuse2MPyyVwgO070ToVyIeuD6Oqzou/neKnMbcMg
         H0UJGYE1XsgmsCo87+2zOzJZFUu3HWoq+Xk6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146094; x=1749750894;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4PjgwbP1usPnzVBdzushNivQBbigT4+KdSWdqtpjNk=;
        b=s0AVpjLW4+AwtRXqj5zB3Rdo89qhhO51ry7ioxedt3OfGY5cAfzpn2mgq5on7M0N0g
         Mxhac0gl+HSYGH9OcvzblMB0aDQ5CkAuCgjTLf5qsBtYJE+xrAhsE8/hLRAGvF/ibEGn
         LSzVo5J4McEsO3glx0Jv5+yIrSyb0R+hYGuX9jfmgeTgoLHfS9cu8Ghyo7MRBccq+6lm
         jmtkajVAV/V3aKvZ0td4Ct+onE+MSfFRiwnUsKq3bV2Y85Hg3J5AlaywVPm7cUwf28+d
         BafmcgPDWyAEFkAoyrB6xtTiRr0t7bMwTTF2Wm7U8UUs7g9wDlzWUXki6osBCgkA4ymE
         iSJw==
X-Gm-Message-State: AOJu0YyPNf0p863s8oW9Us/y/f6L2aRiEkzI/QR2JwUVFnqHcCMPSJai
	ZnI5IGHuuEriSxLUIpFKPqtpvEElTyupDLQFRIAHHrjdq0nR/tZwIu8Z4UakNFwCrA==
X-Gm-Gg: ASbGncs25sQp0HgAasmZXswkjKIUnetQggJdxGkTBIKzQNC2MjPzLAlYMgxd3PmGAfe
	X1Qpz4OXgsrZRM5MRxze7HFX6fIMtWnHNnEVI33uSnNXiAM96Ejc8QFLhSfs2fZTW+3G/rNYBr3
	ruh4uStbdcjcS5FKPaJC/qxzLAByQ93xCU8bFffy+CLmQuM52MafLVusgrkmSmk+HbXz0i+2E3F
	cuUBKyMkg52jD6e1IC4O0BjqcZu/lnh3DGwL5i4TMkNr2ZVmqRS3+IbBVrKxBUqiVogKNcbhtrw
	XE2bBWY3Y+x7rukkZRKT47AT2sqrozyISnBA6SABJpf2esDeG71q1xrgcERGdkljrgigjtoYQYn
	2aCeq+e4fI1o5jYkWpWiVJk0dXw==
X-Google-Smtp-Source: AGHT+IHSgGvCHNXm/rTwmVEWv3fwYb9gJisg3IJasGuUhciQmFC3nx8p3IcMxZqmuRjTLxRejhBNqA==
X-Received: by 2002:a05:6512:238d:b0:553:297b:3d47 with SMTP id 2adb3069b0e04-55366c364e2mr13063e87.39.1749146094207;
        Thu, 05 Jun 2025 10:54:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536656d297sm25643e87.146.2025.06.05.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:54:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:54:53 +0000
Subject: [PATCH v4l-utils v2] CONTRIBUTE: Add simple contribution
 instructions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-prefix-v2-1-4d797e89e29f@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOzZQWgC/12NQQ6DIBREr2L+ujRAodqueo/Gxa+g/kTFgJI2h
 ruX0F2XM/Py5oBgPdkA9+oAbyMFcksO8lRBN+IyWEYmZ5Bcan7lmq3e9vRmKFDV5mUQaw0Z/tV
 F9ISoJrZvNAVo8zRS2Jz/lIsoCvBvi4IJpjTHvr81F97goxu9m2mfz84P0KaUvuQQVQqqAAAA
X-Change-ID: 20250605-prefix-a1a47dbdaa75
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

In the media summit we discussed the need of a special prefix for
v4l-utils. This helps patchwork and media-ci.

Create a new file with a brief introductions on how to contribute and
make the `v4l-utils` official.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add git config example
- Link to v1: https://lore.kernel.org/r/20250605-prefix-v1-1-450aff98308a@chromium.org
---
 CONTRIBUTE.md | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
new file mode 100644
index 0000000000000000000000000000000000000000..708939df88f471b085aafe2b79c9c6e1f044c52e
--- /dev/null
+++ b/CONTRIBUTE.md
@@ -0,0 +1,23 @@
+## Repository
+
+v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
+
+## Contributions
+
+Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
+using the prefix `[PATCH v4l-utils]`. E.g:
+
+```
+git config set format.subjectPrefix "PATCH v4l-utils"
+```
+
+## b4 config
+
+If you use b4[1] for your contributor workflow you can use these options:
+
+```
+git config set b4.send-series-cc linux-media@vger.kernel.org
+git config set b4.send-prefixes v4l-utils
+```
+
+[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html

---
base-commit: 0d4e8e2d4e2d9d87863222e03fd3a6a4a3ff3d86
change-id: 20250605-prefix-a1a47dbdaa75

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


