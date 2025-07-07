Return-Path: <linux-media+bounces-37017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E7AFB592
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90873A9AC4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E37D2BE027;
	Mon,  7 Jul 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeIcxo4T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3939429A333;
	Mon,  7 Jul 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897405; cv=none; b=h9Rrf4WSrI+WPRWevJ10lKJ4dpV7hv14kl6Ok6+I/MVNsDR4e0YVY8F8UcWQ0gWxSi5tmx/ld2fw+HUhBo6SxDLIG9cx073ujnrg1eGG0LVsM8HP2vRvJggDIYNiKkac0+ACqB6gY+BMP+49Tsl4M2SmanCCCFWGudPlNifg1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897405; c=relaxed/simple;
	bh=AHdaYOSI3SgombZBC8dmiHualEDlfjhpn8V0V/DgMuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TIA17NjaYAK+tfwR2bWWmVxFJ0vEzvnKau0XoBQAfKzn6K/9XhKJpo8CY0j0w9ojh7vvvLnRl2/rbLkEuL6ii1QWIyrO2ZQVp2dS4wkNycOpZMlg5gzyzFAaSTlD3juRmPgB9U5dOfa0Me4eSNaVS8Y0F5Z56y2Xy/aXHO45uBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeIcxo4T; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607fbf8acb6so558614a12.3;
        Mon, 07 Jul 2025 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897402; x=1752502202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyCqESTaPkXyHbkcmpNd2gMmLJmq6htwbjOFYD33r8M=;
        b=NeIcxo4TNkTSDXN+5m5PqEjmpBbfJjlJaW9RqPENnTc8Ab1C+VxVOXScK2qX1u4Npv
         CzI8jfBrPH7SKK7YyXDBuEEKr1AxQgo4Juh6GOYMAht8fcghP8yeHICCPJE98G0gmt5M
         FzNozQQeqjOoykFvdaxXEI/RUDYCqLkNP23lJFnNssFuHLcGzBJaS7Drp2hppcbvbKP0
         jQL1ZVEXXxkdlcXons8PGiha165zaA434J1B+QDLJi6Rds3I1VSd2Hu2bJUOL16JCwNZ
         C7Ms3duvi76pZQTDAygf7DRk6exWL9QfPjKp8nEa77phGeXRlLfkkruQ8QUWMfJcB5uR
         tmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897402; x=1752502202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyCqESTaPkXyHbkcmpNd2gMmLJmq6htwbjOFYD33r8M=;
        b=eEbZ0bbKyJPSL+0XIsnOUQey7BxU0axAuwcOQ4TLaid1VBA/zr6xMCzOSVzHHP5cxc
         ulDJ572cFLrv5uNofQrM6mX6LCwmWlOw2X0gW0rjI3Ypuc5qWsqk3RLTsLq8/vZz2adC
         UlbezjzX2HjjQZ9aP50HsZit1Xojcl/IkPGNF3pBO90q9tFBRv7+Opr34r1qpOjN1Jsf
         9f/qgfFPlJ/hlUNo8AtjBiOoH+j8K+9T1aH2uSKE+YzIrqjXDdj3KwztmFufAKTvx2W8
         rWPzsmvkjA8YIcFr5c81lSdXE9Fws5xQj8b8hsl5fQy6DMMoRgopZfZRUIRm0PKZTk+n
         8H3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv7PfRd13z8T30fmSehKw5mJSxYGtmOreekwEK5ovqUJLCaMPjcCFz6y3wYwhNI+B+hemBAtCiB7i+a20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww8bRrQO7pUXje9UUa2Lm6V7NJPrejz4boWHvEZYeAlJQFZofa
	m77x0NgXzM1OtrcwbvBiErt2IXohL+E68MNoUDVST2oQKHd85ine1yeB
X-Gm-Gg: ASbGncuMQqUUoOrXN0HTFHB6CTNwNajMAugr/e7lmE/ADc8ML3cfDtKsalaRj5pu9Wq
	jPpSBQJPn1DtBsIfafCS8unA1BlNCzJfWYLxDvimR73cWMZjH2tU0ASzUQRRE6rBUMNJpOvdK/r
	IhDA6GC0cmdY5nnMtOlJ1sny5lpENerp2xm3YFC8eoE0NGp7JzRU8oEPkpSqTEni1kT+zBcRCB1
	vc7icyI9SCPls7/YvKaDLzeuaQsHKMlkuQNM6goCCwYhntOHJ7M0HkJYojbxVQykG97Sd8udIyV
	VK4ulBkcxO+R4uY0URKPYQXsasmzXD/FqmDjQMjeHCWpv+c6wLR/EcLgdFW4pk3ep8m2EvSxi4B
	fvYjK4/GQ7A3IEOoSww8/vesXM+Y2/U+dJI4+/yBpqxnI3ownrmv60GREYvpZ
X-Google-Smtp-Source: AGHT+IFoyq3U+1/o3AJhEJGB7FOf5qPE24zYohu/ZNZ7tgwRy0GsIfZj+9LrwSnh8D5/P/Tiid5//A==
X-Received: by 2002:a17:907:9443:b0:ae0:dcd5:ea6d with SMTP id a640c23a62f3a-ae3fbd57f27mr434916066b.11.1751897401998;
        Mon, 07 Jul 2025 07:10:01 -0700 (PDT)
Received: from yousrii-VirtualBox.hotspot.internet-for-guests.com ([82.129.154.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm710370466b.7.2025.07.07.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:10:01 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 0/2] staging: media: atomisp: clean up and unify HMM initialization logic
Date: Mon,  7 Jul 2025 17:09:21 +0300
Message-Id: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continuing the series of cleaning up the atomisp driver as discussed in
[1], This patch series improves the consistency and reliability of the
initialization logic in the AtomISP driver's Hybrid Memory Manager (HMM)
subsystem.

These modifications were tested by building the AtomISP driver

Link: https://lore.kernel.org/all/fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org/ [1]
Abdelrahman Fekry (2):
  staging: media: atomisp: return early on hmm_bo_device_init() failure
  staging: media: atomisp: unify initialization flag usage in HMM

 .../media/atomisp/include/hmm/hmm_bo.h        |  9 +++++++--
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 19 ++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

-- 
2.25.1


