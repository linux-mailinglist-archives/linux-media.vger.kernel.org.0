Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC574404B2D
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241242AbhIILuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:50:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242219AbhIILse (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Sep 2021 07:48:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 115826120D;
        Thu,  9 Sep 2021 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631187805;
        bh=kqaF2kdpyKuBuKaT20mI9yFo8DzOL4OTh5ZkI/2DHyc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PWi01FPL5iUniKp5ZGawxzXGroSgA75ofqdErL1W7YFjMlFe5lzpHvb+VKphP/ux0
         bsXAWxw8IPfAUrxS2cgsvD3zfmDkBUUmgZwjNo0yOhQlWBrmiluz7M/94fO/v9QpLz
         qVZmAMVC+1Om5E5phKzKl0hfXZHOqusx3pRVfPJVPerVaE3v/C101X91QJqbkVa6F9
         jWzsOV2GLCooWyY1lwYfbq2K+38Lj+FUpoBxA59CS/GpNkaz5kbnqgCHwCSqr3FqbE
         h/CbVFC10L9VUbde+XYUTXt01IQuTdXvexf2F8P/Dd83agNZCfeLzw3OyNm7jrAz+d
         N2E8Gq70cDKng==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 108/252] media: v4l2-dv-timings.c: fix wrong condition in two for-loops
Date:   Thu,  9 Sep 2021 07:38:42 -0400
Message-Id: <20210909114106.141462-108-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 4108b3e6db31acc4c68133290bbcc87d4db905c9 ]

These for-loops should test against v4l2_dv_timings_presets[i].bt.width,
not if i < v4l2_dv_timings_presets[i].bt.width. Luckily nothing ever broke,
since the smallest width is still a lot higher than the total number of
presets, but it is wrong.

The last item in the presets array is all 0, so the for-loop must stop
when it reaches that sentinel.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Krzysztof Hałasa <khalasa@piap.pl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index 230d65a64217..af48705c704f 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -196,7 +196,7 @@ bool v4l2_find_dv_timings_cap(struct v4l2_dv_timings *t,
 	if (!v4l2_valid_dv_timings(t, cap, fnc, fnc_handle))
 		return false;
 
-	for (i = 0; i < v4l2_dv_timings_presets[i].bt.width; i++) {
+	for (i = 0; v4l2_dv_timings_presets[i].bt.width; i++) {
 		if (v4l2_valid_dv_timings(v4l2_dv_timings_presets + i, cap,
 					  fnc, fnc_handle) &&
 		    v4l2_match_dv_timings(t, v4l2_dv_timings_presets + i,
@@ -218,7 +218,7 @@ bool v4l2_find_dv_timings_cea861_vic(struct v4l2_dv_timings *t, u8 vic)
 {
 	unsigned int i;
 
-	for (i = 0; i < v4l2_dv_timings_presets[i].bt.width; i++) {
+	for (i = 0; v4l2_dv_timings_presets[i].bt.width; i++) {
 		const struct v4l2_bt_timings *bt =
 			&v4l2_dv_timings_presets[i].bt;
 
-- 
2.30.2

