Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CD01B1907
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 00:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgDTWJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 18:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgDTWJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 18:09:50 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FA9C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 15:09:50 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id v7so12601927qkc.0
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4/HcgRij8s7JN5l/BrRWL40qGeUaaVECYKk/T6pRglU=;
        b=ljhtmDdYm1EXXAZnt06wi7qnI9l/YS5O2iLLV1uEDO2C4FzRUSRqvb2i8q8Mjhp6CG
         2VPwfTm8eBJyRVjoZBhcaLMI2NcOALHFwOWoNAIDTOcNbarkq9Sat3K18CF+KuRUpCoX
         JK9MdlYdswg6bXcii6j2R4tT8orWKByk4CDZRD53TsEM8v2b6RkHoQN0jhcRYkyaQKUf
         Wuhklldg7jC+TbQYEkeH3Ti0zl9Ecz5m9249XhWoBMmPMjmfmaHIfkmDeQJhQ4DVMvH4
         BNkRVg15kgQL4cWa0jlmCHoLlTZAEJacn8+xVt9S8YgzGqSqih0T0V4kc6fDw3hUCDtv
         JaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4/HcgRij8s7JN5l/BrRWL40qGeUaaVECYKk/T6pRglU=;
        b=Rryk2KZObWOr/cbCf10S943HJpFj6xtqm8U0N7F5BAFawBXRxdPFGXBmgX7An7Wnne
         XygUIQztqN4C51y2aFcRV7AgvWHxLhogbd655yveCLi9DNC6Y31w+LisWTdA10aDDf7K
         uXJzbUs4s/i7YsgLh5KH6xIEk/6SstaSk8xzWtUtlaFPt0xJFOGYeu1BV6RyE+OIz3Z7
         1xQlTbIUXRelZ92KX6X9dpIBbVulMulEDI1I+SPUW0aRge151f5Jlv1jjr5RBx6V4Zd6
         WVDbgHdkoFKJZ0E6Gw/bA7neqVAWzb8k/LBh4os1QWumE94/6QGSX2O/QfsQUBE8D/aR
         DfNQ==
X-Gm-Message-State: AGi0Pub1HIH7IcFeRz7kXsWB+I0Li7/WgfT7SC5UpZnA0h/ejCUtwyfl
        bquECL3zEtgVhByorVEhquZfPQ==
X-Google-Smtp-Source: APiQypKgobju5951n5FRebhZxVM4eUMaFP4FBcfaOf0953tRVacui5srmolrGsQRKPpGnPsWYBcOZA==
X-Received: by 2002:a37:9e92:: with SMTP id h140mr18251402qke.24.1587420589694;
        Mon, 20 Apr 2020 15:09:49 -0700 (PDT)
Received: from nicolas-tpx395 ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id u11sm479187qtj.10.2020.04.20.15.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 15:09:48 -0700 (PDT)
Message-ID: <e0d850725c11e420dd0952bc07a857495bf37fa4.camel@ndufresne.ca>
Subject: Re: decode sync frames only
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Mon, 20 Apr 2020 18:09:46 -0400
In-Reply-To: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
References: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

Le lundi 20 avril 2020 à 17:38 +0300, Stanimir Varbanov a écrit :
> Hi,
> 
> I need to port a decoder v4l2 control in mainline Venus driver which
> instructs the decoder to decode sync frames only (I frame/ IDR frame).
> In practice the usage of such control is to generate thumbnails for
> particular video.
> 
> To do that I researched what we have currently in v4l2-controls.h and
> found something similar but for encoders:
> 
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
> "Force a key frame for the next queued buffer. Applicable to encoders.
> This is a general, codec-agnostic keyframe control."
> 
> I think I have two options:
> 
> 1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it
> 
> 2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE

Seems analogue to GStreamer flag GST_SEEK_FLAG_TRICKMODE_KEY_UNIT, if that helps
your inspiration. It's used to speed up fast-forward (ore thumbnails
generation). What the decoder will effectively do is to skip the P and the B
frames. Some decoder offers fine grain control on that.

That being said, in GStreamer (and probably most framework) frames are skipped
in userspace. But decoder tend to wait for the next key frame to output the
first one, so we endup having to do more work to force the frame out (like
CMD_STOP/START cycle, or crafts an early AUD). Would be nice to document if that
mode will help in this regard (or not). 

For protocols like DASH, when doing fast-forward we don't even download the non-
key-frames from the server, so the skipping behaviour does not provide any gain
any way.

> 
> Any suggestions?
> 

Could be as Hans suggested, or something less generic but that covers more
trickmodes ?

V4L2_CID_MPEG_VIDEO_DECODER_H264_TRICKMODE
  - No skip
  - Skip B Frames
  - I frame only

Or maybe try and construct something base on what other do ?

FFMPEG software decoder has the following:
  (0): Skip nothing     - 0
  (1): Skip B-frames    - 1
  (2): Skip IDCT/Dequantization - 2
  (5): Skip everything  - 5

CODA from Chips&Media is fancier, and propose some variants that have
implication how muchs state is maintained, hence allowing or not the transition
back to non-skipping outside IRAP boundary.
  NORMAL
  THUMBNAIL
  Skip nonIRAP
  Skip nonREF-PIC
  Skip Temporal Layer

I didn't find such feature for Samsung MFC, but Amlogic is likely one candidate
having this type of skipping feature (as it also has HW demuxers). Hope this
helps getting the big picture, hence proposing uAPI that isn't too limited.

regards,
Nicolas

