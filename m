Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5036736EE85
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 19:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240893AbhD2RDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 13:03:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240858AbhD2RDr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 13:03:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3819613ED;
        Thu, 29 Apr 2021 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619715780;
        bh=86ih1Pwmgv0YL5x9tywf55q61EjjUm4JVP9sqao1QdI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hV6N0ssirvcFMAC4nHeJ3RI7CHxhtr7a5qHAQOrRyb/zArTto/mbpT8EeExaeEnXR
         GzNuFWCxbWLrkkxQ2yNnqd4EKPzrgtJdt3hS5zb+yMQzFsxirhBzNb72a8J5rQduhh
         fON0mlhKvxGlVF8bM4UE0WmraBKNtG1UKLtZGqXs=
Date:   Thu, 29 Apr 2021 19:02:57 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: code clean up confirmation => staging: media: atomisp: pci driver
Message-ID: <YIrmwYeSU0Clt7U4@kroah.com>
References: <YIrfVFhW8ufjm/tB@192.168.1.8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrfVFhW8ufjm/tB@192.168.1.8>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 10:01:16PM +0530, Deepak R Varma wrote:
> Hello All,
> Is anyone already working on code clean up of the following driver
> /files? I am specifically targeting addressing the checkpatch
> complaints. Let me know.
> 
> 	drivers/staging/media/atomisp/pci

There's no need to ask, just do the work and submit the patches.

We do not "claim" work ahead of time in the kernel, that is what has
killed other open source projects numerous times in the past.  We know
to learn from other's mistakes. :)

thanks,

greg k-h
