Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DFA24D4A7
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgHUMGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:06:36 -0400
Received: from mail2.skidata.com ([91.230.2.91]:29770 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727029AbgHUMGb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598011589; x=1629547589;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/IjEc+G+dRlS3h1lVOXg1grQ0shqLL2p9PLulwPgH3s=;
  b=PqhVvlB7Zm8kFpyxDa4kekYWBRwno8ex79Q+TNyd422X6PEvZJ9nHbjp
   nx4Wu6b/dP6TGDLuaVgL9N789pkLKs+tG7Gep/uagrNmF4PP22xIIp8Tz
   984DqXWamu6pZLS9LGpUt5fd6YnDaRbfh6/kOqPxB6i0L3zG80l6co3Gs
   sB00PS+lLNI3SOQUwdOSN3OmhHik9sJPrrs+Kea5G3cTpAhSql37J7Pg/
   K9yHh8EM84bqIYx5nkE+O5mtoegC4Zgg5OaAGqeMo+3ZM+IjrqeCt56Kn
   +qnIym/VL5ULLODZz//dc30TiHDCt1rqCHyJK4x8LLN8xyfbL/XBVZ+1d
   Q==;
IronPort-SDR: TX+avkr6P0SF1qLQvez799JdwigZhiedC4UbYFUElhIxFJ4s4Pebfa3uxfXGAQJxvCiorBDZPb
 Y9j7WoHt6IOya84JpUxsA7oAhfvEgNbT0YUFJ2oZ7EZHhz7FHrZZBSUHYi6FzUNVS43rMPYwEe
 kS28WNAT0jVfU6VypXw+a6gZgNJujC+lTGV+u0nvXFiKWYkEaP8tkhouOmMDbUqKPXkIK9VcJU
 ocCB+tiZdX3/DdNMyDNFuCbi+hGohkr7TCDx5g7fXBLsWjTsDPT5k/CyU5/2j5JEjOOwstC69L
 990=
X-IronPort-AV: E=Sophos;i="5.76,335,1592863200"; 
   d="scan'208";a="2647787"
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Richard Leitner - SKIDATA" <Richard.Leitner@skidata.com>
Subject: RE: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Topic: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Index: AdZ3sFkqxzglukE+Rf6iMENtrYblXQAAhVYw
Date:   Fri, 21 Aug 2020 11:59:18 +0000
Message-ID: <9444c9375f58436b9e6a0fa3a4088e17@skidata.com>
References: <3b140eaf883b4666985c0be0db8d53e8@skidata.com>
In-Reply-To: <3b140eaf883b4666985c0be0db8d53e8@skidata.com>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Our CODA960 MPEG4 decoder (i.MX6) is starving with small "static" videos.
The problem seems to occur when an I frame of size > 512 is followed by
a P frame with size < 256, e.g. reproducible with a single-color video
(or any other video with little movement) and a GoP > 1.

When hunting the problem down, it seems to be related to commit
c3d996fb03c6539771ad778cd66ff5595bfc263a, concretely
the coda_bitstream_can_fetch_past [1] call in coda_fill_bitstream [2].
In the described case, the function returns true, since the I frame reaches
the 512 byte threshold, however the requirement seems to be 2x 256,
therefore the second period has not enough data with the following P frame,
which leads to a CODA PIC_RUN timeout [3] because of starvation.

The patch enqueues another buffer if the queue-tail is below the threshold.
This ensures that the second 256 byte period is filled up for the next run.

However, if the next frame(s) are also below the threshold, the same happen=
s
in reverse order since multiple metas are required to fill the "current" pe=
riod
(see failure log below).
Also in this case buffers are enqueued until the window is filled again.

This should cover all cases without looping through the active metas.

Best regards
Benjamin


[1] https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/c=
oda/coda.h#L340
[2] https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/c=
oda/coda-bit.c#L355
[3] https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/c=
oda/coda-common.c#L1540

*Failure Log*:
[   77.217862] coda 2040000.vpu: 0: active metas:
[   77.217872] coda 2040000.vpu: 0: - payload: 107
[   77.217877] coda 2040000.vpu: 0: - payload: 107
[   77.217882] coda 2040000.vpu: 0: - payload: 107
[   77.217887] coda 2040000.vpu: 0: - payload: 107
[   77.217892] coda 2040000.vpu: 0: - payload: 332
[   77.217896] coda 2040000.vpu: 0: want to queue: payload: 824
[   78.236142] coda 2040000.vpu: CODA PIC_RUN timeout

