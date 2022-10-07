Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3E75F77DD
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiJGMMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiJGMMy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:12:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08C3CF868
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:12:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A734BBE;
        Fri,  7 Oct 2022 14:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665144772;
        bh=EH6HNHMeI/9Ii0rTKSIAnh/yW6ewE3WUAjSlAoSC/k0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pdl/An0tGgvEtRq596wsiTRWPeH6yLnUP1TqWY2VNqq1W/WBa5J5rLnFqtWSAsiwl
         NfmDKhojNyvSmHltkvVNUnBp5hSG1+RJbG1aEHrdh8Zt9ZwVJrurO8KnYm1iWkHKEf
         j3e1eM0guNPCMeyZdez8bvgDZWXSRudlcJEwzoAk=
Date:   Fri, 7 Oct 2022 15:12:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
Message-ID: <Y0AXvxdTG/u1WW4p@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-2-jacopo@jmondi.org>
 <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
 <20221007072959.n52j2bzrn6xstjnd@uno.localdomain>
 <Yz/fMH5iEWtKDWNF@pendragon.ideasonboard.com>
 <CAPY8ntDa11Psmpg8XbnZqZCWXO1c4WxEkXR5e4sAG95X-Tmvww@mail.gmail.com>
 <Y0AWAgplTjgh9p4g@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0AWAgplTjgh9p4g@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 07, 2022 at 03:05:22PM +0300, Sakari Ailus wrote:
> Hi Dave,
> 
> On Fri, Oct 07, 2022 at 11:32:27AM +0100, Dave Stevenson wrote:
> > The datasheet and register reference have a fair number of references
> > to SMIA standards. I wonder if the CCS driver can take over from this
> > driver entirely....
> 
> A lot of the configuration of basic features in the driver appears to be
> going to CCS MSR space. While it's possible to do additional writes to the
> MSR register space based on standard CCS register writes, semantics still
> needs to match.
> 
> It is possible to support many sensors with additional CCS static data that
> provides the limit and capability values, too, but to me this sensor
> doesn't appear like an obvious candidate for that.

There are also lots of registers in the standard CCS space that don't
match the CCS specification. I think a custom driver is needed.

-- 
Regards,

Laurent Pinchart
