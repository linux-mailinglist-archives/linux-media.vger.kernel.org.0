Return-Path: <linux-media+bounces-48082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965CC9B6B6
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 13:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDE264E2FD0
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 12:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A72313261;
	Tue,  2 Dec 2025 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK1vCtuB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF92580F3
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676983; cv=none; b=Zm5UAbDfSevt5O5ULjU9YjcInPEYU4vz6F/t9wCb+2PJCQrcp3GF5nJqnqD3kMihU5ipZSFZm83YW7B/tRMPGT4TSPbQ5zZ+ocVgSGjGYoPyypUV4Av9DFiP0sPOi9mkPx3r/47MJfYQr0ru6oGZCPb/+J4n3g4sCommor4G64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676983; c=relaxed/simple;
	bh=fJWPwY723ULgtVgkQjZtPrkYZvNU8HxVmANectBbrDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XMh86V9yOF102aDSdTK1jnK6tAh+pvUlwkvQzawtkKVnUj99xqZ9VoktogjoJwZZFBEZ1pLRiZIXIbkiTWhEiKcOlvc/hn9UoLTtFh8TIM88DZgbtkCo17ly7fYDxqMwdK6oIYLLeqHkXG6z2/On0IOHoj4t1PAmW8VP/Fi6arM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK1vCtuB; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso47378971fa.3
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764676980; x=1765281780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jG08/J7Wqu0U4ZYwI7Hu/RQAPwp2mHobhNdvN9y9utM=;
        b=eK1vCtuBvd+9eG4hUfJxPZBG0hRUT68wQ4iBmVAN7rxkBCUbKZYCSq7iF8pbJvPn89
         tg5HdgPPrNFFJbPVYTn+jhvbE35FTuIfbubF5QoQBVbLnDnkNME0vNVNIeMmgqWl6yRu
         9bRRWXJZq209rui1DSC8fUmuLqh8/yz7IjzUQqgB2D4PAV1v405irCYNoY+utilKzTif
         xk8uSy6RDVRi1WjuzW+UgDBwPRJa8+ODvy3eAd3vSnCuI+5CbNrGWSc3NQMITLjVTSL5
         BRtMqLrnTigm12GfifVFuYSqx4zLW+m4soqoIFyIeKp+yBgoupdV1aggr3HzSRQU0yDK
         HP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676980; x=1765281780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG08/J7Wqu0U4ZYwI7Hu/RQAPwp2mHobhNdvN9y9utM=;
        b=G8jaA4kLDxW2KRAt6Nxy01QmlK547MZlwKPLzBzWnerwZbBNX9HRIAW+UpGqkgRo8H
         Sc6HFj26S3P9Bf+HOvTDkMJLv/1jWTlcNQmgJmVJ+ttHFxqjS4YN6ITVInwIUpP+ImHV
         AKE9NUE3rzfFOVcZb1gcNlri7mMbe8sFveCCNOm9BAXl/tzyaAyeqgG4GXEPAnRd4lPp
         A3JYQ9jqwIyeVspkt/BfmpovQ0xrhmEpLzEO48Zz2zmVdRzrc0N9df+rC3WJVxWlNSsZ
         JgiXohTgZMUvPnPkL9fwUKADoJjjUsBTYv5Yjz/121ZbvZBOmgRu8Rtf4zVsDRLF1HO9
         Xq7w==
X-Forwarded-Encrypted: i=1; AJvYcCWUUqDlZm4nq+VKVKpaub0AgerIVBttqaxbE/FsLZh0P1NcbvUBDbYaC44eNFEAcckFx8f4oIu3W3NMWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1A8xa2JWDvpQVaHYwflJ+UNA7pLxkpeRnucshMg3L1Ai9chjf
	RGV7sxRWP0UVjPSALoVjorZCenGfBgu6t4haMQP31vY45okGXUrjc9wp
X-Gm-Gg: ASbGnctojzYL1+Ca88DYMLzfgFrjjPFdcbVIne45CfvuSzdmkUwtixmejeTOUTVu1YF
	49+PIevHWm+BDU+h+bq1FtXOGmSHlWokIlrTGdFTJ4+dl/8z2sKeseWzB7yYyyIXdNJnKjmN8y4
	aKYzgPyMVP8bmQDCJ24ckqZ0uf4+ZmRaGX6Slf8QB3DsvZETIcjZ8h8gp8DY6Ugt5t8SHGBpiPn
	bAbZ4N0C22sI/Xb6RdzMbbhA6NqO5yP1FgJrinuxWmZ9y0p0nPNfurdq3wD3OTyMqd6PB4lxwX0
	vvKanwakspRn1sv6sj3jlU7BinJymNBgsOGchB/61CdHtYjUcp4in58vDt0R5WLoxKC7gPr71QB
	16m3DhE3atLKFVqpUTi44rbUcWm0lK1CGGbUF7lCBTReLuDbmHgHSpCFnPXBcIUq1PK3sgHifPA
	uYE/hAQQeN7wXDtQ5jtFA/GHk2SbQjlB4dNl0tszMbHHrP6Fyxq8ne1vzHSA==
X-Google-Smtp-Source: AGHT+IGGPdkU3+EE7NrwXBfeL0c30Jy8lQQXAxk/MVHA5a3hbDVEH93tWcMS5Zm9tbkt8OF1LdZtOA==
X-Received: by 2002:a05:651c:43d8:10b0:37a:4611:9fe5 with SMTP id 38308e7fff4ca-37d077cc7abmr72780701fa.18.1764676979653;
        Tue, 02 Dec 2025 04:02:59 -0800 (PST)
Received: from rbta-msk-lt-302690.astralinux.ru.astracloud.ru ([89.107.11.60])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236dd67bsm37720721fa.14.2025.12.02.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:02:58 -0800 (PST)
From: Alexandra Diupina <dyupina99999@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Alexandra Diupina <dyupina99999@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: atomisp: avoid memory leak in ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Tue,  2 Dec 2025 15:02:40 +0300
Message-Id: <20251202120240.14670-1-dyupina99999@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ia_css_pipe_create_cas_scaler_desc_single_output() may fail,
so add cleanup by ia_css_pipe_destroy_cas_scaler_desc()
rather than simply exiting the function.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Alexandra Diupina <dyupina99999@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..4b553209af56 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4528,7 +4528,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  NULL,
 			  &cas_scaler_descr);
 		if (err)
-			return err;
+			goto ERR;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
 						  sizeof(struct ia_css_binary),
@@ -4561,7 +4561,10 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 				return err;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err)
+			return err;
 	}
 
 	{
@@ -5107,7 +5110,7 @@ static int load_primary_binaries(
 			  &cas_scaler_descr);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
@@ -5141,7 +5144,10 @@ static int load_primary_binaries(
 				return err;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err)
+			return err;
 
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
-- 
2.30.2


