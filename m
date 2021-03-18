Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CD43401F1
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 10:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhCRJX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 05:23:57 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39491 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229785AbhCRJX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 05:23:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MosDlIZiuDUxpMosGliHVx; Thu, 18 Mar 2021 10:23:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616059404; bh=BBocGRfzGVlOGi2ENvhHh8fEq7hq9MueOjf3HiOqU1E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j6lyjJo+KDhViD5posWxv5nqD1Bd/wJDOWUiQWx+fQwNlwelk3Z9rk2CfAQ7mbS0t
         QlnJ6AQqel+DM0PMYnuH9zmHeIpJF7mtdMR+nBLnTkXR7Eeqp2h65XU6vpOc2Q3Aju
         jeBLUpf8caVzSSSsbRUFn6mhWegtO7D0lGGc9d7PGpRfZtZNaGwpMISP1YMk5EBCjy
         +b6I59ndcOprG0rv3a5Ltsn3O0i3OEQxCdYNDRQyzXNPpIa4U1Ip+058nsXsL9/eQ4
         1L/kCWUkfD17DvDs4A/ymDA294uazUadzbm41TLtWYyO37ti8S0p8FfrVm1c3TGxKj
         8u4CODgEVaGrg==
Subject: Re: [PATCH v6 00/17] uvcvideo: Fix v4l2-compliance errors
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210317164511.39967-1-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c8616b15-0234-5377-b2d7-f9145c6f01a1@xs4all.nl>
Date:   Thu, 18 Mar 2021 10:23:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfChdQBvy+y327RdCr+aX0ay7ssh5VXNL8sD0DS0iZCsO5qyvJlzpAImQoEqSMA7lVVxFCbgUsKIieUt6FMyCJRDSwUOcuh6uTREgPKQ9eK9rc3aIMfyG
 xQX3MWG31lqHE9D0CCmLmaDciK4Hq0ZQvfoHnF65pmJudfg7o+PJRXGf30UKs4YgPd09SGwYfsXbZEZ24HUySdtLTl5PlnSA9Vg0FymmpBLWvXslrSU3G93/
 AGfxnznIxerSjrvKcaFwb5oJSsfuVqWvLgr7QXIssXvWyrFevI8si7YbEThYdyPvxBAJxE6OfkjnTFSbfwc5boCej2MpTQbh+wsWGBovJ5yQNrUO+MbU22Af
 NcMOKppBaO+DdjdGSjR+IRIktT/sT+2OKvCI1zmjOzw87FSSoqQdmDuogNc552TLyij6Hary
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 17:44, Ricardo Ribalda wrote:
> v4l2-compliance -m /dev/media0 -a -f
> Total for uvcvideo device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0
> Total for uvcvideo device /dev/video0: 54, Succeeded: 50, Failed: 4, Warnings: 2
> Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
> Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 102,
> Failed: 6, Warnings: 2
> 
> After fixing all of them we go down to:
> 
> Total for uvcvideo device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
> Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
> Failed: 0, Warnings: 0
> 
> YES, NO MORE WARNINGS :)
> 
> Note that we depend on:
> https://patchwork.linuxtv.org/project/linux-media/patch/20210315172531.101694-1-ribalda@chromium.org/
> 
> With Hans patch we can also pass v4l2-compliance -s.

There is one remaining issue: if uvc_ioctl_s_try_ext_ctrls() calls uvc_ctrl_commit
and the 'commit' fails for a certain control, then you want error_idx to be the
index of the failing control. This is obviously something that v4l2-compliance cannot
test since it would rely on a buggy uvc HW implementation. But I can test it by
dropping patch 16/17: that should force the commit to fail and then I can verify
error_idx.

Regards,

	Hans

> 
> Changelog  from v5 (Thanks to Hans)
> - Move more checks to framework
> - Rewrite the framework check_ext_ctrls
> - Rewrite ctrl_is_inactive
> - Add function ctrl_is_accessible
> - Use ioctl name instead of boolean values
> 
> Hans Verkuil (1):
>   uvc: use vb2 ioctl and fop helpers
> 
> Ricardo Ribalda (16):
>   media: v4l2-ioctl: check_ext_ctrls: Fix multiclass
>     V4L2_CTRL_WHICH_DEF_VAL
>   media: v4l2-ioctl: check_ext_ctrls: Return -EINVAL on
>     V4L2_CTRL_WHICH_REQUEST_VAL
>   media: v4l2-ioctl: check_ext_ctrls: Return the right error_idx
>   media: v4l2-ioctl: check_ext_ctrls: Fix V4L2_CTRL_WHICH_DEF_VAL
>   media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
>   media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
>   media: uvcvideo: Set capability in s_param
>   media: uvcvideo: Return -EIO for control errors
>   media: uvcvideo: refactor __uvc_ctrl_add_mapping
>   media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
>   media: uvcvideo: Use dev->name for querycap()
>   media: uvcvideo: Set unique vdev name based in type
>   media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
>   media: uvcvideo: Use control names from framework
>   media: uvcvideo: Check controls flags before accessing them
>   media: uvcvideo: Return -EACCES to inactive controls
> 
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c |   4 -
>  drivers/media/usb/uvc/uvc_ctrl.c         | 284 ++++++++++++++----
>  drivers/media/usb/uvc/uvc_driver.c       |  22 +-
>  drivers/media/usb/uvc/uvc_metadata.c     |   8 +-
>  drivers/media/usb/uvc/uvc_queue.c        | 143 ---------
>  drivers/media/usb/uvc/uvc_v4l2.c         | 352 +++++------------------
>  drivers/media/usb/uvc/uvc_video.c        |  13 +-
>  drivers/media/usb/uvc/uvcvideo.h         |  43 +--
>  drivers/media/v4l2-core/v4l2-ioctl.c     |  59 ++--
>  9 files changed, 366 insertions(+), 562 deletions(-)
> 

