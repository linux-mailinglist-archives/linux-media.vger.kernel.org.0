Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13077442C4A
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhKBLQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhKBLQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 07:16:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9031FC061714;
        Tue,  2 Nov 2021 04:13:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A8893E5;
        Tue,  2 Nov 2021 12:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635851629;
        bh=71N2eC5dUKw2NHOd3V5hwlSgCE/kXf9Op4f4I1cXdTQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ts/F/JEYUlF4+RwmmfKBRmCJgeQ6pmbvj2jRBeJ9606eBvAlKklSaHKjmpFwBS5pi
         uCkuvhpm7ryTDhTeorv1Pvnuw0vQ9sRwlepU2rI1o00XVKgnMoDWf6rTNd81yFfhAs
         AW0f+Z7gpIP71tZZSi6O6R2GZq3qcQCV2UJY4k9U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f91c4f16-fd81-5d70-0146-e9aa2d128da9@cogentembedded.com>
References: <20210926155356.23861-1-nikita.yoush@cogentembedded.com> <163455832550.1371157.18009256492359430197@Monstersaurus> <f91c4f16-fd81-5d70-0146-e9aa2d128da9@cogentembedded.com>
Subject: Re: [PATCH] media: vsp1: mask interrupts before enabling
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Date:   Tue, 02 Nov 2021 11:13:47 +0000
Message-ID: <163585162705.1097798.16604551366893944884@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Nikita Yushchenko (2021-10-20 18:45:50)
> Hi,
>=20
> > Could you test to see if those lines to explicitly set VI6_DISP_IRQ_ENB
> > and VI6_WPF_IRQ_ENB are really needed in your use case please?
>=20
> Commenting out those register writes causes
>=20
> [    2.275137][    C0] irq 188: nobody cared (try booting with the "irqpo=
ll" option)
> [    2.282621][    C0] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-r=
c5 #28

Ok, so something has clearly caused these to get set, and the reset has
not cleared them.

I think I would rather see the code to reset them done in
vsp1_reset_wpf(), rather than in probe directly as that is what we are
doing, and is I believe already in the call path.

This should be with a comment stating explicitly that we are manually
resetting VI6_DISP_IRQ_ENB as the reset does not always clear these
bits.

(But I'm reallly ... reallly concerned that the hardware is not really
getting reset when it should, and that might merit some further
investigation).

Requesting the devm_request_irq() /after/ initialising the hardware is
certainly a good thing though.

--
Kieran



> [    2.289669][    C0] Hardware name: Renesas H3ULCB Kingfisher board bas=
ed on r8a77951 (DT)
> [    2.297844][    C0] Call trace:
> [    2.300981][    C0]  dump_backtrace+0x0/0x198
> [    2.305348][    C0]  show_stack+0x1c/0x28
> [    2.309357][    C0]  dump_stack_lvl+0x64/0x7c
> [    2.313718][    C0]  dump_stack+0x14/0x2c
> [    2.317725][    C0]  __report_bad_irq+0x50/0xdc
> [    2.322254][    C0]  note_interrupt+0x2e4/0x330
> [    2.326786][    C0]  handle_irq_event_percpu+0x58/0x68
> [    2.331927][    C0]  handle_irq_event+0x4c/0x98
> [    2.336456][    C0]  handle_fasteoi_irq+0xd0/0x180
> [    2.341245][    C0]  handle_domain_irq+0x94/0xd8
> [    2.345862][    C0]  gic_handle_irq+0xa4/0xe0
> [    2.350216][    C0]  do_interrupt_handler+0x38/0x60
> [    2.355093][    C0]  el1_interrupt+0x2c/0x68
> [    2.359362][    C0]  el1h_64_irq_handler+0x14/0x20
> [    2.364151][    C0]  el1h_64_irq+0x74/0x78
> [    2.368244][    C0]  __do_softirq+0xc8/0x404
> [    2.372511][    C0]  irq_exit+0x118/0x140
> [    2.376521][    C0]  handle_domain_irq+0x98/0xd8
> [    2.381137][    C0]  gic_handle_irq+0xa4/0xe0
> [    2.385490][    C0]  call_on_irq_stack+0x28/0x3c
> [    2.390105][    C0]  do_interrupt_handler+0x54/0x60
> [    2.394981][    C0]  el1_interrupt+0x2c/0x68
> [    2.399247][    C0]  el1h_64_irq_handler+0x14/0x20
> [    2.404036][    C0]  el1h_64_irq+0x74/0x78
> [    2.408129][    C0]  _raw_spin_unlock_irqrestore+0x20/0x50
> [    2.413615][    C0]  __setup_irq+0x56c/0x888
> [    2.417882][    C0]  request_threaded_irq+0xf0/0x1a8
> [    2.422843][    C0]  devm_request_threaded_irq+0x84/0xf8
> [    2.428155][    C0]  vsp1_probe+0x218/0xb48
> [    2.432340][    C0]  platform_probe+0x6c/0xd8
> [    2.436700][    C0]  really_probe+0xc0/0x428
> [    2.440967][    C0]  __driver_probe_device+0x114/0x188
> [    2.446103][    C0]  driver_probe_device+0x44/0xe8
> [    2.450891][    C0]  __driver_attach+0xbc/0x1a0
> [    2.455419][    C0]  bus_for_each_dev+0x64/0xa0
> [    2.459947][    C0]  driver_attach+0x28/0x30
> [    2.464215][    C0]  bus_add_driver+0x144/0x228
> [    2.468743][    C0]  driver_register+0x68/0x118
> [    2.473272][    C0]  __platform_driver_register+0x2c/0x38
> [    2.478669][    C0]  vsp1_platform_driver_init+0x20/0x28
> [    2.483985][    C0]  do_one_initcall+0x38/0x258
> [    2.488513][    C0]  kernel_init_freeable+0x228/0x28c
> [    2.493565][    C0]  kernel_init+0x28/0x120
> [    2.497745][    C0]  ret_from_fork+0x10/0x20
> [    2.502013][    C0] handlers:
> [    2.504974][    C0] [<0000000040be598b>] vsp1_irq_handler
> [    2.510376][    C0] Disabling IRQ #188
>=20
> Nikita
