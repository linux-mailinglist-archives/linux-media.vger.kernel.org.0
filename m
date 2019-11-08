Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAF1F58DF
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 21:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfKHUtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 15:49:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:50594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbfKHUtx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 15:49:53 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D1052085B;
        Fri,  8 Nov 2019 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573246192;
        bh=NU9LZfDj7rqOVx1J7c1N4B2P7rGl8SnDbxr51wObu+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bQu/a5LlcxVJr1NlhxtPKZEo8isDcsKQf1jrbx65DhI2Mk/x1B8b2CMhWbJmzyY8B
         WMAPI0s44fePKYJDz+mSMTIcp07QVIncncPCmnMkjO/pKy/W9t7iKwoMwxfsEXsgGs
         S+z+kZq1HzH0i4cQb69PzIo/7vk54ok0R+rJoR0I=
Date:   Fri, 8 Nov 2019 21:49:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Omer Shalev <omerdeshalev@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media:usb:cpia2: Properly check framebuffer mmap offsets
Message-ID: <20191108204949.GA1277001@kroah.com>
References: <20191108215038.59170-1-omerdeshalev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108215038.59170-1-omerdeshalev@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 08, 2019 at 09:50:36PM +0000, Omer Shalev wrote:
> The cpai2 driver's mmap implementation wasn't properly check for all
> possible offset values. Given a huge offset value , the calculation
> start_offset + size can wrap around to a low value and pass the check

I thought we checked that in the core of the kernel now, to keep all
drivers from not having to do this type of thing (as they obviously all
forgot to.)  Why is this still needed here as well?

thanks,

greg k-h
