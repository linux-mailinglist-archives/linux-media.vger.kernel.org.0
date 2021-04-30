Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8423736FAE0
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 14:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhD3MuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 08:50:14 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50813 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232816AbhD3Mty (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 08:49:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cSZolhrCsk1MGcSZrlSnzd; Fri, 30 Apr 2021 14:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619786944; bh=ugDzn/NtX/PmZREj6Rkj8Gg5kT0nb3atqQvHbdJQgZI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uokLIf1AjhE4w3+tVfadvEP1mq2tgAAJ/iksE4sWEVXqgFdNgastNfWjw8joihnRE
         DAlwtJtJiO7ilDs9xHDVor54d6EQGTMA2kChN9xXnavLWmjie5qmYVA7P6RMDLYiUD
         dvhFZ6YVFRDuSM4BGg5qNuWYKNFojrnve4Jx1+CBvqcAZeAiZedDAqcLTbtkT0FyB6
         v8eM88bY90RVxTsZviU7VuiQnuFADsR2KAr/9UL7lxIjGmgAfXtbOYlmas+KKY6n0T
         8sIrZC7DbMHLfGwFNpG4dldpVWWqpIgxpYf1xIiK8XLA0RUdqB1vDaDFtFe6lbvQ/7
         idEihsN4tZ4+w==
Subject: Re: [PATCHv4 0/5] media: uvcvideo: implement UVC 1.5 ROI
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210430112611.475039-1-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8a175117-d142-9265-65ee-43302bb82444@xs4all.nl>
Date:   Fri, 30 Apr 2021 14:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210430112611.475039-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHOXZGuOA7gowb6Ago+HvSxRHBtLtIqv6qnqRn7GqiU5fHp/d3oaRnbD1jL1vJH5+Us2LYWKNFVneWee2h4wutr9M6MHMXihuJ/pcf2HoHeL72XQfLZ8
 jRDUlZ2N2VNtcS+SPyzC73iluVWOs2c5kfXg8Tk0dc440BOj5rYxZ93JugRrj83tAAHaQQ+cM0ECKI67tPtPXU5a/IdoB58KBhxkPMbIXtdbr3PxQ2MpPr+o
 lgMHFZNcDBhc8aar+ZvmdpPMtJgtyXimBa6J1kdK+PsdT/uppQ7U0vh/zDRgQywvBW6A6RyWJfUImAQMhJGQz75dTRYTDFf0wcJLFMtPRN4zJ/3gWrVwbu5g
 fTjTk5TLGnoPthC96ynoMdOZa8Nmw/ckF8/qKFmNNas1HXRxEJI00XiRJqCzncxbRlbnuJww
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On 30/04/2021 13:26, Sergey Senozhatsky wrote:
> Hello,
> 
> 	This patch set implements UVC 1.5 ROI using v4l2_selection API.

Is the selection API the right approach for this? Wouldn't it make
sense to use controls instead? That would interface easily with the Request
API allowing per-frame changes to the ROI, and with dynamic array controls (1)
it allows you to provide multiple ROIs as well.

The only missing piece would be MIN/MAX for compound controls, but that can
easily be added to the control framework.

If this was discussed before, then can you give a me pointer to that discussion?
I couldn't find anything for that, but I didn't look very long for it :-)

In any case, it doesn't really feel like it is the right API for this job.
I really need to review this series when I have a bit more time :-(

Regards,

	Hans

(1) https://patchwork.linuxtv.org/project/linux-media/cover/20210428101841.696059-1-hverkuil-cisco@xs4all.nl/

> 
> v4:
> -- split ROI rect selection API and auto-controls
> -- handle very large ROI rectangles: limit to frame dimensions
> 
> Sergey Senozhatsky (5):
>   media: v4l UAPI: add ROI selection targets
>   media: v4l UAPI: document ROI selection targets
>   media: uvcvideo: add ROI auto controls
>   media: v4l UAPI: document ROI auto_controls
>   media: uvcvideo: add UVC 1.5 ROI control
> 
>  .../media/v4l/ext-ctrls-camera.rst            |  23 +++
>  .../media/v4l/selection-api-configuration.rst |  22 +++
>  .../media/v4l/selection-api-examples.rst      |  27 +++
>  .../media/v4l/v4l2-selection-targets.rst      |  24 +++
>  drivers/media/usb/uvc/uvc_ctrl.c              |  19 ++
>  drivers/media/usb/uvc/uvc_v4l2.c              | 185 +++++++++++++++++-
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/v4l2-common.h              |   8 +
>  include/uapi/linux/v4l2-controls.h            |   9 +
>  9 files changed, 315 insertions(+), 3 deletions(-)
> 

