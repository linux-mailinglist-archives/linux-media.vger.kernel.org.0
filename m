Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7297224D4C
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 12:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfEUKyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 06:54:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38221 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfEUKyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 06:54:52 -0400
Received: by mail-lf1-f68.google.com with SMTP id y19so12717246lfy.5
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CuQPCza8xJfYgY0dneZk0G6xayTBnNxEtRyHod+p3HY=;
        b=lQCrlTHs22nkIIE4mZHxZ2y/0PC+h9l08GqJNnXF+rFnYfOvyiDBMc91per5friV2/
         tvfKd63MlktUgYPwIHzRpMAkmo8QE/YfyLCy97H4HPDmkAVPnUvhQV5AenOjgUCZToxS
         NHX+YbNOx6AR3tAYzyF8pxtyx0oelYAi+WGNjkCcTa3SmiNTAhYdq82nOQRLZSIUO5HC
         UAgJkDPhjLZQgdyLIHXZtFjLtO1hOBiROigrbPg7AgnqtxU5N1uO1fKZ4hSh33m5866Y
         /SvdZEBVse5bdZwcD0z8A5jTkcc9xAOXnSZXYDs4kEVlXpTWd7WX8PkdvSMjU6e91lzL
         2XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CuQPCza8xJfYgY0dneZk0G6xayTBnNxEtRyHod+p3HY=;
        b=FMToqW/n184IugXJ80mQNtr89QdkYEuBJA6uKFOaIQ8xZrZmvwcRqu+pK1fVuIOqkO
         KNfOxF/bcgeBNCw1g2A8uZq8/rJucVletu6sKeoLzsFa+k07YJZVt+ZuLP0sN459P88Q
         PN1hV9uRNNOuLOTItZmkGtS8oF8t3via0gkXunM2O19XMyUf5l2OT/Lfe5ZOeWeILFy6
         +s5x1vu3hkdYoDQuWrx3pUwr1nJjJ1pm22XPea63ld5Shw038HqdLCbMxPWlKTrwetCu
         NczNkQ5YJFzIopOgdjZI5STj8OrsNtnagaq10z6jyzR8xQgyEK+NPA4HRmrMV2dZ+yUk
         CJdA==
X-Gm-Message-State: APjAAAVzkKIIwPD3CrJ2XeiZfrJMAbpD/5s8d7b6rcy4i7iQ5M2QJQte
        4rsUaee8eivRiH+0RqTBQdHDs+FHt/CLd+5Em/HH+A==
X-Google-Smtp-Source: APXvYqztX7fYok/uhqw5ZT0BRL6qm99DV5CcOWDJsCELsoCIo6z6fMBHqDmOwb7+hNYnFgvYtYgxd/kFSm2WUh1SNCg=
X-Received: by 2002:ac2:418c:: with SMTP id z12mr8772790lfh.0.1558436090142;
 Tue, 21 May 2019 03:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190517154256.255696-1-darekm@google.com> <20190517154256.255696-2-darekm@google.com>
 <8f2ceecd-da9e-a923-da72-cdc660eecb3a@xs4all.nl>
In-Reply-To: <8f2ceecd-da9e-a923-da72-cdc660eecb3a@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 21 May 2019 12:54:38 +0200
Message-ID: <CALFZZQHjc8WxuuGzcWUjDJ2TU9Pyp+f0XN0p8iPahPFAOtw6AA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/bridge: dw-hdmi: pass connector info to the
 CEC adapter
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 20, 2019 at 1:30 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/17/19 5:42 PM, Dariusz Marcinkiewicz wrote:
> > This patch makes dw-hdmi pass DRM connector info to a respective
> > CEC adapter. In order to be able to do that it delays creation of
> > the dw-hdmi-cec platform device until DRM connector is initialized.
> >
> > Requires testing.
>
> Testing this patch with the Khadas VIM2 board gives this kernel warning:
>
Thank you for testing!

This was probably because the platform device info was not fully
initialized. Hopefully it is better in v7.

Regards.
