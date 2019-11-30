Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49AB210DD9E
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2019 13:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfK3M0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 07:26:38 -0500
Received: from zeus.seaquake.net ([195.62.218.101]:52174 "EHLO
        zeus.seaquake.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfK3M0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 07:26:38 -0500
Received: from [192.168.8.111] (unknown [81.96.60.135])
        by zeus.seaquake.net (Postfix) with ESMTP id 9AA9D21C116
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2019 12:26:37 +0000 (GMT)
To:     linux-media@vger.kernel.org
From:   Steven Maddox <s.maddox@lantizia.me.uk>
Subject: em28xx: new board id [0b1a:2820]
Message-ID: <623be288-0fe5-8313-bd40-7223e045c796@lantizia.me.uk>
Date:   Sat, 30 Nov 2019 12:26:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I've made tests with my StarTech.com board:

Model: USB 2.0 to Composite and S-Video Capture Cable SVID2USB2NS
Vendor/Product id: [0b1a:2820].

Tests made:

    - Analog [Worked]
    - DVB    [this board doesn't support dvb mode]

Note: Only tested composite by using input 1 via v4l2 by using card=14
(which is EM2820_BOARD_PROLINK_PLAYTV_USB2 as that has a very similar
USB product ID)

Images of the actual device here:
https://photos.app.goo.gl/vh19iFzZuokjhNZq6


~lantizia
