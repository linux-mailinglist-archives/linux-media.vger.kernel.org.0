Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB8A48F63A
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 11:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbiAOKCN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 05:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiAOKCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 05:02:13 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AB5C061574
        for <linux-media@vger.kernel.org>; Sat, 15 Jan 2022 02:02:12 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JbYcL4zfnzQkj9;
        Sat, 15 Jan 2022 11:02:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1642240929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5mV8JB5Mv7mEJpvXolPt6WJu8Thn285DJtkcJA/v4eE=;
        b=dPW5dsQd4H4YJsfnJTRoMTk4Qf036eLFC3oBfNGLV5odndoPRauRpZMCWzFpgpL2AmihV9
        yzUYt1YdEsUV523rvimtXoXj/TRmq/jmBa63evXU14WexRMGmYpLjmseTIXk7Va+Nq7rB+
        9ZZu3aqenCeV2q5t/of4YH/4l2X/ciAciTV45fSBbhXh3nZnLqxQCvBg0nYKZuRL6vIFS8
        S1Fg3iK+IZwtCsctNskHKzNRBrSm1tzkYMaxF182JIn6NQMMZSEMaPUOXjCn9vhgOys0pk
        6qmMllWTRYtxv4805g9Rez/qgDqB34c29irMQUlrlrRVnb+RQanYRVuvoF+9Ag==
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     Stefan Agner <stefan@agner.ch>
Cc:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
Date:   Sat, 15 Jan 2022 11:02:04 +0100
Message-ID: <5560050.DvuYhMxLoT@kongar>
In-Reply-To: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Am Donnerstag, 13. Januar 2022, 15:36:38 CET schrieb Stefan Agner:
> Hi Neil,
> 
> I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
> I was unsuccessful: As far as I can tell cec-client uses the right
> device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
> missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
> sub-driver"). But communication won't work, and dmesg prints timeout
> messages:
> 
> [   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
> [   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
> [   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
> [   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
> [   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
> [   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
> [   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
> [   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
> [   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
> [   89.566130] cec-meson_g12a_ao_cec: message 11 timed out
> 
> I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
> CEC seems to work there. So it does not seem to be my hardware setup.
> 
> A quick test with the latest Linux 5.16 shows the same errors.
> 
> Do you happen to have an idea? Do you know if HDMI CEC using upstream
> kernels worked at one point on that particular platform?

I'm using Arch Linux on my ODROID-n2 (non-plus) and HDMI CEC works as 
expected.
Currently I'm running a 5.15.13-1-aarch64-ARCH kernel. AFAICS the mentioned 
patch is mainline since v5.14. I can see my TV without issues. I have to add 
that not every cable is suitable for HDMI CEC, I have one where CEC does not 
work (in general).

HTH
Alexander
------
$ cec-ctl --playback
$ cec-ctl -S
Driver Info:
        Driver Name                : meson-ao-cec-g12a
        Adapter Name               : meson_g12a_ao_cec
        Capabilities               : 0x0000011e
                Logical Addresses
                Transmit
                Passthrough
                Remote Control Support
                Connector Info
        Driver version             : 5.15.13
        Available Logical Addresses: 4
        DRM Connector Info         : card 1, connector 32
        Physical Address           : 1.0.0.0
        Logical Address Mask       : 0x0010
        CEC Version                : 2.0
        Vendor ID                  : 0x000c03 (HDMI)
        OSD Name                   : 'Playback'
        Logical Addresses          : 1 (Allow RC Passthrough)

          Logical Address          : 4 (Playback Device 1)
            Primary Device Type    : Playback
            Logical Address Type   : Playback
            All Device Types       : Playback
            RC TV Profile          : None
            Device Features        :
                None

        System Information for device 0 (TV) from device 4 (Playback Device 
1):
                CEC Version                : 1.4
                Physical Address           : 0.0.0.0
                Primary Device Type        : TV
                Vendor ID                  : 0x080046 (Sony)
                OSD Name                   : 'TV'
                Power Status               : Standby

        Topology:

            0.0.0.0: TV
                1.0.0.0: Playback Device 1



