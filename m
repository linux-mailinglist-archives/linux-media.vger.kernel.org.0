Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FCF20D493
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 21:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbgF2TJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:09:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730335AbgF2TAT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:00:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DB7F2554B;
        Mon, 29 Jun 2020 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593446112;
        bh=4iXE6X6BH7Sxje+iISVf8jR0Is6iv3UfKTVAnMUZGaY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2U+MILBVT23YaZGdGpLO6laSjCwUsbg1urnAwBg/mN+0QstKMt2rgVhJrjbvq5RT
         s6etxdPdTY1Mv4RLGYevq3RavmmS//9KWuBexp7reG+SFRlF4vhtx+Z2GYBUqhoUnK
         bgcM4W2IY97lLpe70xK5huDwRLE4lOXseGWjvwcM=
Date:   Mon, 29 Jun 2020 17:55:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     B K Karthik <bkkarthik@pesu.pes.edu>
Cc:     B K Karthik <karthik.bk2000@live.com>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: i2c: atomisp-ov2680.c: fixed a
 brace coding style issue.
Message-ID: <20200629155503.GB512815@kroah.com>
References: <20200628043833.3dodctrmkec6aoe5@pesu-pes-edu>
 <20200629144336.fhykjoqrhfhifmes@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629144336.fhykjoqrhfhifmes@pesu-pes-edu>
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

On Mon, Jun 29, 2020 at 10:43:36AM -0400, B K Karthik wrote:
> Did this get burried in along with a bunch of other patches? I am sending this email only because I did not recieve a negetive acknowledgement on the patch.
> 
> I apologize if this message was hurtful / disrespectfull in any manner,
> thank you for reading this message.
> 
> karthik
> 
> On 20/06/28 12:38AM, B K Karthik wrote:

You sent this one day ago.

Please be patient, some maintainers only get to patches every few weeks.
If, after 2 weeks, there has not been a response, then resend it.

Remember, maintainers have other work to do as well, and staging patches
are usually down the list of things they work on.

(hint, I'm not the maintainer of this part of the staging tree...)

thanks,

greg k-h
