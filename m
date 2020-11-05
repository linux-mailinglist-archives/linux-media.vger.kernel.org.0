Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64BD2A8268
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 16:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730862AbgKEPlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 10:41:11 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:31157 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730721AbgKEPlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 10:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604590869;
        s=strato-dkim-0002; d=fossekall.de;
        h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=MksCkLVp32sc7KG0WwW6Fy2Vs773dfXVxIGmZ4PKXd8=;
        b=LoBRdBaU5Dxsv8H1Yw6DovI8qgSpsSMDVj6w6s2rNOkxwhrniMxh6zV6Hc5ulGFLge
        BhqEwmAru6fBbkl0jUBByF46eZl5hl7oH+os78r6ypLjOeMLqyTrAI72T82HqQ97mlPP
        emUVJ1nHgO32+gN0RvD/BXMEtmS6ze7i8zuTmC5MZ+ooFjjj0mo3jIqD0xk2sbSKrP+l
        d0Mn4G2wwAa5mGdYKNHzdt6F5WfXl/goLP8usT0FmftK6x3BG3WT28Xq4dJmq4iJXvLB
        KirCdlCHNwlZqyqLuXtIMSNjKyqjnIsmPm3mCHyzvTn2CvzMrJH23vTar4TPOW7PbqiZ
        kx6Q==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.2 AUTH)
        with ESMTPSA id 6072cdwA5FZ50Id
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate)
        for <linux-media@vger.kernel.org>;
        Thu, 5 Nov 2020 16:35:05 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <michael@fossekall.de>)
        id 1kahI0-0002J0-CN
        for linux-media@vger.kernel.org; Thu, 05 Nov 2020 16:35:04 +0100
Date:   Thu, 5 Nov 2020 16:35:03 +0100
From:   Michael Klein <michael@fossekall.de>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: rc: gpio-ir-recv: add timeout property
Message-ID: <cover.1604589023.git.michael@fossekall.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The default recorder timeout of 125ms is too high for some BPF protocol 
decoders when a remote sends repeat codes at high rates. This makes the 
timeout configurable via the devicetree.

Changes in v2:
  fix checkpatch.pl warnings

Michael Klein (2):
  media: rc: gpio-ir-recv: add recorder timeout property
  media: bindings: media: gpio-ir-receiver: add linux,timeout-us
    property

 .../devicetree/bindings/media/gpio-ir-receiver.txt          | 3 +++
 Documentation/devicetree/bindings/media/rc.yaml             | 6 ++++++
 drivers/media/rc/gpio-ir-recv.c                             | 3 ++-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.28.0
