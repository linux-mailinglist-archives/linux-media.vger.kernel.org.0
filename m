Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768F33DA05B
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 11:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbhG2JjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 05:39:00 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47207 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235647AbhG2Ji7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 05:38:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 92VCmQSXcXTlc92VDmW9Un; Thu, 29 Jul 2021 11:38:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627551535; bh=aFmCHkV/d4Pn07npeTbD8dAC/YLOndrBZZ/v4iXjpBs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=v0mD3jX2rHpBhlS/a+WGXb1sZUWJabCXt7aUk4RmQ1aSZs8Zsx5YdYwZCTbYQccwe
         jQ6HNxf6bTYnduOAGqqiwQ/IQEWD3iJQkZXjaKlXIH1KNL8QUxBwIWaBnDWi62oRtA
         wadGgNk661IgYaTRHZewChxu0vKFZnid6EFJMIBKEpoBARRrIXTHMAX35W1oANBm1k
         MTnCoKOUy1r5fS9qVdayTzqAsb1x4+lo/mGGxJm8aeYzewtu1/rMNWCFo9Y0kRMdOT
         qGRcJ8ExvIHUZl6m1A3Pntp0HZl4iMi7oiZeSch92RLWe5P2Mt/ztQPkf7P26Zmi9b
         Eplg1e9a1mbBQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.14] Two fixes for v5.14
Message-ID: <378ad7f7-1fb9-0e3e-1093-4c368ffd42d2@xs4all.nl>
Date:   Thu, 29 Jul 2021 11:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMuxvJppimqquMGUEUKTum73TPjFp15eeeQYFGkfEHn+lkpsTed1Fs2Jfd0NINw0svGD+rovVHsq4q0KxqNFjJMqERixq6DjBIymaUgq+gTpdaI0wKtH
 lF4+E/jckN1eWY/6/gKHgyaYgRkin2ciJiVEDHst1NJsqlpHETNJmiRgzgxXVKJIR/ITIpyAbgdDkLqWS0qvDlZORpO9YlZy7szp/mPwSaSihm7XCz0Mfqdu
 ug+nxDEYu0HjS9gSzQOcRhx2qliRT4xXpbj6WVsfhNTyTjfY43zNiiggcFOD5yVZqCX8Mwx5Afq+2twXJ8akyFxrxyMWPHGeX97P5FkxkTi2/Bc9nwpUqtLI
 /ltZCQWJdbon/DY4zbFyp39vXL/WafId3uMi8xVAijtnLwrWPZsmojSIXgeGN6Z46iYUvTBWL+tBga7c/wsYzjEdSrPPRg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c3cdc019a6bf03c4bf06fe8252db96eb6e4a3b5f:

  media: atomisp: pci: reposition braces as per coding style (2021-07-23 09:04:03 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14a

for you to fetch changes up to 71e0ab8e044e9bd6f983af4931496ed4ad6dd777:

  media: atmel: fix build when ISC=m and XISC=y (2021-07-29 10:35:31 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Eugen Hristev (1):
      media: atmel: fix build when ISC=m and XISC=y

Hans Verkuil (1):
      videobuf2-core: dequeue if start_streaming fails

 drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++++-
 drivers/media/platform/atmel/Kconfig            |  8 ++++++++
 drivers/media/platform/atmel/Makefile           |  5 +++--
 drivers/media/platform/atmel/atmel-isc-base.c   | 11 +++++++++++
 4 files changed, 34 insertions(+), 3 deletions(-)
