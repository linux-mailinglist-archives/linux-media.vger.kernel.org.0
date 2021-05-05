Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4B0373791
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhEEJcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:32:13 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57455 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231265AbhEEJcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:32:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eDs0lkg6lyEWweDs3lupll; Wed, 05 May 2021 11:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620207074; bh=1f2m7EYMttRsQnXbEhfemDohFdPiPwDAM81ywOimWUo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UpLNkD2W8VUOtGSl5shiX4yuPXA0FjY552bHDeayXXJ3caN/njoWO3i24ZqKUoQ8V
         4C55dfqvBdOyXSR2XHk8woIKVgmVRmJvEclx0cgRMPjKt3eqld6Xg3yJw3fVIeiiO7
         lWDTTnthGim5DcvltKy/paUSJG7i+EWSpyl+M13uHXJpvcZg97dZnfwzOVdudWaS+3
         uIKmF+QRREUN0XStCcjKSJgN7RlO+z/FkgxdwWu1haLHswZy89QL7YXzgufeCq3vcQ
         qaEfAr7BZ5h8/hKyMiSNE5i7FNeInPd8FbqDMs10eoB58WStywZZ8CaH4aVReqzoUY
         KGfgCxR1nrb+w==
Subject: Re: [PATCH v3] media:exynos4-is: Fix a use after free in
 isp_video_release
To:     Lv Yunlong <lyl2019@mail.ustc.edu.cn>, s.nawrocki@samsung.com,
        mchehab@kernel.org, krzk@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210427132734.5212-1-lyl2019@mail.ustc.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <44f264d9-e039-66b6-6e4b-1a5b3c386aa4@xs4all.nl>
Date:   Wed, 5 May 2021 11:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210427132734.5212-1-lyl2019@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBUyQI064gF4n7oUEovx3XiNBp/e9PzY0hj0Lc/zTjmgz1NsUparW1XpjD4P/9bfkAy2U1EmrVbxjKrdXDC0Z0MTg937lbs2QDPtutWYJCvvl46rkHYr
 fIN3YjCzyhLXAD/57J2rV2YQ1EOdCiToNxcGcur35RsIIVAZW25TXzE6za5DytSGVvsyqtYaQvfntzHb3nxI8wKbt8SKgR//emp7Ph2B51dlEoA2jzC3BiG4
 Csf+FjxuRSlEc4HE9uy65x34UWjhva3UzRQC1gz2OzmssN6a5VeN3P6Pu0NpE3VgC4aLpqLg3mvG1UtcpQUIfIRTObhUGSbhpz4HFRvPTscgWcTI2erqR7R6
 oRLbhGM31if61UpPUzJAhN0yPX9ta703jdZy2hl3/KJS5FuIcODwCd+fOgAjLoouNXxMRu8o9WhLGVLoaOZFiO/MlmPNI+TfetsJDsX4QkmewDSAOZg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lv Yunlong,

On 27/04/2021 15:27, Lv Yunlong wrote:
> In isp_video_release, file->private_data is freed via
> _vb2_fop_release()->v4l2_fh_release(). But the freed
> file->private_data is still used in v4l2_fh_is_singular_file()
> ->v4l2_fh_is_singular(file->private_data), which is a use
> after free bug.
> 
> My patch sets file->private_data to NULL after _vb2_fop_release()
> to avoid the use after free, and uses a variable 'is_singular_file'
> to keep the original function unchanged.

Actually, it is the use of 'is_singular_file' that fixes the bug,
the 'file->private_data = NULL;' is unnecessary here.

That said, it would be a really good idea if in a separate patch you
make v4l2_fh_release() more robust by setting filp->private_data to
NULL after the kfree(fh).

Regards,

	Hans

> 
> Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> ---
>  drivers/media/platform/exynos4-is/fimc-isp-video.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index 612b9872afc8..c07dcb0bccc2 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -306,17 +306,21 @@ static int isp_video_release(struct file *file)
>  	struct fimc_is_video *ivc = &isp->video_capture;
>  	struct media_entity *entity = &ivc->ve.vdev.entity;
>  	struct media_device *mdev = entity->graph_obj.mdev;
> +	bool is_singular_file;
>  
>  	mutex_lock(&isp->video_lock);
>  
> -	if (v4l2_fh_is_singular_file(file) && ivc->streaming) {
> +	is_singular_file = v4l2_fh_is_singular_file(file);
> +
> +	if (is_singular_file && ivc->streaming) {
>  		media_pipeline_stop(entity);
>  		ivc->streaming = 0;
>  	}
>  
>  	_vb2_fop_release(file, NULL);
> +	file->private_data = NULL;
>  
> -	if (v4l2_fh_is_singular_file(file)) {
> +	if (is_singular_file) {
>  		fimc_pipeline_call(&ivc->ve, close);
>  
>  		mutex_lock(&mdev->graph_mutex);
> 

