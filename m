Return-Path: <linux-media+bounces-20027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66EB9A9B95
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 09:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96F9D283196
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 07:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979BA155322;
	Tue, 22 Oct 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TOgcEJ2+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2C313AA5F
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583799; cv=none; b=TinxCNSeM3SX5W9mCgVGALZ19isRzaFykyjS+zUvTTfZEMYGlYHbXrxjGdNL/y58tWmCvp9Jci57+BiLZGWvB4mESnpb7aPwe9OvHWO1fUK799r0134S+jPAf4fDLPKG94ZftI7YUnS8etPCAIxcL83FIbhnnS3b7g0vU7qI29o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583799; c=relaxed/simple;
	bh=2lRBrfehOJ15y+TfnRkQlhyh178yMK+KwtTFbjSZBHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cD2G4yiVGWiAuj8HTUMv49Rrc0HDxImY+rqofmBBMgMhImuSzlTVQYidQoNa7viernGzy8xrYtR7mL0f2j7x9dEQGjx8gVpMsZ5ayVhEgTifn/Y61qGuvLJSbvbWSnfdhmVZT8nvK3E0waCgERQtifBQWVazul87LL0Q869RK7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TOgcEJ2+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b14554468fso431389285a.1
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729583796; x=1730188596; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udkELYM0vawU6dPIqhfuh2a9RVnQuz9+NxQBwGXq2iE=;
        b=TOgcEJ2+O/xChpw7PWqlzjmWNNMOQ3L7iX09Qjz+fyghE2zpLG4R7LyRQ4avUqhHli
         0QcdpVMbz81dwWqWV5Pik1+L02hX+M5SWidyMowOa+GFY8vgAGNmRozVMRBLw1wzF9RQ
         g+WkIPfPEReFk8OfQZszgAYXZw0Lt5gl4k/L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729583796; x=1730188596;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udkELYM0vawU6dPIqhfuh2a9RVnQuz9+NxQBwGXq2iE=;
        b=IR7j4ZniJnb0uIiSH9V6Fv3Hcx9MJkQ6GRr9lMFx6x3Rc7fe+4S4B+gdCNk2f3Owkm
         Ct5JCVlFl1NRsV4NUn1PxKvE8qbbsylGI3Fbhnw1LVzE17dPHoluA+PiZl9+YmqXTRT9
         Y39xd14Lxs8T8tpV9yID5UYWM5HQsSKWoRyF7voRnxgCQqQHlJrj6HOK+FgTIytT0dY5
         RAEiRCV8yxsOZ2LXmUaow0PvV5MnN/xaWVnubpW7s/M6MSBbkXruiHZKtjiHxPna98aQ
         xl3LVspvxjKQY/lxdFQ+meKuJ5BhIqlXwsfInVRLcN5JahX0vLXkVvRFB9Kk91Pfc+1N
         0tzA==
X-Gm-Message-State: AOJu0YwpZDiI6Q0gKW8JFxPsRuDoDlPiEJK/zH6eaYIp0H5595TIkA3K
	lCZDkzJuQcpjzQhTHduw/uMvbGoEPCEwVoK+FgAX59+HKMmA3mh4/vLr/tN8Xw==
X-Google-Smtp-Source: AGHT+IE4spgDMp1wxzBzdeMtfxSIg2bUqyR3SakHTcnDpKDeUCAQMVpdjaR7jdJm5ePy9lL2yOIntg==
X-Received: by 2002:a05:6214:3103:b0:6bf:6ef6:22d5 with SMTP id 6a1803df08f44-6cde1507dc1mr182141646d6.17.1729583796474;
        Tue, 22 Oct 2024 00:56:36 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008fb8cfsm26486826d6.42.2024.10.22.00.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:56:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Oct 2024 07:56:26 +0000
Subject: [PATCH] media: vb2: Fix comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-vb2-comment-v1-1-8a755f3d98d3@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKlaF2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyMj3bIkI93k/Nzc1LwS3TTTVEvj5ERDS+MUQyWgjoKi1LTMCrBp0bG
 1tQCUDjizXQAAAA==
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Pawel Osciak <p.osciak@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

If V4L2_TYPE_IS_OUTPUT() the information has been initially provided by
the user, not by the driver.

Fixes: e23ccc0ad925 ("[media] v4l: add videobuf2 Video for Linux 2 driver framework")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 293f3d5f1c4e..9201d854dbcc 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -231,7 +231,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
 			break;
 		}
 
-		/* Fill in driver-provided information for OUTPUT types */
+		/* Fill in user-provided information for OUTPUT types */
 		if (V4L2_TYPE_IS_OUTPUT(b->type)) {
 			/*
 			 * Will have to go up to b->length when API starts

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241022-vb2-comment-f5e93ca193d1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


