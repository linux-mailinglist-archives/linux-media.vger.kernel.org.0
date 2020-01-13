Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03F913991F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 19:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgAMSnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 13:43:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:47230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgAMSnV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 13:43:21 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8704020CC7;
        Mon, 13 Jan 2020 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578941001;
        bh=2Pma3/cx78GLTAW61r1F5Jwdm6NzhJEJcPWrFF9uls8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IEeJ0bbGhTdr5RPtnE4bMgC1gdBDUCHLpuTR3u08lPJ2TLhJcuKN0+X5S8ktNGBSH
         GU8UIy+xN+9GwQNdpewuD4ZlaGboTBZ+vxzjedoPqkYuHZTm3FK7AYhLSHwj3Lzgty
         Ua9Jd3LYKp8MhT6a9j3vQe/sn90R4L0q1L0w4nz8=
Date:   Mon, 13 Jan 2020 19:43:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] media: dvb_dummy_tuner: implement driver skeleton
Message-ID: <20200113184318.GB431441@kroah.com>
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
 <20200110073024.GA156006@kroah.com>
 <d6d119cf-7447-31ce-37db-25503cf2f9bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d119cf-7447-31ce-37db-25503cf2f9bc@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 13, 2020 at 03:23:02PM -0300, Daniel W. S. Almeida wrote:
> Hi Greg,
> 
> I am working on v3. Would you mind clarifying this?
> 
> 
> > > + *
> > > + * The virtual DVB test driver serves as a reference DVB driver and helps
> > > + * validate the existing APIs in the media subsystem. It can also aid developers
> > > + * working on userspace applications.
> > > + *
> > > + * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> > > + * ISDB-T and ATSC when completed.
> > > + *
> > > + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> > Normally this is the first comment line above in this block.
> > 
> 
> Just so we're clear, do you mean this? e.g.:
> 
> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Yes.
