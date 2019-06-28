Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D381598F7
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 13:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfF1LFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 07:05:00 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60732 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726514AbfF1LE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 07:04:59 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id BF436634C7D;
        Fri, 28 Jun 2019 14:04:42 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hgogM-0000kJ-13; Fri, 28 Jun 2019 14:04:42 +0300
Date:   Fri, 28 Jun 2019 14:04:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Michael Allwright <michael.allwright@upb.de>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH RFC] DT support for omap4-iss
Message-ID: <20190628110441.42gdqidkg5csuxai@valkosipuli.retiisi.org.uk>
References: <CALcgO_6UXp-Xqwim8WpLXz7XWAEpejipR7JNQc0TdH0ETL4JYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALcgO_6UXp-Xqwim8WpLXz7XWAEpejipR7JNQc0TdH0ETL4JYQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Mon, Aug 10, 2015 at 05:16:30PM +0200, Michael Allwright wrote:
> Hi All,
> 
> The following PRELIMINARY patch adds DT support to the OMAP4 ISS. It
> also fixes some problems a have found along the way. It is tightly
> modelled after the omap3-isp media platform driver. This patch is a
> work in progress as I would like feedback. It contains debugging
> messages that need to be removed, as well as disgusting abuses of the
> C language as required (i.e. clk_core_fake and clk_fake).

We'd like to restart the effort adding DT support for this driver. Would
you be able to, if not address the comments, at least resend your old patch
with your Signed-off-by: line so we could make use of what you've already
done?

Thanks.

-- 
Kind regards,

Sakari Ailus
