Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12CEBB369
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 14:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbfIWMMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 08:12:43 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51936 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726212AbfIWMMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 08:12:43 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3B801634C87;
        Mon, 23 Sep 2019 15:11:40 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iCNBs-0002B2-Tq; Mon, 23 Sep 2019 15:11:40 +0300
Date:   Mon, 23 Sep 2019 15:11:40 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     frederic.chen@mediatek.com
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, Rynn.Wu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, shik@chromium.org,
        suleiman@chromium.org, Allan.Yang@mediatek.com
Subject: Re: [RFC PATCH V3 0/5] media: platform: Add support for Digital
 Image Processing (DIP) on mt8183 SoC
Message-ID: <20190923121140.GN5525@valkosipuli.retiisi.org.uk>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909192244.9367-1-frederic.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

On Tue, Sep 10, 2019 at 03:22:39AM +0800, frederic.chen@mediatek.com wrote:
> Hello,
> 
> This RFC patch series added Digital Image Processing (DIP) driver on Mediatek
> mt8183 SoC. It belongs to the Mediatek's ISP driver series based on V4L2 and
> media controller framework. I posted the main part of the DIP driver as RFC to
> discuss first and would like some review comments.

Could you post media-ctl -p and media-ctl --print-dot outputs for this
driver, please?

-- 
Sakari Ailus
