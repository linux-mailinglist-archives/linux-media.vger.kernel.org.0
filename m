Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185AE26FEC6
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 15:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgIRNh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 09:37:57 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35577 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726406AbgIRNh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 09:37:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JGaHkIN0LDdJbJGaIkmO2A; Fri, 18 Sep 2020 15:37:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600436275; bh=nJ2ChkrEAjRyJGsl4SIUBz+rZ9JG3kiJI7/flZCAcGc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MYCjSgMJnfDgUhavTIW8RKOoIFf971Qs9ahNqwmPiREnJ3hXbCkYHKcCds2zBznvB
         VgtwixF0SJKlPZc3bnrGbYH8DLIhG9pPG7mHyaRq9jSTh4UagW0N9Whv5f8ohAVmoc
         sDAIP6RqOqmVCqqK84HRh8pGaqDNbFJiLwzA7UBhLjEvDzPq3drqo1Vt0rt9wyIem3
         vs+/CNgmAuJUTDQPdoWHoz2sKNr4xMa4wgHVFgKEkP3rbkAz34mzrBma6KFzQhI40B
         luK7fr8r6YsOfejgfQ5MStP9ie5RQk7SxNXP2L1LTo3L8AAz1F97qh//4XFDMfRJXi
         c9VgSM2X5Fqpg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] rkisp1 fixes/enhancements + one cedrus fix
Message-ID: <2e8cb9cc-c4cc-478d-03eb-4c500d4d63fe@xs4all.nl>
Date:   Fri, 18 Sep 2020 15:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAnFO6Qfldlk8idjdZA0M7+FqDHtnl5PFFL4a9UnReeIqwFiFLq9V461DW1VAyf/jxb0sCV9Q3XZ8mI31Z+qbWDSQSUSxYKR4d7a32UdK+GXRApCT0Fm
 MH/DAqzi2zmlfhzv1zJYUwuf98Z/kqmhcbRx5KP+vP4j1O4EoxYE+VbFzOny4qocmO2jPlq4vDTIPjvs+rnEgD5zTN1kOVK3u5LLVS8K1hvf1BLmy47nHPU9
 9Sy/HQ4UN1jPNPPH+jcZUkcetVuaPy1V7hef+yhnkP7FUOmW7j5+v/9YTWqOnEkoFr+YRO4gSA3yWqbARA//ke8BiYJxfKwBy1Dwi3N8iHfMCx+sdQ61m79i
 2Scxanxi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 741043b02c2e00c8fea1a0f6f8ce43c6326cd9e8:

  media: vidtv: don't initialize cnr2qual var (2020-09-14 16:10:08 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10c

for you to fetch changes up to 931315edb538286c62065dba4b7c75b3280e7c2a:

  media: cedrus: Propagate OUTPUT resolution to CAPTURE (2020-09-18 15:12:45 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (13):
      media: staging: rkisp1: cap: change RGB24 format to XBGR32
      media: staging: rkisp1: cap: remove unsupported formats
      media: staging: rkisp1: cap: remove unsupported format YUV444
      media: staging: rkisp1: don't support bayer format on selfpath resizer
      media: staging: rkisp1: add capability V4L2_CAP_IO_MC to capture devices
      media: staging: rkisp1: add a helper function to enumerate supported mbus formats on capture
      media: staging: rkisp1: rsz: enumerate the formats on the src pad according to the capture
      media: staging: rkisp1: rsz: Add support to more YUV encoded mbus codes on src pad
      media: staging: rkisp1: cap: simplify the link validation by compering the media bus code
      media: staging: rkisp1: fix configuration for GREY pixelformat
      media: pixfmt-meta-rkisp1.rst: add description of rkisp1 metadata formats in pixfmt-meta-rkisp1.rst
      media: admin-guide: add documentation file rkisp1.rst
      media: MAINTAINERS: add documentation files for rkisp1

Nicolas Dufresne (1):
      media: cedrus: Propagate OUTPUT resolution to CAPTURE

 Documentation/admin-guide/media/rkisp1.dot                                           |  18 ++++
 Documentation/admin-guide/media/rkisp1.rst                                           | 181 +++++++++++++++++++++++++++++++++++++
 Documentation/admin-guide/media/v4l-drivers.rst                                      |   1 +
 Documentation/userspace-api/media/v4l/meta-formats.rst                               |   1 +
 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst                         |  49 ++++++++++
 MAINTAINERS                                                                          |   2 +
 .../staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst  |  23 -----
 .../staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst    |  22 -----
 drivers/staging/media/rkisp1/rkisp1-capture.c                                        | 199 ++++++++++++++++++++++++-----------------
 drivers/staging/media/rkisp1/rkisp1-common.h                                         |  11 +++
 drivers/staging/media/rkisp1/rkisp1-resizer.c                                        |  93 ++++++++++++++-----
 drivers/staging/media/sunxi/cedrus/cedrus_video.c                                    |  29 +++++-
 12 files changed, 482 insertions(+), 147 deletions(-)
 create mode 100644 Documentation/admin-guide/media/rkisp1.dot
 create mode 100644 Documentation/admin-guide/media/rkisp1.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
