Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAC0182F21
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 12:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLL3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 07:29:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52589 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726254AbgCLL3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 07:29:12 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CM1TjwkPMhVf8CM1WjMLMU; Thu, 12 Mar 2020 12:29:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584012550; bh=RFWfjzJXgPyDPWc9jPAeNEvHfpYZpikpNIp5brejchs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=u9YRYosW+X/QCuuiQ0QoGyTU0Y+7zWMSd+onX9vLngb5d9aR6Zir1qvoVWrYt3e6p
         IlvZ1dR/QF/y0P/lpnGBcnWyDyjprZm8b1NVOzxrkLTf8T6htt3XQ9HcnkKujcdzL1
         5WneziLjjflSwi+IcxdBgcbqmOHX7qq/UvQNLaKB77pyzfBpub1sBUHNWpEC/P/JTl
         d7UKidQuqvqke9XHYrBPYyoSX+MI8am78kBAeznRXOuhbG1+2lcKfZRzSH0rMQ3YGo
         rX6DnHFjw75NiulNK06d5afBIABu4U+SlsQoKFbGZlxqvHzKkuoOYqHUKEghhGHIHK
         lgPooj5fX/1DA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] TVP5150 Features and Fixes
Message-ID: <76233d4e-2085-1a1a-86ad-0799292b419f@xs4all.nl>
Date:   Thu, 12 Mar 2020 12:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBFXfwd4PA3rdJmjN26TmjeTa2Ozu0RtNvqonuCyt5uITed/wsI9dzd8TrL3WI0m3OzpcAvR7jRXfdtKJzpsfNJ8LbSNSeVGWPmBo6EESRipWE4A1YMU
 Y6OGLMUQQ+8XWUmlK3MbrJa+jHTDH/c0Ovz4srIwjXL2BEj4feOtzOBt25Ze4H/qwDZcWjnApmdfoMXGR8P+K21/hfQN86lPTPA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This finally landed!

Regards,

	Hans

The following changes since commit eceeea5481d4eeb6073e8ccb2f229bb0dd14a44d:

  media: lmedm04: remove redundant assignment to variable gate (2020-03-12 09:47:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7g

for you to fetch changes up to 16ea6c19e137314b760241625437bafb97fb31e4:

  media: tvp5150: make debug output more readable (2020-03-12 11:55:00 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Javier Martinez Canillas (1):
      partial revert of "[media] tvp5150: add HW input connectors support"

Marco Felsch (19):
      dt-bindings: connector: analog: add sdtv standards property
      dt-bindings: display: add sdtv-standards defines
      media: v4l: link dt-bindings and uapi
      media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
      media: v4l2-fwnode: simplify v4l2_fwnode_parse_link
      media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
      media: v4l2-fwnode: add v4l2_fwnode_connector
      media: v4l2-fwnode: add initial connector parsing support
      media: tvp5150: add input source selection of_graph support
      media: dt-bindings: tvp5150: Add input port connectors DT bindings
      media: tvp5150: fix set_selection rectangle handling
      media: tvp5150: add FORMAT_TRY support for get/set selection handlers
      media: tvp5150: move irq en-/disable into runtime-pm ops
      media: tvp5150: add v4l2-event support
      media: tvp5150: add subdev open/close callbacks
      media: dt-bindings: tvp5150: cleanup bindings stlye
      media: dt-bindings: tvp5150: add optional sdtv standards documentation
      media: tvp5150: add support to limit sdtv standards
      media: tvp5150: make debug output more readable

Michael Tretter (1):
      media: tvp5150: initialize subdev before parsing device tree

 Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt |   6 +
 Documentation/devicetree/bindings/media/i2c/tvp5150.txt                     | 146 ++++++++--
 drivers/media/i2c/tvp5150.c                                                 | 802 +++++++++++++++++++++++++++++++++++++++++------------
 drivers/media/v4l2-core/v4l2-fwnode.c                                       | 192 +++++++++++--
 include/dt-bindings/display/sdtv-standards.h                                |  76 +++++
 include/dt-bindings/media/tvp5150.h                                         |   2 -
 include/media/v4l2-fwnode.h                                                 | 143 ++++++++++
 include/uapi/linux/videodev2.h                                              |   4 +
 8 files changed, 1156 insertions(+), 215 deletions(-)
 create mode 100644 include/dt-bindings/display/sdtv-standards.h
