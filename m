Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E52188C03
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 18:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgCQR30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 13:29:26 -0400
Received: from ns.lynxeye.de ([87.118.118.114]:33044 "EHLO lynxeye.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726386AbgCQR30 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 13:29:26 -0400
X-Greylist: delayed 500 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Mar 2020 13:29:25 EDT
Received: by lynxeye.de (Postfix, from userid 501)
        id D2D43E74222; Tue, 17 Mar 2020 18:21:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham version=3.3.1
Received: from antimon.fritz.box (a89-183-68-130.net-htp.de [89.183.68.130])
        by lynxeye.de (Postfix) with ESMTPSA id A68C0E741C4;
        Tue, 17 Mar 2020 18:21:02 +0100 (CET)
Message-ID: <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
From:   Lucas Stach <dev@lynxeye.de>
To:     Jacob Lifshay <programmerjake@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Date:   Tue, 17 Mar 2020 18:21:02 +0100
In-Reply-To: <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
         <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
         <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
         <20200316102034.GA30883@pendragon.ideasonboard.com>
         <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
         <20200316211502.GW4732@pendragon.ideasonboard.com>
         <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
         <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
         <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, den 17.03.2020, 10:12 -0700 schrieb Jacob Lifshay:
> One related issue with explicit sync using sync_file is that combined
> CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> rendering in userspace (like llvmpipe but for Vulkan and with extra
> instructions for GPU tasks) but need to synchronize with other
> drivers/processes is that there should be some way to create an
> explicit fence/semaphore from userspace and later signal it. This
> seems to conflict with the requirement for a sync_file to complete in
> finite time, since the user process could be stopped or killed.
> 
> Any ideas?

Finite just means "not infinite". If you stop the process that's doing
part of the pipeline processing you block the pipeline, you get to keep
the pieces in that case. That's one of the issues with implicit sync
that explicit may solve: a single client taking way too much time to
render something can block the whole pipeline up until the display
flip. With explicit sync the compositor can just decide to use the last
client buffer if the latest buffer isn't ready by some deadline.

With regard to the process getting killed: whatever you sync primitive
is, you need to make sure to signal the fence (possibly with an error
condition set) when you are not going to make progress anymore. So
whatever your means to creating the sync_fd from your software renderer
is, it needs to signal any outstanding fences on the sync_fd when the
fd is closed.

Regards,
Lucas

