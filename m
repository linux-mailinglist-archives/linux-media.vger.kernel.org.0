Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE6E2E2241
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 22:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgLWVvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 16:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgLWVvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 16:51:35 -0500
X-Greylist: delayed 390 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Dec 2020 13:50:54 PST
Received: from forward105o.mail.yandex.net (forward105o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95148C06179C;
        Wed, 23 Dec 2020 13:50:54 -0800 (PST)
Received: from sas1-37a29cf4dc11.qloud-c.yandex.net (sas1-37a29cf4dc11.qloud-c.yandex.net [IPv6:2a02:6b8:c08:121b:0:640:37a2:9cf4])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 819B3420081C;
        Thu, 24 Dec 2020 00:44:20 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-37a29cf4dc11.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 2Dwue1xLO2-iKD0coLt;
        Thu, 24 Dec 2020 00:44:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ratijas.tk; s=mail; t=1608759860;
        bh=WVqFJHRGsDCBhTAXGq9W8zmkCx1Mc8HIn2cmVud7A1U=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=tNgo0/c8EADSQhLeg8euIyeStDTboG04n1ybEXRoongwRBs7t2V7AIDrc6T3mK8X4
         yGYcFB/j6R8puYQfvs9Exe1n0Zc199vEEkUzU7FeVXKXEkaRbEo+n4/xPaQRTtyV4U
         9/zOKmwj1KXSIh/PL5vWMR/NJVMOei/tGT2XDgHs=
Authentication-Results: sas1-37a29cf4dc11.qloud-c.yandex.net; dkim=pass header.i=@ratijas.tk
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id PYqbrm6b1O-iJHOKBf7;
        Thu, 24 Dec 2020 00:44:19 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   ivan tkachenko <me@ratijas.tk>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ivan tkachenko <me@ratijas.tk>
Subject: [PATCH 0/1] media: hdmi: cec: replace broken link to HDMI specs
Date:   Thu, 24 Dec 2020 00:43:53 +0300
Message-Id: <20201223214354.588382-1-me@ratijas.tk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

It's my first patch. I read a lot of materials on this topic, and tried
hard to do things by the books. If, after all that trouble, I still
managed to mess up, please let me know in the least polite way possible.

ivan tkachenko (1):
  media: hdmi: cec: replace broken link to HDMI specs

 Documentation/driver-api/media/cec-core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.29.2

