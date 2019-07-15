Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B062D68A42
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 15:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730189AbfGONK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 09:10:58 -0400
Received: from ns.iliad.fr ([212.27.33.1]:49388 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730098AbfGONK6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 09:10:58 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 4C7912017A;
        Mon, 15 Jul 2019 15:10:56 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 337A120080;
        Mon, 15 Jul 2019 15:10:56 +0200 (CEST)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Subject: DVB abstractions: filters and feeds
Message-ID: <207e17ad-7469-211f-8862-b08045e1183d@free.fr>
Date:   Mon, 15 Jul 2019 15:10:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul 15 15:10:56 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm having a hard time understanding two abstractions in the DVB framework,
namely filters and feeds (P.S. I now see there are dvb_demux_filter's and
dmxdev_filter's, so it's really 3 abstractions that I'm not grasping.)

Specifically,

struct dvb_demux {
	...
	int filternum;
	int feednum;
	struct dvb_demux_filter *filter;
	struct dvb_demux_feed *feed;

and

struct dmxdev {
	...
	struct dmxdev_filter *filter;
	int filternum;


Also, I'm not sure about the relationship between dvb_demux and dmxdev.
Should they have the same filternum for a given adapter instance?

Basically, could someone shed a bit of light on these topics?


https://linuxtv.org/downloads/v4l-dvb-apis-new/kapi/dtv-demux.html?highlight=dmxdev#c.dmxdev
struct dmxdev : "Describes a digital TV demux device." /me puzzled

https://linuxtv.org/downloads/v4l-dvb-apis-new/kapi/dtv-demux.html?highlight=dvb_demux#c.dvb_demux
struct dvb_demux : "represents a digital TV demux"


Regards.
