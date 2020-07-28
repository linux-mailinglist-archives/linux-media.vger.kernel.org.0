Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9A323103E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 18:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbgG1Q62 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 12:58:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731673AbgG1Q62 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 12:58:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DD502053B;
        Tue, 28 Jul 2020 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595955507;
        bh=eCkMT76O+xXbROm2ziLq2LEQ8IQGqoTiQPmsQE6GmSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RkLeWrMSP5SsQvlOglsFMOpx8DwH3ZewI0sb7ElO/NMoScbkZX3y6q6IpQ+9ai7HG
         MBuCCak3t9e8fWWzHEB2gMXerpDKrbJQ5WopWlPs6dohvcwOqzaptEonYk9ztUSE98
         0kMKtn5+ytWk3Z4IQj6LDv1JzAxyuvwAJFqe8ijw=
Date:   Tue, 28 Jul 2020 18:58:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Cc:     devel@driverdev.osuosl.org, arnd@arndb.de,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        stern@rowland.harvard.edu, jrdr.linux@gmail.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: usbvision: fixed coding style
Message-ID: <20200728165820.GA42656@kroah.com>
References: <20200728143004.3228-1-dhiraj.sharma0024@gmail.com>
 <20200728145419.GA3537020@kroah.com>
 <CAPRy4h1Xs1JpQinnWm04dOi07Ch0RLL0U4Z5DDCKHmombXE0sA@mail.gmail.com>
 <20200728155311.GA4178776@kroah.com>
 <CAPRy4h2Zbw=QwJ7=0+FzGnK_o1esn2GTRSuv5ZE30Vu=Oj=x=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPRy4h2Zbw=QwJ7=0+FzGnK_o1esn2GTRSuv5ZE30Vu=Oj=x=Q@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 10:13:22PM +0530, Dhiraj Sharma wrote:
> > As the bot said, only do one type of thing per patch, and "fix all
> > checkpatch errors/warnings" is not one type of thing.
> 
> So should I send a fresh patch with minimal fixes? instead of replying
> to this mail with [PATCH 01]

Why are you ignoring what Hans said?
