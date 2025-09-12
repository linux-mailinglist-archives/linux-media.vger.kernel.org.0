Return-Path: <linux-media+bounces-42386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888FAB5411F
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 05:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DAFDA009E5
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 03:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A4F258EF0;
	Fri, 12 Sep 2025 03:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTQf4vJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81652DC775
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 03:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757648606; cv=none; b=SMSbTtS9F+TtidYrliVDWEc/IaMB/yfagUPd7oR19Iv9pHKPOaPZlXK5rXjzVT3sYCtrdFFy1dUVTxaimMLVSgtvczTOWff+8qgbBcltxZvTwchqQSKAXoy5BrNyULahhbCxkY9GZxPWK1uiiRBUyTlh82MIeae1XCUWLKxjpJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757648606; c=relaxed/simple;
	bh=35wSlX266gaKLx/MSsHga3vC2Zd0iWKkBkTcazHzxHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=haEIEggbsokeWw/Pi/pYynw4uJVxz6hEnqM3XZl1pyJAvvCfCdm8E6L53D9pFbw4BLhYFDHsXoknFlpwlvC4n7/GXb+ZOr7cZiB9KcGRiVQdb8g2SQhSCMABM3nUMfPUI1FeqywuxaggPNbBRLibAINGsJEHXVavErW1wtgQhkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTQf4vJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4fc0249e41so96606a12.2
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 20:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757648604; x=1758253404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLWg4udJEdEij218We1XZYSmyVzBKbwMh13lO3qxhnw=;
        b=hFTQf4vJE4eLqXECq6Uh1D3OIyH2xfC8wlj8ZTgq7WD5qi1evrz8vzMdb8MK66x0+E
         vens+OvRFYV+tgJgggI005wTPZD9Y6Laiel5bi25UatrImT6SEUC0C7V+P/HcaTCczQS
         a3OF1ZFjPCmUCoTGJFsB1kFn71egCPZZ826iGtjfygNK/osx9Ya1W830xZFGnC8AL44h
         lswLuh8QCsqiFRBEcLx2AP0dcziMcSsM4gWpC97zCEokZuWnHVOu85wuyG0ElNglJ4jE
         z6WenrhCN+AjM3RBbpAW1ezRxY6/Gkrd/i8+FlIMBaLkcIHR9XR3ATgbeuIDqJTimpyV
         uRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757648604; x=1758253404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLWg4udJEdEij218We1XZYSmyVzBKbwMh13lO3qxhnw=;
        b=MgwQHVuS6/LLSE7TNTWVwxWoTEKTrtCYx71pKt+3PzErDpGwlXUyvYPGVvUk5chL4w
         E0qWsF/ssMQdfFQNP6lAGW5TsJCwukvSyr9d59Fcsr64OJi+PSK6PHBWlRRBUwGO6+2x
         +Ph3YrLsx6ipAFDfkMng2ZdAHjOfBbGttKgJn/wWBjqZXH9QiGWIQsTU90bKz0rBiP93
         dv+tlAqefXkqs0KRsTkyQmCml093bguCVq/rITRnZ6NeUjBsWFILZuNcC+O/+aOzI6Oj
         F6cyKg8MAm+DFUy+tjsHBeUhH6t+yOg8Ysis73G9oajoInrbYEsqp9oV03Wkn7al857L
         +KPQ==
X-Gm-Message-State: AOJu0YxfcHdG+WEoIEezXyERyKfhDovcYFME6NiQVc+H6d6i6A7l7gWp
	xD5cmURYPnW9jXrBlT6rZbGDekEWsBHrfWS8SovUWcnrpY8pIYY4cU2/kprQXLqN
X-Gm-Gg: ASbGncs6T08I8/QpHOrd0PbT//7pRuVVtFgKbuXDJWrfOrYc/MKrxTkD79muWnP6bCl
	7sZBWRKzZ/25qsGiU2vQM6RwSqHRWkSCgUirkwoAckRs3Z5cr4A5kL+sVGPui0Evho8EteeR1/A
	2p+Dwa+y/nbYiweH8AKopFKthZs6nJLad+TMIjNn6YwOipKlv9939T9GlD0Ezszti47zHwTg8dG
	E0KX4pKbrxcMuvWBdhtjJgXZshZpA6txvDZzy7vqDqRr9zbrk86nJPpBcR0/BfrFAkCpzh92wtC
	2OK1bwzKOP8cb2CmaTZkOvp5g9Wam9mYkg6pA+WOgaVO+mM9VUWYofvA+7iyUqg55sCkc+qmmIM
	GUSt8z8B+
