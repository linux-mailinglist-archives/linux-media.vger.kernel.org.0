Return-Path: <linux-media+bounces-28249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E78A614F5
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FF481B63B09
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AE320550C;
	Fri, 14 Mar 2025 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhOJ7pP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B02054E1;
	Fri, 14 Mar 2025 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966208; cv=none; b=ZY1vOaYCVv/IS5TnDM6fjhKIYE2zwauip7MFFz2Xc6G8W/mZxEalv2mSu5wzFbZjhpvdOvGzBum8cEoVZLGPTAreQQdhp51RHmpYr/eikq4FK9giz58Nswz4hjI3gtcGRuTGrk7hA8A1R4hq5W26zoubpccTFKxLDPUu+I5t6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966208; c=relaxed/simple;
	bh=toPpkxJl8FMvhmsy8l9WkMOpYEAuM7iUbjuHqY+BG9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LiGlGp+tK47P7PvfUVgWZta9fVPqUlDUgzQ/ckF5hzpOWWMBfHzWAEGtYYsZFe2vZ2kIGJkWPT9IayvIuhNvkVPv7fuGQQrzgUlcXr5oGksukjnw3wBTPpYiM6fSpS03RhJ7owWuxhIIs8i5TFDc+oIG5utZRyQPUxiOu6M8Gco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhOJ7pP9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-307bc125e2eso24929441fa.3;
        Fri, 14 Mar 2025 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966204; x=1742571004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRJu9F6oeIlyyMlHc75x+Nx5qVxYfbRFzUDlgViYj1Q=;
        b=BhOJ7pP95sQD45Afz9umNvwawktaUa8U7ScfsRXkJKJ3reNBuKgGQsRgvGQBdxdw9L
         Dj21YJKly5H2bv5X1EZE1JH9zXlOCkWT8ilDDP7TgMbe8cEhziWItBcFT4eOYkWnkYXp
         HXUnNTdrEuw/41YUabh9v7mu/G++CEA8Ga+ilntlL7e9Vq9663PfmckeI/AqC6gaYIfx
         cZCkRZxEr9LrGeIZ+LYi7YgzbMq6dUjn86UGhhoAX+/OVse9Z5/KSmd2n2NmIoYbQjGQ
         3z31ndFFNzYTx+a1RvwqF31SRmyCfPAjjtQ0EL+HjeJ/75/lp+maPmBxck1Lnm1Ve6ev
         30lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966204; x=1742571004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRJu9F6oeIlyyMlHc75x+Nx5qVxYfbRFzUDlgViYj1Q=;
        b=amx+hQ+J6J6elRrbLbGQKO9MWtbvOJPnTyUi+K+34deWeWIoXHg+Ie4XGlWRAFgLNF
         wIUftIjU3vv7B9reRcU8j1106LFlYV2mjHmOB0msWVpK1Ix7oO8AdKlQZEOnHTCkv/x2
         x1X8Q8QzGTHPF9jy+zK9K/dZhfdfWkubW1wuNhWoe60UShY2nzhfj/MALEncj9dZzW+L
         wLeNHUOR1iHVYH0mK3LuNeTyt6Lxlkl5i0ImM7x3m/gQY7y3rQK5H1MCHI2GuEkUQ7Py
         XWQfK6rvvrPH2UfO1KKl8sjNpz4XQPWUEH0g2+CMGF3+fv2kZ3LkiPwGkA1yHKXCfsdH
         T+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyK9S74FcvHvRVTXpFaJcBYRsWucy60fmDJ6bKRLZKtSInJ2lccMwmzFa7Tf7lukaaDlbtKVUMNADU+2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWD8J45HOQh/n0EFyzm/oUfe8VAYS4as4uXPA1Zb2WoEouJCU
	gcQpT04t4i2En0wwq8DGZHSBSF4Dvy/GO079XgqS8WIsSIOUbMqR0KBukW0jPHw=
X-Gm-Gg: ASbGncvTITcEqC2ZRBnmjCC4+zgDrjdCEqCkdYIMpN7RZ2FdCnYhepTleicXT3yxy9k
	KbzgVwPFmrsnH7lXo8qJ3ZiIzvHaKsVIRswDgwOQzMdTdzsZEkOrbHfJrJvYYLcVKF4M0NQkK6w
	slItDX+2P8JrOIphZI+jt4sAA2Bt0gAxPFJXHki5/2R9lQCCrHyapdvJnkURnKZpwLds6L0j1PV
	QfI0SQNl5wGos3YR5RyOLzWvdQLZM7Ks8pcwWQm4BPkBajz2zofXYCulCQQT0MOZ1Aiis5XYB3L
	/rDKkg1Emuw/evEg0zWA+z5aGwInx+a3GJxeNuGjs42GkE80UYuPebsxNIDmrFB+70SWA/iv+jV
	//H8=
X-Google-Smtp-Source: AGHT+IGccm1JiT1tGFptYJa2FTw3siYRxF4CtXV9gO0wXSh4cN1iSwYY4QvDk/gzlZEiPUAuBusPoA==
X-Received: by 2002:a05:651c:b20:b0:30c:7fe:9c70 with SMTP id 38308e7fff4ca-30c4a863e2dmr10944911fa.15.1741966204087;
        Fri, 14 Mar 2025 08:30:04 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:03 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 12/18] media: coda: Fix loglevel for seq mismatch print
