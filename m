Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CB8375011
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 09:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbhEFHY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 03:24:26 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:56117 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233163AbhEFHY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 03:24:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eYLwlT8KlWztCeYLzlNQhC; Thu, 06 May 2021 09:23:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620285806; bh=LR3clUHjVBftDzFCX3LyxLbFvneYwPcjG1houGAXXzI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kBTbvO1LoW285EE9kFRPCPIp2VGwBeQN6DoGePMofuj/wVXD+IrNkiE8cOrYzRAIr
         8LEwXzscpCO+ChGSFb1JYHa8z2rMvBrjBOU55fRU31HYfDVThi5dT4HCGgizwHcLoA
         AEFWvQVisvgtWJMXmnn5OCc97t/IjthSzMmp0H7UmDq1LDvezmns6lvI5z/b8Xb3WC
         fH/JZiSjz7WxR/pEwD0VqOxTifHc8/IaEoLUeampOdDrM3TSJuIzJADhzoNvewKNYD
         Q15PV1gPqo+gAc0ISpdcoiKYhr8C6qJSZOJyC96GbaVeXY7xapdvcEnjHiWN52mKk4
         6Dxv4kyLfVM3w==
Subject: Re: [PATCH v3] media:exynos4-is: Fix a use after free in
 isp_video_release
To:     lyl2019@mail.ustc.edu.cn
Cc:     s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210427132734.5212-1-lyl2019@mail.ustc.edu.cn>
 <44f264d9-e039-66b6-6e4b-1a5b3c386aa4@xs4all.nl>
 <3f2f155c.72fa7.179408b6b2e.Coremail.lyl2019@mail.ustc.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c3f03430-e595-38a8-b60d-4a338c751c04@xs4all.nl>
Date:   Thu, 6 May 2021 09:23:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3f2f155c.72fa7.179408b6b2e.Coremail.lyl2019@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHt/vWvFyV4O9vViaNtKEIB+ZQgCzc42RFxLaPmLWlVwc0FvmH08rP/GLz1Hcvk0MDzzy6YSdmg7lisLd5PgYlcTRjEw9Qwir8P1krPMzTpgzcEsT114
 VcxCcnCxGaHlG91sLQsZrS3NLPFfSrMMq66jycMcDxSqu8b/UTJOeIF4WHDVBetrhPUknqYNqYrkI4UpkY9L254yUX0tnSVYF4CCVpFDueJKvBTBVCKtoAXh
 7ROtKCvkU/dCXv5aqJVePDCkXD+RC3RPfad2muFwHdaw5S1o8/IS5a1TOmaHwWBl5ea5wrtNQX30wNyBMyBh8tx11IFiNRiOFC1x8mLSPNKwu5TC1qOMDmN1
 qERT7wUK5lczgbDr6njpyg6J4TLsrCxok/EB4qIs5ssvPs2lk+D4ok9boOaS3tjy/3bvz9H05TI5WMRmI12fOt4S04G5Wl4l69FbDZtt0p8A/YLc+Wo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2021 09:19, lyl2019@mail.ustc.edu.cn wrote:
> 
> 
> 
>> -----原始邮件-----
>> 发件人: "Hans Verkuil" <hverkuil@xs4all.nl>
>> 发送时间: 2021-05-05 17:31:04 (星期三)
>> 收件人: "Lv Yunlong" <lyl2019@mail.ustc.edu.cn>, s.nawrocki@samsung.com, mchehab@kernel.org, krzk@kernel.org
>> 抄送: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
>> 主题: Re: [PATCH v3] media:exynos4-is: Fix a use after free in isp_video_release
>>
>> Hi Lv Yunlong,
>>
>> On 27/04/2021 15:27, Lv Yunlong wrote:
>>> In isp_video_release, file->private_data is freed via
>>> _vb2_fop_release()->v4l2_fh_release(). But the freed
>>> file->private_data is still used in v4l2_fh_is_singular_file()
>>> ->v4l2_fh_is_singular(file->private_data), which is a use
>>> after free bug.
>>>
>>> My patch sets file->private_data to NULL after _vb2_fop_release()
>>> to avoid the use after free, and uses a variable 'is_singular_file'
>>> to keep the original function unchanged.
>>
>> Actually, it is the use of 'is_singular_file' that fixes the bug,
>> the 'file->private_data = NULL;' is unnecessary here.
>>
>> That said, it would be a really good idea if in a separate patch you
>> make v4l2_fh_release() more robust by setting filp->private_data to
>> NULL after the kfree(fh).
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Fixes: 34947b8aebe3f ("[media] exynos4-is: Add the FIMC-IS ISP capture DMA driver")
>>> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
>>> ---
>>>  drivers/media/platform/exynos4-is/fimc-isp-video.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
>>> index 612b9872afc8..c07dcb0bccc2 100644
>>> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
>>> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
>>> @@ -306,17 +306,21 @@ static int isp_video_release(struct file *file)
>>>  	struct fimc_is_video *ivc = &isp->video_capture;
>>>  	struct media_entity *entity = &ivc->ve.vdev.entity;
>>>  	struct media_device *mdev = entity->graph_obj.mdev;
>>> +	bool is_singular_file;
>>>  
>>>  	mutex_lock(&isp->video_lock);
>>>  
>>> -	if (v4l2_fh_is_singular_file(file) && ivc->streaming) {
>>> +	is_singular_file = v4l2_fh_is_singular_file(file);
>>> +
>>> +	if (is_singular_file && ivc->streaming) {
>>>  		media_pipeline_stop(entity);
>>>  		ivc->streaming = 0;
>>>  	}
>>>  
>>>  	_vb2_fop_release(file, NULL);
>>> +	file->private_data = NULL;
>>>  
>>> -	if (v4l2_fh_is_singular_file(file)) {
>>> +	if (is_singular_file) {
>>>  		fimc_pipeline_call(&ivc->ve, close);
>>>  
>>>  		mutex_lock(&mdev->graph_mutex);
>>>
>>
> 
> 
> Ok, thanks for your suggestion.
> 
> Do you means i need submit a new path to set filp->private_data = NULL
> after kfree(fh) in v4l2_fh_release() ?

Yes, so one updated patch for fimc-isp-video.c and a second patch for v4l2-fh.c.

Regards,

	Hans

> 
> Lv Yunlong
> 

