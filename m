Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44097398486
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 10:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhFBIvd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 04:51:33 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46389 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231124AbhFBIvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 04:51:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oMZNlTrZAIpGyoMZQlP1fQ; Wed, 02 Jun 2021 10:49:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622623788; bh=Fk6mOJfI0KMK8RD6zklaYz+4UElEq76LH4RsVTCOcjQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XYWhz2OHmhFu6+K43EfB+Xz90i6mHRa5WbkSXUbG/PANzIKTqtSQ6yvVdbgZKtW3K
         IYHGJiFRJz/eafJquabEYQ+4R4M46HuRAFhZWzEZfPdOIPudpOwr3unMxRvL2MWD7g
         IsyeuXg53eaBkzNXJ9xUZ6yZTFQAefSHcTY+y0VcMyjPM17VTksYSLsGve9ZAyCiqv
         RzVtNB8dUWNbx5W/hI8PJKgpBR02CLx/Z1ZVe7CA0p7iK0lAtUGMZObNCO2HuTBO02
         JXdxRPJUkBjrFh2XFWgQp0KuToNXf7Pv++JJifMy7i0LYKiD4FJ6uC0qksnkqMiFdl
         v67/nZ6dUGw7g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] mc-request.c: allow object_bind in QUEUED state
Message-ID: <84d88438-f821-bead-c9f1-83d6580e8cc1@xs4all.nl>
Date:   Wed, 2 Jun 2021 10:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfICX8xPcRTw/5yqFq5L7k969zZ40cz40XHkNFlUWtFV4E1blu7T855OZ1kCPR+LU8Yq243aQjbm5qwdBqRkdhU7TzLm2pFTpMi7+JJ5cXkJFzl0OTs58
 RNBhzmpJ5vGV3DENOjwXLPjTmxzh0pu8VF7BmK+8jfD+lDXkbsMrz5wkcGJulqeXDOD48EHxEs+UvqVPwVaTQ/IOQbnMwpFVA6k=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Posting PR for this since this is a serious bug.

Regards,

	Hans

The following changes since commit 71c689dc2e732d4cb190aaf0edea73116b1611bd:

  media: v4l2-ctrls: split up into four source files (2021-05-25 17:03:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14g

for you to fetch changes up to da302cc94160251d25653c67e6f8f191ee6ecb0f:

  mc-request.c: allow object_bind in QUEUED state (2021-06-02 10:42:28 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      mc-request.c: allow object_bind in QUEUED state

 drivers/media/mc/mc-request.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
