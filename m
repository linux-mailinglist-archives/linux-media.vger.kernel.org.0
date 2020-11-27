Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0327C2C690A
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 16:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731154AbgK0P6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 10:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730892AbgK0P6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 10:58:53 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30861C0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 07:58:51 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id t6so7632297lfl.13
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uVgoYCJPUl1dyOOYSGf+bsDNtFSOUE+VwArF6SYcJY=;
        b=YUBQbcu569NuTu5FR/9if+ppR6Io5GwXIQz+yROZBCEjJeRYJA2hqIHK6H0bWxxFG4
         gKxzkaCL+iKu/pWhITxGqEg/A6JKxdMDecHm0nvhyJu6+qhob16EXh0cofhLu1ls2t+u
         hCJ8yS4Juh96T/8dG5a0FAMfpfvA00RTLG7uN5h5qoV+i/8Eg9s8com0K4V2stHA1p33
         hyThzKxpJOKpEvacf3e/0U9/BtO5V8CQ49Dfuvhjc/aFmITomNix+tN+KHYimuD1cTWU
         nkq7iMmOjtY/RuAYo2ajpKcx5hAYbG513ly/Uk0RGCAXjsCJkT0HGYI2It7tFk4qniGx
         fJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uVgoYCJPUl1dyOOYSGf+bsDNtFSOUE+VwArF6SYcJY=;
        b=nhM5G4ohIKO7kCglPoWSo3O09WlxjUaMwlkZ7PtycnzkYuU+SzbcqrI4m58M8wccWB
         QD/DSLFmwptnqV/EjhRA5POZvHxGVbaEpL2cHDKxtJOQhnpPIfSUx5aN0ZfLU2l9ZX+E
         aXJU3QFwSm64+H7jhgOlxDhdaEqjfgSV7oTSCV0k0jVPXrwxwC+5ZAs6ob4ZCMBKV+kr
         7TMrH1vZVkClGRk7eCXz58xJggRGc1cFIrRY/8/QRwbwNhU/nw5Y6gPx/gQvF/wsEsiG
         eQzgaGaxCepXhtrFSnzTSmleNTstM0oCMC/DkyOyEq4r+ylUpRxyZozLJPwMp1V35RSF
         yKrg==
X-Gm-Message-State: AOAM533rDHH79nc6BLnfIohxCa6eVVaUjowJvB1mbUc/L56t+pwYar1i
        XY5YYiLNxgkDpQFDetwF7OZyZjvWtzIYSwQVnoM=
X-Google-Smtp-Source: ABdhPJxHBVhLEehy/p0AS1crjeSpReAQljjfs6G0gJ+jB9rTeE0cAKSAh94UQCZdoo4ISc5oYJXTQ4F7wr8GAKH0cDQ=
X-Received: by 2002:a19:8353:: with SMTP id f80mr3867343lfd.348.1606492729654;
 Fri, 27 Nov 2020 07:58:49 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5BQbED4-P-R8xsh1_c02E4DUxQdc+P=46rt=L+mYFsrRA@mail.gmail.com>
 <387f60ecefaa04678df95cb1c3af6a4010c6d9d8.camel@ndufresne.ca>
In-Reply-To: <387f60ecefaa04678df95cb1c3af6a4010c6d9d8.camel@ndufresne.ca>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 27 Nov 2020 12:58:38 -0300
Message-ID: <CAOMZO5B_r7Vi4VhX2i7Wjz-E05EnpR3vi1i3i01UEfPFiE+pgg@mail.gmail.com>
Subject: Re: imx6 capture via ADV7280
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Thu, Nov 26, 2020 at 3:25 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> I support kmssink ask for progressive frames, while v4l2src can only produce
> interlaced. There is likely something to improve there, but meanwhile, consider
> usign deinterlace element.

Thanks for your feedback. I am configuring the links like this now:

media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]"
media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':1 -> 'ipu1_vdic':0[1]"
media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/640x480 field:seq-tb]"
media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/640x480]"
media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/640x480]"
media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/640x480 field:none]"
media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/640x480 field:none]"
media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/640x480 field:none]"
v4l2-ctl -d2 --set-fmt-video=field=none

gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink:

And the Gstreamer pipeline works now.

Also, to fix the timeout issue I reported earlier, I had to increase
IMX_MEDIA_EOF_TIMEOUT:

--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -65,7 +65,7 @@ enum {
 };

 /* How long to wait for EOF interrupts in the buffer-capture subdevs */
-#define IMX_MEDIA_EOF_TIMEOUT       1000
+#define IMX_MEDIA_EOF_TIMEOUT       2000

 struct imx_media_pixfmt {
  u32     fourcc;
-- 
2.17.1

Will submit this change as a formal patch.

Thanks,

Fabio Estevam
