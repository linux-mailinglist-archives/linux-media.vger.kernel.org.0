Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB11E36F280
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 00:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhD2WQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 18:16:11 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:49422 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhD2WQJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 18:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619734382; bh=fqVkx3TPT2hzWCKBQXOQPX3j7Tp/i9ftQf4QckfR9jw=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=TfgP1zmnQpIeBk4GhCUEnowGIWyTg+lHHP7BB5dE2DLN2tzaz8NjNu64VRoRL0Wn/
         2f8ivAXa+3rYeOdJ6HB/3WOjbZzv33N7lpuPXFlByo91axybr8YpKJXEHBHOdh5Ij5
         fRx8BXz0KOA4rXosl/47xJmJsuKpFI1EckrC/wgU=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 30 Apr 2021 00:13:01 +0200 (CEST)
X-EA-Auth: FGh2PRfjIk7MPz+rAvHCky0S4v4blJapa6WZTmW7IuCPXm1pW1kq24GIKw0REpzL7qNl0raovijQQu6jMgDT+5ScuxVTW+CF
Date:   Fri, 30 Apr 2021 03:42:58 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: code clean up confirmation => staging: media: atomisp: pci driver
Message-ID: <YIsvamW5HT+PkJMB@dU2104>
References: <YIrfVFhW8ufjm/tB@192.168.1.8>
 <YIrmwYeSU0Clt7U4@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrmwYeSU0Clt7U4@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 07:02:57PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 29, 2021 at 10:01:16PM +0530, Deepak R Varma wrote:
> > Hello All,
> > Is anyone already working on code clean up of the following driver
> > /files? I am specifically targeting addressing the checkpatch
> > complaints. Let me know.
> > 
> > 	drivers/staging/media/atomisp/pci
> 
> There's no need to ask, just do the work and submit the patches.
> 
> We do not "claim" work ahead of time in the kernel, that is what has
> killed other open source projects numerous times in the past.  We know
> to learn from other's mistakes. :)
> 
Hello Greg,
Thank you for the guidance. Just wanted to make sure I am not overstepping on someone else's
work. I will go ahead and work on the clean up.

Thank you,
deepak.

> thanks,
> 
> greg k-h


