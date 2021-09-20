Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9421E410FE1
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 09:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbhITHQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 03:16:57 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:32772 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234571AbhITHQ4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 03:16:56 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Sep 2021 03:16:56 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1632122130; x=1663658130;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-id:content-transfer-encoding;
  bh=pcskR+AXsFiTVlXyusN6C6reiKLyH/73loxhkbl2iO0=;
  b=guJRDLKrgnQh5gme7OobDmfqL2Te9oRdDG6MmkzaSdJ/JYxbVzy96smA
   iMUZpx6oklH5Gzbxl3ikRrX8mrwGJ5JtoQ48kWguyvfBbWo7O90DRDMy/
   Gfe16nqtBxQoAuZlrvGR/C/2khE3H6zeLYuJDPG8Ip0xsEYKEbXwG9yYo
   6fcFTEsUbfKsfcDRTB3VSHilp3sVRaug7s0pt1hZJMlCb1na+2ky7ChEy
   AIUzLFyHZB6pKK0ajUEH4BrXH7ZAm3iRW/C31MvDHQHsBBC44QYVEQ+MI
   VUREHAvPQn7yuUMzJERMh1a14AV9Kq301F156aTYEW8ULIlUFFqZhm5uZ
   Q==;
X-IronPort-AV: E=Sophos;i="5.85,307,1624312800"; 
   d="scan'208";a="19591006"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Sep 2021 09:08:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 20 Sep 2021 09:08:21 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 20 Sep 2021 09:08:21 +0200
X-IronPort-AV: E=Sophos;i="5.85,307,1624312800"; 
   d="scan'208";a="19591005"
Received: from vmail02.tq-net.de ([10.150.72.12])
  by mx1.tq-group.com with ESMTP; 20 Sep 2021 09:08:18 +0200
Received: from vmail01.tq-net.de (10.150.72.11) by vmail02.tq-net.de
 (10.150.72.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 09:08:18 +0200
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2308.014; Mon, 20 Sep 2021 09:08:18 +0200
From:   "Stein, Alexander" <Alexander.Stein@tq-group.com>
To:     "mani@kernel.org" <mani@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Sony IMX290 link frequency
Thread-Topic: Sony IMX290 link frequency
Thread-Index: AQHXre5JzF/aKpNWCk+hzVQ71Sk0Gw==
Date:   Mon, 20 Sep 2021 07:08:18 +0000
Message-ID: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <27669FF8B7540B4F8CEC9EE6DFD6C304@tq-group.com>
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNCnRoZSBpbXgyOTAgZHJpdmVyIHNwZWNpZmllcyAyIHRhYmxlcyBvZiBsaW5rIGZy
ZXF1ZW5jaWVzLCBkZXBlbmRpbmcgb24NCm51bWJlciBvZiBsYW5lcyBhbmQgdGhlIHZlcnRpY2Fs
IHJlc29sdXRpb24uDQpUaGVzZSBudW1iZXJzIHZhcnkgZnJvbSAxNDguNSBNSHogdXAgdG8gNDQ1
LjUgTUh6Lg0KSSdtIHdvbmRlcmluZyB3aGVyZSB0aGVzZSBudW1iZXIgY29tZSBmcm9tLCBpdCdz
IG5vdCBjbGVhciBmb3IgbWUuIEFsc28NCnNob3VsZG4ndCB0aG9zZSBudW1iZXJzIGFsc28gZGVw
ZW5kIGluIGJpdHMgcGVyIHBpeGVsIGFuZCB0aGUgZnJhbWVzDQpwZXIgc2Vjb25kPw0KSSBzdXNw
ZWN0IHRoYXQgdGhlIHJldHVybmVkIGxpbmsgZnJlcXVlbmN5IGlzIG5vdCBjb3JyZWN0IHdoaWNo
IGJyZWFrcw0KdGhpbmdzIGZ1cnRoZXIgZG93biB1c2luZyB2NGwyX2dldF9saW5rX2ZyZXEoKS4N
Cg0KQmVzdCByZWdhcmRzDQpBbGV4YW5kZXINCi0tIA0KaS5BLiBBbGV4YW5kZXIgU3RlaW4NCkVu
dHdpY2tsdW5nIFN0YW5kb3J0IENoZW1uaXR6DQpUZWwuICs0OSAzNzEgNDMzMTUxLTAsIEZheCAr
NDkgMzcxIDQzMzE1MS0yMg0KWndpY2thdWVyIFN0cmHDn2UgMTczLCAwOTExNiBDaGVtbml0eg0K
bWFpbHRvOiBBbGV4YW5kZXIuU3RlaW5AdHEtZ3JvdXAuY29tDQogDQpUUS1TeXN0ZW1zIEdtYkgN
Ck3DvGhsc3RyYcOfZSAyLCBHdXQgRGVsbGluZywgODIyMjkgU2VlZmVsZA0KQW10c2dlcmljaHQg
TcO8bmNoZW4sIEhSQiAxMDUwMTgNClNpdHogZGVyIEdlc2VsbHNjaGFmdDogU2VlZmVsZA0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IERldGxlZiBTY2huZWlkZXIsIFLDvGRpZ2VyIFN0YWhsLCBTdGVmYW4g
U2NobmVpZGVyDQp3d3cudHEtZ3JvdXAuY29tDQo=
