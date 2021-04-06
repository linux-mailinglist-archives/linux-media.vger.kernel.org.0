Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E7A354ED4
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 10:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244432AbhDFImh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 04:42:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39149 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244435AbhDFImg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 04:42:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ThHkl3mrC43ycThI3lNFjZ; Tue, 06 Apr 2021 10:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617698547; bh=lcqWjwFrf31I9NhlkKKXonsdKIJtUwdCVBR8OrCnfms=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ANOkMVusQF/dWoksIIxpMKFuYt/M6Kmm5PLFtNWrn89MQam/E71nYwIh0pAAQFEv0
         fg90mlchNgEcKirdbAPvF+0HMsKqQYtR9WPwRLXn3aNIVzNi16wIpGWsFjsJnDUAP4
         3o9KKQtcIyOD7RtDlxLXizdqULAD5iWOR7dgh7xfKSEqTKO52VcRsydlNnWiYtqiho
         6GsW/sTVFA3Ql0n75dcNbV+Z4KvMZqeE/X78W9d6M2exd4/lAhUPHvTWHLYbBhWi7i
         0yExuV8VTrk3n73jTKsdP52R9VKBjIPMnCTdKf32SZq9dqTCva15kMpYNYeBk3dbNe
         vpTgQayTjbuiQ==
Subject: Re: [PATCH] media: videobuf2: num_buffers should record the number of
 all buffers
To:     Dianlong Li <dianlong_lee@163.com>, mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org
References: <20210329005917.2201436-1-dianlong_lee@163.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a58dc827-dd2d-d9a9-a7c1-f9117cfa3726@xs4all.nl>
Date:   Tue, 6 Apr 2021 10:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210329005917.2201436-1-dianlong_lee@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOpL6RM3T4w1eNJ9rt7s1dbmSzK0SYZI3pExbtLovuPIpU36Z0TDQMmIjwKTkNIDjpMkgF3NmMuYA06ori9B0gfs+k4NXvSPGn3lyliUp60anr957gFW
 bPZt6PXW9AtKUfflaTzOYt5qHemvtmg/KOCCyti7WJKFLRtgHu56XEw92c52lt051FrYIYajhsKDBBaazdfiBBgJuYITWyQd+wC25SDLy+10mqwyDbfkI78U
 VKfWNUEvj9VtXNW0yESiXV/J/4BhdZetpOf4IifJBoE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/03/2021 02:59, Dianlong Li wrote:
> The variable q->num_buffers records the number of buffers previously
> applied for, and the variable allocated_buffers records the number of
> buffers applied for this time, so the total number should be the sum
> of these two buffers.
> 
> Signed-off-by: Dianlong Li <dianlong_lee@163.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4eab6d81cce1..2716c4138655 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -836,7 +836,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	}
>  
>  	mutex_lock(&q->mmap_lock);
> -	q->num_buffers = allocated_buffers;
> +	q->num_buffers += allocated_buffers;
>  
>  	if (ret < 0) {
>  		/*
> 

Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The VIDIOC_REQBUFS ioctl releases all existing buffers (if any) and allocates new buffers.
So the existing code is correct.

Regards,

	Hans
