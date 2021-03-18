Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D9734001C
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 08:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhCRHRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 03:17:05 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48723 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229454AbhCRHQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 03:16:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MmtqlHc5kDUxpMmttlhxYX; Thu, 18 Mar 2021 08:16:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616051818; bh=o4bdmRJbpSrTYmU/LXhF3iMKbpsz7lKoXusdN1aFvws=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=baTWB21XKqqyHvGhmk0OuRYsn40+fU3+6oIuhQAsHTecj7NvYZji/bj0elyt9uEsw
         pKoIY+8WSIsj27eyrVoJiHXQRqh7lXs1YJv4u8Y/nhGwX10ctgzfdMldV7B8CMSIyH
         RcYx6R04ZKo0YYruwQLBons0E4W26Z+eAS546S8+Z3nIrstiPcjbK8OudE4Tp6Py4Z
         Ai3/x/uyAEo3p4lj5Ngly/Axuhcbdyawr6UKsurxYiRdL478WACqMoHmrN/LWN8g2j
         nSJP3EseDRlBeCrAdpgylIQvE/NDxDYAjgVZoV6hrAcfo2e63hROeIKtLD4CFee9+P
         HoLBF+qgefGNA==
Subject: Re: [PATCH v6 06/17] media: uvcvideo: Do not check for
 V4L2_CTRL_WHICH_DEF_VAL
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210317164511.39967-1-ribalda@chromium.org>
 <20210317164511.39967-7-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d9beb69d-6b8c-74b3-5755-19dda106c1a1@xs4all.nl>
Date:   Thu, 18 Mar 2021 08:16:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317164511.39967-7-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJTWf6deVNT/H5/QpWLhxGE4TSFdkKdrzJqtSbtbTQkNBcuNqEJJcyv6BE8FnYt3wVyoN05Yht3z9WpEEbSpNGEB6O5Z8XSWJJkow2I/NFjyXsbglQOL
 n987F2DT6T1DDJwqRez2x4OW86gFUDFqZv9VVXQahC81M8l96Pg3DyhCu/oeF9OwEIX++7BaNfidITKbmwEN9JN9LYUQhvHXL1eyhtjHw4/40sFzjs6Lnt7Q
 TxVAhoLUIq+lTWr9yCggVGVXt1A+fB60Eua2CH0nX6wWyfhxj/I/hlgsOLTU5n75q8LNarLOThCbqA/v0Thv7aDLG91PiVVPC5nsV5A+MEjCZuKxtibwqlwU
 xHgP9DPTva+EDCHTo8xb+6u7W6unaWjyA1U28hF8q6SIqEzt+0llWMKkv5L5oqnXwDdoCg5J
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 17:45, Ricardo Ribalda wrote:
> The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
> written.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..47b0e3224205 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1089,10 +1089,6 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	unsigned int i;
>  	int ret;
>  
> -	/* Default value cannot be changed */
> -	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
> -		return -EINVAL;
> -
>  	ret = uvc_ctrl_begin(chain);
>  	if (ret < 0)
>  		return ret;
> 

