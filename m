Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F63A392861
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 09:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbhE0HVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 03:21:32 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58357 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229579AbhE0HVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 03:21:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mAJ8laCPqVN4kmAJBlNUFG; Thu, 27 May 2021 09:19:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622099997; bh=+En93gc8Nn/om8FUKz4zjKxFDWBVILYz2hE5/kMAjks=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HsMAQTVC1NYzLVzjuNhp0NkXbDFj7DJFoqpMr1ur4YHhZSLyKXfXjChuFMpXi7v9H
         2VzpuljscPI8EjatyTB63NJkCuCGAx6SKPcGlzZ+ySnIDNl5osM6ZlhZn58aPdCl1R
         JekBhtp1JKcwEuuCKwRHNFEvHov4yJN8VKl8kZYEFj2T3q4z1CNM7zhliNocpKUbqq
         3UKJhmAJFY5pjmb7quZHxqgSO8NztCAp9vwI6WFh2XUBSmbva/9lnxoFd7t/Vw5Khq
         ymmkOXgf87sB1Qj6584er+v5uDJDJp107BcjkBZaYKMr/NCdI1EPXbfjkR21FzyFOR
         zEKViy1pILsBg==
Subject: Re: [PATCH] media: hevc: Add sps_max_sub_layers_minus1 to
 v4l2_ctrl_hevc_sps
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        John Cox <jc@kynesim.co.uk>
References: <dbco8ghdj1a934s737s9auegilbvafdjpl@4ax.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <63d5b36e-a4e6-0180-e126-a907cfa01977@xs4all.nl>
Date:   Thu, 27 May 2021 09:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <dbco8ghdj1a934s737s9auegilbvafdjpl@4ax.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP7tQEfcXb00jfeCt8fv4F907YLeBBq+LXY2o4wqio9xzJ8Gto9DIrUqRvJDjV2Gqythw1JcxJs9PZ4TcIZffCT7xh5OQrzFGTCaEktqtVLIszabZpT1
 vDIgEXT79J6q1e43HkyIRLHXbSus8AFWI1rxYltFv/kBp1qmzJO4w7Dj4r+06yuXMpEUdc54Xwakum0tN51QMMOCs9hLOo8uJEDoRXIXvztCVLXlZjRNNPgi
 FvNJSrF+G5bYSlvQM4IIBqw3R67GPtmoEk2+YkIw6Kq1ByR0iX0rOn7lRZKFRFp5W1PiDc6WSmCNQgOl6yzBSp99eMGrsSQcBBcItrlcPQg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On 30/04/2021 18:48, John Cox wrote:
> sps_max_sub_layers_minus1 is needed if the driver wishes to determine
> whether or not a frame might be used for reference.

How does this patch from John relate to your "Add HANTRO G2/HEVC decoder
support for IMX8MQ" patch series?

Can I apply both this patch and your patch series? Does this patch make
sense for the HEVC stateless API?

You have been digging into HEVC, so I hope you can help out.

Regards,

	Hans

> 
> Signed-off-by: John Cox <jc@kynesim.co.uk>
> ---
> This is useful to the Pi H265 decoder as it allows it to only create
> and store MV info for frames that need to.
> 
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 3 +++
>  include/media/hevc-ctrls.h                                | 3 +--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index b0de4e6e7ebd..9a891202abbf 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2924,6 +2924,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      * - __u8
>        - ``chroma_format_idc``
>        -
> +    * - __u8
> +      - ``sps_max_sub_layers_minus1``
> +      -
>      * - __u64
>        - ``flags``
>        - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index b4cb2ef02f17..b2d296b77653 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -75,8 +75,7 @@ struct v4l2_ctrl_hevc_sps {
>  	__u8	num_short_term_ref_pic_sets;
>  	__u8	num_long_term_ref_pics_sps;
>  	__u8	chroma_format_idc;
> -
> -	__u8	padding;
> +	__u8	sps_max_sub_layers_minus1;
>  
>  	__u64	flags;
>  };
> 

