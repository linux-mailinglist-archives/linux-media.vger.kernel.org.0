Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134222742CF
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 15:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIVNUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 09:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIVNUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 09:20:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DF0C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 06:20:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A27B2D7;
        Tue, 22 Sep 2020 15:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600780801;
        bh=o46WUdGljrBUGUyUYaECEkXaEXb46VX48n+5tMj6ngo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hl83UYKbpZSPR0Zvdobjzml59b0AAAgJCQ4w6JJtQleodGUjFs/Aflp+upuDhRpou
         +Wcl9MF4HCz/Ax8GsHb8jAfLpwZVaQrQwc7fY+02NH5pEjDDX+zK1Js8d8lfZtiVl7
         Oj7sx6aXa7BZwrDDkJiR/1b80BnPX9vJY+JfIp7o=
Date:   Tue, 22 Sep 2020 16:19:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Olivier Cailloux <olivier.cailloux@dauphine.fr>
Cc:     linux-media@vger.kernel.org
Subject: Re: Consider updating www.ideasonboard.org
Message-ID: <20200922131928.GM8290@pendragon.ideasonboard.com>
References: <de7894e8574231082ea64d1be317ed5a2faeba99.camel@dauphine.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de7894e8574231082ea64d1be317ed5a2faeba99.camel@dauphine.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Olivier,

On Mon, Sep 21, 2020 at 12:05:24PM +0200, Olivier Cailloux wrote:
> A lot of search engine queries send users to www.ideasonboard.org (for 
> example, https://www.startpage.com/do/dsearch?query=linux+uvc).
> 
> AFAIU, information there is mostly oudated. In particular, it indicates
> that “Support requests are handled through the Linux UVC development
> mailing list [linux-uvc-devel@lists.sourceforge.net]”, whereas it seems
> to me that related development now happens at the linux-media mailing
> list. It is not easy to realize this and visitors might be misled by
> this oudated information. (I have taken quite some time to realize this
> myself and I am still unsure of my conclusions.)
> 
> Could anyone confirm that linux-media is indeed the recommended list
> for problems related to the uvcvideo driver? If so, does anyone have a
> possibility of updating the website at ideasonboard.org, if only to
> warn the visitors that its information is outdated?
> 
> Thanks for your consideration.

And think you for the report. I had forgotten about this. I've now
updated the website to point to the linux-media mailing list.

-- 
Regards,

Laurent Pinchart
