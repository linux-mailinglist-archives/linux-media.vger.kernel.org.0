Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD1B720440
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 16:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbjFBOXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 10:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbjFBOXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 10:23:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60E51A4
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 07:23:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E59496E0;
        Fri,  2 Jun 2023 16:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685715762;
        bh=/aZmOgNflVhChv633Ztav4Xs23z4MOQSIldiHPiYGME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g34DPbHdlFTQZ3kE7GuWND5e6QyM6/+/fdqB49V8Bpv35Rgygv89GOozmTpflqFLl
         vOw+LpH4Ol7UZnyWBXuJG2/XKQ1vc4fPwyBY62YPnyUPB9XlPY3lAkOdGTJzwrXLYz
         t+A+kU5c9gAeqaGtTxKFvlNP07HvlKt2W8rhCiwY=
Date:   Fri, 2 Jun 2023 17:23:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <20230602142303.GD24855@pendragon.ideasonboard.com>
References: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
 <20230602091212.GB23701@pendragon.ideasonboard.com>
 <ZHn5MH3o1l0lBhqS@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZHn5MH3o1l0lBhqS@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Fri, Jun 02, 2023 at 02:14:08PM +0000, Sakari Ailus wrote:
> On Fri, Jun 02, 2023 at 12:12:12PM +0300, Laurent Pinchart wrote:
> > On Mon, May 15, 2023 at 03:21:27PM +0300, Sakari Ailus wrote:
> > > Use the endpoint fwnode to find out the remote pad, instead of using the
> > > first source pad found. Also improve error messages.
> > 
> > The commit message should explain *why*. Once I know why, I'll review
> > the patch :-)
> 
> I thought it'd be trivial. :-)

It may appear trivial as a patch author, but reviewers don't have the
context, so they shouldn't be expected to guess the intent.

> Using framework functions instead of open coding this in drivers, and using
> the pad related to the endpoint fwnode instead of just the first pad found.
> 
> I'll add this to the commit message.

-- 
Regards,

Laurent Pinchart
