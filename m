Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0AE3E9D41
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 06:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhHLEWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 00:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhHLEWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 00:22:02 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7076DC061765;
        Wed, 11 Aug 2021 21:21:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id c17so282290plz.2;
        Wed, 11 Aug 2021 21:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=rzIfPgU+iHWBSpnuOzwI+tb+zgZVbNg5XJGowiab0uM=;
        b=hE+kDUUwVW0gsA5brzQZUsFwxGyhKekgHRx+YYEq4sQ2FJC7S3M3vYmI8hc7RcHdK9
         xGoBfdHwLJEII6vW6leXG3Y7/L59mnLol4Q2bXJysBvda6ULoV513c91reejQ4Qn0urF
         QxFTm9QW2nZTR+3TQGbzx9ZG4RPEBocGPpE1Z/InOfUn6Axa/GUG/QNX+1vMs3cJn3OB
         Ouwr8aJttioX87ktD0hj25eQAzaRTx8V3hpKBEbX17Q03aAcnC4i8J9BCnCQMe/vyFXc
         6uti4gnxEqc/fIRcv7/dYdYhPgfCCe+wkXgElOj4MshqaT4D6F1AXFgoVjgcwzF1qN1J
         yDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=rzIfPgU+iHWBSpnuOzwI+tb+zgZVbNg5XJGowiab0uM=;
        b=rPAnCnWxE/iFsrFOu9ag0xV1fQLA6LQsgwEuFtL4OEbFBqvG4ACH21uoYO3H/B9sBf
         jSXZrjbP2uPY8mdIHIjH57RlIK8psrOhtNrscJ77XeGPq33fll71bSt7oa6iNCZy3d4X
         4thaR5pwEaHka89Efvn8E3jtZFfaOMHrS6t85tEMTfO0GKbFcIQjJOQXtYCVhzCiyj1J
         FwY8vPmh400GfX54D8enB4RHQiCtb0KYugPF88rmLPvOTobkpjN/6kpKYEya/x69cXki
         bFv5Mgh3NNMCFqi21x0AGabit8inratxeMQZXoCvHcMz/Nq9WOICENDvYoTsX5FwCgyK
         TRaQ==
X-Gm-Message-State: AOAM530fDCfN+heyICtZl73yfBmh7xcVvG7uPI8v+Tie4JwdPoNI2j3v
        chjHsTIWLR9e1bU7HR5aheY=
X-Google-Smtp-Source: ABdhPJxRBqxoMId4E22yz1C+ubk21gLJ7FJsKhaOWBIvDxbrkcCmcET5eghsTtM+F5ffIVyfP23y/g==
X-Received: by 2002:a65:6454:: with SMTP id s20mr2082856pgv.18.1628742098033;
        Wed, 11 Aug 2021 21:21:38 -0700 (PDT)
Received: from [10.157.0.26] ([85.203.23.10])
        by smtp.gmail.com with ESMTPSA id g19sm8440629pjl.25.2021.08.11.21.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 21:21:37 -0700 (PDT)
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        christophe.jaillet@wanadoo.fr, tglx@linutronix.de
Cc:     linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>
From:   Tuo Li <islituo@gmail.com>
Subject: [media] cx25821: Is there a potential buffer-underflow in
 cx25821-core.c?
Message-ID: <22f3bdcb-dc29-b6a7-941e-6218f0a8791d@gmail.com>
Date:   Thu, 12 Aug 2021 12:21:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Our static analysis tool reports a possible buffer-underflow in 
cx25821-core.c in Linux 5.14.0-rc3:

The variable channel_select is checked in:
761:    if (channel_select <= 7 && channel_select >= 0)

This indicates that channel_select can be negative.
If so, a buffer-underflow will occur:
765:    dev->channels[channel_select].pixel_formats = format;

However, we checked this report manually, and found that the only call 
site is in cx25821-video.c:
394:    cx25821_set_pixel_format(dev, SRAM_CH00, pix_format);

And SRAM_CH00 is not negative.

I am not sure whether this negatvie-check is redundant or there is a 
potential buffer-underflow.
Any feedback would be appreciated, thanks!

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>

Best wishes,
Tuo Li
