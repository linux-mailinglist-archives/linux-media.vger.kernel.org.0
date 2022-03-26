Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89204E7EF4
	for <lists+linux-media@lfdr.de>; Sat, 26 Mar 2022 05:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiCZEux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Mar 2022 00:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiCZEuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Mar 2022 00:50:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B830B47AF4
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 21:49:16 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id gp15-20020a17090adf0f00b001c7cd11b0b3so5135850pjb.3
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 21:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=FgKovwQZIQy5duDgUdhIyovUouTtqxzzT9r7I+yes3g=;
        b=OK2wX7XUFJnblfWOjR0BZCAAwqD7SGYoTzRO0sgiKMn0bH3aVgx6TlTJjxUx6lk1ML
         bYp/Re0es0H6HXoGB8SwEFaYRRkcKmSPh6bAAfbFIXrOcZrBHScZaYl4kQcaFFai4B5C
         hYKlZGQuZO35+PTOuIP5NOrOO1gXSn+pHor0I/FaRnHiXVZRAoSDDigP04Xh9cB4mSJb
         Fp8hWuaHFR18pMv9NfYtU3KkYGASFqI5mar3DJGfANHsY2xNkWIFLu5bUxtYub5eJP2H
         eUcW02HYQ6uDiYT+12+iwq/lMqWn9VNcpxUPUkC2RXBQcfFKfYegUtVuY+hOmxFIya0V
         BjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=FgKovwQZIQy5duDgUdhIyovUouTtqxzzT9r7I+yes3g=;
        b=x21Wix+bK7A73GaHDUKNXDnzqppR1RNYvfckmJNMQXsjBJugzLbCSVTQ/umeQ0bsVr
         pY9wk421x5xPQMmAjXn0/czjOflaC6PfneyKMDYQYUsq79fE3AFumxQl7/yo0oQR3KA6
         7ov3v9yug5txCR9SuKvU8HHHEZwuaJHB5cbAXAPx9wR6WHBgdYzHRtVCuovBiLYaL4TE
         +a2ZAtrJhMQgKPUjgVs0RmwIZ0wufnW/TWjq3I54KBHQDyciKuPpSqPyZcBBqBP8iJdY
         WpTwmr07+Yw34enfjutj21AZbOF5kwnFZT3NzW2npz8nr8CWl5ZlMe+SqDZG2SSGa/h+
         2Vcw==
X-Gm-Message-State: AOAM531tMovbY3P4qtZNYK1oIxHqc3JVv6ttDJqiEiJ+vQUQqgzI3NNS
        g9R6UrP/6h37fX981lf4KcCS7AlnfbgT0w==
X-Google-Smtp-Source: ABdhPJyVLCXA6NVyWZ1q6TGfVHfna5DqXGrKqot10KYkLfo9cBjCGYc8sCLYWiYLEK0reNtZjnOKbw==
X-Received: by 2002:a17:90b:3851:b0:1c7:80f9:5306 with SMTP id nl17-20020a17090b385100b001c780f95306mr16552696pjb.207.1648270155206;
        Fri, 25 Mar 2022 21:49:15 -0700 (PDT)
Received: from kwang-MS-7B23 ([121.165.1.209])
        by smtp.gmail.com with ESMTPSA id m14-20020a637d4e000000b00380b83e2e1fsm6574155pgn.70.2022.03.25.21.49.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 21:49:14 -0700 (PDT)
Date:   Sat, 26 Mar 2022 13:49:10 +0900
From:   Kwang Son <dev.kwang.son@gmail.com>
To:     linux-media@vger.kernel.org
Subject: media newbie want to contribue on staging devices
Message-ID: <20220326044910.GA6192@kwang-MS-7B23>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,
I try to contribute on media frameworks. I contributed small typo and
want to jump on staging/media.(I guess it's good to start)
I've seen git log to find some spot but hard to understands which
one is relatively easy (and it looks some devices are just wait to deprecate).
Anyone can recommend which one is more easy to get target devices(I'm
ready to spend money on it) and really needs help?
