Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A157A2849
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 22:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjIOUjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 16:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237325AbjIOUjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 16:39:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024C92700
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 13:39:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87F5FE4;
        Fri, 15 Sep 2023 22:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694810256;
        bh=68RPUAF6S781w+tPhqoW5nA+BbblDomyHUptdvQZno4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZDyE3NwrGihiglSgcOtwWPGcZJoXUo3jTG9ErawN4mU5wg0nVA/nrh94g462v8alL
         BqYJP4lnOeGem/cHhSbzE3VihbOGmWEQojtTB8AJCPPtGOsPmNCXagyRQU8MSQ46kH
         Kat+lpm4FjDYJHgsJooCX23wPO7p29TFr3lU4qdE=
Date:   Fri, 15 Sep 2023 23:39:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <20230915203924.GB12131@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
 <20230915094239.GF14641@pendragon.ideasonboard.com>
 <ZQS/HMu130H+DBOD@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQS/HMu130H+DBOD@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 15, 2023 at 08:31:24PM +0000, Sakari Ailus wrote:
> On Fri, Sep 15, 2023 at 12:42:39PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> > > Enable runtime PM before registering the async sub-device as the ipu
> > > bridge may try to resume the device immediately after the async sub-device
> > 
> > I wouldn't mention ipu bridge there, as this driver is not specific to a
> > particular CSI-2 receiver.
> 
> How exactly would you reword this?
> 
> The problem may only happen with the IPU bridge --- ACPI systems otherwise
> handle device power states.

Once a subdev is registered is could be used immediately by the host
driver, regardless of what host driver that is. Making sure to finalize
all initialization before registering the subdev is a good overall
practice.

-- 
Regards,

Laurent Pinchart
