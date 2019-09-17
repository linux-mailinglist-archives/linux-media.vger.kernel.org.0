Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 578A5B506E
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 16:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbfIQOdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 10:33:52 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55665 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728208AbfIQOdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 10:33:52 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iAEYB-0004jb-56; Tue, 17 Sep 2019 16:33:51 +0200
Message-ID: <1568730830.8808.1.camel@pengutronix.de>
Subject: Re: coda9 jpeg support?
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>
Date:   Tue, 17 Sep 2019 16:33:50 +0200
In-Reply-To: <CAJ+vNU1F0OU6j9ZbQyXwuc1JbEYrbOEK0h7hHBf-VhWrefhvpw@mail.gmail.com>
References: <CAJ+vNU1F0OU6j9ZbQyXwuc1JbEYrbOEK0h7hHBf-VhWrefhvpw@mail.gmail.com>
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

On Fri, 2019-09-13 at 09:00 -0700, Tim Harvey wrote:
> Greetings,
> 
> What would need to be done to support JPEG enc/dec for coda9?

here is a WIP that still needs some cleanup for upstreaming:

  https://git.pengutronix.de/cgit/pza/linux/log/?h=coda/jpeg

Basically I'd like to avoid adding yet another JPEG header parser to the
kernel, as we already have at least three:
  drivers/media/platform/rcar_jpu.c
  drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
  drivers/media/platform/s5p-jpeg/jpeg-core.c

I want to allow probing without the BIT processor firmware for blobless
JPEG-only support, and I'd like the JPEG codec to be able to run
concurrently with the BIT processor codec.

I'm working on this this week.

regards
Philipp
