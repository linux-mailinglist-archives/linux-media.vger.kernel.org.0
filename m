Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66873002AF
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 13:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbhAVMNG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 07:13:06 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35209 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727217AbhAVMMN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 07:12:13 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2vHgl7rO2iWRg2vHjlXTIg; Fri, 22 Jan 2021 13:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611317487; bh=sHpXtMci0n4wKg18StS8JWJoIFIW/QQOlOKyTJDwLlk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XlGxHIaf8X/O++UKl3qZ0UWQFX/vyvz13j97nWXufh29Dj9WPgxn9QTxWACfxBzPn
         AxCee3+y9XVfH+cjz3BZjzAPjM06ctjyX7TcwMaYiJXCXxZW8/ZiTqEylyLnHsLiNz
         lgxWvvUNlehqI9Zj55tO0s75OgfcPlFFskV1+KI+mK2FQs/Z68q4BV2ohMDtBBIo/G
         wO8fkWqU4DcetbSXz5hlpxtU5NkuSVHzQtm3nRDSv+GLjw3sitrJMTgkCdh7IZzJYl
         TmWGmKFIZYE8MyRm5Ihqw2XgBG8RijDZb6icSEx46JU9DHudJNe83hP6/bPezfU7lq
         E4vNCh5kdByHQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.11] rkisp1: uAPI fixes
Message-ID: <f2acebbb-5d2a-e609-817b-58750dda82c8@xs4all.nl>
Date:   Fri, 22 Jan 2021 13:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDlB75Q0CHAQqN+NmW8lDpAi7bFUxF5LKGRDqwkwGhzeXu8MjGTZlZK25UkkZrt6L2/nvKR1w1DlrBnuHk0O5u6dhYpIe4mFHbesF3bch5/orcA7bNNr
 XUfpRGa1ZuTZRP9pWnBioSBHoYXyDmuIrJmyyCkk6+XKMj4LGb+XROSgf+9DuaeqphBiAAjGgnWSe4NqLq4B9ZKlMbi8WdntUTFZVQk6TUeE6N5odit0jrF9
 wmd+2wgwPHcV7aM9IBMPBj79ay0UCv432EnVmYtBDew=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See the cover letter for more information about this series:

https://patchwork.linuxtv.org/project/linux-media/cover/20210121144407.9045-1-dafna.hirschfeld@collabora.com/

Basically this series fixes a few shortcomings of the rkisp1 uAPI and adds
support for IP version V12 and up.

This should go to 5.11. Once 5.11 is released it is no longer possible to
update the uAPI and it will be a lot harder to extend.

Regards,

	Hans

The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11c

for you to fetch changes up to e8a5a10845054aed410abd8e0eb7e2c79380620a:

  media: rockchip: rkisp1: extend uapi array sizes (2021-01-22 13:05:40 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (3):
      media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
      media: rkisp1: stats: remove a wrong cast to u8
      media: rkisp1: stats: mask the hist_bins values

Heiko Stuebner (3):
      media: rockchip: rkisp1: reduce number of histogram grid elements in uapi
      media: rockchip: rkisp1: carry ip version information
      media: rockchip: rkisp1: extend uapi array sizes

 Documentation/admin-guide/media/rkisp1.rst             | 16 +++++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 21 ++++++-----
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c |  5 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h   |  1 +
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c  | 11 +++---
 include/uapi/linux/rkisp1-config.h                     | 86 ++++++++++++++++++++++++++++++++++++++++------
 6 files changed, 114 insertions(+), 26 deletions(-)
