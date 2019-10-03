Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8E2CA41A
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 18:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390243AbfJCQWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 12:22:07 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41359 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388936AbfJCQWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 12:22:04 -0400
Received: by mail-io1-f65.google.com with SMTP id n26so6884248ioj.8
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=gr4hXiULpWs1DzFwaw0wPj34ugirHLq1dGBcxCMhKYA=;
        b=KFlQuYExHY5LI5dVLAh4GkVs9MxmdHjS+PMpyKPxHXSAA0RVbEV8Ax9LBSoAdDcvYk
         DtKGCf8dc3fiPmyZNNIQ6rLKAvK1j2NkTvPTr1vAoIxF286tu8svY6/GO+25lVX/r8Ve
         3t+Vd/zLSGleuoLIVBYbtUFK+hIoRigjFvT4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gr4hXiULpWs1DzFwaw0wPj34ugirHLq1dGBcxCMhKYA=;
        b=ifJ2+xjUQThXCt8njqpgqWkgzGQngb2nNOg3N1OLWi1wlbRLkD7gg9AGL1lBnefWcH
         8tyhXcMCxncyGjllRKsz+7zG1XFMD7HSv10uMrgWdKlV4v4Qok/67dfHpxJqrJked1Ab
         kpJywO/Bcy8NIrN4Z0fydKhF9R4PVje26SDiazYy0HP9o2BKKOkoZEE7fnXNb0qIBoSn
         d2Kh5HUo+1xJQdxppjFHS6BNfIBlkS01y0yWDuenWLDFNb15CxhS5ABPF4PNwiNE8OtR
         6xij3BQ98P3XnqsdXIS+PBjEFWPMCoC7jpIvSHU5UkXJTT8jbTGCehZE9DCvDfq/tJAh
         VgXg==
X-Gm-Message-State: APjAAAUinCK3O6olkEIiiuSqJG0bi9wpM2GudYYU9f9gLBT24ogx8H97
        NBKJm9FL/SvqPYRv0+y1V2gXhw==
X-Google-Smtp-Source: APXvYqyhA1xPr1F0r/FjnGSD8aSsnkpVuneVI7Q58NSdjRzDzxu/LkUoSwZwEf3BtTPn/E2WnZBxzg==
X-Received: by 2002:a92:bb47:: with SMTP id w68mr11426190ili.226.1570119723340;
        Thu, 03 Oct 2019 09:22:03 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l186sm1234887ioa.54.2019.10.03.09.22.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 09:22:02 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/2] v4l2-core: Add new metadata
 format
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
 <20191003110858.7120-1-bnvandana@gmail.com>
 <20191003110858.7120-2-bnvandana@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <77153a6f-8980-fa14-7a31-3ffdfcb125a6@linuxfoundation.org>
Date:   Thu, 3 Oct 2019 10:22:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003110858.7120-2-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/19 5:08 AM, Vandana BN wrote:
> Add new metadata format to support metadata output in vivid.
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>   include/uapi/linux/videodev2.h       | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 20b3107dd4e8..2753073cf340 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1340,6 +1340,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>   	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>   	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> +	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>   
>   	default:
>   		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..a82181e27c5a 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -755,6 +755,7 @@ struct v4l2_pix_format {
>   #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
>   #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>   #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> +#define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */

You might need a tab as opposed to spaces here?

>   
>   /* priv field value to indicates that subsequent fields are valid. */
>   #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
> 

