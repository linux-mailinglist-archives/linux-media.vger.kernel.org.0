Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A555845D8D0
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 12:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhKYLKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 06:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhKYLJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 06:09:09 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283E9C061785
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 03:03:06 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qCWsm6kUz1HGJqCWvm374a; Thu, 25 Nov 2021 12:03:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637838185; bh=z9z5WpJ8NDCugZfZJVpYJnHu5/ZAmSEbb+fM1/jYLRA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MwcJszSxWzduiP2BAeZTJFIOqFb0o/yv7pb2TSOB8p7aUSeiNdDCLJmIuWwpzSPjJ
         k6KuX/i+pb+r4ulYEZkLH+CB7QHOcR6qOUmzGBXPLEUeX/YuvraQ6AL//bZs+nfmpS
         HSRm5IA1s9aTBTh2RLEkOimqtuQH6vKXYyz7uCf4ZC+ns1sdUrh6B7xbKtrIMSYLpJ
         jgtUGJJRjB7KuMUSxjf8ftWzTAvjefly7QpP+UzXmI5y21hAR+ZkwW33ErdtTOx33S
         VmeCknjRzq0KPfuekzDGPXsfmT9CKV3i89fccsZyxZ4YZ178wssBxNXqgo6v0ObVIN
         HuXCYSH4txR/g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Kyle Copperfield <kmcopper@danwin1210.me>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.16] rockchip/rga: do proper error checking in probe
Message-ID: <303b75c3-0b0e-b7e7-d506-609c1e4e2654@xs4all.nl>
Date:   Thu, 25 Nov 2021 12:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFslT4wsg6dF0RZW+5cMq1Cz9o6fSW1JvuowEE0+dFnhbOA0xTZN31CxYlLxejrPBvA9AmNNFz/QGTox0Nfhf9wFYfcBUjevHs+YIOlmjMzJ4cS5088n
 lVZm/hxOYhj0IhwyCQIcKi5ttvG7xP2Q1APtRWXpm8+rooo1Cxb0DmZEOQeLw1cntxJh0kJeZH68fGJBsIaNcm7iGadG7+QCyjkJYguapMyI8RClh+EG+pM8
 0eT4uwG0M4cNFtuEDuPr9ftE4oImbmBMUSIcDIM327OpvCuD4e5fM98BBYYaDzmPqQSYNbKrWZKiiN1Zy9bGsg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver can no longer be probed due to this bug. Definitely qualifies as a
fix for 5.16 :-)

Regards,

	Hans

The following changes since commit b1b447e2f3e1ec0c3e9716f4f74d056461f69ab3:

  media: mxl5005s: drop some dead code (2021-11-24 20:06:42 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16b

for you to fetch changes up to 65d3c0d2033f30872ab2f5191f3d407e53c8e977:

  media: rockchip/rga: do proper error checking in probe (2021-11-25 11:36:25 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Kyle Copperfield (1):
      media: rockchip/rga: do proper error checking in probe

 drivers/media/platform/rockchip/rga/rga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
