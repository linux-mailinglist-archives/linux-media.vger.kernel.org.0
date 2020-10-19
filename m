Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8024629319D
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 00:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388861AbgJSW74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388753AbgJSW7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:30 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9994EC0613CE;
        Mon, 19 Oct 2020 15:59:29 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n6so1438178wrm.13;
        Mon, 19 Oct 2020 15:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mRdnkcsdLNwwjQnOK6gF+dgMqAOBy96hOYGW1Q3s1dw=;
        b=t54wRIugJ4cb1QZDcDsX0UsUYhSJCAgjQuPq19P7Xe1bansdD/lyZVWTZvtzJ4Ieie
         RLgsX7a72KpWv7rN9VI1cBBZAt98Ao9jksY92iwY3d0acRkMU7ZpxMmRe/1gNUdRMwte
         JUlyUoNDlbZ6rtbXa5sqq0IcpFnm1QWiQeyr1gLb8TOtY+L3p3zHppKXzIwgrww72vwt
         nVlhg5+SnH3Tk5CQwp9RL85Qw0/+LsY+ycK0j5SjrXWImU7dHbcZrnAVD7Do5l/7KaR8
         afpVkYqoxENUA6h981UnyMeFWZUnJBQNfLSIbpOzdJ2uPICCYblwwyuaNVRfyvs3ooJD
         OCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mRdnkcsdLNwwjQnOK6gF+dgMqAOBy96hOYGW1Q3s1dw=;
        b=ilNClYUXssjdLvZWpsTQbeuX35w7iTtExnT9myRvNyu0sAHSw9gUUfekDNCwyBRQ3n
         oGEv1UWRZaoMfTXsAzih/EoKq6OueSGHsCA7TCl/0qkuMngJOhYrWVE/QrpqWIndGY1H
         6lQSQLBgRV9JbS8AMauxr4ILVL4IaXAYgKc33WDDZeP8rPwy/H/zm7rWvSAQ1PBH/v0N
         IUhidTJYhDubedBSqeNcwLAMwfjYUm6ptfmdaPgSoLkCPFXCQO9jrtlPpFEt1bOFtKEf
         UxRNwTWjduywgbCd5wVrtalq763lNXP584B8WsxM42me29RVHzffTC4PedwyEOX8TWkJ
         2tRQ==
X-Gm-Message-State: AOAM530cguCgB8bmOEG/KYXPHTuqEA64G0XtYSZ0NtmgoDiFM9MNzbAe
        9j5/6UYTcygjtN9+QwgM6UIocOihgPZuELaz
X-Google-Smtp-Source: ABdhPJz490k89oKoeo2SNbesQ7GYPH+pTXRY+aMdMPL53DThG2Olp8cp+HhFE79169rwBiYpxA0fTQ==
X-Received: by 2002:a5d:4691:: with SMTP id u17mr1654266wrq.324.1603148368016;
        Mon, 19 Oct 2020 15:59:28 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:27 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: [RFC PATCH v3 5/9] ipu3-cio2: Add T: entry to MAINTAINERS
Date:   Mon, 19 Oct 2020 23:58:59 +0100
Message-Id: <20201019225903.14276-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Development for the ipu3-cio2 driver is taking place in media_tree, but
there's no T: entry in MAINTAINERS to denote that - rectify that oversight

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced.
	
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 43a025039..5d768d5ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8851,6 +8851,7 @@ M:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
 F:	drivers/media/pci/intel/ipu3/
 
-- 
2.17.1

