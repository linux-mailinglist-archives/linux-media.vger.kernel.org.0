Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01DD834026D
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 10:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCRJtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 05:49:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:59959 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229921AbhCRJsh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 05:48:37 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 71B13C637B; Thu, 18 Mar 2021 09:48:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1616060916; bh=Pv/D43vWxdTxat2v/gFinn89BN7TufHcS6UDEcEt44U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kG264BoWnuKy/fR6VC4jyqDWbuIyhKrjNKP/1tbolhhKbD7D777YvVd3OY09h5JQc
         Ng1UP2GR88Kd7RlpR1ey5seI0IqcZ4R2OwoLNacdpOwOBAr75+MdrkQajz2+KFhTgn
         Niz5cl6QQqbo6RCDmKLKI7iScBxp1T5N5OAX+0cBl/xM4BspBWW2q9RnrpYXfVcY8s
         0FBVHrYnLR/HCnITrCo5GNBpxv2V1ZdwMG076T67GY7bQdFJr2ELftr5ta9rFbiLXM
         rFfzOG0+OReKwgvdLc+SBkFx15H7DLHRw05f8k0/sXVpsnR+9bK8nzSkO7y9YSf3Dm
         YviPNT5lCwdkw==
Date:   Thu, 18 Mar 2021 09:48:36 +0000
From:   Sean Young <sean@mess.org>
To:     Nikolaos Beredimas <beredim@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Revisiting ITE8708 on ASUS PN50 uses a 16 byte io region
Message-ID: <20210318094836.GA31678@gofer.mess.org>
References: <CAMbLOeCCwrfoGvaV4vWPfF7tHnE-b4sFUNmK8v=ekRZAtjA-4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMbLOeCCwrfoGvaV4vWPfF7tHnE-b4sFUNmK8v=ekRZAtjA-4w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikolaos,

On Wed, Mar 17, 2021 at 04:41:15PM +0200, Nikolaos Beredimas wrote:
> Hi,
> There was a thread on this list last September
> https://www.spinics.net/lists/linux-media/msg177724.html
> about the IR module on the ASUS PN50.
> 
> Even though that discussion never fully resolved,
> it did contain the solution to get the IR working on the PN50.
> I have documented this at
> https://forum.libreelec.tv/thread/23145-asus-pn50-challenge/?postID=152207#post152207
> 
> So, what I had to do is edit a single line of drivers/media/rc/ite-cir.h
> and change IT8708_IOREG_LENGTH 0x08 to IT8708_IOREG_LENGTH 0x10
> and the IR module is now recognized and working
> 
> How do I go about submitting this as a patch?
> I am a little overwhelmed honestly.
> Do I follow https://www.linuxtv.org/wiki/index.php/Development:_How_to_submit_patches
> ?
> And which git tree?

Thanks for fixing this. The patch should be a diff against
https://git.linuxtv.org/media_tree.git/

This is the guide for submitting patches:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html


> 
> --- a/drivers/media/rc/ite-cir.h
> +++ b/drivers/media/rc/ite-cir.h
> @@ -406,7 +406,7 @@
>  #define IT8708_C0WCR 0x06 /* wakeup code read/write register */
>  #define IT8708_C0WPS 0x07 /* wakeup power control/status register */
> 
> -#define IT8708_IOREG_LENGTH 0x08 /* length of register file */
> +#define IT8708_IOREG_LENGTH 0x10 /* length of register file */

I don't think this is correct though. There are other devices that have
length of 8; I think the correct solution.

I think:

        if (!pnp_port_valid(pdev, io_rsrc_no) ||
            pnp_port_len(pdev, io_rsrc_no) != dev_desc->io_region_size) {
                dev_err(&pdev->dev, "IR PNP Port not valid!\n");
                goto exit_free_dev_rdev;
        }


should be changed to:

        if (!pnp_port_valid(pdev, io_rsrc_no) ||
            pnp_port_len(pdev, io_rsrc_no) < dev_desc->io_region_size) {
                dev_err(&pdev->dev, "IR PNP Port not valid!\n");
                goto exit_free_dev_rdev;
        }

Thanks

> 
>  /* two more registers that are defined in the hacked driver, but can't be
>   * found in the data sheets; no idea what they are or how they are accessed,
