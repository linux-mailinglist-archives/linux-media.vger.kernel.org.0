Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B029835861A
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 16:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhDHOJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 10:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbhDHOIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 10:08:05 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B60C061765;
        Thu,  8 Apr 2021 07:07:49 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id h3so905203qvr.10;
        Thu, 08 Apr 2021 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6fSIQirtWShuMIqpJMly6hnk0nfAVM8QytarwMk1/LU=;
        b=oHXWP2bGqx/WEx+RNKLuU6bEMQt589jw9z42sIvZwxkecxAYroGAJMwMfzU7F7U+J2
         OuvQR0a5x0SfkcZBOqQoE03rwQK6v/OAFe7ckWiPCodFbKCPxEw9f6wpepmrCq8ehd/A
         4rPN0M7qmkKQ2ZNjSclrlXWkNmXdhRPfdBe3wW4KGdiJGKugG4WWnbmO3Y2QmFEp4thI
         1eHLH8vpeflGx3C3iNw4NBBgwL7yillA29nUnKxktcfXx799Kl5ExVkeEiMblWtucd2B
         h8s7hJPzrmXutsRWj6SkNjafvQujSuKt61zZUE3fhx5R5YWAfC3c+DmilXoO78D0Slrl
         Vk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6fSIQirtWShuMIqpJMly6hnk0nfAVM8QytarwMk1/LU=;
        b=QCqZ2FHRlnhCS/Fp2W/eeEusIA84quszu8zwwzcbFcQoPw0RfYM/8icNT1+iS94Y0W
         wiCoiKXsDedev7tp1K9XsFaXnok4w0nltkgBH7LVHByXonU+CNPQ09/7lv77BFjz+ujn
         Fq72jKygRCyUfLc+I75EVVj0r4Lq82Jh7pm7m2oSiUNJpdP9wYuduVPhpWLZtuE9VSfx
         1AosU4qhseprxJPT6ubCUqyd5pKGS67+qYPlyaHiDYVhxo4lA0vjN8MqjUPqfzIJRpzd
         fjlT5WR1IVMcXxoO3Fmqmyf4VIV8GPMTRFJ5/a2KIbfaksbvvq726SFTbwxb3GubNRy1
         7geg==
X-Gm-Message-State: AOAM531Imkl5aOAJfeE99v/Iyhmq5nb5YoDaLyIOWPpC/8y6gUhp1aHs
        x5SCU/0aQYlAgxHaufGa//o=
X-Google-Smtp-Source: ABdhPJz68eslT7UjXEATT3L19+JElDT/v5Keuk8rtceg9B2IqGxgBg3KFs5ciq+AkeTgrVZm0Z/URg==
X-Received: by 2002:a0c:bd25:: with SMTP id m37mr5407569qvg.17.1617890868905;
        Thu, 08 Apr 2021 07:07:48 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:175e:8b29:c386:d20e])
        by smtp.gmail.com with ESMTPSA id b9sm17761584qtx.38.2021.04.08.07.07.48
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 08 Apr 2021 07:07:48 -0700 (PDT)
Date:   Thu, 8 Apr 2021 11:07:46 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2 v2] staging: media: hantro: Align line break to the open
 parenthesis in file hantro_mpeg2.c
Message-ID: <8209d15ab3a8391b74939cb942daffc556d72942.1617890467.git.alinesantanacordeiro@gmail.com>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/hantro/hantro_mpeg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_mpeg2.c b/drivers/staging/media/hantro/hantro_mpeg2.c
index 1d334e6..53a99a9 100644
--- a/drivers/staging/media/hantro/hantro_mpeg2.c
+++ b/drivers/staging/media/hantro/hantro_mpeg2.c
@@ -19,7 +19,7 @@ static const u8 zigzag[64] = {
 };
 
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl)
+				  const struct v4l2_ctrl_mpeg2_quantization *ctrl)
 {
 	int i, n;
 
-- 
2.7.4

