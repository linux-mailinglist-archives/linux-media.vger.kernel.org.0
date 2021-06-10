Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBDD3A2B5B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 14:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhFJMXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 08:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhFJMXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 08:23:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12F1C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 05:21:07 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08DBE8D4;
        Thu, 10 Jun 2021 14:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623327666;
        bh=+Tac8xKivHcNrfHq4KlD/SP6TR+MfseR+CWH3Iyr0n0=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=KXycUo/GdfWv3LbN6CmMryt4clVUAEotL90dkKZijgmNecrMML8A6JHi6QcO5yvjT
         U5MnjTiTFMbX08SE5nbChFZ9HdferhLtC3J8lKXB/SmMfnUK6Z0+OBj+OPJ3rNF/D4
         t8GlJl8VHE+lnBiVgg4GZKnFIgZl+m0rkhKavOJ4=
Subject: Re: [PATCH v4 0/1] media: v4l2-subdev: add subdev-wide state struct
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210610115453.2578621-1-tomi.valkeinen@ideasonboard.com>
 <48bb3595-f541-2dfa-aabb-8040c4e1425d@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <8a9113c4-cba5-d310-7fc7-0a8871bf0c6e@ideasonboard.com>
Date:   Thu, 10 Jun 2021 15:21:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <48bb3595-f541-2dfa-aabb-8040c4e1425d@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2021 15:16, Hans Verkuil wrote:
> On 10/06/2021 13:54, Tomi Valkeinen wrote:
>> Hi,
>>
>> v4 of the patch. Addressed comments from Hans, Sakari and Laurent:
>>
>> - driver kernel-doc fixes (due to renaming cfg to sd_state)
>> - v4l2_subdev_free_state to accept NULL
>> - rename and fix check_cfg()
>> - fix omap3isp indentations
> 
> Against what tree is this patch? It fails to apply to either media_tree/master
> or media_stage/master.

Odd. It's against:

git://linuxtv.org/media_tree.git master

which is 5b448065febe

Something gets broken due to the size, perhaps?

I've pushed my branch to

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git config-change-v4

  Tomi
