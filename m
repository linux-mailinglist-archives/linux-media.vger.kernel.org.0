Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8857E37A3
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbjKGJVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233809AbjKGJVw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:21:52 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D964C6
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1699348905; bh=DfZgY5MeLmIEPxqihXEhQ7v88uuQryp2R29j6Iiu45o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fuGFmLUgynMp8HJRedB57e3aaFPfoDb1OPTgeC59qHJKCsDf4YX6jSzFKze7VvcQS
         olhRGknOdwbe4pDj5J8T9i+pb6aDIQxa+Pa9pWUDVDPkcrg16+ybyap4fGOYQPoYc/
         UwMsq147qOrDxX4ZXSEDkUhXy+fNOnxON/3WdiAbiX8W0a3ZiGpJXVtrfnc3SWosSh
         Mc1O/XMZdAGixlG1xkd45kM7pd8kfVTBlAccF1RBna6YRiPgoMyYoQVNt+IER/45MR
         XOx7Pyp6toP7GD4uPak0q2E6moJihsFXs7tLNUqkb851DkSHiXeMJneU0pYu78WGqm
         0F3VuH3Z2ZCYw==
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AAC021000CE; Tue,  7 Nov 2023 09:21:45 +0000 (GMT)
Date:   Tue, 7 Nov 2023 09:21:45 +0000
From:   Sean Young <sean@mess.org>
To:     Vince Ricosti <vricosti@outlook.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: How to contribute to ir-keytable/ir-ctl ?
Message-ID: <ZUoBqdOH6CePi1B2@gofer.mess.org>
References: <BL3PR19MB6514010EDD5F1CA2F95E1F5CD3ABA@BL3PR19MB6514.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR19MB6514010EDD5F1CA2F95E1F5CD3ABA@BL3PR19MB6514.namprd19.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Vince,

On Sun, Nov 05, 2023 at 08:23:04PM +0000, Vince Ricosti wrote:
> Hello,
> I would like to contribute to the infrared source code and learn the procedure for submitting patches.
> My first patch is of the utmost importance :-) because here is a dump of ir-keytable output:
> 
> Found /sys/class/rc/rc0/ with:
> 	Name: gpio_ir_recv
> 	Driver: gpio_ir_recv
> 	Default keymap: rc-rc6-mce
> 	Input device: /dev/input/event0
> 	LIRC device: /dev/lirc1
> 	Attached BPF protocols: Operation non permise
> 	Supported kernel protocols: lirc rc-5 rc-5-sz jvc sony nec sanyo mce_kbd rc-6 sharp xmp imon
> 	Enabled kernel protocols: lirc sony
> 	bus: 25, vendor/product: 0001:0001, version: 0x0100
> 	Repeat delay = 500 ms, repeat period = 125 ms
> 
> And what annoys me if the fact that the last line does not respect the key: value syntax because 
> we have 
> 
> Repeat delay = 500 ms, repeat period = 125 ms 
> instead of 
> Repeat delay: 500 ms, repeat period: 125 ms
> 
> and because of this I cannot even write a simple python script to analyse this output without writing some ugly code
> to handle this last line.
> So my first patch would be:
> 
> Signed-off-by: Vince Ricosti <vricosti@outlook.com>
> ---
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index 3d5a3c51..62f4531e 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -1702,7 +1702,7 @@ static int get_rate(int fd, unsigned int *delay, unsigned int *period)
>         }
>         *delay = rep[0];
>         *period = rep[1];
> -       printf(_("Repeat delay = %d ms, repeat period = %d ms\n"), *delay, *period);
> +      printf(_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);


Your patch got mangled by your email client and does not work, see

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Secondly there are translations of this line which need updating.

However, I have fixed the patch and applied it:

https://git.linuxtv.org/v4l-utils.git/commit/?id=fcf62ab17d69bc9ddb59e8d0ee7a8b56d9eba336

Please next time make sure your patch is emailed correctly.

Thanks,

Sean
