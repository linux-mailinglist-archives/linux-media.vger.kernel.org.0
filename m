Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D0417BA49
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 11:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgCFKcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 05:32:53 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36781 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgCFKcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 05:32:52 -0500
Received: by mail-wr1-f43.google.com with SMTP id s17so813812wrs.3;
        Fri, 06 Mar 2020 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HLuYMSQllcx18fRUsdk3+JbI4I3Xuy/vr8tfNu+t2rs=;
        b=tAeCoptp4HxU26Cz/0DB1IZNml3WtjtOfFFKe+GKs/GhnRdeXQQFcfgifmsjzKBoFX
         2AzQtYxKQQMPrtEt9H4ZEmK/gDB4IAFT4uDwFZotTurIRmMuDAygtgigT6FOwf2LaTcW
         177GGMoUSAXYufyq/H3KvsyxS7k+n/QVeK/ASFU9RXKLU8E01yIvkw/aA2cbDktCxMDw
         8ZlAjZinB5czMG36Kj6FwJEFhoU1UWC91iVXpU3mh97JzHEOtOUlQjzPrbwyvjIsEZ00
         uI03k/tSGp2jljMl3QEODzmnUliynn5+hx0TB/xhnqcQIdvcMT6Vkux2sIRFo1lQ/1ob
         Kw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HLuYMSQllcx18fRUsdk3+JbI4I3Xuy/vr8tfNu+t2rs=;
        b=Jwx5Qi6IsBqAT449eC87BBFr9asAL0Ewn+Stg1TUfelwPz/vcHdn8q020ZJhj74572
         m+fAmjZJBqkoIwKm3SC7JYxjR3q7oLjfXM9WioV+e+ckE4zomblCQg3IqWrWQI3c90+d
         IAMdx43/1VbxewVx7ytbyh9kg6TBCzMFEViKS2J32L6xvOsrFG1L3N7KXV+9CSKEMl3V
         UyEfVXPxIbe4KK2qbM+U2VU2yA0LHm1mmCUvlC1/MaPnTw3r/uFLqCXR52ci3/V6BI74
         Pa16J5C2Y+wm4HvGa6qnqhsqvhFgI10rv3QRZY36OKN2QNKlBlUNFClulKu0+beIlKxl
         a7Kw==
X-Gm-Message-State: ANhLgQ2NHuu0ZTmmDhqJGchFloFvSoxgrSxA5eT08Q6DoGAgTroC9xMC
        sT3aLBE5ieond97O8WaFq40=
X-Google-Smtp-Source: ADFU+vvznj2gIRY0guDy9bXHXIMZxnkgN3x8Wmdt6oCJdb7QynBOG8kfzrfqb6n2+RFir37KXEJymQ==
X-Received: by 2002:adf:a4c4:: with SMTP id h4mr3369283wrb.112.1583490770458;
        Fri, 06 Mar 2020 02:32:50 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:7009:9d38:36e8:7030])
        by smtp.gmail.com with ESMTPSA id t1sm1251111wrq.36.2020.03.06.02.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 02:32:49 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] media: i2c: imx219: Feature enhancements
Date:   Fri,  6 Mar 2020 10:32:43 +0000
Message-Id: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series does the following:
1: Makes sure the sensor is LP11 state on power up
2: Adds support for RAW8
3: Adds support for 640x480 resolution

@Dave - I have tested setting RAW8/RAW10 formats using media-ctl
application, but was only able to test streaming for RAW8 (640x480)
format due to my hardware limitations.

Changes for v2:
1: Dropped setting the format in probe to coax the sensor to enter LP11
   state.
2: Fixed switching between RAW8/RAW10 modes.
3: Fixed fps setting for 640x480 and switched to auto mode.

Lad Prabhakar (3):
  media: i2c: imx219: Fix power sequence
  media: i2c: imx219: Add support for RAW8 bit bayer format
  media: i2c: imx219: Add support for cropped 640x480 resolution

 drivers/media/i2c/imx219.c | 250 +++++++++++++++++++++++++++++++------
 1 file changed, 214 insertions(+), 36 deletions(-)

-- 
2.20.1

