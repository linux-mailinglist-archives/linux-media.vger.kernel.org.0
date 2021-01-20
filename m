Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD83E2FCE67
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387454AbhATKkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:40:24 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:59895 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731647AbhATJny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Al8jF2; Wed, 20 Jan 2021 10:43:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135792; bh=jk8ExUIRHzkWPr8vA/2/QT51ujbhxJnmlqq3kXlcOZI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=djYrzza9uBAIQM4zTdQsgST+2WHIJtWnh2n6vwBNn17yhkm+Pu3qRS5qtxKhe+0jb
         xSP3P/J17m24pUnS2YQoOUYFF+yPvCqY1Gn8VwUqgiVpMxJaL023zwZunVSW+Chk0o
         jESU/qJ8/OH9AqVMsRlsKdd6oAxwlPQEz7uJf9mVPCvbfKKgYbJ9/u6MP6l+tMHelI
         It1iScmhaAwbEICWpHO4e/o/QoYzANb5RYMaDPGwV8Je37Uilbs5FpAeBMoFsgBA20
         UIjvaXogr8R/yaTaLnohisNsNcAm6TamR3hIMyvJg9ONVUuQ1ZZAEHwXkx9v2S47oo
         qL4Sxh9R9+vgg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/14] sti/c8sectpfe: set correct return code
Date:   Wed, 20 Jan 2021 10:42:59 +0100
Message-Id: <20210120094306.784318-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfORkKQX5gN9k5kFaBKWeo+8JRWkTLMzG6fpWfMxdBNifkxq9v62lX9Jj+rbzuwPnakICu39PzPg6MMJv16bir3xVLnIVCkM9B8JQVe0xWy2saKwmQdGd
 m2SpTLrwFJwp91ObOojllz25+H8lTtAoDwLHG8jZpGrKrwU7APww6+sf1nrLb4EicX2xlBYvrLjBqU+uaG6RA0wJBMBQS9YBDMxonC7PwXWYQLCm2T02g8s1
 le9Lr6PJfCEpDuvg3Oefuw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this smatch warning:

drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:829 c8sectpfe_probe() warn: missing error code 'ret'

Set ret to -EINVAL if the reset gpio was not found.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index 5ceb366648b3..a7a6ea666740 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -826,6 +826,7 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"reset gpio for tsin%d not valid (gpio=%d)\n",
 				tsin->tsin_id, tsin->rst_gpio);
+			ret = -EINVAL;
 			goto err_node_put;
 		}
 
-- 
2.29.2

