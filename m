Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A213EB300
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 10:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239571AbhHMIzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 04:55:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:35071 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239291AbhHMIzD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 04:55:03 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 42822C63A5; Fri, 13 Aug 2021 09:54:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1628844876; bh=YC6OzmHLK5k/oDScH3ZzYqVPQj0movnxnqCcgEsZ2Ks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f3+hcocwBG8SN0ibx3zhZTxZrEL+NljGW6PHD/Q4dMCC9yi2mpqqPRia+wXcVzJOU
         3RF81NzZ+Bg2EbnQUgsJ2zXAEaf2nAuPHxieFe12y0YTp8efF2KOmPm9QBgjB0bd1W
         8COXjQk6OsYoiWJRWtEi4tBAmu1QDDR94hU194Byj5lQNjFtaTQ5j2tBgrTWRN0avT
         dBgVOcaQxOzVnqsOGm4d06GpFNBQakg9EEMDFVpLvqlJyk1UuEL1qXb9wOBHe1CG/H
         7YNL1ZTnTDvty2xBEtFov++Sv/5ZKmGWPPd7b+PBlDUk5oNZbq71Dxmd85qgpjSKhq
         kkaE6ivVjw/Aw==
Date:   Fri, 13 Aug 2021 09:54:36 +0100
From:   Sean Young <sean@mess.org>
To:     Andrew Goff <goffa72@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Sony PlayTV Dual Tuner- dvb_usb_dib0700
Message-ID: <20210813085435.GA28634@gofer.mess.org>
References: <CAAUSrfF4Wks0TTe=G+uSoksagSo_+S67JAsWJS1PGzvkS3DPmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAUSrfF4Wks0TTe=G+uSoksagSo_+S67JAsWJS1PGzvkS3DPmQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrew,

On Fri, Aug 13, 2021 at 10:21:04AM +1000, Andrew Goff wrote:
> Hi, I hope this is the right place for posting this.
> 
> I have the above TV tuner / capture device which has been working well
> in Ubuntu 16.04. I've decided to update the OS to Ubuntu 20.04 with a
> fresh install on a different disk and haven't been able to get this
> device working.
> 
> Ubuntu 21.04, 18.04 have also been tested with the same results. On a
> fresh install of 16.04 this device works well.
> 
> It seems something has changed between 16.04 (kernel 4.15.0-142) and
> 18.04 (kernel 5.4.0-42).
> 
> In /etc/modprobe.d/dvb.conf
> # Sony Play TV
> options dvb-usb-dib0700 adapter_nr=5,6 force_lna_activation=1
> 
> This has been tested with different variations of the above without success.
> 
> When using w_scan with a file manager open I've noticed if scanning
> adapter6 I could see the folder named adapter5 disappear. I then
> opened up the adapter6 folder and two of the four files had
> disappeared. When the scan finished the files/folder reappeared,
> however the device then became unusable.
> 
> 'modinfo dvb_usb_dib0700 | grep depends' yields the following
> 
> For Ubuntu 18.04
> depends:
> dib7000m,dib9000,dibx000_common,dvb-usb,dib0090,dib0070,dib3000mc,rc-core
> 
> For Ubuntu 16.04
> depends:        dib7000m,dvb-usb,dib0090,dib0070,dib3000mc,rc-core
> 
> So something has changed in the driver?
> 
> Please let me know if any further information is required to help fix this.

This does sound like a regression, but we'll have to figure out what
caused this. First of all, is there any output in dmesg when the device
does not work?

Secondly, the best way to track this down is using bisection. Is this
something you could do? This would be enormously helpful.

https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html

Thanks,

Sean
