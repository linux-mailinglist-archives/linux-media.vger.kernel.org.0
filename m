Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DABCB02C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 22:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730982AbfJCUci (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 16:32:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45351 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729311AbfJCUch (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 16:32:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id r134so2813981lff.12;
        Thu, 03 Oct 2019 13:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hkTbkpaniuJjm6OXr5IdB0Neb9Rmo2JofHlJqszBRvQ=;
        b=KeSQrE7oHC/Cf0D/hpGTMvGvcsOansQnkzt7efa+NgGLTlSz19egoiY0KvbTbtl1zT
         RV+B/jlmqup2nJi7eIR0awhfACOgz83j4taa0hwoTYkqAQWb5LL3EyEjuwkoEw59x3ao
         rX0iWgtJTghlfu9k27cLrHNruMfjXZwXMcmafkTCHAeZkJUHZjzyCKepqzpBxyPjLOg9
         CjZ68nVSe2nyqrV5wdCJsShkZm9r41px0wuepoMgXQo2XjZganPflUbMq8o5ZAaLLODw
         iOJzmGySmcu7r6YM4Bcm4D2pfvgRlUcJNQoXPI50Oa1n7zDtmI79KWkSMz4F4gAX8lWB
         cOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkTbkpaniuJjm6OXr5IdB0Neb9Rmo2JofHlJqszBRvQ=;
        b=HfoNJwA89OjOTim4v7yfn/UARzJhq9XuSTxMSnNpUv8hYNrWmLzeqYVxQuUPlMq4cM
         wXZbDlIHIHwNhOrr9s4ZEiat53XCn2RyLbjY3zkEeuMpMDQlAQG6bmOgK9Sa2RRzoHlS
         HzJj76m2cc32q8rQwwZ1XCfFIJVUztoSuDFN1o4fsLoHhfTrryatStdZmJlugaw0cnHv
         KFZ2H/NuFXRkffL7ep3vwT4smpi1vIl4Axd0HUOWpM04h/2TFPCkisB6wseGJpRNpQ8g
         W99cR/kyMI+K+HAu0f9ZbsFIgHyMRUmuJdVHTq0CD99NGHk0/IgwU43A+RasGc8QGLOJ
         Q+pA==
X-Gm-Message-State: APjAAAWql92lBVa+yumqVxFI+u8X1qZBsgenRs4YxNeemzIOZiYLINRa
        yhH+H8nN3U5WB+aASHVppaYNyNNm/kL1vbLFSD0=
X-Google-Smtp-Source: APXvYqwv344yV33R5u4knj25pO1+GejN9pDBo5vBys34ARZkVKOp2x5MAyZjqARUwevdXZCufmEXdP3wsZOlFbXyki0=
X-Received: by 2002:ac2:46d2:: with SMTP id p18mr6823135lfo.140.1570134754101;
 Thu, 03 Oct 2019 13:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone>
 <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl> <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
 <20191003163914.7c384d36@coco.lan> <20191003164426.6da8538f@coco.lan>
 <CANL0fFRSNbUhcik7rnhjZ0qUe-tZyzcjY+M1J_iGzUa5jNc9_A@mail.gmail.com> <20191003170329.3624f7f2@coco.lan>
In-Reply-To: <20191003170329.3624f7f2@coco.lan>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 22:32:22 +0200
Message-ID: <CANL0fFRtypQrvqLzWH5NE8PB=yG6roXd7ErquJwXoat-6dMFHw@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> I don't know. I was not the one that extracted the firmware. I guess
> Antti did it.

Ok.

> That's a really bad solution. Returning 0xff is what happens when
> things go wrong during I2C transfers. Several problems can cause it,
> including device misfunction. Every time someone comes with a patch
> trying to ignore it, things go sideways for other devices (existing
> or future ones).
>
> Ignoring errors is always a bad idea.

I understand.

Anyway, I have to give up for now. Maybe I will have some time in the
future to come back to this or somebody else can use the information
in this thread. :(

Thanks for your time, I appreciate that very much. It was worth a try. :)

-- 
g
