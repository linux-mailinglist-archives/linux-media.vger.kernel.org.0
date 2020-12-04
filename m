Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFE32CEE60
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 13:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgLDMvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 07:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbgLDMvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 07:51:20 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CBEC0613D1;
        Fri,  4 Dec 2020 04:50:40 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 95CB6634C87;
        Fri,  4 Dec 2020 14:49:20 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1klAWX-0003P2-2H; Fri, 04 Dec 2020 14:49:21 +0200
Date:   Fri, 4 Dec 2020 14:49:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        robh+dt@kernel.org, bparrot@ti.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/13] dt-bindings: tegra: Update csi data-lanes to
 maximum 8 lanes
Message-ID: <20201204124920.GL4351@valkosipuli.retiisi.org.uk>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
 <1607022002-26575-12-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607022002-26575-12-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 03, 2020 at 11:00:00AM -0800, Sowjanya Komatineni wrote:
> Tegra VI/CSI hardware don't have native 8 lane CSI RX port.
> 
> But x8 capture can be supported by using consecutive x4 ports
> simultaneously with HDMI-to-CSI bridges where source image is split
> on to two x4 ports.
> 
> This patch updates dt-bindings for csi endpoint data-lane property
> with maximum of 8 lanes.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
