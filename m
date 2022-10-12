Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DE45FC05E
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiJLF7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 01:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiJLF7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 01:59:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B14ACA3E
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 22:59:10 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8448C4DB;
        Wed, 12 Oct 2022 07:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665554347;
        bh=PNcsmgforVagHxChMyoF0yluHdq6+5PAtl5Q/nB9suY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=LsaPmeua6ELuHXPwVgJyI3FkQlGAwunQmZStjWUQIULfbwTrRXZizcZ5vauFjBDNl
         k+HfhNOzFH0bwM/d41SG5tST3040y/AneDvzjXmWSCfk4S0gMpT4EYOb67f7vmd91v
         Pkz585xipsrwUIevOEk0z+PU5OSP73DsexoK76P4=
Message-ID: <e1b32736-5f45-52d4-4a90-7f92f27cd8c9@ideasonboard.com>
Date:   Wed, 12 Oct 2022 08:59:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 17/19] media: v4l2-subdev: Add subdev
 .(enable|disable)_streams() operations
Content-Language: en-US
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-18-tomi.valkeinen@ideasonboard.com>
 <20221010165315.fcvmtw3xhsr43tu3@guri>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221010165315.fcvmtw3xhsr43tu3@guri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/10/2022 19:53, Dafna Hirschfeld wrote:
> On 03.10.2022 15:18, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Add two new subdev pad operations, .enable_streams() and
>> .disable_streams(), to allow control of individual streams per pad. This
>> is a superset of what the video .s_stream() operation implements.
>>
>> To help with handling of backward compatibility, add two wrapper
>> functions around those operations, and require their usage in drivers.
> 
> Hi, what does it mean 'require their usage in drivers'?
> Drivers suppose to call these helpers in the s_stream implementation?

The drivers should use v4l2_subdev_enable_streams() and 
v4l2_subdev_disable_streams() when they want to enable/disable the 
source subdevice (which is most likely in .s_stream or 
.enable_streams/.disable_streams).

The "require" there means that drivers should never call 
.enable_streams/.disable_streams directly, as mentioned in their help 
texts, but instead they should always call the helpers.

  Tomi

