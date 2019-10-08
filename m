Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AFCCF802
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 13:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbfJHLVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 07:21:37 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:46545 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730278AbfJHLVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 07:21:36 -0400
Received: by mail-lj1-f169.google.com with SMTP id d1so17061310ljl.13
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qc0+VqUtZ8Jzqx8hJ8xhxImCTjkZzyGvvjKkUErF7Vk=;
        b=HmIyv7BlqTxvbFGSbwQplGP8r87N7mWSZhRLOy1KHkIXr/DgIBvrAOrLhvGPSBMUpm
         WSWMjwcH9yXFt+TWCAVUzzPRci9o16GzFfXtx18zwPx4wBflO+loxXuCKUHLUQ3PPiMA
         RO0Kc561oxqK8ZPuELsUC5/Pm4yn5m/DR3owUn0cubpF6/S6+uw0k0WmqrrWskagPEw9
         B76p0lGD52f1dPbvznbwuxAxonZn46YS8+o58MnbLHs4wcEpWMi2CvVrEAehYENW3vTw
         Xawq1kqgifhXwHpScLPMTojul+uoSxUO4oiyIK0SlGZ0wrLR+PDAacrllfKu+F3K3Bos
         SWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qc0+VqUtZ8Jzqx8hJ8xhxImCTjkZzyGvvjKkUErF7Vk=;
        b=etIrsY47vJamshQY5EOl2B+si/EThXRMkVieHTdY8DM86mWxfpcPA1+rOjDvOPpCrq
         IvTJfSKfiXBtV+eft1glu816WjklxrJxb9HxH90eYRRALm7FTLulNy0cLJfC7blB3EwX
         l1Wf6scOV60diPSEz+JKB/Vdx2tDyIu6hciKKLBKakf/V5NaXUui77qCRWu577kN3JyP
         CtpO8SBbDCy9DTTOgAPn5FKrWuGuuy0wLYVFoYMLkniGRMlIknb8SFoyRy223wFY/gnm
         uc18fJ5KyAiMNB+QQMz50d126yPdI7qBBQyChK2JGUaywuhDegbxaTK/YuTG3D+VDpV+
         YMrA==
X-Gm-Message-State: APjAAAVzodjV3ld6gurVfwy6HJLXDcxmK1pePvADweRslSb2mBTn/kAh
        4be0ihaFrAr0EqnWPgng/Iz85hHC5lejs5152aY=
X-Google-Smtp-Source: APXvYqxiblsjoeA8wSFjU/c+Pa2k3M0XsZLpRBjvHfeH8nSWwaOmcPhdo1S5A6o4KUS8kvtzad6UzxmcRyfW2Bz3EGU=
X-Received: by 2002:a2e:9750:: with SMTP id f16mr15711942ljj.239.1570533694399;
 Tue, 08 Oct 2019 04:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
In-Reply-To: <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Oct 2019 08:21:23 -0300
Message-ID: <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
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

> So now I need to see if I can get Gstreamer to accept a pipeline like:
>
> gst-lauch-1.0 v4l2src ! kmssink

Ok, so now I decided use the hardware video deinterlacer:

media-ctl -l "'adv7180 1-0021':0 -> 'ipu1_csi0':0[1]"
media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"

media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x480 field:alternate]"
media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x480]"
media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x480 field:none]"
media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x480field:none]"

And then Gstreamer can be launched:

# gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink --verbose
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 800
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 480
Setting pipeline to PLAYING ...
New clock: GstSystemClock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
framerate=(fraction)25/1, colorimetry=(string)bt601,
interlace-mode=(string)progressive
/GstPipeline:pipeline0/GstKMSSink:kmssink0.GstPad:sink: caps =
video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
framerate=(fraction)25/1, colorimetry=(string)bt601,
interlace-mode=(string)progressive

However the video looks like a broken old TV scrolling the image horizontally:
https://www.dropbox.com/s/2yef8egn6s8z7ff/mx53_adv7180_capture.mp4?dl=0

Any suggestions, please?

Thanks
