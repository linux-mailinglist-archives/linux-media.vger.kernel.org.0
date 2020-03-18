Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2477A189D60
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgCRNyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:54:11 -0400
Received: from mail-qv1-f50.google.com ([209.85.219.50]:38222 "EHLO
        mail-qv1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgCRNyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:54:10 -0400
Received: by mail-qv1-f50.google.com with SMTP id p60so12880229qva.5
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0vAK6bgP1fJk3zBsCQu8c0nozdF7vV0PFML1GwgRVhY=;
        b=olu0AYnQdt38yfSM/uRMmwlq7V45qWh0JqyEUbyuygUPtzABU7albZvdxuE+nxxtiD
         pL0b/kF03f7TghMHoycWrMrkSwTOVr9YN7W8uf2Er2ZmoQsNODQMYvN03EjRI8LH7fvG
         DaoCFnA+OUFiFft81i2QtjDkgMBllQN57Ll+1PE9DB3s/R95U56ZGrbVMOkmA2suCttS
         dC6/7qhB9kOjoxqdBVEBeZF7J5RPt8JmJxKDH2i1PfZEoYQvsifCx8rlDVOoFAHJ8w8q
         9dG26ALcFxvW+Obnrbo9vggQzPsfz59AEpEq5pdwQ57NfC/sKA+KX8IboYFL49gtUGVF
         3bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0vAK6bgP1fJk3zBsCQu8c0nozdF7vV0PFML1GwgRVhY=;
        b=B9IC6SBapZ64vSoPyShgddIkAdHxtwH7+EfoTVyM/uXGG3Iwrkgz5omUyuNPoKU/Lc
         95me4tq0jlTTKMXwtwwRb9GRKAkOzyHJY7ccaN6MrQWEiWcADubhjJwl9RYf4UFkxKTn
         S39CxYAoWGKpS62jLkqa9VczeVkcvnCD2F6/kROErLMdo6AnDFoZ2WxFa+5ORHj6WMso
         a4XNO6IKpQ4sogr1ry0DVVGWXEhHRyQfUbfY6mT1YQ544CrS8NmZpaR18NPwT2WNEszT
         oieimIlX4eI7UrZszP6ywXNOy9N1Z5n+htoK+u+UWYCjvcdzbKYNm09g8lNMb4M3mzVm
         6WCg==
X-Gm-Message-State: ANhLgQ0X1a0XWOYQv2BL+vTi72Ep6pkK9m5Ge/OKOQTQpNP8fuA77pxl
        J48NXCX39Agwv8WLu4hWEl2kFQ==
X-Google-Smtp-Source: ADFU+vvl5wY5Nwjh++sNYGXAhGqQmb8F+Dg5/kLkl/TkBDgPXSBvyT6A5zAaMj45MijllChuvIFwIg==
X-Received: by 2002:a0c:c344:: with SMTP id j4mr4384963qvi.51.1584539648117;
        Wed, 18 Mar 2020 06:54:08 -0700 (PDT)
Received: from skullcanyon (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id y13sm1221167qtk.6.2020.03.18.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 06:54:07 -0700 (PDT)
Message-ID: <133fd2afd3b5add0f376b73f0f70b369b418a34d.camel@ndufresne.ca>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Lucas Stach <dev@lynxeye.de>,
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:54:05 -0400
In-Reply-To: <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
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
         <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 18 mars 2020 à 11:05 +0100, Michel Dänzer a écrit :
> On 2020-03-17 6:21 p.m., Lucas Stach wrote:
> > That's one of the issues with implicit sync that explicit may solve: 
> > a single client taking way too much time to render something can 
> > block the whole pipeline up until the display flip. With explicit 
> > sync the compositor can just decide to use the last client buffer if 
> > the latest buffer isn't ready by some deadline.
> 
> FWIW, the compositor can do this with implicit sync as well, by polling
> a dma-buf fd for the buffer. (Currently, it has to poll for writable,
> because waiting for the exclusive fence only isn't enough with amdgpu)

That is very interesting, thanks for sharing, could allow fixing some
issues in userspace for backward compatibility.

thanks,
Nicolas

