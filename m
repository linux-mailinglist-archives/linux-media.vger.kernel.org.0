Return-Path: <linux-media+bounces-49925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5841FCF44F2
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 16:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A579300C366
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2714D309DDC;
	Mon,  5 Jan 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKJ8C34Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7A6309DA1
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 14:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625071; cv=none; b=DSeknoOIDENpQxuqtR5PXWYm/8L+bT+3DiyV0KuwDrbLId3uvfSNmTnn8M/0dUDBJ4R4D8TkXsMIyhyCjEEek8n3JAdCGV9VYLZ8uPgfUHsEAEdbQWdryhRkvDAGNmtEy7Yw22ES1+IT0B2jGXR/hvp/BtGYdICuDqFAMh3isx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625071; c=relaxed/simple;
	bh=PIgdhokxKmOQqn2YJNx64hxKMduQw5sTcwbexWtt+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VfbWQqkf4cmuycDoAxeURCiK1nZLsh0HX39ZlP4TBUf/jlPr96CfSebQdrzubA6JiretmsWlaiDYG8e9KMUxEo0racJ+umwXNWpzNeZ5IpNZs+ug8wOUDrduyfxPmU55yw6R80QpPGpPCPwmChGQ523Z2xQkqsDk3g6fGlUSVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKJ8C34Z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c09bb78cso64515ad.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 06:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625069; x=1768229869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=RKJ8C34ZxnuIpN68TJ0r5KfKzToLvoH4i2y+/S59KY6JO5uEHKbalgEFfFootsNnKk
         LwVgZDP7FAOuK1OIPBiz3ihWP7JJFmpWiXv6y6YcSKQ/slEYuLuYGPBqUsBubEFiHxBs
         +68BGeiUAwS+kykFLcqFxcYylzNAeV/Q9A03GY4JrnwmnoEAOIKk5sd4X/uV0ZddWI9v
         FiWhvFZtd7SdVzOkbFTgyR9WBzGoNMOIWkWF68tzhU12FYePz9x2sqcanKBkW7Ssd2u3
         Y0xP+I/XACJSwZscw7r+9WWVMuAKmchaRBJcpWsHCTOXmvax3E3xiJ2JLYeEaiWxpMgb
         908w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625069; x=1768229869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=RXV4ZLFiZ0FV6ZHjUxoqCEFfzzSZrtOIZIpzqiAmKfv82EmHHSnzGqwf4cRiZzXrU0
         Rk/Ymcm6aGbUEwNY+huK09J2E+uqgxF370wtbFbqYCHlkuZvUL/gGaUaxBGcQC9Yjqsh
         He4DQTZJQeaK5PIXb+sHVPXk+5+RtQQJdOp3l9GGpmIap3/isdRRCO0IIM0kQ0ps6F34
         nbR0rfSx8ZOaGHcnW0iOzlxeBFa31zn0dm4LUXVVliEq4+FuPqrWsE+FN9nAhEHlLTZu
         29NJp7Bd8Kp7Dat4gc8UV6LnhlhrJYo57Io8ur1cwVnq+E7n1IIJLV0z9VRfi0zaJC5T
         /rqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHf6VgSrHDKy8bpcPviqYz7p81U2MDeF/FXcDiFjvEMYWmqqwySS01ovbcN6RDTJQ/lKkFqqWwZX5hGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIG4XD3tT+XgrtGfFS0Hs8enQzgv3N7Zy5pZCQyy2fm0s0hYp+
	1ADG2agYU/KdDG0/KRQctkSZ1AsAvUUBiEzD5dGR1LMu2gdfTfUqVwpo
X-Gm-Gg: AY/fxX6TRP5GVdcm2i7B68m5Oig4VSWKS3nPkWROom+hPM80wGwMxcX3cfUGVCVY2u3
	bI4QczHcqKrEcGsWH0hM6o2WdNN4OKNaWZI7w92gBuG0ou/dEP2FmJ3/JmhMjVaoux/L7ay+HYV
	ho0QVcWErGjENCcLCMO84MBBLTVmMpC78Ax74wf9aic9UFtjBgnU9m8ZsXkeiK3UQjoVCOWyJKG
	kO/HG+ZzXHLpcCMpQyVI/FP/XUil/PaN/+kf16DYC4pV+Kb1VCdkvsM/rre1KEgkMBcUYII2zs+
	+LIrixQiJxJNhCFUugtpSrwC+U4Q/ShOhRQLlSa+1HQTF2eH7RHs8UCexFHlucmV9RyN/jltlQM
	7C5YDdcsz+BJShCc8ScP9AAPr1eprrnfDArreSzSjFEue5M2HPGr55m/fK5AN6NgnXcAHtAFV/t
	TWtMAddPwV/HBpag2Ouuhdkw==
X-Google-Smtp-Source: AGHT+IH9bhTd8a5PTZAsdrcqR6Tk62oZsZ52+Tf7ZJ2jXCA76IraDDZerhlgKhUX7z3DplqKSOR0sA==
X-Received: by 2002:a17:903:1967:b0:2a0:971b:151 with SMTP id d9443c01a7336-2a3c095613amr75717105ad.2.1767625069442;
        Mon, 05 Jan 2026 06:57:49 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:57:48 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Mon,  5 Jan 2026 20:27:21 +0530
Message-ID: <20260105145724.37305-1-karthikey3608@gmail.com>
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


