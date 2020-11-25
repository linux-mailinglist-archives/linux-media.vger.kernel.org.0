Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9E72C49EF
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 22:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732209AbgKYVbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 16:31:24 -0500
Received: from retiisi.eu ([95.216.213.190]:33436 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730364AbgKYVbX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 16:31:23 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F180C634C87;
        Wed, 25 Nov 2020 23:30:40 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ki2N7-0001k0-Bo; Wed, 25 Nov 2020 23:30:41 +0200
Date:   Wed, 25 Nov 2020 23:30:41 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH REPOST] media: omap3isp: Remove misleading comment
Message-ID: <20201125213041.GE4351@valkosipuli.retiisi.org.uk>
References: <20201113142831.2215880-1-bigeasy@linutronix.de>
 <20201116092354.GF6540@pendragon.ideasonboard.com>
 <20201125210154.jcynggouhyxhy224@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125210154.jcynggouhyxhy224@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 25, 2020 at 10:01:54PM +0100, Sebastian Andrzej Siewior wrote:
> On 2020-11-16 11:23:54 [+0200], Laurent Pinchart wrote:
> > Hi Sebastian,
> Hi,
> 
> > Thank you for the patch.
> > 
> > CC'ing Sakari.
> > 
> > Sakari, could you please pick this one up ?
> 
> Sakari, does this work for you?

Oops... this one had slipped through. It's in my tree now.

-- 
Regards,

Sakari Ailus
