Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C0645583
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 09:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfFNHOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 03:14:34 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56791 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbfFNHOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 03:14:34 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bgPshVxU75qKabgPwhKdm7; Fri, 14 Jun 2019 09:14:32 +0200
Subject: Re: [PATCH 1/9] media: docs: v4l2-controls: fix sentence rendered in
 a nonsense way
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20190613141826.26775-1-luca@lucaceresoli.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <069ac18c-7b9e-652a-1ff8-35fca09e6538@xs4all.nl>
Date:   Fri, 14 Jun 2019 09:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613141826.26775-1-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLULx6w3UFhlf3J5JCexhb+m+iklOFzmIMMKYRDvzeNKBekzrOFhmeknJxOTmQMdjN9XXfrlhqBoDBMxyopKvpsduSm8E4ZnhyNOYzfyjOTCLMRf2gbJ
 nFD/I3Y/uQGHROwU5W1NTsxyx+1m5iOUBgTnOppzJbh1+1gOeOOQg6USO0X3NrS4fTWpZtXCtO9D8675Hs8pBfZegACeBdsm++1XHnLzbsmjbwiIOVaAK/hW
 vWl2Z6B5IOcq/K3hJbooxYhAHKWQuvMYoypRtPhRRzcU3Z30O0a1bW+zQ/R2mReAwhefEiXp/5f5DiZms7Yidg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/13/19 4:18 PM, Luca Ceresoli wrote:
> This sentence renders as:
> 
>> Since such compound controls need to expose more information about
>> themselves than is possible with ioctls VIDIOC_QUERYCTRL,
>> VIDIOC_QUERY_EXT_CTRL and VIDIOC_QUERYMENU the VIDIOC_QUERY_EXT_CTRL
>   ^^^^^^^^^^^^^^^^^^^^^                          ^^^^^^^^^^^^^^^^^^^^^
>> ioctl was added.
> 
> This does not make sense. Fix by providing an explicit link text. This
> results in:
> 
>> Since such compound controls need to expose more information about
>> themselves than is possible with VIDIOC_QUERYCTRL and VIDIOC_QUERYMENU
>> the VIDIOC_QUERY_EXT_CTRL ioctl was added.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/media/uapi/v4l/extended-controls.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/extended-controls.rst b/Documentation/media/uapi/v4l/extended-controls.rst
> index 24274b398e63..0968aa9cd167 100644
> --- a/Documentation/media/uapi/v4l/extended-controls.rst
> +++ b/Documentation/media/uapi/v4l/extended-controls.rst
> @@ -86,7 +86,7 @@ with compound types should only be used programmatically.
>  
>  Since such compound controls need to expose more information about
>  themselves than is possible with
> -:ref:`VIDIOC_QUERYCTRL` the
> +:ref:`VIDIOC_QUERYCTRL and VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` the

This should just refer to VIDIOC_QUERYCTRL, not QUERYMENU. So this
becomes: :ref:`VIDIOC_QUERYCTRL <VIDIOC_QUERYCTRL>`

Regards,

	Hans

>  :ref:`VIDIOC_QUERY_EXT_CTRL <VIDIOC_QUERYCTRL>` ioctl was added. In
>  particular, this ioctl gives the dimensions of the N-dimensional array
>  if this control consists of more than one element.
> 

