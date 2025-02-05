Return-Path: <linux-media+bounces-25680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE8A290B8
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 15:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D70169BB9
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 14:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A84017084F;
	Wed,  5 Feb 2025 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WRrOIy/1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9916CD33
	for <linux-media@vger.kernel.org>; Wed,  5 Feb 2025 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766345; cv=none; b=beW2IJHk7DXksOVfgX4iP/dWwAe+6PrQKtATunmMuIQcncLU/5h41nLEXSaACD0tLRzY7D4Cg2CxmSIJadEqHPQGRn4bs/oR1b+weTL7kcWkwYC/gaqJiyvlqMNYYRiMWITBWMn6nZaGXhPIP0AxGPc8c5OwKf+qx9ci3RFEblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766345; c=relaxed/simple;
	bh=xN5tHfzpLYstbbdczvTm+2GebUFn0qY7h7C5jC3p/fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvhbqMXolyh4Al1l0ViqHFPdyX5kH822PJmn7hiUQ5MIpWfB682XCP0VCLGoLUD3R7gUc/UpdwYkFLo2xlcUCrg4/pSwpSTDvbe2DIo2H7IfGVoqkS0+P5ylmQizpSH0vexJY475+9V/a09PtikM5B8xNR7FsuQwzC3sx9IGMEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WRrOIy/1; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd420f82e2so88194876d6.1
        for <linux-media@vger.kernel.org>; Wed, 05 Feb 2025 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738766343; x=1739371143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOL+0B+M9f0si4E1Qe1axryjBo4MHSmTJAhdoaOzDIM=;
        b=WRrOIy/1brcV99ug9uAyRFccUaM7d3Cobd+pRj0MBAR8sc34Mz+EVB6/IKa7qApAEg
         jPTx6+WfR5yjO5RVG/swst7Bi9yjX5A6XQFqR7zFPdHZj13kJL34D3ezLS77TVAyxQpI
         TIuMHOgzocTuzzqlBb07ASOnnQgLTOaRhL4iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766343; x=1739371143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOL+0B+M9f0si4E1Qe1axryjBo4MHSmTJAhdoaOzDIM=;
        b=gsjiGgejua5S1Fz238tLSIsWSdSYkmMGSc6Jpirw/Gj+OPbUXOlXZsnGZqwoLKsQn8
         8anuz8XItObfFFNbDprjQvkdIUC6kzqs841BT2cTr8UK+roB5paTc/ZOUyXbZbujxDJ6
         ex2CA/LS8zXsfPjziimAdW++jJqCxmR6j0wsQegq0jNeX0YNVQe1sWJ5J/+qs/rCq/5a
         ciC+3QPGKd1rIBlIEnJpAxFhm7+bgz9PFZVSeP9z2mzE73NHfmXqebQLU9KeN8EQg+el
         BeWPooJH+zFmQFBAlQwXhO0WCiBrY0z3rQIxhQ/MfD1R+6vw5L6+OMX9ehkwfQqkGM/H
         6tqw==
X-Forwarded-Encrypted: i=1; AJvYcCVdRS8hSznw5geDt92Z5ImEEzOynPPhEpuxoFuXFqjy6NgyPDxqHdH6vecIwnXxWlktXYbzAo/jTSRl4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYhYYYkFoErjJnBopfKn3efuK0JGvbYhj4p79FqrkLUOgRmm4
	GcLbAGOWPRPGMZPx8uAP1owM5BMEVzpxN3nkIypEwKWLeOMBzHisFjhHTirg8A==
X-Gm-Gg: ASbGncvOJYEn6iD0S7lM67aYzBtFYFT9FpNURwY379VnV83EVT0H/V/gMcIArUNZWat
	OMklc9haqiqNw4lkNKv3XOPNycwpHu5555tOW2FIbC0epFG1nYV5UQIt8kp8JIRgvJxaGiYnoDW
	QikIZJMzME0Em1UdZhgwR1uHhXs/N8+5uoikH/vek16zJ+AWIeiE4O4NjrFRVqJx4oEJ4qbkpNK
	03ePCX7Ge02TIs5s9DMmh2Xg1BAma+pwnrpPSToibn8Z6tHCcouyXLYRRMXDc764deamOAMsUPl
	mpV/2BAmQ/hQyd+WBcgsa1esmoBODCDT4n7M9EdGwnKDs+48+nTmGT3rx/4vQ2AhEj6qOOs=
X-Google-Smtp-Source: AGHT+IHgSo5iJPKUOIAwqfPXPBCcXD3z7oySdMdGq+1QTZ2AA3CEnpY5NVaQIYUZ/8ucBJbTbUDDNg==
X-Received: by 2002:a05:6214:252f:b0:6d8:8e0f:8c03 with SMTP id 6a1803df08f44-6e42fbb7cc9mr43024696d6.18.1738766343034;
        Wed, 05 Feb 2025 06:39:03 -0800 (PST)
Received: from denia.c.googlers.com.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e427cf664fsm17854526d6.77.2025.02.05.06.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:39:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] contrib/test/test-media: Increase modprobe time
Date: Wed,  5 Feb 2025 14:38:11 +0000
Message-ID: <20250205143858.14720-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have seen some situations in CI where modprobe required more than 10
seconds. Increase the delay after modprobe to reduce the test flakiness.

Ideally we will find a solution that does not require a specific time...
but that is work for another day.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 contrib/test/test-media | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 798de2b9..20290291 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -209,7 +209,7 @@ if [ $kobj_rel -eq 1 ]; then
 	unbind_time=10
 	reunbind_time=14
 	rmmod_time=10
-	modprobe_time=10
+	modprobe_time=15
 fi
 
 if [ $unload -eq 1 ]; then
-- 
2.48.1.362.g079036d154-goog


