Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1295D2FCE56
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733146AbhATKgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:36:51 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54385 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731616AbhATJnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A18l8jEC; Wed, 20 Jan 2021 10:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135790; bh=hzRq6gcUKb9kyoq3Szr5E1bDwNwDQ12pPde39gwBv3M=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=f1L543L1yn7ODN01uLgcE2kSX+JpKR4/u8hnH6PLW0GGMVzfyk9NAQqUqFs/z/78p
         cravbxN1fAYKWyScpux0s+ESbChizJ4mdhMY2L1GiN4sfXWcozNR4mS084jjK/1bgU
         5VtWu8KCJPB9rSuD16GZoFH9UI7XGCBb0ejZM1obgK2aYVZwYM4Zx6GJeuCiDQLpxN
         DiRMQvZBZDAkH15JOLvqJOwpbp6K33WRD1PD9ZPZjuBTUJiPwtE27M85ElMoRqyQoC
         ef6TiwSjkPDtDQiC3FJApIgsnFXjLaiHAD5B0thqnhNksybFv2E2mzRompcA+3bv45
         C48uH0B67WyPg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 03/14] meson/ge2d: set ret to -ENOMEM
Date:   Wed, 20 Jan 2021 10:42:55 +0100
Message-Id: <20210120094306.784318-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGCYqhuwV3+Yk1rv2QJDZScmo32gHmrOGHUW680tMvz8mG7tCBVf9OnohmtN4nL1GUNY/zfLKBZtYzV8Xbr2NOg5rrxGzfqKLgJgrvnqWJC4O9RuLB9k
 4+VfNDbmV2VhmkuyyJOenL24yx7QFERp9o2SQ72ibKL0wbJ7Hf8SEVIm0JL+mHbYV7hUgZNj6H36R7elzTCc5UMO46UrRVuc1FprAlm6JDtpBOg8NKiw9C2V
 WmJ7HTddDRRKbNYr521QD/4NNZeYi3N80Mo5YI4icZY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this smatch warning:

drivers/media/platform/meson/ge2d/ge2d.c:991 ge2d_probe() warn: missing error code 'ret'

when video_device_alloc() returns NULL.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ge2d/ge2d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index f526501bd473..153612ca96fc 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -988,6 +988,7 @@ static int ge2d_probe(struct platform_device *pdev)
 	vfd = video_device_alloc();
 	if (!vfd) {
 		v4l2_err(&ge2d->v4l2_dev, "Failed to allocate video device\n");
+		ret = -ENOMEM;
 		goto unreg_v4l2_dev;
 	}
 
-- 
2.29.2

