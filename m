Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A083C1BF69
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 00:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfEMWSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 18:18:23 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:37137 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfEMWSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 18:18:23 -0400
Received: by mail-lj1-f182.google.com with SMTP id h19so6040156ljj.4
        for <linux-media@vger.kernel.org>; Mon, 13 May 2019 15:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=egMsceEhCwO1oOOUz6JFx9YojlJLHQCMFeGtv6PQrYk=;
        b=AJtdyoVFpMf/pg5FeHis+tsTIEgdqTZh8fzH8gmc1ZackO3JIcHlem2dw/APuGWqVg
         x2Ioxj2s3/t7T3bOXh8d6jpI8Xnejoc2VHNckRktGK/hr7zD3N7Z22a3oUgtRfoo1YGm
         9AIs7f4TGjXF6PFlNkYBcr1Y/aiPpFx2BzHzCFC7hElhYqbg3P8DUlP8UBq2039aXDQl
         WgNWK/U3lnq5BmDgHTne7Akz/bSwBwHfIfmdxDos/LUILiqcmxrm0HtqLvURJvMvigv1
         Ere4ouYVMDbTIktTQYbW/SlMWdvLOZQTrQwC2fwoLXNUSCKji1jfIYN7nQt7+BekXx9E
         l7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=egMsceEhCwO1oOOUz6JFx9YojlJLHQCMFeGtv6PQrYk=;
        b=tpT8QfwAw6hImhiLqR/Z6gYZ7sByK0Ean+V1ZwE75ow88S4epwriWABppF5ptaGV/9
         ugimUYpMSJez+kKWMP3nbizndZyRPKJ8XAhCEfSA32pkzcBM6pgVknBGV/VaEqedRERI
         5bph6Ja+B9uRFv8fkGaTFgBGLBTCAAb4p3L8CU6HHRgr6iu173Um9Apzcc15JBuxZ2dD
         yi6z031+T1hikatrn9fMO5u37D5CVat71xpIUGNzjG+VmLDtuTkCxeRCfJzWbcPTWK48
         On8+1NnQvvpS4Y8PVq01Ag8lYjdGpUxvCII75EzQURV3ILIG4mKfzW9xrJBRXF+WE7/E
         0Q4w==
X-Gm-Message-State: APjAAAVc2mw3gZNJ3jSG5Hcq/AP7QdLa6Eqb9yKSx7d3EVAmori8a/4J
        dXi0nkNw4wItW/BVUrPXMH+ynDHwFlV/EkYnuv8/306iPew=
X-Google-Smtp-Source: APXvYqwl9wmzZzLI7u/dRGyIdTPOeLv1WGnFpJdduTWCbuFx6PWXXO2dAWh8qQlN60LtQzd07DYe1LXI9K2DuGz4ZH4=
X-Received: by 2002:a2e:8041:: with SMTP id p1mr3456787ljg.121.1557785900713;
 Mon, 13 May 2019 15:18:20 -0700 (PDT)
MIME-Version: 1.0
From:   Tomasz Borowczyk <tomboro88@gmail.com>
Date:   Tue, 14 May 2019 00:18:31 +0200
Message-ID: <CAM+RvBRfLUPS7uaQG3Drj_oSX1ACj7cCT_fMM9o9NSwr=6JT3Q@mail.gmail.com>
Subject: cx231xx with 3 grabbers
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello linux-media.

I use cx231xx driver with my August Vgb100 USB video grabber. It works
great. It automatically detects my device and I can watch the video
from analog camera on my Raspberry Pi, and I am very happy about how
it works.

But there is a catch. I want to connect 3 such cameras to my Raspberry
Pi. When there are connected 2 of them, I can watch video from both of
them without problems. When there are connected 3 adapters, I can
watch the video from all three cameras, but the picture from one of
them is flickering and blurring between blue screen and the correct
data. And no matter in what order I connect them to the Raspberry, the
problem exists always on the same adapter.
The same problem exists when I connect the cameras to my laptop
running Raspbian desktop.
This could suggest that the one adapter is a little defective, but it
works okay when there are connected only two adapters, or when it is
the only connected. Also when I disconnect it and connect again to USB
port, I can see correct image. But when I start to play picture from
another camera, and then go back to the "defective" one, it flickers
again. How can I find the reason of the problem?

Best regards,
Tomasz