X-Google-Smtp-Source: AGHT+IERAt9/jfGALuZn+XgewpRrdWsPMMMR0znYkOofuPZVvPj1py9R+Yr1+KVGLJpsx1Q1q5Oq+g==
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id d9443c01a7336-25d2547e1a9mr8791115ad.5.1757648603659;
        Thu, 11 Sep 2025 20:43:23 -0700 (PDT)
Received: from debian ([2a09:bac5:4466:dc::16:1c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm3733842b3a.81.2025.09.11.20.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 20:43:23 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [v4l-utils PATCH v2] Change install dir of libv4l2tracer.so
Date: Fri, 12 Sep 2025 11:43:04 +0800
Message-ID: <20250912034310.493360-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default install dir of libv4l2tracer.so is libdir, which will
be packaged to libv4l-dev in debian or libv4l-devel in fedora by default.
While libv4l2tracer.so is different from other library files like
libv4lconvert.so in this path, it is only used by v4l2-tracer at runtime,
 and it is not a good idea to let binary file in v4l-utils depend on
libv4l development package.

Installing libv4l2tracer.so to the default libdir won't pass debian
lintian check because this library doesn't have a SONAME.

This commit will change the install dir to the same path as other
libv4l2 wrapper libraies, so libv4l2tracer.so will get packaged to
libv4l, which is the dependency of v4l-utils, and it will also make
debian lintian check pass.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Add how this patch fixes current issues to commit msg
- Change install dir same as other libv4l2 wrapper libraies, suggested
by Nicolas Dufresne
- Link to v1: https://lore.kernel.org/linux-media/20250911014853.323700-1-liujianfeng1994@gmail.com/

 meson_options.txt             | 2 ++
 utils/v4l2-tracer/meson.build | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index 1e4aa87f..3d04cfb4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -46,6 +46,8 @@ option('libv4l2subdir', type : 'string', value : 'libv4l',
        description : 'Set libv4l2 library subdir')
 option('libv4lconvertsubdir', type : 'string', value : 'libv4l',
        description : 'Set libv4lconvert library subdir')
+option('libv4l2tracersubdir', type : 'string', value : 'libv4l',
+       description : 'Set libv4l2tracer library subdir')
 option('systemdsystemunitdir', type : 'string',
        description : 'Set systemd system unit directory')
 option('udevdir', type : 'string',
diff --git a/utils/v4l2-tracer/meson.build b/utils/v4l2-tracer/meson.build
index d059eb6d..92deac31 100644
--- a/utils/v4l2-tracer/meson.build
+++ b/utils/v4l2-tracer/meson.build
@@ -24,9 +24,12 @@ libv4l2_tracer_incdir = [
     v4l2_utils_incdir,
 ]
 
+libv4l2tracerdir = get_option('prefix') / get_option('libdir') / get_option('libv4l2tracersubdir')
+
 libv4l2tracer = shared_module('v4l2tracer',
                               libv4l2tracer_sources,
                               install : true,
+                              install_dir : libv4l2tracerdir,
                               cpp_args : v4l2_wrapper_args,
                               dependencies : libv4l2tracer_deps,
                               include_directories : libv4l2_tracer_incdir)
@@ -51,7 +54,7 @@ v4l2_tracer_deps = [
 ]
 
 v4l2_tracer_cpp_args = [
-    '-DLIBTRACER_PATH="@0@"'.format(get_option('prefix') / get_option('libdir')),
+    '-DLIBTRACER_PATH="@0@"'.format(libv4l2tracerdir),
 ]
 
 if have_visibility
-- 
2.51.0

base-commit: 34aa1df2b23fb85b030cddf64c427137ddf04e93
branch: v4l2-tracer-install-path

