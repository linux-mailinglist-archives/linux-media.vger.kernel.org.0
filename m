Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D552C49C178
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 03:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbiAZCxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 21:53:51 -0500
Received: from mx1.librem.one ([138.201.176.93]:52312 "EHLO mx1.librem.one"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236658AbiAZCxv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 21:53:51 -0500
X-Greylist: delayed 374 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Jan 2022 21:53:51 EST
Received: from smtp.librem.one (unknown [192.241.214.14])
        by mx1.librem.one (Postfix) with ESMTPS id 322A581E8B
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 18:47:35 -0800 (PST)
Authentication-Results: name mx1.librem.one; dmarc=fail (p=none dis=none) header.from=librem.one
Authentication-Results: mx1.librem.one;
        dkim=pass (2048-bit key; unprotected) header.d=librem.one header.i=@librem.one header.b="V1HK+TOv";
        dkim-atps=neutral
To:     linux-media@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=librem.one; s=smtp;
        t=1643165253; bh=8LH0ITxr7/BJuu+hgqO+0MXC5CPrUHx+Q5JwuTITNW8=;
        h=To:From:Subject:Date:From;
        b=V1HK+TOvz3S9CUsGfYCKDAN6bcO7S+IhoI8SjelQj2xbQJtgRnbJ80O54NGqYZnZ0
         2n6bebQaz+9trUluYB47kzztN8EvRIbYQ0wrsosSCkMN+9HMZ7Dd4h6zFrz+0SSyOd
         nAGMlj9XAaRQV7Q8VAJZODNTclmU/24sKd4JwKkFdrndVzGalmVchQtmFY1DCGsM1y
         F2/8zIfB1JDIn+7IqGmarQHa/A1UFB7aoi0c8k2fd5UxEWAIAGQ2HRDVbyYkajA+B/
         Do7D6PdAaUtZkiOMfrVTtcHXkmFy0qTsqfL8KwQxm4rVzGfs5AAeG5MQ3jUcu/5jv5
         aqG+yvXW1UHEQ==
From:   Mohammad <moin@librem.one>
Subject: Get j5 WebCam JVCU100 supported by Linux UVC driver
Message-ID: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one>
Date:   Tue, 25 Jan 2022 20:47:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

R3JlZXRpbmdzLAoKSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIHVzZSB0aGUgajUgV2ViQ2FtIEpW
Q1UxMDAgb24gTGludXggYW5kIGl0IGRvZXNuJ3QKZnVuY3Rpb24gcHJvcGVybHkuwqAgQ2hl
ZXNlIGNhbm5vdCBzZWVtIHRvIGZpbmQgaXQsIGFuZCBJIGRpZCBub3Qgc2VlIGl0Cmxpc3Rl
ZCBvbiB5b3VyIGxpc3Qgb2Ygc3VwcG9ydGVkIGRldmljZXMsIHNvIEkgdGhvdWdodCBJIHdv
dWxkIGJyaW5nIGl0CnRvIHlvdXIgYXR0ZW50aW9uLsKgIEhlcmUgaXMgd2hhdCBJIHNlZSBm
cm9tIHJ1bm5pbmcgbHN1c2I6CgpCdXMgMDAxIERldmljZSAwMDY6IElEIDA3MTE6MzEwOCBN
YWdpYyBDb250cm9sIFRlY2hub2xvZ3kgQ29ycC4gajUKV2ViQ2FtIEpWQ1UxMDAKCkFsc28s
IHJ1bm5pbmcgbHN1c2IgLWQgMDcxMTozMTA4IC12IHwgZ3JlcCAiMTQgVmlkZW8iIHJldHVy
bnMKCkNvdWxkbid0IG9wZW4gZGV2aWNlLCBzb21lIGluZm9ybWF0aW9uIHdpbGwgYmUgbWlz
c2luZwrCoMKgwqDCoMKgIGJGdW5jdGlvbkNsYXNzwqDCoMKgwqDCoMKgwqDCoCAxNCBWaWRl
bwrCoMKgwqDCoMKgIGJJbnRlcmZhY2VDbGFzc8KgwqDCoMKgwqDCoMKgIDE0IFZpZGVvCsKg
wqDCoMKgwqAgYkludGVyZmFjZUNsYXNzwqDCoMKgwqDCoMKgwqAgMTQgVmlkZW8KwqDCoMKg
wqDCoCBiSW50ZXJmYWNlQ2xhc3PCoMKgwqDCoMKgwqDCoCAxNCBWaWRlbwrCoMKgwqDCoMKg
IGJJbnRlcmZhY2VDbGFzc8KgwqDCoMKgwqDCoMKgIDE0IFZpZGVvCgpTbywgbG9va3MgbGlr
ZSB0aGUgTGludXggVVZDIGRyaXZlciBhdCBsZWFzdCByZWNvZ25pemVzIHRoZSB3ZWJjYW0u
wqAKUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBjYW4gaGVscCB3aXRoIHRoaXMsIHRoYW5r
cyEKClJlZ2FyZHMsCgpNb2hhbW1hZAoK
