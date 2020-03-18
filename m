Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE501898DD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 11:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgCRKF4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 06:05:56 -0400
Received: from mail.netline.ch ([148.251.143.178]:44238 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCRKF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 06:05:56 -0400
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 416DB2A6042;
        Wed, 18 Mar 2020 11:05:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 7baWg25bZC3q; Wed, 18 Mar 2020 11:05:53 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch [83.76.80.252])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 5D8952A6016;
        Wed, 18 Mar 2020 11:05:52 +0100 (CET)
Received: from localhost ([::1])
        by thor with esmtp (Exim 4.93)
        (envelope-from <michel@daenzer.net>)
        id 1jEVaA-000mQl-Gg; Wed, 18 Mar 2020 11:05:50 +0100
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To:     Lucas Stach <dev@lynxeye.de>,
        Jacob Lifshay <programmerjake@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>, linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
Date:   Wed, 18 Mar 2020 11:05:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-03-17 6:21 p.m., Lucas Stach wrote:
> That's one of the issues with implicit sync that explicit may solve: 
> a single client taking way too much time to render something can 
> block the whole pipeline up until the display flip. With explicit 
> sync the compositor can just decide to use the last client buffer if 
> the latest buffer isn't ready by some deadline.

FWIW, the compositor can do this with implicit sync as well, by polling
a dma-buf fd for the buffer. (Currently, it has to poll for writable,
because waiting for the exclusive fence only isn't enough with amdgpu)


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
