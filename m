Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E7F390338
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 15:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhEYOAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 10:00:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60297 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233045AbhEYOAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 10:00:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id lXZmlLwklWkKblXZplABI5; Tue, 25 May 2021 15:58:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621951114; bh=rMb8UXJAVaQnPzZ6ERAFCnYT4qjgqbLIa56jxsPZGJQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UDICvj4WSxnK1PGIqAmdvRSyievVWaGRsfhNToTrYS7nCpxa4fpRNS1RRvGawoXh6
         QSiRilsbXuvtNZ9voJv2RKNkZoH095/JIrjoCvm02KFtL4RaexcE++2qIpVL66Pp+D
         y92G0glcWMnrr0czQXkrGamtcfs1zOAiQQY8e1bnNWplOZoYJDUQx09LbXfs/cyrcK
         7Fl/tB+H30GWWiHIh24tJtNXCn92xwfEun64rmAU9OYtWYg6/P9A78TrxGglo6/UKj
         wyYefINvolt61mxl6Dn2QdU7Cw2mxpBXLfBTeCEYqvm3qoI7OXSsqS0p9D312AhSWJ
         0YFrBfnrhtSMQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] v4l2-ctrls: one fix plus refactor work
Message-ID: <b1efb0db-9894-5f9b-e1b8-d733758822bb@xs4all.nl>
Date:   Tue, 25 May 2021 15:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMd1Le+R8RpJsO3LuiQaUWA6tW15rBPEVZqFBvPqF0ei/5K7i+/DP1LVAJefwgTiQ/3l5WdgQiQQpJprj1YzX9tUM86ufcwYh8i5cu/HHrAZjAYCaoB4
 yXF1ClfRAL6lbGm60YvqfU7CbIfirUI/wsYVJuOYaDZ9mEO0ioLjGEW46ApOtDQUGDcmzpm/M4i40AHIY0xbm3+974c26R8ukyA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR is against media_stage/master.

The first patch fixes the behavior of request completion if there are no
controls in the committed request at all. We may decide to backport this
patch to older kernel (I don't think it is needed, but that's not entirely
clear at the moment), which is the reason for applying this patch first
before the second patch, which splits up the much-too-large v4l2-ctrls.c
into four sources. This greatly improves maintainability.

This split does not introduce any new functionality, it is just reorganizing
code.

Regards,

	Hans

The following changes since commit 2fb27551ba4053ae503ce6c3b7b5d87cd206b1fd:

  media: imx: imx7_mipi_csis: Update MAINTAINERS (2021-05-23 19:21:33 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14d

for you to fetch changes up to a22c6896d7f811ff15e9be51bdfeb9e3f0224d31:

  v4l2-ctrls: split up into four source files (2021-05-25 10:21:15 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
      v4l2-ctrls: always copy the controls on completion
      v4l2-ctrls: split up into four source files

 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst |    4 +-
 drivers/media/v4l2-core/Makefile                                    |    5 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c                            | 1225 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c                           | 1939 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                           | 1575 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-priv.h                           |   96 +
 drivers/media/v4l2-core/v4l2-ctrls-request.c                        |  496 +++
 drivers/media/v4l2-core/v4l2-ctrls.c                                | 5083 -------------------------------
 8 files changed, 5336 insertions(+), 5087 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-api.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-defs.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-priv.h
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-request.c
 delete mode 100644 drivers/media/v4l2-core/v4l2-ctrls.c
