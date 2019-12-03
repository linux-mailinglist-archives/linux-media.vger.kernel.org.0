Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138E210FC45
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 12:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfLCLNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 06:13:35 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32979 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfLCLNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 06:13:35 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so1584319plb.0;
        Tue, 03 Dec 2019 03:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6woE9Nax3taBQLO1Xq0hMJ7t3v77ZgaLEpNXtLBqYw=;
        b=B3F8X5qtRbbpuiEJ5KoZjjMjpajVpJYhZXGs2tcTzF9PN88S6vz6kn4TquY5aSP8rA
         /6KxjT3WzYkCvJXprpHjYKKCP6jG91EGzkiGrJ3s3iLFhQgQTZluQ2WJkudMe2R0cmVr
         MijfHi/y5EV7mSWKWIw+lGwG2zDe8k6z9R7GspuI3g70azFphBbzzuMS+p8qkKCF5Fjf
         5T1eyihX4vFjN37HQd9dnOYsMcyFjEb13iZzohoDDiDR8bCm32FhFE7+HIlLw9C7JtUy
         apuOz8jd/31QyACZk7qSSRLQMKPNHJMlya73SYZIRfwiMp2eL/udLNi5NjV9w5CinxQp
         FURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6woE9Nax3taBQLO1Xq0hMJ7t3v77ZgaLEpNXtLBqYw=;
        b=r+Q1B0y43HtYCfpUNnNtOEosVCdSLP6tsVHCy/K3cJSlqMWhKVKlYQ9UV141rctlbO
         B+HZ0sL3b0P09zskXOxjjgT30LsIh6pYYy29WxcrrYeqA0jAS1XxyILp7nXFxAF9rmm9
         nh8Zk1BeeS8LMycNE5meNtF7fRzDTHpVAbvdCYv6GMZxRG6xwU/yow9c6yUjQNHrtxxF
         yW8y7LLpenBqpPulwBugbTqWPofDfquj55QABpYkTvNhRBzBuiHc4N8tFPK6HYqfIc1d
         3IXe8kJD7MEa6+swNu58wkrmNoy2SZa38ItnUmQtSsAFGI6WZu4/Q0taOWc/ILzgOZ/i
         UKug==
X-Gm-Message-State: APjAAAWhSMEMG2EmQvot0WiWcC1Ewd6skmBkgxS6GuvJK/qAEozfi8ik
        8T53AjQFa0p62GoDKUYEUBs=
X-Google-Smtp-Source: APXvYqxNr9bNu8ebjYlsuMvI4SKrQ+tzjKzSNR/YRzDXk3TZ2NUeM4oXUS0bEyVLWOb25rN6JfJs7w==
X-Received: by 2002:a17:90a:2808:: with SMTP id e8mr4834004pjd.63.1575371615026;
        Tue, 03 Dec 2019 03:13:35 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id j4sm2614901pjf.25.2019.12.03.03.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 03:13:34 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH resend] media: pxa_camera: add missed tasklet_kill
Date:   Tue,  3 Dec 2019 19:13:24 +0800
Message-Id: <20191203111324.12997-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver forgets to kill tasklet when probe fails and remove.
Add the calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/pxa_camera.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 8d47ea0c33f8..43ae645d866b 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2530,6 +2530,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 exit_deactivate:
 	pxa_camera_deactivate(pcdev);
+	tasklet_kill(&pcdev->task_eof);
 exit_free_dma:
 	dma_release_channel(pcdev->dma_chans[2]);
 exit_free_dma_u:
@@ -2544,6 +2545,7 @@ static int pxa_camera_remove(struct platform_device *pdev)
 	struct pxa_camera_dev *pcdev = dev_get_drvdata(&pdev->dev);
 
 	pxa_camera_deactivate(pcdev);
+	tasklet_kill(&pcdev->task_eof);
 	dma_release_channel(pcdev->dma_chans[0]);
 	dma_release_channel(pcdev->dma_chans[1]);
 	dma_release_channel(pcdev->dma_chans[2]);
-- 
2.24.0

