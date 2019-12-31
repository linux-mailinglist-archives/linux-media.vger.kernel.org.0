Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB94312DAEE
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 19:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfLaSeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 13:34:23 -0500
Received: from gofer.mess.org ([88.97.38.141]:35459 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726658AbfLaSeX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 13:34:23 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3519E11A001; Tue, 31 Dec 2019 18:34:21 +0000 (GMT)
Date:   Tue, 31 Dec 2019 18:34:21 +0000
From:   Sean Young <sean@mess.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
Message-ID: <20191231183421.GA10946@gofer.mess.org>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-4-dwlsalmeida@gmail.com>
 <20191231100802.GE24469@gofer.mess.org>
 <1be10ca9-4bfc-72f0-971a-cc366417a9b4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be10ca9-4bfc-72f0-971a-cc366417a9b4@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Dec 31, 2019 at 03:14:04PM -0300, Daniel W. S. Almeida wrote:
> Hi Sean, thanks for reviewing this!
> 
> 
> > The comments from Mauro in the previous version of this patch have not been
> > addressed:
> > 
> > https://patchwork.linuxtv.org/patch/60048/#114016
> > 
> > Thanks,
> > 
> > Sean
> 
> As you've also noted, I have these as separate patches, i.e.
> 
> https://patchwork.linuxtv.org/patch/60430/
> 
> https://patchwork.linuxtv.org/patch/60432/
> 
> 
> I will squash them with this one and send v2. I will also drop this from the
> series:
> 
> https://patchwork.linuxtv.org/patch/60428/
> 
> 
> Is this OK with you?

That's perfect, although v2 already exists so please name it v3 (or whatever
the next available version is).

Thanks!

Sean
