Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012EE1BBCF2
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgD1MAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:00:49 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54097 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726546AbgD1MAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:00:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TOupjJwAdZJ1DTOusjxJpW; Tue, 28 Apr 2020 14:00:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588075246; bh=YE4eKwA5HzhmNYGp7MQXX9eo88YvQn6DN2YgH0g047g=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cILPeNcffGExcCwHs8UefE/5FCaKnbgVxJ2bKaNjxYizT0+neyGomR+YjffVLrIsV
         KlmatuFstSvaxI5hI6VBPpz+dkfe6mXMTH85gHD1AJl3uVMBCKIH/iL8fHIrKnPwpX
         HkXHuD9tVAF7u0s4rXDCNrpcSkJjUegj/hH6cdSxQSAQjvtBQ+7ipFjQffWBRDmDIE
         QFkDjO7h08qVmYpMG5R10x4oTpM7X8AosTeJ+DiGZxJKLr0bjO3AD4V5LodL4Qjnc2
         ZMEKhTL5s4GXDFAk6qT7VQRFYLIjFXT0DCc8YYke+2HD8/7jRwQQXxURliAiWoIb3u
         72QB2eKMtPgKw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Add sensor location/rotation support
Message-ID: <5fb4b0d8-50a6-6d87-72e8-59ddb44812d1@xs4all.nl>
Date:   Tue, 28 Apr 2020 14:00:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLfX3u4ib9dFZyuu58NRw8+LCV9f/EU9Kkl4cv7KW0RaQ/5ofBlMT9ssYODwqtYAT91O3/oTD0e1jDrW/DeQfRp5yafo27ecqaEQY+8FkTmAPNP2sqAk
 8EJBNbNmEVo7VqMwKfrjUXD/8R+7oB+FqVBZzBRk9w/blU8ahu7qD7EWKdvMD1OCsB1Nwf9DxpKN97JARw4y/yEK9wzP2jYZ/QE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 4bdbff4da40584ec2225bb429b7c66ad54d19cda:

  media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies (2020-04-23 07:57:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8f

for you to fetch changes up to eff44a67b2cf4a511e40b72720acc657251251b3:

  media: i2c: ov13858: Parse and register properties (2020-04-28 11:25:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (11):
      dt-bindings: video-interfaces: Document 'location' property
      media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_LOCATION
      dt-bindings: video-interface: Replace 'rotation' description
      media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
      media: v4l2-ctrls: Add camera location and rotation
      media: v4l2-fwnode: Add helper to parse device properties
      include: v4l2-ctrl: Sort forward declarations
      media: v4l2-ctrls: Sort includes alphabetically
      media: v4l2-ctrls: Add helper to register properties
      media: i2c: ov5670: Parse and register properties
      media: i2c: ov13858: Parse and register properties

 Documentation/devicetree/bindings/media/video-interfaces.txt | 372 +++++++++++++++++++++++++++++++++++++++-
 Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst   | 153 +++++++++++++++++
 drivers/media/i2c/ov13858.c                                  |  11 ++
 drivers/media/i2c/ov5670.c                                   |  12 ++
 drivers/media/v4l2-core/v4l2-ctrls.c                         |  52 +++++-
 drivers/media/v4l2-core/v4l2-fwnode.c                        |  42 +++++
 include/media/v4l2-ctrls.h                                   |  34 +++-
 include/media/v4l2-fwnode.h                                  |  47 +++++
 include/uapi/linux/v4l2-controls.h                           |   7 +
 9 files changed, 718 insertions(+), 12 deletions(-)
