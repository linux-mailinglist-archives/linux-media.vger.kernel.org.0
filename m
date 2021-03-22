Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2728B3449A2
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCVPtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:49:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35395 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230160AbhCVPtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:49:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OMnYlxIRw4XAGOMnblYPvz; Mon, 22 Mar 2021 16:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616428139; bh=psPx6cmRsitZPq1L0OWfot3wPJIQkDntII7pVHlfykU=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=A0iBp79LRoyJioFb9E/0Lj91ZXyDWTh1Fe89qn5OKTSYYkUYZdxqzYWT/Gjv5lel+
         JoWX/YM2xTBcMrEU64wFiaLC6qsW8pYG5KPMFyiRvff+JDowUZrnQjWr/O0x7mRqhC
         6S+1LLh26Em7houlPsqAsiY0mywSDQcZsrf095fZJkViE4tR6BppRNiNu/j/Iy8gh9
         oV/C5OLNyChloH4YEHTXLdbroSw5HVmuazRN3snWxY/l8UwZLEVBxIzDRAvEHN3SYm
         h0FjDeamG8cw85j4bazQo+KWA0jQOU9YiB3b8+AXOzcwC4XMrDj+fLXuCwThQZhzYo
         kp1Q09eWDMqWw==
Subject: Re: [PATCHv2 0/3] Rebased 3 uvc pix_fmt patches
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Edgar Thier <info@edgarthier.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
Message-ID: <25f56ead-85ce-441f-586b-a924c86c4f8b@xs4all.nl>
Date:   Mon, 22 Mar 2021 16:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB5OVG9DsiFk1B6SRCceKhVsD57IRPb+NV698xVIVIaRWjpiAWHRJynaDaq5JmXq1eRHD3grcUYdVHqr5u/of1juKust8vpdBS3n8khePxCBRJ6u3UDt
 1fwxyYV0kE+Mvg2L7/RmIdBDRJ+PUvXBcTlU5staFFjrlbq7nlDZsboE6VveNjkqavNIa5vkvDUeW8Td4VqcPIZGUF5g+0Z30PXXpnOqffS1JhxrJWsnm5yh
 OvUHP8EyzOc5gzwkzaIDa1yFcnAWE/EknZIpYwcuL6y6w+hD6NNl2wzKLHMX3Ol1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/03/2021 16:46, Hans Verkuil wrote:
> This small series rebases three old patches that slipped through the
> cracks, but are otherwise fine.
> 
> Two from Edgar:
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=329
> 
> and one from me:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/6e8bde09-7b47-5dec-6f21-c5156fbc9b10@xs4all.nl/
> 
> Since my patch depends on the Edgar's patches I decided to just
> rebase the lot and repost. Hopefully it won't take two years for
> the v2 to be merged. :-)

Ah, Edgar's patches were already at v2, so this is really v3. Noticed that too late...

	Hans

> 
> Regards,
> 
> 	Hans
> 
> Edgar Thier (2):
>   v4l: Add 12-bit raw bayer linear packed formats
>   uvc: Add 12-bit raw bayer linear packed formats
> 
> Hans Verkuil (1):
>   uvc: don't set description in ENUM_FMT
> 
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |  1 +
>  .../media/v4l/pixfmt-srggb12lp.rst            | 74 +++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c            | 70 ++++--------------
>  drivers/media/usb/uvc/uvc_v4l2.c              |  9 ---
>  drivers/media/usb/uvc/uvcvideo.h              | 15 +++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +
>  include/uapi/linux/videodev2.h                |  7 ++
>  7 files changed, 114 insertions(+), 66 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb12lp.rst
> 

