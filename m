Return-Path: <linux-media+bounces-41517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D2B3F66E
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D383A8811
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157492E6CB3;
	Tue,  2 Sep 2025 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PgTmlKiz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C03398A
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797561; cv=none; b=tz/D8eik70aYOfZgXZDdEt3cIgmwPBTXujS5ECp4kVHvlbcXEtr2WcWQmpuhII4t3s8mGw1q3PwEXvDS9FTSaOX/TtQnMejnkQ5nvDvuJHnOtDkhu0Mn4v9kdDFYAT3XTBg+kwlWnDr8FFzKOzwC/961nkYV9taOp2Ahz/XW9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797561; c=relaxed/simple;
	bh=rvkRs/hHcWN2Hv7kuZnjCZWnKxCN2Fp/ZNHwmOgmHao=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RP5bKrQscJkDSXKGXYTbXCM+ltfm+XotqPuOA7LX+Y7zU0Qt4U6+HVfbUWjgCqmominW+6h9bBGM/sDmg3R/BQ4dYYeIeSJML6RvpyoAhrdASB27YJz71s9YxsA4pn1YGMBRpdG+4OkcPmX9yqD2kTL8GVptuBG7zcEC+8Rlwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PgTmlKiz; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3d1114879a4so1667922f8f.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756797558; x=1757402358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tDIao9XUepcqrCjhRvfzY5Z5X6vXPs4ReBppcxWOCqs=;
        b=PgTmlKizpsnYUrX3UXxfmBgKHrpPYSXvDJ7hAj9iG05yh2N6GkoKM0l8ZjKnJ+dv3I
         wPXznghq4i4MO4HO0FugHT0FnmL3zDQcbNtMCQDwXj8BLJf2bdUiF6AmJEy8JlbZ3kBg
         9aqfkWSY1ZdtxwjybPEy1HTo6lVP3Wchr5jLgPO/GiOIBqbfxBljHiLSZvQxANAFhhfv
         VSgRt/eqP9bSeYjmWHcjNN1cjDznLJIKFW6tUUsm8jQJn5nC1iZUi2kNMAq4z3Sg5N90
         dl1XsEiOVHdtK+5/8mtPNoebkIp5y3jWVSFuv9gtijNBWOFfwG/5wQs0+mfE1W0/4P5c
         jdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797558; x=1757402358;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDIao9XUepcqrCjhRvfzY5Z5X6vXPs4ReBppcxWOCqs=;
        b=JzAVF3TDfE++8fZwaToKCVvcy7a7NN6yIZ2px/so+X5BtYezijgCq6MGWywA7/930j
         OR9FoVIawys3FDzUufR5mTbVX5s5Zc9Az+4buEQSd/nh5Dn7f8pZhSiFntgdXq16SeiF
         Ohd+kngBPp0P5Fu1Fm+IeplGbi4OkmOxT4Ba1WVHdA6nRwcM2rikFYlxdA8RZYhjjmk6
         TGdF/UuQ3Df0pb6bczWccbXjKEDahTeWwBSZGuUzp6vYShfUeFA0N+rA97GfLe6K8fRu
         FnE67CUKbRJqZFYMwQ6Ek8tZsYPnwl77vjmAirREmfw7hSA5ot3F+kjoCBctmKRJUDf8
         MUNg==
X-Forwarded-Encrypted: i=1; AJvYcCWuayVOK9lp6OevuMAWg/fIAcaHlu8zW/Swr5d+lqiIGoDIH454crj7x+cAWxCOamS4DsXpDLhcrAdUVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRLT2eGHv/yDRqGdGzq8YSQx+KhjMJdCzfd2Wo+A9g491qEAl
	kvlOQgWvdiKv63V1Tc8FvBsN0CLGjk9K1ILo9iYp9zU/MR9R2QB/m9BMNSC6MBYHivysW3qnT6J
	vKD85wAACgQ==
X-Google-Smtp-Source: AGHT+IHSqK5iPFipnfJUNjs1NPHxkOC7yb3uaQ9NzgXE72/2G1oKfT4pYd9K2JEATUQ2mtLCAbIG7uuqymu0
X-Received: from wmtf7.prod.google.com ([2002:a05:600c:8b47:b0:45b:89e7:5038])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1994:b0:456:18f3:b951
 with SMTP id 5b1f17b1804b1-45b85575580mr85979125e9.15.1756797558265; Tue, 02
 Sep 2025 00:19:18 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:18:44 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902071847.2330409-1-abarnas@google.com>
Subject: [PATCH v2 0/3] staging: media: atomisp: Style fixes for vmem.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Style fixes for pci/hive/isp/css/common/host/vmem.c. First patch
triggers check issues in checkpatch.pl that are fixed in the second one.
---
In v2:
 * remove unnecessary line break changes from second patch
 * add patch to remove unnecessary trailing comments=20

Adrian Barna=C5=9B (3):
  staging: media: atomisp: Remove typedefs for basic types in vmem.c
  staging: media: atomisp: Whitespaces cleanup in vmem.c
  staging: media: atomisp: Remove trailing comments

 .../pci/hive_isp_css_common/host/vmem.c       | 111 ++++++------------
 1 file changed, 36 insertions(+), 75 deletions(-)

--=20
2.51.0.318.gd7df087d1a-goog


