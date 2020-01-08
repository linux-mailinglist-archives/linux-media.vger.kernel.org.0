Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCEEB13400A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 12:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgAHLO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 06:14:59 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33443 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726144AbgAHLO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 06:14:59 -0500
Received: from [IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1]
 ([IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1])
        by smtp-cloud8.xs4all.net with ESMTPA
        id p9IciV4oVpLtbp9IfiGCyj; Wed, 08 Jan 2020 12:14:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578482098; bh=djhHEUtxMllVzMj8n1ZnqE/KH3f9WP2w8PeubP9sle8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KvgGpJNQ4cyjeIjKE1/fzBFo3Bbgc+TalEfNpepWG043CsoLku2mLv8dmxKuOQLDw
         Xld0ZV31rMiCau2cMiKg3sIzwlS2V0EcYzbffpLRS4zkX7bSwBLbJNl2KI6aoBFBYU
         hOhM5lALKHcYa4RjMqO0uU6wGjt+Nc0YC5/8jIy/CP02BARdlBmk1v8846gg8bYT4/
         ynA/tUSQvSABJs13XSzj2nQ3akqdujWqmfXyp1NAQGZGPlsD/wkjwP1HTG3/d4CF1B
         aDIuiHUu/fvy+hVuRV/M+XprgrZpLtYAumxmz50nlVbFG4QmUzLqDxE9N2DzsYFQo/
         5b810moaqijiQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Fix v4l2-ioctl regression
Message-ID: <83d3c4fc-7a84-ef3f-cb82-11ff810e77a2@xs4all.nl>
Date:   Wed, 8 Jan 2020 12:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAjZh/cPy5C+K2FKMwAmQt1Veig17XV5hl4DuRRG1SxFTGYOaA03TlehsQEt8Ul78D7u7ncVpi9COl9nWAQ2r7h9LRW3UqNcOGQeX74JYflB27ilENrR
 OZcjOPj1Ye9xBBZCr9bFKyJFFDrFg+jcFOssFFVstxYAyxaypM0SIujdA11Y9BDTn08lXJpKklq5Bsl7OOQ3V/cs/UQlNsce1XpAqebpRNgD8TBb9nekdmE/
 1ioyBUXOWMKaw4T/ynmPNSv2KaETw40Vy1+5uhAU313/rl1NkuTgedn6rgfk1e48ostkcZfB/zO3I5M0XK3QXw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 51e40a0dbe53cebe1f4b85bb47e250dc5a89b254:

  media: sun4i-csi: Add support for A10 CSI1 camera sensor interface (2020-01-04 08:21:35 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6j

for you to fetch changes up to b6053acb51e3e690b53ba065364dc85d347c8b07:

  media: v4l2-core: only zero-out ioctl-read buffers (2020-01-08 11:14:32 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: v4l2-core: only zero-out ioctl-read buffers

 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
