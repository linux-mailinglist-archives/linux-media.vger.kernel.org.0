Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B9F2B3EF8
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 09:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKPIob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 03:44:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726928AbgKPIoa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 03:44:30 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5024B21D93
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605516270;
        bh=h/Giv0EpTkZx2aRWxKxATQGk+836+5s5DezGPyo+z+E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DupeXNkasq3+ZScX2U1K0tpDEjWb7GPx1Fx/M0JMXSe8hhjoXFxxIEMjHPx7lGvFX
         mN0mzqMnwcd0O4aw2D3kTiqGqhFx0WiGliTToDJ9JvcSRehOUKlWU+w9elNlyfIk54
         g5nUDLfq+rbCtpHwTZgGQ49aucVFjk39HVggXO24=
Received: by mail-ot1-f48.google.com with SMTP id o3so4702836ota.8
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 00:44:30 -0800 (PST)
X-Gm-Message-State: AOAM530TBRABna7uxs3WBzP72uHgoPDednxmmjBAg8LoaNnInK43O4ut
        IDx7qCJ3Kwi0pNWhHN9gdQTHWug8YfO3pf33Uow=
X-Google-Smtp-Source: ABdhPJxT7tqvApzg95RLgANrqRSoYwaL27/z9AWXsd96PdqMLfvNdViEV6B73tcOEn5i1BNxn1lqrK7R0P4a7/vOm0A=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr9304742oth.251.1605516269625;
 Mon, 16 Nov 2020 00:44:29 -0800 (PST)
MIME-Version: 1.0
References: <0cf705c4-0150-150b-8e29-de15b04ea6cf@xs4all.nl>
In-Reply-To: <0cf705c4-0150-150b-8e29-de15b04ea6cf@xs4all.nl>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 16 Nov 2020 09:44:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a176jcYoThzHwZ4FJYM8HTX0f3ON_DGCi5BE6HSLJ8YDw@mail.gmail.com>
Message-ID: <CAK8P3a176jcYoThzHwZ4FJYM8HTX0f3ON_DGCi5BE6HSLJ8YDw@mail.gmail.com>
Subject: Re: [PATCHv2] v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 9:23 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> In two places time32 structures were defined, but they are not
> used if CONFIG_COMPAT_32BIT_TIME is not set. Put these two structs
> under #ifdef CONFIG_COMPAT_32BIT_TIME as well to clearly indicate
> that they are only used if that config option is set.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Arnd Bergmann <arnd@arndb.de>
