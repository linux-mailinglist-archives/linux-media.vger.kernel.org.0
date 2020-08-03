Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8718223A096
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 10:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgHCIDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 04:03:31 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:34536 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgHCIDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 04:03:30 -0400
X-Greylist: delayed 379 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Aug 2020 04:03:30 EDT
Received: from fiber2.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id E2AC444A8292;
        Mon,  3 Aug 2020 09:57:10 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 Aug 2020 09:57:10 +0200
From:   robin <robin@protonic.nl>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andreas Pretzsch <apr@cn-eng.de>
Subject: Re: [PATCH] media: i2c: tvp5150: Fix horizontal crop stop boundry
In-Reply-To: <20200729092901.yfic3vywmnykncod@pengutronix.de>
References: <20190917071442.24986-1-robin@protonic.nl>
 <23cbd4c0-b53e-d01f-e6d6-b4d2d689bb59@xs4all.nl>
 <20200729092901.yfic3vywmnykncod@pengutronix.de>
Message-ID: <84c46468036e9a1add2249a4e2cfe89e@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Marco,

On 2020-07-29 11:29, Marco Felsch wrote:
> Hi,
> 
> On 20-06-25 13:05, Hans Verkuil wrote:
>> On 17/09/2019 09:14, Robin van der Gracht wrote:
>> > The value for AVID stop is relative to the width of the active video area,
>> > not the maximum register value. Zero means equal and a negative value means
>> > we're cropping on the right side.
>> 
>> While going through old unreviewed patches I came across this one 
>> (sorry Robin,
>> your patch fell through the cracks).
>> 
>> Can someone verify/test that this is correct? Marco perhaps?
> 
> sorry for my long absence on this. I will test it next week if it is 
> not
> already to late.

Thanks. Let me know if you need more info.

Robin
