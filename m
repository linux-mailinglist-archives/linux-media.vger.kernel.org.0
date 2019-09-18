Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFA0B5E03
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 09:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfIRH2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 03:28:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60705 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfIRH2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 03:28:22 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iAUNw-00086D-SW; Wed, 18 Sep 2019 09:28:20 +0200
Message-ID: <1568791700.3046.1.camel@pengutronix.de>
Subject: Re: coda9 jpeg support?
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Date:   Wed, 18 Sep 2019 09:28:20 +0200
In-Reply-To: <CAJ+vNU1ME9RT0_Jdy9j0ocvfU8imyBqZip6Y8Gfj27B6P4JvAQ@mail.gmail.com>
References: <CAJ+vNU1F0OU6j9ZbQyXwuc1JbEYrbOEK0h7hHBf-VhWrefhvpw@mail.gmail.com>
         <1568730830.8808.1.camel@pengutronix.de>
         <CAJ+vNU1ME9RT0_Jdy9j0ocvfU8imyBqZip6Y8Gfj27B6P4JvAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, 2019-09-17 at 12:00 -0700, Tim Harvey wrote:
[...]
> I have pulled your branch and boot-tested it. I see the 2 new video
> devices but noticed that the JPEG decoder shows up as an element for
> video4linux2 the JPEG encoder doesn't show up (gstreamer v1.14.5) -
> any idea why that would be?

Yes, v4l2jpegenc was added in 1.16

regards
Philipp
