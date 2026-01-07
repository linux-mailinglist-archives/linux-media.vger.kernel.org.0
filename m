Return-Path: <linux-media+bounces-50141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EECFE1F0
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C581B30A0B13
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 13:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB560331A4A;
	Wed,  7 Jan 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpCZhVM+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692453314B8
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793749; cv=none; b=lskO564tY7nV0Ks6gED5Kg5ZbLMQhYqqHMzkFzUOHVU/iYQjimQfDpuR6P55SO78XMTAA1TSpK8iWV5XpYeJEfqFtEg5tZ8HVMNtb1fqlDgb5kGeU4MEJ9HScA9BfVd4VekekMK9+8LoZf6gLN0W18KhQbvxshwdgW4zHXKKTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793749; c=relaxed/simple;
	bh=PIgdhokxKmOQqn2YJNx64hxKMduQw5sTcwbexWtt+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIQWaqsciuLaYcNxo8zMPcix/VHDGfey8pM5morl62PhcjXH9Gyska9yiB7dmH639lGfomZLpEoD5q55acgZjMi5y0Zbw3WdqGc3/n8yWup8UASw41zfPdDF7KmHFvWNdKveQnQE7x5vOPcVhXzbk4Z2LX8e2hU56hLVYnhxFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpCZhVM+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1410130b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793748; x=1768398548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=NpCZhVM+IsYfg3nv/pPLc2NwlFssxWOA2zJyADY7xR6yVawqq0Y1WcU+SaQHvXd1vk
         sQs1w9odn16OuSIzG1gzCv8Gdte7ncxABVXi4kQUHq6UEk4KhIndk8zXGL46EJEy5aST
         ergrZeBS51xPkVE0MNYIwWpl50Pf+CUZw6yNDnZ0jhzxZ2lcKud7i+bGgko+tbIddxBg
         bBvfsFd+EjuZS3fJeE2NwFWq8ndLPusxEOfAOhhi0hnuSq0cY2z5PJEwvLEghkqn9JKV
         gyEBvX5iu1SWGKkj2dlXBBQLmzYNC+ka86X5ySmKkTNUZ5myGXPLebwiPnEDuDlFWzTr
         +peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793748; x=1768398548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=HF5+UnAjr/YCwqNPxU7qNDJTmom6zI7G5uKXMAim2gsriCK1XkBOejO2ozpaR3zOL0
         ruCCGSvRMzMJljtdWvtE8p7ucVboHH7g7/rZKkCbpGpvJKzoz5t4Vyd8KNAkvi5cZP9Z
         mAvlVH78zMsYy979fHFLHZzR1NH3uuWmprQre0932UQRFDFM23Mc+EE+ZMwwBhEO3Wuw
         oNFYpO+u7KJ/JgSwGO4rlQulitZFTbErm8ggPpw8wrF8GQ3bFXsRPs1inF7IhA+FTItx
         o8vWgeVD4Yzb/4yFsHBpFxtQjtFRmgsrzSV1JEsIDzBnd5ciRuvId4QnPF6loDfa/mGz
         p4WA==
X-Forwarded-Encrypted: i=1; AJvYcCVfOBRPz0taG66+8y7/ZNl4jmoUusiqOu/WOarbLbBdwOEHvKC3spose4/eDlNOByaou22O6FuaswUj4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5hZN+cMBfSm78zI2/amC1YoJYFIXg6pU9C4vOX2blIYJ0GwLS
	RXcPCNke7HCZ7qyClw7VmoZ6H3pNRw6PHejyCgkSIpPCxNuaqU730aH7
X-Gm-Gg: AY/fxX5mh8vwlIjPbeRjquwqAmPp/Uc2WEZ0AlL0A4IpfdRCnVdI8xdYEQh5Bkr8FOW
	VU8xPd6jzD/CPj8UkMnswZq6RT5Qeo/yC7UBtVKje8nB3JPF0TXHtvC6//lWprxmiqsV2UJwh2Q
	78Hk0fKnhvzicljezjbHpraqjPGAANDVKlfeh+YJAPaOVIi3nvJM39zJnBA4gLopXZSgEM03MQ7
	qA7sEho1p5b0UtMDEbJ5MZwhQGt6lJZC7M4y4od7vUt76fKxP24jrAIeUMBMj1xqbeZskzL655x
	BLp8cvvUUQ2wjwSYY+hkh19jZM4xhskaTkGDRb72TDws9CE1wtMMyWnt2TXDZZljoKy5Wh05QB1
	r9o461iFUt2qS5C4XujlQCoX3TERuNCoVV0SRo6KrxGwwNw7CWYGIgM5KxjUa3/t5pA6UtrXmZO
	rGcy9hnhHB1MY=
X-Google-Smtp-Source: AGHT+IGJdT2Ci0JP0VKzc3VKsEzWxo3Sysx3HJ/oNP0h/r1jSvEC0TGt4bis1ZBfXHQRRGgyfW+kYQ==
X-Received: by 2002:a05:6a00:32c3:b0:7e8:43f5:bd4c with SMTP id d2e1a72fcca58-81b7fbd2a5amr2389187b3a.56.1767793747571;
        Wed, 07 Jan 2026 05:49:07 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:07 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Wed,  7 Jan 2026 19:18:41 +0530
Message-ID: <20260107134844.68074-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses maintainer feedback and fixes build errors
in the atomisp driver.

Patch 1: Standardizes the 'Bridge' structs significantly by using v4l2_rect instead of custom shadow structs and aligning ia_css_region members with V4L2 conventions.
Patch 2: Introduces a helper function for statistics buffer allocation to reduce code duplication and centralize error handling logic.
Patch 3: Adds missing error propagation for IRQ enable and XNR configuration to improve robustness.

This series is based on the latest staging/next tree and has been verified with checkpatch.pl --strict.

Karthikey D Kadati (3):
  media: atomisp: replace shadow zoom structs with v4l2_rect
  media: atomisp: consolidate statistics buffer allocation
  media: atomisp: propagate errors from ISP xnr and IRQ enable

 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 142 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 +++++++++------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +-
 5 files changed, 166 insertions(+), 140 deletions(-)

-- 
2.43.0


