Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488661B6331
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 20:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgDWSU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 14:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729995AbgDWSU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 14:20:56 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5193DC09B042
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 11:20:56 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id t3so7489511qkg.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NtfUG9nvSwbZuMEFLhsesb054eEDoOEiVvzgETJhoAI=;
        b=M3ngQnbNRUoJ4/HzoYCzkT2s7DutMpj1zOp4Xdk5WhtGrKH6/mMrrpAl1EFhEdvd1M
         9hDwa58GzYy8mNRE4MOJxvi2UAmu6uTizhrz6SBxfrt9x0J+U9k4pCuLwLVcwUsy8K7P
         u/xAF2AYAP6FF87oz3ssaQD9R1Llfd1g32BFwnMEF5Y8rKbD1RE7s5s/MjPvzlPCVnmC
         K1A8Jjcf88qSRavGLLZTK+Y5rBlKkqL0PkYhbMmihCjYhYam7QeWC4jVX//YMUry3D6R
         08vLYm4fcagWo4hElo6IIU2ank2Aw9twEF9tiElRn+uU4ba9Yhd/1D+wqMa5u5yEHEIZ
         Thwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NtfUG9nvSwbZuMEFLhsesb054eEDoOEiVvzgETJhoAI=;
        b=kSMoTu68KzDJuLmx1NcaF23Tsbr/xm654I7iPqCiahAoGjPMgy/K1YnzY09K4QEXST
         VVsW5KBejayd223PPlNYMsxprlhG7D+ABzHFUpyAOHsn+e9vzZuP+FQslb4AKj/eu9D+
         3L3fkbUnb6weGAyxJQIqI1AsSJ33q+kJ42USswOcAnz0dxXJ5x84qO5ccLwXxzF1XXOv
         P4MEr0cAV75pntkHkZ9HQanB9u6TFopvLkF1ByeOTdZHCdA18/O+XA29A4CKuhdzoJDt
         Bl9NWAg+97LpziCkz67f1QpEcQQIvE94yoLffk1WmNRxx51Ia9OEiwYYP4C8sUYCvswY
         zx5A==
X-Gm-Message-State: AGi0PuZbYhNUhiTOayHlUa8RxOvVNXJNlpaHMIH4lJB5cHWs9womdlAf
        n0zqpWkS6QIUOMnAvs3oWN+WW/l4g1Q=
X-Google-Smtp-Source: APiQypK/nmdkzOQ0yLnnvhZkUrb/qwpyXvxUx1C04TlPGnxn/3N9DP+0pEf7r1SlQ7uyXnvUvqc4CA==
X-Received: by 2002:a37:a9c7:: with SMTP id s190mr5122827qke.435.1587666055485;
        Thu, 23 Apr 2020 11:20:55 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id t27sm2044875qkg.4.2020.04.23.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:20:54 -0700 (PDT)
Message-ID: <22d832929c6cd57bfc06ffe3a9971a60fb00bb82.camel@ndufresne.ca>
Subject: Re: decode sync frames only
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Thu, 23 Apr 2020 14:20:53 -0400
In-Reply-To: <06340f1f-0ff1-2407-2f9f-144452b34aa8@linaro.org>
References: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
         <e0d850725c11e420dd0952bc07a857495bf37fa4.camel@ndufresne.ca>
         <06340f1f-0ff1-2407-2f9f-144452b34aa8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 22 avril 2020 à 14:43 +0300, Stanimir Varbanov a écrit :
> Hi Nicolas,
> 
> On 4/21/20 1:09 AM, Nicolas Dufresne wrote:
> > Hi Stanimir,
> > 
> > Le lundi 20 avril 2020 à 17:38 +0300, Stanimir Varbanov a écrit :
> > > Hi,
> > > 
> > > I need to port a decoder v4l2 control in mainline Venus driver which
> > > instructs the decoder to decode sync frames only (I frame/ IDR frame).
> > > In practice the usage of such control is to generate thumbnails for
> > > particular video.
> > > 
> > > To do that I researched what we have currently in v4l2-controls.h and
> > > found something similar but for encoders:
> > > 
> > > V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
> > > "Force a key frame for the next queued buffer. Applicable to encoders.
> > > This is a general, codec-agnostic keyframe control."
> > > 
> > > I think I have two options:
> > > 
> > > 1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it
> > > 
> > > 2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE
> > 
> > Seems analogue to GStreamer flag GST_SEEK_FLAG_TRICKMODE_KEY_UNIT, if that helps
> > your inspiration. It's used to speed up fast-forward (ore thumbnails
> > generation). What the decoder will effectively do is to skip the P and the B
> > frames. Some decoder offers fine grain control on that.
> > 
> > That being said, in GStreamer (and probably most framework) frames are skipped
> > in userspace. But decoder tend to wait for the next key frame to output the
> > first one, so we endup having to do more work to force the frame out (like
> > CMD_STOP/START cycle, or crafts an early AUD). Would be nice to document if that
> > mode will help in this regard (or not). 
> > 
> > For protocols like DASH, when doing fast-forward we don't even download the non-
> > key-frames from the server, so the skipping behaviour does not provide any gain
> > any way.
> > 
> > > Any suggestions?
> > > 
> > 
> > Could be as Hans suggested, or something less generic but that covers more
> > trickmodes ?
> > 
> > V4L2_CID_MPEG_VIDEO_DECODER_H264_TRICKMODE
> >   - No skip
> >   - Skip B Frames
> >   - I frame only
> > 
> > Or maybe try and construct something base on what other do ?
> > 
> > FFMPEG software decoder has the following:
> >   (0): Skip nothing     - 0
> >   (1): Skip B-frames    - 1
> >   (2): Skip IDCT/Dequantization - 2
> >   (5): Skip everything  - 5
> > 
> > CODA from Chips&Media is fancier, and propose some variants that have
> > implication how muchs state is maintained, hence allowing or not the transition
> > back to non-skipping outside IRAP boundary.
> >   NORMAL
> >   THUMBNAIL
> >   Skip nonIRAP
> >   Skip nonREF-PIC
> >   Skip Temporal Layer
> > 
> > I didn't find such feature for Samsung MFC, but Amlogic is likely one candidate
> > having this type of skipping feature (as it also has HW demuxers). Hope this
> > helps getting the big picture, hence proposing uAPI that isn't too limited.
> > 
> > regards,
> > Nicolas
> > 
> 
> I like your idea to have more generic one and codec-agnostic. I guess
> something like below menu control:
> 
> V4L2_CID_MPEG_VIDEO_DECODER_DECODE_PICTURE_TYPE
> "Normal"	- decode everything applicable to the codec (default)
> "Thumbnail"	- decode sync frames (pictures?) with low memory usage
> "Sync frames"	- decode sync frames without memory constraints
> "Skip B frames"	- decode sync frames and unidirectional frames
> "Skip Temporal layer(s)" - decode everything but skip temporal layers
> above base layer

That's promising, of course it will be hard to claim that "Skip B-
frame" is codec-agnostic. But it could be acceptable if we come up with
a proper story for enumeration. If I may make the analogy with the
enum-framerate, the answer from that can vary depending on the
configured format. The enumeration of the menu could behave similarly I
think.

Nicolas

