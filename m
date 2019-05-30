Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4E3304B6
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 00:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfE3WWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 18:22:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbfE3WWX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 18:22:23 -0400
Received: from localhost (unknown [207.225.69.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D466D261CE;
        Thu, 30 May 2019 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559251519;
        bh=8MgfUmuzxK42VbrpBBlF+a1Qa90gCAfIPee+BPMwH0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bTrx5JrjxtNwuKsaVAT9K/1RrgMVFBIenItMO5BOMSzvJU9P1CAz/WBuRx5AfdZSH
         wX2LpcE0cIxf5inzF8M5ObUtMjHuoydajrV41G7huwSI/xBHKSHQdXe4/ftXs/i1p0
         Kn5DQsClgmyWtlFYfFBX3OpkCZRX9udwzlWgOQ3c=
Date:   Thu, 30 May 2019 14:25:19 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     devel@driverdev.osuosl.org, code@wizofe.uk,
        linux-kernel@vger.kernel.org, hans.verkuil@cisco.com,
        mchehab@kernel.org, ezequiel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: davinci_vpfe: Remove variable vpfe_dev
Message-ID: <20190530212519.GB18779@kroah.com>
References: <20190530204718.29892-1-nishkadg.linux@gmail.com>
 <20190530205540.GA5308@kroah.com>
 <9b870baa-4d15-cb72-0579-6bb6ca57cadd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b870baa-4d15-cb72-0579-6bb6ca57cadd@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 31, 2019 at 02:39:23AM +0530, Nishka Dasgupta wrote:
> On 31/05/19 2:25 AM, Greg KH wrote:
> > On Fri, May 31, 2019 at 02:17:18AM +0530, Nishka Dasgupta wrote:
> > > Remove variable vpfe_dev and replace it with its value (since the
> > > function otherwise uses values directly instead of local variables).
> > 
> > This says _what_ you do.  But we can see that in the patch itself.
> > 
> > You need to say _why_ you are doing this.
> > 
> > There's no need for this change at all.  Again, as I have said before,
> > we write code for developers to read first, the compiler second.  By
> > making these types of changes you are making it harder to
> > read/understand by a developer, and providing absolutely no benifit to
> > the compiler at all.
> > 
> > So it's actually making the code worse!
> > 
> > not good at all.
> > 
> > Please reconsider this type of change, as I keep asking you to.
> 
> Okay. In this case I thought it wouldn't make it worse since the function is
> low on local variables anyway? Clearly I was wrong, so I won't count this
> case as an exception in future.

Did you check the object file output to verify this?  Try it and see :)

