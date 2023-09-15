Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B886D7A2A3A
	for <lists+linux-media@lfdr.de>; Sat, 16 Sep 2023 00:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbjIOWIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 18:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbjIOWH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 18:07:58 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029F81FDE
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 15:07:53 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44d526f96fcso1165364137.1
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694815672; x=1695420472; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UocbsYWIXrXrmzdURvetVmlROsOvF6BmnSObbAzBxh0=;
        b=msWFhGTM1k0mPem34YUEJsS8CVFjFeMdbAQIattJ9sVYZbjFdLCosADovYfrJEoHkN
         Su9msisDv9c4DPcJmaU7090d4u6YNgIwIfPw55UDTT5MDM//7rfc9FVWlaDjXo6eZzSt
         jW/6QplDcwINeD7oLknlvVnvvVNWBEwscn2mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694815672; x=1695420472;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UocbsYWIXrXrmzdURvetVmlROsOvF6BmnSObbAzBxh0=;
        b=YK9lgixjHV1GplAQDrrwnsiujyDjKoWCz5p6idYnAK9HJC04Y8XsVkqFTv80LG5GXu
         NMyLTmg110tZHAv+QGf1x6/lVpg/unqLayNgX2tBNJpR5ZzjVXXXhKV/RNsVcVzhhhg9
         bgjBoFPXmeejLu/70sx9oSnb2ooXFK3jeK2OQYtdzEDCjH1u/o+nYHDx0ElZ1Z6fcanY
         J/squBDLqlpS9KcXpSQCFIX8nzCzxdtvrptmz/PwJtddcrMd1X+33023H9yN4ovqG+zH
         KLsyEPJ3PWhg/Ou0vAoAZaGoqc8L5GlylqavZCBnT/l3aRXANjmyMXW7fYtXEz2DdsSp
         pQ7Q==
X-Gm-Message-State: AOJu0YxxmhfJ3Vndy0G5Q/PrDh/M54XA83siMv4LJe9+3+gWmHjyXRGD
        0LhYH3jNb6t7TGsIVQ2J5kD1W+Fe/ngQRkHorE2yzw==
X-Google-Smtp-Source: AGHT+IHLFmqjGukBXt4z80HVLj+YVaGovcT3pUbSrvw7xH76XiiHrp5T+j04dAudH+545uhAEpea1g==
X-Received: by 2002:a1f:e743:0:b0:48f:af58:b160 with SMTP id e64-20020a1fe743000000b0048faf58b160mr2800040vkh.9.1694815671859;
        Fri, 15 Sep 2023 15:07:51 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id g15-20020ac5c84f000000b00495d19add33sm716090vkm.20.2023.09.15.15.07.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 15:07:51 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4510182fe69so993524137.3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 15:07:51 -0700 (PDT)
X-Received: by 2002:a67:ed0d:0:b0:44d:506c:b9c8 with SMTP id
 l13-20020a67ed0d000000b0044d506cb9c8mr2082980vsp.26.1694815670985; Fri, 15
 Sep 2023 15:07:50 -0700 (PDT)
MIME-Version: 1.0
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 15 Sep 2023 15:07:38 -0700
X-Gmail-Original-Message-ID: <CAMfZQbzh+o2hn6VgbMsAyjOuMG8PLwwk15neit0t1zC0b-YVKQ@mail.gmail.com>
Message-ID: <CAMfZQbzh+o2hn6VgbMsAyjOuMG8PLwwk15neit0t1zC0b-YVKQ@mail.gmail.com>
Subject: MEDIA_IOC_REQUEST_ALLOC performance question
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Looking at the documentation[1] it states that the fd returned from
MEDIA_IOC_REQUEST_ALLOC can be close()ed and the kernel will take care
of making sure it is ref counted correctly.

Because MEDIA_REQUEST_IOC_REINIT needs to be called on an fd before it
can be reused, is there a performance penalty to allocating a new fd
(with MEDIA_IOC_REQUEST_ALLOC) for every frame instead of having a
pool of fd's that are reused, and then immediately after queuing the
buffer, close the file descriptor?

I have a proof of concept that works, but I haven't tested it for
performance yet.

It would seem that maybe there is a latency penalty because the
MEDIA_REQUEST_IOC_REINIT is called at the end of a frame while
MEDIA_IOC_REQUEST_ALLOC would be called at the start of a frame.

Thanks.

-Fritz

[1]: https://docs.kernel.org/userspace-api/media/mediactl/request-api.html#recycling-and-destruction
