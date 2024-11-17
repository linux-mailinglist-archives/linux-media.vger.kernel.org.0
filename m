Return-Path: <linux-media+bounces-21483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9559D04BE
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2024 18:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68CDDB22358
	for <lists+linux-media@lfdr.de>; Sun, 17 Nov 2024 17:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4A21DA60C;
	Sun, 17 Nov 2024 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/1VTeXR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFCC18BC2F
	for <linux-media@vger.kernel.org>; Sun, 17 Nov 2024 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731863012; cv=none; b=PfwIiMKwLssydVsKOIH9NZJs0s2LGubs55/bmyxizSIUEIY6NCznXQdHAeSkYFNGT0/18y/HP7eMI8JxtYMSQkKUqEyp+CDxFtuAUPGVjDs8mlcAPyGS4AFcTdO8ayZ6exJH1FPB0fQRtU0L3f7mJMIYwrqOph7a2cpLuUQHIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731863012; c=relaxed/simple;
	bh=8a7lEA7GnyIncokbZDwiBGQiZiijALJ2Plbv1gNjECI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ReqDuD2pB/7qCYDsRTxh95DJu15f+Z8xBlfLT7qXHIq/a3unhBnz+wlSdL4of8nQn8Kl0QlDsAhC9OGzZFhhroDp7TmPJHmltH96GVTTptu/jkHZID5S/4JieTtLO35OELNklAK5e1e/1y6lpOwTrOXZbn64ToE299FGQeCFoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g/1VTeXR; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee57ae0f61so45124407b3.0
        for <linux-media@vger.kernel.org>; Sun, 17 Nov 2024 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731863010; x=1732467810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ip5/1nZqGxhHDaB5wRv08h0uSCzJ6//9B4YB74TxInY=;
        b=g/1VTeXRpivJgCDMlfLPu3jZcqK7xq6pg4cXJopubmX80XiuLtyXjkHQPmIyr/A2Da
         dMHJtksRR70heub85Y018PO/f68E+Shl5BZTRItqnTPrea59aNWg7L2gDk/IyfzGH1JW
         sHYI7bwyHuOVWLn8uY1hxBhl9CIPasdo8PUtMhB0N67crxnr4pnDJvhxeMKyXtqgyfRb
         tCLGxsMmbAdy28TV2HwlMIXpF7QgTFzXzcLadhaKkJttBqeynxUPI7KMDoTKP/f6KQ5m
         4NnTY72IMj5aLVSmNgt9c4FzcSTqx4KG3wZLpZEPPxkhOtQnmaMLE6eDcJAEFUtIfbtc
         ZWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731863010; x=1732467810;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip5/1nZqGxhHDaB5wRv08h0uSCzJ6//9B4YB74TxInY=;
        b=hoBVYer4juGM4rf8NQCMvZ4+Jj0k20l+5hQ+3P+ADPCzl6E2C+eFZ1EEho7cEoVOpD
         +BASDZfdAbh+TfeNJURs6ZxwCvWPUrA17bar0TxQGtpA0iBOMic0rx5UBnKXiFx4IHVU
         jzxu3BypDMf7Xrgb5voScaDJpFI1c5vQN0Kl7gIFeJ6Yr18UsbhafUj0fqYSZ4bpkVUl
         NDOcVSuBFwL4QNFP4moANCP/rbhDb30nhed59cMVE+ljHVff9zXX+ghMfJnZmCfmSexG
         zLOpveBkoyCfL618eqD+PwKbHMh85KNj3ZGwer7o7pKC0n7p1LzsK6VKcJ5oTq4r/IZM
         S3lw==
X-Gm-Message-State: AOJu0YyvsJm1wcMxdoL57VXhZWr8jIGU9iUXfrBuFFLpGPtWbSqjSs5j
	QQTATVkINjs2gKDPc1OX1r5gXbhDXrFVwT4JzN1ePdg7JCwVZgyFLpK40m/2oayQUGI/qUCmIvI
	86pOtX5r8Kwtk6w==
X-Google-Smtp-Source: AGHT+IG0Mg9dEvwB5HqwR/qPZEBllHTbHdRpgDouyxkiR2h6fNWlGlmde25AJXfVR0dvbM7cSC6zwR6YjRdqgDw=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:527])
 (user=tjmercier job=sendgmr) by 2002:a81:ad0a:0:b0:6e3:d670:f603 with SMTP id
 00721157ae682-6ee55c2f44fmr1527227b3.3.1731863010097; Sun, 17 Nov 2024
 09:03:30 -0800 (PST)
Date: Sun, 17 Nov 2024 17:03:25 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241117170326.1971113-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: Fix __dma_buf_debugfs_list_del argument for !CONFIG_DEBUG_FS
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	"=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The arguments for __dma_buf_debugfs_list_del do not match for both the
CONFIG_DEBUG_FS case and the !CONFIG_DEBUG_FS case. The !CONFIG_DEBUG_FS
case should take a struct dma_buf *, but it's currently struct file *.
This can lead to the build error:

error: passing argument 1 of =E2=80=98__dma_buf_debugfs_list_del=E2=80=99 f=
rom
incompatible pointer type [-Werror=3Dincompatible-pointer-types]

dma-buf.c:63:53: note: expected =E2=80=98struct file *=E2=80=99 but argumen=
t is of
type =E2=80=98struct dma_buf *=E2=80=99
   63 | static void __dma_buf_debugfs_list_del(struct file *file)

Fixes: bfc7bc539392 ("dma-buf: Do not build debugfs related code when !CONF=
IG_DEBUG_FS")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8892bc701a66..afb8c1c50107 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -60,7 +60,7 @@ static void __dma_buf_debugfs_list_add(struct dma_buf *dm=
abuf)
 {
 }
=20
-static void __dma_buf_debugfs_list_del(struct file *file)
+static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
 {
 }
 #endif
--=20
2.47.0.338.g60cca15819-goog


