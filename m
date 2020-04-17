Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794CC1AD8AF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 10:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgDQIfJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 04:35:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729747AbgDQIfJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 04:35:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E7F32137B;
        Fri, 17 Apr 2020 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587112509;
        bh=yusZIU8mnWR2xm+iXYWk1S59cU56InGPz/fLvOeZP2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGjscELBkH1BA17qa3XYHeYAu0h3Za6/uxMsCdQyZ5JB1TbOgYXei5YT+CiRmINN6
         dEwsSG45FEIUgpNpva8absThIDUhh3sfHbpuq+1cgUj4/a5rl+Nd65DhIpthEpNaZ9
         DR0yv6JsIa3O1ASJ1Bk9lya4MhrhjcT7ElIjvSe4=
Date:   Fri, 17 Apr 2020 10:35:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     sy0816.kang@samsung.com
Cc:     mchehab@kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Message-ID: <20200417083506.GB141762@kroah.com>
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
 <20200417024543.66785-1-sy0816.kang@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417024543.66785-1-sy0816.kang@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 17, 2020 at 11:45:23AM +0900, sy0816.kang@samsung.com wrote:
> From: Sunyoung Kang <sy0816.kang@samsung.com>
> 
> get_v4l2_buffer32() didn't copy reserved2 field from userspace to driver.
> So the reserved2 value is not received through compat-ioctl32 in driver.
> This patch copy reserved2 field of v4l2_buffer in get_v4l2_buffer32().
> 
> Signed-off-by: Sunyoung Kang <sy0816.kang@samsung.com>
> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
>  1 file changed, 1 insertion(+)

What driver is using the reserved fields?  They should be ignored as
they are "reserved" for future use.

thanks,

greg k-h
