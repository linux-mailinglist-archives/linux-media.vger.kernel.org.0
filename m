Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394A03D3826
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhGWJQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 05:16:27 -0400
Received: from gofer.mess.org ([88.97.38.141]:40273 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231195AbhGWJQ1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 05:16:27 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C6E6DC6A4E; Fri, 23 Jul 2021 10:56:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627034219; bh=s16giUsra6LNCagOv39PPM4j+sju1A/1JEx1D0lDexw=;
        h=Date:From:To:Cc:Subject:From;
        b=mbnevmmzFZGac/h3DWq3rYSNTxz3yZEJIgQRXkYoGdGIkwekbpHValkW8p8Hfd0Wz
         jdYFYYp2plFC1cGEnNAzwv46ue0Ag9aA2Icx3HvkyRvL5Pt5stbwvpG/NRWKSMHUFK
         74wQ71vitdlLKF5fpQWSA8mnjrZ73qba39XMKJ3JXDYLpsRfTHz6pBTzUH0T7aEBqA
         YTGdldNmdT7OaRiZWmfK5OfVu/lAJAOhDkowDLcWe+ezGKOi+RLiTcQMAW0J415BnE
         9uZZSVPl5YAV0MZgGWo6Hjr1OWyjXcV4CKffb7N/Cvh/Ddq0eLSdQYvhfProkTSnKI
         uCTNYZ3iJcyKg==
Date:   Fri, 23 Jul 2021 10:56:59 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [GIT FIXES FOR v5.14] rtl28xxu: fix regression
Message-ID: <20210723095659.GA19002@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.14d

for you to fetch changes up to eef4a4e77a3d4876f2a4065e421d4f8de52011b2:

  media: rtl28xxu: fix zero-length control request (2021-07-23 10:46:34 +0100)

----------------------------------------------------------------
v5.14d

----------------------------------------------------------------
Johan Hovold (2):
      Revert "media: rtl28xxu: fix zero-length control request"
      media: rtl28xxu: fix zero-length control request

 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
