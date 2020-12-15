Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59F52DA685
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 03:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgLOC5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 21:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgLOC4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 21:56:51 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0503C06179C;
        Mon, 14 Dec 2020 18:56:06 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 716AE806F5;
        Mon, 14 Dec 2020 18:45:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 716AE806F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608000360;
        bh=fn5hq0VGqFaXZSVuIr44lpWbcGXuYgrdZQJyB+PO7mU=;
        h=From:To:Cc:Subject:Date:From;
        b=azDKn7geim7IlKYUOygoFvoez5/MsFIuVWmbiZd89Kw9PFB5GsBX9bKkQls9coVHL
         83iBPndPDYQJRCNxBiXgJXtq3zB+4ZoTXjqdx+rufrGLPuTmuANscY1BCx76PyXiM/
         +9lG0df3QCvkfnD2C2vYWJFHsH5oAcw6zxdJ3UDw=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 0/3] aspeed-video: extend spurious interrupt handling
Date:   Mon, 14 Dec 2020 20:45:39 -0600
Message-Id: <20201215024542.18888-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches build on commit 65d270acb2d6 to address a similar
problem we've observed with a different interrupt.  The first patch
adds an error message so that any others that are discovered in the
future are easier to diagnose (this one took a while to reproduce and
identify).

Zev Weiss (3):
  aspeed-video: add error message for unhandled interrupts
  aspeed-video: clear spurious interrupt bits unconditionally
  aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS

 drivers/media/platform/aspeed-video.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

-- 
2.29.2

