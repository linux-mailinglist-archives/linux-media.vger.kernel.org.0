Return-Path: <linux-media+bounces-15487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F39E93FE57
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A7B91F23A3E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD4E187850;
	Mon, 29 Jul 2024 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM2jHY1E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6985947;
	Mon, 29 Jul 2024 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281841; cv=none; b=GKl3Qz/KucaUQ/eJdvwQ2MDRBMdpj+PGr/HeUGe8RPH2Qs9aP14s6HkjweAwfBqaUVQl5qILv3LmRkrnw5VObiHj1G0a6lvJtOevTCGXbDSoTG+/x+CZ1rSjfQ8Y50QnRmn8OvRxtVcy5ceT8utc39P/+/Q7xIleFaPC56EQ7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281841; c=relaxed/simple;
	bh=LCORYeVlflXkOjglnCPySK2fkldz9zZ7HztJ0LddbGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AaW/OcUT23Dudy3Fhxp0uMAcJHHzJhk3KQBwbOxgZw15OHMeYLOfk48h1BhRNwC70Iy4RIHQbZM6dQqfTtvU16LvXrbaAOGBOEDZJSr8karLziqZA/UwxCTJP4mAJSBAc8k6++xxnu04JOIKE9vQN3nHDK7t1UYQgOnP2lc6WfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM2jHY1E; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso432603a12.0;
        Mon, 29 Jul 2024 12:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722281838; x=1722886638; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8bcD7sYCuZXN8k66akd/roWt2jjR5XOinRSX3gx9Ls=;
        b=VM2jHY1EVxZZlQs/SQLDGu5Z3+9LNWbU+CmSnulPlLnePYTF6CQ3P3+7sUiUYZSbgu
         Y7wQrunrgf1UHBciP4N6L2qsmHD/WzHd9CSKX+rM2604cc3eUJf0e4nfvp0YWQOiltbe
         /8TmLZE+nwJOMum8iteVfD4A4mK6XZbxLAA4yjCFg5G5FaQ6+6WfGdC0HT8dHhSaoNrD
         hGn59rbHPda3c9Nh0YZnUV++oKWD0UdmUYIcabKA9RNb+zDHPMGpFsZSnVbkMNqtDPIP
         GAWNiTc3VHyUKD297H54H9REgGbo6Eb9DF19pkyUZytTgwFTpbEeo1ceaTD1/4GxoOs4
         JPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281838; x=1722886638;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8bcD7sYCuZXN8k66akd/roWt2jjR5XOinRSX3gx9Ls=;
        b=sf8TfG6Pq/usRReHkJjXj5PJ/q/wd/RwxSwMMoxEq1MqG+YYBs1MVG8FjnbJVpJ1LM
         9M1c/QX8royWX1Kalq2n2SwPn6iVI61c167H4GvVvKQ96QHaaCLwnQ67PSzZ19YZC9XC
         YTOMKHGco9OhOqB/+84mfhjYNzmNbKI5nr8t26Ww0ETVOdw2LiPgrljIWmkucYgFQJk0
         EjQENPdVdIRH+jDQ4jvn6JlCY141P7hZz+BU7PFr5RlTnVu4sNMKjerwBMWct3q3Ww8/
         tojRYBZsKozKJmIz0SpSKaQ/H7ogEfLVNavr3V7AW0+DgIa5jnNMYVDFi5dmdPf6K8DS
         qh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAWhuCPprbG5aJDn+jrDh0bu3fB3OIyZzTQAwjWGqTgi6RML1eiJqc7mnQahG4zpKdg5tUKSFLtJ14bpQVDxtnW5eMNxSOCyuMxzH4
X-Gm-Message-State: AOJu0YxV5HL8mhNFFitfNl1h/evVdIHGzLLccz7t9Epri839l6BFdkP6
	vc3jG3qhVrBTDfy/F/C8zo3M12gNerVRW4eyWRFcuE+oAhxJJFG5puLtYCjq
X-Google-Smtp-Source: AGHT+IE3TGeDq6r0qvFD9sMecuCKwfCfVnw67JnHguzcw4+vXq5l0ILe85+uM4dzHRVN2tXqp9gQKw==
X-Received: by 2002:a05:6402:5202:b0:5a1:2735:2378 with SMTP id 4fb4d7f45d1cf-5b021d221c7mr5861850a12.30.1722281837335;
        Mon, 29 Jul 2024 12:37:17 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590e7esm6115750a12.36.2024.07.29.12.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:37:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 21:37:13 +0200
Subject: [PATCH] media: docs: Fix newline typos in capture.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-endline_capture_c-v1-1-cbadcb512596@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGjvp2YC/x2MWwqAIBAAryL7nZDSA7tKRJittRAmWhGId0/6G
 uZjJkHEQBhhYAkCPhTpdEVExcDs2m3IaS0OspZN3UvF0a0HOZyN9tcdCnnXKWUXK2SLPZTOB7T
 0/s9xyvkDtumY7WMAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722281836; l=1770;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LCORYeVlflXkOjglnCPySK2fkldz9zZ7HztJ0LddbGY=;
 b=kmTHM4yKazdJHoX5y7TQJgzaNmS1jJMjFTLLvUTuGnmTr+Ffejp3Ale/m/1vFDHYPZ7m6WCqG
 KfTKoCshCgPBA5qLMLI5SJ/AAZOGC10v7vhHM4+BlyqFNfPrAwbAwgX
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Commit d7894721f73b ("media: docs: Fix newline typo") aimed to fix the
newline typos in capture.c, but some of the typos were not fixed. Fix
the remaining newline typos.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/userspace-api/media/v4l/capture.c.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/capture.c.rst b/Documentation/userspace-api/media/v4l/capture.c.rst
index eef6772967a1..349541b1dac0 100644
--- a/Documentation/userspace-api/media/v4l/capture.c.rst
+++ b/Documentation/userspace-api/media/v4l/capture.c.rst
@@ -333,7 +333,7 @@ file: media/v4l/capture.c
 	    if (-1 == xioctl(fd, VIDIOC_REQBUFS, &req)) {
 		    if (EINVAL == errno) {
 			    fprintf(stderr, "%s does not support "
-				     "memory mappingn", dev_name);
+				     "memory mapping\n", dev_name);
 			    exit(EXIT_FAILURE);
 		    } else {
 			    errno_exit("VIDIOC_REQBUFS");
@@ -391,7 +391,7 @@ file: media/v4l/capture.c
 	    if (-1 == xioctl(fd, VIDIOC_REQBUFS, &req)) {
 		    if (EINVAL == errno) {
 			    fprintf(stderr, "%s does not support "
-				     "user pointer i/on", dev_name);
+				     "user pointer i/o\n", dev_name);
 			    exit(EXIT_FAILURE);
 		    } else {
 			    errno_exit("VIDIOC_REQBUFS");
@@ -547,7 +547,7 @@ file: media/v4l/capture.c
 	    }
 
 	    if (!S_ISCHR(st.st_mode)) {
-		    fprintf(stderr, "%s is no devicen", dev_name);
+		    fprintf(stderr, "%s is no device\n", dev_name);
 		    exit(EXIT_FAILURE);
 	    }
 

---
base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
change-id: 20240729-endline_capture_c-6699fbf125e7

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


