Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A29C2ABFD8
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 16:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731896AbgKIP3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 10:29:33 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:20781 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730294AbgKIP3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 10:29:33 -0500
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 10:29:32 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604935772;
        s=strato-dkim-0002; d=fossekall.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=MksCkLVp32sc7KG0WwW6Fy2Vs773dfXVxIGmZ4PKXd8=;
        b=jfYXeSUpXbty7iDMhFRhiX4H8yq0BUcvbsUsNV2juVJwueEdgOrxCsVlaapMWlTdtg
        G0dB73i/osvSOsSTdOGRsyblsUU92dtv0ncxvJ89VCrcp6+oQWZMNmovZRNX92A+gEvH
        BSh2afsV9GgPp4z2hpiJ6HeJsvmWXX8AoVrsqwVQJ74CYDoxVP+TXwq2eG8XNJfXXvZt
        roUzakKWQE3z9V2/IH/7Tes8evnjyYtSltV6LSpPN9aI3gcdsCV4wK7VOxP4TSGhBmYF
        yV4iA4HsvqXFH/Er4SwEdNijJZ2kdyVB7d8566e9NR0Z6wD4RzklDxo1XnC3gL906x9A
        bUSg==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.3 AUTH)
        with ESMTPSA id Y03aecwA9FNPCI0
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 9 Nov 2020 16:23:25 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with smtp (Exim 4.89)
        (envelope-from <michael@a98shuttle.de>)
        id 1kc90s-0008Oe-Cg; Mon, 09 Nov 2020 16:23:22 +0100
Received: (nullmailer pid 3164306 invoked by uid 502);
        Mon, 09 Nov 2020 15:23:22 -0000
From:   Michael Klein <michael@fossekall.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Michael Klein <michael@fossekall.de>
Subject: [PATCH RESEND v2 0/2] media: rc: gpio-ir-recv: add timeout property
Date:   Mon,  9 Nov 2020 16:23:09 +0100
Message-Id: <cover.1604589023.git.michael@fossekall.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

