Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64ED66873A5
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 04:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjBBDIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 22:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjBBDIe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 22:08:34 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C8A1E2A8
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 19:08:32 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bp15so981169lfb.13
        for <linux-media@vger.kernel.org>; Wed, 01 Feb 2023 19:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTG/N+FIzozjyzMAk2A+UY7YYT2l6fondG21b2HZC34=;
        b=aoOIQoXkvWUiMHkuQToZpVld5NFZUQVLUuEp1sz9hKAsMzBSlntGsiEDEbIS2OCGRX
         HRWib/qoTsbA3jvjf3+O5EWgfmS7uFYEhQO6MoDZ+1Z6AnAIyly3F4BdyVYshEp7vxCH
         Vgj7J0uLlpM181jIC81ZgyS/vMHu4Io1BZhDAvk4szDu0Str8e+XnAG6zcJQbS9Kbo3N
         X50pBvQXhCUhuck0KRRjiF9V28oBQ3Ts81s4n1t94ygX2uQDq+LJiHQr7+O/FJ6Dm10t
         DdMKDKxMNevGqu3c/t7btfEyvWpM/Uqq8GFTDgdRED3lRHsdZ4Euh1YMmlIrUdrQHw0y
         Vwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTG/N+FIzozjyzMAk2A+UY7YYT2l6fondG21b2HZC34=;
        b=Zc49/4NU9rO+Wp4qBomMdcocYLHlNJb/kpxiFiA/L842k6mNluW2U/4CgM5lj5NFsS
         gV/Tg4Dq2v+Noz0KRARVExGoYTWebq8dtWgnLEUl5EP050XnwvhjdpsDKau+zWgQ8h9T
         HcZ4EFQl6xho4AwwLsRuCOeujq8gIX/rWMwz161WNBZV9JKmEimuI/g21/PJgvG5kWav
         gKwpHkeBhZ+mZsDh0v2qPCzUSc1oL61JMuT21tiC/Uo4otzsVh4Np2xQSybrD7LfIV8o
         z36iGI+SneS6DM4iheaouBwSAUzbcbT3UvIhpyaHQe+ryHgtw9oZrWsCKrSqaM32GmyU
         U0YA==
X-Gm-Message-State: AO0yUKUhXvW3xA8HdLYKClv786vyGdRo1FDA8vOIlX+R/6m9IDRLu2la
        1tf//xCxw6B90oDqW0mI0SvUKLWcfsw=
X-Google-Smtp-Source: AK7set+oabLxrgl+VEcun+4qovTBPnzfqQ2Cula/jypTH7iXV8Aieisa/ucGV2fQcIiwKvmZfbQ2nQ==
X-Received: by 2002:a05:6512:ac9:b0:4d8:5e8e:b138 with SMTP id n9-20020a0565120ac900b004d85e8eb138mr1432680lfu.14.1675307310258;
        Wed, 01 Feb 2023 19:08:30 -0800 (PST)
Received: from smtpclient.apple (95-31-161-212.broadband.corbina.ru. [95.31.161.212])
        by smtp.gmail.com with ESMTPSA id 14-20020a2eb94e000000b0029066c8906dsm654940ljs.23.2023.02.01.19.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2023 19:08:29 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Monochrome sensor support (Y8 Y10)
From:   Anton Litvinov <desperex@gmail.com>
In-Reply-To: <B7B12DB4-8AC0-47E4-88D4-69FFB457E55F@gmail.com>
Date:   Thu, 2 Feb 2023 06:08:29 +0300
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <007079E5-6D01-40FA-9CD3-F0C023F6847E@gmail.com>
References: <B7B12DB4-8AC0-47E4-88D4-69FFB457E55F@gmail.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna!
This is sort of enhancement request to support MEDIA_BUS_FMT_Y8_1X8 and =
MEDIA_BUS_FMT_Y10_1X10 formats on RKISP1 media platform.
I=E2=80=99ve got Radxa=E2=80=99s Rock Pi 4B, greyscale sensor raw camera =
supporting only above formats and a desire to extend format support.=20
Actually I already tried to port these changes - =
https://github.com/JeffyCN/mirrors/commit/72e4ba0ccf477a6d90f40a2fb5e3bc9e=
5025093b to mainline kernel v6.1+, I was able to set up the pipeline and =
=E2=80=9Cstart=E2=80=9D streaming without getting Broken pipe error, but =
eventually it failed here - =
https://github.com/torvalds/linux/blob/v6.1/drivers/media/platform/rockchi=
p/rkisp1/rkisp1-capture.c#L962

So if this kind of enhancement activity is of any interest to you or =
parties involved, let=E2=80=99s kick it!
UPDATE: Sent plain text

Cheers, Anton

