Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55A3D69F337
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 12:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbjBVLMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 06:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbjBVLM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 06:12:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EA11F5F7
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 03:12:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F9FF4B0;
        Wed, 22 Feb 2023 12:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677064339;
        bh=1Lf2jWA+8rMXytltIs9KZMixECfg1wmReyye51YuXXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnfRo3o+sA0MtTYESXXGb9aeqsTOGs5UNUCL0Sl2dQIcc4twSoHJsqhT66aG8H/Bm
         Ij3CGsrAVmCzx56L3g6P2EsE9MoSnEOYsKZlzISpSS68HuSF7+n57AmkjTzRVn52mP
         F1TbuR5GN7QNqce2X9BI7kWxHX3CsFJhaBGAJT7M=
Date:   Wed, 22 Feb 2023 13:12:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Message-ID: <Y/X4ktSRZKbHbB1B@pendragon.ideasonboard.com>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
 <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
 <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 22, 2023 at 11:41:29AM +0100, Gregor Jasny wrote:
> On 21.02.23 15:51, Laurent Pinchart wrote:
> >> I wonder if we shouldn't make a 1.24 stable release first without this patch
> >> series, then introduce meson with version 1.25. Besides, the last stable release
> >> was 16 months ago, so I think it is high time for a new stable anyway.
> > 
> > Works for me.
> > 
> >> Gregor, any opinion?
> 
> Sure, I can create a new release tonight. Would anyone want to merge 
> something prior to the release?

Nothing on my side, I've pushed the meson preparation patches, all I
have remaining is about meson support itself.

-- 
Regards,

Laurent Pinchart
