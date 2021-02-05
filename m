Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825773118FD
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 03:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhBFCwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 21:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhBFCr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 21:47:58 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF72AC08ECB4;
        Fri,  5 Feb 2021 14:55:13 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id g10so9490029wrx.1;
        Fri, 05 Feb 2021 14:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELbdu45E+fwWUalqR1cagJZao7VVOdmmwE0d8K0Emng=;
        b=GrB/byZLS9lHFpP1Pz7KrqF3wSBFqdsQR4zD2yzxYP+8H3QIyj1R2zgKNcX4lz1uhx
         8lVYR6Tf6WrsaRC4jwUjR4PC/0gk5DZyeimty+fPJ2psBFhcFTkqMkHX7hQrCIVujqmE
         l3ns6PtJpcw2CHsnhh/6XvT+n/5LSjp964KaFK23xbiT263vl8mozu5TAZa//OYbMABW
         CzePnac4DNgM/R/wH9Px7yFFf+GpxxPELMJpC7ts8Ri2+e4NudTgT28jSmR9Hu4+NfGo
         cGfzAtThLT5KIE0dkFvE+ixxCVnImFPpLxU8j2MHjPCfm4ZT2kl5v8eLwmARX7OcKmN1
         ERhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ELbdu45E+fwWUalqR1cagJZao7VVOdmmwE0d8K0Emng=;
        b=RRLiDqR1whO/wBt96/BUkHIzotrwDQyfQ8uX1xXDROdVFEbYSeO5ZH+MTUaMi06siM
         YLFl0X9lwFUbYN36Det2rsePwfp88ckmjqYrg4d3m7tM0DhwFBm821sk1AiajApkeSzp
         kCaIUglV8JexN1hXAsYTr+4CnmrdTWRQT6nrNz+lHjps0VGaXImLrYdVim6933PvuD6H
         2+sNPYMBm3bgTfa1A7o3dVVXa8QfEQ2jGU8sBP+tWXykSNKrMDvMLog+kvfcWTP+fPlA
         QooeZxugIKbvKZPIOgLvF3qhmpI/b0tZXfVLaG19L9VVMnxStpvgjmhh4F6ShaCfciSi
         tInQ==
X-Gm-Message-State: AOAM533SQXik1gRW3kkqGzJHETJnGutqmEHsaqBQr12gpRgue/dx7s3s
        FLCIQ5YOgv8jQmVdfFc19bU=
X-Google-Smtp-Source: ABdhPJz7Z7Vz0wo6DigSr85yDR3SxRtSvzarroagSWAz+ILQ3tjOZEE+g2NHGRLblsr/k3Ls2u2icQ==
X-Received: by 2002:adf:9546:: with SMTP id 64mr92222wrs.247.1612565712393;
        Fri, 05 Feb 2021 14:55:12 -0800 (PST)
Received: from warrior.lan ([2a03:7380:2407:423c:1171:fd22:1b63:1bcd])
        by smtp.gmail.com with ESMTPSA id z63sm10191489wme.8.2021.02.05.14.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 14:55:11 -0800 (PST)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Federico Simoncelli <fsimonce@redhat.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH] media: usbtv: Fix deadlock on suspend
Date:   Sat,  6 Feb 2021 00:51:39 +0200
Message-Id: <20210205225139.7986-1-maxtram95@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

usbtv doesn't support power management, so on system suspend the
.disconnect callback of the driver is called. The teardown sequence
includes a call to snd_card_free. Its implementation waits until the
refcount of the sound card device drops to zero, however, if its file is
open, snd_card_file_add takes a reference, which can't be dropped during
the suspend, because the userspace processes are already frozen at this
point. snd_card_free waits for completion forever, leading to a hang on
suspend.

This commit fixes this deadlock condition by replacing snd_card_free
with snd_card_free_when_closed, that doesn't wait until all references
are released, allowing suspend to progress.

Fixes: 63ddf68de52e ("[media] usbtv: add audio support")
Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/media/usb/usbtv/usbtv-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/usbtv/usbtv-audio.c b/drivers/media/usb/usbtv/usbtv-audio.c
index b57e94fb1977..333bd305a4f9 100644
--- a/drivers/media/usb/usbtv/usbtv-audio.c
+++ b/drivers/media/usb/usbtv/usbtv-audio.c
@@ -371,7 +371,7 @@ void usbtv_audio_free(struct usbtv *usbtv)
 	cancel_work_sync(&usbtv->snd_trigger);
 
 	if (usbtv->snd && usbtv->udev) {
-		snd_card_free(usbtv->snd);
+		snd_card_free_when_closed(usbtv->snd);
 		usbtv->snd = NULL;
 	}
 }
-- 
2.30.0

