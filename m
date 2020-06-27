Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6C320BEC1
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2020 07:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgF0FHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jun 2020 01:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:37262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbgF0FHs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jun 2020 01:07:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA23820707;
        Sat, 27 Jun 2020 05:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593234468;
        bh=4eXtfmvFNGo6KGU0D8a17po2CGm2YzO6PKScRYuLrQQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iehcu4iqdvjTjR0yDg2DdP9WxF3esmLlBQXuPu0L/yOEEISjuebO6sWbyTsd1i9Fu
         NGRcpefYrwN3ZTG920CVGmpkvE7Ow2RQyFDjqbSdcXVnFZ5qQiuvElCUucghD5CGxa
         QLbUsZoZSLXZhgtotZiDlrB1zD3T2vkDID+Oi6GE=
Date:   Sat, 27 Jun 2020 07:07:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC
         Campus <bkkarthik@pesu.pes.edu>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: usbvision: removing prohibited space
 before ',' (ctx:WxW)
Message-ID: <20200627050745.GD226238@kroah.com>
References: <20200626143205.xns6nwggskssujao@pesu-pes-edu>
 <CAAhDqq0tSftPxMWGeVy3mp4DGDN3o0uQwTqVbjYUwjqzWpbibQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhDqq0tSftPxMWGeVy3mp4DGDN3o0uQwTqVbjYUwjqzWpbibQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Fri, Jun 26, 2020 at 11:42:49AM -0400, B K KARTHIK PES2201800185STUDENT ECE DeptPESU EC Campus wrote:
> Oh, I'm sorry but wouldn't it be helpful if we had a file that lists
> all drivers that are scheduled for removal?

The TODO file in the directory for the driver should have this
information in it.  I don't know if all of the media drivers have this,
if not, then there is no way you could have known this.

thanks,

greg k-h
