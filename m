Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA83B614B1B
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 13:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiKAMuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 08:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKAMuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 08:50:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73561B1F5
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 05:50:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id f7so15910928edc.6
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dZZ2iz4IFvhWHTeybI0mSWPx/cC5/t0vGe99PNr6yY=;
        b=GV29kQhvY/tCH/5441v8h3uYkxOygrH3Ps0gM5UJQM0Qq6cdXXzUNq04x14QoGIe9e
         Kj2pgv8U49EkUosWnw5RRyMySRWoVELrCHKXb6mpeLgD/HXHStXAjycukLaOPUBGgZam
         f80jVy7qaaT6u8PRtpbF+FZrkX/X9IDSXQ/S0DVmeEsMMVtbZYdPdvp0m26z7wMFRW45
         hgRrD3mK8WhfYUM7tGMOjJaAZCpuOBCImG63RAa0fuqT7KfdRLmXWzyov5yWKS51dybN
         ZqyH+SSN7XJOItItUiFUwOrwPx6QLJQ/bLHTPy6q61P0lQizEwRRiD094IAgl6QCO8zq
         1bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dZZ2iz4IFvhWHTeybI0mSWPx/cC5/t0vGe99PNr6yY=;
        b=zLjYUJqr6ACrp/chbGtAI+V4qBdLjxTg/KjL/icCpKvYkytvbVx6zM89HMSn7jbNnw
         nTOvQ5TkEuGctBMizbCaaQqd3GwAKta4WVGMKXIWLifP8NVssk1er5CqzkqikNmKOWP0
         CtSl98lKXBtGZ7qMIWjXwxb4xSIn0xPbYoh+MQSGKQQaHiU7+O9QtdGDHKkvcHpudCgo
         gw7j+Lu/zsGHGt9bL2sBYoQ2nuA49RP5lZp9TCHJYZln57shYjYqkBF+Oc1bCJnH7Yqp
         HXQgiEroMFKPq2BGIEMvoTrkaI4d5EEZjyt5NOy3yCgXuJS98pTWjq0bVOPQpSaD4JQq
         eKWg==
X-Gm-Message-State: ACrzQf3CHT+DmOP7AcwHFQxCLfXB607c+fCeRnLbuX7M6MF+MjwyCg82
        9z4rwuD0PGNHkoAM0kXRrWotwIsIi+o=
X-Google-Smtp-Source: AMsMyM496A9vNNMgwnxkgqfJXCT4TpBwZ7JkqPtYW25X8BrJudLEHSlk0lPeSInGEWhtsoJER02PWQ==
X-Received: by 2002:aa7:d458:0:b0:45b:ddbf:39fa with SMTP id q24-20020aa7d458000000b0045bddbf39famr19194467edr.335.1667307018159;
        Tue, 01 Nov 2022 05:50:18 -0700 (PDT)
Received: from clst-linux ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id rn15-20020a170906d92f00b0078135401b9csm4195244ejb.130.2022.11.01.05.50.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:50:17 -0700 (PDT)
Message-ID: <93834b3d7d4abfabdc7285af0c5e57d015c97107.camel@gmail.com>
Subject: VIDIOC_QUERYCAP on v4l subdevice - v4l-subdev*
From:   claus.stovgaard@gmail.com
To:     linux-media@vger.kernel.org
Date:   Tue, 01 Nov 2022 13:50:16 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Folks.

I am working on a system based around the Intel Apollo Lake with an
IPU4. The system is having a configuration with a number of subdevices.
Going from v4l-subdev0 to v4-subdev10.

Running gst-device-monitor-1.0 results in a number of errors like.

GStreamer-CRITICAL **: 13:27:36.763:
gst_element_message_full_with_details: assertion 'GST_IS_ELEMENT
(element)' failed        

The reason is because a VIDIOC_QUERYCAP on the subdevice fails.

Looking at the documentation

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-querycap.html

it states that "All V4L2 devices support the VIDIOC_QUERYCAP ioctl"

On the other hand VIDIOC_QUERYCAP is not part of the subset mentioned
in documentation for V4L2 sub-device.

https://www.kernel.org/doc/html/latest/driver-api/media/v4l2-subdev.html

So is I correct that gstreamer has a bug in gst-device-monitor-1.0, and
it should not try to use the VIDIOC_QUERYCAP ioctl for a sub-device?

It could be that gstreamer should just skip the sub-device.

Regards
Claus Stovgaard

