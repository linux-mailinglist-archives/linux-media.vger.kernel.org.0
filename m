Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678F4F1193
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 09:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbfKFI61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 03:58:27 -0500
Received: from retiisi.org.uk ([95.216.213.190]:55968 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726903AbfKFI60 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 03:58:26 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 25693634C87;
        Wed,  6 Nov 2019 10:57:10 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iSH7l-0002VU-5D; Wed, 06 Nov 2019 10:57:09 +0200
Date:   Wed, 6 Nov 2019 10:57:09 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 12/20] media: ti-vpe: cal: Add DRA76x support
Message-ID: <20191106085709.GB6253@valkosipuli.retiisi.org.uk>
References: <20191104193140.31145-1-bparrot@ti.com>
 <20191104193140.31145-13-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104193140.31145-13-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Mon, Nov 04, 2019 at 01:31:32PM -0600, Benoit Parrot wrote:

...

> +static struct cal_data dra76x_cal_data = {

const?

> +	.csi2_phy_core = dra76x_cal_csi_phy,
> +	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
> +

This newline seems extra.

> +	.flags = 0,

And flags will be zero in any case, as one more struct members are assigned
to.

> +};

-- 
Regards,

Sakari Ailus
