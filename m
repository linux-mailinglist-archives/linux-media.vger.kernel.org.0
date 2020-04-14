Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B5F1A765B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437029AbgDNInQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:43:16 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50849 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437035AbgDNInO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:43:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OH9wjOmO47xncOH9zj12Iv; Tue, 14 Apr 2020 10:43:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1586853791; bh=2AIFG9xoaMgRMzeBxRpSb56tQiGIH0qXlP3ZhZDnZ2E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RQXniPyXCSJ860XcNw7LvwFi5AW9RZsI3GhkaqLYBmlJp998RmNAIHrBiCT8XEi0I
         T/KFmTRQaLWMM3yGXAg8UKhOwGDKhxsVyQI+Az+i+koDDessUUCm5QkCpQvyKIIe/M
         t/GOUIjGTALRoFo8geEVV4g3cgR2Fx1NBUewxaxzxQsWMCiV95n6GkeMZ1pyry1lCR
         +at5IpnbYOa8RN0wVvVdDlD0UbHXo+Tqm3Ho2MEEN6n1q8cT6ZYCPSl7jC1V50+Qlv
         izGaLlCKGBo78loFdn/6RV7TDfyj9dG7cgh2fg/S3QSgVIs3ylOUGq7MXNN9G06Ddm
         ok55bbHdCR3hw==
Subject: Re: [PATCH] Fix broken for loop in libv4l
To:     Hans Petter Selasky <hps@selasky.org>, linux-media@vger.kernel.org
References: <3fc9b235-4763-546d-c9f6-5ac928a1bcff@selasky.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <db590fb6-ffbc-cc1b-9f0f-7e48de6883c8@xs4all.nl>
Date:   Tue, 14 Apr 2020 10:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3fc9b235-4763-546d-c9f6-5ac928a1bcff@selasky.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAfo+uCpKqoW9hQlgTIemptrbRhuUEJI0Iq5cabBd7vcQXuCq/xKbtd2pRmfAE7/Mzb4Ykc7zqCcNqeT0PON53RdssJ+lqpz+Q+q3MihbsLOf7XdmdkF
 7LS0NPCmKdpRjZyLud7VYh5zp0lk4shGjzLCnyYehVv3V29KyQFjORkep263PwN1PjeXTu7VSJjxGDPAn+/Hev96+LxvJbqm8mo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/04/2020 19:17, Hans Petter Selasky wrote:
> Hi,
> 
> This is one in a series of patches. Is this the right place to post 
> patches for libv4l ?

Yes, this is the right place.

I've applied this patch. Amazing that this hasn't been discovered before.

Thanks!

	Hans

> 
> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
> ---
>   lib/libv4lconvert/rgbyuv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/libv4lconvert/rgbyuv.c b/lib/libv4lconvert/rgbyuv.c
> index 79bc0bdb..b54b4577 100644
> --- a/lib/libv4lconvert/rgbyuv.c
> +++ b/lib/libv4lconvert/rgbyuv.c
> @@ -893,7 +893,7 @@ void v4lconvert_nv12_to_yuv420(const unsigned char 
> *src, unsigned char *dest,
>   	}
> 
>   	for (i = 0; i < height; i++)
> -		for (j = 0; i < width; j++) {
> +		for (j = 0; j < width; j++) {
>   			*ydst++ = *ysrc++;
>   			if (((i % 2) == 0) && ((j % 2) == 0)) {
>   				*udst++ = *uvsrc++;
> 

