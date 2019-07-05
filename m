Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3575A6093A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 17:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfGEPYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 11:24:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36562 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfGEPYQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 11:24:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 55B3028B5F3
Message-ID: <da614f606c50c0fcdd9fabe11650d76749530ab8.camel@collabora.com>
Subject: Re: [PATCH v3 3/3] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Fri, 05 Jul 2019 12:24:00 -0300
In-Reply-To: <26acb51f5d7d9e11ef34f8c2e2c92b1dc0809a00.camel@ndufresne.ca>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
         <20190703122849.6316-4-boris.brezillon@collabora.com>
         <26acb51f5d7d9e11ef34f8c2e2c92b1dc0809a00.camel@ndufresne.ca>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-07-03 at 13:18 -0400, Nicolas Dufresne wrote:
> Le mercredi 03 juillet 2019 à 14:28 +0200, Boris Brezillon a écrit :
> > Those lists can be extracted from the dpb, let's simplify userspace
> > life and build that list kernel-side (generic helpers will be provided
> > for drivers that need this list).
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Those only existed for Rockchip/Hantro anyway.
> 
> Reviewed-by: Nicolas Dufresne <nicolas­.dufresne@collabora.com>
> 

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Eze

