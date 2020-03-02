Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02C4175D47
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 15:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgCBOfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 09:35:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46524 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbgCBOfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 09:35:34 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 162EB294121;
        Mon,  2 Mar 2020 14:35:33 +0000 (GMT)
Date:   Mon, 2 Mar 2020 15:35:29 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 5/6] media: rkvdec: Add the rkvdec driver
Message-ID: <20200302153529.4e2429e7@collabora.com>
In-Reply-To: <20200302145746.3e94c1d1@coco.lan>
References: <20200220163016.21708-1-ezequiel@collabora.com>
        <20200220163016.21708-6-ezequiel@collabora.com>
        <20200302145746.3e94c1d1@coco.lan>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Mar 2020 14:57:46 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> > +	for (j = 0; j < 3; j++) {  
> 
> Again a magic number. I guess this came from that big "M_N" table with 4
> elements, right? Please use a define instead of hardcoding a number
> here.

Nope, it's unrelated to the cabac_table size, it's related to how the
HW accesses the P/B reflists (there are 1 P reflist, and 2 B reflists,
hence the 3 here). I guess we can have a '#define NUM_REFLISTS 3'.
