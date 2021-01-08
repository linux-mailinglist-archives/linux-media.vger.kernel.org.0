Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A1E2EF2C9
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 14:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbhAHNAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 08:00:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:59476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbhAHNAY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Jan 2021 08:00:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC6EB23884
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610110784;
        bh=BTjkIjNo6NpfBPhuXpVpEVPxTh/ZzLyxZIQKnD1tukw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b7ugSOPXg7hh5k4xQiiDq3Fsa7zAp85oLOgbT2R6h6KnnQzuQj9KYKOI5ZG1960nj
         SPtrYYzW0tzV5321xoFsjo+ga2AHE0QKPjATjAzFuCxT2m6tVeCvRmuQLrqQYG0ZMD
         btX2Riu+zWfeU/Ai44XXEkIWphlypYLowRCTfdLbbP9CSGinBhkmRFWdf7NO4VqwAA
         7VLUrGu6z/ho3GQhh4BfQjQ/sAihPD5FFsuKDHQiPBGRnmKeWMAYMtO7qTqGR1zgaa
         27r2gLmMcHv3RChWIADQwl7dzibP+OD/+sfZ99rOKT7gK1XeMvTS8xt/RtcbDywv3I
         orQmMPdgBsCdA==
Received: by mail-ot1-f44.google.com with SMTP id r9so9498025otk.11
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 04:59:43 -0800 (PST)
X-Gm-Message-State: AOAM530SvSINUdgZr46gpz2T5fEFUNyNz6iJCXiEE0ZyFKt7n5nqT5AX
        8gJUqWePs+4Kh4PzNyq7XEv6rOTuxhw+7MqwcKU=
X-Google-Smtp-Source: ABdhPJxPbFXlMEqXIoihrrXpbX0xaUDjzMb5Oi2IPMwipIFc3Gvs2WenodK/X/cCNYkYWteYtUlX6zETFp94vbKtrws=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2460200otm.305.1610110783103;
 Fri, 08 Jan 2021 04:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20210104165739.116404-1-ezequiel@collabora.com> <20210104165739.116404-2-ezequiel@collabora.com>
In-Reply-To: <20210104165739.116404-2-ezequiel@collabora.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 8 Jan 2021 13:59:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3E4z50fecwFdwmMjj8Pk5_BoT8E1LNKAnsvgPfsdEhAw@mail.gmail.com>
Message-ID: <CAK8P3a3E4z50fecwFdwmMjj8Pk5_BoT8E1LNKAnsvgPfsdEhAw@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: mach-pxa: Register the camera sensor
 fixed-rate clock
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Collabora kernel ML <kernel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 4, 2021 at 5:57 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> The pxa-camera capture driver currently registers a v4l2-clk
> clock, named "mclk", to represent the mt9m111 sensor clock.
>
> Register a proper fixed-rate clock using the generic clock framework,
> which will allow to remove the v4l2-clk clock in the pxa-camera
> driver in a follow-up commit.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

If there are no objections to the change itself, please take it through
the v4l2 git tree. For arch/arm/mach-*/

Acked-by: Arnd Bergmann <arnd@arndb.de>
