Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 562C05EC37C
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 15:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbiI0NCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 09:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbiI0NCi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 09:02:38 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F987AE850
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:02:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 23so205932edw.5
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rmGlqQo0TvU9j4Kx6F4SMfFi/ud1Lv3TSP8jstcMEgs=;
        b=PEHLU7iNoayteNUGtASbgx0XQSjpDiFr5YsY62389ChCW9uadDWXp/d9evlt+CH1mp
         U9l/wIwN6NAYBy2MJo34ptI945Si7vNCZWBejKtjB5KO05e/SBYiDuEgy0FJYIIAWnod
         0/2U3O8+rSSJ2KVO0PY6kvrZm3fTehxaKzpv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rmGlqQo0TvU9j4Kx6F4SMfFi/ud1Lv3TSP8jstcMEgs=;
        b=HIp4Edubi+BD6L0hBI59KB1ITXPOmYGgzGno2bweXsHUJL0y+xhj6fFYhku7tvzKcV
         7gOP6l+UOrVR32/AKvpIJLZAcu7QW9Bj7sFrUi+tkc8YkK7mhA+wBoALBdpicsB8mwM2
         97AyQKL0a9VTVamlEFPSS30Yhx3xu6DVYVU+vnzJ4BY4ic41I91CYX4ig2bYMV0P7d/3
         nNF+FTnfoOQfcbaXDvvJvD7IJBgOa7N0x57KV+k7c88BMNeOpRljyP4iWVtQ2Myotmqq
         dEC579etVJCJB03rmQPjcWinhsBGGG8482Pd9mCvIZh5FA7ry8uDFa2NPAd8JgUQP4mf
         2CDg==
X-Gm-Message-State: ACrzQf1xw9DAOKgbCf5ZQMq9Yw8v3dSWNP9brgGfbCYSstzR7RUhUFFG
        rmVCjif/LYKcOyKVh+2IFExXOI7zfAlRo9hG49E=
X-Google-Smtp-Source: AMsMyM5WeL0O0NXpw19pMbn2eh7reJabnbzcHZQiWuO7OAWdjQbJhoa+urG6HuH5RC4wtIXQ6wia/Q==
X-Received: by 2002:a05:6402:26cf:b0:451:70af:ecc5 with SMTP id x15-20020a05640226cf00b0045170afecc5mr27651660edd.287.1664283755415;
        Tue, 27 Sep 2022 06:02:35 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a8-20020aa7cf08000000b00456ff7d4283sm1269955edy.5.2022.09.27.06.02.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:02:34 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id a41so13101635edf.4
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:02:34 -0700 (PDT)
X-Received: by 2002:aa7:c497:0:b0:457:160c:3c6d with SMTP id
 m23-20020aa7c497000000b00457160c3c6dmr15057901edq.64.1664283754415; Tue, 27
 Sep 2022 06:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
 <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
 <20220926163449.380463ca@deangelis.fenrir.org.uk> <CANiDSCuT4TJLDTXR7760wRBn85OQXKKj0z-jPCAW5MXsGMB5uw@mail.gmail.com>
 <20220927135459.7d614076@deangelis.fenrir.org.uk>
In-Reply-To: <20220927135459.7d614076@deangelis.fenrir.org.uk>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 27 Sep 2022 15:02:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSxtjbs4WogLyRAVALSN+HpCLC15smon3kHMnGqGgN+g@mail.gmail.com>
Message-ID: <CANiDSCvSxtjbs4WogLyRAVALSN+HpCLC15smon3kHMnGqGgN+g@mail.gmail.com>
Subject: Re: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
To:     Brian Morrison <bdm@fenrir.org.uk>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brian


This one is a bit weird:
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/authorized
0

can you try:
echo 1 > /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/authorized
dmesg

Thanks!

-- 
Ricardo Ribalda
