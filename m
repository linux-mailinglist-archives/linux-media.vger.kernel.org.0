Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C6D44DC3A
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 20:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbhKKTki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 14:40:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:46378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229785AbhKKTki (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 14:40:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DC4761054;
        Thu, 11 Nov 2021 19:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636659469;
        bh=kvLxjhsqWWrkwcWX08LE4zmNFTBTSqdsykYTe1y4XWI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rHYM90kd9mjFoZnE+h68f+ORQaSi6aNKazXyrzZZiuDt3OTnrDOuVrwQuSg7hlal3
         twy9VAqF95Rl9qAea2JHeQlP283Z99jORszKbsr4gdAsQttr4VYWIQ5Y/E4U/0PuGE
         eWmhe03RnwYe87rU7ZEmzOD+BynufoKHN8xS2Ba8TiNIIy0At9V/h98m+m+Qiy7DOI
         qoxrAqLdsWUL8SVWIth8LAxk8F/Lz/apsKTyfgtnmExHyjhcnSbQ7ai0t9OymhzAAL
         4THo2FbJ5NAYCaK35qRggSE+iTI5HJEgAxVwBAtv7YnGe0UQn8zSci3q/vV074lrem
         blztWnvrDQFFQ==
Date:   Thu, 11 Nov 2021 19:37:42 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <20211111193742.174f0b26@sal.lan>
In-Reply-To: <YY1ATbqn2fAg8Oct@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-5-kitakar@gmail.com>
        <20211026092637.196447aa@sal.lan>
        <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
        <20211028123944.66c212c1@sal.lan>
        <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
        <20211101141058.36ea2c8e@sal.lan>
        <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
        <YY1ATbqn2fAg8Oct@smile.fi.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 11 Nov 2021 18:09:49 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> On Thu, Nov 11, 2021 at 11:34:23PM +0900, Tsuchiya Yuto wrote:
> > On Mon, 2021-11-01 at 14:10 +0000, Mauro Carvalho Chehab wrote:  
> > > Em Mon, 01 Nov 2021 22:38:55 +0900
> > > Tsuchiya Yuto <kitakar@gmail.com> escreveu:  
> 
> ...
> 
> > The full output of the make error is here:
> > 
> >         ("NOTE: issue: some undeclared errors")
> >         https://github.com/kitakar5525/linux-kernel/commit/a932d16681f941161385659b9d0316a3a4975e86  
> 
> I just realize that we may do at some point
> 
> cflags-y += -Werror
>
> to avoid changes that breaks build (with warnings). 

No need. Upstream already added Werror. It is just a matter of
adding:

	CONFIG_WERROR=y

to .config.

> And also I would suggest
> to run build with `make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`

Yeah, that's good. On media, we also require no (unjustified) sparse
and smatch warnings.

Regards,
Mauro
