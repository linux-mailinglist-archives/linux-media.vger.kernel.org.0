Return-Path: <linux-media+bounces-992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DC7F798E
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 17:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91CF41C20B3B
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 16:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDADB33076;
	Fri, 24 Nov 2023 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4R1JAUR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D16A1FFA;
	Fri, 24 Nov 2023 08:41:26 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332c46d5988so1292363f8f.1;
        Fri, 24 Nov 2023 08:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700844084; x=1701448884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ni28SjVJ2Wu+8xAjSvXwvNtZzS7NfB4KdQGTVTIay/Q=;
        b=j4R1JAUR+Y7FTDP6YmroBgnY9pcmxk5UrgGEtmqlaWeHYOUanAQ3Nt93QMmAHEfHOg
         O/27W4YYO2MJh51ZoEflJPox1Zbrss+7yo9udqyyw5EpLQNo4linGOJMjsnyzU/eb6jt
         CNpX+llD4D3spDMsbCdT3wHHowshI8uLzcdrn/bv8sRghczCu04JY0MlrkhCVMkk0XL6
         4+EyaSheokUNGk1pDIS3ms35YSrrzvZHEpn8Ha2fnCQY7FO/LjKBE/Va8Jss/4/UnJEn
         CugZKmluCvlIy+0TnkDYMEVaJBzC6cp9BdBOQXOCnaQvO8I499Ve7AoDOQzkWT44534W
         gJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700844084; x=1701448884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ni28SjVJ2Wu+8xAjSvXwvNtZzS7NfB4KdQGTVTIay/Q=;
        b=KhE3HEWF+L+OM8nCRCWiD6jDnaPVVCIeQGzRRUkjWxeAFBZBoFhkorc9TRQjRaNroH
         ozEyeUr+KLFI9H9m9mHMM1JpCvZj6RIMjDzufzAHJigJbtASrUWZ79Il+GysoHvs87uO
         rESLfgY8CM0+AHn8olkx2bGgVMNgB5n3R+jIrvfY9Sq17Kd5yz5c/hY/zpHxqV9kL05y
         bQCEmB2TXTjYMpyqgk9u0V1umPczGl5l0SQhDldhwCzxBxVDui9E5puwmd2TmhErj/3/
         NdrrAF1TkYUTKKUN4DM9D+a1JKnIrYJGncvx3jRMrLpdrx1gOfb/2nEy8E9NEURg9nVw
         Q+QA==
X-Gm-Message-State: AOJu0YzP1QPypAknkgmphAqCR5B7ULKOoKWB/O4AQYZAkKYSq8x87cdl
	LwPFKq/3nks99ivsL1rv4lG+UFhtJ7X+kg==
X-Google-Smtp-Source: AGHT+IF1Q+NzbFRUNcZX11rtSRiGBfnsmXXAM+zIIUixrSW8rGMXThtOprWk/P5d0O8fxnf0ynvBlw==
X-Received: by 2002:adf:fc52:0:b0:332:d3f7:46f7 with SMTP id e18-20020adffc52000000b00332d3f746f7mr2389461wrs.53.1700844084450;
        Fri, 24 Nov 2023 08:41:24 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d4e82000000b00323293bd023sm4720711wru.6.2023.11.24.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:41:23 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: chips-media: wave5: Fix spelling mistake "bufferur" -> "buffer"
Date: Fri, 24 Nov 2023 16:41:23 +0000
Message-Id: <20231124164123.300870-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 8b1417ece96e..ef227af72348 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1281,7 +1281,7 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 
 		/* Don't write buffers passed the last one while draining. */
 		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
-			dev_dbg(inst->dev->dev, "last src buffer written to the ring bufferur\n");
+			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
 			break;
 		}
 	}
-- 
2.39.2


