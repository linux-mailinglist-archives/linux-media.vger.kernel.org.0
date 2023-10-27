Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716447D9574
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 12:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjJ0Ko2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 06:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjJ0Ko2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 06:44:28 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61FC129
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1698403463; x=1699008263; i=j-p-t@gmx.net;
        bh=/LPrTEXv4Xq8ir6OTnE/aupILrywvK8Y4w7RQ2fyAjk=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=FW8zFtbnNgZzpIqCR7VC/9LRC4DjjkDFszhQdf4aOdUkP2Vgu+f7wKU93uTZ9Crw
         tlHyTZ/tGbEV3ct7jCNV94Oq5EzkH7SeUijishJg/fSJoM8Jovh4YpdAOGl//mE2R
         K+SHxvbQkeIWhFHBNjKVNJebM79U0s+noQM2bgmEuVX8f8lcKRvpk3G2TbNQb4Iy1
         sNnV+GgwSx3F00nWAko6pdYLxJhA+ixfzpyzYK5oXX9aae9kmFGACoe7QKdW7JPpD
         mrfxHiVsL0xYGWAEcailjF6Z8rA1z0S1oCn9urxaod0SoxCSzmOjoejHRpv6j1iYf
         lJg3vEeSNs4Q5fqVOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.58] ([45.14.97.35]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1rF5f83z1g-00IoZw for
 <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 12:44:23 +0200
Message-ID: <58d19b90-1878-4a18-bed0-0d5c51ae7235@gmx.net>
Date:   Fri, 27 Oct 2023 12:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To:     Linux Media Subsystem <linux-media@vger.kernel.org>
From:   JPT <j-p-t@gmx.net>
Subject: [dtv-scan-tables] new DVB-C submission for dvb-c/de-Hanau-Synvia
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XRKt4jOMpjQJjDZW87Naml7I/Rdjg5/9fKUndAlwhF+hkSqzX3P
 cpFbi6cGMicaO3lr8igYY+yt8JlEIvbSKIN/oLZMgtEzplSWUeNX/mI0rTNUlKv8EuG5wuW
 yFN6wZruSaAke3jG4aW+uxLlE54FxUIboMjsoYfgI0PXrLXZlmMpur+SLPyh4TQn34z2e7U
 54D/lBI0+bgAnjwlp1Nhg==
UI-OutboundReport: notjunk:1;M01:P0:a1zIpyiR+2o=;qcss0qcESLW5WSoTXyRJ7jZip9A
 +zlNO3LqQ+RevHvLyEjujQwJI80dJ4TYZLDjM/2QZtdXAdXt7MDsLM/ogDhGY3j2H7jtazDgt
 htPSa8D3q85KYy5iRnsolyTjGgYV27Fipk/3mvgolmEZZFps6I+jGbGZi+VgMiezsVZuRkgHw
 HBCjQe3Tn2FBQAtaSw6+2CduReQLI1XdRspvfhENddmfv8zk0dTrhk6qZb0yFaD7amZv0O5t5
 5FD+0TEQDzpMa14fEzAMZvoSdOHPMstihQGo27gYcJkIrw7NMqnGtV+pqIiEqjIEvPHhEHrqH
 71JpXy8cnFdxuyM1lFm4eSv8uEkIq/QqE5UccweaWuqPUa/ml4hJmUH0FBb3FwHEeueietjxN
 ZAugcj4uz38kTHcjiCga5NERRIbadHarL0UahtuU8DqCHtefHBfup3yOtl04f4U3a4VgSc3Ot
 EdpLBbbpxA2h5j3pUYSLB7sa265NJtum84QwsSyhzpph4tXqX4eg9s36BHTKGChXe6wFAsTZw
 ykCHz4ULfSsQdeLTnKF3wut45Va0nazF1uKMaDDrs9P6Myli2c+PluXCGQ05Q1yB/a4lo+tzF
 wYZW5OrMREogTtOG1fer9gsSpkfYDQ2jtPExOGxpr6hxX0JmUnwJqJZCr820iEfYShI98qer7
 t78rx5FIp945aNBDKRbKSiTSrO6kRdSBfsMPuDOhbJhXK+TBFELFcwGpxTiqscAWeOWsrcF2M
 XVOLrKJmX00WFk0fZJCvOjmXKcMh/BMoymp5ZODfYMNHw4rsm7c7K87Z5dpcofwbizZ+WMfCJ
 ve
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I would like to publish an new dataset.

But I cannot find out how to create a dvbv5 format file.

I got dvbv5-scan, but in order to run it, it needs some input.
But I cannot find any info on what it actually wants.
I tried
	w_scan -f c -x > dvbscaninput.txt
This finds a lot of data, but doesn't produce any output on STDOUT.

I also tried other output formats which dvbv5-scan was unable to read.

I tried manually created:
[CHANNEL]
         DELIVERY_SYSTEM =3D DVBC/ANNEX_A
         FREQUENCY =3D 266000000
         SYMBOL_RATE =3D 6900000
         INNER_FEC =3D NONE
         MODULATION =3D QAM/256
         INVERSION =3D AUTO

which resulted in:
ERROR    command BANDWIDTH_HZ (5) not found during retrieve
Cannot calc frequency shift. Either bandwidth/symbol-rate is unavailable
(yet).
Scanning frequency #1 266000000
Lock   (0x1f) C/N=3D 36,50dB UCB=3D 24 postBER=3D 100x10^-3
ERROR    dvb_read_sections: no data read on section filter
ERROR    error while reading the NIT table
Service Sonnenklar TV, provider BetaDigital: digital television
[like 10 more ...]
Service Bibel TV, provider SES ASTRA: digital television

first, dvbscan did not produce the output expected.
second I expected dvbscan to fetch the other muxes automatically after
it was able to tune on the first one.

ps. The dtv-scan-tables/README misses information on how to generate new
entries. Could someone please add a guide or a link?


thank you very much

JPT
