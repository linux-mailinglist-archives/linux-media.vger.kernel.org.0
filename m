Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD02A24844A
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 13:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHRL7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 07:59:42 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43829 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRL7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 07:59:41 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 168671C000B;
        Tue, 18 Aug 2020 11:59:36 +0000 (UTC)
Date:   Tue, 18 Aug 2020 14:03:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 1/4] media: i2c: max9286: Initialize try formats
Message-ID: <20200818120319.rrw6wwabrr275zln@uno.localdomain>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
 <20200817143540.247340-2-jacopo+renesas@jmondi.org>
 <20200818070910.GC7145@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818070910.GC7145@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Aug 18, 2020 at 10:09:10AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Aug 17, 2020 at 04:35:37PM +0200, Jacopo Mondi wrote:
> > Initialize try formats at device node open time by querying the
> > format from the remote subdevices instead of hard-coding it.
>
> The try formats are expected to be device defaults and not dependent on
> configuration.
>

The deserializer defaul depends on what is serialized on the other
end. I think getting it from the remote end makes sense in this case.

Thanks
   j

> --
> Sakari Ailus
