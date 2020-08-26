Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C757252C00
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 13:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgHZLCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 07:02:39 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36163 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728791AbgHZLBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 07:01:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AtB2kiWoOuuXOAtB3kD8hk; Wed, 26 Aug 2020 13:01:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598439673; bh=9956/5NOkE3Ba03Jjwa8EqVxG7EiTE3NrsuCKUxDRJ4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Xyjprzkr18QFkjAe2U6Nw2WSWQFig4lUudF3WBss28XG5M3LcX9uMzrnZQudY4DMa
         DBFM1/f51pse+IOE3irJW19Vj80IOnGaMo4+gA+OVaikhq8fjHyCP90V0sb3l39gP1
         T/mPegF6UPUhJfwpBgkU2+luBKngUr/8O9oxvsgCiADTdwBdpI5tUzRGAXmwgeHzP+
         zGMlmDlN1tJz4IbGeVlKdIo/YRXT85ytfUQ43iUdH7qSqdR1rWJpvr28MtZzxgv6MU
         jLDMmjr2LJnr15eMjLOqwY1WD3a+SFCEzBsPgZ/0UHgTss6flQDYHrJbz6Cp+GhOYF
         VRvy05silCvHw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.9] Two fixes for 5.9
Message-ID: <9c3ff867-1bad-b88f-4dd3-dc3bbe95fd7e@xs4all.nl>
Date:   Wed, 26 Aug 2020 13:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDxD7vU4Nkhg7E/CHHnBCWQAgX+IjzoflH2gEBV/aG+B0BvZ5EOrdm0kd8nts9ENmkkbbj1N87f034oABfJBcNlZuwLOlF5oqN+iSm9YYswDW/5COaSS
 Gim4mJg7uzmXdmSh1J6JccVKoyV5n4VPzwB+z5sWxysDVMfk6tW8lE1voeYEaOq67eIa/RpksnD1So20lNr/weTXIYoqWUBNUDlB7W7hMXAOy30YVrEgkl9l
 p0Bl7aTqFj0WwLXUPCfvyqDcGohjGiTekPUHc/omdmc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9m

for you to fetch changes up to f8a8f976a56d8062dbbe525edf37625db0905a61:

  media/v4l2-core: Fix kernel-infoleak in video_put_user() (2020-08-26 12:43:43 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (1):
      media: ti-vpe: cal: Fix compilation on 32-bit ARM

Peilin Ye (1):
      media/v4l2-core: Fix kernel-infoleak in video_put_user()

 drivers/media/platform/ti-vpe/cal.h  |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 50 +++++++++++++++++++++++++++-----------------------
 2 files changed, 28 insertions(+), 24 deletions(-)
