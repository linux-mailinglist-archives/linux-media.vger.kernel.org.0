Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DFF45ACB3
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 20:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236590AbhKWTmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 14:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235525AbhKWTmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 14:42:18 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63EFC061714
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 11:39:09 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id i9so302020qki.3
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 11:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Om+g4Uz2JjyBuvHdfGl4XTjXS4Di5g1zmNyuqruDMDc=;
        b=fpKETfU+H9nCsr/emEcye4fztYexowbT6ApwFyHjIBI50Q6+FuVwVrL4XuF1PhJGwE
         Xrln16g6s63oPEXKPak7a9q6zbN4t80xBz/oOn6Yl9FmsZUjsHkzILhvp1g+KBfm65q4
         nJLz2KOy1DpQARp+xz/D1/NxOm/XtDqKpqukSSbtwgT/QNMw7pf6tqCT2Yeo/HTVr3u8
         5gwGkC4iNnGqU9qw3Jz9NDq+OSKwYXJQr8EvJ7sggfUF+83LK/gG57hQMKG3pkOZT9qv
         +FRlPt7Q4CSIsQOALUvDH2ZQYsSE6Er3V7swlS2mqYBXGWliur5j07f0w9PpPQtcPPyV
         ZIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Om+g4Uz2JjyBuvHdfGl4XTjXS4Di5g1zmNyuqruDMDc=;
        b=hoZOkUb0XnO56LDg+0X8UQRwc1bF7iPJzAOeCr6ctqBqyqua65WHx3vJ5X3TWF4vO9
         XWGs/FjohjczhdqD3mZvyrm3QqZ3h8X+z7nmrbM0lu+zlpkMxr4psE62nK464B2X57SS
         tkvY1k96BKGf00NMDWPrUV/lve5pUguZECg8FUULJSp3B0rYvZVhjRv3IcubWEzru1HF
         m4Y3NBguoObLIuR9YzDWfD5wT0l8adokkG089DwSKHBzpei3IV7UULn9e8dTLEij54RM
         XL4CzrcLHu1auDFG0y8gVMuTdIwW39H7Cky5CNfxTzwCgf290u0uLH65d5VnJvAe+xKl
         /MgQ==
X-Gm-Message-State: AOAM5335IflFeML0N+hNe0krJtjirhIrAxoKXErbRwj7JTp1vyIjDWYv
        DAQcg1tVYCUSN5ne3kKwjXZ3QA==
X-Google-Smtp-Source: ABdhPJx1LXmah08Wco9CfLO9RABE+JD1pVOug1JHcDqvoXVWgrZxQ1pJzQ9DMaQNTN5GEAZhiIiitw==
X-Received: by 2002:a37:a081:: with SMTP id j123mr7167214qke.503.1637696348305;
        Tue, 23 Nov 2021 11:39:08 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y20sm6772061qkj.24.2021.11.23.11.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 11:39:07 -0800 (PST)
Message-ID: <85e9830ff0c2ed5eb77ce52ec7fde82a08368a2a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: hantro: Hook up RK3399 JPEG encoder output
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Tue, 23 Nov 2021 14:39:06 -0500
In-Reply-To: <CAGXv+5Gf-gsB7JXnLiZF_R=0RdxXS7CDZaFftyZ+aESXLXy1Ew@mail.gmail.com>
References: <20211119074654.470729-1-wenst@chromium.org>
         <5d23258a954eb0076cacf89d6c88b5e6ef13695f.camel@ndufresne.ca>
         <CAGXv+5Gf-gsB7JXnLiZF_R=0RdxXS7CDZaFftyZ+aESXLXy1Ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 22 novembre 2021 à 11:57 +0800, Chen-Yu Tsai a écrit :
> On Sat, Nov 20, 2021 at 12:00 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > 
> > Le vendredi 19 novembre 2021 à 15:46 +0800, Chen-Yu Tsai a écrit :
> > > The JPEG encoder found in the Hantro H1 encoder block only produces a
> > > raw entropy-encoded scan. The driver is responsible for building a JPEG
> > > compliant bitstream and placing the entropy-encoded scan in it. Right
> > > now the driver uses a bounce buffer for the hardware to output the raw
> > > scan to.
> > > 
> > > In commit e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG
> > > codec_ops.done"), the code that copies the raw scan from the bounce
> > > buffer to the capture buffer was moved, but was only hooked up for the
> > > Hantro H1 (then RK3288) variant. The RK3399 variant was broken,
> > > producing a JPEG bitstream without the scan, and the capture buffer's
> > > .bytesused field unset.
> > > 
> > > Fix this by duplicating the code that is executed when the JPEG encoder
> > > finishes encoding a frame. As the encoded length is read back from
> > > hardware, and the variants having different register layouts, the
> > > code is duplicated rather than shared.
> > > 
> > > Fixes: e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > This was developed on the downstream ChromeOS 5.10 kernel (with a hack
> > > for .data_offset) and tested with ChromeOS's jpeg_encode_accelerator_unittest
> > > patched to accept non-JFIF JPEG streams (https://crrev.com/c/3291480).
> > > 
> > > This was then forward-ported to mainline (name and filename changes) and
> > > compile tested only.
> > 
> > Tested with GStreamer on top of 5.16-rc1 from media_stage.git. Not perfect but
> > at least the the output it valid. Test command was:
> > 
> >   gst-launch-1.0 videotestsrc num-buffers=2 ! v4l2jpegenc ! filesink
> > location=test.jpg
> > 
> > Notice that I encode two frames, it seems like the draining flow is broken in
> > this driver. GStreamer will queue the frame and issue CMD_START immediately, the
> > driver will skip the encode, leaving me with an empty file.
> 
> The hantro driver doesn't implement ENC_CMD, which IIRC is used for the
> draining flow. I guess that's something to fix, since the mem2mem stateful
> encoder spec seems to require it. Or does that spec not apply to the JPEG
> encoders?

I'm pretty sure its required. But this isn't a regression from this patch.

> 
> > Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Thanks!
> 
> ChenYu

