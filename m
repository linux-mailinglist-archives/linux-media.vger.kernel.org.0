Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D64405D9F
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 21:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245712AbhIITmE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 15:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344386AbhIITmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 15:42:02 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046D3C061757
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 12:40:40 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id a15so3834178iot.2
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=omHK5HDlzER183cyZkTKOzYYGUkHjw3w9hbfK4BYqz0=;
        b=m1cL1vnBIh5hnME0fLf/03QSDVpxtl/TeC8w1p53SYW3s3nbsQPmBzZNswhGPCD2cL
         uLw1epWGDYSTZ5MpekGlW6RbfG4AwAVq18FYKH6S3cgvisBWC9LtJfPjY/20E+SrmE6O
         JkQC+qtWTyOXOmnFd+Zg/hoJ6zJN+jDJYBaa9zvwgkx4fDYJTeFUbbMX0/WQBPgOPKoe
         /aogc93dSPCcoi8508bkUXFv+MP86oB72+wZoMiZSx7lhumVGBO6WnDgzNGy+TC6TTaJ
         b0IrQ3QY7P1K1l7nrievNvoAPSgnNtEf+rI4ft3P3fV+TmisPIHPcO3uANjijPWY927g
         T9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=omHK5HDlzER183cyZkTKOzYYGUkHjw3w9hbfK4BYqz0=;
        b=OC0iz7qtu1XCyRzQoeyJBbZOBz4a8qxzbhKJoIUPBE2BfRkZ5jTVbXLQJMUq8Tn7l0
         z61aq1EQ4suB2Rw2wZNQlaLqsBJKFmEZdTHwDXOEaTPLnx8M2Wqe55ZWO5vtVngsAce8
         5Ya5Jvu1bWN+RgIF4QsluvJBVZQWJSmfXiutzR/DtMDVP+Ix40ciP0Hrqed95EDiFzCd
         dnZ0RKc2Y4l6irisPqj1C+m5rgF847oPI3/Q+oqggZ4RTDuf9wJJm8hWkU590e344EGg
         XZE+OPPPFJ63CBzRdXebk1pmoN2EbZM39tXxunRZXhV793SokxGdEquWa4frKfsG3fA7
         TB5g==
X-Gm-Message-State: AOAM533QNYdlt4Hbl1xzEmwuK6zh9az6ejCMEIkZy1Oj5H/2rx6HX2wP
        Lm+j553YIB+X2Y4jSmcCaKt5kA==
X-Google-Smtp-Source: ABdhPJz3q1yp02+FGGk5xwLhMqLsGzDcW4RGE53wuluHkd/aRR5dQvYKpwpZHY70k2BEVHmCJPkPmg==
X-Received: by 2002:a02:85c2:: with SMTP id d60mr1313582jai.85.1631216439428;
        Thu, 09 Sep 2021 12:40:39 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id m26sm1333222ioj.54.2021.09.09.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 12:40:38 -0700 (PDT)
Message-ID: <868c17e24e0789838871167b008baf81b9876ef7.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH v8 03/15] media:Add v4l2 buf flag codec data.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 09 Sep 2021 15:40:36 -0400
In-Reply-To: <AM6PR04MB6341540B142F744B2E6F3379E7D59@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
         <7ef1840137417c33f5ef7ca611c90fc274926851.1631002447.git.ming.qian@nxp.com>
         <79cdfe0af999f574642314289e1734df5e2032eb.camel@ndufresne.ca>
         <AM6PR04MB6341540B142F744B2E6F3379E7D59@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 09 septembre 2021 à 02:20 +0000, Ming Qian a écrit :
