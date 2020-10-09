Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD8C288111
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 06:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgJIEQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 00:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgJIEQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 00:16:36 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E49FC0613D2;
        Thu,  8 Oct 2020 21:16:36 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id p13so7971939edi.7;
        Thu, 08 Oct 2020 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AfwAzZgxUctq+B9Xwm5LEy7q5lioBZycU4ewFeC4ZrU=;
        b=YeuI3ZU/Q95zGksRh/xPkTQuaKMozCNBWHj+oL9M9Y/jIEAET0+TVTnhYDk17L2ESl
         Po3EAv7LSh0BdfZTBahj4Xy1jjUYO1LgqavXAlxotKM6x+sABn4BgRaGhKgoKq7D/APk
         FPr4i7RJkARmVt7oApHNvPtTRqrVTzYm6ZfV2QIAjAzQQiaRJdkfQoOGNNAYKyftMofW
         wb7IZkuTzm4cW9umXnEb5EiXn4h5X6ibsIHURgefnDZfCJ4mTXNZpOmimAKfdGTTTi+a
         tn/HA+9zLa2CEgg8sWAgZyRejGA8nWgbKoIoEZkA//EKEpMAi/lEmqsvvRmFjDDKi7ro
         HHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AfwAzZgxUctq+B9Xwm5LEy7q5lioBZycU4ewFeC4ZrU=;
        b=hSXVJQ2Vn7Zzjp8uz50w+J9mXDJwGeNyl0Jb0VScbCzeeWJVVm5Yupf9QRCJcuIRRM
         fMS24+cTZTMQIZLslA55S36sSGkHFR3bTGeYcYSQDC/cQuwBR8ia0C12m1wASQNC3wlq
         F5Fog+a2m/UfacKZ9aaTdcnC1Fwt+pDNnNkWg9rEouv3hWPZZF4AMpiG5Mc6Lje/kClS
         5gaT0YbgWh5dJGLGhCxHJ7xOAn4ztk0pBAqbOH+TSAXkrfK5Gl99XC2b6bl/LW9ARnpv
         4A+GZoeDXh3lx1kXOXjVrW4n2kgTRtAsmYgPeEuH7TZlp6vjnUKXp6JHBtS8iqUYzytt
         16WA==
X-Gm-Message-State: AOAM532KnLQ2AFdsdZL5P2wCaMUT31CvyplKglNuSXEMq2Nsje68ci/M
        XOtWZqRqPBMceNWCUzNqEyoVeSqJGMPbMg==
X-Google-Smtp-Source: ABdhPJyANwK4YJx0wVZaHj0CcX+4bLk3AB9hNGwkbJnRsWUmnv9UXC5XoaoqXKNU7nhJfS7T4UP/uw==
X-Received: by 2002:a05:6402:10d5:: with SMTP id p21mr12751645edu.14.1602216994860;
        Thu, 08 Oct 2020 21:16:34 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d6e:f600:80f1:4ea4:2130:b98])
        by smtp.gmail.com with ESMTPSA id o11sm5415265edw.80.2020.10.08.21.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 21:16:34 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Corentin Labbe <clabbe@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify ZR36067 VIDEO FOR LINUX DRIVER section
Date:   Fri,  9 Oct 2020 06:16:21 +0200
Message-Id: <20201009041621.17513-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 754f0f1ba8d9 ("media: MAINTAINERS: change maintainer of the zoran
driver") added a new section in MAINTAINERS with an invalid file entry
and at the wrong place for alphabetic ordering.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  Documentation/media/v4l-drivers/zoran.rst

Point the file entry to the right location and move the section to the
right place in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20201008

Corentin, please ack.
Mauro, please pick this minor non-urgent cleanup patch into your -next tree.

 MAINTAINERS | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 239ae2425cf8..6879ca545677 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19412,6 +19412,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git
 F:	Documentation/filesystems/zonefs.rst
 F:	fs/zonefs/
 
+ZPOOL COMPRESSED PAGE STORAGE API
+M:	Dan Streetman <ddstreet@ieee.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/zpool.h
+F:	mm/zpool.c
+
 ZR36067 VIDEO FOR LINUX DRIVER
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	mjpeg-users@lists.sourceforge.net
@@ -19419,16 +19426,9 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://mjpeg.sourceforge.net/driver-zoran/
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
-F:	Documentation/media/v4l-drivers/zoran.rst
+F:	Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst
 F:	drivers/staging/media/zoran/
 
-ZPOOL COMPRESSED PAGE STORAGE API
-M:	Dan Streetman <ddstreet@ieee.org>
-L:	linux-mm@kvack.org
-S:	Maintained
-F:	include/linux/zpool.h
-F:	mm/zpool.c
-
 ZRAM COMPRESSED RAM BLOCK DEVICE DRVIER
 M:	Minchan Kim <minchan@kernel.org>
 M:	Nitin Gupta <ngupta@vflare.org>
-- 
2.17.1

