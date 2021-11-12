Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2286244F014
	for <lists+linux-media@lfdr.de>; Sat, 13 Nov 2021 00:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhKLXxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 18:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbhKLXxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 18:53:37 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4931C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:50:45 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so16156187otk.13
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nF0Fkqhe09F3FOFYvd8HwhI/3FA+B9ugGMkrBAVIpRc=;
        b=BQIgD0pG4pscI9a828CQ4P+nBBk341D+H3Wc9JL4FvqgKqQUXQzpvEqUbRcUa1h54D
         g/0b3S1d3dyTzVONs970cSt+UE1qQQzn9Vv2vIRfgExrPeQ2mvUkukK6J3Bl31r7Yd+8
         X7aWXeG8/D5cUgeo1xG+KXrBTVvrZQ3vauVlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nF0Fkqhe09F3FOFYvd8HwhI/3FA+B9ugGMkrBAVIpRc=;
        b=vT849Dc+0cNT14oqDJPjmbfdIbKrl/8ISurEFIai3adjaIeKF587MZKaUr//b11et0
         4L4kqilQpzxGBkdOADs7GndIxnugKKsHYxhaK9SEMuuFDwT8HoPL9fGMOb0vS14F8U5P
         JdEQ1LV1UR9o8VpV07uZyT13jJA2nRPchTKruJwRAcbD0NYf2ILxBeVo956/x0GKlgD9
         UqaG+lX7tP+8NQ7YgLOnuUbMl071UufpKCMiBVJB13xTfdN8W8qtKl06Fuwr+ISoZAZo
         rqCwXxKNr2iGB6v43RPXU/EoKa378dNOmd0v6iBH4f2ku6TL52Ml+Nwcr7XMOLWarSYK
         ErMg==
X-Gm-Message-State: AOAM530wjenfVflS3xPh3ckGhaw37LQFfzTeV2K3a5Hu6SgesLsVuJSy
        U8+TWIjSuonyzUgY/kCvZ27/HKgNv3pBZ+sb
X-Google-Smtp-Source: ABdhPJw58i1tyVhdrHD6ODUFxdg+7Ee2sKlZTLObwkQ5SKG+H561PtvevatXDfxcDiq8NwY+1y2Eow==
X-Received: by 2002:a9d:5d4:: with SMTP id 78mr15138385otd.368.1636761045044;
        Fri, 12 Nov 2021 15:50:45 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id l23sm1519353oti.16.2021.11.12.15.50.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 15:50:44 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id m6so20898757oim.2
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 15:50:44 -0800 (PST)
X-Received: by 2002:aca:be54:: with SMTP id o81mr29274678oif.64.1636761043842;
 Fri, 12 Nov 2021 15:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
 <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com> <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
In-Reply-To: <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sat, 13 Nov 2021 00:50:32 +0100
X-Gmail-Original-Message-ID: <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
Message-ID: <CANiDSCsw47OVS2L1cbA_HhnYMzLgJRfUVJBVu6vYc58USX=Auw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI James

You are getting -EPROTO while trying to get the current value of a
control. I believe this is a hardware/firmware error.


Best regards!
