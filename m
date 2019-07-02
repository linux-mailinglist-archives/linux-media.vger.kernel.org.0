Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57865C884
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 06:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbfGBEpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 00:45:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbfGBEpN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 00:45:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C37C208C4;
        Tue,  2 Jul 2019 04:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562042712;
        bh=lunJ5ArWLZ84yTtueXiUgem+AurRPkxM5hPG6eVwWvk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qBv31N9aHe3jPJ/SugXen2HmP70soq24SBrAE+gAXjmsRXIsLBMigwndtFWCgvb4h
         ZiGqxBOCdKGrmX0a87f1eoc5dJ6l3l0vm8uxyHxC+N24hvWrvZtH97rsFHTILzmGLp
         U06V1Qo2K+bA+JOWCegq1QFJx5Ln3SubjWnZqr98=
Date:   Tue, 2 Jul 2019 06:45:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com, keescook@chromium.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Analyze syzbot report
 technisat_usb2_rc_query KASAN
Message-ID: <20190702044510.GA1045@kroah.com>
References: <ede75d50-7475-3478-b30f-ef9077b6bf48@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ede75d50-7475-3478-b30f-ef9077b6bf48@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 02, 2019 at 07:49:26AM +0700, Phong Tran wrote:
> Hello,
> 
> I did a checking for this report of syzbot [1]
> From the call stack of dump log:
> 
> There shows that a problem within technisat_usb2_get_ir()
> 
> BUG: KASAN: slab-out-of-bounds in technisat_usb2_get_ir
> drivers/media/usb/dvb-usb/technisat-usb2.c:664 [inline]
> BUG: KASAN: slab-out-of-bounds in technisat_usb2_rc_query+0x5fa/0x660
> drivers/media/usb/dvb-usb/technisat-usb2.c:679
> Read of size 1 at addr ffff8880a8791ea8 by task kworker/0:1/12
> 
> Take a look into while loop in technisat_usb2_get_ir().
> I recognized that a problem. The loop will not break out with the condition
> doesn't reach. Then "b++" will go wrong and buffer will be overflow.
> 
> while (1) {
> [...]
> 	b++;
> 	if (*b == 0xff) {
> 		ev.pulse = 0;
> 		ev.duration = 888888*2;
> 		ir_raw_event_store(d->rc_dev, &ev);
> 		break;
> 	}
> }
> 
> I would propose changing the loop condition by checking the address of the
> buffer. If acceptable, I will send this patch to the mailing-list.
> eg:
> 
> -       while (1) {
> +       while (b != (buf + 63)) {
> [...]
> }
> 
> Tested with syzbot, result is good [2].
> 
> [1] https://syzkaller.appspot.com/bug?extid=eaaaf38a95427be88f4b
> [2] https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ

Great, can you submit a patch for this?

thanks,

greg k-h
