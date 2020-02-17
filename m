Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 774CE16146F
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 15:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgBQOV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 09:21:58 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56105 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727193AbgBQOV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 09:21:58 -0500
Received: from [IPv6:2001:420:44c1:2577:3074:af58:17a5:9c72]
 ([IPv6:2001:420:44c1:2577:3074:af58:17a5:9c72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3hHVjagdV8i433hHYjXIJ9; Mon, 17 Feb 2020 15:21:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581949316; bh=TtYrBkYaKLJu2gSQkN7pb606P6NLjJp9jCW7dEv6+2Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rH90MFyABSiHugr6SmIuaf/biXvPoUkxTbcKG+yuqxnj6wf8Fvw4EwA1ymmhUfqM7
         WWDqDknefpmnfJJAvDuJcvaGz5tHfb5j3goMEoC1kwEdwqj6ZVzLp1wZ5zPHGm5Fjn
         IQhwisdJuR07cF+3ijGBrjpR+k3IeqO2Ay2z6MmjD2ple/NX81/F4kerCEHvJup+YT
         wvwIX4jNyG6r6/UlZ2ap+yX14c7lcA7otLo/jC+PZJpddTYbdkqTr0HxqBKfmidYib
         wD2Lh0KZOGyfPv9765R/fnMBRa2G8vP4SIxvMfcn4TaqIrvWWo0I7JMd3ydepe02zy
         M7JUyn6VqR24A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] videobuf2-dma-contig.c: remove spurious 'b' in message
Message-ID: <687318c4-1376-b4da-30be-7adbda2ec04d@xs4all.nl>
Date:   Mon, 17 Feb 2020 15:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL7bzXqH7pCezG+nQWFqXXUDgkL1HAB2Ew19mVz7zs8Mf6Zpv7V4ofB3EwA1TVpaDPTkrItAiuXh5ubkAxbHxAlsI6D7/kkMd3iK4f+1ObFlbwrL7NuW
 5gX+2Efj252FpaZkyOdP11yUZuiET2JKfRCEsYs4H8N35T8ExFl/DEVdE2cWHxCYBw64+r30jnPmAdefdi1umZLT+aG6kXBYLJLH1EhdN2hCX5Fb/nVvymqe
 swgm+nHZU1wJe9sp726DFh5P1GqahE/CBp6hUk61YA+Zo6PSYsoet7eifXbZ0UHX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a spurious 'b' in the "contiguous chunk is too small  %lu/%lu b"
message.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index d0c9dffe49e5..de12312a1e6f 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -593,7 +593,7 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	/* checking if dmabuf is big enough to store contiguous chunk */
 	contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < buf->size) {
-		pr_err("contiguous chunk is too small %lu/%lu b\n",
+		pr_err("contiguous chunk is too small %lu/%lu\n",
 			contig_size, buf->size);
 		dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
 		return -EFAULT;
