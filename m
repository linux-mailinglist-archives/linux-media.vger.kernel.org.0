Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8784620EE9
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 12:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiKHLYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 06:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbiKHLYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 06:24:15 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A9632077
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 03:24:14 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id 7so7295009ilg.11
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 03:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5B7dfi7xVJ3OslQ0ALi00lhJojz9IHhiYsVHA/RHqOE=;
        b=LXzLwEfFEIjs9nRQ/0D9sK0UdFF/hcYD1/7lPcxtKxGf+ipiOyxIUkG9FxWjTQwnxI
         D0k1pcJ4r9HbGweGR8VttiL8E2qc4lcsz3jC3X1z+Myzw30J2a8GCz5AS/bkRvOOAlHD
         E+tAU65cwh01zP65Dht/AwghXmg8POvqM5wMW+NclASoJJ1M+p89BgFOSDch5BgQ0Avc
         9JiZIkvYkz5qbwJiVyZnhn8aEs4dsNPEV6aJ60VBa1B1c4nkJvkSo/q1xUjbvGvnQsI2
         YCKRfjADZRvavXIhrgWVqvohpAMKlTCL5cT3Ex4YqBvyGRv/IX591YGJ8Vqkx1vqKbDZ
         WAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5B7dfi7xVJ3OslQ0ALi00lhJojz9IHhiYsVHA/RHqOE=;
        b=o++xR2HGbkqCrlb+DWJbPXBHwtu5Js+BA8CzDm7x90udIqeHYBI49XjEdGdBf2RmQ4
         CANodWwkhKklhsXY+/DaywnIbXNtPQf6ibCudd0WyLub6qpDdzkfHbm5pfcF7TYBUwEz
         o/FnN9BCT+ZNfZxawplHMAkSnm3NRlLlISLCT2BZfbFQgONw03AAotmgsGv3zAETk7ec
         eOp8ZNVTHgcQnO9Jw5wpzc/NzhHB2I55Kc45BlBwa+q782vr0yIOyXOA0xdDgYcV1tKE
         qCckMDze6ZWxId1Cm1U+wB00Tx9P9mHiJBWAFa2lmxUZhGYhFHjcjtO+uBk1ogRT5EdO
         RNzA==
X-Gm-Message-State: ACrzQf2SbXwm2tTVSPNUEvMEt4v8jNeX8KZF9Rmhnw8afTVdTUi3t3fR
        6eIf+3NXJQp6UVE0cwIRyCEe4U6bXxnRE8sKZj0=
X-Google-Smtp-Source: AMsMyM7l9664LpWj9QcPDmFBWC92J2k8lgTtaMBq0d8Kn2LaY6/WvjL6jmQ58ep7k3CUc1mU0tvXdcs9IQAedNtHTSY=
X-Received: by 2002:a92:bf0e:0:b0:300:cc8e:fe07 with SMTP id
 z14-20020a92bf0e000000b00300cc8efe07mr18642833ilh.184.1667906653482; Tue, 08
 Nov 2022 03:24:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:1921:0:0:0:0 with HTTP; Tue, 8 Nov 2022 03:24:13
 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik10@gmail.com>
Date:   Tue, 8 Nov 2022 03:24:13 -0800
Message-ID: <CAEbPynvxfjzGLRVVaaVB9fasgmGPWiH+Ceaj9c3oE5eqT5_+0Q@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:130 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik10[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik10[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Dear

How are you, I have a serious client, whom will be interested to
invest in your country, I got your Details through the Investment
Network and world Global Business directory.

Let me know if you are interested for more details.....

Sincerely,
Mr. Kairi Andrew
