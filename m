Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A8B3FD707
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 11:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243747AbhIAJmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 05:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232282AbhIAJmR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 05:42:17 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EA9C061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 02:41:20 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LMk8mcRg1lQKhLMk9mI8JJ; Wed, 01 Sep 2021 11:41:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630489277; bh=POh+iDFPToi4xea8ozuFZ1jcl+Doej8XD5dTd6xel6c=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=C4ZG4L/MKhi3QVt8v4OkmGPZbqOsvF27lY1GF+kjjLrvrFp0Sap+NhxnXVFZ7N3a+
         YtjB9Yf6Emhde+9Nt80Re2D3kMnaUhBoyIedM2YkMGUXOh1q9Q+VQwOBdhAd2FYhMP
         LTeWkCHQ+sJ8TQMsXVoYRLkVp/jUsBdCqZvFnUjXe1f1lPSeCCSs5xy+G7MiVEF9Q3
         tWXqPTkaGnW0iCQXIYAUHjETGTZu1Njj8rtUc1+OC4X/Oh4moeZ28P6URn88srNhq6
         8O2OFIomD32L6EdebD3remAvbUS4tyXRLxrFGuqy7QXvLZn2P2F95vOf4lway6O7aS
         qbPzwkgJjhDsQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.15] Three fixes for v5.15
Message-ID: <27a611ec-3e95-ca0c-3742-6d3a236d030a@xs4all.nl>
Date:   Wed, 1 Sep 2021 11:41:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLYt73Wj7tl95AqIZXGgAPClJL2U8UVt5ktiqGJ86HU5tpr855/OVfAxKO3oxlQt9VfMQo8zNs/d5YNvYsXyqg3ypFTfbpK3rNAtdCQkRgNisPcJVEAX
 reyzak2F6ojQSI7zp+zf52fGLaUWHMYOEJU6bf22Ve+GvbMTs9gBcAqy0MronSSRyb/NF0qgYzJKP8gWbVzTe1HxGcBQYvwk3M0io7UnrZo7VZ6r5OF9S9R1
 9mC7Y+7+ZV5hJyfxKahT9w6ZIqttRK/tmtaUK1mZA12nwlFETSxld1pwmbta4iOW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit d62cd4d277cc711f781a7bdec4109c6148529b25:

  media: uvcvideo: Remove unused including <linux/version.h> (2021-08-21 09:11:04 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15a

for you to fetch changes up to 359b2cc743f26919506abb7b1ab8380eab579da4:

  media: camss: vfe: Don't call hw_version() before its dependencies are met (2021-09-01 11:39:44 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jernej Skrabec (1):
      media: hantro: Fix check for single irq

Nicolas Dufresne (1):
      media: cedrus: Fix SUNXI tile size calculation

Robert Foss (1):
      media: camss: vfe: Don't call hw_version() before its dependencies are met

 drivers/media/platform/qcom/camss/camss-vfe.c     | 3 ++-
 drivers/staging/media/hantro/hantro_drv.c         | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
