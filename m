Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDBA467C51
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 18:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353089AbhLCRSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 12:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235278AbhLCRSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 12:18:16 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C185CC061751
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 09:14:51 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id s9so3354409qvk.12
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 09:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QuxLEAK/WGbGM+dm+Zmim9zkGezkdMzdt7fdJWpKakU=;
        b=6XDCcjvDjeR+e+xwjKEbFQb7qJGIQRfLx9aqeGTnkRU+/lu0/Iu4FpJq5wcqBuh/eI
         cPE/VEy5BoCVYi8A8jUrNnG+nUmOjtO0+oG8CN3ZN2bwFLyBxPJ2cqCzr8h5G0KlAb5e
         jj7wI9cO0SvHZdmZuFClu5c4LnG/wd7X8vzIodtOgwLFrTWVg9cLm60QrMqzyFAKEVh7
         aRiihr/eYOJcgfDSrY75JHlYnm+R0k1v8xYrLE8okdOHy03rhCPZi+GJDoVhsg7v0cV/
         1j++cD56KYJ1xKnA9De9iLydkquKDSdmo0CdQxrG9my16+CAsAPULaZEsonX6rquY6CQ
         Jthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QuxLEAK/WGbGM+dm+Zmim9zkGezkdMzdt7fdJWpKakU=;
        b=VnY1B6mf0rd6oseZS5qq3Jw+8mb/JmL0dbw2NqGNyYPQsFOY0jvibHZ6L/TYYxg6gS
         g8Xkf1wJnPRBMFVE4akhqwFFHLI+0KZM3Wt/rhxx+GR9na14REhXzUVcKcEi5MYkE3vQ
         XsDGnoZPBkVgxJQMaC2rmO/pHBy+INw8J+zflr6er39ml3rA700bjuEt13+ocYGMJDtP
         gdnhVn29mDyGLKeE3Epqgcuc0Lem4oifLhtWINaCmpkeO0iyV0SkVex3iiA8QUzQr0IX
         zkBIpU+z/WsDmxTdXPBuc2CaYC+cUllIlCAhUEO9qB4ThKt+YkgoPodXFLX93RbFCJud
         lB9A==
X-Gm-Message-State: AOAM533HJawuhyWwSBNTYghEoPAzswbC7EkC7gyFJ12K2JxrhjkbyiOf
        sONSaNcpktlmbOB1bAj05vJq6A==
X-Google-Smtp-Source: ABdhPJygNP0XPn8ULZVgZ8O5aSGy+Gb2KxPnNGBZJTtRuYZP6DJiomBwTSX2Oc4ioedFTLKxWG9LIg==
X-Received: by 2002:ad4:5eca:: with SMTP id jm10mr20418462qvb.54.1638551690925;
        Fri, 03 Dec 2021 09:14:50 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id o20sm2626094qkp.114.2021.12.03.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 09:14:50 -0800 (PST)
Message-ID: <64e0aa29a83e0ebfd3eeba381c3a1148bdaa1e3d.camel@ndufresne.ca>
Subject: Re: IMX8MM Hantro VP9 decode failure
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Adam Ford <aford173@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Fri, 03 Dec 2021 12:14:49 -0500
In-Reply-To: <CAJ+vNU0ZqMr3qZMe0EKKOnHWD3CDNkRc8CxDWVJPw-8m20nLsw@mail.gmail.com>
References: <CAJ+vNU0ZqMr3qZMe0EKKOnHWD3CDNkRc8CxDWVJPw-8m20nLsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 03 décembre 2021 à 09:00 -0800, Tim Harvey a écrit :
> Greetings,
> 
> I'm testing the VP9 hantro kernel support on an IMX8MM with the following:
> - imx8mm-venice-gw73xx-0x board with a 800x480 MIPI DSI display
> - v5.16-rc3 kernel with:
>   - [PATCH v7 00/11] VP9 codec V4L2 control interface
>   - IMX8MM DSI support added (some old patchsets)
>   - GStreamer 1.19.3+
> 
>  with vp9 backported, hantro support added, and imx8mm display support added
> - gstreamer 1.19.3 (git sha b5c07e11ca)

Couple more fixed landed yesterday:

05458f05e0 v4l2codecs: vp9: Drop frames on non-keyframe format change


And if you want to recover MPEG2 which regressed after merging VP9, get the next
commit too:

7e875ddb2c (HEAD -> main, origin/main) v4l2codecs: mpeg2: Fix selected sizeimage

> 
> I see the v4l2 stateless decoder:
> [gst-main] root@focal-venice:~/gstreamer/build# gst-inspect-1.0
> v4l2codecs | grep v4l2slvp9dec
>   v4l2slvp9dec: V4L2 Stateless VP9 Video Decoder
> 
> I'm generating a test stream on an x86 with GStreamer 1.19.3 (git sha
> 05458f05e0):
> gst-launch-1.0 -v videotestsrc ! video/x-raw,width=800,height=480 !
> vp9enc ! rtpvp9pay ! udpsink host=172.24.33.15 port=9001
> 
> I'm decoding on imx8mm with:
> gst-launch-1.0 udpsrc port=9001 caps =
> 'application/x-rtp,media=(string)video, clock-rate=(int)90000,
> encoding-name=(string)VP9,payload=(int)96, ssrc=(uint)2246741422,
> timestamp-offset=(uint)3441735424,
> seqnum-offset=(uint)30250,a-framerate=(string)30' ! rtpvp9depay !
> v4l2slvp9dec ! fakesink
> ^^^ this fails with no-negotiated

vp9parse is required. Our new stateless decoder handle frames, while VP9 have
this notion of superframe. vp9parse will seperate the frames from the super
frames.

> 
> Things seem to be very bleeding edge with VP9 so I'm not sure if I
> need very specific gstreamer versions here or not.

This is currently broken due to another feature, but this should work using
playbin(3) / decodebin(3) by 1.20 hopefully. 1.20 is are soon coming next stable
release.

> 
> Best regards,
> 
> Tim

