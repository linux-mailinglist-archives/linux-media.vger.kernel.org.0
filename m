Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D847418B16
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 22:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhIZUxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 16:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhIZUxH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 16:53:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F1E760F24;
        Sun, 26 Sep 2021 20:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632689491;
        bh=dTn2nGism431su2KCVME4RJBNztSI54Qf2pIxu9JzWo=;
        h=From:To:Cc:Subject:Date:From;
        b=cnExISIWGdLeWyc0hXUzTqMlPINnlsLTktSvRvXnXHAhkgKDvrt+I8h0OTgI4YyhC
         HgmuTFoqDzax5+xLRPoWIxPFH8apwNQOxMPjRiyJdbHZ64c3p7No4nK62fG3JtmoIs
         gxlToVW6BgwNOFkqg7DqlsLkK1c9jgN+l98vPysGzcBhnEgKhLt2DZyujMOqZH62DR
         tYVRH9JEFXkQv54R1InvOo9rvT4w2egHaHhOM5JKVkuo8fX5+/S958mTsuvxX4QGJY
         SHCZ0OXYEQPiJ+Exyly11P70dyGbsXrecpdcWH+bddq2j+Vy84H4+KuyWDspbg55ve
         i3ZjdlvfduuvA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mUb7R-001Yb0-5i; Sun, 26 Sep 2021 22:51:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        pb@linuxtv.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 0/3] Fix streaming on/off logic
Date:   Sun, 26 Sep 2021 22:51:25 +0200
Message-Id: <cover.1632689033.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As discussed on:
	https://github.com/hselasky/webcamd/issues/16

the dib0700 had a regression on Kernel 2.6.39. Such regression didn't
affect most devices, in practice, as it seems to happen only under
certain circunstances. 

Michael came up with a solution for the issue (already submitted to
the ML) but let's take the opportunity to do a cleanup, as the resulting
code was still touching both adapters when an stream off command
was issued to one adapter, turning on the other one.

After the change, each adapter is idependently controlled by
a separate bit, as can be shown when its debug message 
is turned on (tested on a dual-adapter device: Hauppauge
WinTV Nova TD):

[608855.124780] adapter 1, streaming ON: 0f 10 12
[608868.189827] adapter 0, streaming ON: 0f 10 13
[608879.584330] adapter 1, streaming OFF: 0f 00 11
[608887.014772] adapter 0, streaming OFF: 0f 00 10

Mauro Carvalho Chehab (2):
  media: dib0700: cleanup start/stop streaming logic
  media: dib0700: Only touch one bit when start/stop an adapter

Michael Kuron (1):
  media: dib0700: fix undefined behavior in tuner shutdown

 drivers/media/usb/dvb-usb/dib0700_core.c | 28 +++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

-- 
2.31.1


