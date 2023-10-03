Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DEA7B6536
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 11:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjJCJP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 05:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjJCJPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 05:15:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8586FA9;
        Tue,  3 Oct 2023 02:15:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [88.124.123.152])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED60D75A;
        Tue,  3 Oct 2023 11:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696324414;
        bh=PO3ge0MR9XFHjEOGZbD7BZzaTQmFFuxGS+gzgFhY7/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EjamJU7A6WI/F4CvZCOf0MRBSGqlZsa1luRrO8vyPO+qW9fFjVR9LvUufArTC7wIx
         ZtSnMwLKRvx7iuqyzYkO2/8gYrCDSD9YU8tjYOgWmFR2cxfPiJ5FfzITPgggNPVMvx
         AF3iH99XLzRBTd/Kp4obsgcEvwO5FY5u/kE2jX04=
Date:   Tue, 3 Oct 2023 12:15:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de
Subject: Re: [PATCH v3 1/7] media: dt-bindings: hynix,hi846: Add
 video-interface-device properties
Message-ID: <20231003091529.GB16331@pendragon.ideasonboard.com>
References: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
 <20230930145951.23433-2-jacopo.mondi@ideasonboard.com>
 <ZRvQckwdt9modLss@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZRvQckwdt9modLss@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 03, 2023 at 08:27:30AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Sat, Sep 30, 2023 at 04:59:45PM +0200, Jacopo Mondi wrote:
> > Allow properties from video-interface-device.yaml for the SK Hynix Hi-846
> > sensor.
> > 
> > All properties specified in video-interface-device.yaml schema are
> > valid, so make them accepted by changing "additionalProperties: false"
> > to "unevaluatedProperties: false" at the schema top-level.
> 
> The patch seems fine to me, but I wonder if we should change the title of
> video-interface-devices.yaml (it's plural) to something that refers to
> camera sensors, and possibly split it. It's currently not relevant for
> other types of devices.

I was thinking exactly the same yesterday.

-- 
Regards,

Laurent Pinchart
