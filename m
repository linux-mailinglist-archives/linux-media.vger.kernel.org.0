Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2044DBC80
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 07:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503929AbfJRFGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 01:06:11 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:51072 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504106AbfJRFFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 01:05:24 -0400
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Oct 2019 01:05:23 EDT
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 9653BCE2
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2019 04:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9k_3-aNVIfzm for <linux-media@vger.kernel.org>;
        Thu, 17 Oct 2019 23:47:07 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 74FB56E8
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 23:47:07 -0500 (CDT)
Received: by mail-il1-f199.google.com with SMTP id w9so1364490ilo.12
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 21:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=EUxpZ3T7vF3Kc+2RT08v4EEjAUSgYRvb0sha4nlMD8s=;
        b=bdTw0PeubzcFLX1DriNm0Yl8F6jO9UQoufbrtSDEs2MigRgqIOl6EgA0X//E19MR66
         XpcdNRPB7qQNjzC43YxSWiD+KXoP8weegm1HXd7uoxT+1wgQ9KiBhqajAmyu8pEyt+fH
         qkvk2dC0jbqXNKfd71ZkAnX1/hNKlEHhYQaOkcRslt/U5CG7CZkuukajp9Au3eF39qDP
         IwRkhylUXdMbDkN5jqdMIUmSzuYH9W3wQ3cniFfx1nhZDFZlBDqyp61SR0djcWU0Xa8h
         q1xO07n9Kf4GAytT3Et9g44q/7pV5QhhZ/7v8uUpvS7dcD5R2ovx/hygqf0lz2X81X/i
         GnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EUxpZ3T7vF3Kc+2RT08v4EEjAUSgYRvb0sha4nlMD8s=;
        b=ITa6wQrYcBqq2wLWEkHapHpUbDZraLhHqdy3b6MogWAzVb7TbKqFYfQzcXb8ItinFx
         92R1ciYgV+RylXVchchd9ori0moJJgY5fZWOKfpkyyT4YTULA/iHyfmzvHLQglMAr0aw
         5PsKG0B3lVqP5wqp+A0DG0NkyUEk/z4RZoqBxYRRwYjXE2o3hCCssrXp0nMNv2a7RJsm
         BR+YBmas9SzsHhJLmHRtxoaNyv3eq8AC3P6dQ7yg3PdtMolVE0ZSN32NvmEbqIHyrd6/
         x6HF95GqwsX3ZikEeUlANvzhT4OOdomSaJu0xS5PHTyU1nI2v6Z0LhyYNF3eZSdoH+xW
         S/Uw==
X-Gm-Message-State: APjAAAVnH+mbT7FHahopuqFicOGEVMti4hs+chgn5F6tUqnj2AaqN8mp
        BwOsRDFirINPMYM7wIRfhxGf4hqV9gISp2rrv95zmHPkiPa5LW9ZdC3s1iyQadhazyZHzlPYFPa
        3oPhHwYzFC9Ys0n5rQ42nV8D3lXo=
X-Received: by 2002:a5d:8b8b:: with SMTP id p11mr6820747iol.2.1571374026858;
        Thu, 17 Oct 2019 21:47:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRFDJCsdCcPC5eb4L2SDx6043c6Gt8bq+dQz12A8oxvmQA4iLvhp+dkRZ6xTeypxz8f1Vy/g==
X-Received: by 2002:a5d:8b8b:: with SMTP id p11mr6820730iol.2.1571374026580;
        Thu, 17 Oct 2019 21:47:06 -0700 (PDT)
Received: from bee.dtc.umn.edu (cs-bee-u.cs.umn.edu. [128.101.106.63])
        by smtp.gmail.com with ESMTPSA id j2sm1968315ile.24.2019.10.17.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 21:47:05 -0700 (PDT)
From:   Kangjie Lu <kjlu@umn.edu>
To:     kjlu@umn.edu
Cc:     Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: rcar_drif: fix a memory disclosure
Date:   Thu, 17 Oct 2019 23:47:00 -0500
Message-Id: <20191018044701.4786-1-kjlu@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

"f->fmt.sdr.reserved" is uninitialized. As other peer drivers
like msi2500 and airspy do, the fix initializes it to avoid
memory disclosures.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/media/platform/rcar_drif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 608e5217ccd5..0f267a237b42 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -912,6 +912,7 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
 {
 	struct rcar_drif_sdr *sdr = video_drvdata(file);
 
+	memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
 	f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
 	f->fmt.sdr.buffersize = sdr->fmt->buffersize;
 
-- 
2.17.1

