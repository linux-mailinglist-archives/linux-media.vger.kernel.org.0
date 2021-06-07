Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A8639D8BA
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 11:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhFGJ3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 05:29:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230127AbhFGJ3C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 05:29:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 071B0610A1;
        Mon,  7 Jun 2021 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623058018;
        bh=KO0ay+dCHrHSAS+hWho1t9DunNnSg9fCilCENS/YlGY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xSiXwKh2uEcA4kRyocx12eHOiLKq9ex6vWlSVdnwoJ3zVlSwFTcmKpTIkxw0NaUvB
         WgLt8gltSvMKLEHrGDPWcJnFCPqXNjdOqFQrGE8RLtpv+bgP1uYwgckvfDrUmq+fNP
         2lfaonnQQaWLcwfelFZSTomMe2B8d8VaLpNrtiCU=
Date:   Mon, 7 Jun 2021 11:26:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Yanchao <yangyanchao6@huawei.com>
Cc:     dan.carpenter@oracle.com, linux-distros@vs.openwall.org,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        mchehab@kernel.org, security@kernel.org
Subject: Re: [PATCH] media firewire firedtv-avc fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <YL3mYOYx2tf729o4@kroah.com>
References: <20210607073900.1298-1-yangyanchao6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607073900.1298-1-yangyanchao6@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 07, 2021 at 03:39:00PM +0800, Yang Yanchao wrote:
> For CVE-2021-3542:

What does that mean?  We don't know what cve numbers refer to as there
is no way to really track and update the information with them.  Please
spell out the issue please.

> 
> 1???read_pos will be added four times in the patch, 
> so use "read_pos + 4 < length" and write_pos as well

what is "???" here?

> 
> 2. The last four bits of c->operand are used for CRC, 
> so "sizeof (C - > operand) - 4" is used
> 
> 3. "read_pos+=2" is added after the end of read_pos, so add value (read_pos >= length)
> 
> 4. In order to avoid memcpy crossing the boundary, es_ info_ length > length - read_ pos
> 
> 5. When the date_length is a specific input of a construction,it will cause memcpy
>  to exceed the boundary, "(MSG - > MSG [3] & 0x7F) + date_ length) > (sizeof(msg->msg) - 4)"

I do not understand, this is saying what you did, not _why_ you did it.
can you please rework this to make it more obvious what you are doing?

And shouldn't this be more than one patch?  A series of patches, each
fixing one thing?

And no need to put security@kernel.org on this now that you have sent it
to a public mailing list.

thanks,

greg k-h
