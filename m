Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC11432129
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 01:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfFAXlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 19:41:31 -0400
Received: from resqmta-po-04v.sys.comcast.net ([96.114.154.163]:35628 "EHLO
        resqmta-po-04v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfFAXlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Jun 2019 19:41:31 -0400
Received: from resomta-po-17v.sys.comcast.net ([96.114.154.241])
        by resqmta-po-04v.sys.comcast.net with ESMTP
        id XD0zhnmA0d4wBXDV5hihbE; Sat, 01 Jun 2019 23:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1559432003;
        bh=/YfxZJjiQez5lydNaQDlhF87AQ8ivWgL0uroog7jX7g=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=x1TGfQPc5nHLq4Wp0BxB+EwnEefi9yXhUK6udV+Ojat4LoLFUmylVLGAEY36Dzihd
         6UA74WtBZxyANL3l1kjRMZNd2spB//x6TvdZGs73Pe3L9VAzeGusyTY7eiQG3Nujfq
         WYl+vAOfYFXRRXIVeV4O5DAFPkGuUg/hlck+F8c5gGPQWtW+ExcsGwfy8nZI2Hvt1F
         UpunLeakanZtXDZFoPjpSwRJhjVdLGCC7cSQ5cIYU40oiKdUsGOznZSwnkYOtnMR53
         KrvBR7aqb1sUGRj/KVmuT58ZMIqLitTf10HJNEdnRWrx+8O7hEJW/AJMUCnV84Ikux
         0NmMbV5gbq67A==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-17v.sys.comcast.net with ESMTPA
        id XDUphogfO0ExbXDV4h6aso; Sat, 01 Jun 2019 23:33:23 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvffkffgfgggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgesohhsghdrshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehsvggrnhesmhgvshhsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
From:   A Sun <as1033x@comcast.net>
Subject: [PATCH v1 0/3] [media] mceusb: Error message text and reporting
 revisions
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Message-ID: <b1d16ea3-71cb-1298-f0d0-f34fccab2d27@comcast.net>
Date:   Sat, 1 Jun 2019 19:33:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several error message and error reporting revisions for mceusb.c

proposed patches applicable to mceusb.c version
https://github.com/torvalds/linux/blob/master/drivers/media/rc/mceusb.c
Mar 1, 2019 commit 04ad30112aec61004f994d8f51461ec06e208e54


Test platform:

Raspberry Pi 3B+
Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux

mceusb 1-1.2.7:1.0: long-range (0x1) receiver active
mceusb 1-1.2.7:1.0: Registered Pinnacle Systems PCTV Remote USB with mce emulator interface version 1
mceusb 1-1.2.7:1.0: 2 tx ports (0x3 cabled) and 2 rx sensors (0x1 active)

