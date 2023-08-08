Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBAEA773D08
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbjHHQNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjHHQL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:11:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F04527DAD
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:46:53 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 474749B4;
        Tue,  8 Aug 2023 08:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691474821;
        bh=wMMir2MBx/x58TfNiF/Re7Hd1Pph3u7M5xTUcwOTjLg=;
        h=Date:Subject:From:To:References:In-Reply-To:From;
        b=bzEcBROcWc5c6nzOedfdt/O03zhkfCtuUNKWc3E6PF0tOYWndaGyNmaP2zd41spDa
         NmKe6Cqyj8eZTxwxmxKuosAJidpNNVSrEArHjg5wQbUuRnyxaqonFLCeYjG416+TVH
         8cl79seMrsEsf1Ma+TGoT80BzgwhS2MYJx5XJ9jE=
Message-ID: <9270b0c4-5d40-7df2-0441-4f86d8783832@ideasonboard.com>
Date:   Tue, 8 Aug 2023 09:08:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 5/8] v4l2-ctl/compliance: Add simple routing test
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230720075044.442021-1-tomi.valkeinen@ideasonboard.com>
 <20230720075044.442021-6-tomi.valkeinen@ideasonboard.com>
 <2c282976-5890-8da9-ac6b-cdc642ab9d99@xs4all.nl>
 <94fefde1-02c9-6034-72cc-e6a30aa3f786@ideasonboard.com>
In-Reply-To: <94fefde1-02c9-6034-72cc-e6a30aa3f786@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/08/2023 08:56, Tomi Valkeinen wrote:

>> I assume that num_routes is always updated to the actual number of 
>> routes, right?
> 
> If VIDIOC_SUBDEV_G_ROUTING succeeds, yes, num_routes is updated.
> 
>> That's not actually explained clearly in the spec. It says that if the 
>> app provided
>> num_routes is too small, then it is updated, but it says nothing about 
>> what happens
>> if the app provided value is too large.
> 
> Ok. I need to update the doc.

Actually, I have already sent a patch for that, "[PATCH] media: 
Documentation: Fix [GS]_ROUTING documentation" on 20th July.

  Tomi

