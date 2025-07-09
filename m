Return-Path: <linux-media+bounces-37200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39923AFE89F
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 14:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C861897CFA
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEF22D9EF4;
	Wed,  9 Jul 2025 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPLbblgm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B085128DB63;
	Wed,  9 Jul 2025 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752062953; cv=none; b=s91bP9Va/fy44Ibq5mFagaEW4395PsK7v0iuVIGKfIIJCbCpqBiCLZvH64T3dgFDlTdotyeaLM5U6/Drf3R/nO10x2kfngL/zBix+9tg0lwd4EdeIdnRemH9MMsCBrWtKUFzdcGODFLRXA75xNiQ6neBGiR0muaD6UqWDwSil6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752062953; c=relaxed/simple;
	bh=1cHiVWjYBFfqkv/9wcftSI06bzupR/q6cIGkqt7akcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fp0OgF8yYuYVXLNKxcqHXKohS6puPNT4h2CpZth09NZDbFnDQdMCRbmkiQxyANrcnHuzIrmP/ThY0oLfjhF1s0Zfl2Z3PYYxAhGJ5EWb9PHOne6iLZMbbX0jm2CSc1e1F6mtYvKsEnHCCjqrQBCVda+Ama62fhZH9vJ/+3++b38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPLbblgm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a577f164c8so714122f8f.2;
        Wed, 09 Jul 2025 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752062950; x=1752667750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3Y3msY30zFVRm2n/owBL5NVNHIv9Hh4x9ql8zigcXQ=;
        b=CPLbblgmOXoUw9sCGjDR2Wi6VFgs1sjO9zAxdn82v3xwYWrleXdmKkSPyza+GkIVgM
         wFoSKflrz1ta1NcRC9Qk6SdXoWtlcvgJOASyi4+t/Vny9HUjytD/o2V78dF4/AvaumpU
         sN12BsykstrTsdjj0GNM5a3C+QYBwuKPkScEPpKKFhlgpkIoNn+hlaYUy3IWgdmMdX/S
         h2Pgmga/lNXs5teBNTbESQMYT3bivW9syitMWl2RLlfHaIRg9ykLOaWKUU0QX3WHIYGY
         2U0ttlJqmszKbCCyPQ+jzePFRk9gHvrrEi9NLQZIVAoorxENYFVjsTDn/BXVHC4LVea7
         +WSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752062950; x=1752667750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3Y3msY30zFVRm2n/owBL5NVNHIv9Hh4x9ql8zigcXQ=;
        b=j/WniMu/UbGuWB822dxIBedmr8OnNcnrhVIcgcTUy2gfe5aw4hBfa8ya3q94AdMiM0
         TWuIKR8LNkF2v0lqt8cQfGj5qYFikqCK0GF6xSGOVcl+n/oeyxPjRPvGoQ/kZqPkUsQg
         JZuWb8k7obLpvC0row54fWpL/k/9Clsm3mswsVKAeFBQqOKz+O8YaT61JHOLfzkTGfTl
         j0Z8EF9YSaiG6EBAi6tGrWmMyL/46hHutin0/1JM2lMxaZ4+KbyMwnCsdTCYLyn8PWNg
         uFl4oGTFohC3VSCJTXZV4x9lNxtIDdfciSmmxLqNBip89/DwCjlyYBKOVw12KAJU4V04
         d9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWvn1QFBwldXiv6S5VoJvXEuLwM191l2vcfIS2mFMpTf8UPVJc2zj1TEwObM3PZKTGav6/gvXoEjYUasSg=@vger.kernel.org, AJvYcCXKiGR836TwDpGXHly0vhHb31yQxwj8fJ+u1FA9ZTofJUFLGRH3p6qXETo3wUR+bAVoSTnpyU3KT+7b6tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzovibi/0uNe0sNN+zlJ4CP5N713y8AshIrQq6Lc5KRVhGMpRCZ
	H1XomlDCCu0WnwDtNGPAdKv7j2odwHYK/+lSqSfr3zSFAmg7DLXvWutt
