Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55CE115028
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 13:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbfLFMHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 07:07:46 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45410 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfLFMHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 07:07:46 -0500
Received: by mail-pl1-f195.google.com with SMTP id w7so2649208plz.12;
        Fri, 06 Dec 2019 04:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUi+772OFh0+aMi235GUKCqF36iP78kIVRkHfrv5Nvw=;
        b=kseXJg08ZQh8rMo47swpsu0wTLe2Ee3FuQ5CtSlQjo2doT2Adj3aUu/cFodGwyFoDb
         O58GpssUT0KQZVQIK3Wap5SO1EO4v/ogxHLsf8BdJ51vAazKrkX1VBBLNcqZuohwLIyS
         C/edxu4lGJ6SyzIj+w/AAEj5TQ/kUeVq8fL48H0o81bSA8GiIui76DScsZNbZ4tntiJv
         Fue6dXTTBKb+cuy0vXMePBWX2JRVxnHttgS8U9IPrlMw5ot3HsM9o90RQT0U+dJfIqTV
         koCCiSu1qZ42yaWKxMjWbpSc+RFBNipRNH5s/vw+yJOEaxmagy7USVi8yL2wDTKVjqjb
         NBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUi+772OFh0+aMi235GUKCqF36iP78kIVRkHfrv5Nvw=;
        b=tJOvfFG8O0UH/57W9x1LHRaYC0Z1DM/D6TIGgTivGl8dyfZe7O2EZ6MvCFemypjJin
         EN4fwFpme6ooOTkU1kFUMLbWzML+7lk+3x0H8aDn9PCMgkKCHhoJj7TKYnO3lXWtTPds
         6uFoBgk3iXgpaJiXERs2ovznnmN2p6R35pHbLlWrqpqJKMf5taEiPb5wWV0lsRoZ2YZl
         /iM39McPuaCGI6EvGBI5fhFEdEkhr0MFmZD5ZEkj/JALfY3V5YazetQNBBjHVJjjDFp7
         2QiRYP1UeaENfLBms8fpXuhHzE0yVl9HCpEnUhXXjSPp1CS9+bW8/bPTRci7yPzmM4PR
         KAqw==
X-Gm-Message-State: APjAAAVCPBH2gXdGpKvrYfrmtvVxPE/8t6Qdf0ooxAuNulzNHA2HVxqt
        ah0S6AiLbQ+ZzvxrXNwMtE8=
X-Google-Smtp-Source: APXvYqzNGd9adTgKkpZqoWzOHPwlLCxP3jynWBkNyuvvFRQFwm7VSFLmIN1m6XlJ+vpkxiNyD2IpYg==
X-Received: by 2002:a17:90a:6484:: with SMTP id h4mr12443621pjj.84.1575634065578;
        Fri, 06 Dec 2019 04:07:45 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id c8sm16855843pfj.106.2019.12.06.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 04:07:44 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: go7007: fix a miss of snd_card_free
Date:   Fri,  6 Dec 2019 20:07:35 +0800
Message-Id: <20191206120735.21873-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

go7007_snd_init() misses a snd_card_free() in an error path.
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/usb/go7007/snd-go7007.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/go7007/snd-go7007.c b/drivers/media/usb/go7007/snd-go7007.c
index b05fa227ffb2..dced8c019514 100644
--- a/drivers/media/usb/go7007/snd-go7007.c
+++ b/drivers/media/usb/go7007/snd-go7007.c
@@ -243,6 +243,7 @@ int go7007_snd_init(struct go7007 *go)
 	ret = snd_device_new(gosnd->card, SNDRV_DEV_LOWLEVEL, go,
 			&go7007_snd_device_ops);
 	if (ret < 0) {
+		snd_card_free(gosnd->card);
 		kfree(gosnd);
 		return ret;
 	}
-- 
2.24.0

