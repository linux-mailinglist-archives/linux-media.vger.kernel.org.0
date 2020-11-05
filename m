Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2207C2A787F
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKEICM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:02:12 -0500
Received: from pe2mbs.xs4all.nl ([80.100.157.240]:53924 "EHLO mail.pe2mbs.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgKEICM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 03:02:12 -0500
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.pe2mbs.nl (Postfix) with ESMTPSA id 4BA483031F;
        Thu,  5 Nov 2020 08:02:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 05 Nov 2020 09:02:09 +0100
From:   m.bertens@pe2mbs.nl
To:     Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Media <linux-media@vger.kernel.org>
Subject: REPOST: Questions abount driver development and Geniatech X9320
 DVB-S/S2 PCIe Tuner
In-Reply-To: <8b1bffe2e2b995f674f9135d70a7a23e@pe2mbs.nl>
References: <8b1bffe2e2b995f674f9135d70a7a23e@pe2mbs.nl>
Message-ID: <0a4118812999952ca41f3e5deb095c43@pe2mbs.nl>
X-Sender: m.bertens@pe2mbs.nl
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



-------- Original Message --------
Subject: Questions abount driver development and Geniatech X9320 
DVB-S/S2 PCIe Tuner
Date: 2020-11-02 10:38
 From: m.bertens@pe2mbs.nl
To: Linux Media <linux-media@vger.kernel.org>

Hi,

I'm trying to get Geniatech X9320 DVB-S/S2 PCIe Quad Tuner card working,
but i'm new to linux kernel drivers developement

It has a similar hardware configuration as TechnoTrend TT-connect 
S2-4600
* D720201    USB host controller
* cy68013A   USB bridge (4x)
* m88ds3103  Demodulator (4x)
* m88ts2022  Tuner (4x)

As it seems to me all components are supported by Linux, but they are 
for another device.

I have taken a look in the dw2102.c driver source code, and I see that 
there is firmware
loaded, my question is: where is this firmware going?: into the cy68013A 
or m88ds3103 chips?
or somewhere else?.

I looked at the site Geniatech, but even that they say there is a Linux 
driver
in the archive the actual implementation is not there.

I hope that there is anyone how can help me to get this card working 
under Linux.


Kind regards,


Marc Bertens-Nguyen
PE2MBS
