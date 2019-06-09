Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9903A66E
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 16:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbfFIOia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 10:38:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34524 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbfFIOi3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 10:38:29 -0400
Received: by mail-wr1-f67.google.com with SMTP id e16so6632521wrn.1
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wrG+9c7Mo+nUqjBkqdzc53l3FsULbHGG2o9v6JCZ1YQ=;
        b=uZ69jGB+p0E4Xw2l4rYUKI0QoiCsH8Q8jXjYqJ2ScEO9OKvlmD0KCdPb5wWbLsiYjy
         aN3P/eZj3VkWSoSl4IISYnSBQuor0UYvSn5kW/JDGhiKthgh37ME1v12nq1+A2J92t8S
         +qKgHRs23gYZghEOy1daByVGmAp5bYoPxmp8NrFt19pv+hTSGFjsu4jtg3Q2OOm5uw1k
         j3/B/EDANG+QkyhPnZF2cIL25jiAEao7kWF7Bkhf6C/GANHHWtKXGJZ9lCPpi2vh++sj
         lMD56jkE/p2VnrFI64XgJTkifSxihTbfkchqu6x9fHcUwusVFj3gNuPDCXyEPIMC5Bv0
         Ztvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wrG+9c7Mo+nUqjBkqdzc53l3FsULbHGG2o9v6JCZ1YQ=;
        b=tr85ud87aXQ94weaqr1HDSKIIlJggotxSJzoaen3RyJu4DPXLtvf2qaG89G8IveLNH
         EEuQ7x9diFrJU4cmLLqft2iFnp0qF58+Dl5YF1iqfMRm4KVnnfx9225gK359sz3Paxrd
         ifbGiS33sjM6f3DzIRJcOCBg7RWQLyOy2NWJ0KlopUrAobW8mcGaiprIhPvbeb4Ni16U
         SxaO394SeBp9klTRdMymc5fA6tO5ejihhF1yHjPwdeF7kANjLiZVm7ip+PvJKc3vcfS4
         Iu/B3swAfr1c8FhkdRPhINS1ELakaTMqR1ZJ38/tAo458szzVknrDo1l1wkX78nb6yGD
         /w+A==
X-Gm-Message-State: APjAAAUhnKeQeY7Pc8ESR8usUuWVGmZi5McQ1xa1pdryI1hoyIfDf778
        jyi8227rMXyjwAd57p1GI7Ksbw==
X-Google-Smtp-Source: APXvYqyQkA/+jkRS0y8rnaqc1VbtnCZaQ/vi8Ok6i/iAAqXBvojoPG6CnTD2zZ8gk71zFf3EKQo6Ug==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr27559244wrf.78.1560091107784;
        Sun, 09 Jun 2019 07:38:27 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c17sm6047713wrv.82.2019.06.09.07.38.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 07:38:27 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 5/5] media: vicodec: flag vdec/stateful OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
Date:   Sun,  9 Jun 2019 16:38:20 +0200
Message-Id: <20190609143820.4662-6-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609143820.4662-1-mjourdan@baylibre.com>
References: <20190609143820.4662-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tag all the coded formats where the vicodec stateful decoder supports
dynamic resolution switching.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 drivers/media/platform/vicodec/vicodec-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 72c56756e45b..8e425c347332 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -729,6 +729,8 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
 			return -EINVAL;
 		f->pixelformat = ctx->is_stateless ?
 			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
+		if (!ctx->is_enc && !ctx->is_stateless)
+			f->flags = V4L2_FMT_FLAG_DYN_RESOLUTION;
 	}
 	return 0;
 }
-- 
2.21.0

