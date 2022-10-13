Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DD35FD46D
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 08:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiJMGAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 02:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiJMGAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 02:00:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6555815B
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 23:00:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d6so901317lfs.10
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 23:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jTYy/EUWNST+bkH3h636aJ5tSHf0joeH7wrzSHq+e6o=;
        b=c+wwIbcAHDr6scIcJwR2NolkZFj6GYOdIZbF13KPP0CvYThhdWmk5hcpkA4VMo1201
         U/mg1LAwnhW3F9kh+Fe6vgyT6at85z95s4663CX1zGGMHh7fWSrICZUV4iMzySQPBQ5z
         OKSbsx00PSTeeu5OCxVPhtAHYf2hIidY/KOH3IIStmzJ+cAPXAh2R8hMZ+YNgl+n/0Kn
         myRpwIJWJwrqFNXXiFFvBhzIMfKGJj6qk3kW88u+nKbHNufwyEhXtQgWfhdyoOGJb5pz
         WBpycrEKe2tFLuCySV2UKD4TGrp4Q50cl3O1ElN4kSeyhkhnRmsZotFF/+BduTmgivRe
         IndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTYy/EUWNST+bkH3h636aJ5tSHf0joeH7wrzSHq+e6o=;
        b=BxAIuPn1K6T1DZ1LmmYmkKE01GKknO+BbJIsRMDCVoZnFQLn8ilGdAZcZC/aBA/DHz
         CHinn9SiZzg35D4ORGW8dMWMcrWT0KtSjZr/gdZNNDC4shlJ3Ug8juCMFNokCTro22Zc
         /4znL41rfU8llzOg+eRG7XQOjrOkCk0Ry/PoV7PApeLr9wk7DV+xHwkzjUMPiFPyEh06
         HE0HXEuA0jpKFjRsYdx6kQ3eJiFIakuy6B8K2DiN7pnsMjEfJhRxKIOYXhC8BkqqOYNc
         HOIncMAJARWUXwH06xKOum9ydt4ZUcUyOfkcJqBQm5Zx37yoFN/rgwJ3cFDFFncyVfUv
         xyBQ==
X-Gm-Message-State: ACrzQf3fmkICBLKxIKAmCX/wO2yKD0ehqYNQXiYoS7dayjtRtVEkhMdk
        3JIQHfuqk9q1L/G0nh8ioPOOo5PIAlqR3UYqHdWazY9VKzc=
X-Google-Smtp-Source: AMsMyM6uFo2kqsYpzRh4MRSfxNDmq8ke5gAlJXlCXdZLJM3lNY06wrTZYqJqXhcYgQmnoev7EWHARFgkRAYNLowpsUE=
X-Received: by 2002:a05:6512:ac8:b0:4a2:61e7:7963 with SMTP id
 n8-20020a0565120ac800b004a261e77963mr11145252lfu.363.1665640801703; Wed, 12
 Oct 2022 23:00:01 -0700 (PDT)
MIME-Version: 1.0
From:   Karthik Poduval <karthik.poduval@gmail.com>
Date:   Wed, 12 Oct 2022 22:59:50 -0700
Message-ID: <CAFP0Ok9iHi+1nyzxMfMA58QC5=H4H48ALBY+1e8eeTMsfbUY3A@mail.gmail.com>
Subject: V4L2 M2M driver architecture question for a new hardware
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I have hardware that does some sort of image manipulation. The
hardware takes 2 inputs.
- image buffer
- config param buffer
and generates one output which is also an image buffer.
The input and output images formats fall under standard image
definitions of V4L2 like various YUV/RGB formats (interleaved or
multiplanar).

The config param buffer is kind of like a set of instructions for the
hardware that needs to be passed with every input and output image
which tells the hardware how to process the image.
The hardware will be given different input images and output images
every time and possibly different config param buffers too (in some
cases). The config param buffers may have variable sizes too based on
the nature of processing for that frame, but input and output images
are fixed in size for a given context. I should also mention that the
config param buffers are a few KBs in size so zero copy is a
requirement. The config params buffers are written by userspace
(possibly also driver in kernel space) and read by hardware.

Here were two mechanisms I had in mind while trying to design a V4L2
M2M driver for this hardware.
- Use a custom multiplanar input format where one plane is a config
param buffer with remaining planes for input images (in case the input
image is also multiplanar).
- Use dmabuf heaps to allocate config param buffer. Tie this config
param buffer fd to an input buffer (using request API). Driver would
have to attach the config param buffer dmabuf fd, use it and detach.

Any comments/concerns about the above two mechanisms ?
Any other better ideas ?
Are there any existing V4L2 M2M mechanisms present to deal with per
frame param buffers that are also zero copy ?
Is the media request API able to do zero copy for setting compound
controls for large (several KBs) compound controls ? (making the above
dmabuf heap approach unnecessary)

--
Regards,
Karthik Poduval
