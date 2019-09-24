Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84075BD292
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 21:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407827AbfIXTYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 15:24:50 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:42574 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407326AbfIXTYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 15:24:50 -0400
Received: by mail-oi1-f179.google.com with SMTP id i185so2691560oif.9
        for <linux-media@vger.kernel.org>; Tue, 24 Sep 2019 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsSs5mUDM1DiMT6UHJiVmAELsiRF5vH0pjFATrh7BGQ=;
        b=geBObsqFeMjvnGyA5CuqYpEZgC7lYIXVqXWEPhgjnsshZYgiKQeMGRaCuid/u8nMpm
         bJuZI/O9lJIMPlOZhJqay4LNGYVPQH3tDqe7V5i5kQBLQJ0p86Gw65jm7DBtPb0A2NRS
         OAekh5qrtIGfNqeXl5Rj6fhldQ+0A4n6HUa/YpiYhNJqE69+VqdymZacs76w6olYa7P/
         1F0kpOegdkjGJ3D5hqpcOhdXkhHMWnpBrnqemQz2RFfqeriT0pqsY7AbIK73MIFdbubk
         K4iojzkOp/UeGA2vcMGqiv+X4NJ9tT+BwV2UwvsKCgn7/fZVtUV3Lw8nbNRsuLWpVW7F
         0tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsSs5mUDM1DiMT6UHJiVmAELsiRF5vH0pjFATrh7BGQ=;
        b=Id+XAw/A7oziJ0YJHvTjTYqRAUlSICeOUSyC5gYFXR6xstfCTQF5MoHKwuPc0ZpPDr
         s0MPZp46hicENRbFmpo1rqeB4z6aLv61F63n3CZGbMzI7GNpDgHy2ddxCetm1Llmf6ST
         pg5LM9UMmarrnLHfSP+NmY+aV70ZJCtOVLnEE/mNyMGpSIgyIPpvP2Q1fPZGBJnm9Mq0
         jNb2G0aNrPThjQK+SDDixfhlSfD1G5vVZ5YE1qbaIdVBTJ4WaWu+QY6ZOBx28bH2cfjl
         RAUTC02pyYgkHxtpjcs4GUeKszHezSQPSeR+pba6sY+qTxuigGpV+zZiL+V0I5JjFBDi
         99kw==
X-Gm-Message-State: APjAAAXxYESYg3uy6/bPrpXxZAe8x4Y5xr41Gnyj7GtKRX+/d2y85G28
        Q+bzoUhOV9ho8pCa+wpen7MQx58N
X-Google-Smtp-Source: APXvYqwLpUoGbuH6xUH/goXfGRBlbEClMCTJZJjeqxI9HHCdi/LtOHFNzg1HFseOcAADi6APcVVJLg==
X-Received: by 2002:aca:d694:: with SMTP id n142mr1594844oig.69.1569353087696;
        Tue, 24 Sep 2019 12:24:47 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id v75sm833503oia.6.2019.09.24.12.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 12:24:46 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2 0/2] cec-compliance: tuner control
Date:   Tue, 24 Sep 2019 14:24:43 -0500
Message-Id: <20190924192445.93575-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924141752.5508-1-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
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

Changes made since v1:
  - Remove redundant error checking
  - Add circular wrap logic to tuner step increment/decrement

---

Jiunn Chang (2):
  cec-follower: add tuner step increment/decrement
  cec-compliance: add/refactor tuner control tests

 utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
 utils/cec-follower/cec-tuner.cpp  |  47 +++++++-
 2 files changed, 184 insertions(+), 44 deletions(-)

-- 
2.23.0

