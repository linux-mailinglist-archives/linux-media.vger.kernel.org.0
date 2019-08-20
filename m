Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2500B9593C
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 10:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbfHTIRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 04:17:25 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:40289 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729150AbfHTIRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 04:17:25 -0400
Received: by mail-ua1-f41.google.com with SMTP id s25so1654414uap.7
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+f8jhVfHfz76rOIPhhM4sDOIcZeVMCrTUwe5qRly1zg=;
        b=Fk8iVrxSxV3wFcTg21RLQ4ZuzVesgmx7H3EKna2I982B+kP+w1KITslqc7awh0E39s
         hqkhHcMvrQfjpGd8ulnkcdug492ZQD1R+x/Yx8l+fNDaPh9pH/qp9e43M19cSlySCzRF
         GcAAkZK51N3h4YSvTOF3Bp9Nh92ZEmTnqQamE59V83Be8gqwYCSshhz8r5dQ2FbiaucW
         IGc8RQEYPXt+ETfN1lQTeNToWQaksUdzRBClhLfTZBkQSUaV3DmHCHrwnvwjBmXl8vmr
         ei+fa+1wCchLpIU5NU8qollxkaN+AAv8ztl6G4ASmLst9qfJOBDCEz82D3h0WapMw3kg
         200A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+f8jhVfHfz76rOIPhhM4sDOIcZeVMCrTUwe5qRly1zg=;
        b=s+rouKpFep+yhpvxUinOyXQt5oKCL8cEh4OmM8aBPwB97uk1oqk2/WDb5h7oxO5tgr
         GC2yDq0gUyH5lSBdqJao1NqshD0fH0elMtx1uAfTUGTdhj7yqI1UOzC2v/+5nrMPF+r6
         N/dVu5FWSfKQaxbXnvxkEXJK7XVb15Frq1kIqNM+cPT3qRZd1VRtOGfk4gzgZECgnEOC
         kpFfEfdBX56WGOaExH4tSahgOjs6TOYNouxjGbMEHjVrrAac4F4AX/VlCbSV27nviVwD
         cUGPRkteKpRea4EhPNpxKrMJC/WTi8bgQCol8vNp0On9p4NM6GMfdlvd5d6IjeeZqs8D
         Z31g==
X-Gm-Message-State: APjAAAXTmr9SZJd+S/3CkhZR5TKp0d+89EIlVHYViuiWye/nfVgZOIyi
        /pB453N88EQwX8kZKKv5TqlXfK/xZl+G/1kdC62gy04c
X-Google-Smtp-Source: APXvYqynnaq2CrEg0RbkAmxWNza/rtKphL+6/2e95I4jnEyTy9EFhmlnNRQHVRBRFHZH7h6JR1JceGpOF5fKOgWDq8o=
X-Received: by 2002:ab0:7198:: with SMTP id l24mr380785uao.137.1566289043742;
 Tue, 20 Aug 2019 01:17:23 -0700 (PDT)
MIME-Version: 1.0
From:   Sergey Zakharchenko <doublef.mobile@gmail.com>
Date:   Tue, 20 Aug 2019 08:17:12 +0000
Message-ID: <CADYCxoPj_aUUjh0WhA-op0+z=1q+HxC0LbYwRFFMeFrm7qEAOQ@mail.gmail.com>
Subject: [uvc] Frames smaller than dwMaxVideoFrameSize
To:     linux-media@vger.kernel.org
Cc:     Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello list,

We're seeing problems using cameras based on Geo GC6500 in Linux
kernels 4.19+ in raw mode (as opposed to H.264 mode, to avoid IP
issues). We have traced that to commit
95f5cbff90b9e4324839a5c28ee3153a3c9921a5 "media: uvcvideo: Also
validate buffers in BULK mode". The uvc_video_validate_buffer()
equality check fails (e.g. for 1920x1080 NV12 dwMaxVideoFrameSize is
4147200, bytesused is 3110400) and frames aren't shipped to userspace.

Putting frame size reporting/calculations aside for now, I'm curious
about the rationale of the whole uvc_video_validate_buffer() check for
size equality in general. The UVC 1.1 spec, and the variable name, say
"maximum", and I haven't found a specific statement that frames must
be exactly that size. The spec further implies that frames can indeed
legally be smaller by saying "The sender is required to toggle the
Frame ID at least every dwMaxVideoFrameSize", note how it says "at
least". The check doesn't seem legitimate, at least at a first glance.
Could you provide some background? If you wanted an heuristic to
detect broken/incomplete frames, there might be other ways to do that.

The raw video stream is otherwise (e.g. kernels before 4.19, or after
but with the equality check removed) processed just fine with e.g.
gstreamer FWIW, because the frames aren't, indeed, broken.

Interested parties CCd.

Best regards,

-- 
DoubleF

P.S. In case you're wondering, 3110400 * 8 bits= 1920*1080 * 8 bits
[8-bit Y values] + (1920*1080)/(2*2) * 16 bits [16-bit chromatic pair
values (pairs of 8-bit values) subsampled at 2x2]. Judging by NV12
format description, this looks the way it should be.
