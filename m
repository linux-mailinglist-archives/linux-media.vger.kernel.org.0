Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F6144F027
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 01:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhKMAFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 19:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhKMAFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 19:05:47 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4FAC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:02:56 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso16267380otj.1
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gkk1rjhL1I6X59DftLAEvD8sjTiy4rXyvl7+aSKoimc=;
        b=oW4Yzti1UBzbgMHz7siKH+TwfvVQQvtxODOsKPbKEvtbca1Z4tOEd3DaEKRTxvONLM
         CSHQnvrlql9PF0IWxhMYHViX3dnInGRvCnR8o7lv5h6Zea661saATrf0TKm+joz+jvuf
         0E5+AjqTlxr/NmxbyDTRgrZRqQsQZaQRwcN44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gkk1rjhL1I6X59DftLAEvD8sjTiy4rXyvl7+aSKoimc=;
        b=KnN/vRwCDFVeueKwa54ycKwrPvt+J0bCfW2H7pcsCJwtTBZtPT8wHwZghbSYWQeFsS
         95tzt6bMrcJsinLZLcBaDZYA11m+nx9irjH6O3Dllb7XI7a0VjhBjV+FSIOEeL09LD1+
         OsfzrhNzYplFScaGg6fu1CnzcX1KPD5nl8Ry8DSbOoQTA/hzs8ChssCp2HTmXk8l/3v5
         QnHE3bNzQ8Zoz0rwg8PzeSOgi+/VytKtMuHDarL0v0vsRxcif5BZz9ACsJfwdbKenXpd
         WmdNUJ1HQk0T5mf1hhCyre622ciGdFFJI063Rx+u248frTajN0oIeeYL0O+30sJMuj7t
         DerA==
X-Gm-Message-State: AOAM5305IMuPlXyjA3lya/PDG0TM65jej5F/Cnpfw0qB9zS7YjDmMy17
        pFgoPRcpcv/dkfnLscMhejd58MUvNJdf4ShI
X-Google-Smtp-Source: ABdhPJwS+yzcHlzVhigilv/IYD3Al4z6zkf8N/cgbNt6WGfQpCCia/hWLnqcRalxniXhM+RGjV0kkg==
X-Received: by 2002:a05:6830:1cc:: with SMTP id r12mr15480102ota.76.1636761775325;
        Fri, 12 Nov 2021 16:02:55 -0800 (PST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id a6sm1068433otr.64.2021.11.12.16.02.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 16:02:54 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id be32so20833324oib.11
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 16:02:54 -0800 (PST)
X-Received: by 2002:a05:6808:6ce:: with SMTP id m14mr16028707oih.134.1636761774029;
 Fri, 12 Nov 2021 16:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
 <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
 <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com> <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com>
In-Reply-To: <CADvTj4rnc0eJ8a=E-z+O=MQZFDa7XtKoeDkm4LDmVsYXjSVCxw@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat, 13 Nov 2021 01:02:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com>
Message-ID: <CANiDSCtKz90fu5RF8aC=6fB3X_g_68B86=w0L+C_YK0Go6K9nw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Sat, 13 Nov 2021 at 00:59, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> On Fri, Nov 12, 2021 at 4:50 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > HI James
> >
> > You are getting -EPROTO while trying to get the current value of a
> > control. I believe this is a hardware/firmware error.
>
> Hmm, any idea why v4l2-compliance passes some of the time but not
> always?

Race condition in the firmware?
Not enough current to complete a request and end up in some kind of brown-out?

It is difficult to know without access to the hardware :)

Maybe you can replicate what causes the error with just v4l-ctl calls
and then ping the manufacturer with a simple repro.

>
> >
> >
> > Best regards!



-- 
Ricardo Ribalda
