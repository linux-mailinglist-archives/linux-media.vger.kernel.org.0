Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C8C781973
	for <lists+linux-media@lfdr.de>; Sat, 19 Aug 2023 14:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbjHSMEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Aug 2023 08:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjHSMEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Aug 2023 08:04:41 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC0E5B8F
        for <linux-media@vger.kernel.org>; Sat, 19 Aug 2023 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1692446595; x=1693051395; i=aloisio@gmx.com;
 bh=WwH0LThFE1FgN1VXJr5XspvgcvDTB5mp84cbFL6+fR0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=jpNYukU9vitOivTCp84LQlLjuLz2DYDBRkDDrVDl334vSHMi8KV9j58h2APOl7I+p0d77Yl
 DRv/Chxt+tG64ltU4aUC0ftq5Cy+u4ogTR3rjqMHkR8d0/RyBAB394/Xl/kfMwri40hWbHSEp
 +e4l57GpQWdTh5+jyQVFih5242benOLpeQ2kGMQ4ZMWKQw/rkuDA7cm8UVCIuewPWsnOcxpll
 sD3f1zethwIb1vXJNV9ctLYmLkHKP1vPEjKGdjoQtk4toG+YGNcb8yRUTUv0BXtj0FruSFw7N
 VX9Cx9BiKIxKg2lZGeppLNs9DlvstC+0LKqLTceSmhg00+ae6ZXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [87.13.190.39] ([87.13.190.39]) by web-mail.gmx.net
 (3c-app-mailcom-bs14.server.lan [172.19.170.182]) (via HTTP); Sat, 19 Aug
 2023 14:03:15 +0200
MIME-Version: 1.0
Message-ID: <trinity-4a9cf567-5613-4ace-8e63-fa27d4450df6-1692446595564@3c-app-mailcom-bs14>
From:   Luigi Baldoni <aloisio@gmx.com>
To:     linux-media@vger.kernel.org
Subject: Video glitch with Hanftek Astrometa
Content-Type: text/plain; charset=UTF-8
Date:   Sat, 19 Aug 2023 14:03:15 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:sQ4Bn3uXVmMUmOyK6OsNNy4C1HZEKAnCcr/LspP+Kg+E5SC8RBwGB5YeoRfUCK1XtD0Xt
 1Gg8OlvVvAbm2TrNwhIVJP3eFZoy4kTB7ykru/hRmmSYZsyrNiEUdjMyeCiFByAe1NBw2RlE/OA2
 i8umguYHQXdHjlTaV99hKQTtHWS5O66/fzTAkzJjq0BP3VcPJmUFJsn79vf4w1KwqusaWO7qGjzI
 PkVKES0Gxo4hXMocH+b3ScXaKOiFVYU1o0uc/RGtg7FzVzaDUJzrT83+F7oIBIuZ34Zo4y2rGcYm
 YU=
UI-OutboundReport: notjunk:1;M01:P0:1IsE6PCL/Hg=;yGpqt5NsDn5MuaQ8FFrFA9rz+Vc
 9dOUSYZBqYkFx3hZHyfMfGM4mer4MZTCmxZl40NASWhlmHYnDjfCsWJYwEezZR/Gq1C+W7jv3
 Ml8Jhc/8Ddt6H1A8iiJtumcOlS5UaJq2n6ZbP5Ynvzb0ZO3mzNeDDosjnEvtiQ8OzUWUxbt94
 w7cmF9ekkpMk0197IEa2s671w144KDXs7+qYpOqJbgooDTE+zlnu/JfLznohlp1Xsk49oB47o
 aH92AebHej5/bzNvkaIRp9us5ve6AjTHm0kyrlFORrDInSbu67DOXob3YYQXi/3F8eI17uZXD
 HPy9kHbC1HdHn2uptfEcd4IT3keH0KAz9wdqT/R/kCc+wBMGgi/DuEG5R+aCzDUqLqYYluNPe
 mr3s5Pi2hgq/frunRzTFHpIRhwWehuEJRdcX4tRx3k7ysR5rvr2AhKTWD4JE8467+Ib6STxs8
 +Zk1ETgtnTFtpjTyQjEjWps4xLdsI6mpqxdbISMLjJLATvz0xZhMscUACJ0ydP93R8gq1iiM5
 GGpMB/xIPYSCl549E+svY2Mr0I+UnqXlsaW7Zx1bLB9db7qUf061HNjHRZNDnnaG7zCM/mix1
 u6/ZSRgEoOLcTxDwlkL9eWkjN9CgNfLrTXWMKJsimx5/sV6qYlQpQkQlaE830umWUctVFzkgl
 eKNuMol6SH9LVzk3JsOF0NXgJgejRMBGPyoZOAuh3U19js9yG6QA16JKuFQklp9snrqnkbStu
 1DkJRRhGkHKnnr+Hmp1ZAFe9U4Nhmkoc3GBsMLhFb2dEY8xCbe9C+V1xxaHvdOFxn2Rc/mmtx
 FsTQsrqgEPST7MPEwJlUpZFA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

   Hello everyone,
last year I replaced my old RTL2832U/R820T DVB-T dongle (which worked
perfectly) and replaced it with a Hanftek Astrometa (RTL2832/CXD2837ER)
DVB-T2 one and my troubles started.
Every channel I tune to shows a periodic glitch, as per included sample.

I tried the following things:
 * connected a regular TV set to the same antenna cable and the picture looks
   fine
 * replaced the usb cable
 * switched distros (from debian to arch)
 * installed a current kernel snapshot
 * replaced the minipc on which it's installed
 * used usbip to access the hardware from my desktop machine and tested
   it directly with vlc, mpv and kaffeine: at best the stream was glitchy
   and at worst the app crashed
 * toggled every parameter available for each involved module
 * ran tzap directly

None of the above made the slightest difference, therefore I'm asking you
if there's something I might have overlooked or if this is truly a bug.

Video sample here, captured with tzap:
https://www.mediafire.com/file/qantvq916uy7o4k/rai1hd.ts/file
https://www.4shared.com/s/folTulDcljq

Regards

