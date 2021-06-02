Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A4239847E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 10:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhFBItT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 04:49:19 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57325 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230517AbhFBItT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 04:49:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oMXElTqt9IpGyoMXHlP1M5; Wed, 02 Jun 2021 10:47:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622623655; bh=GeBnTPsbpVKLWCT7oZPo+DnHu/e6dwvW2f1gxsMyohU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MwVq85Xq7OQah8Nk+bbZKrPaVUXNf/sC8s92MVT0CF+8MKvXdcQe7qAj7eqBXTdSF
         kw0NY1GlygT3Pw8JtDmLBrCnLAVQY6MyGKyrSy/M+KKqzsx9yHkeL/SNKBQKKOenkq
         ztNHv+ZEuW3Qbbmrwd8woxyOibaOYBa3TAx7p4X2xcrlYkpZRQDXFBJ7tLIqMx5S+6
         FrdWitaJdFMkChaY1trqAI+dXs966SzjIEx1GJaAIQ2bRXy0FXjd09FjegNaeTEf1U
         //Laa//aKpnODbLZTBSF3tJz2RH2SeeuHmxJj9Vu6QmzMUpyYbzSRL4hUfPRGdX26C
         WPc8jtKOfpJSQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] mc-request.c: allow object_bind in QUEUED state
Message-ID: <f4c01888-3aec-5d4a-ff3d-d2b47368fc16@xs4all.nl>
Date:   Wed, 2 Jun 2021 10:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJZw4oLeE5/ILNITRzKt0vz4ukMrtZ0nPz6P75pnNH8jFHtNw1cZ6s9O3cY5tg2U5VlLKdoke5jnG/2JfjMzXQBdey1VA9HQwsE17JLSGmsXO+stY1Vk
 dEYeO1bwCYHbhryv/ZXV4HT19SRLaC+KprGb6lPvOF8NklQfYQGcHm4TmZsXp8jPmwwm9YR45/WSkPe3l5KVmvUI0FrsI2TyUaI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a request was queued without a control handler object, and
a control handler object is then created and bound to the request
when copying controls on request completion, then a WARN_ON in
mc-request.c is triggered since at that time the request is in
state QUEUED, and not UPDATING.

But this is too strict, and in this case it must also allow
binding objects when in state QUEUED.

This patch was unfortunately lost when the "always copy the controls
on completion" patch was posted, it should have been part of that
commit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: c3bf5129f339 ("media: v4l2-ctrls: always copy the controls on completion")
---
 drivers/media/mc/mc-request.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index c0782fd96c59..addb8f2d8939 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -414,7 +414,8 @@ int media_request_object_bind(struct media_request *req,

 	spin_lock_irqsave(&req->lock, flags);

-	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
+	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING &&
+		    req->state != MEDIA_REQUEST_STATE_QUEUED))
 		goto unlock;

 	obj->req = req;
-- 
2.30.2

