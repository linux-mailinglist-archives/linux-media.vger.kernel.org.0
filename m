Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A305135A77
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 14:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731163AbgAINoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 08:44:38 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:47009 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgAINoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 08:44:38 -0500
Received: by mail-qv1-f65.google.com with SMTP id u1so2925563qvk.13
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2020 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xnUuj/R1pZ9BEEfeZC13Q/U2+y+Js++Xk5V7ipUCERI=;
        b=mNZwe0FrvBkpwSRGK9efMB2D/wuloasVh9w9E62/+Jsf3lV7g4JJyZ/tezUdJwTo4U
         wk/t5wwOsL2Wt/IRA0uE2cbvakkhnlqi4SCvz+UZwTGx2X7QpI9+0ZneU1C++i42fCnW
         EzXoWW8lSXYoQvhPlgZa5dQWEk+omDGNzZoC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xnUuj/R1pZ9BEEfeZC13Q/U2+y+Js++Xk5V7ipUCERI=;
        b=ppu7S8ohUQxXIfnsUaOFXI0UWAffroQ9DYTs5K6dAGBaeA84jOC7ztiIy25veR2Oj2
         XkDbVStmVSaGE90rLT/Xlj2NetPx6qxgSanHQ4QrUvXDuqYpWzyuYdiZyVJlBYWFkPX1
         t02xOfXiZ9SsnbDa/gduo/vuThgNG8lAno1F6G0J2WzA2kreiUIafLCtEd1PG0Bc7HVT
         yGObBD/KmA75MY1eXwZn+Le2lMLJ6uLuDsIHDa9GHXvWrfVT+Ne3R783hL01aKOwyv4y
         vRUXB4LdVNmB0L65g4W8nS4DUYU1uRGaKjVdJKBVqLwcmdwPAae8U2t8gIU9HdWofJWD
         1fpQ==
X-Gm-Message-State: APjAAAUuLO/A+IJsn7f4O5jJm8Ps673F4CYE9nHhjOB/6SePlLyVoG60
        S8jKxmjTXlviwhRfZ8JOYsCWXiWvfHkQ6ngsO0CwkA==
X-Google-Smtp-Source: APXvYqyB7mN7odCMCXeENZw0NmznYgYh4877oqe/I4JbXNyp7VXZ8ZMts+tt8zqupb3L5+UuzxKv2blZz2YsY1x14Rg=
X-Received: by 2002:a0c:fc12:: with SMTP id z18mr8995655qvo.17.1578577477214;
 Thu, 09 Jan 2020 05:44:37 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj6FA3VoTJqNa+gmAgVOv9zS7Qk9pdg46EY9NvtJOdz5_A@mail.gmail.com>
 <20200108104002.jxh6amnrazhnamej@sirius.home.kraxel.org> <CAOiLmNHMAz6UqxuEsiq6Y_dSNcCvtBrFR-FHG6voJAhpF8SeeA@mail.gmail.com>
 <20200109131218.5xc6zhovbgjavfpv@sirius.home.kraxel.org>
In-Reply-To: <20200109131218.5xc6zhovbgjavfpv@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 9 Jan 2020 22:44:29 +0900
Message-ID: <CAD=HUj7jdKsWAfmmzO7bpmd3PyHFDA91RKkzKiVbuv8=PT2Qxw@mail.gmail.com>
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what exporting a
 resource is
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Stevens <stevensd@google.com>,
        virtio-dev@lists.oasis-open.org, Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > that isn't just a leaf node of the spec. I think it's better to define
> > 'resource' as a top level concept for virtio devices, even if the specifics
> > of what a 'resource' is are defined by individual device types.
>
> Your patch doesn't define what a resource is though.  It only refers to
> something it calls 'resource' ...

Reading it again, what I wrote was a little ambiguous. Stating things
more clearly, the top level defines an 'exported resource' as a
'resource' associated with a uuid for the purpose of sharing between
different virtio devices. It leaves the definition of what constitutes
a 'resource' to individual device types. Perhaps it would be better to
use 'object' or something instead of 'resource', to avoid the
collision with virtio-gpu resources.

-David
