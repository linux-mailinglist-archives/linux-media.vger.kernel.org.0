Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8309216DDE
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 15:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgGGNhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 09:37:18 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55315 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbgGGNhR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jul 2020 09:37:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id snmBjDG0DBncFsnmFjwTX1; Tue, 07 Jul 2020 15:37:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594129036; bh=m1lovtgu8lbAX6vIMOZiP3JHr1/qY/7JCx9EGUnpFrY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=djDTOieHfFI7UIwiCSISoLr8kGIftX2AZ8ezSmEG5eSGZvr3c31lNcvJzw4jTHVOt
         T0xMMZKXskLZk+OuSH90b1e7PR8gso57yO1pBEtIlwSnhOsFyKBgQhd0rgaZ+3H55u
         reuDoShZckUweLogFRZ8A2fYLL/JGgga2rcUNHTeb+Q5gGtlC/X01scvOuQqliMxkQ
         7d61oEvTLuuas6k3bgbEnlu8p0dTGjYyzfED/9/pson6idobJ7fBLs2o5vLVm4tYIA
         wy3IfylCZ8D4ZaFCsZN1iJVGC1qWVw7x1dbTAJfJSpQuh64t0PUlovYIEobSjAAPnc
         jl/0O+O1cm4Pw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] sun4i-csi: call _vb2_fop_release instead of v4l2_fh_release
Message-ID: <8002e999-feb5-8715-9e1a-ed67165ade7e@xs4all.nl>
Date:   Tue, 7 Jul 2020 15:36:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDiPNwSLgZvm9yLru2cMd5wiz+uJgNykyjcI0cQXinhL+8IbJA/WG/hshx89dz0ziCgUy91Nptx5gtM3Jn9jvetlqzOwWqXFld7siq/sZBVrPm72muJV
 7XyhZjsTa+SnEhDnSM5ygv3BmmUmIz8bBl0unOBPQ2R9zo84ULeKqD3AqkLAVfCO75dDzRpV0RR+roxZibgPtBtsmvl/Grus/hg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver didn't call _vb2_fop_release in the sun4i_csi_release
function. Without that call the vb2 queue is not properly canceled and
buffers may not be freed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Compile tested only due to lack of a suitable sensor.
I believe I do have an ov7670, but it's in the wrong country :-)
---
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 1721e5aee9c6..8f4e254b6a41 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -242,7 +242,8 @@ static int sun4i_csi_release(struct file *file)

 	mutex_lock(&csi->lock);

-	v4l2_fh_release(file);
+	_vb2_fop_release(file, NULL);
+
 	v4l2_pipeline_pm_put(&csi->vdev.entity);
 	pm_runtime_put(csi->dev);

