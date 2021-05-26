Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D701E39151E
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 12:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhEZKkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 06:40:42 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38847 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234117AbhEZKkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 06:40:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id lqw9lSl1ZWkKblqwClChsM; Wed, 26 May 2021 12:38:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622025536; bh=XlNVC86Ptwa/dZno998hc4CkV9v44/KHlA+cDHnDUAA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GsytanDInMl8owSubO+/OkkLYU8vHDSiK74jlal8gq3M7bHTyNm9iTs/ZBppDF9te
         FJVnEfRkvmcL8aSWlW2JRmCRG+A1DOEQRPuimld19c/Ud9uvx1uc2eDUKG2f27fVc5
         iX0L/1des7VIBLWB9vJDzVPa6tdktS/QYpt3fQBKDpTqCZDEpizrq6hN+INHsQSA1j
         1U7PIfjEsR0zQfFOvt6h4mdynCnn4D3gDireQkehqPe1Lu/pn7GIkmKwUtH0uAtUgp
         7O+tSsGiffDzaVuYDz3eZWWRm9LH3QZNkGd9xdkyIvYbfs4isG8qMmU3/Q8uzzEaSN
         yHhq69cGNja+w==
Subject: Re: [PATCHv5 0/5] media: uvcvideo: implement UVC 1.5 ROI
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210501082001.100533-1-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8583ed26-ef35-3341-5058-32dbf219d10c@xs4all.nl>
Date:   Wed, 26 May 2021 12:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210501082001.100533-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFEUfC1WK0TKikrzxCp5mPl+0Ru3byt2BGHcXhHIthaBn6MiIf1jQ6M3xvU6s/+cVEnSlK4A1Z/7qpNfPKQxjMA8FgIuyIyQJLHjkkO1rqnt3mW2cj4e
 kS+Ir/8KjKFIkH9WT7liXL2fbtHoq3wcgSUXmlbWoww0rYL5scW3Xdd7RQWwvylAAgzJUJ6oVaNIHN+I4ofHt1Y+nyhIiNqaMzHz34x5UlSjmkEwlPtrn6By
 Ec63JJttldgmOqdBKVTfRg5oo6u3ewKGpAhvt5+W1kntMFkTDaiV7GHtKJMy/+W8AbEsHXQGjtt01FPjYk0YX/GUxgRWDCx1xRM+uh2PUrGE9XZ9xSspFJsz
 hawXxMKETXfiI1pUKwo0wu8oPKs0hY6U35h6PZDK5EdEMo7X2prsXRdqWxgmCkj42y9fyDIk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On 01/05/2021 10:19, Sergey Senozhatsky wrote:
> Hello,
> 
> 	This patch set implements UVC 1.5 ROI using v4l2_selection API.
> 
> v5:
> -- fixed UAPI typo: STABILIXATION
> -- moved V4L2_CID_REGION_OF_INTEREST_AUTO to V4L2_CID_CAMERA_CLASS_BASE+36
> -- added more comments (Ricardo)
> -- added V4L2_CID_REGION_OF_INTEREST_AUTO to v4l2_ctrl_get_name() (Ricardo)
> 
> Sergey Senozhatsky (5):
>   media: v4l UAPI: add ROI selection targets

As mentioned in my reply to v4 0/5, I am quite strongly opposed to using the
Selection API for this as opposed to using controls. Unless someone can provide
strong arguments for using the Selection API, I am inclined to reject this.

Sorry about that, I probably should have been reviewing this series sooner.

Regards,

	Hans

>   media: v4l UAPI: document ROI selection targets
>   media: uvcvideo: add ROI auto controls
>   media: v4l UAPI: document ROI auto_controls
>   media: uvcvideo: add UVC 1.5 ROI control
> 
>  .../media/v4l/ext-ctrls-camera.rst            |  23 +++
>  .../media/v4l/selection-api-configuration.rst |  22 ++
>  .../media/v4l/selection-api-examples.rst      |  27 +++
>  .../media/v4l/v4l2-selection-targets.rst      |  24 +++
>  drivers/media/usb/uvc/uvc_ctrl.c              |  19 ++
>  drivers/media/usb/uvc/uvc_v4l2.c              | 189 +++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   1 +
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/v4l2-common.h              |   8 +
>  include/uapi/linux/v4l2-controls.h            |  10 +
>  10 files changed, 321 insertions(+), 3 deletions(-)
> 

