Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD80613CB11
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 18:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgAORc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 12:32:59 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33937 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726418AbgAORc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 12:32:59 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rmXGiQF5xpLtbrmXJin0xF; Wed, 15 Jan 2020 18:32:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579109577; bh=cD6Vr63GioPyEPPlQ9EkTw/mXyOYF4Qzm0PZ3Y6W010=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WYB9UyXFf/0887E6fSV8qZf8C9a7kI2akBW5SjyhnvPQOifzH0UlElwR0lyQHngUg
         TiD7SJOLmUHBuxBaoxTbis2qGFb8JrVleyzHi6X483cEII5KDUnm4qiukBPVJBmu4Z
         +FWHEUcmPPHcdzvqF3xlA01LhP0M7tzesqWOVJvmmUswrlVL2Vo/LIEkb40QTgubab
         aQFosw7IvjnfDDRMIFI3JQ9hEPXobn7Z39Bsth+Fg3W0fMTqDe/iY7ICSXDldpMvWM
         nJvI0lNLPcp655R0exH0jAWmBDCRlOF8YLMxGBGFYIZMTqxZ8Ue3LzdR3QP7+O6jhu
         H/wmCxyrXVhHQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vidioc-queryctrl.rst: fix error code
Message-ID: <f4414038-5051-1395-b73b-10900ca8eac3@xs4all.nl>
Date:   Wed, 15 Jan 2020 18:32:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLwFn8SGruIFpFuRN5t3yDFXhaIfkHhYH1r6GXjW8k15nPh5qSSQwacXGl5+kqxWSDHRxP2RwLPELODaPDuSVfD/AviaEW6uf2VpQ1OXJDmUmrGGO9ob
 U+8I273JJr6Q+x5hJklR+pDjojyg+qa1CU6v4IY4Wqrmbg/RHKlQrcJGd29t15otEJmWZmTliqI2yA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

An attempt to get a BUTTON control returns EACCES, not EINVAL.

BUTTON controls have V4L2_CTRL_FLAG_WRITE_ONLY set, and the documentation
for that flag correctly says that getting a write-only control returns
EACCES. It's the description of the BUTTON type that's wrong, so fix
that so they are consistent.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index 6690928e657b..22ff3c6abd9c 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -378,7 +378,7 @@ See also the examples in :ref:`control`.
       - 0
       - 0
       - A control which performs an action when set. Drivers must ignore
-	the value passed with ``VIDIOC_S_CTRL`` and return an ``EINVAL`` error
+	the value passed with ``VIDIOC_S_CTRL`` and return an ``EACCES`` error
 	code on a ``VIDIOC_G_CTRL`` attempt.
     * - ``V4L2_CTRL_TYPE_INTEGER64``
       - any
