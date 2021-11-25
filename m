Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFFE45DE09
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356146AbhKYPyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 10:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356159AbhKYPwx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 10:52:53 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CD0C0619DA
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 07:42:15 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qGt0m82Mj1HGJqGt3m3amy; Thu, 25 Nov 2021 16:42:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637854933; bh=7op/u1FcVhez44oP/59NwNcKffLHgN7DToQFbcHC65U=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QHm12dvl3D1TG02LB71VMWWEkwXL49fcDc5z6dT2wtQDaFuKmjzZPUx59HOKVlGgR
         B6PNc9vt2D9YGIY9+JTQVKq8ALKJOqE58roDwkFg6qSvvSff67PYC7TJFY4BEwNA6A
         w/zkUnpc1/R4XiSjvWYd9V5F/tJijBQZrn/hqzEdsEEUOpVjIvV5PIZ8cUB0C8avmx
         y39JMA0xV/M50MGEAfCPf5Dh3CQf0cpCMGAtfoatXJqD2wOh7vA8lTuCSXjWEFmdeB
         HyF8fhbwCAOW5z2uaQSMA68bNJqkOQqHOKDNExug2GGeilfWqK3swifi4eHBNFQe3T
         xhjBgZ6r+dtpA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] hantro: drop unused vb2 headers
Message-ID: <e371c424-18de-71cf-66a1-f186d88409f7@xs4all.nl>
Date:   Thu, 25 Nov 2021 16:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJJ3uj/5rda6UzUkaQgY2Ji4k15ifHickoIUdqsLWt0QijRVaK+0xPBbgVmaV802tqkwbaFwS4Ffs0Dl7hrt1J0OzgRVJ6MqMpDb4vjXY0ITQktKH/2n
 JE5UzhqhErpbFwZa++fa2vrXXTHZrmFmHR4Ir/M8VzMCHufYgpdL7eOjof0z+j3j4rOBKWHJrINy8NLh1HWVUs6gvJTFes9m20Rm+rnmUITYAQivA8TV8O5B
 iEn5GnxiK1kzUfTZhVvB6H+1nWn+dAI2IewF9IQ7gIootZ/B7d2bEmN32KlgedFq
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hantro_v4l2.c includes media/videobuf2-dma-sg.h, which isn't used.
And in fact, hantro doesn't use the vb2_dma_sg_memops at all, so this
is confusing. Just drop both videobuf2 headers, they are not needed here.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index e4b0645ba6fc..c319f0e5fe60 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -23,8 +23,6 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
-#include <media/videobuf2-core.h>
-#include <media/videobuf2-dma-sg.h>

 #include "hantro.h"
 #include "hantro_hw.h"
