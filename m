Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D34E74BD3A
	for <lists+linux-media@lfdr.de>; Sat,  8 Jul 2023 12:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjGHKOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jul 2023 06:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjGHKOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jul 2023 06:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C70B1FD7
        for <linux-media@vger.kernel.org>; Sat,  8 Jul 2023 03:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688811246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XXGmlEuZBzEbzd2A9z1rJ8/RME6Slppu1c4BeP/zfx0=;
        b=cYUpGMUAkSloDTqdbxW/apYYx/xwsld86OrW2nzCbvE8Vira+6ptC0Fic4Z1FGSyDP3dob
        QI4Xshm65UgIiGYjHXf6PlIvG4sRWkaIhaE+1pDt17b5kOyCkhrD0RBcC3lfQu8Fpr/VNm
        RjbGYBx2m1uHJhnhMFnhcaxrKR9gvfE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-BtBztMizPQmAFGuiga3NFA-1; Sat, 08 Jul 2023 06:14:04 -0400
X-MC-Unique: BtBztMizPQmAFGuiga3NFA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993d41cbc31so83884766b.1
        for <linux-media@vger.kernel.org>; Sat, 08 Jul 2023 03:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688811243; x=1691403243;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XXGmlEuZBzEbzd2A9z1rJ8/RME6Slppu1c4BeP/zfx0=;
        b=ILCCdTk7p20CmVcYyF2pbhmiYt43m/H2IhFWvbRBwkNdbdhmPkAz/KsOxnHAYdO8jy
         1Q6CViUbwzuf55SjIa2+dE/ftDtGJvK+e5T78c/47Vu703fkmmeObK+mObKmCPReMYVQ
         VTm8pT9ejLORvNnJBa3pS2XaSN76lETDMPQbWU7InI2bC3AFCz5UvlCD2R+WF9VXUuVP
         lvWPBsGMvy90GZ9IOHwRCfc6B0I9hNoUnyVPn8HByooK+xaR+OOFy3fOuy44BIDKr4vk
         uY1fDfclZ3UMYfLCmCJJckfBqI7E2/yMdapBSz2hqR9Bs13G4+mmizEy+VTQiZJaZJpc
         zf+g==
X-Gm-Message-State: ABy/qLZx2xHwz8KYVUsx/C1VTkXeLwPQAFk71kefnwJZVneexa/w4ztn
        vOS+Y4l7ze3302Gk4wqshHvh/VUbfPi/R/TYUjpJSy7EEhnmAT71wyLkjDUgphxvoLb7yBpfN1+
        ZFFHNb/xB7oF6Z6YySiJj8Io=
X-Received: by 2002:a17:906:198:b0:98d:f11e:4816 with SMTP id 24-20020a170906019800b0098df11e4816mr6162714ejb.29.1688811243687;
        Sat, 08 Jul 2023 03:14:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnPO5MOEVPNi8XrDnbDV6cRBWExTM0iii1cor8uRbhooYXY4SYblFAGJ11OdjQSvw3fBsRNg==
X-Received: by 2002:a17:906:198:b0:98d:f11e:4816 with SMTP id 24-20020a170906019800b0098df11e4816mr6162697ejb.29.1688811243295;
        Sat, 08 Jul 2023 03:14:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k13-20020a170906680d00b00977c7566ccbsm3270681ejr.164.2023.07.08.03.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 03:14:02 -0700 (PDT)
Message-ID: <c863b46b-60d3-980e-820d-29bd274dea16@redhat.com>
Date:   Sat, 8 Jul 2023 12:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, nl
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: lunux-media build fix missing from 6.5-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I just checked and this atomisp build fix:

https://lore.kernel.org/linux-media/20230613165109.111837-1-sakari.ailus@linux.intel.com/

Which is part of this fixes pull-req from Sakari, which also contains
another build fix:

https://lore.kernel.org/linux-media/ZJAdH+Ftqyd79QF4@valkosipuli.retiisi.eu/

Is currently missing from Linus' master tree. Given all the negative
feedback we got last cycle from Linus about missing media build-fixes
it would be good to get these 2 on there way to Linus ASAP.

Regards,

Hans

