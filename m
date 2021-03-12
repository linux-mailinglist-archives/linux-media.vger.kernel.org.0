Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD02133865E
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhCLHIE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:08:04 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39715 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230189AbhCLHHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:07:37 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id KbtTlxvNn4ywlKbtXl2Gue; Fri, 12 Mar 2021 08:07:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615532856; bh=cG8KSi3yBPZtSZIs/3Ci+MTWMycEmMwX+eM/d+rz1jo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s8gRF1Kqfo+skAObQhu5ZwncwITcS9r4GRDUidmuv8WXHKFgBGMAJihRufvpzQ85p
         pAScCP0U053i9NuwUqDRv+qPadpVWGPHchZ48uniL243mBTESaWnjx71PAYA3laQFm
         Q9Q44YPNvvaQHp1+0vakMx4n2HtZfUuJnkfpOwkdsi4FARbxbkyp985K1XxaTFZMww
         BF0mC7zBp1A86fEC8RibguKDW0ICupsSAXePFL2mk97ALCbc91QFzm1flGq3rr11MA
         Js9W4W3Cde65MkSzhJJZ+gtC0nxKIWWbPn9in7TjxagbkpMGJQRFrA+mABzcNYupKI
         AzVl8VszSmxYw==
Subject: Re: [PATCH v2 2/6] media: uvcvideo: Set capability in s_param
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-3-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3c2f8e86-3519-8284-fdeb-555ec03fbeff@xs4all.nl>
Date:   Fri, 12 Mar 2021 08:07:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311221946.1319924-3-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLvf0WFg2AiLzV/yv+9DcAnRcbdmjvl1ZNInczo1ZyakEitP/h5uhzxMi5BmPqwlesdx6aTqRu5TlBuGKV5OBjBHrSFEoUYUfa87og6ushMJadugmfJF
 NsUzlt2fkK9si52dVI/ZKpmlUJew0P+9xdapxwkrpy0fCvc4QmVwvXBuczfADflpd4CKn7S8vWnKddE48rjmCkpj+Dx31XsuO6E0/pyXE8PGzINQjX321J9u
 Wr+Rjz+TC9q0l1nWWsT9IlUq3Q8IWd84BFUCiqlkDSdgF7q9621D4JX3b19qoKkkJu1FALbwusT2oW59d3XuoxClfuJ/ubhhS/3s7Q5tDZZVYShGqWrKtFjl
 TsUj9RdTXh6CM0VYtQkSkSk95/BUkYgLWJl7az4WbX1qy4tCTZ9a5LddsvLPTJGSbtDoKZMZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 23:19, Ricardo Ribalda wrote:
> Fixes v4l2-compliance:
> 
> Format ioctls (Input 0):
>                 warn: v4l2-test-formats.cpp(1339): S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
>                 fail: v4l2-test-formats.cpp(1241): node->has_frmintervals && !cap->capability
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..157310c0ca87 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -472,10 +472,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  	uvc_simplify_fraction(&timeperframe.numerator,
>  		&timeperframe.denominator, 8, 333);
>  
> -	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
>  		parm->parm.capture.timeperframe = timeperframe;
> -	else
> +		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
> +	} else {
>  		parm->parm.output.timeperframe = timeperframe;
> +		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
> +	}
>  
>  	return 0;
>  }
> 

