Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB84536E58
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 10:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfFFIRf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 04:17:35 -0400
Received: from retiisi.org.uk ([95.216.213.190]:46874 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727120AbfFFIRf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 04:17:35 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id B9408634C7B;
        Thu,  6 Jun 2019 11:17:23 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hYnaN-0000TX-SV; Thu, 06 Jun 2019 11:17:23 +0300
Date:   Thu, 6 Jun 2019 11:17:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        od@zcrc.me
Subject: Re: [PATCH v5 2/3] media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8 media
 bus format
Message-ID: <20190606081723.p66cahzkqmwrpi7i@valkosipuli.retiisi.org.uk>
References: <20190605222247.25657-1-paul@crapouillou.net>
 <20190605222247.25657-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605222247.25657-2-paul@crapouillou.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 06, 2019 at 12:22:46AM +0200, Paul Cercueil wrote:
> This patch adds MEDIA_BUS_FMT_RGB888_3X8, used for the GiantPlus
> GPM940B0 24-bit TFT panel, where the RGB components are transferred
> sequentially on a 8-bit bus.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
