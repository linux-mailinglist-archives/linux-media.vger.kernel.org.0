Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5878D200F2
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfEPIJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 04:09:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35822 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfEPIJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:09:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so866759ljb.2
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QG++TdTDo8I5Y/kXuu9iUwjpqJr5RRm0pgh41ilp46o=;
        b=tNDLPnvnICu0ql4vXKqwN3CRGatnx0hohbiBQksTPFRlycOEhBL9mmRtlSrl0WvP4m
         5zPygpT9/5ERZlbeoASLFmzJEbC86DaiJfaH0i1Lh+1fs3N2G5qntqynVJcQ3pTl4pJV
         gr15uR4VXpg7kVk3+xzrBKa52YDFxsN3hgFKHOlVdfX8EVT409ScYKGl+oPBBDP1hBBV
         tAjgDKAKh158sX6emXiD4/jXaMySs429Zx5naJOtuAJOQJh3gqsPMs4zBuzS9KJDvXJd
         Rj/8nlgfm5eLdGBMKgZVIjS0Y2RKIBeSrRDML8H7bzG+Qvvg6KdvayevAXaiUw9AlSE5
         u7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QG++TdTDo8I5Y/kXuu9iUwjpqJr5RRm0pgh41ilp46o=;
        b=jnb2N293MK7ZYKWb87MwmKHFH38JdKPXsxQnrJOCM6d75XvgRSRKRiZYyBk1Vnxz/k
         2z/oitFz1NKcxXnVCIB/wbXysrIhcBq6wSxih7FhHL3rfUJF2K0a/RMXYL2mq6A3ETEn
         9Rrn+EZua9u9lhTOCNLwt/qJz4CeIb3IjF6mu04KfzRg5/+w1s3Ahc3+grFIt6jTvd/B
         vTMmxvh9uuXhVB4/6vxWwte1WhGeBRrCx/D68WZPRjQNu3TM3/vFntuon2yoxlBeIicI
         QtNcQ2wbMtrWh65ksDNZxf/nYe99lIcy+Tm9ANPJuXel9DWMc/Ixlk4F/DYbfVjLZNg/
         D1MA==
X-Gm-Message-State: APjAAAU9wCHa1mEqHR9PIT/WKK7lv6kNulrZnPczndn+Efk9/LzWUTw9
        ebKhYnbwJL3aq+VUti/5hAGrTg==
X-Google-Smtp-Source: APXvYqxvMH7YTuGRmcz3kUP8TzVYaoFE+f8w+fN6e0CEox7DYVoK71J7fbGskxym6MMzAi9u5G9vKQ==
X-Received: by 2002:a2e:9d4c:: with SMTP id y12mr23076244ljj.132.1557994150813;
        Thu, 16 May 2019 01:09:10 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id k1sm938935lfc.18.2019.05.16.01.09.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 01:09:09 -0700 (PDT)
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
 <a1807c37-99cf-d1fa-bcb9-67af2935abaf@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ca0e2c94-cca9-567f-5376-f302f79f4ba7@linaro.org>
Date:   Thu, 16 May 2019 11:09:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a1807c37-99cf-d1fa-bcb9-67af2935abaf@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/14/19 11:54 AM, Hans Verkuil wrote:
> Hi Stanimir,
> 
> On 4/12/19 5:59 PM, Stanimir Varbanov wrote:
>> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
>> field description to allow v4l clients to set bigger image size
>> in case of variable length compressed data.
> 
> I've been reconsidering this change. The sizeimage value in the format
> is the minimum size a buffer should have in order to store the data of
> an image of the width and height as described in the format.
> 
> But there is nothing that prevents userspace from calling VIDIOC_CREATEBUFS
> instead of VIDIOC_REQBUFS to allocate larger buffers.

Sometimes CREATEBUFS cannot be implemented for a particular fw/hw.

CC: Tomasz for his opinion.

> 
> So do we really need this change?
> 
> The more I think about this, the more uncomfortable I become with this change.
> 
> Regards,
> 
> 	Hans
> 

<cut>

-- 
regards,
Stan
