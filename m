Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CDE257CE
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 20:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729292AbfEUSxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 14:53:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49376 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbfEUSxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 14:53:42 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E2650261254;
        Tue, 21 May 2019 19:53:39 +0100 (BST)
Date:   Tue, 21 May 2019 20:53:37 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, ezequiel.garcia@collabora.com,
        andrealmeid@collabora.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vimc: fix component match compare
Message-ID: <20190521205337.7fbe3139@collabora.com>
In-Reply-To: <5f51eb6be411ae9afb08a9b315fe51e754dc0077.camel@collabora.com>
References: <20190517172011.13257-1-helen.koike@collabora.com>
        <20190521145548.27844fa6@collabora.com>
        <5f51eb6be411ae9afb08a9b315fe51e754dc0077.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 21 May 2019 15:39:00 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> On Tue, 2019-05-21 at 14:55 +0200, Boris Brezillon wrote:
> > On Fri, 17 May 2019 14:20:11 -0300
> > Helen Koike <helen.koike@collabora.com> wrote:
> >   
> > > If the system has other devices being registered in the component
> > > framework, the compare function will be called with a device that
> > > doesn't belong to vimc.
> > > This device is not necessarily a platform_device, nor have a
> > > platform_data (which causes a NULL pointer dereference error) and if it
> > > does have a pdata, it is not necessarily type of struct vimc_platform_data.
> > > So casting to any of these types is wrong.
> > > 
> > > Instead of expecting a given pdev with a given pdata, just expect for
> > > the device it self. vimc-core is the one who creates them, we know in
> > > advance exactly which object to expect in the match.
> > > 
> > > Fixes: 4a29b7090749 ("[media] vimc: Subdevices as modules")  
> > 
> > Oh, and you forgot to add
> > 
> > Cc: <stable@vger.kernel.org>
> >   
> 
> Although it's not really documented (not in process/stable-rules
> at least) that a "Fixes" tag alone would be automatically picked by
> the stable team, it has been the case for me since always,
> as I've never Cced stable explicitly.
> 

It's probably the case thanks to Sascha's auto-select tool, but I do
think it's better to be explicit about what you want: there are some
cases where a patch fixes a bug, but the user doesn't want this patch
to be backported because it's not been tested or older kernels, is too
complex to be backported as is or is not important enough (typos).
