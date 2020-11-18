Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89BD2B7E11
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 14:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgKRNIE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 08:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgKRNIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 08:08:04 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0387AC0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 05:08:04 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 42448C63B0; Wed, 18 Nov 2020 13:08:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605704882; bh=l1o5FuQldbgxw0hLN+SjfiwOUkoALbYyaAxpgcc2k0Y=;
        h=Date:From:To:Subject:From;
        b=sF4RYNziPHi3ibVoi1RD9M4DaBTSnqkJlaAraVVp6E+rJ6QqWzjwFZeSsARKnJ/iI
         skmwWLVZfDlxx0JULZD5DVXE0yShFDW+fhbTfYd9HtijlAPPRVFc7tIRKCP2TGBaKF
         JYm6IDwxIEidDMH5z4vs/So+/oK/ji+QYg35sIXapb5/l9OfSu8YqP6l7s7sYBaQeF
         EBBpCVxUCe3E1BNsYrvQ4ZWQlS9ZaliCy0Deak6fjyG2U44MoAHUxCpp5RATdzm136
         0Z8QI5uclL8wDE/pZ2SsVwoj4DYyiyg8nuRv8106E8NCkpo5mhjhGja3xWm7XSn8lM
         xaDTzrYyyYPoQ==
Date:   Wed, 18 Nov 2020 13:08:02 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.11] sunxi-cir & docs fixes
Message-ID: <20201118130801.GA21771@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9463e07df8e0f93931e32c6f415d3f82bda63f35:

  media: v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs (2020-11-17 07:14:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.11b

for you to fetch changes up to 6dc14e84b092051a44c1e0ac16cefdcd8938975d:

  media: lirc: ensure RC_PROTO_MAX has documentation (2020-11-18 13:00:51 +0000)

----------------------------------------------------------------
v5.11b

----------------------------------------------------------------
Sean Young (3):
      media: sunxi-cir: ensure IR is handled when it is continuous
      media: sunxi-cir: allow timeout to be set at runtime
      media: lirc: ensure RC_PROTO_MAX has documentation

 drivers/media/rc/sunxi-cir.c | 50 +++++++++++++++++++++++++++++++++++++-------
 include/uapi/linux/lirc.h    |  1 +
 2 files changed, 43 insertions(+), 8 deletions(-)
