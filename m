Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30554186C02
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 14:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbgCPN1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 09:27:35 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45647 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731234AbgCPN1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 09:27:35 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DpmEjyX79EE3qDpmHjeXlJ; Mon, 16 Mar 2020 14:27:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584365253; bh=9ELFXIM7LEy9JN9rplsVjEND/RZuXyGXzzNdnzAIyiw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lSFSS74aEO2iVjCInOBg7eltVXqWGRJG+/Tte6NtsJxfN/2jWU8apo0RnYhrNdGsi
         F90Xd2lax4s9oVKJgBAdEMDjJWIOACy4u4RLp2nj3ytRV25Aa1ip2MTchUf6nmlSOZ
         QlHwAzujxCjemFB1c6fdxFtopIu7IOnf/siH2Ww6jjeNMTu/4+olKByoaAaNVxS5av
         gcQPlNuwvIH7+g3zTemOU/CsNcHvzmyIHp72XAAsQTimlfp+PqdD28P4saI7SWRPA6
         TfUaJqhj0sIGP7uvEuaipJeGefMdeItCBmOdrUO0dXyVUQrWWMWEd3f30QvGkXz/d2
         L5ffrIg9wf+pA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes
Message-ID: <1c3b8d02-2073-2bb2-c613-b72c90112e5a@xs4all.nl>
Date:   Mon, 16 Mar 2020 14:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLY1RdYfZ5YLO9wvxNXx/sFv2LYxpbqmE6Tp6dyeztXNzRl9vl5sqpGyVRX5BUu3hdlR9SkyZMO/thoHNInZRhrF3ZZVoRP0mPC3vkI60otQOUE/SBUG
 7JB0YXo6lPnaMO4rO5czGsJuBWC0gpd/kH7Uktb0js4+IzN8A3Z1NKs9QOaI4jvgynQx9s/rSN42xw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6fafbbe8d4140e44e0a64d6c914d628bdb2902ed:

  device property: Export fwnode_get_name() (2020-03-16 07:47:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7k

for you to fetch changes up to d1c099ed30d6dc1a6d028f6ee3e8b188cfa759dc:

  cec-notifier: make cec_notifier_get_conn() static (2020-03-16 13:51:52 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Daniel Glöckner (2):
      media: v4l: Add 14-bit raw greyscale pixel format
      media: v4l: Add 1X14 14-bit greyscale media bus code definition

Hans Verkuil (2):
      cec-notifier: rename conn_name to port_name
      cec-notifier: make cec_notifier_get_conn() static

Lad Prabhakar (1):
      media: am437x-vpfe: Make use of to_vpfe() to get a pointer to vpfe_device

Sakari Ailus (1):
      media: v4l: Add 14-bit raw bayer pixel formats

 Documentation/media/uapi/v4l/pixfmt-bayer.rst   |  1 +
 Documentation/media/uapi/v4l/pixfmt-srggb14.rst | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/pixfmt-y14.rst     | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/v4l/subdev-formats.rst | 37 ++++++++++++++++++++++++
 Documentation/media/uapi/v4l/yuv-formats.rst    |  1 +
 drivers/media/cec/cec-notifier.c                | 41 +++++++++++++++++----------
 drivers/media/platform/am437x/am437x-vpfe.c     | 10 +++----
 drivers/media/v4l2-core/v4l2-ioctl.c            |  5 ++++
 include/media/cec-notifier.h                    | 39 ++++++--------------------
 include/uapi/linux/media-bus-format.h           |  3 +-
 include/uapi/linux/videodev2.h                  |  5 ++++
 11 files changed, 245 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb14.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-y14.rst
