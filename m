Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9236E54B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 13:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfGSL6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 07:58:32 -0400
Received: from quake1.xnet.com ([198.147.221.67]:63927 "EHLO quake1.xnet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfGSL6c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 07:58:32 -0400
X-Greylist: delayed 499 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Jul 2019 07:58:27 EDT
Received: from [192.168.2.5] (c-98-213-182-234.hsd1.il.comcast.net [98.213.182.234])
        by quake1.xnet.com (Postfix) with ESMTP id A26B9B44
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2019 06:50:07 -0500 (CDT)
To:     linux-media@vger.kernel.org
From:   JohnG <tardis@xnet.com>
Subject: scancodes identified as invalid
Message-ID: <5370cd2b-f699-7831-e040-4b27e7f0cdaa@xnet.com>
Date:   Fri, 19 Jul 2019 06:50:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have POWER_KEY scancodes, that work as RAW data with ir-ctl -s [file], 
but are not working with ir-ctl -S:

     0x20df10ef (POWER_KEY for my LG tv)
     0x02FD48B7 (POWER_KEY for my Toshiba tv)

rc6_mce:0x800f0410 works, as does nec32:0x800f0410 (though not 
nec:0x800f0410), so it doesn't seem to be an issue with 32-bit codes.

I use AnalysIR, and it indicates the protocol is NEC for the above 
codes, though irdb.tk indicates the protocol is NEC1.

1) is there a description of the various protocols? (how can I know if I 
should use nec or nec32, with a 32 bit value?)

2) are my scancodes failing to work, because they are (possibly) NEC1 
protocol?

3) if NEC1 is not the same as nec or nec32, is it scheduled to be added 
to ir-ctl in the near future?

JohnG

