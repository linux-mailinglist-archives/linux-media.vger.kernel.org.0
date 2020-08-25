Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA74F251B89
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 16:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgHYO4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 10:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgHYO4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 10:56:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C7BC061574;
        Tue, 25 Aug 2020 07:56:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k18so7544112pfp.7;
        Tue, 25 Aug 2020 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DXJMFSxcV9xYWsnVqv7Ps99ZWJR3OqDZVUVZ9L/SWjE=;
        b=dvJyYk4ABNmrcOuHspQsH8XUQhBTK+lgCnrK2uA5hY7FH3GzUfU8XRPnt6o8h3fTXx
         q1Nwo7lXPvbQtPK91Hatf5mxEYmoA9MD40QBuBaFGvZEd5E/BifsOZaODyCRAJPR9Hby
         K6vqurjvNfQiQwJtOy9tzhfNj6r8AAc9jVU+rWAgWpJCGfvDuK/kH00bujhlBb1yNkwb
         UMTaCHbAiekHf0xc/C5VkQciwLmeJknBGyiheaRY/iEDflIcHgmjJzpYB2fvhQ1deWsS
         Jd4ODwO7Sn5/sNuU4puUESlmd0S5R+liRk6mGR9pE3Mtat3cv2oE3h0z5Dhy3imFQXbD
         ltNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DXJMFSxcV9xYWsnVqv7Ps99ZWJR3OqDZVUVZ9L/SWjE=;
        b=cMD0ulobyvN2AYkGJJw2V2bXxvPRidQ+Uw9lSpXt/O0xE4v/q/6sN01VutGNuMZvqS
         TgHqOaPrwXV+EfXON6N8JpPAaFilC1KMnCC4KUbXBtiTAiUspdaJ98MVnc6g7m/eZ8k4
         pYJ9OH1iz15zXXqFD5d67FPASceB7lu2lEEOj/QTZtjBsxBeGlBHaFsWEBXgUNzrbZED
         IygCd6W8uEKrRQFin4hZU5ZQtovt8G6ASCGTVKdw/8da5zy/1obZ4ODoO1QW/+1mpnm+
         sFJ7kHbzz/xS99y5yPbAah5YuJjcLHM1UKiRykABLRYCv6314moj6AydUD3+6CYnV5v0
         ZzEw==
X-Gm-Message-State: AOAM532+Je4o0PiprUea+BkbBaxSOcDiwGk6BN7Q2TYpUCF55hKnLz5G
        AvL37GqZkbguwkFvWQsiP0E=
X-Google-Smtp-Source: ABdhPJw/15iAcP1sYV3sJGlu8PB+9DVdCkBWGhe3FX1Gk4gJE5Gj7X74eI1uCHmH5dcCVGyxuwNEAA==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr8148808pfq.245.1598367379444;
        Tue, 25 Aug 2020 07:56:19 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id a1sm4469959pgc.54.2020.08.25.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:56:17 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH 0/2] media: v4l2-mem2mem: fix poll() bug
Date:   Tue, 25 Aug 2020 23:55:54 +0900
Message-Id: <20200825145556.637323-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This addresses a very corner case that probably nobody ever encounters,
but I have hit it when playing with vicoded so here is a tentative fix.

Patch 1/2 addresses the issue that when the last buffer of a m2m device
has been dequeued, any attempt to poll with EPOLLOUT will result in only
EPOLLIN being returned, even if OUTPUT buffers are still pending. The
issue stems from the fact that the last buffer check if done first, and
returns immediately if true.

Patch 2/2 builds on the first one to (hopefully) clean up the code a bit
and make the function flow easier to follow. Functionally speaking it is
supposed to be a no-op and it can safely be dropped if the former code
is preferred - the actual fix is in 1/2.

Alexandre Courbot (2):
  media: v4l2-mem2mem: consider OUTPUT queue first when polling
  media: v4l2-mem2mem: simplify poll logic a bit

 drivers/media/v4l2-core/v4l2-mem2mem.c | 42 +++++++++++---------------
 1 file changed, 18 insertions(+), 24 deletions(-)

-- 
2.28.0

