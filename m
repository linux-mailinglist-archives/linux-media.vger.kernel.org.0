Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3C67439E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 05:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389600AbfGYDGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 23:06:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36876 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389486AbfGYDGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 23:06:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id i70so11479077pgd.4;
        Wed, 24 Jul 2019 20:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=btqtc51LYIlkEFKYEvoFlR3PBGUCHhIjiaOtnkKqJro=;
        b=fD8huxV26PAdMafS1EwLFq5jiz1vj4SJcZHD46LnjytMwiRzml9XuyBDaZ49XcFhwN
         A9bMZEiO63TMJea3axNvha4nijQm0gOfKGigdk74DTutDN5vyPeW5LwT53XUV2TsQlWr
         2rST9N/J4C1S2NMp+d4nwSyPBzWCYn0tBZnl5i33ofplfnZQJPLH8j/CVBnPLNJ3PQNZ
         eFBtvYT2RRkH35UalHH0QoSQfLrKKYebSIq5FXClst55JtGLH5YjOiaKqmVoRIG9/OZ+
         VH++AzgLiL6euLBB0lAXUckGqRQLHN5CCdN5JFcBiYt61XdsOdDZm0XrnwVawbu8heYT
         PueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=btqtc51LYIlkEFKYEvoFlR3PBGUCHhIjiaOtnkKqJro=;
        b=TPOgGFTWFqY3LWZJH5U1m4j2EWQh+Ku3dh6Horn7O/9Q9P3/qLgnRm6WHLEPSaVEZq
         f8SVQBO3YxG2/OPHfM+UV28AKr07+6yoRYkEwdJIu1bc6qyjvM1JfkRp6nuhQrsrD7qK
         ZQFsib1JDEd6yYzerShh+o8wLRKIh2WVLl3Utyawfo1Wuj9XK/bu12dolWtrosriH9N1
         9CeiAaptvLzc+1WC3W8L1luqLk1oRwSQ9U3+3ALZQYp6FgwCE1+KlRC6B9Pdb+MsqaZh
         KqBFHZ3Eu3EIVgfd2VpBVU7CvCMtQLQREHZLF+tBAEtohfz8mCpbrSpiASTN9fUDtGHd
         4fSw==
X-Gm-Message-State: APjAAAVLLBt8I3jkiuY0J2pcUNSHlQL2AHJ34UuvbsOzf+lUuufttLha
        H8kq1z5IkVJs6IXndNppxhk=
X-Google-Smtp-Source: APXvYqx3YpL2LyepYGIeBA6i15WWO4Gs/pTiU/Fy5bapjt2gSTG1l83IwoWvRITga4oZWFwkdsYi8g==
X-Received: by 2002:a17:90a:a489:: with SMTP id z9mr87238271pjp.24.1564023970838;
        Wed, 24 Jul 2019 20:06:10 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
        by smtp.gmail.com with ESMTPSA id o14sm47624388pjp.29.2019.07.24.20.06.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 20:06:09 -0700 (PDT)
Date:   Thu, 25 Jul 2019 08:36:02 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        ZhiChao Yu <zhichao.yu@rock-chips.com>,
        Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: hantro: Remove call to memset after
 dma_alloc_coherent
Message-ID: <20190725030602.GA13200@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fix below issue reported by coccicheck
/drivers/staging/media/hantro/hantro_vp8.c:149:16-34: WARNING:
dma_alloc_coherent use in aux_buf -> cpu already zeroes out memory,  so
memset is not needed

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/staging/media/hantro/hantro_vp8.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
index 66c4533..363ddda 100644
--- a/drivers/staging/media/hantro/hantro_vp8.c
+++ b/drivers/staging/media/hantro/hantro_vp8.c
@@ -151,8 +151,6 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	if (!aux_buf->cpu)
 		return -ENOMEM;
 
-	memset(aux_buf->cpu, 0, aux_buf->size);
-
 	/*
 	 * Allocate probability table buffer,
 	 * total 1208 bytes, 4K page is far enough.
-- 
2.7.4

