Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F90113404D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 12:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgAHLUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 06:20:41 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:46657 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgAHLUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 06:20:41 -0500
Received: by mail-qv1-f66.google.com with SMTP id u1so1192794qvk.13
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 03:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxgIwr+DRKj1MmNqhPAiOzH9LOv+L8Guy1zzK98nfVc=;
        b=ev4RH5JnknR4vJHlIBRoOHMjLFmGW+2jqCTnmxWdo0jZX0eLIqkWuO/Vmxlj05rA1c
         cVGiijk9DZEvQoIdE7BfDB9snl7nNxGc9GI71JUMlbwGYrLKAPZX5PRDM1y62YnRaMJ1
         h/q7G7CWMILTkpKHZoIjBy2GlrjW+b80YG/Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxgIwr+DRKj1MmNqhPAiOzH9LOv+L8Guy1zzK98nfVc=;
        b=TRf/uL//KZ/ii44CJgUXMv+zsB+N5G1tdMyIjNHukKmt0U96quQ0t0PmBcOxGRCtaJ
         Gx6lRtf2D/BqSzaiHh5dgxjN3K5sMzei+M2jfVZO85JivZM1uuIcPgjIJmmxPbBvv/Jl
         elZhmuD61OSZAt7vGh+xtnEWiyvzfKlTcC2kGKLbl3TW8F8KpOCPgGUMEexxY1MTSSp0
         p60/WKyfWpGyHhu4YlEbJ69HfjDXebX9inmzaxM1dJiMZITcZnqkllIkAm/qMd3vP3tr
         CQQVUxEWTenB3g2QDeg+iL2xYD1vN5MK4JEw4wCOpaQUV8FKdYvyIbHxT77ckLpJVfx+
         hfaw==
X-Gm-Message-State: APjAAAUKTow6VKkUolkAOThi1M/Sg2D0RDdh4BqdZtp5C+WUlTvtg7b4
        IiDFW+uCKl1Fcecr/o3+y5D2G8Huqn406NU6yWNbzw==
X-Google-Smtp-Source: APXvYqyc45wpWHTk2TOEdgv6NBR1ueaW9vMFeywp7uP136rJBpd4XC/ZZrKtZJmlHu7FTra9OKY86zzqYbF/8q9hS3U=
X-Received: by 2002:a05:6214:983:: with SMTP id dt3mr3618211qvb.145.1578482440626;
 Wed, 08 Jan 2020 03:20:40 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj5U-TxqbPJiRRbyMHON21sht75q3nisvwvKrO+Bf=n8ng@mail.gmail.com>
 <20200108104459.qikjl4n2j5wkwslu@sirius.home.kraxel.org>
In-Reply-To: <20200108104459.qikjl4n2j5wkwslu@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 8 Jan 2020 20:20:29 +0900
Message-ID: <CAD=HUj7Y9x_cpWvKF-7oK_jcgKXfQxXe-198JbkCA=LyERvA4A@mail.gmail.com>
Subject: Re: [virtio-dev][RFC PATCH v1 2/2] virtio-gpu: add the ability to
 export resources
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     virtio-dev@lists.oasis-open.org, Dylan Reid <dgreid@chromium.org>,
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

> Is there a specific reason why you want the host pick the uuid?  I would
> let the guest define the uuid, i.e. move the uuid fields to
> virtio_gpu_export_resource and scratch virtio_gpu_resp_export_resource.

Sending the uuid in the original request doesn't really buy us
anything, at least in terms of asynchronicity. The guest would still
need to wait for the response to arrive before it could safely pass
the uuid to any other virtio devices, to prevent a race where the
import fails because it is processed before virtio-gpu processes the
export. Perhaps this wouldn't be the case if we supported sharing
fences between virtio devices, but even then, fences are more of a
thing for the operation of a pipeline, not for the setup of a
pipeline.

At that point, I think it's just a matter of aesthetics. I lean
slightly towards returning the uuid from the host, since that rules
out any implementation with the aforementioned race. That being said,
if there are any specific reasons or preferences to assigning the uuid
from the guest, I can switch to that direction.

-David
