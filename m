Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DA21EE1D2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgFDJvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:51:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57294 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726711AbgFDJvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 05:51:52 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 818B1634C87;
        Thu,  4 Jun 2020 12:50:26 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jgmW2-00041I-Ke; Thu, 04 Jun 2020 12:50:26 +0300
Date:   Thu, 4 Jun 2020 12:50:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Chuhong Yuan <hslester96@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilkka Myllyperkio <ilkka.myllyperkio@sofica.fi>,
        "Ivan T . Ivanov" <iivanov@mm-sol.com>,
        Vimarsh Zutshi <vimarsh.zutshi@gmail.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: omap3isp: Add missed v4l2_ctrl_handler_free()
 for preview_init_entities()
Message-ID: <20200604095026.GI9947@valkosipuli.retiisi.org.uk>
References: <20200603164122.2101162-1-hslester96@gmail.com>
 <20200604093321.GE5829@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604093321.GE5829@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 04, 2020 at 12:33:21PM +0300, Laurent Pinchart wrote:
> Hi Chuhong,
> 
> (CC'ing Sakari Ailus)
> 
> Thank you for the patch.
> 
> On Thu, Jun 04, 2020 at 12:41:22AM +0800, Chuhong Yuan wrote:
> > preview_init_entities() does not call v4l2_ctrl_handler_free() when
> > it fails.
> > Add the missed function to fix it.
> > 
> > Fixes: de1135d44f4f ("[media] omap3isp: CCDC, preview engine and resizer]")
> 
> There's an extra ']' at the end. Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Sakari, could you take this patch ?

Done; thank you!

-- 
Sakari Ailus
