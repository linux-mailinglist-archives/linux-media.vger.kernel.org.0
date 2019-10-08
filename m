Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6980ACF094
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 03:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfJHBkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 21:40:20 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:42465 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfJHBkU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 21:40:20 -0400
Received: by mail-lj1-f178.google.com with SMTP id y23so15705032lje.9
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i35ZQq7LE+c2VTTOqgxrsNtkNygjaJ54fNfIeFTPjQ8=;
        b=dfRHG9gFqhNrYSZLsgln08oy3JRyvBO072a6pd5BzyZgjCOXPAyqMmEgG7WeUdoiFf
         M72xnQYm4AA4x6dDo5eIUZU5e66ZO66NDjPVkKa1kx2sKxnGd/vCxgA5qQ2oQBCnSLs2
         AchXA5YZIXPjzI241RtzNrUnyIytYSwbDjazgka4WhxPZrrbClHNeex6RRYabpTMnAtd
         aR2W7DQNzDsMaOu/v5/6cGYdryhE1AWrWG6onnqqk6VF9IQsh6JBn+GmBVoWxheNBQz6
         870mPHKYVTgnSN3R4EMGkdLH2U+rFD0QXoE7ZOXb6tOVToSlyEypeTAv/XRuPO66zdii
         jU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i35ZQq7LE+c2VTTOqgxrsNtkNygjaJ54fNfIeFTPjQ8=;
        b=EGtEDmXTCSnWgvPwW9eqaI03NSTbUG6RLfMzgoVcAXb9dje5lYJ/Q1dJ+0QKCwkvtB
         tmUXR2RYQhlLjBfVaCsVarVDmBUSzeUXKf9+pJuhJL2WKxJgX3SAz9TbBbglxGZrleJ0
         HZiGIaKNZLqiqIrEMhPu+x+O+MOFO8XATL+P1cth+WPtuzTdT6CJr9Q5IaNT+ONZTFRS
         BZ16bVWIB34KgORSMJO/VZ0dknY5loRTKOcla5hf0i54dkbPvnrnBEorEjfrzSXwlS0q
         u4HSNmMi58ZBoLinS5RPwe9K2f7ghR8DTtWb4maYoqoTUTyappEjlimMKQnIt9Jni7ns
         pVOw==
X-Gm-Message-State: APjAAAUqM0POcic3l2h8FL32jQptrb9C7PNXX1O7cZM8E29yeTld+hRv
        y6rL/az7H/+EykKmLmAfZODRS0wa6H3NbbE0WF4=
X-Google-Smtp-Source: APXvYqw/rocefqIJXPNVd19a8rmaAf/N6P4dR7QhQudYfqCnTztWZF9x0Z7V37jWUESnwuCzLwItQ4m1caAZG6lmQWI=
X-Received: by 2002:a2e:b1d0:: with SMTP id e16mr6100019lja.0.1570498817745;
 Mon, 07 Oct 2019 18:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
In-Reply-To: <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 7 Oct 2019 22:40:06 -0300
Message-ID: <CAOMZO5BZD0s85tdhWQDf0SLaO8YfTyB6rZ1E8SgFEX2U=ynNig@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 7, 2019 at 10:07 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Oct 7, 2019 at 9:51 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> > Ah progress. Try:
> >
> > v4l2-ctl -d0 --set-fmt-video=field=interlaced
>
> Yes, with this hint I can run:
>
> # v4l2-ctl -d0 --set-fmt-video=field=interlaced
> # v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw --stream-count=1
>
> And it seems to accept the capture of a frame.
>
> Without passing field=interlaced, I used to get:
>
> # v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw --stream-count=1
> [  163.838944] ipu1_csi0: capture format not valid
>
> So now I need to see if I can get Gstreamer to accept a pipeline like:
>
> gst-lauch-1.0 v4l2src ! kmssink

Even though the one-frame capture via v4l2-ctl seems to work:
 # v4l2-ctl -d0 --set-fmt-video=field=interlaced
 # v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw
--stream-count=1

, Gstreamer is still not happy:

# gst-launch-1.0 v4l2src ! kmssink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
'/dev/video0' does not support progressive interlacing
Additional debug info:
../../../gst-plugins-good-1.14.4/sys/v4l2/gstv4l2object.c(3813):
gst_v4l2_object_set_format_full ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Device wants interleaved interlacing
Execution ended after 0:00:00.022400639
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...
