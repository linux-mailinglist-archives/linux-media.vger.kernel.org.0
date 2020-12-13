Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069252D8B00
	for <lists+linux-media@lfdr.de>; Sun, 13 Dec 2020 03:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391863AbgLMCps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Dec 2020 21:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgLMCpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Dec 2020 21:45:40 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504EEC0613D3
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 18:45:00 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id n26so17763653eju.6
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 18:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qj4vHoLSdnXRzxFDaM1rTn6MykdZjxoQ+fx8S8K3Z3I=;
        b=l/tj1eBiuTTT/x1IgZZmBggiXl1fGwGtWS6s2vrNc8bPTuk73VKm9lwPhov57VCUzQ
         LL2nz22acuaJ/8L9+UBnPxkN9GKqq7vlNd9BtKP1jduRW7EmZEKlCUqtYs8qOKYASkiK
         lKp4vOCLxKg5Q2vLA5u7a6H4NsWWGn0nAYdztmhe5NKQYE9p2SWiADre/a3T7MVOh2kx
         Wa3Yku6vQOxVttRbqFRcthLBRJR5yCTvtro5l6IUv4cy+wGvjB5BiiFLoEMGohWd5sL9
         IHW3xdwJpH7F8qN+/xjWLsdXVhuE/TI5ToMpVGPZp12IMBMlras+8Bl1Ru6rnJ5zWU37
         yvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qj4vHoLSdnXRzxFDaM1rTn6MykdZjxoQ+fx8S8K3Z3I=;
        b=CJANlVbps2ehbCKucQvxx2Yvu/pz3vJQL742i3nYJxXP87KJNbz0Zh0KCCrJgsOswK
         p7tL+r/uqblAoniDEB1aHd/vD4xiHV/h+h83wESnMB6Sj+8zo2RccOrf7RgFF3Ui/Uiq
         lM8R5cwliORrA8KQ0ahUMpVTXkldQj0TLgkOt+NqSSRVL6ecQ+YqYSEFWxZXicCOsl53
         Co4UEmMMlrLgECjd9tXqt79zuB5s60mT4zf29uSlzPKeR+8MnitVC0ylfkuAVxAaEIvM
         CKkWaD8TlLaocJCBwuFhrNmS5XjvFUMbKsD6ult5SsAiNAbI1Qb/npkUTAh6IN2lf0Vm
         VSPA==
X-Gm-Message-State: AOAM533/LzKmru2fYmCuxfxp5dlkj55xMpfqe4zk/xNSbEcX4rZrbpjr
        V/1kwOsrv+8CBf0cU0I70Q0LhlB4G3ZDzuXfYDkMYg==
X-Google-Smtp-Source: ABdhPJxKM9/iG4OB32LL/mpd2xf/u0Cew4G5Bk7Hx2utjWLH2Bl3pDG7cVds17eUjp7tU+aHJYMySy1DUp37ssjPrPI=
X-Received: by 2002:a17:906:7cc6:: with SMTP id h6mr16810353ejp.161.1607827499009;
 Sat, 12 Dec 2020 18:44:59 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5BQbED4-P-R8xsh1_c02E4DUxQdc+P=46rt=L+mYFsrRA@mail.gmail.com>
 <387f60ecefaa04678df95cb1c3af6a4010c6d9d8.camel@ndufresne.ca> <CAOMZO5B_r7Vi4VhX2i7Wjz-E05EnpR3vi1i3i01UEfPFiE+pgg@mail.gmail.com>
In-Reply-To: <CAOMZO5B_r7Vi4VhX2i7Wjz-E05EnpR3vi1i3i01UEfPFiE+pgg@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Sat, 12 Dec 2020 18:44:47 -0800
Message-ID: <CAJ+vNU35AB0Mggbrz5_9xz8U7u1hGCCdr5Pvo_y5BOPEOsbhLg@mail.gmail.com>
Subject: Re: imx6 capture via ADV7280
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 27, 2020 at 7:58 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Nicolas,
>
> On Thu, Nov 26, 2020 at 3:25 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> > I support kmssink ask for progressive frames, while v4l2src can only produce
> > interlaced. There is likely something to improve there, but meanwhile, consider
> > usign deinterlace element.
>
> Thanks for your feedback. I am configuring the links like this now:
>
> media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]"
> media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':1 -> 'ipu1_vdic':0[1]"
> media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
> media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/640x480 field:seq-tb]"
> media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/640x480]"
> media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/640x480]"
> media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/640x480 field:none]"
> media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/640x480 field:none]"
> media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/640x480 field:none]"
> v4l2-ctl -d2 --set-fmt-video=field=none
>
> gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink:
>
> And the Gstreamer pipeline works now.
>

Fabio,

I wanted to take a look at this as you are using an adv7280 with the
adv7180 driver and I previously had found using the adv7280 on an
imx6q/dl there was a difference in the output format for the adv7280
that caused an issue with the imx6 format [1].

I have also still have to patch imx-media-csi.c to skip the first few
frames in order to sync properly on bt656 sources [2].

Did you have any patches in the imx-media or adv7180 drivers to deal
with these issues I run into?

Best Regards,

Tim
[1] - https://patchwork.kernel.org/project/linux-media/patch/20190827215539.1286-1-mmichilot@gateworks.com
[2] - https://github.com/Gateworks/linux-imx6/commit/959fbd4
