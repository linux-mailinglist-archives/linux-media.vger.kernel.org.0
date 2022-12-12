Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17DE6499FC
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 09:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbiLLI1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 03:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiLLI1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 03:27:10 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28861A1B4
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 00:27:05 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 84C711B002E4;
        Mon, 12 Dec 2022 10:27:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1670833621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=kyaravJod34I/OXP6Vf0LCU9UmGHhIoW2VqDpbaJlMY=;
        b=Pk5PZk2/8IufFd7zcxBODlIDqHOzX5xwEcQhqCA2pBx6uoQKECy0EKg1/1/weRp83pM9A1
        jN96kmdpka812aarCPFhmfQj1nCT8p6VHBisd8J2sCk60qCTHHT1MHhhOlQUhzqxiT+EeF
        UQ2KRu1UzRDp+nRXYKmjHuoj7fTBVbC+UQruVIuoCtBvB5lbSpuTJdTFfRob8jH9tooPQI
        zeRWyzJh1d6KGB4ETTd00p18EVv5CoYh172gNQE1pyMLZvdXjtxJDAzaThZUwlpctUClq2
        yW/r6g6z/0iy1+66dh2i0rLLdiN04DIjy8MUQATD0kvIRk4usQ6UeE7j3f2+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1670833621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=kyaravJod34I/OXP6Vf0LCU9UmGHhIoW2VqDpbaJlMY=;
        b=C3qlSU17XmkR0mOdpj7V3EEENsBkVKmqeWwQURcQv5kzMV4kaHUjJOSm/dYLTTxOdSYdZh
        LBjEH284QaKijHbagO5bVnh0BIeBBZeMLsdVHnsrq3GzOevGO8pSCD183NvV5GYz+0noLE
        A0MdUrOwzzw4xUktsBEkiiZlr3ZZRfnPV/qNXTXVRj2ZWildvPX5+PoPN1fMYMV12Ru37P
        QeXkTjq6uSSgjiHavEXJZWcGf80an6807znYytiz4xPnetJfRmdGRvKAFiRn0cBWWUdOjh
        lKlFoc6urIAcHR9cdPyeWigWYAA170ntqtdSYdE2Al4Cdf29FfQhdDcYDeEN3A==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1670833621; a=rsa-sha256;
        cv=none;
        b=ryK+HRWx/J1UgRbTCW1Skba+TOa/i9hx7SFpXTE7v3NkllrEnx3Vw8e+r4QNiHckFo9m1h
        D5szcwzAd7FwGQ9FJSdECC6ebwe283fYISMnAAW8i5Hsk+B+vnDNEsIY1GbX6mKCgyAKCu
        opwrJaB2isIANSoaJdEpuk2YnLXT4wtKmokdTQRNA8ae6bKFOQ/YXcpWSxb5DGiuQK6VxR
        D2NqDNPqJg4ZnaAQoAbCp2UU1ijKPf9jHLP411RsWE9Cr8uCoGLlcPntRJrf5GAZNeSgFQ
        BfQ82n27hjz53XG7YF9//zMIelbbnVYZ+6ZViCeJvZXrEH2LjN1gL8XhPxobGA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E1F05634C8E;
        Mon, 12 Dec 2022 10:27:00 +0200 (EET)
Date:   Mon, 12 Dec 2022 10:27:00 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR 6.2] sun6i cleanups and fixes
Message-ID: <Y5bl1AoYUgILIg6B@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Here's a set of sun6i patches to address smatch issues and a clang compile
issue for 6.2. It'd be nice to get these in for rc1.

Please pull.


The following changes since commit 3178804c64ef7c8c87a53cd5bba0b2942dd64fec:

  Merge tag 'br-v6.2i' of git://linuxtv.org/hverkuil/media_tree into media_stage (2022-12-07 17:58:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.2-1-signed

for you to fetch changes up to 22f583945c2bcaa87e9fc4c0e479ecdd750e7026:

  media: sun6i-isp: params: Unregister pending buffer on cleanup (2022-12-11 23:04:57 +0200)

----------------------------------------------------------------
fixes-6.2-signed

----------------------------------------------------------------
Paul Kocialkowski (10):
      media: sun6i-csi: bridge: Error out on invalid port to fix warning
      media: sun6i-csi: capture: Remove useless ret initialization
      media: sun6i-mipi-csi2: Clarify return code handling in stream off path
      media: sun8i-a83t-mipi-csi2: Clarify return code handling in stream off path
      media: sun6i-isp: proc: Fix return code handling in stream off path
      media: sun6i-isp: proc: Error out on invalid port to fix warning
      media: sun6i-isp: proc: Declare subdev ops as static
      media: sun6i-isp: capture: Fix uninitialized variable use
      media: sun6i-isp: params: Fix incorrect indentation
      media: sun6i-isp: params: Unregister pending buffer on cleanup

 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c         | 2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c        | 2 +-
 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c    | 5 ++---
 .../platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    | 5 ++---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c         | 4 ++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c          | 6 ++++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c            | 8 ++++----
 7 files changed, 16 insertions(+), 16 deletions(-)

-- 
Kind regards,

Sakari Ailus
