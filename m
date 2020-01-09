Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3D0135A01
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 14:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731054AbgAINX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 08:23:26 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49956 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbgAINX0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 08:23:26 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ipXlf-001bK7-DR; Thu, 09 Jan 2020 13:22:31 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ipXnY-00024u-Fx; Thu, 09 Jan 2020 13:24:28 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] Add Rockchip ISP Driver to staging/media
Date:   Thu,  9 Jan 2020 13:24:28 +0000
Message-Id: <20200109132428.7947-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <db88364e-af39-86c3-e969-c9d995f7c5f2@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/61106/
Build log: https://builder.linuxtv.org/job/patchwork/32909/
Build time: 00:04:19
Link: https://lore.kernel.org/linux-media/db88364e-af39-86c3-e969-c9d995f7c5f2@xs4all.nl

gpg: Signature made Thu 09 Jan 2020 01:11:41 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 10 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-staging-phy-rockchip-dphy-rx0-add-Rockchip-MIP.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0001-media-staging-phy-rockchip-dphy-rx0-add-Rockchip-MIP.patch
patches/0001-media-staging-phy-rockchip-dphy-rx0-add-Rockchip-MIP.patch:48: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0001-media-staging-phy-rockchip-dphy-rx0-add-Rockchip-MIP.patch:407: WARNING: DT compatible string "rockchip,rk3399-mipi-dphy-rx0" appears un-documented -- check ./Documentation/devicetree/bindings/

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:62: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:231: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:388: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:389: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:390: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:391: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:392: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:393: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:394: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:395: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:396: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:397: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:398: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:399: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:400: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:402: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:403: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:566: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:581: CHECK: Alignment should match open parenthesis
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:676: WARNING: DT compatible string "rockchip,rk3399-cif-isp" appears un-documented -- check ./Documentation/devicetree/bindings/
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:1115: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:1117: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:1123: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:1125: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2379: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2543: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2544: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2545: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2546: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2547: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2550: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2551: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2552: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2553: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2554: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2555: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2556: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2557: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2558: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2559: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2562: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2563: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2564: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2565: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2566: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2567: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2570: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2571: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2572: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2573: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2574: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2575: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2576: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2577: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2578: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2579: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2580: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2581: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2582: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2583: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2584: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2585: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2586: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2587: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2588: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2589: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2590: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2591: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2592: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2593: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2594: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2595: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2596: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2597: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2598: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2599: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2600: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2601: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2602: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2603: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2604: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2605: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2606: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2607: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2608: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2609: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2610: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2611: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2612: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2613: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2614: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2615: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2616: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2617: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2618: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2619: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2620: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2621: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2622: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2623: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2624: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2625: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2626: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2627: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2628: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2629: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2630: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2631: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2632: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2633: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2634: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2635: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2636: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2637: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2638: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2639: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2640: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2641: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2642: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2643: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2644: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2645: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2646: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2647: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2648: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2649: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2650: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2651: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2652: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2653: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2654: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2655: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2656: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2657: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2658: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2659: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2660: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2661: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2662: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2663: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2664: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2665: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2666: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2667: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2668: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2669: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2670: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2671: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2672: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2673: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2674: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2675: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2676: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2677: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2678: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2679: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2680: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2681: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2682: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2683: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2684: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2685: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2686: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2687: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2688: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2689: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2690: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2691: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2692: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2693: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2694: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2695: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2696: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2697: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2698: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2701: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2702: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2703: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2704: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2705: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2706: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2709: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2710: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2711: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2712: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2715: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2716: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2717: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2718: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2719: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2722: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2723: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2724: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2725: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2726: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2727: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2728: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2729: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2730: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2731: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2732: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2733: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2734: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2735: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2736: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2737: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2738: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2741: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2742: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2743: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2744: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2745: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2746: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2747: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2748: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2749: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2750: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2751: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2752: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2753: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2754: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2755: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2756: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2757: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2758: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2759: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2760: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2761: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2762: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2765: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2766: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2767: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2768: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2769: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2770: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2771: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2772: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2773: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2774: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2775: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2776: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2777: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2778: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2779: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2780: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2781: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2782: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2783: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2784: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2785: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2786: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2789: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2790: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2791: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2792: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2793: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2794: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2795: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2796: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2797: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2798: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2799: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2800: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2801: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2802: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2803: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2804: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2805: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2806: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2807: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2808: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2809: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2810: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2811: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2812: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2813: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2814: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2815: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2816: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2817: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2818: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2819: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2820: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2821: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2822: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2823: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2824: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2825: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2826: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2827: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2828: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2829: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2830: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2831: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2832: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2833: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2834: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2835: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2836: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2837: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2838: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2839: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2840: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2841: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2842: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2843: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2844: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2845: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2846: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2847: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2848: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2849: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2850: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2851: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2852: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2853: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2854: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2855: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2856: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2857: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2858: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2859: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2860: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2861: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2862: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2863: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2864: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2867: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2868: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2869: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2870: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2871: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2872: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2873: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2874: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2875: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2876: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2877: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2878: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2879: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2880: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2881: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2884: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2885: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2886: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2887: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2888: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2889: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2890: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2891: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2892: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2893: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2894: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2895: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2896: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2897: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2898: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2899: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2900: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2901: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2902: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2903: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2904: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2905: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2908: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2909: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2910: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2911: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2912: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2913: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2914: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2915: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2916: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2917: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2918: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2919: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2920: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2921: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2922: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2925: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2926: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2927: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2928: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2929: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2930: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2931: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2932: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2933: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2934: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2935: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2936: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2937: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2938: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2939: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2940: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2941: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2942: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2943: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2944: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2945: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2946: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2947: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2948: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2949: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2950: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2951: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2954: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2955: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2956: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2957: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2958: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2959: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2960: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2961: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2962: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2963: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2964: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2965: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2966: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2970: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2971: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2972: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2973: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2974: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2975: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2976: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2977: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2978: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2979: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2980: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2981: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2982: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2983: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2984: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2985: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2986: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2987: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2988: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2989: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2990: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2991: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2992: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2993: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2994: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2995: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2996: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:2997: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3000: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3001: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3002: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3003: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3004: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3005: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3006: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3007: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3008: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3009: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3010: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3013: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3014: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3015: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3016: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3017: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3018: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3019: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3022: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3023: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3024: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3025: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3026: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3027: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3028: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3029: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3030: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3031: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3032: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3033: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3034: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3035: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3036: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3037: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3038: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3039: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3040: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3041: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3042: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3043: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3044: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3045: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3046: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3047: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3048: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3049: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3050: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3051: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3054: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3055: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3056: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3057: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3058: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3059: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3060: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3061: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3062: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3063: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3064: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3065: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3066: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3067: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3068: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3069: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3070: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3071: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3074: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3075: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3076: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3077: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3078: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3079: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3080: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3081: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3082: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3083: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3084: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3085: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3086: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3087: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3088: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3089: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3090: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3091: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3092: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3093: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3094: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3095: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3096: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3097: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3098: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3099: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3100: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3101: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3102: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3105: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3106: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3107: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3108: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3109: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3110: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3111: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3112: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3113: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3114: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3115: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3116: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3117: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3118: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3119: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3120: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3121: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3122: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3123: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3124: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3125: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3126: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3127: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3128: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3129: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3130: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3131: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3134: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3135: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3136: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3137: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3138: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3139: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3140: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3141: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3142: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3143: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3144: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3145: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3146: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3147: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3148: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3149: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3150: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3151: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3152: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3153: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3154: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3155: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3156: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3157: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3158: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3159: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3160: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3161: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3162: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3163: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3164: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3165: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3166: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3167: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3168: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3169: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3170: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3171: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3172: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3173: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3174: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3175: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3176: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3177: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3178: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3179: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3180: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3181: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3182: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3183: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3184: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3185: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3186: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3187: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3188: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3189: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3190: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3191: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3192: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3193: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3194: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3195: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3196: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3197: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3198: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3199: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3200: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3201: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3202: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3203: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3204: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3205: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3206: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3207: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3208: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3209: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3210: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3213: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3214: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3215: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3216: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3217: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3218: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3219: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3220: WARNING: line over 80 characters
patches/0002-media-staging-rkisp1-add-Rockchip-ISP1-base-driver.patch:3221: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-staging-rkisp1-add-streaming-paths.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-staging-rkisp1-add-streaming-paths.patch
patches/0003-media-staging-rkisp1-add-streaming-paths.patch:48: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0003-media-staging-rkisp1-add-streaming-paths.patch:1613: WARNING: line over 80 characters
patches/0003-media-staging-rkisp1-add-streaming-paths.patch:1614: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:40: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:41: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:209: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:231: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:267: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:295: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:358: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:391: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:440: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:493: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:523: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:524: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:527: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:530: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:531: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:569: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:625: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:653: WARNING: line over 80 characters
patches/0004-media-staging-rkisp1-add-user-space-ABI-definitions.patch:798: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-staging-rkisp1-add-capture-device-for-statisti.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-staging-rkisp1-add-capture-device-for-statisti.patch
patches/0005-media-staging-rkisp1-add-capture-device-for-statisti.patch:65: CHECK: spinlock_t definition without comment
patches/0005-media-staging-rkisp1-add-capture-device-for-statisti.patch:71: CHECK: struct mutex definition without comment
patches/0005-media-staging-rkisp1-add-capture-device-for-statisti.patch:127: ERROR: trailing whitespace
patches/0005-media-staging-rkisp1-add-capture-device-for-statisti.patch:235: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:56: CHECK: spinlock_t definition without comment
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:238: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:431: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:452: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:459: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:460: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:464: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:465: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:469: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:470: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:474: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:475: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:479: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:483: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:487: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:491: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:687: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:909: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:910: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:913: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:914: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:915: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:916: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1155: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1189: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1193: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1208: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1212: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1222: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1227: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1231: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1246: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1250: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1269: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1283: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1296: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1300: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1316: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1320: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1334: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1347: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1351: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1360: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1378: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1382: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1414: CHECK: Alignment should match open parenthesis
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1482: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1489: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1498: WARNING: line over 80 characters
patches/0006-media-staging-rkisp1-add-output-device-for-parameter.patch:1510: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-staging-rkisp1-add-document-for-rkisp1-meta-bu.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-staging-rkisp1-add-document-for-rkisp1-meta-bu.patch
patches/0007-media-staging-rkisp1-add-document-for-rkisp1-meta-bu.patch:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-staging-dt-bindings-add-Rockchip-ISP1-yaml-bin.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-staging-dt-bindings-add-Rockchip-ISP1-yaml-bin.patch
patches/0008-media-staging-dt-bindings-add-Rockchip-ISP1-yaml-bin.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0008-media-staging-dt-bindings-add-Rockchip-ISP1-yaml-bin.patch:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-staging-dt-bindings-add-Rockchip-MIPI-RX-D-PHY.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-staging-dt-bindings-add-Rockchip-MIPI-RX-D-PHY.patch
patches/0009-media-staging-dt-bindings-add-Rockchip-MIPI-RX-D-PHY.patch:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0009-media-staging-dt-bindings-add-Rockchip-MIPI-RX-D-PHY.patch:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-staging-rkisp1-add-TODO-file-for-staging.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0010-media-staging-rkisp1-add-TODO-file-for-staging.patch
patches/0010-media-staging-rkisp1-add-TODO-file-for-staging.patch:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

