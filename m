Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E650ED3CC3
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfJKJxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:53:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33312 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfJKJxJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:53:09 -0400
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C3097290E0A;
        Fri, 11 Oct 2019 10:53:07 +0100 (BST)
Date:   Fri, 11 Oct 2019 11:53:04 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RESEND PATCH v2 0/4] media: rockchip: Add the rkvdec driver
Message-ID: <20191011115304.3b106a2b@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <ea218a89-d844-4c56-595a-7359af3ef031@xs4all.nl>
References: <20191011093342.3471-1-boris.brezillon@collabora.com>
        <ea218a89-d844-4c56-595a-7359af3ef031@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 11 Oct 2019 11:43:20 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 10/11/19 11:33 AM, Boris Brezillon wrote:
> > Hello,
> > 
> > Sorry for the noise, I forgot to Cc the DT maintainers/ML on my last
> > attempt.
> > 
> > This is v2 of the rkvdec driver which was initially posted as part of
> > my RFC adding codec helpers.
> > For this version, I decided to get rid of the helper stuff which is
> > likely to take some more time to settle. The patchset now contains a
> > proper DT binding doc.
> > 
> > Note that this implementation is likely to be adjusted based on the
> > outcome of the 'scaling matrix order' [1] and 'dynamic resolution
> > changes' [2] discussions, but I thought it'd be worth posting this
> > version to start getting feeback.  
> 
> I assume this version of the driver does not (yet?) support slicing?

Nope, but the driver does not support SLICE_BASED decoding anyway, so
I'm not sure slicing applies here.
