Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02BE650B0E0
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 08:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444396AbiDVGxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 02:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444286AbiDVGxA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 02:53:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A33642E
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 23:50:07 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC7E42F7;
        Fri, 22 Apr 2022 08:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650610205;
        bh=AbmCdbSZxGC1NhMqgrjRlBwjZAYJALxfcO/MbF16Cus=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KzUeUhhVi8zT82ZjKdkufJYNqcA4zBbscHgcZsEL5KuBFHVjalPKHa5VLXu7SWhYz
         MBrjUT81ODpQBmIy/lsdK9RjOV12TbRnerQ5MRTNDDS42XEBpoYspA2gynA4hT2KXE
         J5z0strSiBHqBkmHA+2qRqwXDVpipC/j3zxRbCSU=
Message-ID: <567ad2ed-921f-0318-2cb5-ed28d5c9e41a@ideasonboard.com>
Date:   Fri, 22 Apr 2022 09:50:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/6] media: ti: cal: fix error paths in
 cal_camerarx_create()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
 <20220421143449.552312-2-tomi.valkeinen@ideasonboard.com>
 <YmG4I3seaJmtmtC9@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YmG4I3seaJmtmtC9@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2022 23:01, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Apr 21, 2022 at 05:34:44PM +0300, Tomi Valkeinen wrote:
>> The error paths are not correct: media_entity_cleanup() should not be
>> called unless media_entity_pads_init() has been called. Fix this.
> 
> See commit 443bf23d0048 ("media: media-entity: Clarify
> media_entity_cleanup() usage") :-)

Ok, I'll drop this.

  Tomi
