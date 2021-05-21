Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9089038C235
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 10:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhEUIrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 04:47:12 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59307 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230442AbhEUIrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 04:47:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k0mvlsPi8WkKbk0mylzJKz; Fri, 21 May 2021 10:45:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621586748; bh=sMhzxY6RJX2DMqVPWIn7znuBa9bKFxALYpBDGt7yycc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D4wa8y2W/pXQxP8yM77p0MzGtlU6PZSIq4zsFE4OOGkua6SLVcam6N35ox0gMBQTL
         1fFLpCWukrjKCuVBauOL/BS37zJ/8MV5cWtT9SWontJPwsWICE1yXjj4SuaAgi8UiM
         lfMSLaT1IN1sS8N6+k2SJYr1u+tVt8tMiWc2MvsLp6q+ECmv4AVyQq9wey33uhyHFK
         48PpvCfY6rWOlrvVwPo1AHvOE7KDwqS/qwl0mXIIHOrKWFbv/8yRDEi0kjUBAUdq9j
         hwhpUt79piqqfvpjzUkcmUawTRwlLo3vmCvZVewC41tlldH7e2s2bRmq9QFCTqb/t/
         VOYRlJM6+KKtQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] uapi/linux/cec-funcs.h: set delay to 1 if unnused
Message-ID: <390df3d0-14c2-0e6a-8acc-b5355c36e3ed@xs4all.nl>
Date:   Fri, 21 May 2021 10:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfM69HHWHxpaZQbklLYweJio0lJTm3ex3ackmFLizEo3hrvNlyfjsjxiie6nXWxZ0dKoBze731uijzrDz2EGFcqNw8I6EasI1avuqMWe746bTniuE4Osl
 To3txn4ydWTBodl91ZghZ4JEiXQg1Jf8fQ6hPUQ/9WOo9IFOdLm2FgYbsCEr1nRquMgZ+MJq01swnFhqh2AROA6Rulyvnz8fE1Q=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the audio_out_delay value is unused, then set it to 1, not 0.
The value 0 is reserved, and 1 is a much safer value since it
translates to a delay of (1 - 1) * 2 = 0 ms.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index 37590027b604..c3baaea0b8ef 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -1665,7 +1665,7 @@ static inline void cec_ops_report_current_latency(const struct cec_msg *msg,
 	if (*audio_out_compensated == 3 && msg->len >= 7)
 		*audio_out_delay = msg->msg[6];
 	else
-		*audio_out_delay = 0;
+		*audio_out_delay = 1;
 }

 static inline void cec_msg_request_current_latency(struct cec_msg *msg,
