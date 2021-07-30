Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906CB3DB526
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 10:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238109AbhG3Imb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 04:42:31 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57005 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237992AbhG3Imb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 04:42:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9O60mBQLTW9Qy9O61mCJaw; Fri, 30 Jul 2021 10:42:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627634542; bh=hR6eYtup7U6pl22se16vO2FiM+jl8zOy7jMR37YQ3mQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i4cUMYbIwlRprDATUhlGf9lr5wKYWwVJEsIGDSMn6FwrE2+1Gpw7/+0RNz0enWd0W
         tkK/yB3cUJORn0dYoWPDeTAGexIEFCrzKv71DjvXdRNU9rdVlRTyykGMVlHb7AaRCe
         RpqXeJa+1VxPFQJCearrX/swXoXmts43732GiIzFF6zH2MYh1x+aBbHVf+FHULQp17
         ikTvVK8Re+scLxPOz2d0zgJWkkTVym+tp/5LkfTHvXa8QoEdLBDzytpnkwxfi7z1KH
         4+g2gC0bkIQgQV9sWvQ1K1R69e3UzAxfcNfzDF5Q4mg7gwSeq/Z3Dg7gyUmr+lout3
         w2+wQwT87MQnw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.14] (v2) Two fixes for v5.14
Message-ID: <adadb820-2eee-b1b8-09f1-0c454dfc1a84@xs4all.nl>
Date:   Fri, 30 Jul 2021 10:42:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJzLMNKq70cLutyBpWQQYRQ8d4vrZlZsfhRgBJG5mgpzm5prV3FMbB/7KiMGuBCXyGbx9cuzcHY82ulkgUxcaSqq66/YJXjAnI9T7mF/7puormCyXfMA
 Nlk5IG+ThkLyUfqifKOGfWEIUXQBdH7fO6+kJOHycFl8ESPLRr3C9A6IXoKqEJFYQlKjtnFMQly3sYeKx9yLGgU48w+tpVKp5wqBRZFhI2tqdIci8OhxlN0v
 vPy+B2o7q6bhTdJ+mRmxWKqcgN8QEWVuF7TyKnkmaxWeATgLQ7C1r/aMw4u8zYTj1sas8v2Ol29dAv8e5G/AqqudX9YQ+aA6c8ti6A6g+Ll3lR2cDM0rB8Gk
 tDe0PJHUJ/sdY+/h1BsuZzaXoP0D853akdIfRNpmH+sFl9rWw1qsnPnlrVA6XWtDcnzxXAi4n0B5q1uQC88FDmPtdzyPsg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change since v1: improved the somewhat confusing commit log of the vb2 patch
as per Laurent's review.

	Hans

The following changes since commit c3cdc019a6bf03c4bf06fe8252db96eb6e4a3b5f:

  media: atomisp: pci: reposition braces as per coding style (2021-07-23 09:04:03 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14a

for you to fetch changes up to 34182840bbdaa89a4b7280844ab4a96f80e9593d:

  media: atmel: fix build when ISC=m and XISC=y (2021-07-30 10:39:43 +0200)

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
