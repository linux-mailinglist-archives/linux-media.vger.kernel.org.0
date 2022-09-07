Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3B95AFE31
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 09:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiIGHzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 03:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiIGHza (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 03:55:30 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A976B674
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 00:55:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 29so13376042edv.2
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=HHZ4OvC1Au0vqHpQvU+24T5xjdb1rDHR4vFyvCliXNs=;
        b=ChBPJaMVbOycww9jzWyCHd/YeyvRkPf5hkeNjodhDk+2BgWN7Z5LcPcuN0lk52Onv5
         3onaJ6y1StFmVOeXX/Ol/C4ZZ2B3uSYkl3Tt1QTp2ey6B20KJrh09jmRZpEJ8G6r6qxV
         VJwfod4k8P5ggN9CyeUgSmTDkRTSqJRr0yZmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=HHZ4OvC1Au0vqHpQvU+24T5xjdb1rDHR4vFyvCliXNs=;
        b=Xgk+wHDwGfUWVbB3Bwb6LdESAhf4QIxrrNfQf/u+2WlDC2bWDNKja7jSlOMU1zp0xV
         hXpdpS54th70W0ZgCbapmDkHl01QuJZq8l+moFnbpbDRhHaH2T+4yASFkrl5Z3W8m//u
         O/QGVGX24zZc2BCsdYG3fVjrJcEnBivsV8OgZXO+qMye2Ar0ZLAtsV4w3uyX1PDFrSXP
         gmo3UvwtfYLdNoY1dzTE1W8iqUpldZQM0VCmLU1jzE3KrLDdlf/lUoCevHH8/TGYQM2M
         L7uEjaykELj5n30h9oCYy5n+j7xsEuE4QBzdQoiaNuwZfpoH8I4u2ixGHL8kkXY1Lqtb
         M4CA==
X-Gm-Message-State: ACgBeo2tFYbm94eJnRnsAsjKe7WN6bgZloujQoqZWcaW6AajHvO13c0n
        XQ+GclY9onqUxUX+3tm3d3rHFlszqQfgYw==
X-Google-Smtp-Source: AA6agR5ajyfvIslnzt9P/2qqoLc73raopIby0eLGJNp5mPin8TXAKGat9c/Vl39UkruJYUSSurCzyg==
X-Received: by 2002:a05:6402:2793:b0:448:7c20:9b0b with SMTP id b19-20020a056402279300b004487c209b0bmr2138882ede.23.1662537326896;
        Wed, 07 Sep 2022 00:55:26 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906304600b0073d8ad7feeasm7781217ejd.213.2022.09.07.00.55.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 00:55:25 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id z8so18462185edb.6
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 00:55:24 -0700 (PDT)
X-Received: by 2002:aa7:dd0a:0:b0:44e:a27b:fec with SMTP id
 i10-20020aa7dd0a000000b0044ea27b0fecmr2019197edv.168.1662537323540; Wed, 07
 Sep 2022 00:55:23 -0700 (PDT)
MIME-Version: 1.0
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 7 Sep 2022 09:55:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
Message-ID: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
Subject: [Media Summit] ChromeOS Kernel CAM
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On ChromeOS we have opted to have a camera stack based on the upstream kernel.

The camera ecosystem has become extremely heterogeneous thanks to the
proliferation of complex cameras. Meaning that, if ChromeOS wants to
keep with our upstream commitments, we have to look into how to get
more involvement from vendors and standardise our stack.

Kcam is an initiative to support complex cameras in a way that can be
scalable, is acceptable by the vendors and respect the users rights.

Slides at: https://drive.google.com/file/d/1Tew21xeKmFlQ7dQxMcIYqybVuQL7La1a/view

Looking forward to see all of you again on Monday :)

-- 
Ricardo Ribalda
