Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339303D3695
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 10:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbhGWHmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:42:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59411 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234263AbhGWHm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:42:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 6qSRmWaaWXTlc6qSSmAKCE; Fri, 23 Jul 2021 10:23:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627028580; bh=/oObasBvh6BxPQoqcMXwC7ygC2rvHQBai1B3H0oMhsQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WyWywwkwvUao7hnwQlTXChYQ5b1Ssle61P6woO+dIWWnPqkARCANdr0Giq85YWx2t
         dmaJBNHmbvhWsiDoHZhnObZWAw1VhquThSBiZ5J5uACwdf4EeMtho7fNVOhNtPM2Kt
         so86A8gf0/goWFaOaaqWSxUtXPOxcqQQR7k+iUvZbfQYZAfrxddp9BKWaOPIRYfirm
         uShvQKxKLrPvIHO6x/+G5EoBPMnmXp4oCavl6j5RjSI/5WJde0iy0RlhkrnBsUSdiB
         XkhruQL9mPZR5Uh7+xwAR6e2LEhryDjqJs9Hus/0KtchHGO77i9NMe/yu8mw86yt08
         Y/+eT0rkt8iSQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-dv-timings.c: fix wrong condition in two for-loops
Message-ID: <b9817b55-cfaa-0cc0-9f84-32867a7f446a@xs4all.nl>
Date:   Fri, 23 Jul 2021 10:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI4tzQ++7ScmHXWORlVTrOUgxNtWo9YfHfamz73yHoB8Q5fy9m1d9wBZSkWiZNO/2JqlcOh+FsEn8Dj8Zm7DX3PknHC5tKk9Wr3GLlo9LPnmH6s4+8Z9
 bIJvX5MG3dx0/OtiyNTv2f+DD60yN8Semyfa5DA2N37mDVt8I/uZIvpQZEsn092WJLbwHP/7El+G+76yP6bTLgfEmYDiruvO6k3vC4sWb0iLPjWE0WNT5eWo
 10sMXnPJEo4JJq9bjhS9+9fdY3ZqTKxDlaX4cIGeVGnVnSa6joXTY0p45sz5qWefzixsXRlu9FHcAMyLX4hVsA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These for-loops should test against v4l2_dv_timings_presets[i].bt.width,
not if i < v4l2_dv_timings_presets[i].bt.width. Luckily nothing ever broke,
since the smallest width is still a lot higher than the total number of presets,
but it is wrong.

The last item in the presets array is all 0, so the for-loop must stop when it
reaches that sentinel.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Krzysztof Hałasa <khalasa@piap.pl>
---
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

