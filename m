Return-Path: <linux-media+bounces-14551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023392485F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 21:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26CCC1F23249
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 19:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8761CCCD9;
	Tue,  2 Jul 2024 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMdu04vE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645484A40
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948827; cv=none; b=fDA9J8hVTCUdyM7Ffm1m1YQcr24xjjDHk1XBD3jjThfZ/Wp/n6+5hTua8TosK6ffC09rRh5VjSt/XMdXiUg5kInEzzEB49wa4CVKNamDG4om9O/ck+Hnu4bc0XDW2ro5XkG/fe7VrVri0UgaFUthmPk2pACTtQ0NmbCTKBQihNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948827; c=relaxed/simple;
	bh=40st7mPKZij9jstwJzfHwLX45We4KAKNRTENmBiHm8A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UOq8/FTWtL/TKY6fdJgW8TH43JFuYijD6wrMfnM9FiGlrQ/9ZVvYKGwR/JEdACuPctyFMbznJnCJ8MVYe5l40tQewCrFL9hir43mDakzoxaGp8x5iOk+wqOLFyTIzgVmYDytuUUagYTcfU2mlbf6wRrmV4f4hGA65fCcltWnInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMdu04vE; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7515437ff16so1027712a12.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948826; x=1720553626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIowyqY6eNOt56QWbFHmTDApGZxYSpM/6yioPScisso=;
        b=IMdu04vExATHlwU3HIvQ3QHQhiRrPewz2OseqTfaKT/Wz3iKWhstaJqEhgYZNzsCWB
         FmtGRaJXbKUTSTkK5M0hto1UADZy051Lm1twMoQIKefQ/L1zfCvSEURBhGe/piTAk9rJ
         CNF/E+vmhvNRDEV3hXpFosQuczZjjOJMphEszddrLOsxLG6H7kxPIJjAvs1O6Esk/j1N
         UsHrNX0xpFYn2RSr3pGzuETMcR/aAxi5+8caPSES7zVO1Qj+U8fdus0k4cb6Hql7JFnZ
         tyIGDnZugDqVxjlql3ZA1H1dPhTZpTd54pjj/byRXM5vINu/fWtrLG8KVdFu0eD4iqWp
         pXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948826; x=1720553626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIowyqY6eNOt56QWbFHmTDApGZxYSpM/6yioPScisso=;
        b=Ak4ayOhTbUTP8fHNiXYWGg58gFpyOyf9Ia55IwuJy2WZJD/SvFfsuSa+nEAWBOhmTd
         8Ib7XCz/qUHNbeFou6E45DCtqD8THD1k0mwBkZYhSGKnSO7vTi+5iUZmtZL4SFNC8/+0
         lWBKVbBV/z30oEbWn21xaubD34fO7blm84iFttFWemkblVQku8Uz9u6SSVszAhTUts2W
         jfL+kSj9PsVcj2p2m4tRaySn2isIZmUaOdLgD9rYefLvR77FIHirJGkJjKIfjJrHGD+p
         ewuaoxDOp5B6CeR8hOPcC3aMeu/k3Q45pUGY8f8TzpN7WZpy145pVYiA8Dx+8kT5W2eg
         /2Lw==
X-Gm-Message-State: AOJu0YzdSbW5NFCEkZr23KVfzNvZNfD4SPUUYDZePlLL+ffQE8b25Vsr
	/k6TlwI0nB8VZlTqmCt5YtUrYZWHGH1jrwNkYGpHIA3lYemRR44k3L9mBQ==
X-Google-Smtp-Source: AGHT+IFv5k3bDIxwaM2JS6NZUbCeg9KRoxHRqKbYYaDFoXijCW/28n0nTizEnhSreE/ZmQD7ce7f1Q==
X-Received: by 2002:a05:6a20:d48c:b0:1be:d703:bc47 with SMTP id adf61e73a8af0-1bef620fba2mr13888550637.49.1719948825554;
        Tue, 02 Jul 2024 12:33:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538fe7sm88441795ad.172.2024.07.02.12.33.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:33:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/4] v4l-utils: fix formats under alpha/ppc64/mips64
Date: Tue,  2 Jul 2024 12:33:40 -0700
Message-ID: <20240702193343.5742-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike libc, kernel headers use long long for 64-bit types.
__SANE_USERSPACE_TYPES__ needs to be defined for the exceptions.

Fixes -Wformat warnings about llu being used instead of lu.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 900377fa..15b16971 100644
--- a/meson.build
+++ b/meson.build
@@ -69,6 +69,12 @@ elif host_machine.system() == 'freebsd'
     v4l2_utils_incdir_arr += 'contrib/freebsd/include'
 endif
 
+# These platforms default to __[us]64 as long. Add this define to get long long
+# as is done elsewhere.
+if host_machine.cpu_family() in ['alpha', 'mips64', 'ppc64']
+  add_project_arguments('-D__SANE_USERSPACE_TYPES__', language: ['c', 'cpp'])
+endif
+
 v4l2_utils_incdir = include_directories(v4l2_utils_incdir_arr)
 
 prog_bash = find_program('bash')
-- 
2.45.2