> > -----Original Message-----
> > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > Sent: Wednesday, September 8, 2021 9:15 PM
> > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
> > shawnguo@kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de
> > Cc: hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> > dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> > linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: [EXT] Re: [PATCH v8 03/15] media:Add v4l2 buf flag codec data.
> > 
> > Caution: EXT Email
> > 
> > Hi Ming,
> > 
> > thanks for the patch. I'm doing a first pass review of the new APIs you are
> > introducing.
> > 
> > Le mardi 07 septembre 2021 à 17:49 +0800, Ming Qian a écrit :
> > > In some decoing scenarios, application may queue a buffer that only
> > > contains codec config data, and the driver needs to know whether is it
> > > a frame or not.
> > > So we add a buf flag to tell this case.
> > > 
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > > ---
> > >  Documentation/userspace-api/media/v4l/buffer.rst | 7 +++++++
> > >  include/uapi/linux/videodev2.h                   | 1 +
> > >  2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst
> > > b/Documentation/userspace-api/media/v4l/buffer.rst
> > > index e991ba73d873..11013bcf8a41 100644
> > > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > > @@ -607,6 +607,13 @@ Buffer Flags
> > >       the format. Any subsequent call to the
> > >       :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will not block anymore,
> > >       but return an ``EPIPE`` error code.
> > > +    * .. _`V4L2-BUF-FLAG-CODECCONFIG`:
> > > +
> > > +      - ``V4L2_BUF_FLAG_CODECCONFIG``
> > > +      - 0x00200000
> > > +      - The buffer only contains codec config data, eg. sps and pps.
> > > +    Applications can set this bit when ``type`` refers to an output
> > > +    stream, this flag is usually used by v4l2 decoder.
> > 
> > Currently, the bottom line is that all decoders needs a frame or field
> > accompanied with the headers (only Annex B. being defined and supported for
> > now). Decoders can be more flexible (and some are). The documentation here
> > is not clear enough, remember that we must not break compatibility.
> > 
> > I think you have to clarify the intention. This flag exist in OMX and have
> > been
> > source of confusion and inter-operability since the start.
> > 
> > - If this flag is entirely optional, and is just an optimization, then
> > adding it this
> > way is fine, but the documentation should be updated.
> > 
> > - If this flag is required only when the header is split, then this flag
> > need to be
> > accompanied with a V4L2_BUF_CAP_SUPPORTS_SPLIT_CODECCONFIG (or
> > similar name, shorter could be nice). This is so that userspace can detect
> > if that
> > feature is supported or not.
> > 
> > - If having split codecconfig is strictly needed for your driver, then this
> > flag is
> > not the proper solution. The only solution I'd see for that, would be to use
> > something else then V4L2_PIX_FMT_H264 so that existing userspace are not
> > tricked into trying to use your driver the wrong way. I think such header
> > could
> > make sense with H264_NO_SC (though not super clear what this is exactly,
> > it's
> > not really used), or a clearer new format H264_AVCC/AVCC3
> 
> Hi Nicolas,
> 
>     This flag is optional, and in fact, our driver doesn't want to receive a
> splited header,
> It's best that every buffer contains a frame.
>     But in some case, the client may enqueue some buffer that only contains
> the header data without any frame data.
> And our driver need to know this case, for this type of buffer, we have two
> cases to handle.
>     1. ignore the timestamp.
> 	2. the amphion decoder needs a ring buffer for decoding, driver will
> copy the coded data to the ring buffer, and update the write pointer, then
> pass a frame count to firmware, firmware will use the frame count to determine
> whether starting decoding a frame or not, if the frame count is incorrect, it
> may led to vpu hang. So for this type of buffer, we won't increase the frame
> count.
> 
>     The flag is required only when the header is split, I agree with you that
> it's better to add a capability flag. Actually our driver doesn't want meet
> this case, but this situation does exist in some applications, I add this flag
> to help handle it.
>     Currently we meet this case in android platform.

Thanks, that clarify were this comes from. Perhaps you could drop this from your
initial patchset, and we can handle this separatly ?

I remain a bit worried about the possible VPU hang, as the door is still wide
open to DoS on this HW from random streams. Have you considered raising this
issue to Amphion ? Perhaps there is a different way you could deal with partial
frames ?

> 
> > 
> > >      * .. _`V4L2-BUF-FLAG-REQUEST-FD`:
> > > 
> > >        - ``V4L2_BUF_FLAG_REQUEST_FD``
> > > diff --git a/include/uapi/linux/videodev2.h
> > > b/include/uapi/linux/videodev2.h index 167c0e40ec06..5bb0682b4a23
> > > 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -1119,6 +1119,7 @@ static inline __u64 v4l2_timeval_to_ns(const
> > struct timeval *tv)
> > >  #define V4L2_BUF_FLAG_TSTAMP_SRC_SOE         0x00010000
> > >  /* mem2mem encoder/decoder */
> > >  #define V4L2_BUF_FLAG_LAST                   0x00100000
> > > +#define V4L2_BUF_FLAG_CODECCONFIG            0x00200000
> > >  /* request_fd is valid */
> > >  #define V4L2_BUF_FLAG_REQUEST_FD             0x00800000
> > > 
> > 
> 


