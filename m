Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D82F1364BD
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 02:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730616AbgAJB2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 20:28:49 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36550 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730609AbgAJB2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 20:28:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so387449ljg.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2020 17:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZD5FeMyHEpLAI4RDmBEkPzFF4c6By+Nv+YvyYt2HRIE=;
        b=dx25vrqJP+K1GrmNcbAdfaMQuy+02/bLxovM6P89uUQ6NWWd+i1gpDdhdeyMn14FX9
         6STwL+63/lbwt60KeTK4ESs1ypvW969zHNzz/fuOczRCsfucBkgnjGpOfwnUP9QNHx/X
         bwGTSujHWHjHk4BYjzhzgiqY44+Z55GXKT70M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZD5FeMyHEpLAI4RDmBEkPzFF4c6By+Nv+YvyYt2HRIE=;
        b=MeNzdvC3wARDRBj4U/iQoztYDv4HaeD+snxOjqf+jlm50gkfYn58WcpFQP93/VJC4Q
         Eqt63tPU17Y01BjUGHaQE029kLlkOrsA+TZDXyjWck1PmADIkye1H9HhFzDqLrfpP7Am
         p8/47gNaiJ/BY8yqtNv7C1mhBjwOasN2GleNUOIzzbgIigqLW3bEd43Q5uzWhp+VD/9Q
         8flV19zwLP/o2Tf4E/s91dc9ug5t67sfiHCSxuQre6N7Gc2loZW1Smi6d80onoMH+/xO
         m4lnOhuR1ZcIZyEHuXaJGrLjiPFsCrkVd+38GLdnJGuZxnVLEMD82hVP7F8PWCIvD+14
         LJWg==
X-Gm-Message-State: APjAAAVq97IhDEv/IAG94xGHjB59vTPMegLNCMj2H6dtD4TmFoD0Yva7
        7x14wYx/Ad/HAdHIRS9OtfeYvv5l/Bg=
X-Google-Smtp-Source: APXvYqweKb5bV7c8rkdfNVcdtKvEIoa+B/O5ZWVJZRBVYDhzOHtQrAsM+GDYufA/X/HCqPJpnU/FAQ==
X-Received: by 2002:a2e:9d0f:: with SMTP id t15mr577901lji.171.1578619726866;
        Thu, 09 Jan 2020 17:28:46 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id x13sm196059lfe.48.2020.01.09.17.28.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 17:28:46 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id l18so234257lfc.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2020 17:28:46 -0800 (PST)
X-Received: by 2002:a19:c0b:: with SMTP id 11mr427248lfm.135.1578619725775;
 Thu, 09 Jan 2020 17:28:45 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj5U-TxqbPJiRRbyMHON21sht75q3nisvwvKrO+Bf=n8ng@mail.gmail.com>
 <20200108104459.qikjl4n2j5wkwslu@sirius.home.kraxel.org> <CAD=HUj7Y9x_cpWvKF-7oK_jcgKXfQxXe-198JbkCA=LyERvA4A@mail.gmail.com>
In-Reply-To: <CAD=HUj7Y9x_cpWvKF-7oK_jcgKXfQxXe-198JbkCA=LyERvA4A@mail.gmail.com>
From:   Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Thu, 9 Jan 2020 17:28:34 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=z_wCkN4nsAfnapp7sq0hUFfAEbtcnvdiZPHVwjfDL9g@mail.gmail.com>
Message-ID: <CAAfnVB=z_wCkN4nsAfnapp7sq0hUFfAEbtcnvdiZPHVwjfDL9g@mail.gmail.com>
Subject: Re: [virtio-dev][RFC PATCH v1 2/2] virtio-gpu: add the ability to
 export resources
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, virtio-dev@lists.oasis-open.org,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I like the idea of having one central place in the kernel where
virtio-devices get their uuid from -- i.e, no separate VM specific,
device specific implementations calling into uuid_gen().

On Wed, Jan 8, 2020 at 3:20 AM David Stevens <stevensd@chromium.org> wrote:
>
> > Is there a specific reason why you want the host pick the uuid?  I would
> > let the guest define the uuid, i.e. move the uuid fields to
> > virtio_gpu_export_resource and scratch virtio_gpu_resp_export_resource.
>
> Sending the uuid in the original request doesn't really buy us
> anything, at least in terms of asynchronicity. The guest would still
> need to wait for the response to arrive before it could safely pass
> the uuid to any other virtio devices, to prevent a race where the
> import fails because it is processed before virtio-gpu processes the
> export. Perhaps this wouldn't be the case if we supported sharing
> fences between virtio devices, but even then, fences are more of a
> thing for the operation of a pipeline, not for the setup of a
> pipeline.
>
> At that point, I think it's just a matter of aesthetics. I lean
> slightly towards returning the uuid from the host, since that rules
> out any implementation with the aforementioned race. That being said,
> if there are any specific reasons or preferences to assigning the uuid
> from the guest, I can switch to that direction.
>
> -David
