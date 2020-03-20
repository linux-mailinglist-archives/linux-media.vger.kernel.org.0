Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E7D18D30D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 16:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgCTPh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 11:37:27 -0400
Received: from gofer.mess.org ([88.97.38.141]:58353 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727202AbgCTPh1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 11:37:27 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0C5A0C635F; Fri, 20 Mar 2020 15:37:25 +0000 (GMT)
Date:   Fri, 20 Mar 2020 15:37:25 +0000
From:   Sean Young <sean@mess.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use scnprintf() for avoiding potential
 buffer overflow
Message-ID: <20200320153725.GA23466@gofer.mess.org>
References: <20200311074638.8572-1-tiwai@suse.de>
 <s5ha74cuyl3.wl-tiwai@suse.de>
 <20200320135015.GB21882@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320135015.GB21882@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 20, 2020 at 01:50:15PM +0000, Sean Young wrote:
> On Thu, Mar 19, 2020 at 04:57:28PM +0100, Takashi Iwai wrote:
> > On Wed, 11 Mar 2020 08:46:38 +0100,
> > Takashi Iwai wrote:
> > > 
> > > Since snprintf() returns the would-be-output size instead of the
> > > actual output size, the succeeding calls may go beyond the given
> > > buffer limit.  Fix it by replacing with scnprintf().
> > > 
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > 
> > A gentle reminder for this forgotten patch.
> > Let me know if any further changes are needed.
> 
> Thank you for your reminder. The changes look good, unfortunately they
> missed the deadline for v5.7. I handle them after the next merge window.

It turns out trival fixes can be merged, so I was wrong. Now this patch
and the other snprintf -> scnprintf patch have been merged for v5.7.

Thank you for the reminder.

Sean
