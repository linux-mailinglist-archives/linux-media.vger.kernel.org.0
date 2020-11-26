Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3179A2C5BFD
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 19:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404920AbgKZSZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 13:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404593AbgKZSZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 13:25:57 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47F2C0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 10:25:56 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id v143so2313349qkb.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eK4OJdsT2qu8QppKGOwQbK6bjLQOsdosNV8hYluDxls=;
        b=S6TW9eZ1ZSraboY2XK4Z1sOyAgkEaEKb25TxV/irJq95pfoU2B5HLQupIpUDa1ec62
         F9ZhE/xQeOgvtXRG9zH/bqdoR2u9jZ7NBFYAYP1DBKr0IjJgHi59OelMXl4mfcUQ+eXd
         f2ptPfA9Fa0n/PTD98uRCG0ckeU4LyQnzpuy6ocq5Ynh+naHZAgeTb+qBrn+W3uPr8UJ
         7gVsSlTh5eS9aUbY9do1PpOPc9/E0jyFz+luOL8vtPJn8OTcUDMzzjHoSrjdnzU2YXup
         SRuiNAt64NiXszlovnFoC3mdsGxqbUQdTxDtg+M9VtCZlJQ3Y8pEBy9RR72q+9mn0YcE
         htIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eK4OJdsT2qu8QppKGOwQbK6bjLQOsdosNV8hYluDxls=;
        b=djm+OtjeSc9jJj8nImLxafG7w3Ff+/FYAiXf6G9NEKbj/w+sxGVJLe9BW26IR/QzPa
         Ynm4k0k9QAE/qrcx+TR2XD2rsTo/TQ4O4+1FZeWVtAXyhkP/tUTgJybbL6lx8BnBLZMZ
         eLUJbfgQASTzZgqIMXthOTAJYrLeBx8qjF55CiY6cd6q/a+zjr4f5GjLgvKBMutKDwD6
         seiXS76EqyboB/rDvZfRa7rvg87z3eYgHuUWrG+wE700g03P9TVEFrrZjEc+Y9qyi+zn
         r8ig3mWcyO5wMKO6TX/X7rcmrTtCborXCxt4qDMRKyq8R312/XV/LrJG/Th5p9hhDQt/
         aQpQ==
X-Gm-Message-State: AOAM5306SZCBBf5y9pO8Oo5oM7ZAaevMJoPuiEPR5Wd/h3mOcGlkm4nU
        4wPxKM1drpaDbSYC36hEniHWyA==
X-Google-Smtp-Source: ABdhPJzPz1p+scLjBHtqvuRpJuprESBTArhnS3JtjLmrfymnSVx5UXxS8lwb2Kom5o1bT7C1HJit9A==
X-Received: by 2002:a37:8681:: with SMTP id i123mr4384374qkd.54.1606415155935;
        Thu, 26 Nov 2020 10:25:55 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id d188sm3530261qkb.10.2020.11.26.10.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 10:25:55 -0800 (PST)
Message-ID: <387f60ecefaa04678df95cb1c3af6a4010c6d9d8.camel@ndufresne.ca>
Subject: Re: imx6 capture via ADV7280
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Date:   Thu, 26 Nov 2020 13:25:54 -0500
In-Reply-To: <CAOMZO5BQbED4-P-R8xsh1_c02E4DUxQdc+P=46rt=L+mYFsrRA@mail.gmail.com>
References: <CAOMZO5BQbED4-P-R8xsh1_c02E4DUxQdc+P=46rt=L+mYFsrRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 25 novembre 2020 à 17:47 -0300, Fabio Estevam a écrit :
> Hi,
> 
> I am running 5.10.0-rc5-next-20201125 (same behavior is seen on
> 5.4.76) on a imx6dl board with an ADV7280:
> 
> # media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]";
> # media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
> # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> # media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
> # media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/720x480]"
> # media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/720x480]"
> # v4l2-ctl -d3 --set-fmt-video=field=interlaced_bt
> 
> Then I start the stream:
> v4l2-ctl --stream-mmap -d /dev/video3
> [   22.792049] ipu1_csi1: EOF timeout
> VIDIOC_DQBUF: failed: Input/output error
> 
> It always fails for the first time.
> 
> Then I try to start the stream once again:
> 
> # v4l2-ctl --stream-mmap -d /dev/video3
> [   28.430420] ipu1_csi1: NFB4EOF
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.75 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.77 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.78 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.77 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.78 fps
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.77 fps
> ....
> 
> Does anyone have an idea as to why it fails when trying to stream for
> the first time?
> 
> Next, I would like to run the following Gstreamer pipeline (GStreamer 1.18.1):
> 
> # gst-launch-1.0 v4l2src device=/dev/video3 ! kmssink

I support kmssink ask for progressive frames, while v4l2src can only produce
interlaced. There is likely something to improve there, but meanwhile, consider
usign deinterlace element.

> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
> '/dev/video3' does not support progressive interlacing
> Additional debug info:
> ../sys/v4l2/gstv4l2object.c(4012): gst_v4l2_object_set_format_full ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Device wants interleaved interlacing
> Execution ended after 0:00:00.014920000
> Setting pipeline to NULL ...
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Internal data stream error.
> Additional debug info:
> ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> Freeing pipeline ...
> 
> Any ideas on how to display the video captured to the display?
> 
> Thanks,
> 
> Fabio Estevam


