Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96D92F64C5
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 16:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbhANPh0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 10:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbhANPhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 10:37:25 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5CAC061757
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 07:36:45 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id e7so6901279ljg.10
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 07:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qf5dNwADwH64C44UtxRHPiCCBB+ZZ8WfsRgCecMQQ3c=;
        b=TjX6p9GzMXAFpz69PYMlOPIRMLaiRhfwyls4fxHqPo2rsfSdYgJ6lENrHD2tNuZYUn
         8ZgaCJy4EnFcXpBLV6wdq8EUiHObRRZ0/FZ9+vFno5HqHuT+AEY6LZYOgdx1W69Rwqk+
         W1yRSFU/yRXsovmgf1V4jhW0aADIbDtjjgUFhYnRu7p4i9x4LxT6HABFln/u9UPYeEmb
         uxqlGabfFPef849IvuPAA9abEk2bUDE+7swrtcZweNrms0VhlLKBrHS2hex1GFpznz6E
         A9e52A/R16RY2Zfh5gIXvP2aLEx76A5e7jQaTp+TJpQ1EUuT3IVJbzQE5+yfIJ8/PeB6
         H9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qf5dNwADwH64C44UtxRHPiCCBB+ZZ8WfsRgCecMQQ3c=;
        b=hlq6m++eyHpp5duHg3moXZndY1gxGcEdsygkpqKMNZ9r3J7QFKIjhwQlGcii8XcrR1
         +oOlI3ZcXtUZzo5gxjophNbMNmCxBMEr/Inqvb5kk1MIzGW05O7lNMMuE0AU02wF96C6
         lwjECS3n/hySbo8a78Z0TWxPEH34BYYF85MVw+scYc+pYA/IYuGuGS91cyHZaA6uk7ZZ
         hBYae3V/2brLrt3z7uNL1Vund5J4v81JX/PKzPPqHmzZ5TxJS1u67TK5+V/CN4ZDNL9K
         KLJJvHHDrEMZ1ZoYDXGB1KbkS6fdS+PQv29lxO5ku91vb84iHZN6888RbDmUtvWpjqHX
         Njcg==
X-Gm-Message-State: AOAM533eoFG9ZxxXwhjfv2z0jOD4HDLCXJmHJlDkRkWz01AYFaYJRKXX
        ff5csv7Clu7uBDX5f43ucUn9YD18n4kGtf3jXJXBhwnXpdo=
X-Google-Smtp-Source: ABdhPJzTIeKjsVkKGIQdRUaRS00X9+1H+77gsFYnPlnm/1S20oaMCDCtD8Yu2ZXW4ETpj5ugc0K5Qoq9oldpmeE1UFE=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr3360168ljg.347.1610638603952;
 Thu, 14 Jan 2021 07:36:43 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
In-Reply-To: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 14 Jan 2021 12:36:32 -0300
Message-ID: <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
Subject: Re: Coda: imx53 plays video with incorrect colors
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 9:20 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am testing video playback on an imx53-qsb running 5.10.6, but I am
> not getting the correct colors in the TVE output. This is the result:
>
> https://www.dropbox.com/s/a4ifivpoi663dkd/mx53.mp4?dl=0
>
> The original video is this one:
> http://cdn.clipcanvas.com/sample/clipcanvas_14348_offline.mp4
>
> I resized the TVE output to 1024x576 so that scaling is not needed for now.
>
> The Gstreamer pipeline I am using is:
>
> # gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux !
> h264parse ! v4l2h264dec ! kmssink
>
> Gstreamer version is 1.18.2.
>
> Any ideas on how to get the video playback with the correct colors?

I forgot to mention that this incorrect color behavior is seen with
other video files too.

Actually, I was not able to see video playback with correct colors
using mainline kernel on i.MX53 yet.

Thanks
