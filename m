Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB17391ABA
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 16:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbhEZOvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 10:51:23 -0400
Received: from mga12.intel.com ([192.55.52.136]:56101 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234894AbhEZOvX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 10:51:23 -0400
IronPort-SDR: +8v120IyYkGZREeqc0YgE7alOBacEwWTzCswlOGV/rMlBL6h3BvL8tLHyc5DoWwtSP63hxWB76
 XmjO9ibuCbbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182128571"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="182128571"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 07:49:51 -0700
IronPort-SDR: hy6+akIv9+Y9X6iuaotpNwZKhLvTNZSpWjj/4mLsj5CTA4oByVnBG9rn2RgwoscxpNWAyRGa4+
 U7h9OFuX4hCA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="443076408"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 07:49:48 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 58DCA2011E;
        Wed, 26 May 2021 17:49:46 +0300 (EEST)
Date:   Wed, 26 May 2021 17:49:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Leon Romanovsky <leon@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: marvell-ccic: set error code in probe
Message-ID: <20210526144946.GD3@paasikivi.fi.intel.com>
References: <20210526143506.6945-1-novikov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526143506.6945-1-novikov@ispras.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 26, 2021 at 05:35:06PM +0300, Evgeny Novikov wrote:
> When i2c_new_client_device() fails, cafe_pci_probe() cleans up all
> resources and returns 0. The patch sets the error code on the
> corresponding path.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
