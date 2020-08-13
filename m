Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6038244186
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 00:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHMWzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 18:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbgHMWzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 18:55:38 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F58FC061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 15:55:38 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 2701B634C87;
        Fri, 14 Aug 2020 01:54:55 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k6M7a-0001kk-Qc; Fri, 14 Aug 2020 01:54:54 +0300
Date:   Fri, 14 Aug 2020 01:54:54 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
Subject: Re: [PATCH v4l-utils v3 2/2] Add support for meson building
Message-ID: <20200813225454.GO840@valkosipuli.retiisi.org.uk>
References: <20200806155519.79748-1-ariel@vanguardiasur.com.ar>
 <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200806155519.79748-3-ariel@vanguardiasur.com.ar>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ariel,

Thanks for the patchset.

On Thu, Aug 06, 2020 at 12:55:19PM -0300, Ariel D'Alessandro wrote:
> Supports building libraries and tools found in contrib/, lib/ and
> utils/ directories, along with the implemented gettext translations.
> 
> Also supports generating plain HTML documentation and manual pages using
> Doxygen.

Could you split this change into a 3rd patch, please, and update the
INSTALL file (here I guess)?

-- 
Kind regards,

Sakari Ailus
