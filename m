Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5FA3F25D4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 04:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfKGDIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 22:08:48 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41000 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbfKGDIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 22:08:47 -0500
Received: by mail-ed1-f66.google.com with SMTP id a21so627846edj.8
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 19:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAfjo+6GX40N8x/qOoAPJLTNhLDPy6SYwK6lSBU1urk=;
        b=YMfJpiCN4Ig8D+LLOBNrepFfMz7Ze5j63f+c9Uw8V5q9niZmdpwGA+CXuQuw5PrWS3
         7dTE+HC+yEBDy3rtNxNpUJeDPn2L8svDkdkUHIxc9CIRoxICSYDdy1kzKdOnOPS2U2cX
         ak6fy7fMi6PIbdJJLXbqqFBQHk80kW0gbEpmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAfjo+6GX40N8x/qOoAPJLTNhLDPy6SYwK6lSBU1urk=;
        b=Yt0jASPmD14/U0+s+8RLzrPU/3Cr/TCf+Zh5P3s0UO1PI1InLT7HIFzJQJ4E8pS/9l
         V1eRcOf3JQLOK2oH/xzQy0KVnF4lMCkNMGhecuYojSzGVEubntY9G0dWwG317rED+kKe
         +ETZnsZwz7KjjgyrirEi13NQP9au2KNUF0YXsh0cvMw4L5NfezqYiYnRM2SqrHC4TuiK
         8upbR1uxnUgr1QzNnJnttASxKZZu/qH5FmdGpuckCBGw34/F2RvfwgSlMviec2bn3qXA
         xj+GsBy5Gp2hdwIOkp0NImWu/3KXTt+G6KvgIwHjw1gTstMAw3iqfQJ5uK18EGp5wW+u
         apTg==
X-Gm-Message-State: APjAAAUrDYB84Vez1BSelAqZbNCpu9ZiF9DnDCxOVizJc17iS0iqx5o0
        CMo6601zr5QvxHNu3RGFrIlCFTPJhj3CXQ==
X-Google-Smtp-Source: APXvYqw8Qic2C4i1S3iSO/YXICVkJREOPd+WoBFHsN9Axeg0eZXS1ynYCP/ab1j9x5K5514VMYrQ5Q==
X-Received: by 2002:a05:6402:b02:: with SMTP id bm2mr1195013edb.130.1573096122597;
        Wed, 06 Nov 2019 19:08:42 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id u30sm18914edl.30.2019.11.06.19.08.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 19:08:41 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id h3so1208858wrx.12
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 19:08:41 -0800 (PST)
X-Received: by 2002:a5d:4946:: with SMTP id r6mr52152wrs.155.1573096120434;
 Wed, 06 Nov 2019 19:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20191106120132.6876-1-helen.koike@collabora.com>
 <20191106120132.6876-2-helen.koike@collabora.com> <9102bcf8-0279-7972-daff-b15aaf98804d@cisco.com>
 <28cff7ab-ef56-791e-0342-571f64cb9807@collabora.com> <b1a8fa60a3c8922c364a18b0583dab55660f2fb4.camel@collabora.com>
 <c3b03fc7-100d-4c16-f561-b26969d13fea@collabora.com>
In-Reply-To: <c3b03fc7-100d-4c16-f561-b26969d13fea@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 Nov 2019 12:08:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AtZ+MiAWVDVkE3PLj-TuwjZd=zg9ozE6P_6bNW_o0oBg@mail.gmail.com>
Message-ID: <CAAFQd5AtZ+MiAWVDVkE3PLj-TuwjZd=zg9ozE6P_6bNW_o0oBg@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        "Hans Verkuil (hansverk)" <hansverk@cisco.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "eddie.cai.linux@gmail.com" <eddie.cai.linux@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
        "zyc@rock-chips.com" <zyc@rock-chips.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "zhengsq@rock-chips.com" <zhengsq@rock-chips.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 7, 2019 at 8:26 AM Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 11/6/19 11:44 AM, Ezequiel Garcia wrote:
> > Hi Hans, Helen:
> >
> > On Wed, 2019-11-06 at 09:30 -0300, Helen Koike wrote:
> >>
> >> On 11/6/19 10:22 AM, Hans Verkuil (hansverk) wrote:
> >>> On 11/6/19 1:01 PM, Helen Koike wrote:
> >>>> From: Shunqian Zheng <zhengsq@rock-chips.com>
> >>>>
> >>>> Add the Rockchip ISP1 specific processing parameter format
> >>>> V4L2_META_FMT_RK_ISP1_PARAMS and metadata format
> >>>> V4L2_META_FMT_RK_ISP1_STAT_3A for 3A.
> >>>>
> >>>> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> >>>> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> >>>> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> >>>
> >>> I acked this? It is missing documentation for these new formats.
> >>
> >> I think so https://www.spinics.net/lists/linux-rockchip/msg18999.html :)
> >>
> >> I'll update the docs and the fixes you pointed below.
> >>
> >> Thanks.
> >> Helen
> >>
> >>>> [refactored for upstream]
> >>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes in v9:
> >>>> - Add reviewed-by tag from Laurent
> >>>>
> >>>> Changes in v8: None
> >>>> Changes in v7:
> >>>> - s/IPU3/RK_ISP1
> >>>>
> >>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> >>>>  include/uapi/linux/videodev2.h       | 4 ++++
> >>>>  2 files changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>> index 315ac12c3e0a..ade990554caf 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>> @@ -1341,6 +1341,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >>>>    case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> >>>>    case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >>>>    case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> >>>> +  case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A params"; break;
> >>>
> >>> params -> Params
> >>>
> >>>> +  case V4L2_META_FMT_RK_ISP1_STAT_3A:     descr = "Rockchip ISP1 3A statistics"; break;
> >>>
> >>> statistics -> Statistics
> >>>
> >>>>
> >>>>    default:
> >>>>            /* Compressed formats */
> >>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> >>>> index f98bbcced8ff..56798b09cd85 100644
> >>>> --- a/include/uapi/linux/videodev2.h
> >>>> +++ b/include/uapi/linux/videodev2.h
> >
> > Can we avoid touching videodev2.h, as we did for the stateless codec pixfmts?
>
> I think it should be part of the uapi, as it is the metadata format used in the video output device.
> I propose to leave it inside drivers/staging/media/rkisp1/uapi/rkisp1-config.h while the driver is in staging,
> then we expose it later with a better documentation too. Make sense?

Makes sense, as it's also what we've done for ipu3, +/- a slightly
different path:
https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/ipu3/include/intel-ipu3.h#L12

We could possibly move the header to include/rockchip-isp1.h to be consistent.

Best regards,
Tomasz

>
> Thanks,
> Helen
>
> >
> > Thanks,
> > Ezequiel
> >
> >>>> @@ -762,6 +762,10 @@ struct v4l2_pix_format {
> >>>>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> >>>>  #define V4L2_META_FMT_VIVID         v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> >>>>
> >>>> +/* Vendor specific - used for RK_ISP1 camera sub-system */
> >>>> +#define V4L2_META_FMT_RK_ISP1_PARAMS      v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
> >>>> +#define V4L2_META_FMT_RK_ISP1_STAT_3A     v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
> >>>> +
> >>>>  /* priv field value to indicates that subsequent fields are valid. */
> >>>>  #define V4L2_PIX_FMT_PRIV_MAGIC           0xfeedcafe
> >>>>
> >>>>
> >>>
> >>> Regards,
> >>>
> >>>     Hans
> >>>
> >
> >
