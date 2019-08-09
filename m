Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF61687CD6
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 16:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfHIOjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 10:39:06 -0400
Received: from retiisi.org.uk ([95.216.213.190]:58898 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbfHIOjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Aug 2019 10:39:06 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 53534634C87;
        Fri,  9 Aug 2019 17:39:00 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hw62m-0000Jq-E8; Fri, 09 Aug 2019 17:39:00 +0300
Date:   Fri, 9 Aug 2019 17:39:00 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
Subject: Re: [v4 3/6] media: platform: dwc: Add MIPI CSI-2 platform data
Message-ID: <20190809143900.GC864@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-4-git-send-email-luis.oliveira@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560280855-18085-4-git-send-email-luis.oliveira@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luis,

On Tue, Jun 11, 2019 at 09:20:52PM +0200, Luis Oliveira wrote:
> This allows the driver loading via platform data which makes the driver
> not device tree dependent.
> 
> Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>

Platform data? I thought we ceased to add support for platform data long
time ago.

-- 
Regards,

Sakari Ailus
