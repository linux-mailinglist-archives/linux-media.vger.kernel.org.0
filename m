Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0CAC586411
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 08:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbiHAG2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 02:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiHAG23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 02:28:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B90F1260D
        for <linux-media@vger.kernel.org>; Sun, 31 Jul 2022 23:28:28 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AEAE48F;
        Mon,  1 Aug 2022 08:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659335306;
        bh=kxZR6RknC+GTTIhVv5o45WpFeI+XwdyhrxXijfycEdc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=a0UVMU3UR2cAwlaobiMquA+yca40W8vSZWzHE9XO/uhtugBzg8Nhpt1SQ5rjvDuyg
         joV17P7v9ofkjzdjLZ0pSA+MmTc3QRxilo1e0XKajV0nno5g0pbjez/8DXQlB8NUNa
         j40kDTCSUH/pzndbEZDmgg94qGRluk/UIN8yRMEw=
Message-ID: <303e3d6b-93c6-a434-945a-15b5017b6772@ideasonboard.com>
Date:   Mon, 1 Aug 2022 09:28:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 00/30] v4l: routing and streams support
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <Yubqc1biiQTE3gvY@valkosipuli.retiisi.eu>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yubqc1biiQTE3gvY@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 31/07/2022 23:47, Sakari Ailus wrote:
> Moi,
> 
> On Wed, Jul 27, 2022 at 01:36:09PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> This is v12 of the streams series. The v11 can be found from:
> 
> Thanks for the update. This continues to be a set that will need changes
> before merging, hopefully less so than in the past. But at the same time I
> think there are a number of patches early in the set that could be merged
> now. Specifically I mean patches 1--5 and 7.
> 
> I'll pick those if there are no objections once we have rc1 in media tree.
> That should at least make it a little easier to work with the rest.

I'm fine with that.

Everything up to, and including, patch 9 are kernel-only patches, they 
don't change the uAPI.

  Tomi
