Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35450258291
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 22:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgHaU0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 16:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgHaU0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 16:26:31 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521BAC061573;
        Mon, 31 Aug 2020 13:26:31 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C3B44634C87;
        Mon, 31 Aug 2020 23:26:13 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kCqNZ-0000zH-J0; Mon, 31 Aug 2020 23:26:13 +0300
Date:   Mon, 31 Aug 2020 23:26:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: media: imx274: Move clock and
 supplies to required properties
Message-ID: <20200831202613.GE844@valkosipuli.retiisi.org.uk>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
 <1598903558-9691-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598903558-9691-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Mon, Aug 31, 2020 at 12:52:37PM -0700, Sowjanya Komatineni wrote:
> Clock and supplies are external to IMX274 sensor and are dependent
> on camera module design.
> 
> So, this patch moves them to required properties.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

One more comment.

Jacopo has been working on converting this to YAML format. Could you rebase
your patch on his? I believe he's still working on some changes. The
subject is "[PATCH v3] dt-bindings: media: imx274: Convert to json-schema".

-- 
Kind regards,

Sakari Ailus
