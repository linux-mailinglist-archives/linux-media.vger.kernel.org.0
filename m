Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA732BF8F5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 20:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbfIZSND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 14:13:03 -0400
Received: from tatiana.utanet.at ([213.90.36.46]:51304 "EHLO tatiana.utanet.at"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbfIZSND (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 14:13:03 -0400
X-Greylist: delayed 1765 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Sep 2019 14:13:02 EDT
Received: from pam-s.drei.host ([213.90.36.66])
        by tatiana.utanet.at with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <shadowlord@utanet.at>)
        id 1iDXni-0007ZD-Ts; Thu, 26 Sep 2019 19:43:34 +0200
Received: from 193-154-46-167.adsl.highway.telekom.at ([193.154.46.167] helo=[10.20.30.40])
        by pam-s.drei.host with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <shadowlord@utanet.at>)
        id 1iDXni-0003z8-Oh; Thu, 26 Sep 2019 19:43:34 +0200
Subject: Re: [Mjpeg-users] bringing back media/zoran driver
To:     MJPEG-tools user list <mjpeg-users@lists.sourceforge.net>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
References: <20190921170357.GA26626@Red>
From:   Bernhard Praschinger <shadowlord@utanet.at>
Cc:     Mjpeg Developer <mjpeg-developer@lists.sourceforge.net>
Message-ID: <3017c9c1-17b4-8716-8d37-24084a58461f@utanet.at>
Date:   Thu, 26 Sep 2019 19:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <20190921170357.GA26626@Red>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-H3G-Authenticated-As: 2492d812503ae882f041a3ed11d939a345349e8a
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hallo

Corentin Labbe wrote:
> hello
> 
> I am the owner of a zoran based DC10+ card.
> I am in the need of using it since yesterday and I found that its driver was removed.
> 
> Reverting the removing patch made to a temporary working situation.
> 
> If I understand correctly, it was removed due to lack of vb2 convertion.
> If I am able to do this vb2 conversion, does bring it back in mainline will be posssible ?
> In that case I am ready to assume to be the maintainer if needed.
It would be a great thing if you update the driver and get is into a 
good state.
Most of the people involved in the (mjpeg, zoran driver) project have 
different interests.

If you want some space on the mjpeg project on Sourceforce let me know I 
can arrange that, and if you tell me I'll update various pages.

Getting a machine with PCI for testing the driver is possible for me. I 
still have a old borrowed but and a DC30 at home.

Regards,
Bernhard Praschinger
