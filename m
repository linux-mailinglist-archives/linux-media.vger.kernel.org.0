Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5439F36A9C6
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 00:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhDYWzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 18:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhDYWzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 18:55:04 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B24C061574
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 15:54:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s14so21042334pjl.5
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wv7zS690+g8tE1z6LfQI3k30mRwbZKIIjJ4bae9rPgY=;
        b=vJbY88WLkA3rgmi0Fg9it67c8xThj6Vo5iBU5HIwrnWgbm8Mj4hOJvM+Nhc0BVOr6t
         tbVoYTjHoyFuoObEs0kczcHx2x4+s89di+FC2dWv3s7IlnnpfMA/sQ2y9P2tHTKavx0H
         eLyxSZpMRdcYayLtkhoHB2lRRgnuxT9nxndmsP4UOcMaDMElvQDUXFxuXBZdPMmCbl+v
         i7++Y4qe6OBqhuU60BXgZGgb9whWW4PBZP5lA9j3ErBbXJhWuj/hRwD7Op9Yqqyi/eGv
         9d33GO6OTqsl8PAstWa39/Q4lywJX90KqFs369UEW+IVUf7ngWTWo0lsWn1pWkxdKHOP
         9DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wv7zS690+g8tE1z6LfQI3k30mRwbZKIIjJ4bae9rPgY=;
        b=geAHd7aP+E+WPtOFkx/khlDfbzno75A6XjZ/i4m5tPuJWZXIxu9YRvMZHgnVbejfh/
         v6by+H6juxWa8E7lUvEjvJViThXxyZHAAFFthBGGQsh/49jldndALIAnHRf6a5byaLaW
         8rq2tiyighBgDafYbD1A8TcVl5/pYeuRwdJLwjq+V6sPSWna0m/+nx/86pOxw8Fvdf68
         Ig4PJCXff3JkjtO7rIam2oOHG6bs/1GqsY2X5d/6dlG5pSz9LKVElF76h1++smOCmaOu
         fVTxdzH3a5CPLTmWUkl2JRk0Lm0EvAFTG8PosgXEHhTE3q2suhAhBUO8SENUa5bRvsj5
         lHtg==
X-Gm-Message-State: AOAM533Z7wJZci6cRmzUFtg1TT9CiNoJcDNrHW69ZQlz++Fmck387wGS
        hHQnswBXCXVp40aQebnYFytVhq7RXRYx0w==
X-Google-Smtp-Source: ABdhPJwPzsf4ImgUeJjRCUaXPqc5HgZsZB9Tq5mjDK/boOU/dsDUyaXzvQXOnxHlzelaqN8jLvL30A==
X-Received: by 2002:a17:90b:1208:: with SMTP id gl8mr17631940pjb.12.1619391263477;
        Sun, 25 Apr 2021 15:54:23 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id s22sm9504207pfe.150.2021.04.25.15.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 15:54:23 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 0/2] cec-follower: increase accuracy Audio Rate Control
Date:   Sun, 25 Apr 2021 15:54:05 -0700
Message-Id: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:
* Patch 1:
  cec-follower: increase precision of Audio Rate Control active sensing
	* new patch

* Patch 2:
  cec-follower: detect the cessation of Audio Rate Control messages
	* Keep the aud_rate_msg_interval_check in processMsg to avoid missing
	  late messages that arrive between periodic interval checks.
	* Swap arguments so that struct node appears first.
	* Add blank line for readability.

Deborah Brouwer (2):
  cec-follower: increase precision of Audio Rate Control active sensing
  cec-follower: detect the cessation of Audio Rate Control messages

 utils/cec-follower/cec-processing.cpp | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

--
2.17.1

