Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933DB2C0EA2
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389444AbgKWPSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389439AbgKWPSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:18:52 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F78C0613CF;
        Mon, 23 Nov 2020 07:18:51 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y7so3474465lji.8;
        Mon, 23 Nov 2020 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yX11njvSBR+iLluPGSwzoSZT3z43k5ZJeal0h30YqGw=;
        b=M6Ke/9xZulUSHz1LEDfd3iRxvvKpjTCxmMqv4mMzEShk/O7k2PsygrHQx3JF1xUXDt
         dQvFRO+A5xSDhC3PZ+ROmlas8LJCH3AaogwT0/fNoeZnEtSTDe2oKjqfHlVNiaUaUnbo
         akXTlbg1B8U/TI0AI340cJ83sn7StDSu3/QW9wDUvOXX0B7l8HBEENYhM1LvRwI9pCdQ
         cHBnOYw1v92sSbUVPmkN01OTLqcuHXUstVn1QDF7oeio+0dd/+zEpvBY29+jam/lHxdm
         +Yb2QMUlhRgKeQHoR4/MpWdHPAJOXJzxIBVm0mLJu3+jtbIsxLkpc4xtlPV7TPQRL/JP
         /7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yX11njvSBR+iLluPGSwzoSZT3z43k5ZJeal0h30YqGw=;
        b=ZriiU3lNzjp9lHECswAGvitOX6G7EVzgwf7yyyuduKOaZ+NSo9+UfYRl7Vr7ktMO1v
         dYiwX69OnAl0UHE7IDHqza2AfnIVu7NfvTcbGFDTHF2XfR++Dnop+ctC+c2viE/GOGVJ
         iAm+5r/kloTjEnd0L8u/nU9ej83zlNDazMXZhVOQRRkJtE3sV+IxwkB71rdk0cznkmIy
         m+nB4p3L9TH8l++LIKcI2bCy0Tq42cEYkpmEB+0qIIwoP7f5IkQB9ZoyKsoMT8zqEUDO
         qlcxzo3haXHofI3ZCzpdon60/kvweT8y5Xi92R8grk8VWHE9Teooi6bx56r6jERcu7XK
         luaQ==
X-Gm-Message-State: AOAM532dJA4QSF/6nkz9RmeIdLRmVtb/MbxrE9iiJrrXemRZmyydzNuA
        Ohm9HUkWJRFpK3DAl/lGSE0kIKNfwqm4JJEhPXY=
X-Google-Smtp-Source: ABdhPJxGCwVC41xGktUVQX5iSjbOqB9v/2yhrpW5EubnRX0/zZcUIFFL1Sj46CLmYNDARJP+7lQ1GuB4xWr3GhSP4uk=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr21331ljg.321.1606144729831;
 Mon, 23 Nov 2020 07:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20201022122421.133976-1-gnurou@gmail.com> <c6454292-935b-f14a-e743-838ccabc6590@xs4all.nl>
 <CAAVeFuKCEQYBs84ssCvwAkGUxGikeDFc+XNX2LzkENGc5B1n8g@mail.gmail.com> <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl>
In-Reply-To: <db7a95b0-3d63-ed38-fb8a-62f32c83c13e@xs4all.nl>
From:   Alexandre Courbot <gnurou@gmail.com>
Date:   Tue, 24 Nov 2020 00:18:37 +0900
Message-ID: <CAAVeFuKh+f0XPfBE+Zs_cjfvARaXjua4MtmStFF1xr2AiXcNog@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 3, 2020 at 6:48 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> There is one other place where this needs to be tested: testEvents() in
> v4l2-test-controls.cpp: currently this only tests select(), but there
> should be a second epoll test here as well that just tests EPOLLPRI.
>
> This would catch drivers that do not stream (i.e. no EPOLLIN/OUT) but
> that do have controls (so support EPOLLPRI).

IIUC this part should not require fixing - EPOLLPRI is behaving
properly, the bug is only with EPOLLIN/EPOLLOUT.
