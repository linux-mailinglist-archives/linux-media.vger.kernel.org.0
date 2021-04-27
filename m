Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966BB36C444
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235760AbhD0KiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:38:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235370AbhD0Khl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:37:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31ADF61164;
        Tue, 27 Apr 2021 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519812;
        bh=Pa3agcyz2NtuVM1ilvYU8h7J+lPkNnKb5CQvR3SYI/E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=B69cMouiuHpSe3mPDuw5C/o/LAejhv6XpeioJvn43Fi9BaGuINCYDnxYJxIM7Z6vK
         spCHxaebUv6lD1tQ+6sfbV6jsPsjv4O8W20DWiTUJENniNfVUUke9Tf3UJCbHdne6c
         0Nz04k1X8tjjjJRJunAR2+dGqWOrWJv+qLvHqrKeLkwzgaRtsa7yiQ5b2vDrUE3tDo
         SsAwPAEiqs8KFgEql5pf263/Jhe7I9eyOnqybU45DXaKCqKHvZ24al0CY6W6bnZ5tA
         fGHjqLt5jJs3NtaEa25WlwKMbukhgtOwMfxywljAWXj1xmm+Hk8wBv0+CyIERDeNN0
         Ap9jC7LXEF/ig==
Subject: Re: [PATCH v2] media:exynos4-is: Fix a use after free in
 isp_video_release
To:     Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
References: <20210427060255.3318-1-lyl2019@mail.ustc.edu.cn>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <a56d14d8-5be6-24ff-24f1-80274320dfe5@kernel.org>
Date:   Tue, 27 Apr 2021 12:36:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427060255.3318-1-lyl2019@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.2021 08:02, Lv Yunlong wrote:
> In isp_video_release, file->private_data is freed via
> _vb2_fop_release()->v4l2_fh_release(). But the freed
> file->private_data is still used in v4l2_fh_is_singular_file()
> ->v4l2_fh_is_singular(file->private_data), which is a use
> after free bug.
> 
> My patch set file->private_data to NULL after _vb2_fop_release()
> to avoid the use after free.
> 
> Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> ---
>   drivers/media/platform/exynos4-is/fimc-isp-video.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index 612b9872afc8..2e04589068b4 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -315,7 +315,8 @@ static int isp_video_release(struct file *file)
>   	}
>   
>   	_vb2_fop_release(file, NULL);
> -
> +	file->private_data = NULL;

>   	if (v4l2_fh_is_singular_file(file)) {
>   		fimc_pipeline_call(&ivc->ve, close);
>   

Thank you for the patch. To ensure the pipeline stop call is done
only when the last file handle is released we would need something
as below.

--------8<---------
diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c 
b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 612b9872afc8..3335fec509cb 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -306,17 +306,20 @@ static int isp_video_release(struct file *file)
         struct fimc_is_video *ivc = &isp->video_capture;
         struct media_entity *entity = &ivc->ve.vdev.entity;
         struct media_device *mdev = entity->graph_obj.mdev;
+       bool is_singular_file;

         mutex_lock(&isp->video_lock);

-       if (v4l2_fh_is_singular_file(file) && ivc->streaming) {
+       is_singular_file = v4l2_fh_is_singular_file(file);
+
+       if (is_singular_file && ivc->streaming) {
                 media_pipeline_stop(entity);
                 ivc->streaming = 0;
         }

         _vb2_fop_release(file, NULL);

-       if (v4l2_fh_is_singular_file(file)) {
+       if (is_singular_file) {
                 fimc_pipeline_call(&ivc->ve, close);

                 mutex_lock(&mdev->graph_mutex);
--------8<---------

Regards,
Sylwester
