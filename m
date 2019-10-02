Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23479C4A88
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 11:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfJBJWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 05:22:13 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59272 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725848AbfJBJWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 05:22:12 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id E2C52634C89;
        Wed,  2 Oct 2019 12:21:44 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iFapL-00028v-CM; Wed, 02 Oct 2019 12:21:43 +0300
Date:   Wed, 2 Oct 2019 12:21:43 +0300
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
Subject: Re: [RFC PATCH V3 5/5] media: platform: mtk-mdp3: Add struct
 tuning_addr and img_sw_buffer
Message-ID: <20191002092143.GP896@valkosipuli.retiisi.org.uk>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-6-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909192244.9367-6-frederic.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 10, 2019 at 03:22:44AM +0800, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> We added a struct tuning_addr which contains a field "present"
> so that the driver can tell the firmware if we have user tuning
> dataor not.
> 
> The strcut img_sw_buffer is also added. This struct has no cpu address
> field and uses a handle instead so that we don't pass a cpu address
> to co-processor.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>

If the driver depends on this patch, it needs to come before the driver.

-- 
Sakari Ailus
