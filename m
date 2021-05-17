Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A61E382954
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236133AbhEQKHI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236218AbhEQKE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:04:29 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF5BC06175F
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:02:45 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q5so5722082wrs.4
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+PtkoWwCjp4uFk3NqDGwrf67t+2WrG246qUwoqBQ5S0=;
        b=kXADw2OMRrUxshTAYE+d8v9++KVmOqDomN1zifkM/ja+wMYkhrWJ/XL/FInMEtY9GK
         54nF+8YQYNk9PHiFY1kLvSEpJ8LxjHaLhOODc6NZ6CxCnN5WofAFG2G6kUhZxujY6vt6
         0ZKzqoQutxoMXwK9eaII2ia8eJmOkGGN2ot8jsdq/8JyLa93xG97or/9Zq8Xa+lNVY+j
         qWicUISusnum8G3bnu3wbkEx8DXeLKCu11FgRV39V+NWU+JsbXcFl1cjjg6ID3xFP8z+
         ZWgbimTPFHcFiCt9KsYtOEF6iJNsTsNSk6wImI59adqWskxtPKguwLJwj9QbjRyE/hIo
         iVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+PtkoWwCjp4uFk3NqDGwrf67t+2WrG246qUwoqBQ5S0=;
        b=Dwu7wkE5awePAG0wAQFItgkKoUCoVAFHSEv7k//LAMkN7iGuNJAyPiSJnjmifn8crH
         icyn4vNR/5Z7eG01IwUQHH+Ly3fWg7TXqNSeX6baMPrBd6sdsE8NSFTE19P9mZol+2g3
         E8Ktra30pZ2PijlDzEryjh1NFVgS1XdZherMyKY1nP3DqE18yK+MxeqqkElLzJUPUz4K
         Ci/laP8Ll6BXXen6qtr3Y5PCBmmw304AbQINbBRvfsyfv1a4DEbFvd0hWqew4f+xotCX
         ldmCMZM4Ahl4B+D0s4VXECVuzPPtOJhFGMZSPz552/trHPMXD88kF36p+wyIzTQAY+Nu
         A9bA==
X-Gm-Message-State: AOAM533Oxm27TU81HazLS4jg2QHyvaYSbHkI14brfrJaLO2QVo9qi+gx
        oIm6ZbLM5+llzOVpWLJa6Ao1rliObsZ/kw==
X-Google-Smtp-Source: ABdhPJyU+5OF1BHHcSkOh6t//4p0axcnfz/o/olQXTB04nNEANrVbVEESlWEFJszug5q3Pi5DUiITw==
X-Received: by 2002:adf:f38c:: with SMTP id m12mr72020455wro.282.1621245763767;
        Mon, 17 May 2021 03:02:43 -0700 (PDT)
Received: from cluck.pitowers.org ([93.93.133.154])
        by smtp.gmail.com with ESMTPSA id f12sm10373292wre.88.2021.05.17.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:02:43 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH 0/2] New V4L2 controls V4L2_CID_NOTIFY_GAIN_XXX
Date:   Mon, 17 May 2021 11:02:38 +0100
Message-Id: <20210517100240.3323-1-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

I'd like to propose some new V4L2 controls as defined in the attached
patches. The controls are:

V4L2_CID_NOTIFY_GAIN_RED
V4L2_CID_NOTIFY_GAIN_GREENR
V4L2_CID_NOTIFY_GAIN_BLUE
V4L2_CID_NOTIFY_GAIN_GREENB

The purpose of these controls is to be able to notify a raw sensor
what colour gains will be applied by subsequent processing (such as by
an ISP). Equivalently we can think of them as telling the sensor what
the white point is. Note that the sensor is told these gains but does
not apply them - which the choice of name is trying to convey.

Some sensors need to know these numbers for the processing that they
perform. Here I'm thinking in particular of so-called "quad Bayer"
(also sometimes "tetracell") sensors that have a special read-out mode
that converts the non-standard Bayer pattern into a standard one, also
at full resolution.

Sensors of this type are becoming quite common on cell phones where,
for example, a 48MP sensor may be able to deliver multiple exposures
at 12MP (for HDR processing perhaps) but they may also have a mode as
described above where they can generate a standard Bayer output at
48MP. This processing works better - we might expect less colour
aliasing? - when the sensor knows what values correspond to "white".

One question in my mind is whether it's worth having a control for
each green channel. The sensor I'm currently looking at only wants a
single green gain, but perhaps it's one of those instances where it
would be annoying to put in a single gain and discover, sometime
later, a sensor that wants both. Opinions on the matter always
appreciated!

Thanks very much and best regards

David

David Plowman (2):
  media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
  media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls

 .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 +++
 include/uapi/linux/v4l2-controls.h            |  4 +++
 3 files changed, 36 insertions(+)

-- 
2.17.1

