Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479722CBAE8
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 11:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgLBKqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 05:46:55 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54499 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729493AbgLBKqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 05:46:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kPeDkD7sNN7XgkPeGksUmh; Wed, 02 Dec 2020 11:46:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606905972; bh=jkmGN9hnoiVg229Vk76SNwrvSjKyAbe7e6gjnTCRuEc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mQYI7UpumEQlzNGjtxuEOZ4CoOnDJ+mn90lGJz0LJyzmv4ckM8QiBKqbbUxhi72PM
         kOQqNLKqDZpojHSjsMd2C5gwER1UxgJ0HAOZswfzXxiCPtwQgNU+8eK++hap9zdjSG
         Vwn7CtRdc9ZOfcdBSRoHMkPk9aR6ScZD7iD4SC4ibYi/PmZUrMiyxacF1wUmVPOjBA
         D/NhSVYl9+h3wa+LT3L3aP+bgb7zkQ7t3TGOrTn1JmANojfDvrOwTsRXNBlqLMnZDA
         UXXlHJVwcx+7QAfoh03ZgxICsAd1RjNHIkr0zzbF1Pu9VL2Q45uEiKvy+EzZMyyLrR
         sm7Bum1J+cbPg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.10] vb2: set cache sync hints when init buffers
Message-ID: <be02c22a-f164-d30b-4a17-774d819ea60f@xs4all.nl>
Date:   Wed, 2 Dec 2020 11:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMd9+rPo1UbL0k5bZpvOpwNPy8fqj1SWOBHTPQp74zja/EryVQbQoX2IOuHvwrLSqTkvBzS6SMRJKlPvoaLg+gPRttDSrve5agxdJ+YV+LiGjF8IF7et
 kLdLiNzdnquyCHNpDqMv2bXpOrCpYlfMqz049CE8eXnl68nCfAu0S1jhmFbvXDp8cqe+h1C1VtVmNlPQjUusJ9rYDJsKvTNMWO4Egr7RDAYd/jkVLFA6fZnZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I think this one should go to 5.10. Not doing any cache syncing can have
serious and hard-to-find problems.

This will primarily impact DVB when using vb2 streaming.

Regards,

	Hans

The following changes since commit 67e061f044e46c9823e59ca7981786f858bfa292:

  Merge tag 'v5.10-rc6' into patchwork (2020-12-01 16:21:40 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10c

for you to fetch changes up to 49ab8493583a9e0de63a9b7f20c350802deb75df:

  media: vb2: set cache sync hints when init buffers (2020-12-02 11:42:44 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Sergey Senozhatsky (1):
      media: vb2: set cache sync hints when init buffers

 drivers/media/common/videobuf2/videobuf2-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)
