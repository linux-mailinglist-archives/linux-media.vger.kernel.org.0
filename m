Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9702348DF
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 18:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgGaQDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 12:03:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50100 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727819AbgGaQDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 12:03:51 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 458BB634C87;
        Fri, 31 Jul 2020 19:02:48 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k1XUe-0001f7-4B; Fri, 31 Jul 2020 19:02:48 +0300
Date:   Fri, 31 Jul 2020 19:02:48 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov772x: Add support for BT656 mode
Message-ID: <20200731160247.GC5201@valkosipuli.retiisi.org.uk>
References: <1595603296-25903-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595603296-25903-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595603296-25903-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Jul 24, 2020 at 04:08:15PM +0100, Lad Prabhakar wrote:
> Add support to read the bus-type and enable BT656 mode if needed.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

The DT bindings should also be changed.

The default should be parallel, I guess, since the type hasn't been
documented. Parsing should be also updated so the driver can set meaningful
defaults for the flags --- this btw. also applies to the corresponding
ov5640 patch.

-- 
Sakari Ailus
