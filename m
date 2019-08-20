Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED90395A8A
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 11:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbfHTJAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 05:00:16 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33742 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbfHTJAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 05:00:16 -0400
Received: by mail-vs1-f66.google.com with SMTP id i7so3054685vsp.0
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJe4FUz6/qnqDofDHpLq8YBD58depn0Eh8fZs42JIjg=;
        b=Cv37vxj2k/gq0JHIRDgkalWPaT3UtaQm/cdfJSed871f1xbO99FVX0bNKCieQlGhA5
         zwbOGpyKAvtM52rbL6E0ehVRiyUmUOGVxmObBho+98jN9sazjCFZ37+mDcZHcyeRGPUj
         J4I6g25BX2uHrbnuHQw1bgmLV9kcwBc2+szFj/+nQzqYMei1PPHSRfxqcP5dcmNmwPPw
         2zCCBrp66nNDl388kaFYFieB5tFxttnAnrCxMt7K++sDnTAyhmZDtwtobfTaFzdAeP05
         yv318x/MjNzQFVLXpdk6q3KViOHCPzdSb4ZJ/WWgyLjoD6B1rGTQqD6lILpFX7jp/h66
         P74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJe4FUz6/qnqDofDHpLq8YBD58depn0Eh8fZs42JIjg=;
        b=l0fuLaonSetgPf+c9Bur1tc+TPMaeoqwUZ9hOqfcuFpM7WfXYEycrtyC/9XFc7Wzio
         gIKjd1BlXP/OhW8g4/8kYFsaRq/iBF2JJAQ3a5V4pP1WFj4RffWxrmcSokof3IK6An3I
         JAlIM7JNysY3sOLxR9vwXLk7u9Bqsn0OVWaO+zQYIAxE3/RV1HMGRwbVo+qlVEKdjH7h
         +PfHgKTZbofO1vsZOp27FkX8I2nL4kzkpHEuTvneo1eUJYhxvkj8bYzZr/u/M+0liBmD
         98zKy/1kCt1FVUqFzjw2VaxQACKl62e5qJAm6aDQIpjntLdXLPIfAYo1PpVbeyux1z3N
         vt1Q==
X-Gm-Message-State: APjAAAU3i4yE9dBkZJLFu5ypmo0YSoZAJhg7XKfI+Wz2MVDBFmQIKSml
        /I0MPDejDla32MMWhQk6+DV+MhQkx5bPlt5Ol6W5c2ML
X-Google-Smtp-Source: APXvYqxZ0jLs0FghRtuu9SOi2eLv7u6IX7yZBTgCZ7eJ21cAL/hvjQk5kIEZSoRClSwf+wtMfPASmPLrVAWWDDjzTOc=
X-Received: by 2002:a67:e9da:: with SMTP id q26mr14882963vso.31.1566291615066;
 Tue, 20 Aug 2019 02:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADYCxoPj_aUUjh0WhA-op0+z=1q+HxC0LbYwRFFMeFrm7qEAOQ@mail.gmail.com>
In-Reply-To: <CADYCxoPj_aUUjh0WhA-op0+z=1q+HxC0LbYwRFFMeFrm7qEAOQ@mail.gmail.com>
From:   Sergey Zakharchenko <doublef.mobile@gmail.com>
Date:   Tue, 20 Aug 2019 09:00:04 +0000
Message-ID: <CADYCxoOnXaOPsStH-bNtzauQbz+f9uADjb_nD196jk9GgJ=aGQ@mail.gmail.com>
Subject: Re: [uvc] Frames smaller than dwMaxVideoFrameSize
To:     linux-media@vger.kernel.org
Cc:     Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello again list,

I wrote:
> We're seeing problems using cameras based on Geo GC6500 in Linux
> kernels 4.19+ in raw mode (as opposed to H.264 mode, to avoid IP
> issues).

> Putting frame size reporting/calculations aside for now

Now, on to frame size calculations. There's a small gadget in the code
seemingly existing since the dawn of time:

https://github.com/torvalds/linux/blob/95f5cbff90b9e4324839a5c28ee3153a3c9921a5/drivers/media/usb/uvc/uvc_video.c#L119

if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
(ctrl->dwMaxVideoFrameSize == 0 && stream->dev->uvc_version < 0x0110))
    ctrl->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;

It seems to be overwriting a closer-to-the-truth value of 3110412 in
dwMaxVideoFrameSize with frame->dwMaxVideoFrameBufferSize which
happens to be 4147200 and is used from then on, including the
uvc_video_validate_buffer() check. FWIW uvc_version is 0x0110. The
value is still not quite 3110400, but even if it were so (e.g. to
please uvc_video_validate_buffer()), it would have been overwritten
anyway. The condition block logic seems worth double-checking (sure
it's || not &&?).

My original question on whether a value below the maximum is valid
remains (hope the answer is obvious).

Best regards,

--
DoubleF
