Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3CC249998
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 11:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgHSJsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 05:48:45 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60123 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725804AbgHSJsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 05:48:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8KhzkbGWquuXO8Ki0kgC51; Wed, 19 Aug 2020 11:48:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597830520; bh=rjyXPWRP1g01llTCNBoRc20RbTVne5BReTjfQigN/qE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aRVi+LKuPvEAGBtVbilrwMVfjfRiLtzdmajEDiu1Wcf8Cq7SZ/MBSBMR+w6OVcjDk
         UhL1Qi21AUJsJabaE1KSxxbCIbD0Z5oKK/8Ptxow60bjJDawXc8fYi7YNCm5V1ibsC
         lsEPGSgldRvXIZlLhjpfmp3dD0kvsD4lBYLJbgvTyQNI7JVR4jBc3HgmdYrlrr8vV5
         vm/Ek0kr1l3NI46NWtkCGP1p4YAsc2F4nkwyBCphdgwGhRcxScH6SGlBleCG49C8K4
         1qxFoO9oB3jtfmOKr4zYIUnW1NeThgBBON7T1hM/6c43oYuco5LAOSzjdEc4k8U8Uf
         UN8P9OdvyHxoA==
Subject: Re: [PATCH v2 6/6] media: docs: Deprecate mfc frame skip control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
 <20200721074538.505-7-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5619ba1a-c9e3-74f9-af21-76b4961d245b@xs4all.nl>
Date:   Wed, 19 Aug 2020 11:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721074538.505-7-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOfshgSS/4pnrc0r98ip6Dp7/2WOW9Q9jCnxE/ED9msv5AQOlP+XJ5tWWhVxDHU0mlTIH0FrR+PsE0/EwbZdTLUask/ZDkVFfpZ5Uy80GCygBGP33h7V
 MAgQpLq0KKro9DdC9mn0LVhKYvIa263Y8Vmv9JN5Apk2Jw3LY4NuWis1+2F1QN0F6/m/2Q8CwXL5GBbngkSlLKMAM1kd52Z12VHTnCMMfdMld0S7pNJkFm4k
 rLP6fC/V8yGbbF/Ye/nsnhxypOy3iyBTLcgzN1DKVHcrDmxeIcckxTZp0HiMBYZZ78za+FGaCI191hlOCNlPsoFIoGk7kKaUxM8PIXFO4L1G91QhWeKXmi3y
 EkcxH2/0AeQoOsgJlQrxJOuOjvbe3Gd1Y8I4hdX/M692dtRZkvIb4e6HCuDjs1CNHc/XX9JAOvqIrsywYaJ93Ze84SwLFdYo6z4Ii9zIU/lit5mjUDngBmJi
 mS2XxKqkkz0b8zL8naJC4Hyk8azijsK/DBr48tU+KfSfTtPtUgGVtP0+fMOZ2bY8OSKWawMXYTijBQLxHmS3YcRbKDPHMbOa3hNcZHzJ+q+zP9li9IOsF4rk
 HObnjCxxPisc+u2eAOIhs6nCvzg6/bPRETL/yqAahSPtsICQ4VpyMBXEayuboK9HkIdYdswRdK1iINY+rQZqY6xQB/M1J/oipWXksuJoZrVdHG+EaSwYkBKB
 sl7s5yRg5Jo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2020 09:45, Stanimir Varbanov wrote:
> Deprecate mfc private frame skip mode control for new
> clients and use the standard one instead.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 985e4c2d29bf..31d77d1cdcc9 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2821,6 +2821,11 @@ MFC 5.1 Control IDs
>  ``V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE``
>      (enum)
>  
> +    .. note::
> +
> +       This control is deprecated. Use the standard
> +       ``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE`` control instead.
> +
>  enum v4l2_mpeg_mfc51_video_frame_skip_mode -
>      Indicates in what conditions the encoder should skip frames. If
>      encoding a frame would cause the encoded stream to be larger then a
> 

