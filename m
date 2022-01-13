Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8813E48D9E0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 15:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbiAMOpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 09:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbiAMOpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 09:45:01 -0500
X-Greylist: delayed 500 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Jan 2022 06:45:01 PST
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903F2C06161C
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 06:45:01 -0800 (PST)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 363275C0B80;
        Thu, 13 Jan 2022 15:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1642084598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=5n71jSuoFLuEKrBHezy69s2vTc49LY/8zOhitBWkCgw=;
        b=JHP9uwLLxU2tkBUC5EGVPSx2ysRA7JShnh0Xf/uHj+GYg+soSp/SlK2+Fw4MUIyMm3X7cf
        FnnB74Gd2lckJSdOQc/DR8UbfZIVuN/1dEdVN7mh9bIVeBnE2VsBRWg8y46mDIw8F1XUs0
        r9m3mg8TF/LTL6NWuhUDfQUkTwJmQ6Y=
MIME-Version: 1.0
Date:   Thu, 13 Jan 2022 15:36:38 +0100
From:   Stefan Agner <stefan@agner.ch>
To:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: HDMI CEC on ODROID-N2+
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Neil,

I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
I was unsuccessful: As far as I can tell cec-client uses the right
device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
sub-driver"). But communication won't work, and dmesg prints timeout
messages:

[   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
[   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
[   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
[   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
[   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
[   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
[   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
[   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
[   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
[   89.566130] cec-meson_g12a_ao_cec: message 11 timed out

I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
CEC seems to work there. So it does not seem to be my hardware setup.

A quick test with the latest Linux 5.16 shows the same errors.

Do you happen to have an idea? Do you know if HDMI CEC using upstream
kernels worked at one point on that particular platform?

--
Stefan
