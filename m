Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689FC188BD2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 18:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgCQRNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 13:13:12 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:39167 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgCQRNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 13:13:12 -0400
Received: by mail-wm1-f51.google.com with SMTP id f7so94201wml.4
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Su6bTvSI/uU7/aAEfpDKY4ByqlZ4ySZDg4mKuzIyoAE=;
        b=onHCrxll/nBTTJXWMjj4/PxkzIPJwru6P7jcenE6RAK0O2s6WFLiMulYU5q5F8DB7b
         Td9pqzKXT8NlCsayUZBmhNrM4pNucB9f0XymBwM8+3HbRF2QY5uZpfszb+cLK+rzkQnL
         ZdUX3UUuuwUJAWeKUYMdN0ODoslYYRuSdNrio1/ktfXrVUdfoOJLUtfOU1g1jvapOFqq
         JixE4G1DXC9YW4v76V28+/kUrs8o2kb5elMeG/nBDRDKyE9LZ+xSTDce1aVGktT1C2o3
         vlAaj1MsFW4viS8TgYP+5uAnpx7ypZe4ALEF0ZYsUkS9r2GqH8EP+QoUVFyvwMcMeOmx
         wPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Su6bTvSI/uU7/aAEfpDKY4ByqlZ4ySZDg4mKuzIyoAE=;
        b=IomqMNBGYVGwyjo7gbPyrOZKWOWZmWYhKdizClPrpKgmpiZkBBgn6SBKqtTGijyxus
         Styc46mq6AuW7VOGFd/tl/IHT3DmawNl4BBeBKMC+HdtWx2RRQT/wEwT5OF4KNS1JraE
         MUYZX6xEjfn5y7wGDxeuMjsmGw/0dxe5lMQcZbfxwkh9hp/WdzMgdtTqAexd1OkTzY7+
         ps8OTfw4v94dRn3MffYzj+6NLD95yJXiAVo0mGJRE6f5ilpAxtqIr6M5BGk3IXWY/Zbb
         D1NzQNUvgHuT4b+gHMiHKPWBp46RkMSlb5uUrkWGmwSKkxlU09k/2oDRj2goC2sZM/zV
         AWRA==
X-Gm-Message-State: ANhLgQ2EBdRL8vWrMegwCoY+kDOa/3PTF1sOXqcuPpt2tQdPJekcGrXS
        B22SrmoKzu1HFQbSneUgMIzjqUGhxwAiGk4U/hc=
X-Google-Smtp-Source: ADFU+vvrlvW5Pq5+5jA2bzwrcnWqmMsg8VrMcvr00omZq98ezwQViP8P3jcUdWqESwzw3stGKMnxzrexhxAMx9DgvT0=
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr10908wmt.137.1584465189119;
 Tue, 17 Mar 2020 10:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com> <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
In-Reply-To: <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
From:   Jacob Lifshay <programmerjake@gmail.com>
Date:   Tue, 17 Mar 2020 10:12:57 -0700
Message-ID: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux ecosystem
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        linux-media@vger.kernel.org,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One related issue with explicit sync using sync_file is that combined
CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
rendering in userspace (like llvmpipe but for Vulkan and with extra
instructions for GPU tasks) but need to synchronize with other
drivers/processes is that there should be some way to create an
explicit fence/semaphore from userspace and later signal it. This
seems to conflict with the requirement for a sync_file to complete in
finite time, since the user process could be stopped or killed.

Any ideas?

Jacob Lifshay
