Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB4B3900F1
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 14:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhEYM1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 08:27:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:54108 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232365AbhEYM1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 08:27:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1621945550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+dy6MmYQ0jbF1lDCgimb1sPwqRlvQ+52FW00ypFyZbY=;
        b=u5qMRur3eqaxnHnmnkdv1PCLksGXalWHpuGoouQFn64oVQFpWECBDdG6cBvc5kQEOvqPUT
        Kr8SwdNQW+y9jc+GLZAgpqoeoPoJg3zmsk3Smzl6Bb+127H8yqgTY+FRbIya2FX4tMHHue
        HmY362Uy4tDewH1FPn08fLblZPj4cXc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 80A3AAE1F;
        Tue, 25 May 2021 12:25:50 +0000 (UTC)
Message-ID: <35840cdac1dcb2808e98ebb57afeba352624d15c.camel@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>, Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Date:   Tue, 25 May 2021 14:25:49 +0200
In-Reply-To: <YKZktqzkddh3amqX@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
         <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
         <20210511103219.GA13769@gofer.mess.org>
         <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
         <20210515092226.GA31801@gofer.mess.org>
         <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
         <20210517103522.GA4644@gofer.mess.org>
         <YKZktqzkddh3amqX@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, den 20.05.2021, 15:31 +0200 schrieb Johan Hovold:

Hi,

> Isn't that already handled by lircd using uinput?

The problem with that reasoning, though it is true, is

1) We would need to remove a lot of subsystems if we took that
to the logical conclusion. 

2) It makes runtime PM much harder

3) We end up with two classes of LIRC devices

> I hear you, but we still need to have those discussions from time to
> time to make sure our architecture is sane. One of the problems today
> with the kernel development process appears to be that too few
> questions
> are asked. If it builds, ship it...

Indeed, so, could we force a line discipline on a device on the kernel
level? Code duplication is bad.

> But I think I've got that point across by now.

Yes and and we need to think about the conclusion we draw from
that point. It seems to me that an architecture that pushes data
through the whole tty layer into a demon, then through uinput
is definitely not elegant.
So what else can we do, so that devices that are internally
a serial chip plus additional stuff but externally unrelated
devices? It looks to me we are in need of creativity beyond two options
here.

	Regards
		Oliver