X-Gm-Gg: ASbGnctcejwSHXf+29CVMWeVN2CQ/tbrrdw5+Wz/1IadTN9xDWBtyhxWF3NewlN0ISm
	e/YBUuayrRmKjQpstbGrSGcLLXBz517VnsNZa16dHz1aXEKupeHGYCjDVLiZIgdEufKiV8G1IWO
	n0loPePBC6bt7gZmqU1PLbPd6KXXwt3CpvMMt3MsHRSWVeocMRCwn6Agmi37QNTzfnux2hb3U2k
	+iINnmdMNaksq6GqpRnfaukCLJQZZUrJlDTXte/QlmJsYvN/wC0ygYsHhp2V+TYV9wqOoD+n5uO
	+MR4sGy84FunA3XmHpUkw7zO70lwOKergUTd2qrbMZLe6fVRfBGmWAyG11YfmTfvJaaNoyhFCUe
	+HP+YyqaA+72yQS8YZ9zAxA==
X-Google-Smtp-Source: AGHT+IGPl50fG/MvKygC60OvN97rtlKjOb95e+SXTpgOyR/zycoHaL7GjCA6Su6wbo+cp7GaXYsZqg==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3b5e45039camr579284f8f.3.1752062949093;
        Wed, 09 Jul 2025 05:09:09 -0700 (PDT)
Received: from thomas-precision3591.. ([2a0d:e487:313f:bd91:3d4b:795b:ac55:2b9d])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454d511b43csm20692765e9.37.2025.07.09.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:09:08 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ian Armstrong <ian@iarmst.demon.co.uk>,
	Chris Kennedy <c@groovy.org>,
	John P Harvey <john.p.harvey@btinternet.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: pci/ivtv: Add missing check after DMA map
Date: Wed,  9 Jul 2025 14:08:33 +0200
Message-ID: <20250709120834.49667-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.
If the mapping fails, free buffers and return an error.

Fixes: 1a0adaf37c30 ("V4L/DVB (5345): ivtv driver for Conexant cx23416/cx23415 MPEG encoder/decoder")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/pci/ivtv/ivtv-queue.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/pci/ivtv/ivtv-queue.c b/drivers/media/pci/ivtv/ivtv-queue.c
index f9b192ab7e7c..c8a5f6d37bd4 100644
--- a/drivers/media/pci/ivtv/ivtv-queue.c
+++ b/drivers/media/pci/ivtv/ivtv-queue.c
@@ -221,6 +221,16 @@ int ivtv_stream_alloc(struct ivtv_stream *s)
 		s->sg_handle = dma_map_single(&itv->pdev->dev, s->sg_dma,
 					      sizeof(struct ivtv_sg_element),
 					      DMA_TO_DEVICE);
+		if (dma_mapping_error(&itv->pdev->dev, s->sg_handle)) {
+			IVTV_ERR("Could not dma map sg_dma for %s stream\n", s->name);
+			kfree(s->sg_pending);
+			s->sg_pending = NULL;
+			kfree(s->sg_processing);
+			s->sg_processing = NULL;
+			kfree(s->sg_dma);
+			s->sg_dma = NULL;
+			return -ENOMEM;
+		}
 		ivtv_stream_sync_for_cpu(s);
 	}
 
@@ -240,6 +250,12 @@ int ivtv_stream_alloc(struct ivtv_stream *s)
 		if (ivtv_might_use_dma(s)) {
 			buf->dma_handle = dma_map_single(&s->itv->pdev->dev,
 				buf->buf, s->buf_size + 256, s->dma);
+			if (dma_mapping_error(&s->itv->pdev->dev,
+					      buf->dma_handle)) {
+				kfree(buf->buf);
+				kfree(buf);
+				break;
+			}
 			ivtv_buf_sync_for_cpu(s, buf);
 		}
 		ivtv_enqueue(s, buf, &s->q_free);
-- 
2.43.0


