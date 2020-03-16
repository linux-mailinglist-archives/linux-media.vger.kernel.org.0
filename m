Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F66186C25
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 14:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731341AbgCPNe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 09:34:28 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:35133 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731330AbgCPNe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 09:34:28 -0400
Received: by mail-ua1-f54.google.com with SMTP id y6so6509537ual.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yy099JAom5bAbi8Qbz1H+SJ7UdGj0QTEMi6J4hlPQso=;
        b=vBsyAJxjpSOP1wsnL4B+EtfS+VM+CLDQD1WIcpkioapzNrnXbsmNLyamLKgabMHPYo
         VNEI1U1be4bV4FE97MznPlVZx+phJGKihntwX3anPbZXUOBrQ1QSRQP5DMHNRKV6nkra
         EalNDU2L/jkRt5Mg9iKARKK8ODh8R3c47dQATNPCFBbi1bS4E2U7VieklDUsmDOSOktd
         FKRABcyVkbu67IRyoPmMATgR/K3fDvsByo3ykqM/PWP4d5478XR7+jUq0NVhBU0qB+RZ
         eWyOPNNJd1YOnrnA3NWsH4LEIjgW+JpQ8xhgkraGMMfjFWvRBB0d8aSV3TDPEPRuWrGP
         uvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yy099JAom5bAbi8Qbz1H+SJ7UdGj0QTEMi6J4hlPQso=;
        b=GW3bZTxI+8eKMWzSwPH07QCZ4tt6c14jkW0aFlU8iocTidPKGD7O8ICy9nIpexEQ6y
         QlmvEM4BjY5YiDXzwMIWYL2ERzVm9YyAZLQcukYZI5L90wc3Xqz6f6sWCevGeBpBh+HV
         6cQ6SZ9pbvJoD/anE3HY5dhFr/X8vw7u/qi9ZO+VEU8nqkE+ipsT6vVoazAB0POuWgdF
         cexRS6d1uiQ1mDxvsdq9IJdUDfaz5e4O+TY3dPNduNgrcp/83Tp15myPdtZIzNFMtSpJ
         v4uU6YR4P2UIJWUH7u/GXjCrDjnS78sanlYMaSg63z5JCduFW5vJiTmibxFFX+tjmdGp
         eogQ==
X-Gm-Message-State: ANhLgQ1o5Dl7BGjUaCIh3sZsaB6ts/PU1gRT5pNBx9o+gnnkYVpheQD2
        +JAGwghY/E0cwMV6wOvjOzl52Z9wwKDyqertVJo=
X-Google-Smtp-Source: ADFU+vsbKICcgyfr3v1DAw3IM9hKto3Koagz9JoDk44cGcHvl/eNriZb1K4uO2t6bD/NRmhqOi3v7EyzxLJEd9fdWQM=
X-Received: by 2002:ab0:67:: with SMTP id 94mr1431640uai.139.1584365665520;
 Mon, 16 Mar 2020 06:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <20200316130125.GK4732@pendragon.ideasonboard.com>
In-Reply-To: <20200316130125.GK4732@pendragon.ideasonboard.com>
From:   Tomek Bury <tomek.bury@gmail.com>
Date:   Mon, 16 Mar 2020 13:34:14 +0000
Message-ID: <CAO1ALzkOuPPozGcpAikD+cUiAb+JGQxPJ=QekdH+g++qKFqtEQ@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Daniel Stone <daniel@fooishbar.org>,
        Dave Airlie <airlied@gmail.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>  As long as we can fall back to not using fences then we should be fine.
Buffers written by the camera are trivial because you control what
happens - just don't attach fence, so that the capture can be used
immediately. For recycled buffers there's an extra bit of work to do
because won't  be up to camera driver to decide whether the buffer
comes back with or without fence.
