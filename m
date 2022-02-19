Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CBE4BCAA2
	for <lists+linux-media@lfdr.de>; Sat, 19 Feb 2022 21:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiBSUvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Feb 2022 15:51:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiBSUvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Feb 2022 15:51:12 -0500
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 19 Feb 2022 12:50:52 PST
Received: from pmgw03.myhost.ro (pmgw03.myhost.ro [85.9.45.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16970BE1
        for <linux-media@vger.kernel.org>; Sat, 19 Feb 2022 12:50:51 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by pmgw03.myhost.ro (Postfix) with ESMTP id B58C4C475C
        for <linux-media@vger.kernel.org>; Sat, 19 Feb 2022 22:44:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uscentral.eu;
        s=myp2009; t=1645303447;
        bh=I/U+dX5YZKnfZHdI1746iha0lnxMJPi6iZdTLjz7t3s=;
        h=To:From:Subject:Date:From;
        b=iEPEEAfpPvO38vX+N5Z91NtfNkEcVy9qVpC2XM/rTLligJAibqMdH25F67g1tNjQF
         9ARgivYZ2oaA/PZXcqYIn81y+6/cPzAj/Zj7LdzI0S8uP324eJ5exXfo1txqfpklgC
         6GAisFUnltp7mIabqit5kslQ96dk2YDgZeY2G6bo=
Received: from pmgw03.myhost.ro ([85.9.45.131])
        by localhost (h6b-new.myhost.ro [127.0.0.1]) (amavisd-new, port 10028)
        with ESMTP id 0c2XhoEn8CSs for <linux-media@vger.kernel.org>;
        Sat, 19 Feb 2022 22:44:07 +0200 (EET)
Received: from mailx28.zooku.ro (unknown [192.168.88.176])
        by pmgw03.myhost.ro (Postfix) with ESMTP id A6F81C46FB
        for <linux-media@vger.kernel.org>; Sat, 19 Feb 2022 22:44:07 +0200 (EET)
Received: from [192.168.1.216] (unknown [5.15.13.75])
        by mailx28.zooku.ro (Postfix) with ESMTPA id 89E62E2A11
        for <linux-media@vger.kernel.org>; Sat, 19 Feb 2022 22:44:07 +0200 (EET)
To:     linux-media@vger.kernel.org
From:   Septimiu Ujica <septi@uscentral.eu>
Subject: stk1160 drivers for onion omega (openwrt)
Message-ID: <bd8223e2-a0ad-6566-1a36-c62addf4edb5@uscentral.eu>
Date:   Sat, 19 Feb 2022 22:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Rspamd-Server: mail-filter
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello. I'm trying to configure an onion omega2+ with an usb device based 
on STK1160, however the onion misses the driver for STK1160 and can't 
get it started. Any guides/info in how to get the driver working on the 
Onion Omega2+?

The OS is OnionOS which is based on OpenWrt and kernel version is 4.14.81

