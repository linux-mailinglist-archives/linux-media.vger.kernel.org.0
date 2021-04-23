Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85139368F9D
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 11:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhDWJos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 05:44:48 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33003 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230036AbhDWJos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 05:44:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZsM3l0CgGvTEDZsM6lcsP3; Fri, 23 Apr 2021 11:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619171050; bh=rSH913GO8Adhd2ZeIFQcF9vd6gu/2nHWEfCEaRl1x4w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pzJCoM4pXwQV+VWiyEPI3NLsKf5LqH+3LsYN5HUmao45BhnfPPlmC68S+ww/BqNlA
         lZy7GyQ/jPQS2ATCZu+l1GlmQZAsOAxAAxlRh03Cbz/t6WqlpOjylVbS5MyeaPwwyl
         QUqtQn8QbqZTvu7RWeifTJCwzh+/klF4CLetcFOKpLg83gRUy9d9qHnKZC1VRh2m4X
         EVqsJp1kye6JWZJt73ObRp26xADaRkuTofwu4VKJmkLT75hIiPu6/US9wMIL4gUE7T
         WFGlmGnInVmKtEapUO79zIcpcoC5pBXbSz/IxG1IcZxDQLR6CxwuOP6MurEdqRQgGq
         XtUC5/YnsCSuA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] More Outreachy patches
Message-ID: <89431df2-8159-f45e-1aa5-4e9f0836c53d@xs4all.nl>
Date:   Fri, 23 Apr 2021 11:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI6opvKb5VA1ComegmVPPoITnGnN8Rb6R8TImkDxGsQvbcY4OxZr3fEKAYrUVLexR91BvtIK9Vi+8Ec2iFbSWNVMGW/3o/36RZ8Hc5SCjWYlFW+a4KSl
 ag9PmPielIvvphrd3JiJow18YlmKRSzAl4u5+QxqCapUpL39hydojsv+i8VNA9nu1JpiG8Z4qg6hreDaiU/JLmIP3P1QI1nXXfM+vkhajeT1u+Uvbp0nplBb
 xy6kzPsTSFjIr1sZvvPNcjeARbMtcobCN/nEikBIOww=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13-out3

for you to fetch changes up to 3d5a3ac0e5d35c0582fc87558027b25c95a143f8:

  staging: media: atomisp: Fix alignment and line length issues (2021-04-23 11:30:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aline Santana Cordeiro (5):
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_cmd.c
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_compat_css20.c
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_subdev.c
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_v4l2.c
      staging: media: tegra-video: Align line break to match with the open parenthesis in file vi.c

Martiros Shakhzadyan (7):
      staging: media: atomisp: Fix sh_css.c brace coding style issues
      staging: media: atomisp: Remove redundant assertions in sh_css.c
      staging: media: atomisp: Fix the rest of sh_css.c brace issues
      staging: media: atomisp: Remove all redundant assertions in sh_css.c
      staging: media: atomisp: Remove a superfluous else clause in sh_css.c
      staging: media: atomisp: Replace if else clause with a ternary
      staging: media: atomisp: Fix alignment and line length issues

 drivers/staging/media/atomisp/pci/atomisp_cmd.c          |   19 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c |    4 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c       |    4 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c         |    4 +-
 drivers/staging/media/atomisp/pci/sh_css.c               | 1961 +++++++++++++++++++-----------------------
 drivers/staging/media/tegra-video/vi.c                   |    4 +-
 6 files changed, 918 insertions(+), 1078 deletions(-)
