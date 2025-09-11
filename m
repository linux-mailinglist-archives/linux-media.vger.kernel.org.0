Return-Path: <linux-media+bounces-42376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6067DB538A3
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 18:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CCAA587893
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 16:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E1D35A2B2;
	Thu, 11 Sep 2025 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlwUJn2t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFB3570AA;
	Thu, 11 Sep 2025 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606622; cv=none; b=eukq72YuUDEXOYL+3wc5jH4V1ZAQ/i6QRp/5N/0863TZcafXzfAkMvrh3tETu2gkOoBOGgBcw+CH278dfkTUSNbUi/Q16LknYAPIanBSzgKHxnq6CZ/r1zxZHatRiTPZPmioDjkoGfVkwQCmevGkkyh03YtLTLljWPJx5sa7Jl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606622; c=relaxed/simple;
	bh=ad1+GlOebaA4Dc7BMXCco+gstM8+RUWWlpqN5ZlppNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGQgIzuY7elsRQUI6ibptJ47BfarPkq020awTto3W9nBM87ejn5ScQR90Ii94f0t8TVwLMOWPmqFuKit0JDSMVi3SFxhD+eopzhAl3zSgVS0i2IMfYT77gbXNDILJU2fHkloWLYaM5wUn3rQvgaXa8Mt67soBogESFxP1HKmiWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlwUJn2t; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so8037465e9.0;
        Thu, 11 Sep 2025 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606619; x=1758211419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV+vM5AtMDqiziiosp5lKYMmFySjFk/a9glOkvxYm9c=;
        b=PlwUJn2tWhi/A9iRsILp8PW67z6MYhhtFtJNKZssdAdcnZqzya9T+tnhrBN2dYaOqa
         zSIuk5Pwbkt3WOcQH/St9i2GGIlgdBfkCtwB/6pyIRPr6U2Bh8HLnlEBhIAVfSwfRZOB
         qSV1bHwms1p6ydvzVlZksaPdvdBFZCzgDGGRa9JlDoqDVOa08yX2kDRXo3hdSP2wdpy+
         4DXBg98qji+BShDhFd4cq5G0++f61ovBNB03uFnd6k6Hmbcyr/Dxk7RkkFLYn+h9goFS
         eOpVW29piHuClLsuinWEwPKdMIkUXHQ7A5nn6QVixBqh6Qki+XctnW8tCmpvFo2u1gwH
         mm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606619; x=1758211419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV+vM5AtMDqiziiosp5lKYMmFySjFk/a9glOkvxYm9c=;
        b=qhwKPtxZrBu26lMrX/ot2L4mte4UkXApxn4Yx+0471S6i2B6hbGbohPNAypLN5pYj2
         UDXlP17at9lkKVfIvjwuQWgAVJI3i8AGXrobdOpTVsjr3HtVRqOPVzNK7r6chbKhWXXX
         Mi3+Qy5wtyeBAmI46e5+HB3NUfTjszztCx5ukc+rgyUBJub03DbVDeZN4tnMF/+WKJ7X
         EMAjkCjuZm1JWLSaWWXVag5S7rfUJ+lsAerB2QyZB8d+jQAvNv2NTqkAkJMb1FuLnP5U
         pE3/jcKmpBUpX/z9WKQ4fwnVjE//cYd5NLGngAbwschDfa5gfkMCe5Wv3g4pYhR/0P3I
         mgVg==
X-Forwarded-Encrypted: i=1; AJvYcCU5pBBm2jrcPreOu/urSNx/nAGxNKLGedpYH+m00N76uAEA2ORY8aAdvqJCL6hPsht6/ruSTbm6DyAq@vger.kernel.org, AJvYcCU7PxC/0jEdRZ4I+uKdAL1eVCUatrL99voaWOWNrRTgds1aXEEhhV5WkwSt3JcACRqd+Ya0C3fJrgQ+5Jg=@vger.kernel.org, AJvYcCUNgXFwBg5zPmLdkogE4H0qG89AMlvp2E3Qpqq3KyEjD48l0fydz2CN2/2dESdtxHVkyrj8d7tMvLKq3hUc@vger.kernel.org, AJvYcCUoy7mmWvwi1zr+r7vSHEKP7K3wjnZ9x6arfDNPMHvmjq8CVq+0bi3mKEOe7KJ2pRG+fzBSM/UU0yc3@vger.kernel.org, AJvYcCVubqL2pPpdOGdpbYhRJRGY7B0v/bUgGfqudznfjOJg7DObj7x80Nea/7+GyjRjew1MSzp5xSIjcQK/R/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaYu8YOG/X0zRSsyQAgekXV+/dvQqCAKGA1oe6cHd/VFRADLY
	pH6Kr5RmtlkvlDfJDRTgE0WE5/cp7gp9+557yvDikBExOlB/TZFUjYkM
X-Gm-Gg: ASbGncvzxIJRemoOHpzwVoDZ+iCUo34rlUA4o5cysD3BGpJoXRuGelqlxbJ6svg+zOg
	tvg9LcegXuDyUWZM/rRRLmjztR+nDwWlHydcru6bxpLJT77oIm6hwWoXKisl0Eikru40urAP5ly
	AHL4T/mjkpahil6nNxcNs/0+J4XCOBqY1sXcNybZoazrAvpWK/ut0bIhOtIr2pRwVWx4hcFlUel
	lyPhkSTRi2l/l465mv3toRushBK6QBUI5MfYzv5eXs4/pWXDfTuNNsx9fn1N2l+cV99fUGbbEy2
	rvrJ5dnFiAPm2HxHSvlQdK6v+Z1YLAomz5e39FZcd+Lw+48BhUDJawhWkAriQGwSnWmqgLGdMWY
	GA/oqzaxsYf0jHF0TwU712wEilhikX8QriRjspidEoJxkhdJD9zcl4SkkFw6rnpeQtrGMvwzkFw
	9UfiCCd6exMhokdA==
X-Google-Smtp-Source: AGHT+IFkmvpn+ZMkR/ME/h210TOWfj/zRgJxKTOHh3DWlG10Yj3oOfPv3c1/HhofEdM287nETYtnIw==
X-Received: by 2002:a05:600c:5d1:b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-45dfd5eec3bmr25128185e9.14.1757606618353;
        Thu, 11 Sep 2025 09:03:38 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e017c0643sm30454515e9.23.2025.09.11.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:03:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v2 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Thu, 11 Sep 2025 18:03:30 +0200
Message-ID: <175760648464.2794963.6510932759569440897.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 06 Sep 2025 16:53:21 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[12/23] dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

