Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB30F7CF6A5
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 13:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345365AbjJSLYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 07:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345374AbjJSLYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 07:24:41 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9B0BE
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 04:24:39 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso73482331fa.1
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697714678; x=1698319478; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oJgjVeh1UgrZT+7dOQwHON9AJ2LItbALoKEu7Dhzz5U=;
        b=B8S5y0lVuahJBGmWeTWV49rAUgH0XQ1QGQ6fQP+OxouQIW1Baz9KRSAUpSLtCYpJgR
         TBwVobF9V2cZ1C7/uaTZObbNoI42RYdPW+6rqt24lHHcsCGfXZtF5W52q2WctaEj+xJ1
         4B1mjHx3N4iwXHFjXWeyCgSQ2raYECyHid6D6zt2sJqR/ERtqUfAj+6Qb1h0iIfzSLQ5
         U0WHiiHwGbKLQnAK7/Sw7mKhdLHBFfBzmHgfb9ewkIOZbkboq5mXx1bX8lzGyTJ0BsHa
         6zDtQN/C3WsJr3VX5lCQU1Y9vLL7rAclN9yR9i5j1jqAq+M1NrWfAqvHz1GhGsb2b2FH
         SvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697714678; x=1698319478;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJgjVeh1UgrZT+7dOQwHON9AJ2LItbALoKEu7Dhzz5U=;
        b=B7c6d03/oajnseBpu3oolQOaJUcCYzClJ2OHLPbMRqy/OAJdj7x67rKfNixVis3ATa
         3yVpr21luozk3D4ai/oTZWjN0euiapN71hxf9hvhhQhHR8t0YCJOrCbZkSrqzbJdPGYT
         FiRKZRd37TINxTKMEFnj3jeIg9ZMoF52HX5PENMGTbaHPC2WE5DNC2ukk2tou3v1KWfc
         6P1fOJzBlR6AoZcMy34WNx0blCLFxVK6IUhswOUythzejpkN5qnKWnDXWFym/XzFQNEW
         n7s/B62WoOY4wxQcXM5t7ZxUhiAyH+c1WUhSFzURhOcqujV/HN0a+OCS1CP08eljcYED
         5k9A==
X-Gm-Message-State: AOJu0YzZA5GKZJbonYwTAKQk8YXg/W+gkgkJ+RcQuAa1kpqTqE1hmyKA
        3Cy2dZnytg/Z0M23tRW8dD0Kry6778Dtc62H9Fk6GYs2ALTf09p9QYA=
X-Google-Smtp-Source: AGHT+IHaC1QJTO+p8eccKKnteIcNzCgMjjFNeRGc6OnxoY21ufa0tKgP08XKcPn52AEricvdVs04lJ6F+wQEXl+kozk=
X-Received: by 2002:a2e:a986:0:b0:2c5:14d3:f295 with SMTP id
 x6-20020a2ea986000000b002c514d3f295mr1288081ljq.35.1697714677861; Thu, 19 Oct
 2023 04:24:37 -0700 (PDT)
MIME-Version: 1.0
From:   Cole Mickens <cole.mickens@gmail.com>
Date:   Thu, 19 Oct 2023 13:24:01 +0200
Message-ID: <CAJ9Gbf35rYPHNtq-Sbez-vKkpQx86E7mRUPzw8vB_jn5afJnEg@mail.gmail.com>
Subject: Lumina Camera - Raw (0c45:0415) - Failed to query
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

Hi, I found a message saying linux-uvc was deprecated, so hopefully
this is the correct place to send this.

I have noticed that my webcam only works under very limited
circumstances, and when it does work, it generally will immediately
give this same error if I simply unplug it and plug it back in.
Sometimes though, it doesn't even work on the first try after a
reboot.

I've tried several cables, multiple USB ports, with/without hubs; all
tests show this same behavior.

Please let me know if there's something I should be doing to fix this,
workaround it, or if I can otherwise provide further debug
information:

This is the log from dmesg:
[49528.390060] usb 9-1: new high-speed USB device number 2 using xhci_hcd
[49528.531615] usb 9-1: New USB device found, idVendor=0c45,
idProduct=0415, bcdDevice= 1.00
[49528.531619] usb 9-1: New USB device strings: Mfr=2, Product=1, SerialNumber=3
[49528.531620] usb 9-1: Product: Lumina Camera - Raw
[49528.531621] usb 9-1: Manufacturer: Lumina Industries, Inc.
[49528.531622] usb 9-1: SerialNumber: SN0001
[49528.540499] usb 9-1: Found UVC 1.00 device Lumina Camera - Raw (0c45:0415)
[49528.552533] usb 9-1: Failed to query (GET_INFO) UVC control 7 on
unit 1: 0 (exp. 1).
[49528.553237] usb 9-1: Failed to query (GET_INFO) UVC control 10 on
unit 1: 0 (exp. 1).
[49528.554736] usb 9-1: Failed to query (GET_INFO) UVC control 12 on
unit 1: 0 (exp. 1).
[49528.556393] usb 9-1: Failed to query (GET_INFO) UVC control 14 on
unit 1: 0 (exp. 1).
[49528.557762] usb 9-1: Failed to query (GET_INFO) UVC control 16 on
unit 1: 0 (exp. 1).
[49528.574681] usb 9-1: 3:1: cannot get freq at ep 0x84
[49528.618182] usb 9-1: 3:1: cannot get freq at ep 0x84
[49528.636432] usb 9-1: 3:1: cannot get freq at ep 0x84
[49528.664238] usb 9-1: Failed to query (GET_DEF) UVC control 12 on
unit 1: 0 (exp. 3).
[49528.664989] usb 9-1: Failed to query (GET_DEF) UVC control 12 on
unit 1: 0 (exp. 3).
[49528.677767] usb 9-1: Failed to query (GET_DEF) UVC control 12 on
unit 1: 0 (exp. 3).
[49528.684489] usb 9-1: Failed to query (GET_DEF) UVC control 12 on
unit 1: 0 (exp. 3).
[49532.220413] usb 9-1: USB disconnect, device number 2