Date: Fri, 14 Mar 2025 18:29:33 +0300
Message-Id: <20250314152939.2759573-13-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sergey Khimich <serghox@gmail.com>

During decoding process some files (conceivably with
max_dec_frame_buffering == 16) a situation may arise,
in which after getting 'DEC_PIC_RUN' interrupt we have
"-1" in 'CODA_RET_DEC_PIC_CUR_IDX' register. In such case
it means that current picture has been decoded but there is no
frame buffer to store the decoded picture (this is a kind of
error situation). The documentation says that in such situation
we have to rerun decoding the frame.

On the other hand in the driver such situation leads to
sequence number discrepancy whish in general is not good.
Also for every discrepancy we get error message. But in real
user scenarios (playing video) there is no any errors
caused by this sequence number discrepancy.
Althogh there is no real errors, lots of "error" messages, in turn,
lead to decreasing fps and dropping frames in user space utils,
e.g. in Gstreamer.

The following Gstreamer log is obtained _without_ this patch:
 last-message = rendered: 17, dropped: 0, current: 33.76, average: 33.76
 last-message = rendered: 33, dropped: 0, current: 30.01, average: 31.83
 last-message = rendered: 49, dropped: 0, current: 30.01, average: 31.21
 last-message = rendered: 65, dropped: 0, current: 30.00, average: 30.90
 last-message = rendered: 81, dropped: 0, current: 30.00, average: 30.72
 last-message = rendered: 97, dropped: 0, current: 30.00, average: 30.60
 last-message = rendered: 112, dropped: 0, current: 30.00, average: 30.52
 last-message = rendered: 127, dropped: 0, current: 30.00, average: 30.46
 last-message = rendered: 142, dropped: 0, current: 30.00, average: 30.41
 last-message = rendered: 157, dropped: 0, current: 30.00, average: 30.37
 last-message = rendered: 173, dropped: 0, current: 30.00, average: 30.33
 last-message = rendered: 189, dropped: 0, current: 30.00, average: 30.30
 last-message = rendered: 205, dropped: 0, current: 30.00, average: 30.28
 last-message = rendered: 220, dropped: 0, current: 30.00, average: 30.26
 last-message = rendered: 236, dropped: 0, current: 30.00, average: 30.24
 last-message = rendered: 251, dropped: 0, current: 24.84, average: 29.86
 last-message = rendered: 264, dropped: 1, fps: 24.55, drop rate: 1.89
 last-message = rendered: 279, dropped: 1, current: 30.00, average: 29.57

The next log is obtained _with_ this patch:
 last-message = rendered: 17, dropped: 0, current: 33.76, average: 33.76
 last-message = rendered: 33, dropped: 0, current: 30.03, average: 31.84
 last-message = rendered: 49, dropped: 0, current: 30.01, average: 31.22
 last-message = rendered: 65, dropped: 0, current: 30.00, average: 30.91
 last-message = rendered: 80, dropped: 0, current: 30.00, average: 30.73
 last-message = rendered: 96, dropped: 0, current: 30.00, average: 30.61
 last-message = rendered: 112, dropped: 0, current: 30.00, average: 30.52
 last-message = rendered: 128, dropped: 0, current: 30.00, average: 30.46
 last-message = rendered: 144, dropped: 0, current: 30.00, average: 30.40
 last-message = rendered: 160, dropped: 0, current: 30.00, average: 30.36
 last-message = rendered: 175, dropped: 0, current: 30.00, average: 30.33
 last-message = rendered: 191, dropped: 0, current: 30.00, average: 30.30
 last-message = rendered: 207, dropped: 0, current: 30.00, average: 30.28
 last-message = rendered: 223, dropped: 0, current: 30.00, average: 30.26
 last-message = rendered: 239, dropped: 0, current: 30.01, average: 30.24
 last-message = rendered: 254, dropped: 0, current: 30.00, average: 30.23
 last-message = rendered: 269, dropped: 0, current: 30.00, average: 30.22
 last-message = rendered: 285, dropped: 0, current: 30.00, average: 30.20

So it is better to lower the message priority.

Signed-off-by: Sergey Khimich <serghox@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-bit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index c323bc96b998..50350d657f91 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -2466,10 +2466,10 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 			 * from doing different things based on the format.
 			 */
 			if ((sequence & 0xffff) != (meta->sequence & 0xffff)) {
-				v4l2_err(&dev->v4l2_dev,
-					 "sequence number mismatch (%d(%d) != %d)\n",
-					 sequence, ctx->sequence_offset,
-					 meta->sequence);
+				v4l2_warn(&dev->v4l2_dev,
+					  "sequence number mismatch (%d(%d) != %d)\n",
+					  sequence, ctx->sequence_offset,
+					  meta->sequence);
 			}
 			decoded_frame->meta = *meta;
 			kfree(meta);
-- 
2.30.2


