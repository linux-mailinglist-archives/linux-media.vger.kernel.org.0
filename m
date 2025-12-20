Return-Path: <linux-media+bounces-49252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A130CD3803
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 23:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACC003015ED4
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 22:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1102FE048;
	Sat, 20 Dec 2025 22:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIHxvnvR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B722652B7
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766268219; cv=none; b=MQEU71g7pVlo08ecdhUTmdgGOXfpVSETfmQKZsjDofuqw/+stJpmX3D3i+FI4UCiBrEj/qb8baA8e3YG1vx8kX5S9D8ea3+/a5E3fvQH/7RSHC4AMddVWteUG7WHhTZ70y9DctKR1z80i/TIyrzyMyOP1VMRQIWRno9w5y2mCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766268219; c=relaxed/simple;
	bh=Z/CcaMqE2F9hQ373hh+TK08NHmxmRfaRGf+PqPGAoTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SN0o5oeKrIq/9TqnqETTUCdRLGOHenTNL4jPF7/6UfYPMnxUAgH9jtBzSsAMTYlyNuPbFt1TKumDTak1NRloQ+r64g2fnT5Q2bxcby5zAWCsUdguWYnTV9DZfSaiHAJOh0WP/jQ97sXOV9s5bzSsg6PwwzICoogmUJFd/qaoFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIHxvnvR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so3116322b3a.1
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 14:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766268216; x=1766873016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+VagBe28+HbfctXznw2EgljC1Oa7V0N70ONS8x29vE=;
        b=BIHxvnvRcZUaC1lLPMHLLDH4IcAg/wFZGxT22OkZeLC++E/FiLhIuwbUHNNuvAW3/s
         n4M4SzlFM/5X+pOoUtBN2f23G2Qx/3xWd61zcWc94sqtkktwjn8ur0Kd3y+1fBIOyOpj
         S3N6mS67nF7Af0Rp+InfYyApNDzB5xji+oWKItWtbDIpZLhisdW2Cl+sZbWaqHyFgo8e
         Q4twBFKAea0/pivcbocFhNfktumai4q7v2+dlOO0xrmnHFCMq7OEJ1z6WZQCHZKjASD9
         HHfgZL7ghFDbob+Bw1BncpbS2tv8JZVKxyKuB7baLsfBs2jDpwr3E8s/L7GyqIetyvP2
         2ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766268216; x=1766873016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+VagBe28+HbfctXznw2EgljC1Oa7V0N70ONS8x29vE=;
        b=rPPvx03OtRDIEKzWkhAQWS9edoLhVW8qIE/b4mlFyTDrdN6UejL3Rvwr5E+VxM/aam
         WNXgIqmr26nYkUwsemBPwpJyWgkJilC045ztD9KXViDodUL/zvY4miVV1mr6mzQMMgJd
         wMvxcTcvvTOPPsSafjsZ/KiGXlD63G3ndzNj1ohq/8BRoJjgc1W96Y0DXXgRmI6wEY45
         acMinhD+JQ7ruDTY0/LDNmewdwYSygLhEwqOPaxCiZ5i+Vt+U+SYVI3at2u45CidPuWb
         Zw4nakurHLY4YI9phsFxwW6YLXgPH/fGjvCRfx2Na9Yu5deOme9zisu9RBGMgJ6uk82L
         nYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLCLsdmx/+rX+NpPw9u92iHGTz3N0D2HrxLymgBNXAeuz6DC2sk+An5fn8iQO88TL1N8qkoaaj15jMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyycj4SWimyk7kQP72aGrSlI0+YRA9mpOyC4GSqxIS2fmevjz9q
	6HTWbyHYiK7eKGaz010K9uZSPciB3UX8Drc6dGLz+tYnUhWpfGJ3myVlUVIkTQ==
X-Gm-Gg: AY/fxX7RbEb+ZtRp3GsDfCXl0m7w6yw0vw8eAbF0WtK2q5jXdj1iHYcNLfO2jvZnl/e
	fFTrNjNbFy8yz3Ff/iJWmIwjJZa65dRX1qGQtpK0d5a/cxYE2X9DeiUAC4PNb26LfoL7DJ2EOoQ
	kUBYG/ZnxoY2lBEj8TIm1eoV/j/MT/nMQNire8bCZ5ziZ50r54ok3pozzhfL1REn7TXuKgs6GMM
	w1qHteoNK7HrTszal2EyHqPl099eLOnkdiqFM7UYBOjrVP5jY/1JZBCBQ4JW1FgimwJF9ubGabr
	cN4olfhmTLtDRW2XZYWHcr5DvxaDNjvK71hqLX/Injx4cevVLV9P4auhizo0/w8wqNPDlhBhY2R
	njR8BxDiLQxs8ZAx4BvkEtuLu4RmWNrnQxZmQijhOclOSMpq/9IM0fdWx0+xW+EfAO9vTIHSttt
	XN9VQH6mXMkcLqCeGwJ6lvrw==
X-Google-Smtp-Source: AGHT+IHD0+Hy08F0BoxdPC82bOj6VLwI2/R2BIv1B/jwa4RcqT6yeUW6JFcApxTmDsVMSB+1P6jvjg==
X-Received: by 2002:a05:7022:699d:b0:11f:3483:bbb0 with SMTP id a92af1059eb24-121722c2521mr6731973c88.19.1766268215651;
        Sat, 20 Dec 2025 14:03:35 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm25010164c88.14.2025.12.20.14.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 14:03:35 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pavel@kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	alex.t.tran@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] media: dt-bindings: Convert toshiba,et8ek8 and ti,omap3isp to YAML schema
Date: Sat, 20 Dec 2025 14:03:23 -0800
Message-ID: <cover.1766123192.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts the dt-bindings for media components
toshiba,et8ek8 and ti,omap3isp from the TXT to YAML schema.

The series is composed of:
Patch 1: Converts the Toshiba ET8EK8 sensor binding and updates
the MAINTAINERS file under the NOKIA N900 CAMERA SUPPORT accordingly.
Patch 2: Converts the TI OMAP 3 ISP binding.

Alex Tran (2):
  media: i2c: toshiba,et8ek8: dt-bindings: Convert to DT schema
  media: ti,omap3isp: dt-bindings: Convert to DT schema

 .../bindings/media/i2c/toshiba,et8ek8.txt     |  55 ------
 .../bindings/media/i2c/toshiba,et8ek8.yaml    |  91 +++++++++
 .../devicetree/bindings/media/ti,omap3isp.txt |  71 -------
 .../bindings/media/ti,omap3isp.yaml           | 182 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 274 insertions(+), 126 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml

-- 
2.51.0


