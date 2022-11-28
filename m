Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1CB863B161
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 19:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbiK1SdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 13:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbiK1Sck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 13:32:40 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228FD2E4
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 10:30:00 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 82so3227255pgc.0
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 10:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDjPtktIyw1XYQTehtGtcrk9f/L/zhz+Abu/xqbrSZA=;
        b=ou0z0LLy7tKgg8iIIyE7xwFXNu/il1P9zZa5kSiT0fy65Maja3MZRrM6V329Evu+1m
         ntP2HzjoBHdBTCBI4KQ1JTMebCQOTmBSEC3geuBuYmFQ2NoG09YI+b6I0C2awc5uxzFk
         VA9knMuWzNj3M2ecHASKowqxp0alB4CuvtapPKRWZSQr1FmalroIDeIx3wCO5Tvfpo5A
         Hq5kL9yl00eIOqNAGdHR3Gcxep7WxfOT+GcPJHUoFydOT66rKQzLFFmsTdqqeTXO/Z5l
         XYVdf5Apqo6EPGkyb8Z7AVCFlvVxyAPExssD4Cr+QzFkembj8MBKEeyWaEk0o6rNmr6Y
         oeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDjPtktIyw1XYQTehtGtcrk9f/L/zhz+Abu/xqbrSZA=;
        b=RIlscB9im6uvVgsiUyz+N4wyOnLAbfjyUhn0MSnsBZDcS+WQMVyPaVWJo0K5D5D6Hj
         GdOh8z2shKhenr0g4wBZBPfJnQUVRv+irFODGVeP/JNT5AFEJFWZgH+j6Xyd2kZRkTgr
         MDngB4K5NtzvmJzkRVBwGHYlr/5tSSrCdIPeCp4JVdlUseMVdIlHrh6rOkUjA+In1sgM
         KjzoIFa9FtAF/iDkTo6qLom8HGObmxEV8wWdswFguTvaDWQmULqM/qZwy0VH4rp1uDhi
         8imqHsk7FwpO48KDK4fySOCodNcXIfw6s2bsD+3enscpK2DzhPZiXYYJFU/47tfmnQS7
         qE3Q==
X-Gm-Message-State: ANoB5pmkqWRDEcCHLR+VwiBVIi4lrZ/quaDShNTrYYy25erW33YySnbQ
        NeD0NdCJAOvlqz2YoYSBpaHREfVa3hODZcFMzO0=
X-Google-Smtp-Source: AA0mqf7e3GKhPyeJgBlawgiBGV6zOy/A2ad4Djzh5sA3uLVkchVhpW/zGvG9oejqYXqRV49sNSyK2/OOYs+g5Pi8274=
X-Received: by 2002:a05:6a00:27ab:b0:56c:71a4:efe with SMTP id
 bd43-20020a056a0027ab00b0056c71a40efemr37753006pfb.84.1669660199631; Mon, 28
 Nov 2022 10:29:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:6d1:b0:358:110c:ea58 with HTTP; Mon, 28 Nov 2022
 10:29:59 -0800 (PST)
Reply-To: map8461@gmail.com
From:   peace maurice <etsecharles2@gmail.com>
Date:   Mon, 28 Nov 2022 18:29:59 +0000
Message-ID: <CAD0EGwB8rZKjVaLRggJsgPseebBHVo-_q8-K=NSvnD8oFjsPyQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I also wrote you a previous message two days ago but no response from you,
