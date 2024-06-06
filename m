Return-Path: <linux-media+bounces-12645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0A68FE6FE
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042C6B21234
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B01195B0C;
	Thu,  6 Jun 2024 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k3FKzFlQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE40F3D56D
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678872; cv=none; b=o6HUHlstpdNB3ng5R9qJFiSYN/IYJDtTLWX08vXn5PkSInPdD+jCs6VbRwXetx5Y7FoGx5tjM0XflVYdVeWND6KsRNMK501BgKBD8eoeTaeJ1e4FtDZn+aIYpXst6JwopTE6fbf5HeTHTKZWMIiSOiU1rfM/iOqqp3+ad0wDryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678872; c=relaxed/simple;
	bh=JuUsKChiLT+vfrAvapauPrs05KYeEB5xAXVHns6YIng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZM1P/rYvYOb4ORcAsKuVU7uqUVqEJ4HgIuHoGEVETUVdkKZtNvT1+YXIt7EguCCU/KyzvFqfD+KUx6l3nuVaBLrWISCU1jd5Za+9qjvm4Z6/au6lfSYY3H1NBty2nBPusFXSYIVN3MjaWJgF06HRjr3dOU0q7TdS4gvC2t+l9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k3FKzFlQ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7951cf70432so63068185a.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717678869; x=1718283669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+/smkBmATmw+XKww99raJg0ggR9T5aTjmAVyB+/Cqc=;
        b=k3FKzFlQkT4qoDF1MvnbQBlwu4mdk3vAeS7I0HAqYXVlV3/T7VBvEAkp+OP9DDDfUP
         yhf04BuTLkeyjtWQcGDA/2wRKXUK4/PaRWmoy2RoWqwQls8dJMCAkZnYnXmj/It8N7fk
         hZWfg/fTVqzP1mwHEEk1nVMqiC+sIsiE9yvEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717678869; x=1718283669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+/smkBmATmw+XKww99raJg0ggR9T5aTjmAVyB+/Cqc=;
        b=cxw9yQhNQKsgpgOq525Ppg1Lxlm2CePncshNNIfURc0EUbZUzSkcO/YpSn4FSBtGCg
         /ae3HIyqLNboX8hGIWeP1hqk87i9uVmFqBzHRSlfbLUY4oNwNDQLRkcLfnTfj9o0y9A/
         bGcrtQteSWa9UcHM3GOFtd0nVG6v5gP8c42dlNFvlSA5Uo10BaHSVr2d2gFp1GKm6Cyw
         zrRYcKgIbLHF0+l1GDhmbKRvvvH3FQhI+ek6oiezhc6gfQUy+0fJ6CoKZwTHPEi79117
         4Doo3aScFx9JL5eA3zInha/Nqsh0EBR/AuU96RyUTknxE6pM/MP9Gh8CksKWCXnmgOvJ
         NI2g==
X-Forwarded-Encrypted: i=1; AJvYcCX36LMpMJl/9GWp6XTclsJvI9Xto4dHHtVsSN8E1L1UFMPH46iaX35HGfkyXzsrF0YmjQ+LF3z3j+q8IZnPPGV8Lerho+0Enk7JTI0=
X-Gm-Message-State: AOJu0YwGDTKeHtYuRWdrRZwVBRjavVM6/qFQBeRLEhdzGBxb8Httzb5z
	PV596a4bGkFMo7KBd+4nDc0r3wtpqai2a6YJrDD9/JyI+f+sRLzfoeWkUxjqj6n+k5J8mvlCytg
	/Sysw
X-Google-Smtp-Source: AGHT+IH6JUdnRck7CPLLbnhrGIHcZXdHdRadjMOXloMShAFg/P7yO2dY07pA9eCBWDpCwxUBYv7E1A==
X-Received: by 2002:a05:6214:5d8b:b0:6ab:83a5:195 with SMTP id 6a1803df08f44-6b030a96731mr59407256d6.41.1717678869377;
        Thu, 06 Jun 2024 06:01:09 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6c4022sm5998646d6.51.2024.06.06.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:01:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:01:07 +0000
Subject: [PATCH] media: c8sectpfe: Add missing parameter names
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-c8sectpfe-v1-1-c4b18f38295d@chromium.org>
X-B4-Tracking: v=1; b=H4sIABKzYWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwMz3WSL4tTkkoK0VF3TNAODJEsLM/M0YzMloPqCotS0zAqwWdGxtbU
 Au5rR9VsAAAA=
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

clang 19 complains about the missing parameter name. Let's add it.

drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h:19:62: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406050908.1kL1C69p-lkp@intel.com/
Fixes: e22b4973ee20 ("media: c8sectpfe: Do not depend on DEBUG_FS")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
index 8e1bfd860524..3fe177b59b16 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
@@ -16,8 +16,8 @@
 void c8sectpfe_debugfs_init(struct c8sectpfei *);
 void c8sectpfe_debugfs_exit(struct c8sectpfei *);
 #else
-static inline void c8sectpfe_debugfs_init(struct c8sectpfei *) {};
-static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *) {};
+static inline void c8sectpfe_debugfs_init(struct c8sectpfei *fei) {};
+static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *fei) {};
 #endif
 
 #endif /* __C8SECTPFE_DEBUG_H */

---
base-commit: 1aea3d1d4a21e3e7895663b848ffae79ee82e065
change-id: 20240606-c8sectpfe-5f00b9867f36

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


