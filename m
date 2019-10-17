Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4480DA844
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 11:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408500AbfJQJ17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 05:27:59 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34349 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392048AbfJQJ16 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 05:27:58 -0400
Received: by mail-io1-f65.google.com with SMTP id q1so2173396ion.1
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wz0s1QqmOeptIc8QDhBt7HC6sJO7YJ7zLXDUi4doZPk=;
        b=Foqzw9J94qCGPQO9L5YG9Ug/B89psLZVCfzDwThDaWpXM1m6Z9KLaeRKoGYZgtGBdk
         2P4uJdqhp7qjDJwB0+jDKee9bK1zFkBLXmcONRP0/BI3xsTIBojJDM1wHUAT+WB2TqN0
         OlUiCXAqF03ZMpZWTxMR3PMDqHOORF8aDC1gj0AK2+jPU9+HrVhIDrhJCiSo5n+ogNpq
         6QZF8hXjkUy5MhMsHfg6cuqmhv5Hgdf8FDFVzbfjouY9tfRag7pJKwLcB8UZ0SWWIsU6
         oHcdAn4Sc6iYQetMI/pk3Kwxak0zlM8ms1iMFBUXvyaJudG8xpnQif+8lfxuPNGGrvUB
         E/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wz0s1QqmOeptIc8QDhBt7HC6sJO7YJ7zLXDUi4doZPk=;
        b=V+2sDAzcu+SSflOslsGSUgwNHcMWhwkcWdVOKyItyjyACr+vCEFI9yTldWjtaHuizA
         R9wu75p4qA+la8vTRY9Nj/ReH1l3B4hPYPmvSUlf+p4T8CmQZqZtGjqBwGH3nCcYIJXV
         lkqNiMbPWJ7JpPt07a6AeEcWgdw2E6Kpzv0fnLVzeqC7RgzJ3XL4ydaM4rN1rsMDaYTY
         k4lbBmN/a6hHax8hxjNIx0F4kxIH/W16hfyIJzFqS/xuYkKyZwRY8+VhvCRbJENt7mkd
         Qtlk63c4xcAGhXo6YFG5eJrwBxN7jxwUrI9weXLf12NtM/HS4/pFSKP98tn/Wf1K58WI
         259g==
X-Gm-Message-State: APjAAAWOxya1VdDxXRc3Wcb+egyioawy6h3FossGxyP2NC8zYoSyhH1s
        E8UwMId06MIIPROQJE5do8ezutO91u0yjLTVHrp99g==
X-Google-Smtp-Source: APXvYqyCypBNp/qrkKZeUbF89wkGSXv7oZv1mPOUdE3uOZg1Y7knp3N/y33iKlpj4tJ7/tcpUtcNwx/X4Nbjlw0guxM=
X-Received: by 2002:a6b:c8d2:: with SMTP id y201mr1821211iof.284.1571304477717;
 Thu, 17 Oct 2019 02:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-2-hverkuil-cisco@xs4all.nl> <20191016161417.GX25745@shell.armlinux.org.uk>
In-Reply-To: <20191016161417.GX25745@shell.armlinux.org.uk>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Thu, 17 Oct 2019 11:27:46 +0200
Message-ID: <CALFZZQGewe4vSTcXUjYsep6oT9wZTyQRr8-kzVVbNVSoirwG3A@mail.gmail.com>
Subject: Re: [PATCHv8 1/2] drm: tda998x: use cec_notifier_conn_(un)register
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 16, 2019 at 6:14 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Wed, Oct 16, 2019 at 03:39:15PM +0200, Hans Verkuil wrote:
> > From: Dariusz Marcinkiewicz <darekm@google.com>
> >
> > Use the new cec_notifier_conn_(un)register() functions to
> > (un)register the notifier for the HDMI connector.
> >
> > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Please explain in detail what this mutex actually achieves.
>
....
> So, all in all, I don't see what this lock is doing, and I think it
> should be removed.
>
> If it's necessary for a future change (which may or may not be merged)
> then the lock should be part of that future change, because the change
> proposed by this patch certainly does not need it.
>

Yes, with the change being split into 2 patches like that, the mutex
is not needed here.

Thank you.
