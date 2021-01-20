Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A692FCE6D
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387650AbhATKle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:41:34 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40217 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731658AbhATJoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:44 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Al8jF7; Wed, 20 Jan 2021 10:43:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135792; bh=DPEsPco8QmKy9HybatKhPIkZ08H34N8xzyBedSbzkIY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=D5kPFClva7eV+DWAkjynLN/rwBM5BQZK2KoqrBDgwfx9JazNDP7Ez29XjQ2vroyqL
         c9GD6v5DfRXXC9LbjW86GPp+fWuv+Cx8aai0QBJqPDN63Uc93d3woCQWvxEU7kkrtp
         HuwJEtRgDVpjV5MwWxC49AxAGW/M1zzWM1A/haMQQxubDf4UVv5YH5Q+7BR3WIm8Uy
         4ELb2vJEWwzZZVn/oKXDScgk3BvzrPBKyuGUXjFc3Ju8pyNnEc1xIEpU6YyX6AFoIv
         weDapCr+0zkDxH+7E3/Q0SAo3G5wGG+Ax5jJll7FptjnQyOGEVEerQ7ordYrZQhciA
         PDzv58cMks2aw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>
Subject: [PATCH 08/14] sti/hva: add missing clk_disable_unprepare()
Date:   Wed, 20 Jan 2021 10:43:00 +0100
Message-Id: <20210120094306.784318-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfORkKQX5gN9k5kFaBKWeo+8JRWkTLMzG6fpWfMxdBNifkxq9v62lX9Jj+rbzuwPnakICu39PzPg6MMJv16bir3xVLnIVCkM9B8JQVe0xWy2saKwmQdGd
 m2SpTLrwFJwp9zBW1P1/x4g1u/iRmZS8OTIXiETopGzzwZ0FpBe27E6Im3OLUCU5bTmJMl0cInRss2P0+vZRDlzZCxq9BSOHthjp/OylirLZtBJRy8e6spBI
 CspxGB5zQPDsjib/hcvDEFJF2kanhb4tTfo3PC+dh9aYnypScjkYW8f7cWB5e4hB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this smatch warning:

drivers/media/platform/sti/hva/hva-hw.c:453 hva_hw_runtime_resume() warn: 'hva->clk' not released on lines: 450.

Call clk_disable_unprepare() when clk_set_rate() fails.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jean-Christophe Trotin <jean-christophe.trotin@st.com>
---
 drivers/media/platform/sti/hva/hva-hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index 43f279e2a6a3..f59811e27f51 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -447,6 +447,7 @@ int hva_hw_runtime_resume(struct device *dev)
 	if (clk_set_rate(hva->clk, CLK_RATE)) {
 		dev_err(dev, "%s     failed to set clock frequency\n",
 			HVA_PREFIX);
+		clk_disable_unprepare(hva->clk);
 		return -EINVAL;
 	}
 
-- 
2.29.2

