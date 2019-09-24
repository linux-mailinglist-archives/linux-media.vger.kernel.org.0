Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A02FBC9FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441263AbfIXORy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:17:54 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:42293 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437004AbfIXORy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:17:54 -0400
Received: by mail-oi1-f169.google.com with SMTP id i185so1759996oif.9
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2V+0rPWy0GGzqYPQZr01AcjNlIALxW+zAjGgeCs4M94=;
        b=TlBieIOHBRVEshpvs0SAgqQUKikAQtvYzxzO30oChE5GTD+I87Cw7JC+BdCz69oGjM
         g3tZwJ2cBtCk2cFmpdh/bIYVdzS9+58pEIjYb9wMkSYxDFczT97hYlDdwZM/gtah0eJb
         wa9DiaUscevbSxiocjAC29pFAllI07b4tyk31WMXsBKxJXoi+O0zOka48UfOhp3G3tWp
         bfx2D9/2p41HD3UrYvEMwTUKzf8z44+5GwmbAJ8bqU7+6OpqfoRfAJ5tMKWXm86YBAbP
         naYhadeL8n0WWS+QRkg3AnPLN+EyZ+MiRI+/adDvqlKIcjqJ9ukksU/j0jOBnWY1CF5l
         26NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2V+0rPWy0GGzqYPQZr01AcjNlIALxW+zAjGgeCs4M94=;
        b=XJV9iAFlSYp8VI0/amKZOc3tZex/c2wXJsySTf/6hi4rDq05k5C9tLapYGaWETgJ4N
         kBtjzXBQD0oJEVLEeBC8XhdIBB1tn53JXzPuTYZ16RzEj9LjRf+Ntgt0wOxOkwKNvdxv
         VWWzI1sNLj6LL8ZBB4NtWscRnSUBz4w7R2tPUkYuDlPP/+grHpy8rgnCphMWz6+pBuC7
         MhtupAPIXZcCY6Xza1VZIqPVC3JEC0snm+z87oO8d9egMV8PaxmxLd9iJWCroPJFGVBH
         dUaBeyeLlZnx9Zj3TdJ/u1i/XicQS8oXAxosAqi5Vy1blGVPYoXSmsCCKBDCADW0ZaER
         FYFQ==
X-Gm-Message-State: APjAAAWmRLWqPeSDazOKWxuD5EDa0WBwclSXUcZ/3rShrJN3fR96umeM
        9Os2j99eqZNuojkYxbFJa2f8Lm+e
X-Google-Smtp-Source: APXvYqwbuIaDtL7b8C9pQg9gUX865g50i20scidHgn7uhVK3U0lWwD1oGQ0rGF9/pe5xjC8Vj1J8DA==
X-Received: by 2002:a05:6808:a9c:: with SMTP id q28mr261450oij.130.1569334673055;
        Tue, 24 Sep 2019 07:17:53 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id j11sm555543otk.80.2019.09.24.07.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 07:17:52 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 0/2] cec-compliance: tuner control
Date:   Tue, 24 Sep 2019 09:17:50 -0500
Message-Id: <20190924141752.5508-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series implements analog tuner step increment/decrement as well as performs
cec-compliance tests for: select analog service, give tuner device status, and analog
step increment/decrement.  New tests where added for tuner step increment/decrement and
existing tests where refactored for select analog service and give tuner device status.

---

Jiunn Chang (2):
  cec-follower: add tuner step increment/decrement
  cec-compliance: add/refactor tuner control tests

 utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
 utils/cec-follower/cec-tuner.cpp  |  49 +++++++-
 2 files changed, 186 insertions(+), 44 deletions(-)

-- 
2.23.0

