Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A066BE22
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 16:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGQOX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 10:23:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33156 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfGQOX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 10:23:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id f20so2013746pgj.0
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XpT+hyHQLrqTrk2x0mHRYSE52sz59GDyA66hoyA5DA8=;
        b=cR9ZpfCpxkVPqyp15+rlsfv0Uo19LMdW46Mtd25oPGRpue1omqQnENfn4j2eRm9ude
         skJnLsFyEw3cyE/jFOdpetpR8xKckZyVQpYuGkbOMelnKMLFFxPmWrC/bYDw5WKzqsw+
         bjYAZk8DOU5BKHGZZ1RfX2dzKqyBfSX7CF97Yu9uuYX9L3gAuehEkm0jD5F6H3wAbxKF
         Esy/Nfe6owVBjicH1/ZRvt525HyUXAuQtA/BpebfvNzQ5fGjRWNp2DynMWeYqI4P+dE5
         lcAvHd8VxlZH7qpQvdPGkP63uKHcEjFXLj15q1BPmiXpenaKKjFXrKL+vDtkw8TBYDor
         363A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XpT+hyHQLrqTrk2x0mHRYSE52sz59GDyA66hoyA5DA8=;
        b=cIQsUILRI3uXKLK7dFJunrcgFIRcD9yYwmpaNpTA2CPdMIF7S47bWVO8+Ng02J0ZSp
         ViG4rGEJQLsUt7F6tdwt3u8OGy57BZD9lQiJ/81Yk2uWWpVDBMrAEG7Qhs5LPcsoUk63
         ACHkGHQqF0ERUTUT9kLlXKQ5WnKk3n4BZZTqtK/jK/KvBTpl83uCxrpgKcOGAnxu4x7f
         kGaFI0eCMTU3ug4Fz9kDR0bkQv4jNctopWJPQYI+ytwFevxJ6xPAHIvZnI5TLzH/8ifL
         WbjxOEsG0UiBbXAo49jnVmyF5MO9EiY7VW7SgF2Ncg3ZFxmHF/auiXgHvsq8nXRAC2k5
         l4vg==
X-Gm-Message-State: APjAAAXnqvB9A+j4DT2arw7Mty+u1OlZe3nXdTjSthkhSOOVHCJbQ3gA
        pNHPjAztOudsT3TwKFlEGjs=
X-Google-Smtp-Source: APXvYqzMGbB7T5JbwWo8Ni2OiTookhu2ITf9hLjDGQPrn3tlis2UqVAOlnIZx35dPi6C0KPX3tPMiA==
X-Received: by 2002:a17:90a:9b08:: with SMTP id f8mr44498517pjp.103.1563373408094;
        Wed, 17 Jul 2019 07:23:28 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id l27sm2324253pgn.19.2019.07.17.07.23.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 07:23:27 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] staging: media: sunxi: Add bool cast to value
Date:   Wed, 17 Jul 2019 19:53:15 +0530
Message-Id: <20190717142315.3119-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Typecast as bool the return value of cedrus_find_format in
cedrus_check_format as the return value of cedrus_check_format is always
treated like a boolean value.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index e2b530b1a956..f00a048a0a01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
 static bool cedrus_check_format(u32 pixelformat, u32 directions,
 				unsigned int capabilities)
 {
-	return cedrus_find_format(pixelformat, directions, capabilities);
+	return (bool)cedrus_find_format(pixelformat, directions, capabilities);
 }
 
 static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
-- 
2.19.1

