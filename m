Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 257FACFF5C
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 18:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfJHQzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 12:55:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53805 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfJHQzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 12:55:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so3958205wmd.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GjMTiq2xMEJFWs+x6HgZVlQ9LUGsiLoA5x/e6tyWslU=;
        b=qJX8cCOwaK8qsLgsofI8eIJwIZLmJdLFK5CrdshYc34jprLi9nuPMY53/dlVTWpRvE
         T04ghcXxZDQTWSffxZj27arcJuL2GWiBYh3lyab+8YjB/r0yOd/TI8hYkc4cFj41zgbM
         jkk7hcGKHk+dSpGjkMOEKWu1Dwyw0kPZuY7R8Vy/B4PF09hqCP1ay4uwHR6vk1N+CXkC
         YUqEI7O2SRswAfiuv/smWz6XRRCb3DFpTClegGQcA7/N+khXbbwZy2Fsm0XcPJ72qszk
         NknobR9uF93j6v8nlILhHK1zBnAc2AvIUOfoDAzZnRcS659ZH4E+nbzqmeomK5Y9xV20
         hJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GjMTiq2xMEJFWs+x6HgZVlQ9LUGsiLoA5x/e6tyWslU=;
        b=MOE/5toBaBkXkAI/wGhITH0MHOs/WHlHSGdu2SfM7zgHgz1DwqudAJXoXU8knHMGDV
         YYnS0WkZhpUJpKohTUjpmDum2PC24bhI2LN4X29O0R3iVDtBsSZsTHze7OM6TBf7Udgl
         mV+MT5kDWOVodAiLG6MqyyKkbhXPTh9+Cf3qqFrWCP+ToUYSGD8QhIaWPbcH04ur4E5U
         TfWbNc9kJgYQkBZtmEBjl4OkJCt3NsJn8CcvSiuEo2zJH8wFiv9jjScGyKOM9gsF9ZF0
         /WgfwcKNVfOCtyNqhiTZhQ6niHztqkCLZ3FQCXRcoI9T8BtmF8DqVh9mioZE23QOa/iM
         yZSg==
X-Gm-Message-State: APjAAAWaoCN7gSkgKH7laOIi9HWBLnvVWq0dhoAvv+nWEpUjmha3Wr+o
        68l1cMAi/9o4vvtKYm0XeiD6rKYf44pvkXu2x8PhcQ==
X-Google-Smtp-Source: APXvYqwIuVKivNTPr0uYsenRKUyDzQpD8FHAhkz761B49bNrXE6oGWDXGi+hkpVW0K+hpUcxJBOkQlUbEqz1P6oimJg=
X-Received: by 2002:a1c:2bc7:: with SMTP id r190mr4865959wmr.143.1570553740769;
 Tue, 08 Oct 2019 09:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
In-Reply-To: <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 8 Oct 2019 09:55:29 -0700
Message-ID: <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 4:21 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Oct 7, 2019 at 10:07 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> > So now I need to see if I can get Gstreamer to accept a pipeline like:
> >
> > gst-lauch-1.0 v4l2src ! kmssink
>
> Ok, so now I decided use the hardware video deinterlacer:
>
> media-ctl -l "'adv7180 1-0021':0 -> 'ipu1_csi0':0[1]"
> media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
> media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
>
> media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x480 field:alternate]"
> media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x480]"
> media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x480 field:none]"
> media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
> media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x480field:none]"
>
> And then Gstreamer can be launched:
>
> # gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink --verbose
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 800
> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 480
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
> framerate=(fraction)25/1, colorimetry=(string)bt601,
> interlace-mode=(string)progressive
> /GstPipeline:pipeline0/GstKMSSink:kmssink0.GstPad:sink: caps =
> video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
> framerate=(fraction)25/1, colorimetry=(string)bt601,
> interlace-mode=(string)progressive
>

Fabio,

Yes, you need to use the vdic to capture from adv7180 with gstreamer
as it can't handle alternate.

> However the video looks like a broken old TV scrolling the image horizontally:
> https://www.dropbox.com/s/2yef8egn6s8z7ff/mx53_adv7180_capture.mp4?dl=0
>

This would be because of the initial corrupt frames that this and many
other decoders produce while waiting for proper sync. I added
'g_skip_frames' support in 9483a3f8e1b58ba1d7cd21687d8d0a63a015c36b
but I'm not sure how to get gstreamer to use it?

I still carry around a patch from Steve for imx-csi that drops first
few frames from BT656 sources:
https://github.com/Gateworks/linux-imx6/commit/959fbd42ee6433f49ef4a04fb1abe8f8c78db5ad
to deal with this.

Tim
